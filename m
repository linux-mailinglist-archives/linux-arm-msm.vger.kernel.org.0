Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB102EF8BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 21:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbhAHUPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 15:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbhAHUPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 15:15:44 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0574BC061381
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 12:15:04 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id a6so8730996wmc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 12:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QeXXbkShC0KTgz4n+dtT2axDbKBu7SEofVtSgTaHdlA=;
        b=EpUldkEu63PuzXZYe8Jr/P+khJQOipAojDEohRiyHCTrwR0wQhBpn8uRQqxNWXdbFI
         L+dS4H5R6ZR6Nq1EnbNFG4xu1Ac1uz9nb8rmmiRJbO1/yFtULhfWjvOc+2S1rkJnnPpu
         8Cwz3Ikl8cVre8c+OOmS2DtGaPSKre5SgJiCEFW9g5mO9CXo9AnmUwcr8T0m/4djIU/b
         ePHEJmMElk7oomdFJSXWhoidk98MWCrwHKc57ySEpTtXRKe6wXQwusjsoBXeE9/zJaH8
         VeS5jFRmNpp+hqFVRac36sBQtcWD0EQMs+ioyWScgxcBIkYyXe3EQSenusSG1dL1dbhZ
         0ZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QeXXbkShC0KTgz4n+dtT2axDbKBu7SEofVtSgTaHdlA=;
        b=iQfn4z3Y1VDVhIsc1kODaiy5k9bSfwfZt36Go2wFzz1An5Fvh7xVWZvNXgKvlxLyyI
         PZbHbBwuwskkaeBm4iIIZMTFBlw8yoYPPjv96iy53ygdXNpNQPpbJroviEX11MpJeJpv
         sateVYeZErolXhO148D0Pp/cNd4ljvwBO4eKUl65DlpJe8eytOzAPpjMYJjJWGaP+fbF
         f40qInVtKLB6NVl20PFA0mgQc6n2g+h190ILHM4e0XJL1w9QUbLoHuBxsH9FZenVSjV3
         m1gGt33Xi1XFewothYqGajaPeOrJ0/SS+fljKmR2L3b+tLnstDseZxD7JvszUpEuPLNP
         uL2w==
X-Gm-Message-State: AOAM531Ec8nVj7fnFwTJ8o3YiqbJwCmVPNlgSkaDdts9poxHMy2XYo2P
        LX+UEjErPoBZOljdTwRyWOdjyg==
X-Google-Smtp-Source: ABdhPJwl3kU/DFu/+SHxqnLdc9NJoAEBkx5a1X6cfHiA0SIPK8+omrC1+fEQ6fahQl61Z3lNinh7/g==
X-Received: by 2002:a1c:c308:: with SMTP id t8mr4593743wmf.22.1610136902655;
        Fri, 08 Jan 2021 12:15:02 -0800 (PST)
Received: from dell.default ([91.110.221.229])
        by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 12:15:01 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Charlene Liu <Charlene.Liu@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Eric Bernstein <eric.bernstein@amd.com>,
        Eryk Brol <eryk.brol@amd.com>, Evan Quan <evan.quan@amd.com>,
        Feifei Xu <Feifei.Xu@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        freedreno@lists.freedesktop.org, George Shen <george.shen@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Igor Kravchenko <Igor.Kravchenko@amd.com>,
        Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Leo Li <sunpeng.li@amd.com>, Lewis Huang <Lewis.Huang@amd.com>,
        linux-arm-msm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mauro Rossi <issor.oruam@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mikita Lipski <mikita.lipski@amd.com>,
        nouveau@lists.freedesktop.org,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Wyatt Wood <wyatt.wood@amd.com>
Subject: [PATCH 00/40] [Set 11] Rid W=1 warnings from GPU
Date:   Fri,  8 Jan 2021 20:14:17 +0000
Message-Id: <20210108201457.3078600-1-lee.jones@linaro.org>
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

300 out of 5000 left!

Lee Jones (40):
  drm/nouveau/nvkm/subdev/bios/init: Demote obvious abuse of kernel-doc
  drm/nouveau/dispnv50/disp: Remove unused variable 'ret'
  drm/msm/dp/dp_display: Remove unused variable 'hpd'
  drm/amd/amdgpu/amdgpu_ih: Update 'amdgpu_ih_decode_iv_helper()'s
    function header
  drm/amd/amdgpu/vega20_ih: Add missing descriptions for 'ih' and fix
    spelling error
  drm/amd/pm/powerplay/hwmgr/process_pptables_v1_0: Provide description
    of 'call_back_func'
  drm/amd/pm/powerplay/hwmgr/ppatomctrl: Fix documentation for
    'mpll_param'
  drm/amd/pm/powerplay/hwmgr/vega12_hwmgr: Fix legacy function header
    formatting
  drm/amd/pm/powerplay/hwmgr/vega20_hwmgr: Fix legacy function header
    formatting
  drm/amd/pm/powerplay/hwmgr/smu7_hwmgr: Fix formatting and spelling
    issues
  drm/amd/pm/powerplay/hwmgr/hwmgr: Move prototype into shared header
  drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Fix a bunch of kernel-doc
    formatting issues
  drm/amd/display/dc/basics/conversion: Demote obvious kernel-doc abuse
  drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs: Demote non-kernel-doc
    comment blocks
  drm/amd/display/dc/bios/command_table_helper: Fix kernel-doc
    formatting
  drm/amd/display/dc/bios/command_table_helper2: Fix legacy formatting
    problems
  drm/amd/display/dc/bios/bios_parser: Make local functions static
  drm/amd/display/dc/bios/bios_parser: Fix a whole bunch of legacy doc
    formatting
  drm/amd/display/dc/bios/command_table: Remove unused variable
  include: drm: drm_atomic: Make use of 'new_plane_state'
  drm/amd/display/dc/calcs/dce_calcs: Remove unused variables
    'v_filter_init_mode' and 'sclk_lvl'
  drm/amd/display/dc/bios/bios_parser2: Fix some formatting issues and
    missing parameter docs
  drm/amd/display/dc/dce/dce_audio: Make function invoked by reference
    static
  drm/amd/display/dc/dce/dce_stream_encoder: Remove unused variable
    'regval'
  drm/amd/display/dc/dce/dce_link_encoder: Make functions invoked by
    reference static
  drm/amd/display/dc/dce/dce_clock_source: Fix formatting/spelling of
    worthy function headers
  drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Fix worthy function headers,
    demote barely documented one
  drm/amd/display/dc/dce/dce_transform: Remove 3 unused/legacy variables
  drm/amd/display/dc/dce/dce_dmcu: Staticify local function call
    'dce_dmcu_load_iram'
  drm/amd/display/dc/dce/dce_dmcu: Move 'abm_gain_stepsize' to only
    source file it's used in
  drm/amd/display/dc/dce/dce_opp: Make local functions and ones invoked
    by reference static
  drm/amd/display/dc/dce/dce_aux: Remove unused function
    'get_engine_type'
  drm/nouveau/nvkm/subdev/volt/gk20a: Demote non-conformant kernel-doc
    headers
  drm/amd/display/dc/bios/bios_parser: Fix misspelling of function
    parameter
  drm/amd/display/dc/bios/command_table: Remove unused variable and
    associated comment
  drm/amd/display/dc/dce/dce_i2c_hw: Make functions called by reference
    static
  drm/amd/display/dc/dce/dce_i2c_sw: Make a bunch of local functions
    static
  drm/amd/display/dc/dce/dce_panel_cntl: Remove unused variables
    'bl_pwm_cntl' and 'pwm_period_cntl'
  drm/amd/display/dc/dce/dmub_psr: Demote non-conformant kernel-doc
    headers
  drm/amd/display/dc/gpio/hw_factory: Delete unused function
    'dal_hw_factory_destroy'

 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c        |   2 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c        |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   4 +-
 .../drm/amd/display/dc/basics/conversion.c    |   9 +-
 .../gpu/drm/amd/display/dc/bios/bios_parser.c | 119 +++++-----
 .../drm/amd/display/dc/bios/bios_parser2.c    |  29 ++-
 .../drm/amd/display/dc/bios/command_table.c   |  16 +-
 .../display/dc/bios/command_table_helper.c    |  20 +-
 .../display/dc/bios/command_table_helper2.c   |  20 +-
 .../gpu/drm/amd/display/dc/calcs/dce_calcs.c  |   8 +-
 .../gpu/drm/amd/display/dc/dce/dce_audio.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c  |   6 -
 .../drm/amd/display/dc/dce/dce_clock_source.c |  57 +++--
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c |   6 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.h |   2 -
 .../gpu/drm/amd/display/dc/dce/dce_i2c_hw.c   |   4 +-
 .../gpu/drm/amd/display/dc/dce/dce_i2c_sw.c   |   9 +-
 .../drm/amd/display/dc/dce/dce_link_encoder.c |   6 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_opp.c  |   8 +-
 .../drm/amd/display/dc/dce/dce_panel_cntl.c   |   8 +-
 .../amd/display/dc/dce/dce_stream_encoder.c   |   3 +-
 .../drm/amd/display/dc/dce/dce_transform.c    |  13 --
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |  22 +-
 .../gpu/drm/amd/display/dc/gpio/hw_factory.c  |  14 --
 .../gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c    |   2 +-
 .../drm/amd/pm/powerplay/hwmgr/ppatomctrl.c   |   4 +-
 .../powerplay/hwmgr/process_pptables_v1_0.c   |   1 +
 .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   |   4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 137 ++++++------
 .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.h |   1 +
 .../drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c |  11 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c |  11 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   3 -
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   3 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   | 204 ++++++------------
 .../gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c  |   4 +-
 include/drm/drm_atomic.h                      |   3 +-
 37 files changed, 325 insertions(+), 455 deletions(-)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Anthony Koo <Anthony.Koo@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Charlene Liu <Charlene.Liu@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Eric Bernstein <eric.bernstein@amd.com>
Cc: Eryk Brol <eryk.brol@amd.com>
Cc: Evan Quan <evan.quan@amd.com>
Cc: Feifei Xu <Feifei.Xu@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: freedreno@lists.freedesktop.org
Cc: George Shen <george.shen@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Igor Kravchenko <Igor.Kravchenko@amd.com>
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Lewis Huang <Lewis.Huang@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Mauro Rossi <issor.oruam@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: nouveau@lists.freedesktop.org
Cc: Qinglang Miao <miaoqinglang@huawei.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Wyatt Wood <wyatt.wood@amd.com>
-- 
2.25.1

