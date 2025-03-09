Return-Path: <linux-arm-msm+bounces-50748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E4A58583
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 16:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 966E218812DB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 15:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB03187553;
	Sun,  9 Mar 2025 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ug6BZ3sn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C918836
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Mar 2025 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741535409; cv=none; b=Kg4BpJzG9Ga4C1OVYHZRFHr/5vrLozmH9Y18ZRniYIJJ4Y9bkVPiMzlX5GRSMFUlh3F8PruAn/eT9PfY22Z1ol9fT6FSPxMpt1ty42UMMTlcXqF9Q4WrkR2v727jS330mwnnbyGdlpgpbuSI8cA+aEQ/ni9bl5B8a+AncSilbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741535409; c=relaxed/simple;
	bh=XKNT+SKdsbP9za3LdkT+w1m5jFmt8w/lEA7Wm9xGVZY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Q9D1ePirbYaH4ZYpmtyCCE+qqawnDQiSaeKvUq+SjWIYZwsLhT8BeFZ9hC+zHsiTkG4Tr2qG6Gh72nKGVpd79Z9HlRly5O9XftKydLC7CKX7baLZktSMTykLWPWV+tnpWm/Qo1XjcY2CYoX6ily9W7I+czsN3VM/hNFrWTbo8ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ug6BZ3sn; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3cfcf8b7455so40557305ab.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Mar 2025 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741535406; x=1742140206; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jJcXZ9trdTNqFxMZYLU/u70BmgDco6sa+D79mgBy0Qw=;
        b=Ug6BZ3snc+asvMKFFR3khX6lvfICV3DfJuMITINFVYNL+xBfi30sQw1pcYfxTNPwjG
         Jt+i6s+MWWDPVTa+k7ZKYyuwLr8iJ1glDUQPK77kApGldplaCUDpR32EpEhGZxBcZtSD
         RdhuEJRUHT25mcNWnyVOun3yiGtqJHhfkPwJPMfwwhnKwTlMmpI/m+cQFefGgldOZHdz
         /rlqeID9BFPJqhRMd/76pXmTVIPPmVl34Ty5clNytOtA2Qoi6DCa0I3H/Rj1P9puOYBy
         u6u9sJ7dn3Vg6AJm3T52oF61YbG+52WrokPjoeoNovMFf0wTpw8v7kxJDYOHkuAeHn5h
         6HUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741535406; x=1742140206;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJcXZ9trdTNqFxMZYLU/u70BmgDco6sa+D79mgBy0Qw=;
        b=odRa0903JBNt2RdoFTiH//b8zV84rpMCk2bB52Cy49i0/ALNKrM2/vZQSBqMrg/lr9
         aa1pksObFIeZbj+0KRP2ZVgj1wua+LY8S2dRI/bt0wyG9aVzIxr0wg3yN0d4cFgQskEx
         CpiOPkuToj9fd21rF8ExiLrkzwSy3S3WTGu/f86RJq/k847WMkK+dTk9QeFRj98GN1Uy
         G9VTCIICz0E6K4DeILFpXfxKEA7CJDNUyjL4EGfbYsh0m5gIRn+9eMhOroY+nr1QmOmm
         vsmOj13avrC5xAB+xkiAV9VssZxkU84JW7Ktu+vUlLa7X6kvWdp4hqBpEk+Ap++hdnjx
         yfyg==
X-Forwarded-Encrypted: i=1; AJvYcCWOUwcyj3P5h4Ztg1RKSrfcoSpChz2A+EX9gMfjRzjytBWx+EJ1qzdzcaGffc/TDBs1eaIqlN6Rwbh1PCNN@vger.kernel.org
X-Gm-Message-State: AOJu0YwLtSSHe1tgU/tsx2Pv0+52wqFhBdlOxuJ+3pDV1eiWtWeJw0IX
	EzPXmyR+r7B8pBcxPEDpqxniq4H+X+4g8rZ0V1DPAx95w6NUJM3Wi3qEIOgAAztEHDB8xPPb4Ga
	sEOVGSvPHeBHFdbI/K7pfx3QF+pU=
X-Gm-Gg: ASbGnctPtEx2sF5AMrg2PYD0E4JF+px5aySblH+jK83jKE7l7CBZKwanRADPPPKyTn7
	MvGCPDKaaXQtKAapbdJZgf9zrOSCfiZUrv8eSjFR7f5T73bkzjGC0sP83oRGzrnkhxaHvG+zSYE
	dQqpCuCrwZMc6MF4h0VI9A0GQYUg==
X-Google-Smtp-Source: AGHT+IEbms11BSegqTUdKhGet+PUIUrL5HZbyOBEKiOVV6a1Z4tlKf9QazNuwaBSt3rBvwlXi5E4WQymmJoY4OajgxE=
X-Received: by 2002:a05:6e02:3f88:b0:3d1:7835:1031 with SMTP id
 e9e14a558f8ab-3d4418a5d8fmr146357935ab.7.1741535406343; Sun, 09 Mar 2025
 08:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 9 Mar 2025 08:49:54 -0700
X-Gm-Features: AQ5f1Jp3UI6jE69Er3NmP-65oP4gzzC-wGtCd7n9ydCJ5R5-RDsZhJ75yS10a2I
Message-ID: <CAF6AEGu-rbEFzQQ-me6qRLgBOJ=Xro1PL=PhtKJ-K9=bCaiK0w@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2025-03-09 for v6.15
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dave, Simona,

Pull for v6.15, as described below.

The following changes since commit 72d0af4accd965dc32f504440d74d0a4d18bf781:

  drm/msm/dp: Add support for LTTPR handling (2025-02-25 18:34:14 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2025-03-09

for you to fetch changes up to 83ee6d2ec52f1378f3473ee8657d559bebdbda44:

  dt-bindings: display/msm: dsi-controller-main: Add missing minItems
(2025-03-08 03:06:00 +0200)

----------------------------------------------------------------
Updates for v6.15

GPU:
- Fix obscure GMU suspend failure
- Expose syncobj timeline support
- Extend GPU devcoredump with pagetable info
- a623 support
- Fix a6xx gen1/gen2 indexed-register blocks in gpu snapshot / devcoredump

Display:
- Add cpu-cfg interconnect paths on SM8560 and SM8650
- Introduce KMS OMMU fault handler, causing devcoredump snapshot
- Fixed error pointer dereference in msm_kms_init_aspace()

DPU:
- Fix mode_changing handling
- Add writeback support on SM6150 (QCS615)
- Fix DSC programming in 1:1:1 topology
- Reworked hardware resource allocation, moving it to the CRTC code
- Enabled support for Concurrent WriteBack (CWB) on SM8650
- Enabled CDM blocks on all relevant platforms
- Reworked debugfs interface for BW/clocks debugging
- Clear perf params before calculating bw
- Support YUV formats on writeback
- Fixed double inclusion
- Fixed writeback in YUV formats when using cloned output, Dropped
  wb2_formats_rgb
- Corrected dpu_crtc_check_mode_changed and struct dpu_encoder_virt
  kerneldocs
- Fixed uninitialized variable in dpu_crtc_kickoff_clone_mode()

DSI:
- DSC-related fixes
- Rework clock programming

DSI PHY:
- Fix 7nm (and lower) PHY programming
- Add proper DT schema definitions for DSI PHY clocks

HDMI:
- Rework the driver, enabling the use of the HDMI Connector framework

Bindings:
- Added eDP PHY on SA8775P

Misc:
- mailmap/MAINTAINERS: update Dmitry's email addr

----------------------------------------------------------------
Abhinav Kumar (5):
      drm/msm: register a fault handler for display mmu faults
      drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
      drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
      drm/msm: switch msm_kms to use msm_iommu_disp_new()
      drm/msm/dpu: rate limit snapshot capture for mmu faults

Akhil P Oommen (1):
      drm/msm/a6xx: Fix stale rpmh votes from GPU

Dan Carpenter (3):
      drm/msm/gem: Fix error code msm_parse_deps()
      drm/msm/dpu: fix error pointer dereference in msm_kms_init_aspace()
      drm/msm/dpu: Fix uninitialized variable in dpu_crtc_kickoff_clone_mode()

Dmitry Baryshkov (32):
      drm/msm/dpu: don't use active in atomic_check()
      drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
      drm/msm/dpu: simplify dpu_encoder_get_topology() interface
      drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
      drm/msm/dpu: fill CRTC resources in dpu_crtc.c
      drm/msm/dpu: move resource allocation to CRTC
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: program HDMI timings during atomic_pre_enable
      drm/msm/hdmi: make use of the drm_connector_hdmi framework
      drm/msm/hdmi: get rid of hdmi_mode
      drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames
      drm/msm/hdmi: use DRM HDMI Audio framework
      drm/msm/dpu: rename CDM block definition
      drm/msm/dpu: enable CDM_0 for DPUs 5.x+
      drm/msm/dpu: enable CDM_0 for DPUs 1.x - 4.x
      drm/msm/dpu: enable CDM_0 for SC8280XP platform
      drm/msm/dpu: enable CDM_0 for X Elite platform
      drm/msm/dpu: extract bandwidth aggregation function
      drm/msm/dpu: remove duplicate code calculating sum of bandwidths
      drm/msm/dpu: change ib values to u32
      drm/msm/dpu: make fix_core_ab_vote consistent with fix_core_ib_vote
      drm/msm/dpu: also use KBps for bw_ctl output
      drm/msm/dpu: rename average bandwidth-related debugfs files
      drm/msm/dpu: drop core_clk_rate overrides from _dpu_core_perf_calc_crtc
      drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
      MAINTAINERS: use kernel.org alias
      mailmap: remap all addresses to kernel.org alias
      drm/msm/dpu: correct dpu_crtc_check_mode_changed docs
      drm/msm/dpu: correct struct dpu_encoder_virt docs
      drm/msm/dpu: drop wb2_formats_rgb

Eugene Lepshy (1):
      drm/msm/dsi: Allow values of 10 and 12 for bits per component

Fange Zhang (1):
      drm/msm/dpu: Add writeback support for SM6150

Haoxiang Li (1):
      drm/msm/dsi: Add check for devm_kstrdup()

Jessica Zhang (14):
      drm/msm/dpu: Add CWB to msm_display_topology
      drm/msm/dpu: Require modeset if clone mode status changes
      drm/msm/dpu: Fail atomic_check if multiple outputs request CDM block
      drm/msm/dpu: Reserve resources for CWB
      drm/msm/dpu: Configure CWB in writeback encoder
      drm/msm/dpu: Support CWB in dpu_hw_ctl
      drm/msm/dpu: Adjust writeback phys encoder setup for CWB
      drm/msm/dpu: Start frame done timer after encoder kickoff
      drm/msm/dpu: Skip trigger flush and start for CWB
      drm/msm/dpu: Reorder encoder kickoff for CWB
      drm/msm/dpu: Set possible clones for all encoders
      drm/msm/dpu: Clear perf params before calculating bw
      drm/msm/dpu: Support YUV formats on writeback for DPU 5.x+
      drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG

Jiapeng Chong (1):
      drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header

Jie Zhang (4):
      drm/msm/a6xx: Split out gpucc register block
      drm/msm/a6xx: Fix gpucc register block for A621
      drm/msm/a6xx: Add support for Adreno 623
      dt-bindings: display/msm/gmu: Add Adreno 623 GMU

Krzysztof Kozlowski (14):
      drm/msm/dpu: Simplify using local 'ctl' variable
      drm/msm: Use str_enable_disable-like helpers
      dt-bindings: display/msm/dsi-phy: Add header with exposed clock IDs
      drm/msm/dsi/phy: Use the header with clock IDs
      drm/msm/dsi/phy: Program clock inverters in correct register
      drm/msm/dsi: Drop redundant NULL-ifying of clocks on error paths
      drm/msm/dsi: Simplify with dev_err_probe()
      drm/msm/dsi: Minor whitespace and style cleanup
      drm/msm/dsi: Drop unnecessary -ENOMEM message
      drm/msm/dsi/phy: Use dsi_pll_cmn_clk_cfg1_update() when registering PLL
      drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving
      dt-bindings: display/msm: qcom, sa8775p-mdss: Add missing eDP phy
      dt-bindings: display/msm: dsi-controller-main: Combine if:then: entries
      dt-bindings: display/msm: dsi-controller-main: Add missing minItems

Marijn Suijten (4):
      drm/msm/dpu: Fall back to a single DSC encoder (1:1:1) on small SoCs
      drm/msm/dsi: Use existing per-interface slice count in DSC timing
      drm/msm/dsi: Set PHY usescase (and mode) before registering DSI host
      drm/msm/dpu: Remove arbitrary limit of 1 interface in DSC topology

Neil Armstrong (2):
      dt-bindings: display: qcom,sm8550-mdss: explicitly document
mdp0-mem and cpu-cfg interconnect paths
      dt-bindings: display: qcom,sm8650-mdss: explicitly document
mdp0-mem and cpu-cfg interconnect paths

Rob Clark (3):
      drm/msm: Expose DRIVER_SYNCOBJ_TIMELINE
      drm/msm: Extend gpu devcore dumps with pgtbl info
      drm/msm/a6xx: Fix a6xx indexed-regs in devcoreduump

 .mailmap                                           |   9 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |  70 +--
 .../bindings/display/msm/dsi-phy-common.yaml       |   2 +
 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  32 +-
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     |  14 +-
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     |  13 +-
 MAINTAINERS                                        |   3 +-
 drivers/gpu/drm/msm/Kconfig                        |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  29 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  72 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  15 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  17 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  10 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |   5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |   5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  19 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |   2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 140 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 233 +++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 468 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  40 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 298 ++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  14 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c           |   3 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  25 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   4 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   5 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 193 +++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  32 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  21 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    | 120 +-----
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  31 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c              | 124 +++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 324 ++++++++++----
 drivers/gpu/drm/msm/msm_atomic.c                   |  15 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   1 +
 drivers/gpu/drm/msm/msm_dsc_helper.h               |  11 -
 drivers/gpu/drm/msm/msm_gem_submit.c               |   2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   9 +
 drivers/gpu/drm/msm/msm_gpu.h                      |   8 +
 drivers/gpu/drm/msm/msm_iommu.c                    |  54 ++-
 drivers/gpu/drm/msm/msm_kms.c                      |  19 +-
 drivers/gpu/drm/msm/msm_kms.h                      |  10 +
 drivers/gpu/drm/msm/msm_mmu.h                      |   4 +-
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   1 +
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |   2 +-
 include/dt-bindings/clock/qcom,dsi-phy-28nm.h      |   9 +
 88 files changed, 1757 insertions(+), 1002 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h

