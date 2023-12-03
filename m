Return-Path: <linux-arm-msm+bounces-3072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A59D802003
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47AB41F20FC2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D45625;
	Sun,  3 Dec 2023 00:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EERH8BNj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1950C115
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:27:49 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50be3eed85aso1366527e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701563267; x=1702168067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heUF+a7HiOKx2XIYX+afSxGWRxKmOfUpqPHFcQ7qMuk=;
        b=EERH8BNjjS6DVWaLNYugtrYeyNr67F05+72p1Lduy9/bxbRd0siUxA3A6U0jqZ4TNc
         lz2h9bWZCQE4XyK+gFuuTzgk7xk0zqfnZViZSxISVhEDscjTN7buAcWbjFN8IoKKst89
         byqL7b/RiW3TwQo9V4AFdQahMQegW9v3xpI62klyEEgT3oRE8jpxCIFfPmdCR4PAryfq
         OnU8GZ6lj6q1ekchBlyhtn95zNEFiWUjLzVJbjs63iF1UmV+gO4Fid3kA4IGgcF7TuYx
         oIn6Qm4ldJYzbNeZRc4UEP8jQYfvJ4eviOLmy+/Og38Zmwx91ae9oHw0ka8AZ58pULGJ
         fwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701563267; x=1702168067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heUF+a7HiOKx2XIYX+afSxGWRxKmOfUpqPHFcQ7qMuk=;
        b=AFWdLoOKE7BquecbpMXZRzyHjqlMm81pjg0k2rS5yqd0ktvii0B3lSRRHkKVBYHtZ3
         ee3IkJSCBJjP4jsyunx/m/9hcmgrko/qEt+kqUTtEc0p5nbFnUTVRf/jUHoDrsYxn8pX
         PNBWz381dOCe7up7m1uSkmqTFYeWnISrmWGbuCaeVOXL8YcrOIbYuymbvUdJaXwmr10Q
         oyFoy19d06cFYYzUQKqACoh8RUf18eOgl6XvvfbpFIwPO6bDCH+SsAD7zIo1FNjUX7g3
         1QDAMJpmspYAIXjZINLcQrcD9jeo23/GKqqgvapkZEb67DVledNdRyyNWhXVyukNAglh
         aJjQ==
X-Gm-Message-State: AOJu0Yy3PDfegAMj9OozhXMNH9+3k+3vkYpPeZJa2A/3xvAjlqtzhk8h
	JdRwmEBrQocJgWnv7sj8+YXqMQ==
X-Google-Smtp-Source: AGHT+IHi/rdRGHaEWr+BG4yKRNfKQ+Sj/CUnz2fF+hUvMf0vGSjuTU9KsGIzTFv+bZdWpU8b96CLWw==
X-Received: by 2002:ac2:529c:0:b0:50b:d582:52f3 with SMTP id q28-20020ac2529c000000b0050bd58252f3mr1702952lfm.20.1701563267459;
        Sat, 02 Dec 2023 16:27:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v13-20020a056512348d00b0050bca79a59bsm317231lfr.196.2023.12.02.16.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:27:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm/dpu: enable writeback on SM8450
Date: Sun,  3 Dec 2023 03:27:43 +0300
Message-Id: <20231203002743.1291956-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
References: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index d18145c226da..413c0b1f4ad3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -32,6 +32,7 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -316,6 +317,21 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8450_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -411,6 +427,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.dsc = sm8450_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
 	.merge_3d = sm8450_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8450_wb),
+	.wb = sm8450_wb,
 	.intf_count = ARRAY_SIZE(sm8450_intf),
 	.intf = sm8450_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2


