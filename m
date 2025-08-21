Return-Path: <linux-arm-msm+bounces-70169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B7FB2F963
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B4A47B0398
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434A931576D;
	Thu, 21 Aug 2025 13:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4uqXwqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8729E13A41F;
	Thu, 21 Aug 2025 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781624; cv=none; b=HKqBZPZYzsR7NKXM1KWf2aPo2qZNu5+89SwCmPEcrkuVHKSSBQ7ZaJkM5zQnw+SfxALmJSRBxeTh1OaPmeGjEsl1sE/GmIyXx1zyIIIp8DIQXEtlxEOT3/KBNNBTrm3hIHR/AN0H0hQNVhVoDGLHb0gqWpdyxGPEdn+CNU60bI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781624; c=relaxed/simple;
	bh=zyD2tXH2fILSn7Eg7Lk7nphonX0D1uVWaNAvjPxQDyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TFGaAx6GyJBPH+B8ljp58jiVtkpWS+EI8uyY26sCiefil26yNXi0nbpd4PA83vAh89/NfKuhF/99BCTN5mZ0jLXjcHhsUZZx0Uv45DSTQLqefp38QKsP/WoaJmiKA2FaanXsGzeC5+M/qYN/tLWdO+ty5qfvNzJ25S7c1Tzcwgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4uqXwqY; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb78c66dcso146766766b.1;
        Thu, 21 Aug 2025 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755781621; x=1756386421; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cE2xUgsCtcl5Yk5Y5dmTdO4x4ZofxQkVly4ZQAAlTxc=;
        b=F4uqXwqYM9YjJHaQ6dr2jChLAijveXIwjq2cyaZcM4+y66ye7mXFglqnUOKedN17BO
         JZ5l9rpf5k00glDNKKE68TLZvc87vI1pQZxS7UTiHhVxLNppsFUZS2FTQbO+OiZND9vk
         LoLoBO++XQRGr8sdLTWYpidfmQPtJHIYCw4DbU7+/4rKXF0tbywHhVZQg5UGipY4M5xg
         5dzGwdwtIKydeonNNTursIcSjzWm/ywmbXeXtl/f+AQXa4AL3Hgz2TNUIKB6qqQpEl9a
         4K2O5KVOwpV1QxDCHbhmvS+B2tNwe2MVZ9WSdrbQmUR63kM4BLdovhfKrGH7rpkMOErY
         070A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755781621; x=1756386421;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE2xUgsCtcl5Yk5Y5dmTdO4x4ZofxQkVly4ZQAAlTxc=;
        b=iahDJA9pGwtAppJI/UWVSxEo91EFnIcrrt6Mmr7DuxXlpt30f5YubTQ5OydcIjGZuf
         CitQ/pp5+Qx7rkl4sSFitbzCutFTZm3mvjXZn/ZprQnNkfC1SahUlYevXwMx23AhhEc0
         9ZGsX7J8G3CcmQqswFWO52bCuJh70DfnMFWYcSZd5GzYy1uqeoowHx/79YqFazTIp1Kz
         tOkN1+JY/NhDkB1YFhaFTsk5RSgjC8hGwrODqUmK7aIAkypwpR8prkEag3DkU6bLYVKI
         lDbU3rNY3bmR9NP46nfrEUjt+G03mWIkM18k5gR0a0fsIOQyvtlvHdYyJd6uygMdbIyg
         EE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYym060htNQ57+8GrO7VIJkQB1iee2iU2NUY1qvg52NIoDB/voUvoLXX4YSds6y/wp+qe7w+9mnI5U/2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0p4/6dU+bx6CTAiHba3s3OGlLUcMYmX3e6zKJ19aD1wwNPJdk
	IvEfHjDIudFmC/uZEc03U+xA3YAqDlEL05kVhcqUuQlUXdUhYdWCQpwg
X-Gm-Gg: ASbGncttpN9p391K8Zakfq0CCufwXmPd1jdaTL5beAn0y/b6XMRA7cGoWyhtVgCC8YT
	wAuYeTPkT3+XbYv4x/Y8CRx7UD8MYahTg1t1JdDN4+MPu6BwKTSaqL4+MTHbDK1X1ecMa+sgtYQ
	MYVPIcSVxYYuBRtfHjkGFwWzSjPV9gj6r0JdVAdQl1gQOMYJvdYUE3ymwuf0rldq8p6Y0Bk0lI0
	pvRSsBjK9Tyd+fvwNaBGkydPGIsmmMjvOTsxpKFRmXRHwmi/8D/jUhZaWl5umdR/hhKRqOimo9o
	tmhokrESit5inmcjS88o0M3wW9S9zwzs9A9XtkHghlW1szLnuqlQxcjLAHWsNv+pJyw5fxc7yxe
	+PUjgkEEeMWQBIC88AXACXaovo7dnhw96OG6Wotcq1oCKdWcxeuqbf72MaKkY5+K1ggd2Z6vdht
	ZN5JQcwOjXbw==
X-Google-Smtp-Source: AGHT+IEb/ydiKkvMtEnHGcuaYMW4zGRi4TzOe4lkXKlzMl+kWF8eUQjCE+yneKRzlUBsvTdWJpLgLA==
X-Received: by 2002:a17:906:7305:b0:afd:f207:4dfb with SMTP id a640c23a62f3a-afe079eca14mr235776466b.25.1755781620314;
        Thu, 21 Aug 2025 06:07:00 -0700 (PDT)
Received: from [192.168.1.17] (host-80-116-238-73.retail.telecomitalia.it. [80.116.238.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdfa887a90sm273649666b.11.2025.08.21.06.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:06:59 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 21 Aug 2025 15:06:34 +0200
Subject: [PATCH] drm/msm: make sure to not queue up recovery more than once
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-recovery-fix-v1-1-abfc518ba0a5@gmail.com>
X-B4-Tracking: v=1; b=H4sIANkZp2gC/x2MQQqAMAzAviI9W+gqovMr4kFm1V426UAU8e8Oj
 wkkD2QxlQxD9YDJqVlTLODqCsI+x01Ql8LAxC317NAkpFPsxlUvbFoK1M2eV99BSQ6Tov/dOL3
 vB9nByadeAAAA
X-Change-ID: 20250821-recovery-fix-350c07a92f97
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755781618; l=1207;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=zyD2tXH2fILSn7Eg7Lk7nphonX0D1uVWaNAvjPxQDyQ=;
 b=n2R845Fa9hNlxpW+twuvg8HGdjLRRE1ADB2NlsjQnyyUSqDswNDgbqo5tzKnUgDfgircDlUPL
 b6Iksw/fWcbDDS7OBvgfOWLh41d2nnIkl8yEho7xhmy/pbDG1USNE57
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

If two fault IRQs arrive in short succession recovery work will be
queued up twice.

When recovery runs a second time it may end up killing an unrelated
context.

Prevent this by masking off interrupts when triggering recovery.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..f8992a68df7fb77362273206859e696c1a52e02f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1727,6 +1727,9 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	/* Turn off the hangcheck timer to keep it from bothering us */
 	timer_delete(&gpu->hangcheck_timer);
 
+	/* Turn off interrupts to avoid triggering recovery again */
+	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
+
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 

---
base-commit: ba0f4c4c0f9d0f90300578fc8d081f43be281a71
change-id: 20250821-recovery-fix-350c07a92f97

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


