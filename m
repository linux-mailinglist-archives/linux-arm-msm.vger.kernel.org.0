Return-Path: <linux-arm-msm+bounces-42898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C549F8BC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 900887A34D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 05:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370E913B298;
	Fri, 20 Dec 2024 05:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CdWepuWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D7F7DA6C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 05:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734671473; cv=none; b=aNgoNJ8Oei37xtHaeq2N/Lt9v8H/R7qbP/G083TQeGFuiIm/MsDdTDaeQlyG7UsUGmA8bZFzIKM42PfPrSq1Fu2Hjxjf0fc3LjX/gcwsbAgyKP3TrXVxqaocYhZ6G0982OcdvUee/ZcH5qMYHRjQullpl8dAYZbi2gr3O7ZNbaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734671473; c=relaxed/simple;
	bh=lYYuhsWzsYKDwViEKpQdkzy7enBMo2+NtVjfOTUjm+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPwRO8pJdMBwmMbl794ZAdqxg2YU4GmbmJmV2sJtB/yOygdN4lyu6njKsLTjPaDRnP6DlAePvhmL0fZcTEpEQYke2J+Bt9aYDQtZp9t3ObM10hVuMQISSQxr4f1qkIAu7se0MzqO4OWzLZBqd0kAVY3q5jvaW/ChOFjhX1gouNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CdWepuWS; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30227c56b11so16028701fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734671469; x=1735276269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hOLNpmukdI9ORURYicitCjFN5XPFQVYwVfKV5O5JRv0=;
        b=CdWepuWSjlyFAeOuQoaezR9mGglPlZ8D+QM5K1mgRNUxdmcx0DEUiunSmJvnZ7kFFR
         MzSQvumsLcVz2SGO/kxgOY0ggaljTyt+GY72v13UT3OY4Pmo2lKtOGaIHeIiYlVW0lSm
         DluLz01244TNdNAIF4Nc8CmXyiUQkpmI2r1IYYyWCUK9lpEjvX/JGXFSNMcq/IgebIQq
         u4K+6SptoXdIhl2jwq7l7gDyRkqA/IsA7NkuavwbYx27+l3qsoULq/408jDnWx7pqQ+3
         yJx1MrMNRpAwkMKBJFWY4sRxvQZsX9G+LpbVpNFWqh3soedqz3CAXY1DACSmcj1hHMMG
         Sk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734671469; x=1735276269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOLNpmukdI9ORURYicitCjFN5XPFQVYwVfKV5O5JRv0=;
        b=bnEQR0NlzjA97+4ONIAfY9dbAwllNNanHQvaLlQdOPNX8y4pvrdyzNg8z9lZArZhEd
         Y1NjjQc/lkil86M5l/q4y8BzYhl3plnCsSMULLk6aIABuT5XCWQyk1YaYZDmaiyEecOH
         6gQ6ovUhDTZSowTa4D99gnLAUpGe8IMErp+eSVs/PzaNwFToYMu+0pq/nj7O6L2Dq1sN
         c5WrIkpuhL18fvc+yq1iOAyOyQTf9MXGHcoZotlGM0N9ubh96/0wAzw4GI0t/nKiHdRV
         WUYxqlDVye7DjnrZZjdp6R4YeHI+OD/Icf3UONBiOsI0aY3wW64Op9SZEWuamYTBqrdq
         u7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCwoxm4thRmwaj4cloaKW20d7Mv91JQXrEFKyyEPr5n1EGpiv42TelavmsIWjQTvspfccPa+jur49kz0Rv@vger.kernel.org
X-Gm-Message-State: AOJu0YyJt4BTYXsnk6nKPTdjtwnwrSMN43a9eCUT0reDe1cq99l7eyrm
	+kBeLNL1liu7yOZbRxUh5Vmwb6C/rW17iVCjoqyTBjwkHBmCv8rBjQN25LQsvB4=
X-Gm-Gg: ASbGncs7Xm5JyHMIArcPfiN5ur/c4Vk01Fw9VX/to/eGAoxNT/UlloXlYFgDyyovx+I
	aAuKvOM/bOikl3n5Zzzsftd1DJXmt20XPyFn5zKNTeRCj3wIzKCztkzvVc8MXXFeYmRTdnF2JVb
	RsKgXwCZNFrXYmX56P6PZHGlJDoKjMOTgkEutKpnBvuyWE70x/P+sjs+AHzGtNZVJ/KSEsotugB
	fLvW7Axb8rCo7EDgWoUBEfJMm54V8Uo0kUiFliff30oL+91aUWWgEA1DZ8WuL0ZCXWwTJgbfAAv
	AuPGCmtLMsN0tJLgZVQ4JkZ2MzsFn8pwqxF8
X-Google-Smtp-Source: AGHT+IFC/NE5zc46pIrUc+uWu2MmiI7zMsrugsnNtqsVSjl4K0p8nbc4HXWw64vBy35DSxO5ymiXuQ==
X-Received: by 2002:a05:651c:4cb:b0:300:1448:c526 with SMTP id 38308e7fff4ca-3046861f16emr3282311fa.37.1734671468999;
        Thu, 19 Dec 2024 21:11:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c61asm4252781fa.2.2024.12.19.21.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 21:11:07 -0800 (PST)
Date: Fri, 20 Dec 2024 07:11:05 +0200
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
Subject: Re: [PATCH v4 00/25] drm/msm/dpu: Add Concurrent Writeback Support
 for DPU 10.x+
Message-ID: <kx22rzwg5464f4m24u6ybnv3wcey2hffueg5pwd6t523lpjdsp@b4wj6qgcgvmk>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>

On Mon, Dec 16, 2024 at 04:43:11PM -0800, Jessica Zhang wrote:
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

To provide a sensible baseline for both CWB and Quad-Pipe changes I'm
going to pull patches 5-14 (those which refactor the resource allocation
and also those adding support for the CWB hardware block). The core DRM
patches should probably go in through drm-misc-next.

> 
> The second part of the series will add support for CWB by doing the
> following:
> 
> 1) Add a DRM helper to detect if the current CRTC state is in clone mode
>    and add an "in_clone_mode" entry to the atomic state print
> 2) Add the CWB mux to the hardware catalog and clarify the pingpong
>    block index enum to specifiy which pingpong blocks are dedicated to
>    CWB only and which ones are general use pingpong blocks
> 3) Add CWB as part of the devcoredump
> 4) Add support for configuring the CWB mux via dpu_hw_cwb ops
> 5) Add pending flush support for CWB
> 6) Add support for validating clone mode in the DPU CRTC and setting up
>    CWB within the encoder
> 7) Adjust the encoder trigger flush, trigger start, and kickoff order to
>    accomodate clone mode
> 8) Adjust when the frame done timer is started for clone mode
> 9) Define the possible clones for DPU encoders so that 
> 
> The feature was tested on SM8650 using IGT's kms_writeback test with the
> following change [1] and dumping the writeback framebuffer when in clone
> mode. I haven't gotten the chance to test it on DP yet, but I've
> validated both single and dual LM on DSI.
> 
> To test CWB with IGT, you'll need to apply this series [1] and this
> driver patch [2]. Run the following command to dump the writeback buffer:
> 
> IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
> ./build/tests/kms_writeback -d [--run-subtest dump-valid-clones] \
> 
> You can also do CRC validation by running this command:
> 
> ./build/tests/kms_writeback [--run-subtest dump-valid-clones]
> 
> [1] https://patchwork.freedesktop.org/series/137933/
> [2] https://patchwork.freedesktop.org/series/138284/
> 
> ---
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
> Dmitry Baryshkov (4):
>       drm/msm/dpu: get rid of struct dpu_rm_requirements
>       drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
>       drm/msm/dpu: move resource allocation to CRTC
>       drm/msm/dpu: fill CRTC resources in dpu_crtc.c
> 
> Esha Bharadwaj (3):
>       drm/msm/dpu: Add CWB entry to catalog for SM8650
>       drm/msm/dpu: add devcoredumps for cwb registers
>       drm/msm/dpu: add CWB support to dpu_hw_wb
> 
> Jessica Zhang (18):
>       drm: add clone mode check for CRTC
>       drm/tests: Add test for drm_crtc_in_clone_mode()
>       drm: Add valid clones check
>       drm/tests: Add test for drm_atomic_helper_check_modeset()
>       drm/msm/dpu: Specify dedicated CWB pingpong blocks
>       drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB block
>       drm/msm/dpu: Add RM support for allocating CWB
>       drm/msm/dpu: Add CWB to msm_display_topology
>       drm/msm/dpu: Require modeset if clone mode status changes
>       drm/msm/dpu: Fail atomic_check if CWB and CDM are enabled
>       drm/msm/dpu: Reserve resources for CWB
>       drm/msm/dpu: Configure CWB in writeback encoder
>       drm/msm/dpu: Support CWB in dpu_hw_ctl
>       drm/msm/dpu: Adjust writeback phys encoder setup for CWB
>       drm/msm/dpu: Start frame done timer after encoder kickoff
>       drm/msm/dpu: Skip trigger flush and start for CWB
>       drm/msm/dpu: Reorder encoder kickoff for CWB
>       drm/msm/dpu: Set possible clones for all encoders
> 
>  drivers/gpu/drm/drm_atomic_helper.c                |  28 ++
>  drivers/gpu/drm/drm_crtc.c                         |  20 +
>  drivers/gpu/drm/msm/Makefile                       |   1 +
>  .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  29 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   4 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |   4 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   4 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 208 ++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 463 ++++++++++++---------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   7 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  16 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  13 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  30 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  15 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c         |  73 ++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h         |  70 ++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  15 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 361 +++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  13 +-
>  drivers/gpu/drm/tests/drm_atomic_state_test.c      | 133 +++++-
>  include/drm/drm_crtc.h                             |   2 +-
>  26 files changed, 1172 insertions(+), 384 deletions(-)
> ---
> base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
> change-id: 20240618-concurrent-wb-97d62387f952
> prerequisite-change-id: 20241209-abhinavk-modeset-fix-74864f1de08d:v3
> prerequisite-patch-id: a197a0cd4647cb189ea20a96583ea78d0c98b638
> prerequisite-patch-id: 112c8f1795cbed989beb02b72561854c0ccd59dd
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry

