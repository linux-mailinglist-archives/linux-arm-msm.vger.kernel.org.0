Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EECC42A0158
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 10:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgJ3JYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 05:24:46 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:12335 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbgJ3JYp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 05:24:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604049885; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vrgQ8RVETWUH1hQjD/0ggJjHA8S6VTYAIs13Idv4bzY=; b=cpIbis7NMemJgODarWmNZu5ti1E49vFsE1Chu7FdqQcp/604OYVgcvjwM0bHEIx+fEAckHjj
 jQ8qHLmsb0h0DZ9f4zPTBtGbuRK2Mv0Zg1nLIe2e/KD9sF3TYa5vm9Bor68QJiQ3q9gjbSXd
 RxM3qM2u5bssn91ktW5mSMDis4U=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f9bdbb0902d6b255d2fd6ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 09:24:00
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84BC1C433F0; Fri, 30 Oct 2020 09:23:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA7ABC433F0;
        Fri, 30 Oct 2020 09:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BA7ABC433F0
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
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv7 3/7] drm/msm: rearrange the gpu_rmw() function
Date:   Fri, 30 Oct 2020 14:53:10 +0530
Message-Id: <9c7af6b5098277825bcdc31581cc7a63542df34a.1604048969.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
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
index b9dd8f8f4887..655b3b0424a1 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -478,6 +478,7 @@ void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
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

