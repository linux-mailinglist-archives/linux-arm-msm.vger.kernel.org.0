Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 942A5C399B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 17:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389730AbfJAP45 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 11:56:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41964 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389739AbfJAP44 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 11:56:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id h7so16199008wrw.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AzvndIhQVi7PkccKpszP9q3kYn4x6KQ1z0v2TlWXPc4=;
        b=BMLOwJbWkVn0zbUlNrg3GdPdEor9qWoQ6lh4jslJvSqyg63M9hNBBRzpsnprlOU/Wi
         OHpgXn9kmFIgNXyBU4wfKxovsDa5VWwU/BItTTle3W8EPdGSkBLZ6fE5Ab0XVGq2z5zK
         8TcovKGHr1z+OXUDyTNts7LIr1thdT5onv9QJ0EFIsbyEsUfU0TzLrZCP+oY43Pz0Xxg
         y/SjAkQYnEw+DTdTS70GSjqExFUVxcwiXqE5BoQ68g4y2MQaFOvv82RQXN3upp0aHZdJ
         Nnp4gOHpNQkn23PYBJrqn3cknq14wp61RIi4ORoq2W9RBiMHkMZGgmrP2cM/lQxKOx7q
         dKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AzvndIhQVi7PkccKpszP9q3kYn4x6KQ1z0v2TlWXPc4=;
        b=MINt1Z2zYcztuJRDljdoxGZzmJek0n2gcqNzhO3qonZO12lKGceSAuPykMGeFuWp55
         ggV4wMucHRJNN/iVv2SgGagLFmTdIsCD0bTDy6SVasKM68WniFyQf0BRW3xh/Zg9Drfq
         iivWDUoo88zcRa31QyGek79Nu0OxdtQZXGMosFOEQjf6fqPSm2JTdLfimDkajAMh191U
         ZK3xE6KDTVw89/8GoqMVg/m/ivibOQmAtwtLqR1+0PUTyk0+3ES538aaCNJ4Z5BmhYnD
         MrABzViAfJebbaQpFims/V4wsenAYl5LyDo+RZus7WTktJFic4H0ar8xF/AnMzw3KmvJ
         g9ag==
X-Gm-Message-State: APjAAAUs7Jfp+rJwWJbcjHO4MJhLEeVMflzKUExMKU0E84dWgmZWsxlk
        JOeN5UHuTo3mu+FXpFEvUf5GJfvtbN0owg==
X-Google-Smtp-Source: APXvYqySbQPELpv1ZumQxF1Vk5aOIdlPrRFDCczcUDGUWaI3DVVZc+ik+LxF2F0v9dK/O8T+CAKY2w==
X-Received: by 2002:a5d:5231:: with SMTP id i17mr18612203wra.142.1569945414006;
        Tue, 01 Oct 2019 08:56:54 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id h63sm6209136wmf.15.2019.10.01.08.56.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:56:53 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v3 6/7] iommu/qcom: Index contexts by asid number to allow asid 0
Date:   Tue,  1 Oct 2019 17:56:40 +0200
Message-Id: <20191001155641.37117-7-kholk11@gmail.com>
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

This driver was indexing the contexts by asid-1, which is probably
done under the assumption that the first ASID is always 1.

Unfortunately this is not entirely true: at least in the MSM8956
and MSM8976 GPU IOMMU, the gpu_user context's ASID number is zero.
To allow using an asid number of zero, stop indexing the contexts
by asid-1 and rather index them by asid.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/qcom_iommu.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index dac77dbec0f0..555cbc55b073 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -49,7 +49,7 @@ struct qcom_iommu_dev {
 	u32			 sec_id;
 	u8			 num_ctxs;
 	bool			 use_aarch64_pt;
-	struct qcom_iommu_ctx	*ctxs[0];   /* indexed by asid-1 */
+	struct qcom_iommu_ctx	*ctxs[0];   /* indexed by asid */
 };
 
 struct qcom_iommu_ctx {
@@ -87,7 +87,7 @@ static struct qcom_iommu_ctx * to_ctx(struct iommu_fwspec *fwspec, unsigned asid
 	struct qcom_iommu_dev *qcom_iommu = to_iommu(fwspec);
 	if (!qcom_iommu)
 		return NULL;
-	return qcom_iommu->ctxs[asid - 1];
+	return qcom_iommu->ctxs[asid];
 }
 
 static inline void
@@ -632,12 +632,10 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	qcom_iommu = platform_get_drvdata(iommu_pdev);
 
 	/* make sure the asid specified in dt is valid, so we don't have
-	 * to sanity check this elsewhere, since 'asid - 1' is used to
-	 * index into qcom_iommu->ctxs:
+	 * to sanity check this elsewhere:
 	 */
-	if (WARN_ON(asid < 1) ||
-	    WARN_ON(asid > qcom_iommu->num_ctxs) ||
-	    WARN_ON(qcom_iommu->ctxs[asid - 1] == NULL))
+	if (WARN_ON(asid > qcom_iommu->num_ctxs) ||
+	    WARN_ON(qcom_iommu->ctxs[asid] == NULL))
 		return -EINVAL;
 
 	if (!fwspec->iommu_priv) {
@@ -815,7 +813,7 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "found asid %u\n", ctx->asid);
 
-	qcom_iommu->ctxs[ctx->asid - 1] = ctx;
+	qcom_iommu->ctxs[ctx->asid] = ctx;
 
 	return 0;
 }
@@ -827,7 +825,7 @@ static int qcom_iommu_ctx_remove(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, NULL);
 
-	qcom_iommu->ctxs[ctx->asid - 1] = NULL;
+	qcom_iommu->ctxs[ctx->asid] = NULL;
 
 	return 0;
 }
@@ -872,8 +870,8 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	for_each_child_of_node(dev->of_node, child)
 		max_asid = max(max_asid, get_asid(child));
 
-	qcom_iommu = devm_kzalloc(dev, struct_size(qcom_iommu, ctxs, max_asid),
-				  GFP_KERNEL);
+	qcom_iommu = devm_kzalloc(dev, struct_size(qcom_iommu, ctxs,
+				  max_asid + 1), GFP_KERNEL);
 	if (!qcom_iommu)
 		return -ENOMEM;
 	qcom_iommu->num_ctxs = max_asid;
-- 
2.21.0

