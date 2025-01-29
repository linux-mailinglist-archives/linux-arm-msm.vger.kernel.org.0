Return-Path: <linux-arm-msm+bounces-46545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5AA2235F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A538167D57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1781E0B82;
	Wed, 29 Jan 2025 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SA6q+a7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9DD1DE2D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738173082; cv=none; b=UGtq4rtnwTCMrR4VnqIj8+97E2A8EYqpFy1aABrEe0OvQ76oWIvKjsIUaqbGfCHdyYFgoA5oUvSNzNZr4qSuDVSsk66lVjGd+LmzkmdijrojgPLQrMbBkxoxHaovHfZ3HeMPolUxo4Qd+EsAbD2aDXzoao+Uf7QFeSaTKdGzXmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738173082; c=relaxed/simple;
	bh=F+I43V9gBr4wPRs5mzGlykA2loccknqVukXYKn02P8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoBNh6dZUHT/ljfaq6KYyCeIlwfCiFX6Fz08PMVzpaAagprXkPgcmJZy8AU09ZDyU36kvzndGPF7SC77gwfJ+jqKf7K+ZLA1tHq9j3TXz4y08ACnLaQj4cghvatgQYFVSwj9Qk0am/eFiba+XcWQpcJvHYh7nsefPwhDDgh4RyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SA6q+a7r; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so5818827e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 09:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738173079; x=1738777879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8p4yx6NHFdWVx/DOXDfsEALOqu8QLOTHdsHlUWbmAs=;
        b=SA6q+a7rCj5IQJzvzTDYRhN9kY2t7A2NnhZQ5hlt5eCn1NHZNCxgb2CYJZtzV6+jE4
         g7fKh9JU4FC4rLttQoam4Mu2k3H4cpHQ7qeQ9OKpj0HXgtDzZICp5J3sGT7f2e5vw9/m
         m1HoFb0lfSuMle3AAkhQBjYLpDm9dOuWNLB68sCLiULkxcStTM/N9jO2Jwo8MD+jKZB9
         L6ySt6YZvvqDW67lgA3vUO/mQlVIK+ZQQtJdc9WzAcWMKYjQU7RZa3aRLYZH2O+LpW9u
         F/SFzpOpQgvlpEG3vQv5hkiXc40wYx3jx8uG8/JGti7I0VsvVzmJhi3bMhkYRKY7o0K8
         iWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173079; x=1738777879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8p4yx6NHFdWVx/DOXDfsEALOqu8QLOTHdsHlUWbmAs=;
        b=p8V674Shofm2+nb99kN1/B9WUrGlACAF1F5r29xyx9KHQGoHZJ4ZXBecXYyDyUR8cw
         tzNgxqLjA+xoa/RKhRNubFFq4nmd6z6g4A+q6GQVQQACLyZNoBVa3cK18JyAEtwglQ9i
         ddef9WsPWKHW4BCy3NR4VL71Hdn8vSqm4ANK46LZf43ui2HsM72QurPkyVVvQ9pA8Q+M
         +HC12x+4NYn3A9MjSyFTANkkUBnYQvIsUrvwP+PEsIrxLxyAOESoF1YcRkYpSl/DXG2N
         xdVB3gJ6HnxlZKkG1cLpaqlXZ08OpKQsff+AGG2D/HJMiMjfCHUbO6DCqQr5LDC+8hgG
         o9dw==
X-Forwarded-Encrypted: i=1; AJvYcCWWc0tjOlGT5/mK4P3r78BrpBdzs1S9nDRdBkF/j1Sf8+SDZ74Z0LJb4on23notxoGZBwiWxp1CXE740XYy@vger.kernel.org
X-Gm-Message-State: AOJu0YzJFWlfhPu74UM3QeqzSyy0gL/VK1oIKSqox9y9EefFk383uMKW
	Q96bS/Je177NLZkHjFHXKJDYKupPHBCnK0+vSDhpiZZStdi9Mj/pNYro2FHPir8=
X-Gm-Gg: ASbGnctNgVlSPvda71xg6M1E/ezrq5Hmz8jtWthTWAMJAnSa/gy+UX+u7OjKRdd1LuR
	66+5qLjwuUH3PlbkzsL9s1K44tdwxvRJWFANAPtXJ/SPa/8wTP5F8XnNWbmoYR6zEOj9mKqIdxw
	wvT2gqi0T7fEFjAE/S7kie6lLF1OXhM9KU0IzFUOFORsvZ/ymVHVEfV5w11jVPOjx6QNGIBrV0b
	oQ7I6fpX+opGkPOEgAEvpcKVmZuyw9FHoWs+ewnL8WJ59XGks8NCbgL3cVvkR0gJ4mPXgUds0+q
	IMsEeLeCzfWfOTYMxm47BGc9tUpQ1+egjfj3GFDB2ynPCtGCqlz/DzADktMK7qwTurjvbr4=
X-Google-Smtp-Source: AGHT+IHw1QNzuNxenplou1KHca71MujElcS2MHQUi6SB47oZ/m6HWsUSGcmAQN1VkBoR4xP4qvfOhw==
X-Received: by 2002:ac2:55ab:0:b0:540:2549:b5ad with SMTP id 2adb3069b0e04-543e4beab7dmr1136059e87.22.1738173078570;
        Wed, 29 Jan 2025 09:51:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543e4b36203sm319642e87.146.2025.01.29.09.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 09:51:18 -0800 (PST)
Date: Wed, 29 Jan 2025 19:51:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 00/14] drm/msm/dpu: Add Concurrent Writeback Support
 for DPU 10.x+
Message-ID: <zoswzhubdq7ezxpecz72ki5kloyyedqo232toiol4r7hi244me@52rzudflyl52>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>

On Tue, Jan 28, 2025 at 07:20:32PM -0800, Jessica Zhang wrote:
> DPU supports a single writeback session running concurrently with primary
> display when the CWB mux is configured properly. This series enables
> clone mode for DPU driver and adds support for programming the CWB mux
> in cases where the hardware has dedicated CWB pingpong blocks. Currently,
> the CWB hardware blocks have only been added to the SM8650
> hardware catalog and only DSI has been exposed as a possible_clone of WB.
> 
> This changes are split into two parts:
> 
> The first part of the series will pull in Dmitry's patches to refactor
> the DPU resource manager to be based off of CRTC instead of encoder.
> This includes some changes (noted in the relevant commits) by me and
> Abhinav to fix some issues with getting the global state and refactoring
> the CDM allocation to work with Dmitry's changes.
> 
> The second part of the series will add support for CWB by doing the
> following:
> 
> 1) Add the CWB mux to the hardware catalog and clarify the pingpong
>    block index enum to specifiy which pingpong blocks are dedicated to
>    CWB only and which ones are general use pingpong blocks
> 2) Add support for configuring the CWB mux via dpu_hw_cwb ops
> 3) Add pending flush support for CWB
> 4) Add support for validating clone mode in the DPU CRTC and setting up
>    CWB within the encoder
> 5) Adjust the encoder trigger flush, trigger start, and kickoff order to
>    accomodate clone mode
> 6) Adjust when the frame done timer is started for clone mode
> 7) Define the possible clones for DPU encoders so that WB encoders can
>    be cloned by non-WB encoders
> 
> The feature was tested on SM8650 using IGT's kms_writeback test with the
> following change [1] and dumping the writeback framebuffer when in clone
> mode. I haven't gotten the chance to test it on DP yet, but I've
> validated both single and dual LM on DSI.
> 
> To test CWB with IGT, you'll need to apply this series [1] and run the
> following command to dump the writeback buffer:
> 
> IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
> ./build/tests/kms_writeback -d [--run-subtest dump-valid-clones] \
> 
> You can also do CRC validation by running this command:
> 
> ./build/tests/kms_writeback [--run-subtest dump-valid-clones]
> 
> NOTE: this series depends on Dmitry's modeset fixes [2]
> 
> [1] https://patchwork.freedesktop.org/series/137933/
> [2] https://patchwork.freedesktop.org/series/142905/
> 
> ---
> Changes in v5:
> - Rebased onto MSM modeset fixes series (Dmitry)
> - Reordered RM refactor patches to prevent breaking CI and to avoid
>   breaking when partially applied (Dmitry)
> - Switch CWB resource reservation to reserve CWB mux first (Dmitry)
> - Reworded commit messages to be clearer (Dmitry)
> - Change CDM check to fail only if both DP and WB outputs are
>   requesting the CDM block simultaneously (Dmitry)
> - Use helper to grab dsc config in dpu_encoder_update_topology
> - Link to v4: https://lore.kernel.org/r/20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com
> 
> Changes in v4:
> - Rebased onto latest msm-next
> - Added kunit tests for framework changes
> - Skip valid clone check for encoders that don't have any possible clones set
>   (this is to avoid failing kunit tests, specifically the HDMI state helper tests)
> - Link to v3: https://lore.kernel.org/r/20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com
> 
> Changes in v3:
> - Dropped support for CWB on DP connectors for now
> - Dropped unnecessary PINGPONG array in *_setup_cwb()
> - Add a check to make sure CWB and CDM aren't supported simultaneously
>   (Dmitry)
> - Document cwb_enabled checks in dpu_crtc_get_topology() (Dmitry)
> - Moved implementation of drm_crtc_in_clone_mode() to drm_crtc.c (Jani)
> - Dropped duplicate error message for reserving CWB resources (Dmitry)
> - Added notes in framework changes about posting a separate series to
>   add proper KUnit tests (Maxime)
> - Added commit message note addressing Sima's comment on handling
>   mode_changed (Dmitry)
> - Formatting fixes (Dmitry)
> - Added proper kerneldocs (Dmitry)
> - Renamed dpu_encoder_helper_get_cwb() -> *_get_cwb_mask() (Dmitry)
> - Capitalize all instances of "pingpong" in comments (Dmitry)
> - Link to v2: https://lore.kernel.org/r/20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com
> 
> Changes in v2:
> - Moved CWB hardware programming to its own dpu_hw_cwb abstraction
>   (Dmitry)
> - Reserve and get assigned CWB muxes using RM API and KMS global state
>   (Dmitry)
> - Dropped requirement to have only one CWB session at a time
> - Moved valid clone mode check to DRM framework (Dmitry and Ville)
> - Switch to default CWB tap point to LM as the DSPP
> - Dropped printing clone mode status in atomic state (Dmitry)
> - Call dpu_vbif_clear_errors() before dpu_encoder_kickoff() (Dmitry)
> - Squashed setup_input_ctrl() and setup_input_mode() into a single
>   dpu_hw_cwb op (Dmitry)
> - Moved function comment docs to correct place and fixed wording of
>   comments/commit messages (Dmitry)
> - Grabbed old CRTC state using proper drm_atomic_state API in
>   dpu_crtc_atomic_check() (Dmitry)
> - Split HW catalog changes of adding the CWB mux block and changing the
>   dedicated CWB pingpong indices into 2 separate commits (Dmitry)
> - Moved clearing the dpu_crtc_state.num_mixers to "drm/msm/dpu: fill
>   CRTC resources in dpu_crtc.c" (Dmitry)
> - Fixed alignment and other formatting issues (Dmitry)
> - Link to v1: https://lore.kernel.org/r/20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com
> 
> ---
> Dmitry Baryshkov (3):
>       drm/msm/dpu: fill CRTC resources in dpu_crtc.c
>       drm/msm/dpu: move resource allocation to CRTC
>       drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
> 
> Jessica Zhang (11):
>       drm/msm/dpu: Add CWB to msm_display_topology
>       drm/msm/dpu: Require modeset if clone mode status changes
>       drm/msm/dpu: Fail atomic_check if multiple outputs request CDM block
>       drm/msm/dpu: Reserve resources for CWB
>       drm/msm/dpu: Configure CWB in writeback encoder
>       drm/msm/dpu: Support CWB in dpu_hw_ctl
>       drm/msm/dpu: Adjust writeback phys encoder setup for CWB
>       drm/msm/dpu: Start frame done timer after encoder kickoff
>       drm/msm/dpu: Skip trigger flush and start for CWB
>       drm/msm/dpu: Reorder encoder kickoff for CWB
>       drm/msm/dpu: Set possible clones for all encoders
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 229 +++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 416 ++++++++++++---------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  16 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   7 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  16 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  30 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  15 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  27 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 293 ++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  14 +-
>  13 files changed, 752 insertions(+), 329 deletions(-)
> ---
> base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
> change-id: 20240618-concurrent-wb-97d62387f952
> prerequisite-change-id: 20241209-abhinavk-modeset-fix-74864f1de08d:v3
> prerequisite-patch-id: a197a0cd4647cb189ea20a96583ea78d0c98b638
> prerequisite-patch-id: 112c8f1795cbed989beb02b72561854c0ccd59dd

No, it's not a full list. Please use b4 prep --check-deps to check
dependencies. See the following errors:

$ b4 shazam -H 20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com
Grabbing thread from lore.kernel.org/all/20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 15 messages in the thread
Analyzing 174 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v5 1/14] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
  ✓ [PATCH v5 2/14] drm/msm/dpu: move resource allocation to CRTC
  ✓ [PATCH v5 3/14] drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
  ✓ [PATCH v5 4/14] drm/msm/dpu: Add CWB to msm_display_topology
  ✓ [PATCH v5 5/14] drm/msm/dpu: Require modeset if clone mode status changes
  ✓ [PATCH v5 6/14] drm/msm/dpu: Fail atomic_check if multiple outputs request CDM block
  ✓ [PATCH v5 7/14] drm/msm/dpu: Reserve resources for CWB
  ✓ [PATCH v5 8/14] drm/msm/dpu: Configure CWB in writeback encoder
  ✓ [PATCH v5 9/14] drm/msm/dpu: Support CWB in dpu_hw_ctl
  ✓ [PATCH v5 10/14] drm/msm/dpu: Adjust writeback phys encoder setup for CWB
  ✓ [PATCH v5 11/14] drm/msm/dpu: Start frame done timer after encoder kickoff
  ✓ [PATCH v5 12/14] drm/msm/dpu: Skip trigger flush and start for CWB
  ✓ [PATCH v5 13/14] drm/msm/dpu: Reorder encoder kickoff for CWB
  ✓ [PATCH v5 14/14] drm/msm/dpu: Set possible clones for all encoders
  ---
  ✗ No key: ed25519/quic_jesszhan@quicinc.com
  ✓ Signed: DKIM/quicinc.com
---
Total patches: 14
---
 Base: using specified base-commit 86313a9cd152330c634b25d826a281c6a002eb77
 Deps: looking for dependencies matching 2 patch-ids
 Deps: Applying prerequisite patch: [PATCH v2 1/2] drm: allow encoder mode_set even when connectors change for crtc
 Deps: Applying prerequisite patch: [PATCH v3 2/2] drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()
Magic: Preparing a sparse worktree
Unable to cleanly apply series, see failure log below
---
Applying: drm: allow encoder mode_set even when connectors change for crtc
Applying: drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()
Applying: drm/msm/dpu: fill CRTC resources in dpu_crtc.c
Patch failed at 0003 drm/msm/dpu: fill CRTC resources in dpu_crtc.c
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1230
error: drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c: patch does not apply
error: patch failed: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:719
error: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch


> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry

