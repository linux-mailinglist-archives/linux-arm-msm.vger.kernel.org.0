Return-Path: <linux-arm-msm+bounces-10120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E884D270
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 20:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D41551F25A6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 19:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0892786AE3;
	Wed,  7 Feb 2024 19:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhOTXLYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546898563E
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 19:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707335660; cv=none; b=NwAKqm9QvCsrDt2CBOyxdTphPUUkSgNUqXHGxlhzzrQk+dpnKVDg03icBRCZyKuvqWN2uXfrzTmDtRdVjDekYK3taytqH/wtr2U1V8vwVQ1Ne4vGSReNHrZKP/QkMHDtfEaL/MlVGThy+CPSQ8niz0Aza1nuyFD+Jbujvhz8mmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707335660; c=relaxed/simple;
	bh=jWCS7vTWieaHmmI0xYRhP9xkHjDH0g/h0j4ZjlMz0g4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Qbrm4ac63QvZzSIVCWJFdH7hTIZ3+1WiflfmLtvuA+ZA5gzg1qSInASyyado+E+f3yDkfge2Xf5YzJvuBafZCUhXIJp10tWgh4HnA/eYJBoLcceo4HntGgorN/2s1ud/j6NpZvopsG4CNw4+69E69w1p6Mdc6xSrNAdX2EVyi0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhOTXLYF; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d090c83d45so12317321fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 11:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707335655; x=1707940455; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i7SRBxYoK9LHUFD9hGgBcXZ8tzxyzNmubya79xIxsbE=;
        b=OhOTXLYFOUuke31Ko95HfbadwwTCjMA6av47m3PFCrdiZjJ+M35Pcl7TKqd+UJr3rz
         olzuDCpaGN4aOgGAi0HnHZQhHnu6C3Yq9wGwY08Qm8Y41EJEscDllBPeNWFeJ5HUSza5
         dw96bQbZk7eSjt7VjCGWxvUeoBYzFo/6IIqrXMQ/vezjnJwJx4r3vTAD27sD0fw40+kz
         br0/S7OfQloKwdygUz+Eo2aAVrHpUE0OSGAeF9O7On3I0J/Y2QJODohBx1Yov5eMRhcV
         ONWDFCiFfYrdZjdq3lz2cjIg4h8E4ooN9aYN0Qyi671l5x4l2LUMOTAShKJUKjPxSElV
         hkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707335655; x=1707940455;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i7SRBxYoK9LHUFD9hGgBcXZ8tzxyzNmubya79xIxsbE=;
        b=aVjrYK9zFjVsM+ZGTZyGATbDBbJE1bPM8LZtc0EIPX4M/v1KU/MwUeO0GTKBLgCcMo
         eg/K56uexwcypnSti/pTLaaYzBARpQB1qpx0JAvIaaWcpNPsQAgcuoxpttAH5xFlGYJ4
         dzpHW5G1rkhKczZTQ/BsocJGsEeH7xx9ri8qlCbaisFXSgmSzodZ/Fy3Z3Ta62NPmLik
         NN4RZzhiVIeW1PJecTmdqm3v8yLCJLE2vK+/LgQ5LxM2pGL4WiW06O2ORRetSjnBfl4p
         1kNYQfCYzYD0BJD9hP6Y8M2As6Qb76cpbDIhEE3CYErbh6Z467IV620ZTLk3TrI7gxn2
         fLnQ==
X-Gm-Message-State: AOJu0Yz8QcgrPcmVrKeN6hbx/8rc9QLRzGnwlX753+TxoyEKCSvI8R86
	R6JTdVSvcpX3DvAwFMh6ySi7Mx/6GPTlbZp2U9Dvv8OdN8RFATnDODrO3201YkzY9VUFkAGDvcL
	0aP78ny9gKu7YLZC84Fb3rmXCPBE=
X-Google-Smtp-Source: AGHT+IF9HE8a4amqQHEhMM6t1EjO3V/7Fs2Qoo+grFeA0gYWq9zuo4Ne8b1XUnMBHprJIRWQoJ4WJd+LAwYLXstRifU=
X-Received: by 2002:a05:651c:1250:b0:2d0:ce72:570b with SMTP id
 h16-20020a05651c125000b002d0ce72570bmr953313ljh.48.1707335654873; Wed, 07 Feb
 2024 11:54:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 Feb 2024 11:54:02 -0800
Message-ID: <CAF6AEGvmW88vi3Ar6yw81t9X-MOL24NdqyZYjduMBfJoBNq5-A@mail.gmail.com>
Subject: 
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

A few fixes for v6.8, description below

The following changes since commit d4ca26ac4be0d9aea7005c40df75e6775749671b:

  drm/msm/dp: call dp_display_get_next_bridge() during probe
(2023-12-14 09:27:46 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-02-07

for you to fetch changes up to 8d35217149daa33358c284aca6a56d5ab92cfc6c:

  drm/msm/mdss: specify cfg bandwidth for SDM670 (2024-01-25 14:36:04 -0800)

----------------------------------------------------------------
Fixes for v6.8-rc4

DPU:
- fix for kernel doc warnings and smatch warnings in dpu_encoder
- fix for smatch warning in dpu_encoder
- fix the bus bandwidth value for SDM670

DP:
- fixes to handle unknown bpc case correctly for DP. The current code was
  spilling over into other bits of DP configuration register, had to be
  fixed to avoid the extra shifts which were causing the spill over
- fix for MISC0 programming in DP driver to program the correct
  colorimetry value

GPU:
- dmabuf vmap fix
- a610 UBWC corruption fix (incorrect hbb)
- revert a commit that was making GPU recovery unreliable

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: check for valid hw_pp in dpu_encoder_helper_phys_cleanup

Dmitry Baryshkov (1):
      drm/msm/mdss: specify cfg bandwidth for SDM670

Kuogee Hsieh (2):
      drm/msms/dp: fixed link clock divider bits be over written in
BPC unknown case
      drm/msm/dp: return correct Colorimetry for DP_TEST_DYNAMIC_RANGE_CEA case

Randy Dunlap (1):
      drm/msm/dpu: fix kernel-doc warnings

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c            |  5 -----
 drivers/gpu/drm/msm/dp/dp_link.c            | 22 ++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_reg.h             |  3 +++
 drivers/gpu/drm/msm/msm_mdss.c              |  1 +
 6 files changed, 22 insertions(+), 20 deletions(-)

