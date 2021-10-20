Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F90435228
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 19:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhJTSAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 14:00:50 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17171 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231222AbhJTSA3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 14:00:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634752693; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=rvucfrK5nE/1u+GNvxQEXYHZ935RFR7Y6kOg/uu3juQ=; b=S+ahBHRlIX+NdE2/G32FIXvfNZCD1KRv9Opo79QaykktYgElg6WrZg7nGQvMEBYFZ5StiHqn
 lzObu1AMlgcHI/DIha1OBEXoWq6mbLaa4OpHyeCmVONMhPNgEtFaz957GACyty7ktJ8/BJw5
 6Ar9FUPEbbjRIh56urpxfU5uMEA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 617058aafd91319f0f5d5bc9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Oct 2021 17:58:02
 GMT
Sender: jesszhan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DF711C4360D; Wed, 20 Oct 2021 17:58:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jesszhan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5CB3C4338F;
        Wed, 20 Oct 2021 17:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A5CB3C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Jessica Zhang <jesszhan@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     Jessica Zhang <jesszhan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dan.carpenter@oracle.com,
        dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org
Subject: [PATCH] drm/msm: Fix potential NULL dereference in DPU SSPP
Date:   Wed, 20 Oct 2021 10:57:33 -0700
Message-Id: <20211020175733.3379-1-jesszhan@codeaurora.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move initialization of sblk in _sspp_subblk_offset() after NULL check to
avoid potential NULL pointer dereference.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jessica Zhang <jesszhan@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 69eed7932486..f9460672176a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -138,11 +138,13 @@ static int _sspp_subblk_offset(struct dpu_hw_pipe *ctx,
 		u32 *idx)
 {
 	int rc = 0;
-	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
+	const struct dpu_sspp_sub_blks *sblk;
 
-	if (!ctx)
+	if (!ctx || !ctx->cap || !ctx->cap->sblk)
 		return -EINVAL;
 
+	sblk = ctx->cap->sblk;
+
 	switch (s_id) {
 	case DPU_SSPP_SRC:
 		*idx = sblk->src_blk.base;
@@ -419,7 +421,7 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
 
 	(void)pe;
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
-		|| !scaler3_cfg || !ctx || !ctx->cap || !ctx->cap->sblk)
+		|| !scaler3_cfg)
 		return;
 
 	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

