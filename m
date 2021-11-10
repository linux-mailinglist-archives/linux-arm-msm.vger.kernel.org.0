Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34F144C0DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 13:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhKJMKo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 07:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231761AbhKJMKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 07:10:40 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6454C06120C
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 04:07:51 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id p8so2049701pgh.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 04:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=id7DvGBlJbwLopapF2TpliiENdQPCEGHhQVDE16kcTQ=;
        b=s8IqHv7VqpDUAGMDN0wFjtkc3cV8oMNAb1/sE5N+igOB9reyOvmD8aHW8laRT/sdzk
         uYuxdtCSy3yvBcHZHKegOy8W0xZSJZy1OkruTKDuX+M2RbyDUtigzgR/pzTZxVBZPQEx
         xbOHeMmClALk3s9+R8z1Mtn5Hluj5vc/ovsfhaEbOv0PoiS5Qb3lVdrtGuZvngBTSNQB
         vcYFp3VWVPpAERM54S240r1iWGFtH+G71KitExOKQRNNQJC3rzpkBvce86fJyWp5ktO5
         3ZSzCcIQXGvZX/hLN1rzv4lgfymQmWnfRZz9Dl2J62J+oqogFAYLaoa0Ot5BriLRyRtn
         Z1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=id7DvGBlJbwLopapF2TpliiENdQPCEGHhQVDE16kcTQ=;
        b=IVCZBuiFDOAllBcBW+auUNUSc0W5mqoQ2yw+U46jDT3LRvDcLARhidwNN/VvdZtigo
         wuedX897QrAl38f0ROoaYP2r/mxidtVm5qREieKIlDl9hlLfzLc0PnaJEzWyzZ1dbtw0
         xyf2d/s/GMBBk7Gp58lBEZJexRAZLaTuC3CFo7kV4XtLtuH4CH/qXVSUBfsL0G1ii3bA
         bxED5gaRO6wthZV7s+bTF0tDnqxnaQlWY7iifetVOhNWhoA6+KXwNI6Qqre9yI2xiy95
         qD/sriPmU5XCr1x8Atlb37yFzRVZR9k+QLbXpRJpFLK/RaO2HCDbrj5KZWIVVqA4MuHj
         9Gtg==
X-Gm-Message-State: AOAM531veg26riy7QaAqOauEgUt2kA0vrLCWGSOfyl19lzf4izrRGVc+
        I+B3GcRoioHp4dTzkDYTDXCppA==
X-Google-Smtp-Source: ABdhPJw2BpX8ffFW6d6JztWZKwyp0a33m7bScpeKY9xC/veHKXBbR5uVJYQcqP1+h/1gKSplPY0RFg==
X-Received: by 2002:a63:1451:: with SMTP id 17mr11275138pgu.175.1636546071399;
        Wed, 10 Nov 2021 04:07:51 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g9sm8377914pfc.182.2021.11.10.04.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 04:07:50 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 4/6] interconnect: icc-rpm: Support child NoC device probe
Date:   Wed, 10 Nov 2021 20:07:14 +0800
Message-Id: <20211110120716.6401-5-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110120716.6401-1-shawn.guo@linaro.org>
References: <20211110120716.6401-1-shawn.guo@linaro.org>
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

