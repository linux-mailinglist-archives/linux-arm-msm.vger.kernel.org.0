Return-Path: <linux-arm-msm+bounces-42128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB059F1877
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA29B188EBF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C1E1A8F83;
	Fri, 13 Dec 2024 22:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uj5eXEhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD27199E80
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128084; cv=none; b=YXNayDpDrkgHyB931aJcH7BQU8vl1VsKOBP2h5DwKlvO6DXGeBEnme8+EfshlRaOF8vW4/E/D3BpnKJvel/VLKX8XUTzCGRQZMUqmXbYsFMJMyBArgAR38xknHScHfoOvrqVXJT89evcQVIR1yznwTqdOdg1ehKLCYbS01KSTwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128084; c=relaxed/simple;
	bh=GNnQV1MNYWFcAq1qZORvvRE/j1G3voHyTrPAyGRaLUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BroKWt94lfnODPc/NPqqE2a+FQdqLjCsMZ1Lm6dqHue+qaUu88eNBQ8512BWiPFLTEWbcmLkhiba7bzh2mEviShsyjeqZRnpLVsVQqR7dG4bDqqE/mONVffZVhNavk2dssw6WG1ta+9BcafYCIR/H1JNi21n+QZaAgbN/A7O7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uj5eXEhO; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso21278811fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128081; x=1734732881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SS2q6SbMj1ZTbJ13IzwKMNH0i4lebEKtIyHTzThKnfU=;
        b=Uj5eXEhOz9ZpdN+ug8zgypUhFvoPbILrlNWgzoHf8mI0sCa014LZDZrAcC0/fQpVQO
         Kuww6JFcqZw8ltEZtMvLN0R6nDVC2RXconMVS/kXfUWe6nKr24YtoEZKK6/n5KtY2Gzc
         rR1FNoxsBnkCx6/CDo9hZE6SQahPOME8kb9bYxMMJepjres/qWZTiLTlaA0OxGe/juqt
         kZayf0po/6IJXkDoGpv3vPs/845UDhzOF8tudgzAkHBngJSf+JwU7Q+uYPpvLW5wct3v
         TfPA2tWL+NaRiall73vrGPb7g18rSf7yVz6EAqewo7Lba/M0gy3w9wIhM98UM2r5m7oH
         zijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128081; x=1734732881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SS2q6SbMj1ZTbJ13IzwKMNH0i4lebEKtIyHTzThKnfU=;
        b=OhslNflObipDBBuNCO6fL6bQUqQXT/eImmEQ0AozUNvuQTEjN2t1MdRXJeszQwgpZH
         90i5VENNlvKBfoCVPRzu2xjXBXUwxMU4az17mUIMm2epWt3SFPYsyQyC+bsXED0W6P/F
         59VMeJQr1gArw4mpipiBfbU8DlHQzd/SHeYh7xGsqtB9PrmeTTkDZqykqSi6H4BkAnhh
         DpVUUdzR1ylti+Emi2dFz+gGHe4R+0ua79gpU9L8U+vs+bjTBFoA/pQ/xZ6O2uCKqkJ3
         ZWoNdT4UNRnq7ndAs67Xlv7dwtG5ZdmV0LTO6gg22kuZDXhgAxf2smnNuU9R3yRSLWl8
         jwnA==
X-Gm-Message-State: AOJu0YyPcOqdIVldE9m7MTNDsKnF5Y0rqtCKBbWlPV8i+vW3vBWsEJGR
	q3xGflwT0QUDf1XGs6+f53CgJC5PshhLL5wR6toe/mXPv6dvkZflhXQolpbI4zY=
X-Gm-Gg: ASbGncuLfFIWtOzaQPBzj8vfGuQeRu8Tr3LQDkUHTWX8V5020EsaxnlSozsibmmJsga
	u2N9kcQqJOgdvN0CrRFbaBxMp5dsXD5X+x3dsGwPSv2eRiUhG0ht9IwqhMO2su/MZO1QEZul7d7
	DG/Nav4xlwUV9HeZZW6qXszoBYj3HxckxoQ54BxgL8c0jCkDjKma5jKYmxCQGyAbhBjbXIYZAJd
	pobzpto0QtdBOjT6I5fcjvChNKc4RS5BzKQITLaHtcO8Qj7Mmy3ycML+oCmFJOr
X-Google-Smtp-Source: AGHT+IGBrrmVvJpDS9YnfpMnSUZIzb0HQpXo8t39QqwgdvfxCK+0fGZtdWs7xkbeRDeRZbC/luGPuQ==
X-Received: by 2002:a05:651c:54f:b0:300:3bcd:8d05 with SMTP id 38308e7fff4ca-3025443fe17mr12039131fa.15.1734128081219;
        Fri, 13 Dec 2024 14:14:41 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:14:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:18 +0200
Subject: [PATCH 02/35] drm/msm/dpu: enable DPU_WB_INPUT_CTRL for DPU 5.x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-2-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GNnQV1MNYWFcAq1qZORvvRE/j1G3voHyTrPAyGRaLUk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHEA5DUeYaLc+ey3XyG98NY4C1Mfo1wxlQDX
 Kh+ikM4mTGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1df0B/9jBfU+GAj7fHZZuu5Uzn7j6A+6HyeGnzQgDgIKMA3DCJ4VPiPdQrLzqbkY6ZVlCak1PgZ
 E8G3WR7iRTXyTZV5IItcHihX52E53KqKnlyulREA8n8O5e8yWJw6EOgKyMcYdakKDuN9MXnH6N0
 6eHYue6PB8/IBNjXAJ6kEoG6SYGNE5Xw/fm8B7ecSm5HGXSO61ATOSKyFwyTcBTkORx+bwhY0/N
 GM27xVBM96M+LSM59Gzr8rX9cHve+5DC8CY2+rSz1EKNsbeoSWkioMZ+x9SC7k7qWnzFpW6iWeU
 VuMpVJvY1mZbQcKjZM5piAmUpFCtz1CwCfjkzo5u0fRpWMKs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Several DPU 5.x platforms are supposed to be using DPU_WB_INPUT_CTRL,
to bind WB and PINGPONG blocks, but they do not. Change those platforms
to use WB_SM8250_MASK, which includes that bit.

Fixes: 1f5bcc4316b3 ("drm/msm/dpu: enable writeback on SC8108X")
Fixes: ab2b03d73a66 ("drm/msm/dpu: enable writeback on SM6125")
Fixes: 47cebb740a83 ("drm/msm/dpu: enable writeback on SM8150")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..6d413cefbcc1edaa5fe73bacff4ca708f0e04902 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -295,7 +295,7 @@ static const struct dpu_wb_cfg sm8150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SDM845_MASK,
+		.features = WB_SM8250_MASK,
 		.format_list = wb2_formats_rgb,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index bab19ddd1d4f97805c1bfba8ba6e117ae77c6c2e..2e833e638a0bf9ffa6ad1ae16466e1963f26af1f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -302,7 +302,7 @@ static const struct dpu_wb_cfg sc8180x_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SDM845_MASK,
+		.features = WB_SM8250_MASK,
 		.format_list = wb2_formats_rgb,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index d039b96beb97cfeda629ef2546902f7281c53543..76f60a2df7a890c5346fe248d67d646ade574fe4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -144,7 +144,7 @@ static const struct dpu_wb_cfg sm6125_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SDM845_MASK,
+		.features = WB_SM8250_MASK,
 		.format_list = wb2_formats_rgb,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,

-- 
2.39.5


