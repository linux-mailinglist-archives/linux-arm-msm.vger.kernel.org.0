Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93898C01D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 11:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfI0JJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Sep 2019 05:09:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41803 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfI0JJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Sep 2019 05:09:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id h7so1820978wrw.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2019 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U4Qhxl6tUusm5VMROCgNErvb6ASg1CMb20QnnU7lpLo=;
        b=OlGApvIhx8pg+BB4lJeB/nyvHrDZMROB7FmdrmKlG9eDwa/wnlZxoTt/Ib05Ryw5uB
         su5jwOfU2l7CmLk5VtX9SmczQ4ilXrSluKUckOcM6rF+vfCrf/db/sqVOO40kkoNQTer
         CMpS4kOsGzUfF3x/HL13KKDJUOLocIC+rTa1PZvnWJ0+XKkP+kax15J5GHWSpKUwKmko
         wFwJlJZmk4KxIpxtZjxFPGAVRLZaF6S0SaL5qF1fqlLWokl20cqXAFxIQu/HZgCDly5o
         J6au7S+xMsIq3UYuui8/rp1YbCLz57jzsYTVUIPictpj8x1DeAGI2J6nkm/uVlH519h+
         ZFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U4Qhxl6tUusm5VMROCgNErvb6ASg1CMb20QnnU7lpLo=;
        b=uCQSlaDAhzp+3z98MCB4qmT08L6iIuFHojsLmRDI78aIVlq3mpsxE2i81d1bG8+Qox
         GO5iIhgbcstar4JK2RCOtX+rbFJyau1JCN0xaki15PQ+pdZrh5PrpIC6e1COeY9hG1rT
         Kzcir7v8DrfDQcfqULRrXh1+/TK8E1G1WVjzSdzOvwyLbgXK1M6DTF1QQg9yHVZ1sCxx
         znrgTMoHJTSabRx30NXGveCZMB6Q7hWQbWFKAt1NBKngnbAqFPIMEVAUX2wsMkBmwHS2
         wzmMNga7t9BypdIJpJZC9h56AMcSaIvLkvJWm6CeV6qwUM4bfvQ3wxzxd0/Kf2fsC6JU
         B9/Q==
X-Gm-Message-State: APjAAAWoco56q9ZNzfXng9Z77AuuzZdIxkiyGOWaWqWNVnxZv17oTiS6
        is2dYFpYO7Xx7EdRreZVqYSz5Hlas3s=
X-Google-Smtp-Source: APXvYqygkF8IXkzwVcVZLI/fdmqqOpfqtHD2O+5idO7MjQVLp62UD6tqFkKGgkp3Odfkhh8Lkoebfg==
X-Received: by 2002:a5d:4b46:: with SMTP id w6mr2234896wrs.223.1569575392935;
        Fri, 27 Sep 2019 02:09:52 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id b62sm6037791wmc.13.2019.09.27.02.09.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 02:09:52 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 1/6] iommu/qcom: Use the asid read from device-tree if specified
Date:   Fri, 27 Sep 2019 11:09:42 +0200
Message-Id: <20190927090947.11175-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927090947.11175-1-kholk11@gmail.com>
References: <20190927090947.11175-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

As specified in this driver, the context banks are 0x1000 apart.
Problem is that sometimes the context number (our asid) does not
match this logic and we end up using the wrong one: this starts
being a problem in the case that we need to send TZ commands
to do anything on a specific context.

For this reason, read the ASID from the DT if the property
"qcom,ctx-num" is present on the IOMMU context node.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/iommu/qcom,iommu.txt    |  1 +
 drivers/iommu/qcom_iommu.c                      | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
index 059139abce35..ba0b77889f02 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -46,6 +46,7 @@ to non-secure vs secure interrupt line.
                      for routing of context bank irq's to secure vs non-
                      secure lines.  (Ie. if the iommu contains secure
                      context banks)
+- qcom,ctx-num     : The number associated to the context bank
 
 
 ** Examples:
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index dadc707573a2..5837556af147 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -557,7 +557,8 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	 * index into qcom_iommu->ctxs:
 	 */
 	if (WARN_ON(asid < 1) ||
-	    WARN_ON(asid > qcom_iommu->num_ctxs))
+	    WARN_ON(asid > qcom_iommu->num_ctxs) ||
+	    WARN_ON(qcom_iommu->ctxs[asid - 1] == NULL))
 		return -EINVAL;
 
 	if (!fwspec->iommu_priv) {
@@ -665,7 +666,8 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
 
 static int get_asid(const struct device_node *np)
 {
-	u32 reg;
+	u32 reg, val;
+	int asid;
 
 	/* read the "reg" property directly to get the relative address
 	 * of the context bank, and calculate the asid from that:
@@ -673,7 +675,16 @@ static int get_asid(const struct device_node *np)
 	if (of_property_read_u32_index(np, "reg", 0, &reg))
 		return -ENODEV;
 
-	return reg / 0x1000;      /* context banks are 0x1000 apart */
+	/* Context banks are 0x1000 apart but, in some cases, the ASID
+	 * number doesn't match to this logic and needs to be passed
+	 * from the DT configuration explicitly.
+	 */
+	if (of_property_read_u32(np, "qcom,ctx-num", &val))
+		asid = reg / 0x1000;
+	else
+		asid = val;
+
+	return asid;
 }
 
 static int qcom_iommu_ctx_probe(struct platform_device *pdev)
-- 
2.21.0

