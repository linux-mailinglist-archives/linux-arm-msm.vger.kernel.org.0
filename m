Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B8D333D67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbhCJNKh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:10:37 -0500
Received: from mail-lf1-f51.google.com ([209.85.167.51]:41158 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbhCJNKT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:10:19 -0500
Received: by mail-lf1-f51.google.com with SMTP id q25so33321420lfc.8;
        Wed, 10 Mar 2021 05:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gfYybxcRph0XPZrwQqwjANBJ8eBSiLuK7VUr2fLxF5k=;
        b=hkOGu6/8H4GYRARVQTQLi4k7RgdLK0u7J5RsLCCR7xuhEJD2I9W1zRuh09ds2qq0YX
         uq7Nf52aGrdCst9qsE4w/yz/SaOuW0WlxALarogvuTiBf8kmcCC5DhxiXjfo9eIRnWMl
         dMfAiZALWj7ifpASC5KO7UUU4ONTWh0MH25Fzcvrg/NtiYEwPNIl5aPzw/DH+DkacgF6
         rC6lgSa/NI+1kv0xp2jBLUQDOKh4Xn2719fdKJWocvr5NlpTLHGHnYmUD+BFAOA2fAIZ
         2xNE9feFFTkW5EaFEXYurJBIawGzQemOg5OQOFWNFXc4jTnsZhU3dTK20UZFhni/vmYs
         pEBQ==
X-Gm-Message-State: AOAM531hwLANdee8nXXxoAjbYT6sPP7s491RRf7GGmgyXO61FkrclKYx
        5EAZVcuxIxmDlZS2XS37oDM=
X-Google-Smtp-Source: ABdhPJxMZoXMaKLjD//h+YnLj1oNfYmntG66289PKj6bRvpzW7J+fOhrGfO0NUk8ps/dkwrnKMY8MA==
X-Received: by 2002:a05:6512:3047:: with SMTP id b7mr2091434lfb.279.1615381818210;
        Wed, 10 Mar 2021 05:10:18 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id i18sm2852569lfe.177.2021.03.10.05.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:10:17 -0800 (PST)
Date:   Wed, 10 Mar 2021 15:10:11 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 7/7] regulator: bd9576: Fix the driver name in id table
Message-ID: <e2f9d9e8fda9e3ae72af927097cfd3c987dce7e9.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Driver name was changed in MFD cell:
https://lore.kernel.org/lkml/560b9748094392493ebf7af11b6cc558776c4fd5.1613031055.git.matti.vaittinen@fi.rohmeurope.com/
Fix the ID table to match this.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/bd9576-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
index d628bd3bbd74..efe0e204f38d 100644
--- a/drivers/regulator/bd9576-regulator.c
+++ b/drivers/regulator/bd9576-regulator.c
@@ -1098,8 +1098,8 @@ static int bd957x_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd957x_pmic_id[] = {
-	{ "bd9573-pmic", ROHM_CHIP_TYPE_BD9573 },
-	{ "bd9576-pmic", ROHM_CHIP_TYPE_BD9576 },
+	{ "bd9573-regulator", ROHM_CHIP_TYPE_BD9573 },
+	{ "bd9576-regulator", ROHM_CHIP_TYPE_BD9576 },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd957x_pmic_id);
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
