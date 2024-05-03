Return-Path: <linux-arm-msm+bounces-19178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6136C8BADEA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 15:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C3601C20CDC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 13:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FCF153BCB;
	Fri,  3 May 2024 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WERtMcEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C171474BF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 13:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743797; cv=none; b=Z2Gs6aUdaAWKGuw0kXigcLqX1cMIOmg/W/NWpWL/AnLtRlmriTQzQOXr2onNnhNiqVR6GQyZsfdaK1OH36q9sZ8Oy+dL/d1KV11aKuIWAjhFMY4xs+rcS5+JmK8tNmhjdodHrXa2FkhQOnJYHug+0Je6EtVcwHREqg4s/8ktCcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743797; c=relaxed/simple;
	bh=GuBvh1EmOKxjLNpL33C5S5sksR1AgZWc6zDs3iQDq8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cNBm8Pju0jds7Xm/lz+KfG01W0lgv70ZxFqOpRmqZmBU4u4mNX8zhnud24EPNmnBGuF9fNJhMopgyZMcq6qmwdQTM5/uc3Bdq+R+rP8bmC0uoFrQDSL6YQBIDIozAR1wNW4RtxXFW2QFdFWijKZQc2CSsyvXwOtXMfnF5OoMT2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WERtMcEM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f174e316eso2196808e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 06:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714743794; x=1715348594; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zyyfp4qby9iAPOj419gxE7bqQG4AvlgS4hynSrw/+50=;
        b=WERtMcEMHK4mq+og+01riQ5YChlvg/C0luGlveRfVBkGIoa7hIHQ6NN4v+VxSzPGLp
         DRHrVmaS7wufPC/LpIgLT0PFKoA5ISUMGgWhCte8dgCCziJxMy7BIAi0UFb5113VVVLV
         zJqTAKZ2nahlX+d7egK0IjQRAIxYN0GTBICcAKJJrmg9EqRGfJ3gH0Q9/ZnMQVXbzv3a
         aoyU6A/HLHK6wsQlB6MQZJ+gtDKsA+lu+ur3mCd8cnxXTvj/3rsy6R/XlAceugYaTYhP
         EoptGfRGDrpjLjDqos9mgcBy88EQmITZNFAegwxAzY8iJX0uFbPsESP76G+SW+IQM1Qb
         gOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714743794; x=1715348594;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zyyfp4qby9iAPOj419gxE7bqQG4AvlgS4hynSrw/+50=;
        b=NDPyYx2y3AeZ+1TDkdoEAjqlIQnsed63wYgTtiiggvGa1nzmQZhvtaVKeVSjGKdvrm
         aSMeb1NbJv+s64f13iqUwA3gbqPNUviWL85JE2gt8NFtrHVxNr2FLBALVtqz32cEe66y
         l/bMYS2bHqCkaCj0gSRKkdQ/nLkjHuwGE7aIzYiSM9VfVyY+FTbqxH3nH7HQAt6TGxp7
         ZS7n+qMleCY2lQCgPcO6gSu0kU7LVZ6+2BlWaaEWc+ti4fS1KW3FXkhoDjQ7KSkCylnL
         XOuleWCk0n188HJENaS5w5y8W/aVdHPbpOW7q+TdT0Sv3mAmK4v15uVMvGDc2MhqvlN/
         ZlpQ==
X-Gm-Message-State: AOJu0YwhGvyn38ImYto9EsXsyDbt/naSHZ/motW1MHes/+ntdoUhCFXU
	TUH3mSn1Zwxs8Vx/FRx21IeBS0TuF0pkRpUCalpUTq49AyUPRnWw
X-Google-Smtp-Source: AGHT+IEuJFHTRpnejddSaorKZYTRmH7JKI71UbuwpdEkJajtnyPEeh/HIxQo38GNw/+98rcZPG+8Mw==
X-Received: by 2002:a19:6905:0:b0:51a:f2fb:b13c with SMTP id e5-20020a196905000000b0051af2fbb13cmr1760394lfc.11.1714743793877;
        Fri, 03 May 2024 06:43:13 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id z18-20020adff1d2000000b0034df178a9acsm3782482wro.99.2024.05.03.06.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:43:13 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/5] drm/msm: Support devcoredump on a750
Date: Fri, 03 May 2024 14:42:29 +0100
Message-Id: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMXpNGYC/x3MQQqAIBBA0avErBMmy8SuEi0sp5pFKUoSRHdPW
 r7F/w8kikwJhuqBSJkT+7OgqStYdntuJNgVg0TZoUIprFYoHOXFR3LXEYQyTb8anKnVFkoWIq1
 8/8txet8PFCcx7mIAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714743792; l=1289;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=GuBvh1EmOKxjLNpL33C5S5sksR1AgZWc6zDs3iQDq8s=;
 b=bSJHF10HtjuZ9Tzx5wPnYVU1fQZj2PXl8Q7IjjBliL/Ur+7ZKiUVtz6bWEl18tbcBzoSMgs+d
 939KwwUv3UFCpBbAyN83uGEHxEj1sGJ9MDRhMASA7OFPUMLCWUZHa7F
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This mostly involves importing the list of registers to dump from kgsl
and plumbing them through. We also need to update registers from Mesa to
pull in some AQE-related registers for dumping the AQE equivalents of
the SQE_STAT, UCODE_DBG_INFO, and ROQ indexed registers.

I tested this with msm_recovery igt and decoding the devcoredump from
the gpu-fault subtest with [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27266

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Connor Abbott (5):
      drm/msm: Import a750 snapshot registers from kgsl
      drm/msm: Fix imported a750 snapshot header for upstream
      drm/msm: Update a6xx registers XML
      drm/msm: Adjust a7xx GBIF debugbus dumping
      drm/msm: Add devcoredump support for a750

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   64 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |    6 +-
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 1446 ++++++++++++++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   47 +-
 4 files changed, 1539 insertions(+), 24 deletions(-)
---
base-commit: 7e6b8924568d1aa476b77323df8d2bdd31bd7257
change-id: 20240502-a750-devcoredump-5916f90be37a

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


