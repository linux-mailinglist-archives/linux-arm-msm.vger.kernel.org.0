Return-Path: <linux-arm-msm+bounces-36207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 616559B39DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F7BC28378C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 19:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9EA17B50E;
	Mon, 28 Oct 2024 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2MW2S0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DA718F2FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 19:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142021; cv=none; b=igVQ2G6DpTnB9J6i8DbQiy2FIxosdOcgcEZnEKJGtl+Swl9PYcSMp+D9fIxychNT5hP90KxdmfNkg/zmvSlXXxAMtF767IhtJ430Gcc2ZxIb8YR/SOiRwSTxJGpQLDtU4Jo/8UG5ER9Enqd+AaYk3o4jdP3LVrCv64AJ5cUN958=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142021; c=relaxed/simple;
	bh=OMQqUtdMp+n2sqvtgoUadqEDeVuNbqTTJbd7OuyC+X8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NMqlyRCeaQHJ8JqWVT2WTBTPeydjT1XWDfz/mUs/Gpnu/EmyIvqkphd3aEsIp736M9BAclU0QjBkrf6Xb4GUvxIZpQFBedHokrHKOjOpdQ07xbAssu0Wf+jpon5WfTS5cNNAkAcPir6vg4ae61c5rV7AJgztT8FlNSjRL/e2620=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2MW2S0U; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a398638ff9so17615325ab.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142015; x=1730746815; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DrJcv/aH8I8XOoCISZJRfuyHbZe3jDtZgV7phtsunRQ=;
        b=I2MW2S0U3bPIR5zOTmVcrDi0vhem5sozPef8ep7AgVWksZHU0HtOYYVO5y9vrKC+wf
         mGT2KMDNrOGvzuYSlfGogTc3xQu1ftjg7JmMx3qBEfCNkEmr2tq697B921DbQ6YgKz7t
         tvMedZvzGDsqQDgVnbivcaMehTXW9m5lw2iF4flSGeiKRn10E4u8UuoTUUyOGlpbU/XX
         nI9UhYb0s9kngEdIstoNgyhGh5cX5G302ZF2p5FTRDuk9YVeUGjEDY7aqfHoxICeXeND
         wk1YUEXDqIR4VdnWulam2+3EM4EJBgSwpcSSIfpkA2gzQ/CFB1D+RjOGbSA372OnuaVu
         Wpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142015; x=1730746815;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DrJcv/aH8I8XOoCISZJRfuyHbZe3jDtZgV7phtsunRQ=;
        b=uDQpqxs2SKWBT3PNVvZd/5DJtV0Smh8dv4tTh+kAY7ZGsRGkgbNP4zs4VQdv/vcpqU
         OyIxwNZlo01SsH3vz0eeI138EY2QPksLwlDQUYDkgdLOrMJjwz8tneZ/O821zrD2x9pd
         eYK6gj2jxn7j3wU6j+qbhWQHW7+GzMRKHQotyWGxIuBeEtZrOdy5iFqLZd9gwfGTelvP
         V6w2WzdlQd9cnXqXu5UiN7Kk7HYDecmnjEKmRoQ4ozXnxC9wOfnLuEsgK6GBVkyrqWxC
         tYmJQ01qtIO/LQCywvf11aeqIBgefefmhrE/COvsYg3Ndo9DSJI/pFUfCB63f3JE8aUH
         C03w==
X-Forwarded-Encrypted: i=1; AJvYcCU9ruPrwKtKPRQQz7DPzsGm4NKD65HEu6EEVLzZMTIVB/Uv/+8GWDq8hk9Wg2ggoZ3aAeSGrOtMFpZEc1C3@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhKtqXqChGh3xuPCjYjTT7flNdVuQCrXtOo5RyZZJJ6mTAHl2
	kJgEK1KnmHzXcRKCg+FKsh+nGEyrgFb1XvtILKVVWvZqid5et8ln96h+6WNrQnLjdsfRAEC9YK+
	wUFCR6G/nGvtHrdYC5t94/t1cYNXB+CrG
X-Google-Smtp-Source: AGHT+IHYNVJlfW4M0RA04mRZlU54bsrTqTyql/PhULJZPP4lJcsVkBp3FxDhhrl+AlOGnl0NFdP9BBkQaSASwNktjBQ=
X-Received: by 2002:a92:c266:0:b0:3a4:e9c1:8f75 with SMTP id
 e9e14a558f8ab-3a4ed311732mr73088995ab.24.1730142014993; Mon, 28 Oct 2024
 12:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Oct 2024 12:00:03 -0700
Message-ID: <CAF6AEGt7k8zDHsg2Uzx9apzyQMut8XdLXMQSRNn7WArdPUV5Qw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2024-10-28 for v6.13
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave, Simona,

This is the main pull for v6.13.  Further description below.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-10-28

for you to fetch changes up to d6d1ad32d00714ecf9f1996173c6f98e43c5b022:

  drm/msm/a6xx: Fix excessive stack usage (2024-10-28 09:31:33 -0700)

----------------------------------------------------------------
Updates for v6.13

Core:
- Switch to aperture_remove_all_conflicting_devices()
- Simplify msm_disp_state_dump_regs()

DPU:
- Add SA8775P support
- Add (disabled by default) MSM8917, MSM8937, MSM8953 and MSM8996
  support
- Enable support for larger framebuffers (required for X.Org working
  with several outputs)
- Dropped LM_3, LM_4 (MSM8998, SDM845)
- Fixed DSPP_3 routing on SDM845

DP:
- Add SA8775P support

HDMI:
- Mark two arrays as const in MSM8998 HDMI PHY driver

GPU:
- a7xx preemption support
- Adreno A663 support
- Typos fixes, etc
- Fix excessive stack usage in a6xx GMU

----------------------------------------------------------------
Akhil P Oommen (1):
      drm/msm/a6xx: Fix excessive stack usage

Antonino Maniscalco (12):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm/a6xx: Track current_ctx_seqno per ring
      drm/msm: Add a `preempt_record_size` field
      drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
      drm/msm/a6xx: Add a pwrup_list field to a6xx_info
      drm/msm/a6xx: Implement preemption for a7xx targets
      drm/msm/a6xx: Sync relevant adreno_pm4.xml changes
      drm/msm/a6xx: Use posamble to reset counters on preemption
      drm/msm/a6xx: Add traces for preemption
      drm/msm/a6xx: Add a flag to allow preemption to submitqueue_create
      drm/msm/a6xx: Enable preemption for tested a7xx targets
      Documentation: document adreno preemption

Colin Ian King (1):
      drm/msm8998: make const arrays ratio_list and band_list static

Dmitry Baryshkov (22):
      drm/msm/dpu: make sure phys resources are properly initialized
      drm/msm/dpu: move CRTC resource assignment to
dpu_encoder_virt_atomic_check
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
      drm/msm/dpu: Add support for MSM8953
      drm/msm/dpu: Add support for MSM8937
      drm/msm/dpu: Add support for MSM8917
      drm/msm/dpu: on SDM845 move DSPP_3 to LM_5 block
      drm/msm/dpu: drop LM_3 / LM_4 on SDM845
      drm/msm/dpu: drop LM_3 / LM_4 on MSM8998
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from
dpu_plane_sspp_atomic_update
      drm/msm/dpu: drop extra aspace checks in dpu_formats
      drm/msm/dpu: drop msm_format from struct dpu_hw_fmt_layout
      drm/msm/dpu: pass drm_framebuffer to _dpu_format_get_plane_sizes()
      drm/msm/dpu: move pitch check to _dpu_format_get_plane_sizes_linear()
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: make dpu_format_populate_addrs return void
      drm/msm/dpu: move layout setup population out of dpu_plane_prepare_fb()
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c

Douglas Anderson (3):
      drm/msm: Avoid NULL dereference in msm_disp_state_print_regs()
      drm/msm: Allocate memory for disp snapshot with kvzalloc()
      drm/msm: Simplify NULL checking in msm_disp_state_dump_regs()

Everest K.C. (1):
      drm/msm/a6xx: Remove logically deadcode in a6xx_preempt.c

Jessica Zhang (2):
      drm/msm/dpu: Don't always set merge_3d pending flush
      drm/msm/dpu: don't always program merge_3d block

Jinjie Ruan (1):
      drm/msm/adreno: Use IRQF_NO_AUTOEN flag in request_irq()

Jonathan Marek (2):
      drm/msm/dsi: improve/fix dsc pclk calculation
      drm/msm/dsi: fix 32-bit signed integer extension in pclk_rate calculation

Konrad Dybcio (1):
      drm/msm/dpu: Add support for MSM8996

Krzysztof Kozlowski (5):
      dt-bindings: display/msm: merge SC8280XP DPU into SC7280
      dt-bindings: display/msm: merge SM8250 DPU into SM8150
      dt-bindings: display/msm: merge SM8350 DPU into SC7280
      dt-bindings: display/msm: merge SM8450 DPU into SC7280
      dt-bindings: display/msm: merge SM8550 DPU into SC7280

Lukasz Luba (1):
      drm/msm/gpu: Check the status of registration to PM QoS

Mahadevan (4):
      dt-bindings: display/msm: Document MDSS on SA8775P
      dt-bindings: display/msm: Document the DPU for SA8775P
      drm/msm: mdss: Add SA8775P support
      drm/msm/dpu: Add SA8775P support

Puranam V G Tejaswi (2):
      drm/msm/a6xx: Add support for A663
      dt-bindings: display/msm/gmu: Add Adreno 663 GMU

Rob Clark (2):
      drm/msm/a6xx+: Insert a fence wait before SMMU table update
      Merge branch 'msm-fixes' into msm-next

Shen Lichuan (1):
      drm/msm: Fix some typos in comment

Soutrik Mukhopadhyay (2):
      dt-bindings: display: msm: dp-controller: document SA8775P compatible
      drm/msm/dp: Add DisplayPort controller for SA8775P

Thomas Zimmermann (1):
      drm/msm: Use video aperture helpers

Yang Li (1):
      drm/msm: Remove unneeded semicolon

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  10 +-
 .../bindings/display/msm/qcom,sc8280xp-dpu.yaml    | 122 ------
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |   4 +-
 .../bindings/display/msm/qcom,sm8250-dpu.yaml      |  99 -----
 .../bindings/display/msm/qcom,sm8350-dpu.yaml      | 120 -----
 .../bindings/display/msm/qcom,sm8450-dpu.yaml      | 139 ------
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 133 ------
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 Documentation/gpu/msm-preemption.rst               |  99 +++++
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  61 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 262 +++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 170 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  67 ++-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 456 +++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  27 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   | 210 +++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   | 187 ++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 338 ++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  12 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  14 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  68 +--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 243 ++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 109 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  50 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   3 +
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |  36 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   9 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |  16 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   4 +
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |   9 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_kms.c                      |   4 +-
 drivers/gpu/drm/msm/msm_kms.h                      |   6 -
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |   7 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 68 files changed, 3275 insertions(+), 1067 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
 create mode 100644 Documentation/gpu/msm-preemption.rst
 create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_preempt.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h

