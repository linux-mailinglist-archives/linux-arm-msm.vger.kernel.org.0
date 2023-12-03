Return-Path: <linux-arm-msm+bounces-3071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D8D802002
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 040181C20873
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AB339E;
	Sun,  3 Dec 2023 00:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="otTYwYx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4184D114
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:27:48 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bd928b13cso2615044e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701563266; x=1702168066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcsWzLItkO5cQT9Vqg2MEcHTqh82Y2+iUzXQkakeWHg=;
        b=otTYwYx3U6BhRqzq9pqfY/PIcYMMOwUr1WtW3bbV0MQohNtOkvn9GuRFlOooYYaFip
         I4rjmrbh6b34NXQes8LTbwER47ht9rHXKak5U+1jLYOabMV/ODBNNhlbe3/AuLuzSiWI
         s9UApLxdxpPSo25UxlMghPDlmN4oQfN9qvrwz5wfHe1sk6TRw6tGTrdTvnkblEvK2Zzv
         nOv2g1RguEHun2Wo+uVleri/lM2H1QrGOWnrYmk6RsF3/3GyDwKFEt+N9c+s18G6uvxe
         N6nlB5LgcQyd8EszIHiQGnwjiOcMgO8cZupdqw8baZj32kOk4IXGtQvoDi5T2ecnPWzB
         uKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701563266; x=1702168066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcsWzLItkO5cQT9Vqg2MEcHTqh82Y2+iUzXQkakeWHg=;
        b=VyZ0t7OPZ/UjH3id6R4m2U/qXS4ttHpcHescyPwNlmkN9QslmGWk0NHuD/seBZK5bW
         mubPrBKoXeICpra8CCP9GoYrDAmBh27t05WLjy5s+DabVRsgFeFlhUHOZaOVkynAGFZW
         BLoWQoxj5BJLH5e3ouBLIt4aeKSLqriIWe+3Qx15y8Rdz12D5GHQkIrEW8tVuVE0+5MZ
         6Ygl7Cl1Qi38GkJ8B+waTW4NKzD0MX8IOuBk1ouqi0zu9dU56uZwgGKhRv2PDmrxFyqH
         iO1o9TWTpb58hO1CLhCpT1jKHVhKllgyk4ChXUSs3URJlMng7uQLup9oZTZmuyKijmE1
         +rBA==
X-Gm-Message-State: AOJu0YwHxnCWdMn5CkRIDnTvOAKo8j2SjhP7PMjilr8jvgFf146Q2nVo
	BQ9jhfIZB4+fyIix0T0zGjKVpw==
X-Google-Smtp-Source: AGHT+IFYl9m3752RVhCXOWzVpJdaN/NW5nt9DYjIu0aN2Y0wd3cIdElvNkNtz4a0Q60SoCknw99cCA==
X-Received: by 2002:a05:6512:488f:b0:50b:efbe:bfc4 with SMTP id eq15-20020a056512488f00b0050befbebfc4mr240891lfb.133.1701563266636;
        Sat, 02 Dec 2023 16:27:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v13-20020a056512348d00b0050bca79a59bsm317231lfr.196.2023.12.02.16.27.45
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
Subject: [PATCH v2 2/3] drm/msm/dpu: enable writeback on SM8350
Date: Sun,  3 Dec 2023 03:27:42 +0300
Message-Id: <20231203002743.1291956-3-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 5aaa24281906..610984d89a9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -31,6 +31,7 @@ static const struct dpu_mdp_cfg sm8350_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -298,6 +299,21 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8350_wb[] = {
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
 static const struct dpu_intf_cfg sm8350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -393,6 +409,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.dsc = sm8350_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
 	.merge_3d = sm8350_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8350_wb),
+	.wb = sm8350_wb,
 	.intf_count = ARRAY_SIZE(sm8350_intf),
 	.intf = sm8350_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2


