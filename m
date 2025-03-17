Return-Path: <linux-arm-msm+bounces-51627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F12A654B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 16:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46E973A3AC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 15:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A187223F41E;
	Mon, 17 Mar 2025 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGDa7mzj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AB23FC61;
	Mon, 17 Mar 2025 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223612; cv=none; b=hVAH2KbtwDrzHaFk8M0HKaoJMYucYYSABMFfosH2pH+pKWW+xw004yzYXR43W2IvCSP8qL1Xt6bn280vziYzHzEd64t7M/fehhVG4N9P0WqBaA8tcNT4WZOR+dnPbmRj9FpdZasHTSyw8TrN3kmL/bAEkFmjar0150gD/GJkq7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223612; c=relaxed/simple;
	bh=1vuS6Rd8o+ntlyTBUnEQazfZLhY9aZtgMavV+2vj/WM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PeUxvZV5IdWhskTMMyErmK6q51d93u1SixKxAiEEtjsWVJ+p4Fxgq69vFG6Rkn5m694xkdLgKXt0JmaqPz3c5o344PBVQYXzb4WG+ttgm1W6K4u0Znh4plgMUR4nNgi7ZJSYRRFGrkIT4gNi2TmIBNgtdwlg7sKjGP138QHCeHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGDa7mzj; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso2769444a91.0;
        Mon, 17 Mar 2025 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742223610; x=1742828410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKg3+CntGpo2nGd/HO2S30tnDbQnjifg17kcFSnARp4=;
        b=nGDa7mzjKu1rkE4gesphsTgUgqf5gStwa52CiTKynkmVumfq6/5f852jdFPtw3BDqy
         ytPZYl7FD4hEetft9t+JS07L/rUy3i7/5r8wc+EsN2Xmc3hcJGLoqx+lwJhWrZXEChPK
         srBAGdbNGgeeRYSoz76cEOT67DBhWa0rJ1IfbkpUvsKoxe9ZlqZvJ4Fknoa8xdMQp9jV
         L+urawW6FOYMUfUo69eaGZs29deUhBimtA7BAaWC7qLhUoSPC5OO4am1ycmOar7HCOzv
         TgbNEtR2DLIYuz3OvZADJpXKhLQL36xbD5SC9soIoOr2zO/u4HZYrtEEg/UWR1V2P3RI
         nxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742223610; x=1742828410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKg3+CntGpo2nGd/HO2S30tnDbQnjifg17kcFSnARp4=;
        b=f5aqrIPc8USPWLnL4homQuwhPEdd1fT0DcmUU6nSrWFcMewZAI8iHFOdLye5k/lehR
         PZoSrMThxnEGtEtl31euiaW5Rvdz/J2CD/kZ+nHwvxEQvZaZ8aRzZjkOUoV2iMr3gIFr
         /f2YMK2NDxmvVwluTfU2xVv99MJjbDHmzIl9Gh4S6EgrXfEeodP9xypUbgouF5BbHjzY
         zGBgrYlWq96mYMecEznT3pd2d/RIqZaIgymcZSnO0znPAjOIBdqk3vJC+5bYITvtUobL
         5YtCTKPnshKvsKsJRJnJm0RwDFX4YLeOly1AdbcxtljxY/txhXUeSOvM+25TqKieEY9k
         P9Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUypMUq9oBL6pSGDkbotN01R6TRpW1n7g9VZqYZEb30bPI+mV8+OHg9raFPtR5ZmB/kqge1KUKMPXduHuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGNZYjP+kGEwW1Bc9pX7OQ9J7uDAIKS5ySBhKFpRdwIwkU9zJ
	9iKWvk2AZ1Cwx+dhhra4K1F/sS5+rSoAYBBW6sr3pnfLMlMoWH5J
X-Gm-Gg: ASbGncvcq0NOD83858XNmc4FsJuihH80jgqUmUb5K4TKnd2fC1WU62xWFHJBoC2WSIW
	3GJnKLxo0ura24ru097TJwgJCdJFtaOFnHClQ1fUSR8njxuo5GW/KVyQbWGQ9mLPLPT9xJA9NKh
	eyXHmtn74n/1o45+jwrgzKSE/NmUdXzCZLegna89Iywj5zv91wxUF1QSYbTZSoepRg/8T+Ir+fj
	6rsg6STc/zV4R61ZO0ebet2O2Y+kVbedRPHmqXC3UoRFV/H12nI8EkggB3AzOhHG4ZW2ThHwI3f
	gBr6ED058FDyRWGdpykza2V400AvEM0q6QtsdHQ+lRLLWlHnDE3Odvke7pRxXMC43XVtvVbZcSW
	emazjW7PwR9Q1e0PHb3c=
X-Google-Smtp-Source: AGHT+IHpqQOthZ629rK5OBwdGCNb3YwECxZM9wivvDLCurM5eSyLS9L2K41fuMd5nLAFoGdSrLTErQ==
X-Received: by 2002:a05:6a20:12c8:b0:1f3:2968:5ac5 with SMTP id adf61e73a8af0-1f5b095d100mr25087612637.20.1742223609746;
        Mon, 17 Mar 2025 08:00:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9cd03bsm7297043a12.8.2025.03.17.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:00:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Marek <jonathan@marek.ca>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx+: Don't let IB_SIZE overflow
Date: Mon, 17 Mar 2025 08:00:06 -0700
Message-ID: <20250317150006.34084-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

IB_SIZE is only b0..b19.  Starting with a6xx gen3, additional fields
were added above the IB_SIZE.  Accidentially setting them can cause
badness.  Fix this by properly defining the CP_INDIRECT_BUFFER packet
and using the generated builder macro to ensure unintended bits are not
set.

v2: add missing type attribute for IB_BASE
v3: fix offset attribute in xml

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: a83366ef19ea ("drm/msm/a6xx: add A640/A650 to gpulist")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Backport notes, prior to commit ae22a94997b8 ("drm/msm: import A2xx-A4xx
XML display registers database"), just open code, ie:

   OUT_RING(ring, submit->cmd[i].size & 0xfffff);

Prior to commit af66706accdf ("drm/msm/a6xx: Add skeleton A7xx
support"), a7xx_submit() did not exist so that hunk can be dropped.

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c               | 8 ++++----
 drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 91173bfb7e58..eeb8b5e582d5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -244,10 +244,10 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
-			OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
+			OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
-			OUT_RING(ring, submit->cmd[i].size);
+			OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_2_IB_SIZE(submit->cmd[i].size));
 			ibs++;
 			break;
 		}
@@ -381,10 +381,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
-			OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
+			OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
-			OUT_RING(ring, submit->cmd[i].size);
+			OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_2_IB_SIZE(submit->cmd[i].size));
 			ibs++;
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index 55a35182858c..5a6ae9fc3194 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 </domain>
 
+<domain name="CP_INDIRECT_BUFFER" width="32" varset="chip" prefix="chip" variants="A5XX-">
+	<reg64 offset="0" name="IB_BASE" type="address"/>
+	<reg32 offset="2" name="2">
+		<bitfield name="IB_SIZE" low="0" high="19"/>
+	</reg32>
+</domain>
+
 </database>
 
-- 
2.48.1


