Return-Path: <linux-arm-msm+bounces-28091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0194A838
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 15:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8242E1F21A40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 13:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509FB1D4159;
	Wed,  7 Aug 2024 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvJD5Da3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8357E155C83
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035914; cv=none; b=VwPNMWNTtYjDRBxlJDXIK3BsXn5jQZy/OmqJE6Ty4qrM/6CSHFyuygq+zrWN7A2gJbNz4gtMTavC26YYRLHFq3KtzdGamvFnpWxXiVTJv5TTxP8/dHsIEMNMUi78yuCng2sDx97BYDUBgc8WAiBKpW1dOe05C+eTRcHrpk2+iss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035914; c=relaxed/simple;
	bh=j3XI8vHD2Wr1YAg+a1G4G9KW1tFsuqeJR4WD3H+3iqo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=adjQRCMbd1vs2yBtjMeW29FL9bWwQA3mDEs9Z9kuIm+6WjPW0Mkff5+nq65JdSY68OjvGLMWj72Ix71HUDxNpixzQLw/aNcA2aAIjTwzCNAoVyQZl2FMlnBnGtttAB/k8aln0c78iaHN6FFUH0hWDKCItZry7+1plYn8/Yo0Kh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvJD5Da3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3686b285969so911574f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723035911; x=1723640711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqzvCh1XrIPWdHgulG/aaHvZSSlW8im3s5TS73eXDAc=;
        b=QvJD5Da3d7P4P2J38Uo/46XgLyknhp3BQym+7i0W4J9pMtCRxawttfM+Dg7oN8tjNC
         HkHLdpjk2AvOAOAvHB7MMth7sR4rGuM/yM/gQhBXSsVly6dhCzEbyN94CIUQAzZ4jy5H
         +HnfDaqw/f5ogI+E4AjVmBmO/DLg5p7KFos/CMU/ZKaJarpfPTJgAG0j5a6Kun4YLVKt
         2QdyJ451EKoOfCMAcWn0l8r+F3T2J1dNztSYk5nRku68NurhIodfIZP69UY8sauh4NYV
         iejYSc8Y+iR1t9F6h/WFjsdL+cZG/N3I86q5F5M66UdB33TLOn3i3mAZtw5N0iaeT9zs
         FQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723035911; x=1723640711;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqzvCh1XrIPWdHgulG/aaHvZSSlW8im3s5TS73eXDAc=;
        b=ats1FBw6QTocdqZOc3fyhLSDLak1lvAPU/oN5yQUR/5r6jPe+3vgZxHVBBWLAZEcmb
         856oPMH0JW34Ti3wRyI6eQm1LQb0G3ZEb+KH2QvDK0eqgCEj2hoxEYep3Sd4yj9baccp
         sHh/SDoiu0uzkXorpAuo8V0wRWZGXESImGiqBVS2XVBtSPBCquaQsqJ7UYB1H7n3geR5
         5Q68/YmYK/4HlVG//NnkZOn870gindHHcX22ICGI950L6VoUkGC/uunQtrmEmuXmiMSP
         H+Bo9TbAVpIvKvu4Ep9uEL03aiKIoFEiviwBKIT5E33VU57qcVEYUqcLlta1DCbmUhVr
         afRQ==
X-Gm-Message-State: AOJu0YztBGGcUr/GcfW6v07v5Ms1htZkESUV96EqefN2RuY/SCojRaNL
	4BkWghL24SnVq9eAYiHRicZEX2iv+veSkoC2fxFtyxzmKC2C7PT+
X-Google-Smtp-Source: AGHT+IFYSC+cb71ngcmTWiNxJCqmthJpZV5JtFOp2Ui1y1hZbBNtHEl4XtnzNoGAv7ECInm65fWhKw==
X-Received: by 2002:a05:6000:d91:b0:368:504d:c3a4 with SMTP id ffacd0b85a97d-36bbc0cc232mr10754879f8f.17.1723035910421;
        Wed, 07 Aug 2024 06:05:10 -0700 (PDT)
Received: from [192.168.0.12] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd05980csm16072849f8f.76.2024.08.07.06.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:05:10 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v3 0/4] drm/msm: Further expose UBWC tiling parameters
Date: Wed, 07 Aug 2024 14:04:55 +0100
Message-Id: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPdws2YC/23NSwqDMBCA4auUrJuSjJrWrnqP0kXMQwdMUhIJL
 eLdG4WCC1fDPzDfzCSZiCaR+2km0WRMGHyJ6nwiapC+NxR1aQIManZlnLrk6IQj+p6q4C2W0Vg
 AsI3uuCLl7h2Nxc9mPl+lB0xTiN/tRebr9q/BgZY5ZVRqKYUUpm6gevRO4nhRwZFVy7AXqiMBi
 tC1WkIrOyHYbS8sy/IDmM2nLvQAAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723035909; l=3177;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=j3XI8vHD2Wr1YAg+a1G4G9KW1tFsuqeJR4WD3H+3iqo=;
 b=M4TJ8UIw2w8UbkglWKbOfAL+PSSfkCGIXoLftowPNu5e7YJzMA7finOj7ZEgNsfvEnCy3z3Bu
 LlcggUJqHGxBo8tnoqCpWd//K8Y53RA2kJ6T3firpUVnX0eEnRZgY8D
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

After testing, there are more parameters that we're programming which
affect how UBWC tiles are laid out in memory and therefore affect
the Mesa implementation of VK_EXT_host_image_copy [1], which includes a
CPU implementation of tiling and detiling images. In particular we have:

1. ubwc_mode, which is used to enable level 1 bank swizzling to go back
   to UBWC 1.0 when the implementation supports UBWC 2.0. a610 sets
   this.
2. macrotile_mode, which we previously left as default but according to
   downstream we shouldn't for a680.
3. level2_swizzling_dis, which according to downstream has to be set
   differently for a663.

I want as much as possible to avoid problems from people trying to
upstream Mesa/kernel support not knowing what they're doing and blindly
copying things, so let's make this very explicit that you must set the
correct parameters in the kernel and then make sure that Mesa always
gets the right parameters from the "source of truth" in the kernel by
adding two new UAPI parameters. The Mesa MR has already been updated to
use this if available.

A secondary goal is to make the adreno settings look more like the MDSS
settings, by combining ubwc_mode and level2_swizzling_dis into a single
ubwc_swizzle parameter that matches the MDSS one. This will help with
creating a single source of truth for all drivers later. The UAPI also
matches this, and it makes the Mesa tiling and detiling implementation
simpler/more straightforward.

For more information on what all these parameters mean, see the comments
I've added in the first commit and the giant comment in
src/freedreno/fdl/fd6_tiled_memcpy.c I've added in [1].

Testing of the Mesa MR both with and without this series is appreciated,
there are many different SoCs out there with different UBWC
configurations and I cannot test them all.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v3:
- Further update register XML.
- Add commit to fix macrotile_mode on a680.
- Link to v2: https://lore.kernel.org/r/20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com

Changes in v2:
- Move ubwc_config field descriptions to kerneldoc comments on the struct
- Link to v1: https://lore.kernel.org/r/20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com

---
Connor Abbott (4):
      drm/msm: Update a6xx register XML
      drm/msm: Expand UBWC config setting
      drm/msm: Expose expanded UBWC config uapi
      drm/msm: Fix UBWC macrotile_mode for a680

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |    4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   37 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    6 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   32 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1118 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h                    |    2 +
 6 files changed, 1161 insertions(+), 38 deletions(-)
---
base-commit: 269b88cb92e62e52718cd44c07b7517265193157
change-id: 20240701-msm-tiling-config-c5f222f5db1c

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


