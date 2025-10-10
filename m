Return-Path: <linux-arm-msm+bounces-76802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C017BCE264
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 19:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1814A4E161F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 17:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A413222580;
	Fri, 10 Oct 2025 17:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAG2FT3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE8219A86
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760118593; cv=none; b=TQ3vQBbhiAo87aVxSGm8E4UsjeiJNoGlHCNjHYsX0A9vuOqcUBnUiwhciw3GeVuWGInKtbtOLt4/89Yw57zWkvD10rZT7OAMpA6qYcbw6WIwvoKiA3vnuPVNDzqcdMhAVMlUMy06fwdFBEYUgFX0bn4LREeYYp4oJ7OI2CaxkQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760118593; c=relaxed/simple;
	bh=9XOq6YPq24CpDOGDOJ8EWJ8bkkDKwD6bJxPjyv75+Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OaM6d4ee2AWh3ei3YJDdcDwYU3m9TjmMtwme4FylO0ZDNzQtYwr5l6ZE+HR/m/29IxqqszUy3MZ+4MBLWXlZ1ZoeG78c5k0SCGiOKGF1Sj3Ask05EMtrPJ6eoxMFCGC1mswu63DdDIZm5Ye5taVlI24+nSXP7v4B00IR+HNYSuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAG2FT3O; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso3956879a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 10:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760118590; x=1760723390; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FlMoGYBpYvb/EBbOzxkP+h2B57HDoj8CpMbpuq4sQ4=;
        b=JAG2FT3O0aGtZJL171zLlTU9biQmzRFNcgkQMtwqFbKP/MyAafa3Y/82ywmzv4a0A0
         jCCeqvXLGz594PmO3/lTC/OP7vl1x9ahuzRM9HELxKuFCiL5/T2tr9NiOzijJqrWB90U
         bbPVJHs2D9hoXZ5wQDAxOo28gyJesAWjrOUkT9tDxLsqP1uaX0GCNnxpAkn/qR/8bFXz
         QWViFs+Zp39T/+vsO3JeXXtGQbMIjs+0RmWgNQ+m2wwVuYFXfKzMF6oGx1bfzkwj12Nm
         ioUKfvAGm9q4Tb0rrKSDWqJ836GBJfYVAlbJx8soULAWNrYqyxNuFjsuA5N9nhfJLpls
         FTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760118590; x=1760723390;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FlMoGYBpYvb/EBbOzxkP+h2B57HDoj8CpMbpuq4sQ4=;
        b=rA1r4SG54acGZbrvDPKdSzby7ImlJi0GU+dCcnNwf9bUFNBqcY/vqy1EQAR3+HXeat
         2Ut0CVWci4gkWHow2+dBHn4W002JSzt0LLkbQ4RZNLR2d+4tMnDHlcGqo2qpFM7Azb63
         HP2uMr2JAGH72IcTOKOY5BYukP7blqmIJHLf0qKrkJZJRnoVZuHHkh4kOJ1zL1qiF7Ct
         1sDnBHtVQ5Q1nM09eC4beVEPrvAjt6TPKIZIgwEwpOTGP6FJaBHAcrlzXl7mf1oeca9j
         y5+3+WwDCqogT9zwDuglUT30w/w6DKIiDTp3WgO4WbQsi2cF1/xxjE/1WBtCxuMry/3M
         +vLQ==
X-Gm-Message-State: AOJu0YwekiTrcNk/6o2rye/fAWW2IEOPzkMbAU40QpZAIOCKyMs12QOY
	cMGQqsyyUFw1E0cjfUeGZLfaROyDdtVFnyBsiW+oNrNIIY/jh6cjN7yqxnkA
X-Gm-Gg: ASbGncux4XJFNk3rmbIfpF7TQV9hiyM90ZdcD32Fx2JoED8Mv4+KbAzSPZ0Fy4nReza
	ckMXFvPe2VSIpgK2fovbf6hw8ktKgRaDvKkWI+91riIBIIwFIQu4n1umC53QQleLlUM03VcRY24
	EuKGbmSGBBGF0a6+NzVVmFjxs4gdY9aqc3UP8k5YY2QxvHoTZks665OmVqIBciMrbt7Ui5kAabT
	FUH29sFaUA9DcDvQ5cjcYN/0lZjWoYzhnmV8UwK6Gul+laHbwrUZ9Eg/5362+Spj7oCwG3Dt2KF
	0bBFMKC78hRFApu161bgahMgJDDGzmiIMvVxwpNuS0UhAViXelpZZIGlj0ntTxENW0+sttXXnEZ
	5ki967Rb8JJyPsAzcty28hmvQrlroQIMAooEKu2wkc1JKzXRbST5SMomN1AuTrCTxiKAe2q/MM4
	EXq/KwdBWpbgmGB2kJzhRyGrJGsw==
X-Google-Smtp-Source: AGHT+IHDJR17PQFFrv0Ddj5LxOyqWyfj6LF/dr8cN6Gek6nwWLnn8Mv5hRRCyiL9/vubmJXWRweCCg==
X-Received: by 2002:a05:6402:1456:b0:63a:3e7:49e4 with SMTP id 4fb4d7f45d1cf-63a03e75ebamr6614994a12.16.1760118589666;
        Fri, 10 Oct 2025 10:49:49 -0700 (PDT)
Received: from [192.168.1.17] (host-79-43-163-15.retail.telecomitalia.it. [79.43.163.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f860sm2751785a12.15.2025.10.10.10.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 10:49:49 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 10 Oct 2025 19:49:42 +0200
Subject: [PATCH RFC] drm/msm: Workaround IFPC counters bug
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
X-B4-Tracking: v=1; b=H4sIADVH6WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0MD3cy0guT45PzSvJLUouL4tMwKXYukFBMTc4NUM2NTQyWgvoKiVKA
 w2MxopSA3Z6XY2loAOHIok2gAAAA=
X-Change-ID: 20251010-ifpc_counters_fix-8bd4470e6351
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760118588; l=1299;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=9XOq6YPq24CpDOGDOJ8EWJ8bkkDKwD6bJxPjyv75+Lc=;
 b=MjmbVLvbkiAWzCaRMDnhmThnylcuH2TPO3Q03Qe8qxN/k0yrCNsKkFfz9mAh+yTN19jpeQ3TK
 4lQ5OySpqjODehM8UT3s2xR9wOwF/HQKtLp0gxkDepDKw516sdSDi6f
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

When keepalive vote is set to false IFPC will be re-enabled even if the
perfcounter oob vote is set.

Workaround this by not setting keepalive vote when sysprof is active.

---
I have little confidence that this is the proper solution hence why
this is an RFC.

Hopefully something better can be found.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index afc5f4aa3b17334027f3c20072cc3f059a9733b7..975b91e2c439f659b7f716cff87f73d389641d91 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -191,7 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
-	a6xx_preempt_keepalive_vote(gpu, false);
+	if (refcount_read(&a6xx_gpu->base.base.sysprof_active) <= 0)
+		a6xx_preempt_keepalive_vote(gpu, false);
 
 	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
 

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251010-ifpc_counters_fix-8bd4470e6351

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


