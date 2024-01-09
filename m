Return-Path: <linux-arm-msm+bounces-6837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DF2828E94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 21:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1443B24CFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 20:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F5F3D978;
	Tue,  9 Jan 2024 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woXjqTph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868713D971
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7c6f0487so3346845e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 12:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704832869; x=1705437669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1IMTrLGXL3DoYuQMmQ7qjtoDUmoVxjKFdnyiQCYD2qI=;
        b=woXjqTphg5R8CrzfOPm/87Cz+YzTD7Y6zJsWds2TwJHRacVGf/3H0FoM5gwu/KpT1Z
         fnAAiapqWTaHGiaZaDFx2KYJjEQE9QEtPXmvsqVhEK0A3pHxOoC96edrfIFyVs0RwwVc
         VsS0qD2fijXTlzYqSMfJgFz1QLA7pe3sOijcg0v9Bs5ixOdUoiruJDB1oMRy6zMZN7kI
         11FXFKySFdQkYOPNIcBN9Du+4vBdM+TUv6VSum74BuQGylg6ruUJ+0fPWDMV0A7gHcFs
         fFVY0cm94y5cxa3C0Ys1TsYcS91R/WAMbT/UVMLLgRiafPOl76s1OzJQpD3qrBlobvuQ
         n5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704832869; x=1705437669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IMTrLGXL3DoYuQMmQ7qjtoDUmoVxjKFdnyiQCYD2qI=;
        b=RNxLLX7C2r5j2W0rkT33IqksY7B80PyTpBDVgrLpcMfDukgGLxjcvaRNKFy2KIhitC
         GnZLxa45Au+sCw2P2kSeUyJJNtBx6pPXYzYgCWxEuKDi6NRrTR3DPbStc59LHZGJHBgV
         xb94jiRdrGQO1ID5h9o8DQ+QOqXNjL2MERo5RIioPvotbOnzi+vVEAU8m2+1jxRabm31
         Egcia9QxJsligLZAOLrLRKRqDbP7ToORgkZbEkpXWFKD53bSGV9qK3fSXkMvAcK5eQKh
         z/LtU3DpEi0SVkCfvxq9rhF/qclUOFYTGTqipWnGyyQPTgdHU9y/oSvZdoEMCL0Y6gTY
         /KBQ==
X-Gm-Message-State: AOJu0YxXkcki3Hm24uXouJpDHt5H1/Umo2WQ6kKNNTO8+udI9BzNDRoT
	97fUy+mZVT00grCugAsZI2A0UVKDVdKZPQ==
X-Google-Smtp-Source: AGHT+IGq5218wvaogJueOD/DpYuKLoXmu4W+n/+HB2kF4j3PUDGcL22+DHFIx6i8j3H6hWkaN3FnnA==
X-Received: by 2002:a05:6512:2023:b0:50e:64f5:ad71 with SMTP id s3-20020a056512202300b0050e64f5ad71mr1476328lfs.146.1704832869503;
        Tue, 09 Jan 2024 12:41:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y3-20020a197503000000b0050e7e19b692sm448489lfe.154.2024.01.09.12.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 12:41:09 -0800 (PST)
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
Subject: [PATCH] drm/msm/a6xx: set highest_bank_bit to 13 for a610
Date: Tue,  9 Jan 2024 22:41:08 +0200
Message-Id: <20240109204108.3385496-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the testing of Gnome on Qualcomm Robotics platform screen
corruption has been observed. Lowering GPU's highest_bank_bit from 14 to
13 seems to fix the screen corruption.

Note, the MDSS and DPU drivers use HBB=1 (which maps to the
highest_bank_bit = 14). So this change merely works around the UBWC
swizzling issue on this platform until the real cause is found.

Fixes: e7fc9398e608 ("drm/msm/a6xx: Add A610 support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

The photo of screen corruption:
https://photos.app.goo.gl/k4MPzpBKPUD3AKR37

---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c0bc924cd302..c9c55e2ea584 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1287,7 +1287,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	gpu->ubwc_config.highest_bank_bit = 15;
 
 	if (adreno_is_a610(gpu)) {
-		gpu->ubwc_config.highest_bank_bit = 14;
+		gpu->ubwc_config.highest_bank_bit = 13;
 		gpu->ubwc_config.min_acc_len = 1;
 		gpu->ubwc_config.ubwc_mode = 1;
 	}
-- 
2.39.2


