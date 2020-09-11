Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8042663A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgIKQVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:21:36 -0400
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:59838
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726499AbgIKP2y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599834483;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=se7hkROfwFK2BtQETLHkPDNTL4KcibWfix5GN8kDsqo=;
        b=L99EnGsCq26ANSIypJkOJmkep7Guv02f1T8xmLzqCkQUOJ/u45nFOZDyH/Bs1F3L
        0uTqVXe0sbF1r+vHF0Dxt0aGF3P99277u/fpwhYDiEbLvieiNsG23LmkzyX6fH4tTCH
        HJ37A82ZRec6yp1RQkN8SLu0U92s6GT0vK/BRYVg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599834483;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=se7hkROfwFK2BtQETLHkPDNTL4KcibWfix5GN8kDsqo=;
        b=Bhxwozc2fGu4s9ASr3j6Dmv1zCHRmvSU0KcLdERHONrMSfDSs2xz3NVlxbkI0Mtt
        Hj4TUC6y3IW06ZZhmswaBsAk+8pD6cwIfz8z8/cG/VJholuleuv1iJjc2l0MK5OO5Bw
        qBYp/Gtzz/p+49LcFJrWTaXK2TrK57rxQmTa94b4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00ED9C433F0
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
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv4 3/6] drm/msm: rearrange the gpu_rmw() function
Date:   Fri, 11 Sep 2020 14:28:03 +0000
Message-ID: <010101747d90eb23-3b1b0b55-9977-49e3-8170-d0edbdf4ed3c-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.09.11-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
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
index abf5799d9a22..03caafa7c7b2 100644
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
index 2ca9c3c03845..aa07900d9ac4 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -419,6 +419,7 @@ void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
 		const char *dbgname);
 void msm_writel(u32 data, void __iomem *addr);
 u32 msm_readl(const void __iomem *addr);
+void msm_rmw(void __iomem *addr, u32 mask, u32 or);
 
 struct msm_gpu_submitqueue;
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 5ee358b480e6..1d446b2e5746 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -245,10 +245,7 @@ static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
 
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

