Return-Path: <linux-arm-msm+bounces-28659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 063789539EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28D761C20A0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E243253E24;
	Thu, 15 Aug 2024 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+TUUtnE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B21B481A3;
	Thu, 15 Aug 2024 18:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746459; cv=none; b=EqJvZfOTx8Cb6voFXf0INNtGzfuF9lldWrpJYjYDObr2yXjBPLbT9QNW9ADLAmbK5zCo8fBpJquwTnLA7VQj7dwcvC05WLzDkwlvd8UBVyZXSj4niJnfp6ouSv1j/75gv1roM34uP7t5qJ5WUtQl6MYqlOdqWaZOEOzNNTsQV3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746459; c=relaxed/simple;
	bh=cRwN/x/kiyImoIrMMN+pY8aaRgOsi9x3TvEygQRibF4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zj/6nIT+4ILCe92llJa8uyaUmjchGHU3dOY2tgIrxJzx3aTpxboXx2NFh6S7gDmZjgVj0HL/vgscbpbCFJmtPunfqsY+1vDAWl1LnypSLVsJFttQ+imGVyGWBVjEI7uVQVOksDNA0PKVtyIymG/Ywkx5bMS7GpIaUiZKy6he5KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+TUUtnE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53212e0aa92so1314405e87.0;
        Thu, 15 Aug 2024 11:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723746456; x=1724351256; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDeRwV2Ek/u3WsfSOVcYKLDPmJx4mXCOUe+RX2CIgaA=;
        b=B+TUUtnEOgaHuQk1hjllTEcql77PtSNDMAtRPuIfwcepn62bfU2HZwqAMLA5UuhriR
         XcxxPJ1IG4YQm+8lLT4dTvApe+d3E84cvcLJEP8qcPp/AZI4YikAE4b9g5v2DT5P5ib6
         AU4/UtcM9RHKWgxDz0piO7ZfPIth6K3GLvJ/gbKqUU5aFOH67ZmtF1oXZFpy6WEv4f6L
         hOLGn8NXmoMVrvVn+q0iF/gsb1YcpwMwgQirNL1K9+rwlK96Q5chG4n5yIm8GELCTar9
         dieb6Kaq08BgsB0DYmIN7EaqFb73Ujm9Fo7jK1/b1K4oIvwZk4ks+1bWRcqQS4UjjekS
         i4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723746456; x=1724351256;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDeRwV2Ek/u3WsfSOVcYKLDPmJx4mXCOUe+RX2CIgaA=;
        b=nkKGHjt2nJHyymLs58+hlUG9V+AKzpgaaQoTm2Pktd2z3QX2MJqCK4DxdK1gy5OS8h
         0Q2oit8y/CESXzw64/Q6G5c1zL24ukWwOOmrZuZn3AybB8xhzdbgT3JxlijhuByxCb0v
         TdeBYDP6w7/nFj7DK6hqCLRU1AWWC+K87rOLRCy65p8fvTck/VX1wMCPhLg+UXvQQjPI
         JJ2FCqbpcN1L+t+2ydOE528sIw1nr+Ugeiklhmo//auUnitZqF5t298Ybvu0aFosZF97
         0TDpCovUVuhXARqPuQm/OCgxPYYNIPgm+r08Y84EN2zSlUQhVi+fIv01llc3Wdzxo7IR
         iR+g==
X-Forwarded-Encrypted: i=1; AJvYcCUbDI6dsjPQwL/6BJrfvPH1vx/B8GNdQdtjDEHxJtokDih/9gN4/Q+c0Qkehx+usrFtHEW/m0tM24e5VIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCxA0cNX9LiCC77Ll0Tr5zS67ejPHcNDvOS/hMKoX9QdAHWxBP
	6dDZ0qahmKQFSIF4RUMMPEkpqkjCzecGzYnWtvbBC+kyUcY3ftwiHzy5wFXc
X-Google-Smtp-Source: AGHT+IE/pleE3fWtGlNcvdyFzC9AQ+6sLINiWW6BRFJveiUm4Fyav+aIWWLCA+PGt4J8+auruWaGQQ==
X-Received: by 2002:a05:6512:3d8f:b0:52c:c9bb:2ba4 with SMTP id 2adb3069b0e04-5331c6db15bmr189065e87.46.1723746455626;
        Thu, 15 Aug 2024 11:27:35 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it. [79.35.172.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 11:27:35 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH 0/7] Preemption support for A7XX
Date: Thu, 15 Aug 2024 20:26:10 +0200
Message-Id: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJIvmYC/x2MQQqAIBAAvxJ7bsHMyPpKdLDaag+VqEQQ/r2l4
 8DMvBApMEXoixcC3Rz5OgWqsoB5d+dGyIswaKWNslWDPhAdPomGrm0UJlxnos5ZY6a6A+nEWPn
 5n8OY8wd+ySwjYwAAAA==
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
 Sharat Masetty <smasetty@codeaurora.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=2060;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=cRwN/x/kiyImoIrMMN+pY8aaRgOsi9x3TvEygQRibF4=;
 b=QUSsONzmPFUjFZRdDJx4QCCkCC6gVtRN6Ob110oWVt/N3lvDxOq5kPfsqhi7+YtSYcoLNZS2G
 7DUighCkJoJAwixUOEGuNHE9KsBFUIkIng1l+EHHuMXS0RISoj7FiGE
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

This series implements preemption for A7XX targets, which allows the GPU to
switch to an higher priority ring when work is pushed to it, reducing latency
for high priority submissions.

This series enables L1 preemption with skip_save_restore which requires
the following userspace patches to function:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544

A flag is added to `msm_gem_submit` to only allow submissions from compatible
userspace to be preempted, therefore maintaining compatibility.

Some commits from this series are based on a previous series to enable
preemption on A6XX targets:

https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
Antonino Maniscalco (7):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm: Add submitqueue setup and close
      drm/msm: Add a `preempt_record_size` field
      drm/msm/A6xx: Implement preemption for A7XX targets
      drm/msm/A6xx: Add traces for preemption
      drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
      drm/msm/A6xx: Enable preemption for A7xx targets

 drivers/gpu/drm/msm/Makefile              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
 drivers/gpu/drm/msm/msm_gpu.h             |   7 +
 drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
 drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
 include/uapi/drm/msm_drm.h                |   5 +-
 11 files changed, 995 insertions(+), 16 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


