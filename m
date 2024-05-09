Return-Path: <linux-arm-msm+bounces-19608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5328C158F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E27711F23232
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2AC7F7FD;
	Thu,  9 May 2024 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f93GIMpa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106CD7F7CA;
	Thu,  9 May 2024 19:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715283648; cv=none; b=QYwC+FzI86OXT7KRPfakkWDJjslOXzndefAxaFHW7fVrjeEImZjqgGCaYg1YyzwgJB2xLSMPvbKDjZMzzqjHqAGy7o0VrKOeV9iJ/uE0BmiOBrBl6D9RsJZovfgJOM529nsieXqvdRIf/qNO3GTWjHcH+siyeqTNBHJt07cpr3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715283648; c=relaxed/simple;
	bh=q0bW7RwKCn3e/PEgEp8Grw8YSn5c/oJlM1Fy/lXTH1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JwmiLpuK9GOBpsTgyxsUpNfQD8TUEnSaqgqmHGR2cpoDFjyvkeO1FqUwiZLN17RVSORsIuJeLVGP8HZB2p/y8zyEvB7H06m7YyrUvGpJXUzPIFZrSl3FPosW5cGqZ2y5rFvePVG4PDncDpBvhLrQNdIN12454JhLsjbDOF/v8QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f93GIMpa; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a5a157a1cd1so305742966b.0;
        Thu, 09 May 2024 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715283645; x=1715888445; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4PT/MoPGuaS1M3d3mLhAo2ZTc6fbniavNZr/SQBEv4=;
        b=f93GIMpaC+vkek09I5PZKGwzDa/9t0/64soA0ORamq1BA+W79Ajswu9msP+UARtgPf
         gqU3HYhSJkRsVJ3SaqWmF0OeNNc7HdlkedrSgA08pdo0PU+X6WjgQS9SoR6rUmyo5ZiT
         izxm+XHxvCETEeQffZw4fc4gI1lHni3Zf4HnKC7VJyEROwOBjGPMF1l9wVVEefxaEHM7
         cfmdo4eO7ouHsfkQXDASUFQwNifotsJpoJq6tlhv/1M0XAy0QPkzZzT+eC5xVmOdhQ9N
         YQSHH2WU7yxtE4I/y1lXtVCTCducW6AlhAimaGxsFqzjeYiZX9zL2pncfe/WSzkQiB43
         T3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715283645; x=1715888445;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4PT/MoPGuaS1M3d3mLhAo2ZTc6fbniavNZr/SQBEv4=;
        b=ukh39jvrHfzjKCHf/qT64Jtc67bQgdHiHR/JzsDkwIx9GOYYQqkbEYbbKgDMfh5x3i
         RhSIst+NC485AcMUYYqYjvxVkfjNASUmrqVOZDktkpECFhBfJyVjmCGqtUqv1sRVdXWb
         tU6ssEtyEArvDD5FMjb2m+ds1DOPH5KhRly+9ZOBJGdZz0sMdmYXjhQuhuw/yGA7kF6v
         nTOe76VTbXAs4ZgqtwHZkc5owwEA3n3kz2fnPtGZEinoVENQGb5LxjEZWy3YVC5w2Ayp
         VL6Y+D+VkFfl5pYGVKZxggW/6/B+BW3WWG15tyJ6Gh5jEZjT+Hg8Koh5JTGUmKfNZY6v
         5HoA==
X-Forwarded-Encrypted: i=1; AJvYcCU+FsmwDtrStLvC1Z/G5gYYbeCFWEYpgcZ9ywrsu1uj+1lysscBqhTHpR4T6N1Qk80039eKEGUmHRM2FS9zwqtgtBe06fsL4dDOCVVs
X-Gm-Message-State: AOJu0YyYZrgJyaxpeI6WkP9DMywqFHUfZDsSbXOufIRYc30GhbV7R5ty
	qvoP3OFNZ4hpM7ELq08h4Um8BBNuCnm3JuiEuCu8oHB9Wdqflmkc
X-Google-Smtp-Source: AGHT+IHiO7Yr5WIi7nR3XWhfO60riQOA4TSD1gQ1bqLHTx1IqEBI50QKKl536wB4J5uETi16lW6qmg==
X-Received: by 2002:a50:cd42:0:b0:570:5b71:4859 with SMTP id 4fb4d7f45d1cf-5734d704dc8mr352178a12.41.1715283645237;
        Thu, 09 May 2024 12:40:45 -0700 (PDT)
Received: from [192.168.1.130] (51B6DCE0.unconfigured.pool.telekom.hu. [81.182.220.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c322c61sm1032619a12.86.2024.05.09.12.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:40:44 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Thu, 09 May 2024 21:40:41 +0200
Subject: [PATCH v2] drm/msm/dpu: fix encoder irq wait skip
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240509-irq_wait-v2-1-b8b687b22cc4@gmail.com>
X-B4-Tracking: v=1; b=H4sIALgmPWYC/23MQQ7CIBCF4as0sxYDdCrWlfcwjSF0bCexRaFBT
 cPdxa5d/i8v3wqRAlOEU7VCoMSR/VxC7ypwo50HEtyXBi01yka2gsPz+rK8CGwR0ZE1hjSU+yP
 Qjd8bdelKjxwXHz6bnNRv/YMkJZRA1R+ammpzRDoPk+X73vkJupzzF9MsxU+gAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0

The irq_idx is unsigned so it cannot be lower than zero, better
to change the condition to check if it is equal with zero.
It could not cause any issue because a valid irq index starts from one.

Fixes: 5a9d50150c2c ("drm/msm/dpu: shift IRQ indices by 1")
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Changes in v2:
- Add Fixes in commit message.
- Link to v1: https://lore.kernel.org/r/20240509-irq_wait-v1-1-41d653e3784e@gmail.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..cf7d769ab3b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -428,7 +428,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		return -EWOULDBLOCK;
 	}
 
-	if (irq_idx < 0) {
+	if (irq_idx == 0) {
 		DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
 			      DRMID(phys_enc->parent), func);
 		return 0;

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-irq_wait-49444cea77e2

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


