Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8938CBF279
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 14:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbfIZMF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 08:05:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42545 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfIZMFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 08:05:25 -0400
Received: by mail-wr1-f68.google.com with SMTP id n14so2150244wrw.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 05:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hM8YfKOj/veQZGpRjHkC1Z8EKmrCYB/PVErpOmpXBBM=;
        b=lBuLbIw4VBqFeCaW65bXt3a9GvcgmPYUq/9I5AxJDVG/eQ9VtHShtO2zXx/zH0y/Ih
         bs1Cytd9GRcn16B4ghrrY1A3nkd1rtSvpC3GQCeC2aYAXw7o1kxquZxjxeWVz3t2ONos
         ym8Sv+6Ha/gpQPexDPsG95SJrV/v3ElbtlxM1YORNHm2uYqEGFJxrFViSmzqLey7DFZy
         1JvOZ/RY9M4pLxRHMjQSg9PEkmTC8cf8CokM8TO4dK4KXGmE923rUZDAOyPDe/bwAzcO
         Ne3NI3xkR3xjhvSXAC9EunpKM8hkqsTLMxyFw2P+qVJs2aSLdVkvZQDQrnlyH3xI3fD9
         FR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hM8YfKOj/veQZGpRjHkC1Z8EKmrCYB/PVErpOmpXBBM=;
        b=jLoLHjgG+8s5F615EWnjWYI7xJ2GEAsPmsm4830eOs90/qvrYvaAI82hV2EYijNN1/
         IkZ0xFH2+FEReXg4OwP7EJstWYl1Cmt7P/Kqk3wiuqbSHNL7Qjuv5yznAtLl8KnNxeVP
         ZgYCJ2FzLyogT+SHfIOS+QDm1a+y6+h0fUjep8MB24XExII838PFDywDPOjSiVaZK1+Z
         B9E07Xy0K2cOsNg26RdrX9X9FuZAzlt4XkjCo9ue7GSULwIkrIj13PycSdXqhiwN1wap
         CYKUAu8K35ExQDWhnNH0266thMmCgSkdgEpu79wQ/KIelIe+kgsngaasr9PTokUGr7El
         1HIQ==
X-Gm-Message-State: APjAAAXYt2grMOrI2Q/8lBy86WTpoHAj5txpwZnCn2KcL1XINt3IUxAj
        B/h9XJQLtCNfb+yR0BGqt4K+iBf78oQ=
X-Google-Smtp-Source: APXvYqwoV1mUBUqMaCRaQReRjtFRL+Eof45k7bEWpHYlUxNeuRjc0LbO5xv8g1O5IYmkkn1VosjXJQ==
X-Received: by 2002:adf:e488:: with SMTP id i8mr2882218wrm.20.1569499523392;
        Thu, 26 Sep 2019 05:05:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d193sm5289584wmd.0.2019.09.26.05.05.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 05:05:22 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 5/6] iommu/qcom: Index contexts by asid number to allow asid 0
Date:   Thu, 26 Sep 2019 14:05:15 +0200
Message-Id: <20190926120516.4981-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926120516.4981-1-kholk11@gmail.com>
References: <20190926120516.4981-1-kholk11@gmail.com>
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
 drivers/iommu/qcom_iommu.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 233ef496af27..03c68fe9439b 100644
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
@@ -604,12 +604,10 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
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
@@ -789,7 +787,7 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "found asid %u\n", ctx->asid);
 
-	qcom_iommu->ctxs[ctx->asid - 1] = ctx;
+	qcom_iommu->ctxs[ctx->asid] = ctx;
 
 	return 0;
 }
@@ -801,7 +799,7 @@ static int qcom_iommu_ctx_remove(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, NULL);
 
-	qcom_iommu->ctxs[ctx->asid - 1] = NULL;
+	qcom_iommu->ctxs[ctx->asid] = NULL;
 
 	return 0;
 }
@@ -846,7 +844,8 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	for_each_child_of_node(dev->of_node, child)
 		max_asid = max(max_asid, get_asid(child));
 
-	sz = sizeof(*qcom_iommu) + (max_asid * sizeof(qcom_iommu->ctxs[0]));
+	sz = sizeof(*qcom_iommu);
+	sz += (max_asid + 1) * sizeof(qcom_iommu->ctxs[0]);
 
 	qcom_iommu = devm_kzalloc(dev, sz, GFP_KERNEL);
 	if (!qcom_iommu)
-- 
2.21.0

