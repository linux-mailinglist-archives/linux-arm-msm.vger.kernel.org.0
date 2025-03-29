Return-Path: <linux-arm-msm+bounces-52818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A55CAA755E6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 12:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 945BB1891D82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 11:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C0A1A314B;
	Sat, 29 Mar 2025 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaMD7RcH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656DFC2C9;
	Sat, 29 Mar 2025 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743248160; cv=none; b=Po13XWS4wxE/aL69StIQ3NrZExoj1KhoSjm2Z2ucqFxLa/Xta810NRRcK6aU01siwY7/GVoVLQj5dvMWHE6+/EMAjmedsLcF20KxEvpc9COi4UGXuRbKk0id4AUPUeHOIhyyYZTABFggQFNfPMifa4YXkdkgJSYz89zVSqN1ybE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743248160; c=relaxed/simple;
	bh=fo4bucBnXY/q0oK6G7meZ4oUY3TMcCAnjpICzIo+a5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jl5viEWcW7R+e9bapFws3ngaaLa+ULsfHfBpGFcm4792o7gFXlb48mKVlofRo3iSlWYRk1aa3yrkyTatZpGB2RnFP5By9E/dEOgSP1WRpVh6ouT26N1GkqiahvqAStiWp5deiga7ZAFpsCe9pYuZHpEeAz+mBaTTd4PPEXpv/+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaMD7RcH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso28770265e9.1;
        Sat, 29 Mar 2025 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743248157; x=1743852957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
        b=gaMD7RcHn3ChRSKBj8FRbc668B1+IUkAabgMma7K6O4KfTSc20ZJnFDvXMGETpI537
         yjEdWLSlGOzHxnH1oJk1L4j9UBWxpr7xXnlBgpardcoscErjE4aGTgeKASaXrx9fQlhu
         G9+VItk68Wy8rsQ8Zm1nfz2sWXKUmmSCEay8B3W7iaOxcmRDK2xmFBJgpfnst6E+mRyo
         XdEiJMB9sf9RcdaERMtGG80iEFRsOH+Yd6N5Y3e0nQqptrxcME5vlExK6oRypaa14+3U
         W7YLGebV+LN/uUD/Qn9XkwK1xeVSQD8LDVeNyhG6RlaW8PK1YRPK3QGL71v5/EnrcC73
         J3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743248157; x=1743852957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
        b=SbMhmnyAPGhcHSV1I/ZIKzArfGimEVx5NjNOTG/aM05h5Txo2TBiERLlttNGT4qKn0
         Zq5xuPCtav7U7qL6c4wZY68FVVqMRrYFsob+PM87je6O0GMZvs5b9BTGOf0os9YeGojh
         wvxvE6jnu84nuYN0HGOaiw29Kh72aX3T+HAT/J3+DQXQf4/8cMp5Q6Jf2XrWe2lDN2aW
         ytxybCwOEkxxPUBX2sAtFa3ysg4ubWcX3TgTdhsqM8ykuhIGySlv0M7oU0aZ4TkC75gB
         jNnUpfszg1WN1rbeU8tqwP/HzZ7y3kCZoJiaDcrk5bir1OlvqcqQoNQhee0DaGcOtHdf
         cmFw==
X-Forwarded-Encrypted: i=1; AJvYcCWdSNUJCZ6QvkY5ghAU6RK4jE2QIpAsAcV7eEiEmySBPXLGhVjSOSFKZZ+zuf+QdkMNNogMXhpKdBPH6jM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAAEkjlM1ZPDz0kakWOqNXhii1D9Lox1k/UIE9SJGWHvU5eeMX
	lwiAUzXowjfkTACbD1qeseQxRdvxziBV8Jq8W1ff3x0Astp/KB1A
X-Gm-Gg: ASbGnctWS7D6NoLcKnbGjIJ0lmy2+q34RIku2w18X3KzEkWJAuMmr3sY/9cG3z3MfWI
	1tesp5zFA5Cnk2vHrMeMTYeP9RsFyPReq4sSUOylN9s3tK0z9aZY9NmEg6LhnInQtlEYyjCVZXl
	r682njXrFPoIZM0wGxe8Ixbk7nv8Y/CMXW+G+DizqDTqpg+0K3wjvkavhXCjMAQYtukmkVN4/Fe
	BRqvKbG3bFKk3Saf0JmAD5qo3DlATJY+s3X9C5OJ+Z0iC5EnHe0Hb6sOjWHj+cyTeNhukQqbSTt
	7/g2KwGlWoHJtoYQEzL4V4fZdOFXyx4Kx9LG6t1uGDA+9w==
X-Google-Smtp-Source: AGHT+IGzFDOv0az8Oo04Dh1HgtexqBpJ0sbaJycOwnYRGsKdBcmFIR0JBxHT3YADEewHZjwrHQSoFQ==
X-Received: by 2002:a05:600c:4e48:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43db61e05abmr26723235e9.3.1743248155735;
        Sat, 29 Mar 2025 04:35:55 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:c564:b82e:4883:713c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e834a5sm104631655e9.13.2025.03.29.04.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 04:35:55 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	lumag@kernel.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 RESEND] drm/msm/dpu: reorder pointer operations after sanity checks to avoid NULL deref
Date: Sat, 29 Mar 2025 11:35:38 +0000
Message-Id: <20250329113538.7935-1-qasdev00@gmail.com>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


