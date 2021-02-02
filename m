Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61FF330B8BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 08:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbhBBHh1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 02:37:27 -0500
Received: from mail-lf1-f49.google.com ([209.85.167.49]:39547 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbhBBHhY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 02:37:24 -0500
Received: by mail-lf1-f49.google.com with SMTP id h7so26548757lfc.6;
        Mon, 01 Feb 2021 23:37:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=a9oX6SQpcG6aFxEmEN6XUmbcvrUqBQW0B4ivGRUk14Y=;
        b=spo7QMjo1skBbbmVtRzS6gtjW9Jkk9ppf/p/B7tb2/R0+Wyg+xdSl+btPqCbeDpB7J
         4mMCNa7gv9IqSBECAdFMJ6t8OeXXVFyoS9VQoLSnqj3PxrxhUQs4qAevg2B8tp5rJ2I2
         M/5zWmoRQ3ZC9sTUNC2OBPK6moMU+DcJ/YD0dZSN3jLZwrkI/TI2npnq/rrz3NZJhxCx
         GYsvffGGF4800Fm1Vk2L2FxlzmJafyyHGExI0U360DaeDy5TsQue7QKq5j88Jsi+3Ukb
         zRlbD6dSo92rs9xbnyvGEhrOb5B/UHPzgTFULxf2wg/NeFFjwt4u+mNlqbWlrbK1stvn
         cLSQ==
X-Gm-Message-State: AOAM531uUane5yE6XFPHwqJOukVbsDEsHSgJWvPi7TgFFvvDkCY2QTVv
        dySv52ZPLwE78EYFcOxDzhQ=
X-Google-Smtp-Source: ABdhPJzB7+ux71l4/Jmbl28nLibAzVE8RnJXOBl4tc1wi2EMbXgZRM7sAJaLrOxK2MjJzmlLIXNwHQ==
X-Received: by 2002:a19:305:: with SMTP id 5mr10122694lfd.348.1612251401712;
        Mon, 01 Feb 2021 23:36:41 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id s19sm2461535ljg.43.2021.02.01.23.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 23:36:40 -0800 (PST)
Date:   Tue, 2 Feb 2021 09:36:34 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] regulator: qcom-labibb: avoid unbalanced IRQ enable
Message-ID: <0400d7471571144bfeba27e3a80a24eb17d81f4d.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If a spurious OCP IRQ occurs the isr schedules delayed work
but does not disable the IRQ. The delayed work assumes IRQ was
disabled in handler and attempts enabling it again causing
unbalanced enable.

Fixes: 390af53e04114 ("regulator: qcom-labibb: Implement short-circuit and over-current IRQs")

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
This fix is done purely based on code reading. No testing is done.

I don't have the HW (and even if I did I might have hard time producing
these errors) I have not tested this and I am unsure if my code-reading
is correct => I would _really_ appreciate second opinion and/or testing

 drivers/regulator/qcom-labibb-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index dbb4511c3c6d..5ac4566f9b7f 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -275,7 +275,7 @@ static irqreturn_t qcom_labibb_ocp_isr(int irq, void *chip)
 	ret = qcom_labibb_check_ocp_status(vreg);
 	if (ret == 0) {
 		vreg->ocp_irq_count = 0;
-		goto end;
+		return IRQ_NONE;
 	}
 	vreg->ocp_irq_count++;
 

base-commit: 4288b4ccda966c2a49ec7c67100208378bdb34d2
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
