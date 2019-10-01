Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A701EC3997
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 17:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbfJAP4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 11:56:52 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45680 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbfJAP4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 11:56:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id r5so16145383wrm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hteX5Po5jH9mp6pG+BqMJxAmFHZvrUZhbwHbRe2F5fc=;
        b=aKzXzm76HfjoXhv0IEyTeJT5jxxYKt/jbPKhPL0uETwbxPaz+J1kM9JhoifyzvY8WL
         QTWuiBd8l8mWnQP8GIQf56FGbZvPUAqyHIShSrxU2x2m9pZ6B5i/F6CKEKQvc8PXV2dp
         tfp4QUaNVbPXqRatm4T8PTERR6FXzgqpsjEMFElQ7qKKUuOb2Hvah6pcubK5bd8meCgz
         ME2JuTwuUTGwczbuTDY+SjBxumgxYR4EIRv2Dp/zUXcBCcIVcJTN1asUyI2cuxkIdCrc
         eTFfOI8tFhkYj/2lTlUeqbiT1H5nFyZrUmDplrtA4Jn2y0LKrX472/KGyQJGx4ezqFNh
         tzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hteX5Po5jH9mp6pG+BqMJxAmFHZvrUZhbwHbRe2F5fc=;
        b=Z62PJYimXXaHBYu1gMvkOs1wwWfUjaS4YTAoHqFKGW3VquV5v5qTcIs5x2T/rOxKwv
         b1X3Wf8zNqvxjYYoag71ogIMFKyEwUZKX3us/hkf0DsitMXKzp5FdRn85EyayMVuXLe7
         WIjq5icScB5GEBWHB5ZbMxEwbkbuVB3C+JJMbInqqclgXE2qnZBdDoox9St8xAb2Xxby
         TvcBwQ7X+F/0TG0NCRSpk4y/FyoTOx3KDmHtx43XCK5VvniAK45VvxFwgI0m0OXft/aZ
         h+sBJy3SSPeDlTgfGSMWG03BYGcK1d9EW9e9cRGEJ5aCXBLPTGC5TdGk//jmL+Wi3gUl
         OvVg==
X-Gm-Message-State: APjAAAVQ80HSJhqTw1bStJBVKtteWUwZ47hL5Pr4byM1p39TY9Kf6Gnc
        rG20qXPJjaFm8B6V93daihy2NNO+X+m+pw==
X-Google-Smtp-Source: APXvYqx5gg7wLTncQSXDPIHGvIRYQdrcUmR+eKSlpt2JGc3eEGQ2cWL9tMeEsLIxSZd5DP+t0waoLQ==
X-Received: by 2002:a5d:5352:: with SMTP id t18mr19212910wrv.72.1569945410017;
        Tue, 01 Oct 2019 08:56:50 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id h63sm6209136wmf.15.2019.10.01.08.56.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:56:48 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v3 2/7] iommu/qcom: Use the asid read from device-tree if specified
Date:   Tue,  1 Oct 2019 17:56:36 +0200
Message-Id: <20191001155641.37117-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001155641.37117-1-kholk11@gmail.com>
References: <20191001155641.37117-1-kholk11@gmail.com>
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
index c31e7bc4ccbe..504ca69adc5a 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -585,7 +585,8 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	 * index into qcom_iommu->ctxs:
 	 */
 	if (WARN_ON(asid < 1) ||
-	    WARN_ON(asid > qcom_iommu->num_ctxs))
+	    WARN_ON(asid > qcom_iommu->num_ctxs) ||
+	    WARN_ON(qcom_iommu->ctxs[asid - 1] == NULL))
 		return -EINVAL;
 
 	if (!fwspec->iommu_priv) {
@@ -693,7 +694,8 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
 
 static int get_asid(const struct device_node *np)
 {
-	u32 reg;
+	u32 reg, val;
+	int asid;
 
 	/* read the "reg" property directly to get the relative address
 	 * of the context bank, and calculate the asid from that:
@@ -701,7 +703,16 @@ static int get_asid(const struct device_node *np)
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

