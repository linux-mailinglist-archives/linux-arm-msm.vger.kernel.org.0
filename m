Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3299473F6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 10:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbhLNJad (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 04:30:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbhLNJac (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 04:30:32 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A494EC0617A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 01:30:30 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id o4so17314495pfp.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 01:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0LCleeVgPddpywZvy/2C5sZ89uWkTFhzpdgxSPbdXrM=;
        b=bl5JSWLsZJyCmMKDJ+TcmDiRa50ORayGlyfY/W2DQ+jtbVE8Jci8hhIQJp3yhOhBZ3
         pSMGX6FD25QzfXyKzD7mo3HJSm/HsALJGIerPGJTmQlKmzdwUY+a8dCbrQlpXnWQaKNv
         N/oax51MdgUzsNOovQw5IavIyybFclMc6+zTCM29o3k0qY+9IhxXMfOrANrlkxV2EIhU
         bIHZcf2iIflekoc9lsvxNwOMTI//4Rabp0dVhLSQS6rnxcEV9/bNoaggzFt6Aj/qKC/y
         Vr7WzIDvXU1CP8nWyzY3h/f5N86ou0Da99lIJhh0sAjI4jLdkYhTm4EXSi8uR1LzsFuy
         2TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0LCleeVgPddpywZvy/2C5sZ89uWkTFhzpdgxSPbdXrM=;
        b=ApFaCYJQEAfxLZBiOFcfauCtUF4Bbf6y3/1GZZkexGsViKpgD9/as0MH5xdeCiwMYI
         8lyClRyYEI2h3+qH44lnoNpVmv4LYKmZMNMLxbFsbac6t5SZWuOecGekXBtb41dkhsQK
         O/+AyGGXvXTbDqXDLXFgbkTDNQrw/Ett4WeoZ0eAccGyNs0a6XlsBTmyQF53ekPEaXl0
         j1qFuT9vnJ5v8+ueoDGDmWfXjvw7OP6S1Zd/XIyzznM3NbjqloGfSYxX3yxMtC78fqbx
         Vo7HOPQUr32/3PXZyBHBUeigsFeLep7Xs9zXYpLWpUz0tYFmbdlPsCJ6WNQrGvbCXBOv
         IYhg==
X-Gm-Message-State: AOAM533joaBn/rXDpscbNuZkolaaL40kIRtKPIyz5gv9cRIQmt4NIIRk
        P5fQ4Zzedi2Fb5huGs13q5BRjA==
X-Google-Smtp-Source: ABdhPJwrY09DEyT9oESBH/vqzAaqdo3Zc2PSMBovbFXHYO7yCruw2kaTsqNgQhewA8/N3cRiLos4XA==
X-Received: by 2002:a05:6a00:2444:b0:4ab:15b9:20e5 with SMTP id d4-20020a056a00244400b004ab15b920e5mr3178697pfj.0.1639474230148;
        Tue, 14 Dec 2021 01:30:30 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c21sm15143184pfl.138.2021.12.14.01.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 01:30:29 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 RESEND 3/5] interconnect: icc-rpm: Support child NoC device probe
Date:   Tue, 14 Dec 2021 17:30:09 +0800
Message-Id: <20211214093011.19775-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214093011.19775-1-shawn.guo@linaro.org>
References: <20211214093011.19775-1-shawn.guo@linaro.org>
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
index d8ea9bb479b1..34125e8f8b60 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -349,8 +349,13 @@ int qnoc_probe(struct platform_device *pdev)
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
 
@@ -366,6 +371,7 @@ int qnoc_probe(struct platform_device *pdev)
 		}
 	}
 
+regmap_done:
 	ret = devm_clk_bulk_get(dev, qp->num_clks, qp->bus_clks);
 	if (ret)
 		return ret;
@@ -417,6 +423,10 @@ int qnoc_probe(struct platform_device *pdev)
 
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

