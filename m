Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38F3CC435D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 00:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbfJAWCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 18:02:12 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46992 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfJAWCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 18:02:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id o18so17240116wrv.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 15:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hteX5Po5jH9mp6pG+BqMJxAmFHZvrUZhbwHbRe2F5fc=;
        b=SaKNLF6hmU7isKtHSAvW2k1hH/JhnGAhRZ7eMLJ66AQnleQcgoCf+e5FeoqeeKFtgf
         GXhqIVMCDJyzp+NYe2NQEJRm0CR41svyJfFQJ1lLdM03q4TWTIzMpPBbP0KHm8DxpLir
         DcnYp5R766EW42RRnTUSDnX+0HTg8c47CVYxIxQ4aKn1EYr09ptMjwYPnQh12U0770gX
         Lw+s64vHKggF4mmJk4Ip0XPcEowFy6lvtn8JCMOBg1sPII4kIYCaOqu7iOtn0Z/8w3rx
         Vl8z1j6oVnoxMetPHBh1J74klpDEpR6y/mGXhFfl6nX/WTCYvvxA0CLge4liKX8Lv8/z
         EDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hteX5Po5jH9mp6pG+BqMJxAmFHZvrUZhbwHbRe2F5fc=;
        b=uLcrDbeLcMFgl0I27JdX5xdba71RzE1JWIm7b3AnT1uEPZ8kPOKy7jtd2x1I4SyHmz
         pNaAaLi6ACmssgZ4bNYVtgYV/70Binrilx79G0ZZCxEuPQjZovuq3c7f5L4ZBoB5qfdH
         3/5GgUUwcmInymU5Oha3rhUxuBzkrvnLVIVsOsg0Pf7p5Nh4IrrWLdJRYjuroSLr97NN
         hUq6VWqG3qP6wGVtshN70OCJIUOGOYBMcmruURzv68aiiUqeIDig1hHvY5stv3zD+VtB
         Evr3Tlr+7K62CWh+o6Rfx7UsdUYJ9Jxn0v0SSQHxHH6rivWVM/4gVJ28N8KrwzA2rtBg
         cBOA==
X-Gm-Message-State: APjAAAVZO5fk2jOpFx/CBmjZ+pQjrPblUeMnRhHcsPr0/huIPOtKjAbU
        CkU2tOL28Oh1jfLELzZGHHcuZ/ef+b31dQ==
X-Google-Smtp-Source: APXvYqzHW80JeoqBqf3ODbZgwnZ22i7c0iPjee8HOvTf3Qev1Ltnbao5xz6b8sb5eYJMhtBvxA80ug==
X-Received: by 2002:adf:cf0e:: with SMTP id o14mr19324573wrj.277.1569967330396;
        Tue, 01 Oct 2019 15:02:10 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id v16sm21811219wrt.12.2019.10.01.15.02.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 15:02:09 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v4 2/7] iommu/qcom: Use the asid read from device-tree if specified
Date:   Wed,  2 Oct 2019 00:02:00 +0200
Message-Id: <20191001220205.6423-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001220205.6423-1-kholk11@gmail.com>
References: <20191001220205.6423-1-kholk11@gmail.com>
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

