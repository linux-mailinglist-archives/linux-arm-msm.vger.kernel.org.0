Return-Path: <linux-arm-msm+bounces-36971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C59BBAA0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 17:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 789F21C227F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 16:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5181C232D;
	Mon,  4 Nov 2024 16:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpNnIRM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417811C07C3
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739270; cv=none; b=K1QLWVn6kxPoCSJRDDq7tK2HoNzE62fVIvnQEXkJ9ZQ5hf0z9hHVG92Hiv03Gyc5CDyVKAtjFLy9jcelYAWnHxNC1ebrpr1eKAaLE+wKvV24w/vkfMtNa1Xku/Gy3HophGR/+GamiTTBdvSUzC5D/Et9itoslmiFhqa87fhaVd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739270; c=relaxed/simple;
	bh=quWvgPocP5KA3RxKGmzLbc0d4NCRlcpG330KVs6Y3Tw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DoZqEcSQH3EcxdJwdRN5zzfD4ef44OocmIMYzXNtTT7wBQlYQDoR9QJXpewgOe3N/dT4TEUUxseNQHMr9IcEjS1fSepSBqq20pqkeno2Fvlngl5otVJWsnhlWsxZ5p1SWwoy1SS/wunKvjav6+yVo2y6DtBU83av/j05D97NJ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpNnIRM/; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a4e30bffe3so15053405ab.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730739268; x=1731344068; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Aow437kkXpAe5g9V7AdsRJo4FnK0hAm9Zw+vMmQfPGE=;
        b=EpNnIRM/Q30EWHkcWczlvtn4MaNOOr4YbqtE9nt6FpxlVsEvukt1H0EmwPp/lYJiOz
         jAS4yxWh1OjyFBhoKfcYiK4T186VmmSMClA52LtcBDh/wz5pEQeYaTEV/G7hcXgb0Yml
         IPce2y4T6Fb5hzUgTzQx+uQcynOTwmMFIdEEc5Em/eHzBFEnvAo7gNtdcr1TH4pihzL+
         E2/o89qzGsk0xKfx1rlb+RTB9l877Ify08EqM/5mcTqcNBNiiTJItoHgd9cwHqtUodnI
         1bK9/MCnAZxdjo3+ZtvWljfv/ZDSNvuPU9BHre0e89JSYPoHSj16Tdy6uPiC6np3z0mP
         tfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730739268; x=1731344068;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aow437kkXpAe5g9V7AdsRJo4FnK0hAm9Zw+vMmQfPGE=;
        b=KLxfdJIRWV5Qztj1eOApPv0P9FxJe9TWCAFTf/fPgSH8DOj8alqw3tZ5uJZnzZZoqy
         RWhdcQlwCnKg2DP5O04dsJ38pqCDpRZ2KJQ57bThf/nP1iNTmFY324fhoVazIpRNtsZD
         NOrGMX8j0n0+ol4zwu8sOApaFh49g6n/y2NRPxMrsM2PD+K5IpljczjNj4EB3gXmkdz5
         +IJNfwMTs+YYcozjszUQcWH5474K9oNi5Y40bh4v2hHk5U32neytm6L0ujA/EsbN3AtI
         81Y1bWncsQl5ns4mzVJ9z3RyLHxC8Fb0TR97sjmDaaq1fONlBXt6zxKulJg0H3WcZ/ZH
         qdrw==
X-Forwarded-Encrypted: i=1; AJvYcCXGiDZqohqlU6+R14l0Sam6KGz6N/bedkYVyF/W1pfGafu5ei9mDb4NDNHEGyUFE1GpRWsqxUimDzKnJXfO@vger.kernel.org
X-Gm-Message-State: AOJu0YwGPX7xzoJy1YFA7zDdWnsCkUp5TMO+BJIBjbKT+e9Hbc9bljnE
	DEWLfdTy09vpsXWlyo+0dO9Nh/dUy3YzRTSMc2sYsTWIP3uWTJr+JJnQ/39IQWUSWU99AyJxc7I
	rTL0vYqoTrKkz+TNFszovSAQvVpjcaXSU
X-Google-Smtp-Source: AGHT+IGkKB/ahqDlWLmEwv6DoJbRUpqg/GBMhf7DFFrb+gxRQ8+oqafUoL+oLxcfiLFlFK30d37eKC2E+AkrVSwfP4g=
X-Received: by 2002:a92:c246:0:b0:3a0:8d2f:2914 with SMTP id
 e9e14a558f8ab-3a4ed2fe5f9mr323276335ab.23.1730739268099; Mon, 04 Nov 2024
 08:54:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 4 Nov 2024 08:54:16 -0800
Message-ID: <CAF6AEGuGL6k3CKXZ0Qv-FTQ589+_PWNtid6i7MmVJLopBm2sYg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2024-11-04 for v6.13
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	freedreno <freedreno@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave, Simona,

A second late pull for v6.13, mainly to get in big/churny but
mechanical (mass dp symbol renames and kerneldoc cleanups) changes to
avoid merge conflicts in the next cycle.

The following changes since commit 4a6fd06643afa99989a0e6b848e125099674227b:

  Merge remote-tracking branch 'drm-misc/drm-misc-next' into msm-next
(2024-10-30 09:49:12 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-11-04

for you to fetch changes up to 86313a9cd152330c634b25d826a281c6a002eb77:

  drm/msm/dpu: rework documentation comments (2024-11-03 18:21:39 +0200)

----------------------------------------------------------------
Late updates for v6.13

MDSS:
- cleanup UBWC registers handling

DP:
- Mass-rename the symbols

DPU:
- SSPP handling cleanup
- Move kerneldoc comments from headers to source files
- Misc small fixes

----------------------------------------------------------------
Dmitry Baryshkov (15):
      drm/msm/dp: prefix all symbols with msm_dp_
      drm/msm/dp: rename edp_ bridge functions and struct
      drm/msm/dp: tidy up platform data names
      drm/msm: move msm_display_topology to the DPU driver
      drm/msm: move MAX_H_TILES_PER_DISPLAY to the DPU driver
      drm/msm: drop MAX_BRIDGES define
      drm/msm/dpu: use drm_rect_fp_to_int()
      drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check
      drm/msm/dpu: drop virt_formats from SSPP subblock configuration
      drm/msm/dpu: move scaling limitations out of the hw_catalog
      drm/msm/dpu: split dpu_plane_atomic_check()
      drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_sspp()
      drm/msm: move MDSS registers to separate header file
      drm/msm/mdss: use register definitions instead of hand-coding them
      drm/msm/dpu: rework documentation comments

Zichen Xie (1):
      drm/msm/dpu: cast crtc_clk calculation to u64 in _dpu_core_perf_calc_clk()

 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |  46 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |  27 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  31 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |  38 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 179 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 107 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  90 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  28 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   9 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  14 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  52 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   9 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   9 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  34 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 247 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  28 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  46 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  50 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |  18 -
 drivers/gpu/drm/msm/dp/dp_audio.c                  | 294 +++----
 drivers/gpu/drm/msm/dp/dp_audio.h                  |  38 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    | 148 ++--
 drivers/gpu/drm/msm/dp/dp_aux.h                    |  18 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 734 ++++++++---------
 drivers/gpu/drm/msm/dp/dp_catalog.h                | 118 +--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 482 +++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  40 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |  68 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |  10 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 904 ++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.h                |  18 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    | 142 ++--
 drivers/gpu/drm/msm/dp/dp_drm.h                    |  22 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   | 432 +++++-----
 drivers/gpu/drm/msm/dp/dp_link.h                   |  44 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  | 254 +++---
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  42 +-
 drivers/gpu/drm/msm/dp/dp_utils.c                  |  20 +-
 drivers/gpu/drm/msm/dp/dp_utils.h                  |   8 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  18 -
 drivers/gpu/drm/msm/msm_mdss.c                     |  35 +-
 drivers/gpu/drm/msm/registers/display/mdp5.xml     |  16 -
 drivers/gpu/drm/msm/registers/display/mdss.xml     |  29 +
 74 files changed, 2626 insertions(+), 2643 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/registers/display/mdss.xml

