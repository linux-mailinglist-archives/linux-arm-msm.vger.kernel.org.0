Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867E6273AB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 08:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbgIVGTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 02:19:09 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:22703 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726982AbgIVGTE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 02:19:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600755544; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4GUNzUcTkCM9VsYnPHaHYvGYU2ijp90ZsCxBr7hq2To=; b=ploLOqSEoICMqKyV8kxZI15v6mplrg78KseSt08iGc+EWXJbmIzCIMrwHEyohGg2XdItuHiz
 kvbASi90p72C2Tziygaw7OKyk0qRIDBiSPIQUdswQFuOpzlL7Da78MIepr24u6DWC+cp5UyZ
 3X78yj+99pcwWKfVnI74djo1jQU=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f69974d4a8a578ddcf87eea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Sep 2020 06:18:53
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7483BC433BA; Tue, 22 Sep 2020 06:18:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 10A08C433A1;
        Tue, 22 Sep 2020 06:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10A08C433A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv5 3/6] drm/msm: rearrange the gpu_rmw() function
Date:   Tue, 22 Sep 2020 11:48:16 +0530
Message-Id: <fc69d5c3a68c11b9d4cb692de76bc8d875062cb8.1600754909.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1600754909.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1600754909.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sharat Masetty <smasetty@codeaurora.org>

The register read-modify-write construct is generic enough
that it can be used by other subsystems as needed, create
a more generic rmw() function and have the gpu_rmw() use
this new function.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
 drivers/gpu/drm/msm/msm_drv.h | 1 +
 drivers/gpu/drm/msm/msm_gpu.h | 5 +----
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 49685571dc0e..a1e22b974b77 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -180,6 +180,14 @@ u32 msm_readl(const void __iomem *addr)
 	return val;
 }
 
+void msm_rmw(void __iomem *addr, u32 mask, u32 or)
+{
+	u32 val = msm_readl(addr);
+
+	val &= ~mask;
+	msm_writel(val | or, addr);
+}
+
 struct msm_vblank_work {
 	struct work_struct work;
 	int crtc_id;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 319327462b29..079e33680a6c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -474,6 +474,7 @@ void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
 		const char *dbgname);
 void msm_writel(u32 data, void __iomem *addr);
 u32 msm_readl(const void __iomem *addr);
+void msm_rmw(void __iomem *addr, u32 mask, u32 or);
 
 struct msm_gpu_submitqueue;
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 6c9e1fdc1a76..b2b419277953 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -246,10 +246,7 @@ static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
 
 static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)
 {
-	uint32_t val = gpu_read(gpu, reg);
-
-	val &= ~mask;
-	gpu_write(gpu, reg, val | or);
+	msm_rmw(gpu->mmio + (reg << 2), mask, or);
 }
 
 static inline u64 gpu_read64(struct msm_gpu *gpu, u32 lo, u32 hi)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

