Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532EA2C5607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 14:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390731AbgKZNmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 08:42:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390730AbgKZNmq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 08:42:46 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F9BC0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 05:42:46 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p19so3691788wmg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 05:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Wr4Bxw8H33EAPectTLbZPdlRo8G26k++6vEtN3bwB8=;
        b=q+NMZJINq6ieh2W4TjGv56Kwx/uNwqqp0i9VjLEKIK79Bxlc2HxD0yM2qNDEEA3fuf
         kokcqjDPD9Z5IaMxVaADtrv5QfmqtT1QLqqrrwv1nxNtp/G6xDXWahjFMJX9B/abkpHK
         pUyhNC9/WtasemkYZq62Oai0HXg9oOXHYss7ttwRN4XcrMpHQLiy73k3fvyhzmi4ipGV
         gBviUtaGa0WcePYzC7U2fb4SAXcDWpeNYw+GxAV5EeSudoXh8Bbzyg6y2OfmEEm/Q++e
         OKbD1+vy8IS+4Z4nQznLOTeeU8eO6GhccajQPfuLNNvcakDoYzTqKE5tJ2bBlfFrZvFG
         C9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Wr4Bxw8H33EAPectTLbZPdlRo8G26k++6vEtN3bwB8=;
        b=jJwvlWuZB71ttHlRwIxpyg6qd3bWRrCf/5pl68Nu5v0LMeJUHohCNq5uJaJtxk7SM2
         Hh979FHqkOGn5+vA7m6SlwRcv+TilNOPXhvK0NMOxGdUEBFhH+cTVt+IbXDENcmxtLNR
         Lsxtsu+YcC1lty49DgBl9t9E6HmIDaNIQ3/TM8n99rGbhom2PgvFDCqxxiKlXFvLkIbZ
         Z2WkxzCiCJRJDkVB4wq4zi8A9OCZNGr4YiCJBbRPbzf353xPCjoESGqbeYNcCRLLmdz7
         sbVr8fqjhegrVkg0NLbojJpBp1C+vARs6HpCkzutTiF8YfqghNWwgtSPEYjkSRDc+Akx
         ZYCg==
X-Gm-Message-State: AOAM533DqEfmrYTHEuJsWSRWswaUH8tGHVRHVdOEYsJssUVMzhv91JXB
        YXzqLmb1Lyz93qTEwzb1vik1ZQ==
X-Google-Smtp-Source: ABdhPJzk2EfTsWSffeiauWh9HbHKfetZyTfG7L80Wtz3zRZAdjY54+cS4cpnbpXqPssBE1T3N9esnQ==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr3492343wmj.169.1606398163875;
        Thu, 26 Nov 2020 05:42:43 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:42:43 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>,
        freedreno@lists.freedesktop.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Harry Wentland <harry.wentland@amd.com>,
        Huang Rui <ray.huang@amd.com>, Leo Li <sunpeng.li@amd.com>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Shubhashree Dhar <dhar@codeaurora.org>
Subject: [PATCH 00/40] [Set 10] Rid W=1 warnings from GPU
Date:   Thu, 26 Nov 2020 13:42:00 +0000
Message-Id: <20201126134240.3214176-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

500 out of 5000 left!

Lee Jones (40):
  drm/amd/pm/powerplay/smumgr/tonga_smumgr: Remove set but unused
    variable 'res'
  drm/amd/pm/powerplay/smumgr/polaris10_smumgr: Make function called by
    reference static
  drm/amd/pm/powerplay/smumgr/ci_smumgr: Remove set but unused variable
    'res'
  drm/amd/pm/powerplay/smumgr/iceland_smumgr: Make function called by
    reference static
  drm/amd/pm/powerplay/smumgr/vegam_smumgr: Make function called by
    reference static
  drm/amd/pm/powerplay/smumgr/smu9_smumgr: Include our own header
    containing our prototypes
  drm/amd/pm/powerplay/smumgr/fiji_smumgr: Demote kernel-doc format
    abuse
  drm/amd/pm/powerplay/hwmgr/hardwaremanager: Remove unused
    'phm_set_*()' functions
  drm/amd/pm/powerplay/hwmgr/hwmgr: Move 'smu8_init_function_pointers()'
    prototype to shared header
  drm/amd/pm/inc/pp_thermal: Mark 'SMU7Thermal{WithDelay}Policy' as
    __maybe_unused
  drm/amd/pm/powerplay/hwmgr/ppevvmath: Place variable declaration under
    same clause as its use
  drm/amd/pm/powerplay/hwmgr/ppatomctrl: Remove unused variable
    'fPowerDPMx'
  drm/amd/pm/powerplay/hwmgr/hwmgr: Move
    'smu7_init_function_pointers()'s prototype to header
  drm/amd/pm/powerplay/hwmgr/ppatomfwctrl: Demote kernel-doc formatting
    abuses
  drm/msm/disp/dpu1/dpu_hw_interrupts: Demote kernel-doc formatting
    misuse
  drm/amd/pm/powerplay/smumgr/iceland_smumgr: Remove unused variable
    'res'
  drm/amd/pm/powerplay/hwmgr/hardwaremanager: Fix function header
    related formatting issues
  drm/amd/pm/powerplay/hwmgr/process_pptables_v1_0: Convert to proper
    kernel-doc format
  drm/amd/pm/powerplay/hwmgr/ppatomctrl: Fix a myriad of kernel-doc
    issues
  drm/amd/pm/powerplay/hwmgr/vega10_processpptables: Make function
    invoked by reference static
  drm/amd/pm/powerplay/hwmgr/smu7_hwmgr: Fix a whole bunch of historical
    function doc issues
  drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Remove set but unused
    variable 'result'
  drm/amd/pm/powerplay/hwmgr/smu7_thermal: Repair formatting in a bunch
    of function docs
  drm/amd/pm/powerplay/hwmgr/vega10_thermal: Fix a bunch of dated
    function doc formatting
  drm/amd/pm/powerplay/hwmgr/pp_psm: Remove unused variable 'result'
  drm/amd/pm/powerplay/hwmgr/hwmgr: Move 'vega12_hwmgr_init()'s
    prototype to shared header
  drm/amd/pm/powerplay/hwmgr/hwmgr: Move 'vega20_hwmgr_init()'s
    prototype to shared header
  drm/amd/pm/powerplay/hwmgr/smu_helper: Demote or fix kernel-doc
    headers
  drm/amd/pm/powerplay/hwmgr/vega20_thermal: Fix some outdated function
    documentation
  drm/amd/pm/powerplay/hwmgr/vega12_thermal: Fix some outdated function
    documentation
  drm/amd/pm/powerplay/kv_dpm: Remove unused variable 'ret'
  drm/amd/display/amdgpu_dm/amdgpu_dm: Mark 'link_bandwidth_kbps' as
    __maybe_unused
  drm/amd/display/dc/inc/hw/dpp: Mark 'dpp_input_csc_matrix' as
    __maybe_unused
  drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Use 'gnu_printf' format
    notation
  drm/amd/display/amdgpu_dm/amdgpu_dm_color: Demote a misuse and fix
    another kernel-doc header
  drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu: Mark local functions
    invoked by reference as static
  drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu: Remove unused function
    'pp_nv_set_pme_wa_enable()'
  drm/amd/display/dc/basics/conversion: Include header containing our
    prototypes
  drm/amd/display/dc/basics/fixpt31_32: Remove unused variable
    'dc_fixpt_pi'
  drm/amd/display/dc/basics/vector: Make local function
    'dal_vector_presized_costruct' static

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c  |  28 +--
 .../drm/amd/display/dc/basics/conversion.c    |   1 +
 .../drm/amd/display/dc/basics/fixpt31_32.c    |   1 -
 .../gpu/drm/amd/display/dc/basics/vector.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |   2 +-
 drivers/gpu/drm/amd/pm/inc/hwmgr.h            |   4 +
 drivers/gpu/drm/amd/pm/inc/pp_thermal.h       |   4 +-
 .../amd/pm/powerplay/hwmgr/hardwaremanager.c  |  56 ++----
 .../gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c    |   4 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c   |   3 +-
 .../drm/amd/pm/powerplay/hwmgr/ppatomctrl.c   |  84 +++++----
 .../drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c |  24 +--
 .../drm/amd/pm/powerplay/hwmgr/ppevvmath.h    |   6 +-
 .../powerplay/hwmgr/process_pptables_v1_0.c   |  81 ++++-----
 .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 166 +++++++++---------
 .../drm/amd/pm/powerplay/hwmgr/smu7_thermal.c | 103 ++++++-----
 .../drm/amd/pm/powerplay/hwmgr/smu_helper.c   |   8 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c |   3 +-
 .../powerplay/hwmgr/vega10_processpptables.c  |   2 +-
 .../amd/pm/powerplay/hwmgr/vega10_thermal.c   | 131 +++++++-------
 .../amd/pm/powerplay/hwmgr/vega12_thermal.c   |  82 ++++-----
 .../amd/pm/powerplay/hwmgr/vega20_thermal.c   |  54 +++---
 drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c     |  18 +-
 .../drm/amd/pm/powerplay/smumgr/ci_smumgr.c   |   3 +-
 .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c |   2 +-
 .../amd/pm/powerplay/smumgr/iceland_smumgr.c  |   5 +-
 .../pm/powerplay/smumgr/polaris10_smumgr.c    |   2 +-
 .../drm/amd/pm/powerplay/smumgr/smu9_smumgr.c |   1 +
 .../amd/pm/powerplay/smumgr/tonga_smumgr.c    |   9 +-
 .../amd/pm/powerplay/smumgr/vegam_smumgr.c    |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |   4 +-
 34 files changed, 409 insertions(+), 493 deletions(-)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Evan Quan <evan.quan@amd.com>
Cc: freedreno@lists.freedesktop.org
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Shubhashree Dhar <dhar@codeaurora.org>
-- 
2.25.1

