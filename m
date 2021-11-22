Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03867458AD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 09:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238916AbhKVIy4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 03:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238973AbhKVIyv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 03:54:51 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AADC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Nov 2021 00:51:44 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id m24so13464176pls.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Nov 2021 00:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=id7DvGBlJbwLopapF2TpliiENdQPCEGHhQVDE16kcTQ=;
        b=EAZI0wPdj3knFzcPW3LSYAQ0WHN5WhGMZbqkWoW8vezQFokI8pMj8xP3UyHq2NrGnq
         JjmH28ffIP6DsQheMFUnQX5YvY/LQQR4BO1u1kxrVVedsIv2l6Z4FigpzYYuqdPpIxWk
         K1/NywLd+YT+imiWI8toE5dnnKYGtQeuqhHRkea1kbUbGVbgELfrgZ2uu4GLTb+9Csv7
         GEMi27SKVqY4aBZCrY/dDHTMasCw6xI4KjLaleE+htramhUZdas/KmkAmnjWNgCzgWVt
         /KxXvOByLTlGgELfQwFPBQaiAKOp4aEGD2vRtiHKScG6TzgS1p4lG8B5DaRhEBbT4uRf
         kNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=id7DvGBlJbwLopapF2TpliiENdQPCEGHhQVDE16kcTQ=;
        b=drhppooE8iUAlvELr466UM70tWvmnjdi7vO1/zp675QiN1lJEJgiMxGQiFD+BnYXGA
         xK3/0lsVHa5yisZiSorYIceAYKZxl2UA+SyI+3iRekWQLLsQHVOLaFdq6+bua3gU50cR
         mfzSUb17EOVQwCsfvPT8Wo/MHkAP4zlVQEWYgEwbLcn4D42fcxV9LmqNJzj/gLt1AzSR
         WJYCGmJKIXcSTDD6RS0LX6yAvRIDXKngCpWyZFZhK6uZMrkMioIHuOKT1Br4v3in78Xr
         qHhDHfo5UeTpAXZuJYCffQpvrLcDN/+uUJuO9qxoVzi/xBT+LKR6ZMhpYLpQS3cBc52L
         VlFg==
X-Gm-Message-State: AOAM533Fa3wz/lNuregAotdXsdes+YKIEfyHpuZvtjLv3pk1XgDELZDA
        uJdeBs5Y4zaDwY5NdH1AweqSPg==
X-Google-Smtp-Source: ABdhPJx0YnBOO8/J3RZOYcMLP+bDF9zW49ZizO+TRxKDr0w0lumlQ0fvzqOej9aAiVe3mgkKwCHwqg==
X-Received: by 2002:a17:903:18d:b0:142:8ab:d11f with SMTP id z13-20020a170903018d00b0014208abd11fmr105269868plg.47.1637571104505;
        Mon, 22 Nov 2021 00:51:44 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id f8sm8445582pfv.135.2021.11.22.00.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 00:51:44 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 4/6] interconnect: icc-rpm: Support child NoC device probe
Date:   Mon, 22 Nov 2021 16:51:21 +0800
Message-Id: <20211122085123.21049-5-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122085123.21049-1-shawn.guo@linaro.org>
References: <20211122085123.21049-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As shown in downstream DT[1], the System NoC of QCM2290 is modelled
using 4 fab/noc devices: sys_noc + qup_virt + mmnrt_virt + mmrt_virt.
Among those 3 virtual devices, qup is owned by RPM and has no regmap
resource, while mmnrt and mmrt are owned by AP and share the same
regmap as sys_noc.  So it's logical to represent these virtual devices
as child nodes of sys_noc in DT, so that such configuration can be
supported with a couple of changes on qnoc_probe():

- If there are child nodes, populate them.
- If the device descriptor has .regmap_cfg but there is no IOMEM
  resource for the device, use parent's regmap.

[1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/tags/android-11.0.0_r0.56/qcom/scuba-bus.dtsi

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 22a98c0b29af..2dfa79ba27bd 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -347,8 +347,13 @@ int qnoc_probe(struct platform_device *pdev)
 		void __iomem *mmio;
 
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (!res)
+		if (!res) {
+			/* Try parent's regmap */
+			qp->regmap = dev_get_regmap(dev->parent, NULL);
+			if (qp->regmap)
+				goto regmap_done;
 			return -ENODEV;
+		}
 
 		mmio = devm_ioremap_resource(dev, res);
 
@@ -364,6 +369,7 @@ int qnoc_probe(struct platform_device *pdev)
 		}
 	}
 
+regmap_done:
 	ret = devm_clk_bulk_get(dev, qp->num_clks, qp->bus_clks);
 	if (ret)
 		return ret;
@@ -409,6 +415,10 @@ int qnoc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qp);
 
+	/* Populate child NoC devices if any */
+	if (of_get_child_count(dev->of_node) > 0)
+		return of_platform_populate(dev->of_node, NULL, NULL, dev);
+
 	return 0;
 err:
 	icc_nodes_remove(provider);
-- 
2.17.1

