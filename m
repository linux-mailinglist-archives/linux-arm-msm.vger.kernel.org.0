Return-Path: <linux-arm-msm+bounces-47253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 016ECA2D94D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 23:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFCF33A6C64
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 22:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB75F1F2B87;
	Sat,  8 Feb 2025 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QoHTID3G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084011F2B90
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 22:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739053880; cv=none; b=hL95BaZkfuSYQ42eaKoz/USCn91F8XLylIaQh1iNbEskbi/1MgEHvvQWLr9HX96BUgzgk+CYyXMv+/Cr2YO6uCJY9vL/8NY4e08PdOImojxP+OgYrHcDv14C77GGE6tnLkOD6mIWJL2FcqYkH8tSkoHyClas7tP0YFsT9Q277xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739053880; c=relaxed/simple;
	bh=i0Pgu1nNguhn+OcJqADhf+B5dfvmGm1cd/4eQ18Cay0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SD1oDEN6tkZtlounu4rnaKdwD5F88fWIevLpN1K6hqZX/JuN3tAnA8huvTXy6MxYeff+3KXrJ4Lox9rN5GJu9TZyAxktN58t/7IW4PhceSNtQHiNoqQybzIFqcTwuMOqnRM1laNac7ytn+BzG+1Mr26qS4T5uqyhQ7eOUNsOB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QoHTID3G; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dc33931d3so1249992f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 14:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739053877; x=1739658677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOymSIevROsxi1+z/Gkz6vM+ejicrRtg+7on9+xHQ7I=;
        b=QoHTID3GayBp+Ya71cE0sHsR9GV0t7mAWfVCWFnaiiApxQJ/qZYGtp3+MkAqrFxHYh
         hVIknIFulZpJkDkpfPctpKkpe8JzvemVvn/OFILciR1hgeU9lTWtyPmg2yfPFSNdNnkk
         X48gjziumFcqle2NEvnvP9T+uiCskyh094CQ784Wqk14r9z+JNnr8ZlUK5njAq33pztC
         gBrxp+vZtocRYk2YJhGUXTUhiPBace2xW2lXhZQgzzMdc12OiPGTuFvafbT42PElclsm
         BI7Pfw7PVptLca8uCAKBGsC7yIDb+sFVHPcpjbX0qaB2TOsMPq01tTlutrGm0h2z9ZyH
         XSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739053877; x=1739658677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOymSIevROsxi1+z/Gkz6vM+ejicrRtg+7on9+xHQ7I=;
        b=VeLQ40DlmTleUakXs0zVaDof41fDXTKYciTRlu2jKXA4TpsUcjT9t4LfUuAomNNqYm
         az2khOomAx1ovo1+XP5Z7iyuVD3SOmc0q4zEWxBM/xLLgq+CcVLQUYn0VhpXmxyma1Ik
         S6kzOSGshggUBkZRNTZ2aNyPQbFOHWO2NsGtt4aCO0fR0wzFs4B4qwuK+XcwvmmpzRl1
         ChwDN6qdDIM2+hCxTprgatpHltmUDYKzFDJz+qxRp1dcCw5TulQVabp5Ql/rAIDhKCqe
         c/5FlgiixTWdyLIiH5WXVWc6fMBxs412dVfpWsE+0snFvVOpe5CqqzjX4gY/s9UCwODu
         2DtA==
X-Forwarded-Encrypted: i=1; AJvYcCXLjFtPo7EmsLq8u00GYEs46nhA7zn6GCtkZrXxkQmMGgg4q5ztAwA8iGCNFqjlCcACc1+IiPTf55F15e4H@vger.kernel.org
X-Gm-Message-State: AOJu0YyEaq7wI3044u1xQHaCBMl57UHw9Zyo8HUQzXoOx0J8xrXMzBPa
	tqMgrYeCKBaT/Z3PWIGDLMdOM0LH4pXo2LJ3Hbt47iGQPK0UA6Hd1IVjZonZKd8=
X-Gm-Gg: ASbGncvlosrh4Y1Lw1ZOLLgtCIAe8DJFUaGDFVTnY1zRe4wTLzfiv/uRrFYtrjYNEIP
	HskeNhY6XlmWt++GFa7c9jFqoO8DLr2gIt0e5gwZkjbKKfkGx6NBo68snf6SI8Gaoi8ltwcq2uA
	WUySaQqQ0xHId89tur3yEraDSMBOQ3dx7NV5l9ZrErIBt6cHTAFGnx6isvd7LtxT60r06NUAM+n
	1nx/ySGoxR7N7emqa6d+38O7k9TuKxQvAdk/WtW07OAGdNSetEMPj0S7YCw74Q+swIlAL0wTTp+
	Hmv/bRLCTV279bwfUTfqB8gcIv3D/KnHrq/gH2mbJCzAN8+pZ9I=
X-Google-Smtp-Source: AGHT+IEPI1lpVJMdKndYbstkJD7fFNRz3JYxn9yHDdjXaQCn//Np8gVHfr98hT7x7dMyS1p3lhHrcw==
X-Received: by 2002:a05:6000:2aa:b0:38d:daf3:be60 with SMTP id ffacd0b85a97d-38ddaf3c056mr47881f8f.48.1739053877148;
        Sat, 08 Feb 2025 14:31:17 -0800 (PST)
Received: from toyger.caleb.rex.connolly.tech ([2a0a:ef40:1d11:ab01:ce4f:b99d:6477:b544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffd8sm95906905e9.10.2025.02.08.14.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 14:31:16 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Amit Vadhavana <av2082000@gmail.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Kees Cook <kees@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] Revert "dmaengine: qcom: bam_dma: Avoid writing unavailable register"
Date: Sat,  8 Feb 2025 22:30:54 +0000
Message-ID: <20250208223112.142567-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit causes a hard crash on sdm845 and likely other platforms.
Revert it until a proper fix is found.

This reverts commit 57a7138d0627309d469719f1845d2778c251f358.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index c14557efd577..bbc3276992bb 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -58,11 +58,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
 
-#define BAM_NDP_REVISION_START	0x20
-#define BAM_NDP_REVISION_END	0x27
-
 struct bam_async_desc {
 	struct virt_dma_desc vd;
 
 	u32 num_desc;
@@ -400,9 +397,8 @@ struct bam_device {
 	int irq;
 
 	/* dma start transaction tasklet */
 	struct tasklet_struct task;
-	u32 bam_revision;
 };
 
 /**
  * bam_addr - returns BAM register address
@@ -444,12 +440,10 @@ static void bam_reset(struct bam_device *bdev)
 	val |= BAM_EN;
 	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
 
 	/* set descriptor threshold, start with 4 bytes */
-	if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
-		     BAM_NDP_REVISION_END))
-		writel_relaxed(DEFAULT_CNT_THRSHLD,
-			       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
+	writel_relaxed(DEFAULT_CNT_THRSHLD,
+			bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
 
 	/* Enable default set of h/w workarounds, ie all except BAM_FULL_PIPE */
 	writel_relaxed(BAM_CNFG_BITS_DEFAULT, bam_addr(bdev, 0, BAM_CNFG_BITS));
 
@@ -1005,12 +999,11 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 		if (dir == DMA_DEV_TO_MEM)
 			maxburst = bchan->slave.src_maxburst;
 		else
 			maxburst = bchan->slave.dst_maxburst;
-		if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
-			     BAM_NDP_REVISION_END))
-			writel_relaxed(maxburst,
-				       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
+
+		writel_relaxed(maxburst,
+			       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
 	}
 
 	bchan->reconfigure = 0;
 }
@@ -1198,13 +1191,12 @@ static int bam_init(struct bam_device *bdev)
 {
 	u32 val;
 
 	/* read revision and configuration information */
-	val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
-	if (!bdev->num_ees)
+	if (!bdev->num_ees) {
+		val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
 		bdev->num_ees = (val >> NUM_EES_SHIFT) & NUM_EES_MASK;
-
-	bdev->bam_revision = val & REVISION_MASK;
+	}
 
 	/* check that configured EE is within range */
 	if (bdev->ee >= bdev->num_ees)
 		return -EINVAL;
-- 
2.48.1


