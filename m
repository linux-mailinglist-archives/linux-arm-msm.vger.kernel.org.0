Return-Path: <linux-arm-msm+bounces-50744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBEFA582D9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 10:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95ADB7A4E2F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 09:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FB654918;
	Sun,  9 Mar 2025 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5ZWXOxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE42D78A;
	Sun,  9 Mar 2025 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741514132; cv=none; b=npdoh2/RasPg6bq95XCEnKhB+eiKFgcoA5jMu2fLjJ3XCkF185ept9LqYUhb9LzuVBZj/gBS4KzH9h2isLFErRkudjGpg7EDBFONC61sk0BGjy2gVK175Ku6JN64jk2Dgf2ARw0P8brIB1hvk6slfioDI5jtNFBoTvm6JArwIkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741514132; c=relaxed/simple;
	bh=CvXbtCAoJTdLfyTEWw2u3IH8iXW9jb/+ApAkyDmMQKk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bsDKLHATIGhzWc2TnDHaAw90ubClbB3Gi3xpW5TbDThEDeCynwA1vy0LOlKlxO5gI2SEcS6qvLyo10D6C45zGy34vP0x/ikVIaL8mjTu6XijZwJpTFudcfixcmnmPDk9Fyg8bzXat5hSJfXw+oA3255nZAvkcgLDdVdamdA1N7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5ZWXOxF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f406e9f80so2475972f8f.2;
        Sun, 09 Mar 2025 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741514129; x=1742118929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZpuHav96lrk832Cicku4PQcIvGBzmRkHChNSbUFJB4=;
        b=i5ZWXOxFN70zCN5iujYvkgJ2Kgvi+bHWO5rXfHe3fjolSLXChQtJt8RHDfmBz5qcMD
         lOHhcDLhBkPju/8doqGzu26A8WjbXcvRhGateMDECQXTR0t6AxLQFPyX5kg2a3Adnyrs
         7fvO1qS2BqJnkJiYH2T3qEGENev2lVu+25xeudftkS5cGTVZbQX7J8utPqUmWiClb8c/
         YMqUKZ14F+2/v9XN8evGZUuTTJsru9X0X7IjUWhqgumaUc6EuYIoG+jaAKANz9VPd682
         DSGlXFYa5vSy4oL5CTM/CHQrUg3nWgHYQWIYp9LsdkFWm08e2gA+H8nQQNPMW3QXVkhs
         Qxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741514129; x=1742118929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZpuHav96lrk832Cicku4PQcIvGBzmRkHChNSbUFJB4=;
        b=UcIE1+c/Cont+jpimY6ax1uVKwS6df3kvPrFRobHa10MEjYO4a06GjVjVPbORtdx7L
         BlIadMM8gETB98t5Ud2vVxbiNRwOlWX5qFdnYN5xiSOx45aN5wNQ0mBQNST1AUyPzoiw
         SUilPh2mr7eS9lHb5W4y6xKWmB9ruuIYcr6OpOpZGJvBebrN5oFKxlYrRdpr3DM9CpPW
         C6pab66Z6BykPgxsDTvZi7X2RAZVdandx0E6bvCNn7XWxN4tShysJeWcGBzwRodntTwR
         fKnv24AbcOuiwy2o37f+dSBefdtKhiY0Zx5xLvKrjvTWD8h5U0+Aqto7IKB9mmWQDmua
         N6+A==
X-Forwarded-Encrypted: i=1; AJvYcCWAFGsBUas1khKWiif1YWTYCcHeav+RPfuAWHO1gwivCXm90VEijmKZLJgDCjXkJDLoCt0vDFnjepj7Tbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMM29EklMkMkPPdAOJp0qBZ3vQ2gOqikM7JosfvvOmyfwbumi1
	IzXy6XyKKeYQk/rFTV6fhFbwFkbwGmNjUbq7Zzy9CffCWaUxSrDt
X-Gm-Gg: ASbGnctY1Ekq9k+s066DlNYd1/q6Mza6MOgRpje5yepxOksY8yulMsxCaw8S/sRA/SE
	cwaw4hzO6uzRzEmyNPJWTP7uo5HM539T6hK8ZzNCFNh2U8hDyw1gCPL0MPrADoNFpz/d4052CvE
	XpSUB/t4TrzNHMMmxrwRM5x4gN/pROK/5MYYLeDSUxi5xfmA9qf4TZXm11XK0OEyGOUlFdNUHMW
	ot/C+t/L3sxNmLL9NswgnsZPIx5+f6k8Rlst/pPzQjHt2jWxiKPaPneRI/hMfqKgSx37vSZvyp0
	LxmoyreRaoA1CX9vN3ei+5DqCr8xwghKtlp5CQuDzOXAew==
X-Google-Smtp-Source: AGHT+IHfI/VJZftDRqHYeb3Xwib26RWuigXJPjvLBRgin8Bg+mZushMIzjAxfzKYiLNvU6b4hTnErA==
X-Received: by 2002:a5d:6d8a:0:b0:391:12a5:3cb3 with SMTP id ffacd0b85a97d-39132d2af8bmr6599086f8f.3.1741514129156;
        Sun, 09 Mar 2025 01:55:29 -0800 (PST)
Received: from qasdev.Home ([2a02:c7c:6696:8300:8afb:1194:b90e:9410])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2bb7sm11567926f8f.63.2025.03.09.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 01:55:27 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dpu: reorder pointer operations after sanity checks to avoid NULL deref 
Date: Sun,  9 Mar 2025 09:55:25 +0000
Message-Id: <20250309095525.7738-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys"
before the sanity checks which can lead to a NULL pointer dereference if
phys is NULL.
 
Fix this by reordering the dereference after the sanity checks.
 
Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
v2:
- Moved Signed-off tag below Fixes tag
- Moved dpu_enc declaration to the top and initialisation below sanity checks

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056..0bd1f2bfaaff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1667,7 +1667,7 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+	struct dpu_encoder_virt *dpu_enc;
 
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
@@ -1678,6 +1678,8 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		DPU_ERROR("invalid pingpong hw\n");
 		return;
 	}
+
+	dpu_enc = to_dpu_encoder_virt(phys->parent);
 
 	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
 	    dpu_enc->cwb_mask) {
-- 
2.39.5


