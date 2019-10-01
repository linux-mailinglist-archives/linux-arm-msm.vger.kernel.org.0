Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5974EC4362
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 00:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbfJAWCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 18:02:17 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45554 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbfJAWCR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 18:02:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id r5so17234348wrm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 15:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AzvndIhQVi7PkccKpszP9q3kYn4x6KQ1z0v2TlWXPc4=;
        b=f/eqr9kUfobgynPuFcnZFDfupGwof9FUSt0EYyFATJwXsYsY34aN2V4keCyiNlkEzf
         X4iJSwO05XXfHIitXfItON2xoxkq1b0efpUBM5C+jqIJY0552LNHIDl0g3RoI9IgWUAh
         qE7M/mDlocTZYzczpgYCk63ntmpoex2kTWUEcGi5Vuamgq1RQsqD+mws/MhSv1DBy5Uq
         VQBC+G7fAblkGOMxP4Tg6UI+CIWpM6T9zxb7EeRmsOVW1gY/6og1GHvX2r4YdSYI04Ll
         R3uECFWJrxlk8ll0/9UtWYebnMnE+xYoWwaP5mfjPyHkeX5O50S9Eso7NiGrN1FkNofb
         +5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AzvndIhQVi7PkccKpszP9q3kYn4x6KQ1z0v2TlWXPc4=;
        b=egexJ4082CZjGYlTMHdxxMsq5fGk3gqGEIPRRlsYeucp9lYPacZVbgyAe1fFKoUE++
         C8qJU8c8Z+r7yr2oPCZaotAqaZKQLWumlIuMawFtDZO9Sy8pM+bwJBfjT74fmopGx82X
         j36oiRjtQmfCG5EBCePHNxthPsgT8uaXOY2mK9z01NWF0h43NqLNDxl3K/TOq+ch4SKl
         3f0mLsuc2DtZ8UEuG2ABieHpK03hjQd4WpSJUbY+9x/52AWYWR/KvXFX2qpj0uGCTzGa
         g0bICsDYLtQ78jJTQKlawPDi4Jgjl7X/BhUt/0crK8Yc4IJYE7GWnBtPhw2n4SGP/+oo
         b6eQ==
X-Gm-Message-State: APjAAAXiGuAdzmUOnmcsV7iNUdABmue00PHN4S1vbPqnonGQPnQc+YET
        0z1geSRhftQeuhFZ9/DHK7kreTZhslQjmw==
X-Google-Smtp-Source: APXvYqz08JuZQlxJAUCSeShyCEsJPnZa+czeoRD4QWFJ5okxbXcNk/QvFJtPEODNzHNjVn7yUpmsyw==
X-Received: by 2002:a5d:55d0:: with SMTP id i16mr2874313wrw.108.1569967334813;
        Tue, 01 Oct 2019 15:02:14 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id v16sm21811219wrt.12.2019.10.01.15.02.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 15:02:13 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v4 6/7] iommu/qcom: Index contexts by asid number to allow asid 0
Date:   Wed,  2 Oct 2019 00:02:04 +0200
Message-Id: <20191001220205.6423-7-kholk11@gmail.com>
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

