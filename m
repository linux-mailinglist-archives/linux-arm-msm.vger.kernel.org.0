Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B72630B8C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 08:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhBBHiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 02:38:52 -0500
Received: from mail-lj1-f174.google.com ([209.85.208.174]:39241 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbhBBHir (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 02:38:47 -0500
Received: by mail-lj1-f174.google.com with SMTP id u4so21291843ljh.6;
        Mon, 01 Feb 2021 23:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RCsq0lQnyJowuaLECngen64lS6PLCnkwIXsedpi2nHs=;
        b=XHfeht+h8FlBQPYqUlIn2vfVddgSGqQe2BKRNlTRxS29XZD0xN4kC4P7VxDFCjZjAr
         q/SFnxQH3TJIZgl1OegamEmbcVAn9+exiYhb6gkL13vnUT3WF2dQ06zR5OP9KwudaOYU
         SEAHSBfCu2WlAdQ+h1FdJdeypGRYoROtFiYrZZpbJ/k9GsXclRmiy2PNTG2NK7gbNLfN
         EwsdcyW9SkgoUs5Tk8QS95P9yRWhEf4+T1q1zvYK6cRmXPxnKissDzuRI9fE7/6aGJux
         PH8hwsZkMSCOOY8WwJ5SjyypV8g9+FGqaU8kWwjXordQtsrLYAU/jB3Qkp3BhFgJgZVh
         oG+w==
X-Gm-Message-State: AOAM530k0GwVLZ35orXc8KWLIFty3kMTVbCssKH3crp72j9Bu6OoX6rs
        6jqJhxBoBTQo/JxqhdAz60Q=
X-Google-Smtp-Source: ABdhPJxtBkSx+nBB44/bwUk/mCPW67PLF2vhzRPzdifuoJj0sy1m5Sn4toDtTqwOYD8iB1+grRHtLw==
X-Received: by 2002:a2e:7614:: with SMTP id r20mr12913905ljc.93.1612251485093;
        Mon, 01 Feb 2021 23:38:05 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id z14sm45830lfh.296.2021.02.01.23.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 23:38:04 -0800 (PST)
Date:   Tue, 2 Feb 2021 09:37:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] regulator: qcom-labibb: Use disable_irq_nosync from isr
Message-ID: <f2c4c88d90bf7473e1b84b8a99b7b33d7a081764.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
References: <0400d7471571144bfeba27e3a80a24eb17d81f4d.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0400d7471571144bfeba27e3a80a24eb17d81f4d.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Calling the disable_irq() from irq handler might be a bad idea as
disable_irq() should wait for handlers to run. I don't see why
this wouldn't deadlock in wait_event waiting for the threaded
handler to complete.

Use disable_irq_nosync() instead.

Fixes: 390af53e04114 ("regulator: qcom-labibb: Implement short-circuit and over-current IRQs")

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
This fix is done purely based on code reading. No testing is done.

I don't have the HW (and even if I did I might have hard time producing
these errors) I have not tested this and I am unsure if my code-reading
is correct => I would _really_ appreciate second opinion and/or testing

 drivers/regulator/qcom-labibb-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 5ac4566f9b7f..40e92670e307 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -283,7 +283,7 @@ static irqreturn_t qcom_labibb_ocp_isr(int irq, void *chip)
 	 * Disable the interrupt temporarily, or it will fire continuously;
 	 * we will re-enable it in the recovery worker function.
 	 */
-	disable_irq(irq);
+	disable_irq_nosync(irq);
 
 	/* Warn the user for overcurrent */
 	dev_warn(vreg->dev, "Over-Current interrupt fired!\n");
@@ -536,7 +536,7 @@ static irqreturn_t qcom_labibb_sc_isr(int irq, void *chip)
 	 * Disable the interrupt temporarily, or it will fire continuously;
 	 * we will re-enable it in the recovery worker function.
 	 */
-	disable_irq(irq);
+	disable_irq_nosync(irq);
 
 	/* Signal out of regulation event to drivers */
 	regulator_notifier_call_chain(vreg->rdev,
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
