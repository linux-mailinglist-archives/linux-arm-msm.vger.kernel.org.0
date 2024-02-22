Return-Path: <linux-arm-msm+bounces-12160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809A885F75E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 12:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A35FB1C20A21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 11:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09033F9ED;
	Thu, 22 Feb 2024 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mu559cPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EDE381A1
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708602201; cv=none; b=YiaUwh2Bw7vtkHZbCSgBz1Kd/mg7RydrTiQtQr25sEMUr8cPv2sMr1kODy8LA6r6SxqT3iUokOVsYWfThfFuwWIbl0ykOBNu44gkv/yiOY3rAmQEEs35uITR0aeP/VsJ9neYcLz2fmZ1ymGlN/yaS6q0X4VMl2reRb4RYnaaKGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708602201; c=relaxed/simple;
	bh=/xAIOI0l3dOikmLlNmwn5S6CqFH5sP++nL7ytb94Y1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ueD8JvILNiY4RyE2sYXkw0d6I3RW80mZHJRdubvnbm8kTSDXDdm4V5OEJRUxZ8UY+1/HFRajW4CSAHJkjTm5y5Hdf1Q9Dh0ITZKRc4jqDgN0M03z60UM1/4BkesjmlQnywhMcYs0xkyN0Gjh9lxFuJuwOrvxNxuLtLUQ/qcrqUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mu559cPf; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512b84bdaf1so5542084e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 03:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708602198; x=1709206998; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hYPkSB60pBwtBZ+SSGzv94FRelSuOYY2eb3nzYDmJZk=;
        b=Mu559cPf21pbQvH5kfYUPZ2w9L3Dzcy9K24AcoYFYE9zBdbeNWM6Z9khcN0n6aM9mF
         ApyZ+iaIX5vMTLIiepeb/4k2FJdsAqI2Nbq5wb/qWmBA4xu0UodXuk2bsFc5PsAC5DLG
         P1WhcAM0xZzt0Tl9nnBHbK4B1ilGm0X7gEVpJGmOAKC8Q3FsqibaHE4mDJn7birPY+aI
         MasDzVKkCXdSvk57PBZm37KieKgEYvPoQFvvqK3QbRLyqfBoN/ZbAyp5fS+1qcAnuEAs
         fFKVAYRegnq32NxEEeV4KgnChpUGgTlXmqVJS3HhjueDeVvKXmdd/Pb8BngMErlULdNV
         Ziew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708602198; x=1709206998;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYPkSB60pBwtBZ+SSGzv94FRelSuOYY2eb3nzYDmJZk=;
        b=qvtXcBtvznyFN1cloW8Y5xs3Gd0RfJJnfOT9oCTPmc/MoRo2EVJGosUW0GSt27jBRi
         l4h/Jza9L+Xc0eGo0i/oc4ejPL558HJVYy1QdAFo8ryejM2Q0JYiXSY6VBv3Ea034pgQ
         Ax8HFX5a5clZFYGU+iPrSWf+Z/13CzyNUs9dyTVigmIw4yyEUopbv6zAIXviPK7J+rpI
         MtZ1Kd84msbBALw595QbfHAhySxtbV4KiQLaB3OP3T/oYiy63Y8yi4wlp5DJEwwnUZ6S
         qru4DpW9fSxYMpdBQJq/a1bWxN8sJlrjteMN1z1x8rXhA0NRJDJx5dm7LiIo2BU56MUZ
         kbRQ==
X-Gm-Message-State: AOJu0YzTzJ0gkLjBX387ZZ9hHomuOVNsISrxgEJFw3BISHlZ92PTZuCZ
	Rfwy1yd9BMjhyWqWISrm+Ze07j767sT8+KGrtTWYNDEOO8KZLTyacQ7dfCKDWJk=
X-Google-Smtp-Source: AGHT+IGpucXGAiEbDtm7N61Be8iq6upzySqobSaK9Ma9ZnCygy45E+cnYOI4Dt3ONEMB/PA63I9Y9A==
X-Received: by 2002:a05:6512:1023:b0:512:e137:5f5c with SMTP id r3-20020a056512102300b00512e1375f5cmr385270lfr.34.1708602197961;
        Thu, 22 Feb 2024 03:43:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h24-20020a19ca58000000b00512d495ef0bsm596857lfj.113.2024.02.22.03.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 03:43:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 13:43:17 +0200
Subject: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFQz12UC/x2MuwqAMAwAf0UyG2jjC/wVcag20SwqLYoi/XeLy
 8ENdy9EDsoR+uKFwJdG3bcstixgXt22MKrPDmSoNkSE4tEfJz6XbTOoxnYS25AX10kFOTsCi97
 /chhT+gBqOi6ZYgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2623;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/xAIOI0l3dOikmLlNmwn5S6CqFH5sP++nL7ytb94Y1o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1zNVL3NFur7GrLWkn3Ro1lU4Hj5863qqgmmdr
 6lq1hjhGp+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdczVQAKCRCLPIo+Aiko
 1RdHB/0TkzNYPTo596AbO+BpnR00wJNPQ4vLArU56Pz+y+reGLuC3iBDcNIQboww6FMm/yrfd7H
 jlA5Fsd76hyTi+gWwm6gE+21WLEmWXVnDlbXHPRvfR2DlqBczYqSf0SO7OpbWAMoF87hYTuUC3n
 cdHS95WBOUAlXMH4ZCXmFwS0gc5zwR2hCAJqUzTKuETQ6/LixCNzKQM4negckMTpZj467MxX4go
 rgAv9VNO9gxMg10vb4LiqXODTsF2PxvFpA19RGnILRLPf9mVwW3gYRcsvcZluhsJAvC9L4FGrNY
 b6FPZBcCUjoxSASo1+8PSrGO+2CS21SSKe0r75UOhD4LnDoE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
Extend it to also support 4:2:2 and 4:4:4 plat formats.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
the clock inefficiency factor from 105 to 117. I'm not sure that it is a
correct way to handle it, so I'm sending this as an RFC. If we agree
that bumping the .clk_inefficiency_factor is a correct way, I'll send
v2, including catalog changes.

I had no such issues for the YV16/YU16 formats.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index e366ab134249..1b763cd95e5a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -475,6 +475,30 @@ static const struct dpu_format dpu_format_map[] = {
 		C1_B_Cb, C2_R_Cr, C0_G_Y,
 		false, DPU_CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
 		DPU_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YUV422,
+		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C2_R_Cr, C1_B_Cb, C0_G_Y,
+		false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
+		DPU_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YVU422,
+		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C1_B_Cb, C2_R_Cr, C0_G_Y,
+		false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
+		DPU_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YUV444,
+		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C2_R_Cr, C1_B_Cb, C0_G_Y,
+		false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
+		DPU_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YVU444,
+		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C1_B_Cb, C2_R_Cr, C0_G_Y,
+		false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
+		DPU_FETCH_LINEAR, 3),
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ccbee0f40ad7..949c86a44ec7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -195,6 +195,10 @@ static const uint32_t plane_formats_yuv[] = {
 	DRM_FORMAT_YVYU,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YVU422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU444,
 };
 
 static const u32 rotation_v2_formats[] = {

---
base-commit: ffa0c87f172bf7a0132aa960db412f8d63b2f533
change-id: 20240222-fd-dpu-yv16-yv24-6bf152dfa7f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


