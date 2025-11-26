Return-Path: <linux-arm-msm+bounces-83509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C18C8B865
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 20:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C0673A5291
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 19:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DE633B6DD;
	Wed, 26 Nov 2025 19:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j23wmqDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703703126BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 19:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764184005; cv=none; b=K1vb+6zng2xJCAzu4ITfxBplWa9Mt2ctT1rwABULEQmT9AGPRFYP3RJ1lRHuMmsUMwDOdJ/2QPv/kQ9BDDrjI/TGzFYfRBu/Z+adSfNlbhuUmq/lOHbgLODfNpHe807HbFJbjXF4qh7izarvNTFPv0J4UIkJCyk3AXhCL1rzlpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764184005; c=relaxed/simple;
	bh=gXWVyG9h24Agp604ZvSh2BkWdNVoab+cVEPp20+0P/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pbFbbZGuLE8ddeQEUAJ5p0PguJAZqkA0NleGYT11qQ9HUA++N0ijMQChJgb9tjxIBZ19N2rdU5pAUggvR6AniJq9BJ3P7KEZIF9Ev6KLBTs8JLIdGt3bere8oUUQFLJgZDHKvQAcyEy2PwQO/lcsd1GzsBONUTKKqxHjs/kF094=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j23wmqDY; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b728a43e410so25082566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 11:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764184002; x=1764788802; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stckSta45RSO4GKvqssT9Kpz23idPNbtjVdz9ZGQhAQ=;
        b=j23wmqDY1+RdK+Jpq+wJYMGUSZnBt63J3CR6ANKSIczD6wtODPsS2Fq6J5EsNMOdK9
         WrX+uMGdka0ZRfawW8KSvTjNctoiSaZd1eT8QJjdv28IqHPuQlb4nQDhUmwAbv/LJwbm
         6X+ahPLKSUjHEpbdjeusQLRryEv56m4jrDQbiHqC1NUfujUpGWt//Oa5y9sOLgMDKFV2
         diXx68ugPMQmt/f1PbS8wlED3IyyryCVknY+yjVly1SFo6swvavZaSzmr5W0uzJ7F5lq
         67R5TrxKsMbvU0eNqcw8rc8xLT+4HwhaCo8cEg26DahuPgQnVaYrTLBHWImXU4z+0DJR
         m9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764184002; x=1764788802;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stckSta45RSO4GKvqssT9Kpz23idPNbtjVdz9ZGQhAQ=;
        b=mcu7RvU4ugk1vhxtb+zRGFpAtmMMfi2pmQOoHXpVbpBUiNha+8YEJbwEUVKAXLQ/so
         xKUvUXVw3VsHBlAjzY6gECgk48+//LanhRInDWJdIXrgm55IJ/+IfW5ByvP8OBV6/Ydi
         gu4S3Tz3ljvI40Qc02SNEEC3/VYNpaM8qpaARzldfJ3vMMEqc64zF1vnh4laidSq6Ovl
         wnBak0X50tFUy6IeGPEGEA6N1wH8nmRibbRX+yUtx7PIg6nqYTQsBT0dra4YWC2BQd4g
         IPM+O9jY1fbW54up1dYyUw4uc4mZXZRI2/PKERznqncy7gz/x3yeAYHUkZNJrT5Dyo/j
         fKzQ==
X-Gm-Message-State: AOJu0YwerfL4fHnJmnzBCX6aljDQ6t5j57q06jDiA5GmbI8cqhB6tE2s
	JmdGPl+okgNWQlpdA4lp5yncoju4SSGb6fKSt6qHo9gotdun2JaUVng=
X-Gm-Gg: ASbGncvZK98NVzZ7Ia0LUzvvUGc36A0iFYUQMwCWSG1JRko9QX/cQcIyPMlhKa9Uvj4
	Oh43IZfqHiTutuSiaaG33wwoVIDCWVAakFQzZWm263BYsVYFgXLYqYPYT2neNtwROgzmzFWtibR
	V/h4qbKSYrQarq9w7dg8SFOJI1iNbM5NVy6ke12j7IyWuMJ1ncBcnSlpgG2Nc0+ocAxLaY0E4zW
	bm3XAy28w8Fz3DLAtYVALHqeOjOS1f6zL51TOQZ9HTrXRtUtqceA1j54dhUJpRwX+dXNog38xxF
	xX/5zmqnG96BK/efSKhNHuStqHCdMNzm3bGzNDoCU86/GwC8ctL8OwowCIqNxClTUlFWvOrhljH
	GZmiu8YyeaiDH5JRkpGmian1SnyA9GMqNCJSN2AsO4Q7ZfEnKfsM3H5xkCs+vPPX+LG0zjXJITR
	UVM7kbDkdsTpe2cjZO9TQxlNP7aP8rGi4+NMTJdwrYSBNHHaEdFdBoW6p+d44feXfKadpbM4Osk
	A==
X-Google-Smtp-Source: AGHT+IEO55xzsXA+ZlrZjP+KV22ag55rRi9OAgB0Mc9+QCEFL9ug5YnYdS/m8CJD3vtIPmo5let39w==
X-Received: by 2002:a17:907:7286:b0:b3d:73e1:d809 with SMTP id a640c23a62f3a-b767173270emr2633206566b.48.1764184001521;
        Wed, 26 Nov 2025 11:06:41 -0800 (PST)
Received: from [192.168.1.17] (host-87-16-172-206.retail.telecomitalia.it. [87.16.172.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdab19sm2062564266b.10.2025.11.26.11.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 11:06:41 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Wed, 26 Nov 2025 20:06:23 +0100
Subject: [PATCH] drm/msm: add PERFCTR_CNTL to ifpc_reglist
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK5PJ2kC/x3MQQqAIBBA0avIrBNywoiuEhFiY81GRSsC8e5Jy
 7f4v0CmxJRhFgUSPZw5+AbVCbCn8QdJ3psBe9RK4SjZRbvZcPuLUpY07XpwZkCNBK2JiRy//29
 Za/0AckzexV8AAAA=
X-Change-ID: 20251126-ifpc_counters-e8d53fa3252e
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764183999; l=994;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=gXWVyG9h24Agp604ZvSh2BkWdNVoab+cVEPp20+0P/o=;
 b=NTVIfrsDGcRjmRgOu+Y2IQYIb8F+JTr+P+HhY2BNIwGMi92QWwDh2DrCZ6O7rLd21GBVLZyOJ
 Z3IhujLoQZSDyjn7zVrUOdnNwZP9xRPDPR0PqIJO+NdBnzwPvwUoGn7
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Previously this register would become 0 after IFPC took place which
broke all usages of counters.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..b731491dc522 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1392,6 +1392,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
+	REG_A6XX_RBBM_PERFCTR_CNTL,
 	REG_A6XX_TPL1_NC_MODE_CNTL,
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,

---
base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
change-id: 20251126-ifpc_counters-e8d53fa3252e

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


