Return-Path: <linux-arm-msm+bounces-79268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD409C166C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 19:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B1774E1DC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17569EAE7;
	Tue, 28 Oct 2025 18:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cz/RHy8l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FE526F463
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 18:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761675439; cv=none; b=Q4WvwjHWjRv230LSakIg1wuca/3YJG6Ux2tOjAiSUXJc8Sp2a7PdQ0sIUKiJQ1oAJyx92Lfk82tst/wth1aK79qo1T6UOiAlgqZMDkG5BDWDZ3UJuU7lS9qP3qQvGECsJjk9RgmeyVgeccrFxKn2JXBTvBCiZijUzvhyoRrOvF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761675439; c=relaxed/simple;
	bh=7osc+fqovmwxSl77s5LTh7VtUuvOw0maEhwcPrAUqFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H27m6Wjz/+LICk8Z0u4rzHVmMjv2wjR3HpYPix2GzUJ41NP7cTGs3OoP5gJduNa1q/5TNfCFwjKZlFJNHH6emYsaKRB8IToVJpqfS7i4HnDXzkUhK07MW/hIoFqukOk8YnTCiQeMfvJX86hD5Dp3QXSKLnKJfGbrmJ6KKMBde68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cz/RHy8l; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8a3c0086c41so53469585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761675435; x=1762280235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bu7Zm+c4AQjYkV0J+aBfl0vChbgcxRDezVwbj3H8d7A=;
        b=cz/RHy8llVCr24A+oRoYpTeoj0h5n3ilksN8JUps+X55iMpgmVDlz4LGMJIQr+/2Gs
         X8xJbfMNeYSIxC+If0n3milzJk7ELnny8nT4KCM7YowAZuGwuQh3eaKpnU61xYKuWWzL
         +N/Ad29xUNuB17ciN/KYKwMXYtlLSf9iRi3VHHlgFMGEa/4CGhAH7MzClrpFvMz69jY1
         +pM9bQF/UspGOe0all+v9EGX1zpu8C3bJHT5oMgfyVEH7CWuyyzSi1uh00svLqG21wIM
         OujF2TiAnvspZzmpC8GDYLZW056Q0MIXAqNKOBIus7Biad3wxO4EN9g+ao1spXWU08Xn
         M8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761675435; x=1762280235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bu7Zm+c4AQjYkV0J+aBfl0vChbgcxRDezVwbj3H8d7A=;
        b=Pu+AkrpfcUZcXOkIZu8bVpDSvjvvITSfXvKaYlJzJ82fIaiiFPapRZUXYuLb1ilzef
         qQIE4l6oJtm/u8wDEZO5QoKxbqXS39wlb8It5vNMVRfR9jErPHYzuNkkSB7dvreWkAjG
         /dipm+d9tp9XYmGcreO2JyMjRDhe5zB7sbT2APczv6rGB5PDtW7R7XhDoX11FLnzg1/R
         RUoyxyIq2gFyzdyoflR+yYCLKSatDxxFkMmta4RivdWY+Y0CFxn6LH+b0xoWT3dPvpH8
         S9pqLb20sSeR09tpUa7dUJh/3JiNO5Llbhp2PSu9+dqjQohq8IJBkZmUdc1hT6hzITpN
         JjYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEyi6hpKiYaDP+wehuMel1zt0IGkc87ax4cuD9tvm9bmTGHsKptoqJUxpeXoKe+HShFrJP93yYwx0q44XL@vger.kernel.org
X-Gm-Message-State: AOJu0YyBUkzCazM53EIWSl/x4PZnztziPVWYOMYjU1jo3hiU55eu5uFx
	+dfsyFiCOX19YF9PsbAzxW9tSdgDf9zF0KASn36FCSymVPMWRXKO+Xyr
X-Gm-Gg: ASbGncuN17YEkoKmfZrZxVr33NRQNm8IuBb/9ffQzPMMU6/HAIbFJ3eonMaa65Mi9Rw
	2FegWy9F6U035Sng6bXtScdoDYg99t9MTX8Oa6HRQ6cKJyG6h4XCQeO7sXKVFIxPCHGZSrQObTr
	ysrr0r3CXm3a12K5KZyu1XuzKWHhMdLXUv9bODTi0WnAZ5vJSvVytJaBJHnxRSHGqtlAznREfzk
	SEnfCTMrRy3E9d/O9g20glbmoud0H2qUXszbL/KNoGB/GINGPp30g8rx6ypjw3G8TbsmtPnuCmb
	X7rTRD4zI43z+btowlHwdThK5Ud6AeZehuSLzjqQbgD/TAsnG8ltgTeiKs2DSn9r3GfdyZ75UfC
	xJDBBwinnTyiLQDo07rbSAM/FV8CvyHoKgpU9EXdSqNKW1Cd7gDUub4Pr+mJclcxGmHM=
X-Google-Smtp-Source: AGHT+IENPmmuO9ahxXmBAZ5ej8Oe74VKpSyCg2CwVQ2KspJkv4cb3AP6ibXmqXntU3seZKRkTjBdBw==
X-Received: by 2002:ad4:5d67:0:b0:77a:fa17:551d with SMTP id 6a1803df08f44-88009bcea29mr151616d6.4.1761675435141;
        Tue, 28 Oct 2025 11:17:15 -0700 (PDT)
Received: from lucy.. ([67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc4997e56sm81140356d6.49.2025.10.28.11.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 11:17:14 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Connor Abbott <cwabbott0@gmail.com>,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] drm/msm: Don't sync BR and BV before every submit
Date: Tue, 28 Oct 2025 14:16:21 -0400
Message-ID: <20251028-msm-less-bv-sync-v1-1-6527fd02c52f@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761675189; l=3477;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=5B/tyXXNbztReQJ/afPZcg+Os2/bScCFHYAx7g9KsyM=;
 b=gDev45SDt2WD6lFN2WxncUZVzICSsgh7zVUNFwfbSqkfv+Xq8GQd9/WxiThtzubpvUfQiOvRb
 6PH9hK80ZbcChFHSfiB/iugYyqo3NL+uw/1qLezaKxzCuxkiLQkwC1j
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
Content-Transfer-Encoding: quoted-printable

We should allow BV to run ahead of BR when there are multiple submits=0D
from the same context. Per the Vulkan memory model this should be safe=0D
because there are no implied execution dependencies between submits. In=0D
particular this should allow BV to run at least a frame ahead of BR when=0D
applications render direct to display (i.e. unredirected rendering).=0D
=0D
We also shuffle around some of the synchronization in=0D
a6xx_set_pagetable() to better match what the downstream driver does.=0D
Previously this was only different because of the extra synchronization=0D
before a6xx_set_pagetable().=0D
=0D
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>=0D
---=0D
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 34 ++++++++++++++++++++-----------=
---=0D
 1 file changed, 20 insertions(+), 14 deletions(-)=0D
=0D
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a6xx_gpu.c=0D
index b8f8ae940b55f5578abdbdec6bf1e90a53e721a5..794b79a6a4a1940c84709c32e89=
5b62b97f1ac5a 100644=0D
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c=0D
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c=0D
@@ -216,15 +216,9 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_g=
pu,=0D
 		return;=0D
 =0D
 	if (adreno_gpu->info->family >=3D ADRENO_7XX_GEN1) {=0D
-		/* Wait for previous submit to complete before continuing: */=0D
-		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);=0D
-		OUT_RING(ring, 0);=0D
-		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));=0D
-		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));=0D
-		OUT_RING(ring, submit->seqno - 1);=0D
-=0D
+		/* Sync both threads. */=0D
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);=0D
-		OUT_RING(ring, CP_SET_THREAD_BOTH);=0D
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);=0D
 =0D
 		/* Reset state used to synchronize BR and BV */=0D
 		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);=0D
@@ -234,8 +228,21 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_g=
pu,=0D
 			 CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |=0D
 			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);=0D
 =0D
+		/*=0D
+		 * Toggle concurrent binning for pagetable switch and set the=0D
+		 * thread to BR since only it can execute the pagetable switch=0D
+		 * packets.=0D
+		 */=0D
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);=0D
-		OUT_RING(ring, CP_SET_THREAD_BR);=0D
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);=0D
+=0D
+		/* Wait for previous submit to complete before continuing: */=0D
+		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);=0D
+		OUT_RING(ring, 0);=0D
+		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));=0D
+		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));=0D
+		OUT_RING(ring, submit->seqno - 1);=0D
+=0D
 	}=0D
 =0D
 	if (!sysprof) {=0D
@@ -444,14 +451,13 @@ static void a7xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)=0D
 =0D
 	adreno_check_and_reenable_stall(adreno_gpu);=0D
 =0D
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);=0D
+=0D
 	/*=0D
-	 * Toggle concurrent binning for pagetable switch and set the thread to=0D
-	 * BR since only it can execute the pagetable switch packets.=0D
+	 * Set pseudo register and get counters on BR.=0D
 	 */=0D
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);=0D
-	OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);=0D
-=0D
-	a6xx_set_pagetable(a6xx_gpu, ring, submit);=0D
+	OUT_RING(ring, CP_SET_THREAD_BR);=0D
 =0D
 	/*=0D
 	 * If preemption is enabled, then set the pseudo register for the save=0D
=0D
---=0D
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63=0D
change-id: 20251027-msm-less-bv-sync-ab03721d0a3b=0D
=0D
Best regards,=0D
-- =0D
Connor Abbott <cwabbott0@gmail.com>=0D
=0D

