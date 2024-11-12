Return-Path: <linux-arm-msm+bounces-37617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D869C58D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 14:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55118281E9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 13:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C150140E5F;
	Tue, 12 Nov 2024 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blMduoZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F925733A;
	Tue, 12 Nov 2024 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731417609; cv=none; b=rQMWeC4SArQzBxfIZz33L34gmsMqy8+sX+Tvwc3nagyRuxjMEQMO0ietLV5aNbTS93u4n+zqDgEyc2Kh2WU7RPoD5mPcfWrkLF4/GXqvfQugX+4/4b3q8O5lqWH2CEr/5btnUWOi1ORQ38jnYnPT1vYQ9a+20OMnDc0EWp8KNx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731417609; c=relaxed/simple;
	bh=8h7Fl9oMUi2VCz4h7F4dblb285tORc2irPA+J3oXbLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HVraA78p5zqzQdNRQ+sK+kcoeXeqDb8vzNJ5T8HMxxC/pYadTJXYu/rvCPOStxROAiL+Cj2SHaAY3pM60ArIeE7msLhp/qF8QtQdNNq8u/mfTGulMo8vYtvd53f+70vQxS7wPsm+wQOfF+BN14+++EyKnqRvgIJq2ixz5bRo2pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blMduoZO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so4135265f8f.2;
        Tue, 12 Nov 2024 05:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731417606; x=1732022406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+RJ1NMa1jB4YevqeHSrW28hy579MbHP2ndXxmXrQdAk=;
        b=blMduoZOcK4VEJ+60DjI0XpJ/5l0AgyqShAKRD3BraSF/l1x3+/mhUKiIob65de3IQ
         SSlKeJNw5XWptJpPLUXegHpvqo7z4aBiF4ODt46+sn6NtKlPN0fE0adOAT1EAb+CMnhb
         4bnDWmd/RhYjHwtBwGyAoVQATS+tCoGpMzm9UlrFlx4AmxOEejldd+VLDVauIMWFGps0
         aabt/UipmzLb6Gz6Zv/puthrXzPhXU9sq8Yd1KCkT3KwvT2LgyCEo5JqbC2IM3A+70ls
         GQuL7EfNQCI8ni9kpqj4n13LMv9Y5h4zCoT4psYtcEOQVHdXdoGv/OQzZiE1ZiD6W3lV
         5cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731417606; x=1732022406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RJ1NMa1jB4YevqeHSrW28hy579MbHP2ndXxmXrQdAk=;
        b=T0dX5QMH5v/IFWQTZV8QYs8zptAUnY9DhPvA1xRAMHL9O1JsmMHHhZzQL3cRsZVUrY
         Rb7hu4WEzB5zCrj1skyqm0Xs0/Ekxl8y0nOK+PdzW9qFbYZY2PGcIdB9C4E7VqJo0gUy
         yX+OxGyIj0RwN6GambaDJeS+7wXxUucG5WltCbkVahOzpM7jLtAbC//f9WGApxOCkofw
         81RpGnXKIgmctcvRaboeUhk/wS92Nz5MsZMzoXe2xsSOE6mcGBzoCBGDZak1eZ9cDP4D
         nsKzsUDaCHJy7p6yyasaGMf3pMuXUXLHvPb1E3TWOBAXdEmGPj7th+e/EiLczImLAt9m
         cUQw==
X-Forwarded-Encrypted: i=1; AJvYcCVu4fWuczE0iKUmN3BUHnNdDiR5vSLHENxQBbvfiZcvq/5uBwnByasrMa8riXfdjx/+Jc4CMCrsFytpqEA8@vger.kernel.org, AJvYcCX5cYTXs8nlqlcnJGrBSXpSw7J5Mm2gnAVTT5CYeZwa75VicXd30izNstcY4o1sNTGQwRqkJv4HecBklO6V@vger.kernel.org
X-Gm-Message-State: AOJu0YydA5S6+tczc7WmQ/wa/3ENgSYdf4I/G0+dSJ5nGY8UljWXTdWj
	xJzh6aiGglIyGrgtODTbrIGufKyQVqWJRJ0atycRWOnFs+gp8/iMtR+EQD/RjgXKyg==
X-Google-Smtp-Source: AGHT+IFcy+h3FVW2hUep37o/iKMxNs6TxUByEJOBaG0afG7vcce/Vvw2QMhVc2yIJKrMe/bSSHTQzA==
X-Received: by 2002:a05:6000:1a85:b0:37d:518f:995d with SMTP id ffacd0b85a97d-381f1835ba8mr15355680f8f.56.1731417605643;
        Tue, 12 Nov 2024 05:20:05 -0800 (PST)
Received: from localhost ([194.120.133.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381fc0f5f91sm6940911f8f.62.2024.11.12.05.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:20:05 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a5xx: Fix dereference of pointer pdev before null check on pdev
Date: Tue, 12 Nov 2024 13:20:05 +0000
Message-Id: <20241112132005.469357-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pointer config is dereferencing pointer pdev before pdev is null
checked, this could lead to a potential null pointer dereference on pdev.
Fix this by only assinging config after pdev has been null checked.

Fixes: 736a93273656 ("drm/msm/a5xx: really check for A510 in a5xx_gpu_init")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ee89db72e36e..e83081346059 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1753,7 +1753,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
-	struct adreno_platform_config *config = pdev->dev.platform_data;
+	struct adreno_platform_config *config;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1764,6 +1764,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 		DRM_DEV_ERROR(dev->dev, "No A5XX device is defined\n");
 		return ERR_PTR(-ENXIO);
 	}
+	config = pdev->dev.platform_data;
 
 	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
 	if (!a5xx_gpu)
-- 
2.39.5


