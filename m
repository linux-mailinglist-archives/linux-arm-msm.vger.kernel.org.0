Return-Path: <linux-arm-msm+bounces-30272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9BF9665BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1F09B23EBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F721BC07F;
	Fri, 30 Aug 2024 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoghfSw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880461BBBDB;
	Fri, 30 Aug 2024 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032010; cv=none; b=HUcH/NviOOI4DyqZAgULkEWIFAyRJ9Rj5V7xlQjTLnDI2qopRXys41uO64ybCWa6lg3jyAsx85ASctSOOCzeEwbJ6KXCnAlIqstLMu9xJ0ou5Gyoc0KB4tPj4aTaNa3hViZHFqu8BnCuSymxHKsl6NkDEHysl21PlXziyroi1XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032010; c=relaxed/simple;
	bh=MwrIm+imYoZ8N/YJQUJ6DlX24C1Ou+/mKpHwjs54qbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAYnKUA5TVYBEQHKjM7wltiy3NNmYsSxsoM7iXePYt7DZly+ilog4q5ABIKnDWsD07BeRVHS8+veUyOSCx+1f980B+OqearYEIA8rJT8rOTuCbR/vBpLtP1QoETpW0RuVbgog2GXad8gMVryfAxcgjq7aUFYqH4ov61i8fnNA0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoghfSw9; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a868b739cd9so241521166b.2;
        Fri, 30 Aug 2024 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725032007; x=1725636807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cYv3N1pFipBqf+1lX2kupGjS5LmNs0GYGfXh5AxTY0=;
        b=KoghfSw9Pyha2FylD806JJOL42u8WLjOWu4q0E1ulYgMnvOo9t7AC6QksR4GmAR7sz
         n1et9Abmj3p3V2TDovKzhGnGA+6bTgAHhOj3824x4xCmiPTCU8lOjRCEDvUONmK3vHvw
         xrgwSlrayPgkqTLNB7JXxrDk51ZLjTQpZsjrktGwsLtXF8V9SDWe7sE8foi5gthZCoZx
         HE+IRHFCoc0s34qIH1UR0RrENMaqh6vNZ/FfFWhD0eQWNWiMQfCe/HnI9zlbKsIgfKpu
         QEqwwPUsRAeJmQUF9okhBxYdzAdHdw2c3Bbi05Q8rBc+Cc0sxzHvNwEgnrwY+GpGgWVa
         DwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725032007; x=1725636807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cYv3N1pFipBqf+1lX2kupGjS5LmNs0GYGfXh5AxTY0=;
        b=UVoOZxTvdYZefR5G5r+p+/DEH0PANw9M5sWRh3ctayX0zIATUODaunCXwCaHcTLC/b
         WZ4uroRhJ1hthk9pxYaFY2Z4HunuQoH9/yEQZFLTPjZ3uFx+goNjS7c5RCa9/a9nWaUy
         K/m4sLCPzAbWTIeS2yzvJt5B49CClYuE5kJGz/8RVLj01PlqLk62ISpPjNC5oIiNkm8a
         DaZi74g/beRcWKA/o3rdcnbP2HF/T/0gpMYDtXIxTpLn2e6/TuPIe3Ao85Fb1zSgg5s9
         QuGCo6KX4EYNrWXWawEHfKhaNDEdPKE8G5Gcd3Ge2NLtU4/kJMcamEYuDIyWBsppUtXN
         d2eg==
X-Forwarded-Encrypted: i=1; AJvYcCWvgqG/EBU81H9hrI43/CWRWKnphwEkDqojQarg8aA3/YF1G2PfSOeIVuMwqnAYklqxDHbX992JVcD2jJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/i3a+LbGfdK/p353neZCEgSvvaW73dF3a91lDnaVfCTejsHP
	E/y6JgwlLF0T2T0Vsa/TjKdhOFnI0ccF2HOaEqPmQeMMA8GzyS6j4UZLabzW
X-Google-Smtp-Source: AGHT+IHuDC67lqetxy9o227OrMKM3T5NnYaQpLkADrw68HKXG5WOBv0iSWqmatubTcOO5U+i7Zoh4g==
X-Received: by 2002:a17:906:6a28:b0:a86:442e:6e10 with SMTP id a640c23a62f3a-a897f78950dmr512029666b.2.1725032006314;
        Fri, 30 Aug 2024 08:33:26 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it. [95.234.170.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:33:26 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:51 +0200
Subject: [PATCH v2 9/9] drm/msm/A6xx: Enable preemption for A750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-9-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=1015;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=MwrIm+imYoZ8N/YJQUJ6DlX24C1Ou+/mKpHwjs54qbA=;
 b=dAbILMt2zEkXopYpbgmokhdMBQr4kKjJXBYANhGu6QwWsrTxZukmd7VQrZIG8FsGSnEun092X
 7iWcSUYnpwLAECHEA4/yNMO/EywdLatiKyHUEQYoey4WWeh4fQLPQQP
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Initialize with 4 rings to enable preemption.

For now only on A750 as other targets require testing.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a2853309288b..ea518209c03d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2609,7 +2609,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (is_a7xx)
+	if (adreno_is_a750(adreno_gpu))
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
+	else if (is_a7xx)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
 	else if (adreno_has_gmu_wrapper(adreno_gpu))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);

-- 
2.46.0


