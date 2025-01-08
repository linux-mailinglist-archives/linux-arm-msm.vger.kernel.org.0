Return-Path: <linux-arm-msm+bounces-44294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46327A05223
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDCA21885569
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2941719B3EC;
	Wed,  8 Jan 2025 04:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEzxPwaU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BDB2594B3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 04:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311147; cv=none; b=Lc3yaok+J6897A0SoONmPJxEAFRp7JLoLS2sDmFmEUe6o7hvZ8Nkbz47vPNG9WD2BUCp8Id8ZI5L1vD3UiyEVbQEp15md22B5W4KBFUBVdOTF6l4/+8138KBWt3drlp08+9o4+huGDpb2oURbEC2YLG3pgA/UuRbPlRt76kSlwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311147; c=relaxed/simple;
	bh=eslamAAklfLT/Sl8SiRoSCEkm18+7ntiQJsmy4zX5cM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=e6b1eUWsJNTCckZmS2MxDA9/wzIUpl/dJYUHZEPJSLLD9pIvn1XWriDUVe2KseGBkZqrVltzlnu9l9z316CW+y1jwJCADVimvZrt1fLMq2e0FwlTbm25CKDnQJO+dTKhGpae41mne7HVXPOyj10z91t+p8AbdfCmaNdRrO9ikYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEzxPwaU; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a7e108b491so141266775ab.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 20:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736311143; x=1736915943; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lIvYFRseMfK/GNG4t25XfPFdktK+YowDXfndJwAtRoo=;
        b=SEzxPwaU3HGbKLonhjJEoNk207gqJyhu47jTPoNbHtjGEz3/rjBpIUFqcSqrDGgvjM
         +RQOfJ1LszWz7Ll5t+QnbKMHrEcjcNucCEMDQUleNI2vWu3WlV+RH1EO/EytovCjdfO1
         YgsESjO1cGXfxo3nHbWU4px4KTx1qRoJwQHCwqEe0DtzCo7QuN7/ZvhW4rH8iY3+12NG
         TEiiKQpISfte7/4bPt1Gu7b1DG95g4uVyRwE4tEPtQNt8J+B6ViTct6eJ7kdyPnH9aDo
         PhthWUTvDJ2GxXObYnRpxB11XWa1itW7m+u2ma0OV+qAlpQHPC2PGm8DPg2iMZDKZE/B
         1jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736311143; x=1736915943;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIvYFRseMfK/GNG4t25XfPFdktK+YowDXfndJwAtRoo=;
        b=OxsPx3G+AbfdKKtEyyOY0RTnCeGfR1cSyFYh2MVLY3q/lo03ioV0zyn3H4LAwfBvy0
         yOfldXtqMLiqQA/Lnxlgwglde7tzc+3u3SszFF88gqUZRw7LlvuELiWbK3FqByhF5O9N
         FbJ4eXdgSKLDZWTmbenY41pLl1zTvxgb+xQkkLj9NfPjdmeiBqSH4NWNhgbdlEEYk3Ig
         pJJh5puR8SLvCjEFjAzBz3ufV3vtu9uL06zx6cQZLdPxoZH1G4/AawCLQcI8Ee20hQcB
         bJ3GarsQsbtZSkYBdruomPegkTHlsAWWEtZ68IHX6mS+z87dX0wiLzdjbExjN+NysCxh
         Ok+A==
X-Forwarded-Encrypted: i=1; AJvYcCWlSa4lidOQhWlqQC+ijewvilDrGxPcew3IpDMRyf+hijxQsCnF2oiuJ1wX6RaZ6l40nabOhYwlQiFpHHzS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz34X3f/WlHJyh6IncRgH1wEzIU3MzImAO/s+dPMl+0nE/7ob8
	oT6oRbZOu3QcoJIbLYarxg+ZzIG1qsHaAg9ARUu62hHj0Ge3pvAsNiJ4yLJJ0FE2gaUv17A+Ol2
	r1pohIMePqFH2OJNP0qyMUjCJL4c=
X-Gm-Gg: ASbGncunPJm3ywE/T62zC83ijxOoZrhjUoikKmeWZGf39FQ60xTgC7lNTlgojo74QcJ
	0cMsIb7w93PkGEpEvAiJPsRzpT5G2hJghHYe83A==
X-Google-Smtp-Source: AGHT+IGH5abcEvMRUBBNOcNRE0CBjvHvUY5DlfcMIeUS08jrRzcKPS7oAJaDHssW2NxQaVCJxWw/TtAewdABbavPT3s=
X-Received: by 2002:a92:cda7:0:b0:3a3:b5ba:bfba with SMTP id
 e9e14a558f8ab-3ce3aa71eb7mr12804315ab.15.1736311143266; Tue, 07 Jan 2025
 20:39:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Jan 2025 20:38:51 -0800
X-Gm-Features: AbW1kvZGZuoDx_pa6aDwyo8IOwFycNOlO8St-UPnv0En-d7JC85Bgu9QFJCu57w
Message-ID: <CAF6AEGsutUu4ff6OpXNXxqf1xaV0rV6oV23VXNRiF0_OEfe72Q@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2025-01-07 for v6.14
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dave, Simona,

Pull for v6.14, as described below.  Has a merge from the pm/opp tree
to resolve a dependency on the newly added dev_pm_opp_get_bw()

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/msm.git tags/drm-msm-next-2025-01-07

for you to fetch changes up to 866e43b945bf98f8e807dfa45eca92f931f3a032:

  drm/msm: UAPI error reporting (2025-01-03 07:20:28 -0800)

----------------------------------------------------------------
Updates for v6.14

MDSS:
- properly described UBWC registers
- added SM6150 (aka QCS615) support

MDP4:
- several small fixes

DPU:
- added SM6150 (aka QCS615) support
- enabled wide planes if virtual planes are enabled (by using two
SSPPs for a single plane)
- fixed modes filtering for platforms w/o 3DMux
- fixed DSPP DSPP_2 / _3 links on several platforms
- corrected DSPP definitions on SDM670
- added CWB hardware blocks support
- added VBIF to DPU snapshots
- dropped struct dpu_rm_requirements

DP:
- reworked DP audio support

DSI:
- added SM6150 (aka QCS615) support

GPU:
- Print GMU core fw version
- GMU bandwidth voting for a740 and a750
- Expose uche trap base via uapi
- UAPI error reporting

----------------------------------------------------------------
Abhinav Kumar (6):
      drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
      drm/msm/dp: dont call dp_catalog_ctrl_mainlink_ctrl in
dp_ctrl_configure_source_params()
      drm/msm/dp: disable the opp table request even for dp_ctrl_off_link()
      drm/msm/dpu: check dpu_plane_atomic_print_state() for valid sspp
      drm/msm/dpu: filter out too wide modes if no 3dmux is present
      dt-bindings: display: msm: dp: update maintainer entry

Arnd Bergmann (1):
      drm/msm: fix -Wformat-security warnings

Colin Ian King (1):
      drm/msm/a5xx: remove null pointer check on pdev

Dan Carpenter (2):
      opp: core: Fix off by one in dev_pm_opp_get_bw()
      drm/msm/gem: prevent integer overflow in msm_ioctl_gem_submit()

Danylo Piliaiev (1):
      drm/msm: Expose uche trap base via uapi

Dmitry Baryshkov (26):
      drm/msm/dp: set safe_to_exit_level before printing it
      drm/msm/dp: fix msm_dp_utils_pack_sdp_header interface
      dt-bindings: display/msm: qcom,sa8775p-mdss: fix the example
      drm/msm/dpu1: don't choke on disabling the writeback connector
      drm/msm/mdss: define bitfields for the UBWC_STATIC register
      drm/msm/mdss: reuse defined bitfields for UBWC 2.0
      drm/msm/mdss: use boolean values for macrotile_mode
      drm/msm/dpu: add support for virtual planes
      drm/msm/dpu: allow using two SSPP blocks for a single plane
      drm/msm/dpu: include SSPP allocation state into the dumped state
      drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
      drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
      drm/msm/dp: drop obsolete audio headers access through catalog
      drm/msm/dp: drop struct msm_dp_panel_in
      drm/msm/dp: stop passing panel to msm_dp_audio_get()
      drm/msm/dpu: provide DSPP and correct LM config for SDM670
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
      drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
      drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
      drm/msm: don't clean up priv->kms prematurely
      drm/msm/mdp4: correct LCDC regulator name
      drm/msm/dpu: get rid of struct dpu_rm_requirements

Esha Bharadwaj (3):
      drm/msm/dpu: Add CWB entry to catalog for SM8650
      drm/msm/dpu: add devcoredumps for cwb registers
      drm/msm/dpu: add CWB support to dpu_hw_wb

Jessica Zhang (4):
      drm/msm/dpu: Add VBIF to DPU snapshot
      drm/msm/dpu: Specify dedicated CWB pingpong blocks
      drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB block
      drm/msm/dpu: Add RM support for allocating CWB

Konrad Dybcio (2):
      drm/msm: registers: Add GMU FW version register
      drm/msm/a6xx: Print GMU core firmware version at boot

Li Liu (7):
      dt-bindings: display/msm: Add SM6150 DSI phy
      dt-bindings: display/msm: dsi-controller-main: Document SM6150
      dt-bindings: display/msm: Add SM6150 MDSS & DPU
      drm/msm: mdss: Add SM6150 support
      drm/msm/dpu: Add SM6150 support
      drm/msm/dsi: Add dsi phy support for SM6150
      drm/msm/dsi: Add support for SM6150

Neil Armstrong (8):
      opp: core: implement dev_pm_opp_get_bw
      OPP: add index check to assert to avoid buffer overflow in _read_freq()
      OPP: fix dev_pm_opp_find_bw_*() when bandwidth table not initialized
      drm/msm: adreno: add defines for gpu & gmu frequency table sizes
      drm/msm: adreno: add plumbing to generate bandwidth vote table for GMU
      drm/msm: adreno: dynamically generate GMU bw table
      drm/msm: adreno: find bandwidth index of OPP and set it along freq index
      drm/msm: adreno: enable GMU bandwidth for A740 and A750

Rex Nie (1):
      drm/msm/hdmi: simplify code in pll_get_integloop_gain

Rob Clark (2):
      Merge remote-tracking branch 'pm/opp/linux-next' into HEAD
      drm/msm: UAPI error reporting

Stephan Gerhold (1):
      drm/msm/dpu: fix x1e80100 intf_6 underrun/vsync interrupt

Sui Jingfeng (1):
      drm/msm: Check return value of of_dma_configure()

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |   3 +-
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      | 108 ++++++
 .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 245 +++++++++++++
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  15 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  22 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 203 ++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |  26 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  54 ++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   5 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  24 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   7 +
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  31 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  54 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   2 +
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 254 +++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   6 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  63 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c         |  75 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h         |  70 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  50 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 396 +++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 175 ++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |   3 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |   2 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  | 275 +++-----------
 drivers/gpu/drm/msm/dp/dp_audio.h                  |   3 -
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 159 +++------
 drivers/gpu/drm/msm/dp/dp_catalog.h                |  35 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  11 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  26 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  11 +-
 drivers/gpu/drm/msm/dp/dp_utils.c                  |  10 +-
 drivers/gpu/drm/msm/dp/dp_utils.h                  |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |   2 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   7 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |  67 ++--
 drivers/gpu/drm/msm/msm_kms.c                      |   1 -
 drivers/gpu/drm/msm/msm_mdss.c                     |  79 ++--
 drivers/gpu/drm/msm/msm_mdss.h                     |   4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |   2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   5 +
 drivers/gpu/drm/msm/registers/display/mdss.xml     |  11 +-
 drivers/opp/core.c                                 |  82 ++++-
 include/linux/pm_opp.h                             |   7 +
 include/uapi/drm/msm_drm.h                         |   1 +
 73 files changed, 2137 insertions(+), 704 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h

