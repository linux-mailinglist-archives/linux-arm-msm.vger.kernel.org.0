Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4669B6DD7DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 12:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjDKK1U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 06:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjDKK1U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 06:27:20 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89982103
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 03:27:17 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-2f27a10f72bso132052f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681208836; x=1683800836;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QmJ/kfGh3BX7+ddzqTE6CNNNhNdKLYXBdfYBjLKkLzA=;
        b=MC+nif0pnm3FN/UB5pWCLIcYl5AseN3CCjo92LJXZ1d4j3t5aVs+jmFN15r99kSwr4
         qf0yTFM5Pnijr95hzBPaOUnqSY7dvQ2gFaE3Cs649CWH6JAgGIPD3b0rizjnXQ1uAT+7
         qtNV08ncWNEiaTTB6s/N5guVtMyJu7nslNpF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681208836; x=1683800836;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmJ/kfGh3BX7+ddzqTE6CNNNhNdKLYXBdfYBjLKkLzA=;
        b=RvAxU8pHVikF37D6SuadxESla9174jzOnELQ4n1J0wNUkf0zGUFUNTtVPU3ZHmR34r
         s852kwE6Yvb8XZ6CRQASuWq1/f6qpoTk7pWsMyHMrycaaAro3kp5VgseMmgUvQchz+ud
         WIe0I6dFID3FHxGqHERzsPmZUPOxo/SlKMXy52dXgYVz0SUza6fIsBVtoAMo5gvRmkfo
         baI3c/ht4QdRfKXHvlomYJ8Xgr8Y4sEhwitlvFUMkGrl4E7pZfVtxSbWSciNRSy4xHEC
         WUxtW4Ms5lzg6HbXfIKaPUB7MLTLOv7+T810UcleyuvH5wjPQfak9JmtoLV9Gm4OS4ey
         LSbg==
X-Gm-Message-State: AAQBX9dq1rSxni0rTsA9w59OGPmEeWUgzthYPksNHNXJVH1NSfY5nn3p
        aP3IAz2voQXXZkcPCxJUG1njBw==
X-Google-Smtp-Source: AKy350b/as5ZOnBdKOItsctD5Oj9WgOuaHF9d97tCICo40eSPWwTKnitvJ7m/3memHE6HBJ/phFDnw==
X-Received: by 2002:a5d:67c5:0:b0:2db:43ed:1bb6 with SMTP id n5-20020a5d67c5000000b002db43ed1bb6mr7600027wrw.3.1681208835873;
        Tue, 11 Apr 2023 03:27:15 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id w18-20020adfee52000000b002efb78acf38sm9480957wro.85.2023.04.11.03.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 03:27:15 -0700 (PDT)
Date:   Tue, 11 Apr 2023 12:27:13 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [pull] drm/msm: drm-msm-next-2023-04-10 for v6.4
Message-ID: <ZDU2ASmAWEL0yjrc@phenom.ffwll.local>
References: <CAF6AEGvwuj5tabyW910+N-B=5kFNAC7QNYoQ=0xi3roBjQvFFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvwuj5tabyW910+N-B=5kFNAC7QNYoQ=0xi3roBjQvFFQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 10, 2023 at 07:50:50AM -0700, Rob Clark wrote:
> Hi Dave,
> 
> This is the main pull for v6.4, see below for description.  A bit big
> this time because of (1) generated header updates and (2) dpu hw
> catelog rework which split the increasingly unwieldy
> big-giant-file-of-tables into per-SoC files.  But those are mainly
> mechanical churn.
> 
> The following changes since commit e752ab11dcb48353727ea26eefd740155e028865:
> 
>   Merge remote-tracking branch 'drm/drm-next' into msm-next
> (2023-03-20 10:31:25 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2023-04-10
> 
> for you to fetch changes up to ac7e7c9c65ecfb1fcc99de91cfd6b17a8d4cb9c1:
> 
>   drm/msm/dpu: drop unused macros from hw catalog (2023-04-07 03:54:50 +0300)

Pulled, thanks.

Two comments below.

> 
> ----------------------------------------------------------------
> main pull request for v6.4
> 
> Core Display:
> ============
> * Bugfixes for error handling during probe
> * rework UBWC decoder programming
> * prepare_commit cleanup
> * bindings for SM8550 (MDSS, DPU), SM8450 (DP)
> * timeout calculation fixup
> * atomic: use drm_crtc_next_vblank_start() instead of our own
>   custom thing to calculate the start of next vblank
> 
> DP:
> ==
> * interrupts cleanup
> 
> DPU:
> ===
> * DSPP sub-block flush on sc7280
> * support AR30 in addition to XR30 format
> * Allow using REC_0 and REC_1 to handle wide (4k) RGB planes
> * Split the HW catalog into individual per-SoC files
> 
> DSI:
> ===
> * rework DSI instance ID detection on obscure platforms
> 
> GPU:
> ===
> * uapi C++ compatibility fix
> * a6xx: More robust gdsc reset
> * a3xx and a4xx devfreq support
> * update generated headers
> * various cleanups and fixes
> * GPU and GEM updates to avoid allocations which could trigger
>   reclaim (shrinker) in fence signaling path

dim complained about a pile of commits without 2nd eyes, and it was mostly
this. I think especially for these tricky locking/reclaim issues having a
bus factor > 1 would be really good. I'll try and brush of my anotations,
hopefully we can have a bit more cross-driver discussions and reviews
going here, iirc when Boris did the timed_out annotations for panfrost he
didn't fix all the splats, so that's perfect candidate to help push the
remaining work.

> * dma-fence deadline hint support and wait-boost
> * a640 speedbin support
> * a650 speedbin support
> 
> ----------------------------------------------------------------
> Abhinav Kumar (3):
>       MAINTAINERS: Update the URI for MSM DRM bugs
>       drm/msm/dpu: log the multirect_index in _dpu_crtc_blend_setup_pipe
>       drm/msm/dpu: remove unused dpu_plane_validate_multirect_v2 function
> 
> Adam Skladowski (1):
>       drm: msm: adreno: Disable preemption on Adreno 510
> 
> Akhil P Oommen (3):
>       drm/msm/a6xx: Vote for cx gdsc from gpu driver
>       drm/msm/a6xx: Remove cx gdsc polling using 'reset'
>       drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse
> 
> Arnd Bergmann (1):
>       drm/msm/a6xx: add CONFIG_PM dependency
> 
> Colin Ian King (2):
>       drm/msm/mdss: Fix spelling mistake "Unuspported" -> "Unsupported"
>       drm/msm/dp: Fix spelling mistake "Capabiity" -> "Capability"
> 
> Danylo Piliaiev (1):
>       drm/msm: Rename drm_msm_gem_submit_reloc::or in C++ code
> 
> Dmitry Baryshkov (67):
>       drm/msm/adreno: stall translation on fault for all GPU families
>       drm/msm/adreno: split a6xx fault handler into generic and a6xx parts
>       drm/msm/a5xx: add devcoredump support to the fault handler
>       drm/msm/mdss: convert UBWC setup to use match data
>       drm/msm/mdss: add data for sc8180xp
>       drm/msm/mdss: add the sdm845 data for completeness
>       drm/msm/dpu: rename struct dpu_hw_pipe(_cfg) to dpu_hw_sspp(_cfg)
>       drm/msm/dpu: move SSPP allocation to the RM
>       drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
>       drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
>       drm/msm/dpu: move pipe_hw to dpu_plane_state
>       drm/msm/dpu: drop dpu_plane_pipe function
>       drm/msm/dpu: introduce struct dpu_sw_pipe
>       drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
>       drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
>       drm/msm/dpu: clean up SRC addresses when setting up SSPP for solid fill
>       drm/msm/dpu: move stride programming to dpu_hw_sspp_setup_sourceaddress
>       drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_sspp_cfg
>       drm/msm/dpu: rename dpu_hw_sspp_cfg to dpu_sw_pipe_cfg
>       drm/msm/dpu: drop src_split and multirect check from dpu_crtc_atomic_check
>       drm/msm/dpu: don't use unsupported blend stages
>       drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
>       drm/msm/dpu: drop redundant plane dst check from dpu_crtc_atomic_check()
>       drm/msm/dpu: rewrite plane's QoS-related functions to take
> dpu_sw_pipe and dpu_format
>       drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
>       drm/msm/dpu: add dpu_hw_sspp_cfg to dpu_plane_state
>       drm/msm/dpu: simplify dpu_plane_validate_src()
>       drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
>       drm/msm/dpu: rework dpu_plane_atomic_check()
>       drm/msm/dpu: rework plane CSC setting
>       drm/msm/dpu: rework static color fill code
>       drm/msm/dpu: split pipe handling from _dpu_crtc_blend_setup_mixer
>       drm/msm/dpu: add support for wide planes
>       drm/msm/dpu: populate SmartDMA features in hw catalog
>       drm/msm/dpu: drop smart_dma_rev from dpu_caps
>       Merge branch 'msm-next-lumag-dpu' into msm-next-lumag
>       Merge branches 'msm-next-lumag-dp', 'msm-next-lumag-dsi',
> 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag
>       drm/msm/dpu: constify DSC data structures
>       drm/msm/dpu: mark remaining pp data as const
>       drm/msm/dpu: move UBWC/memory configuration to separate struct
>       drm/msm/dpu: split SM8550 catalog entry to the separate file
>       drm/msm/dpu: split SC8280XP catalog entry to the separate file
>       drm/msm/dpu: split SC7280 catalog entry to the separate file
>       drm/msm/dpu: split SM8350 catalog entry to the separate file
>       drm/msm/dpu: split SM6115 catalog entry to the separate file
>       drm/msm/dpu: split QCM2290 catalog entry to the separate file
>       drm/msm/dpu: split SC7180 catalog entry to the separate file
>       drm/msm/dpu: split SM8250 catalog entry to the separate file
>       drm/msm/dpu: split SC8180X catalog entry to the separate file
>       drm/msm/dpu: split SM8150 catalog entry to the separate file
>       drm/msm/dpu: split MSM8998 catalog entry to the separate file
>       drm/msm/dpu: split SDM845 catalog entry to the separate file
>       drm/msm/dpu: duplicate sdm845 catalog entries
>       drm/msm/dpu: duplicate sc7180 catalog entries
>       drm/msm/dpu: duplicate sm8150 catalog entries
>       drm/msm/dpu: duplicate sm8250 catalog entries
>       drm/msm/dpu: duplicate sm8350 catalog entries
>       drm/msm/dpu: expand sc8180x catalog
>       drm/msm/dpu: expand sc7180 catalog
>       drm/msm/dpu: expand sm6115 catalog
>       drm/msm/dpu: expand sm8550 catalog
>       drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
>       drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
>       drm/msm/dpu: drop duplicate vig_sblk instances
>       drm/msm/dpu: inline IRQ_n_MASK defines
>       drm/msm/dpu: fetch DPU configuration from match data
>       drm/msm/dpu: drop unused macros from hw catalog
> 
> Douglas Anderson (2):
>       drm/msm/dp: Clean up handling of DP AUX interrupts
>       drm/msm/dp: Return IRQ_NONE for unhandled interrupts
> 
> Geert Uytterhoeven (1):
>       drm/msm/dpu: Fix bit-shifting UB in DPU_HW_VER() macro
> 
> Jessica Zhang (4):
>       drm/msm: Check for NULL before calling prepare_commit()
>       drm/msm/dpu: Move TE setup to prepare_for_kickoff()
>       drm/msm/dpu: Remove empty prepare_commit() function
>       drm/msm/mdp4: Remove empty prepare_commit() function
> 
> Johan Hovold (12):
>       drm/msm/adreno: fix runtime PM imbalance at gpu load
>       drm/msm/adreno: drop bogus pm_runtime_set_active()
>       drm/msm/adreno: clean up component ops indentation
>       Revert "drm/msm: Add missing check and destroy for
> alloc_ordered_workqueue"
>       Revert "drm/msm: Fix failure paths in msm_drm_init()"
>       drm/msm: fix NULL-deref on snapshot tear down
>       drm/msm: fix NULL-deref on irq uninstall
>       drm/msm: fix drm device leak on bind errors
>       drm/msm: fix vram leak on bind errors
>       drm/msm: fix missing wq allocation error handling
>       drm/msm: fix workqueue leak on bind errors
>       drm/msm: move include directive
> 
> Kalyan Thota (4):
>       drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
>       drm/msm/dpu: add DSPPs into reservation upon a CTM request
>       drm/msm/dpu: avoid unnecessary check in DPU reservations
>       drm/msm/dpu: manage DPU resources if CTM is requested
> 
> Konrad Dybcio (18):
>       drm/msm/adreno: Use OPP for every GPU generation

This had a minor conflict with refactoring from drm-misc-next, I went
what's in your pr. Please double check I didn't screw up, but at least it
compiles :-)


>       drm/msm/a3xx: Implement .gpu_busy
>       drm/msm/a4xx: Implement .gpu_busy
>       drm/msm/adreno: Enable optional icc voting from OPP tables
>       drm/msm/a6xx: Add support for A640 speed binning
>       drm/msm/a6xx: Add support for A650 speed binning
>       drm/msm/adreno: adreno_gpu: Don't set OPP scaling clock w/ GMU
>       drm/msm/adreno: adreno_gpu: Use suspend() instead of idle() on load error
>       dt-bindings: display/msm: dsi-controller-main: Fix deprecated
> QCM2290 compatible
>       drm/msm/dsi: Get rid of msm_dsi_config::num_dsi
>       drm/msm/dsi: Fix DSI index detection when version clash occurs
>       drm/msm/dsi: dsi_cfg: Deduplicate identical structs
>       drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
>       drm/msm/dsi: Switch the QCM2290-specific compatible to index autodetection
>       drm/msm/dsi: Remove custom DSI config handling
>       dt-bindings: display/msm: dsi-controller-main: Add SM6115
>       drm/msm/dpu: Allow variable SSPP_BLK size
>       drm/msm/dpu: Allow variable INTF_BLK size
> 
> Leonard Lausen (1):
>       drm/msm/dpu: Add support for AR30 format
> 
> Ma�ra Canal (1):
>       drm/msm: Use drm_sched_job_add_syncobj_dependency()
> 
> Neil Armstrong (4):
>       dt-bindings: display/msm: document MDSS on SM8550
>       dt-bindings: display: msm: sm8450-mdss: Fix DSI compatible
>       dt-bindings: display/msm: document DPU on SM8550
>       dt-bindings: display: msm: dp-controller: document SM8450 compatible
> 
> Rob Clark (29):
>       drm/msm/a6xx: Some reg64 conversion
>       drm/msm: Update generated headers
>       dma-buf/dma-fence: Add deadline awareness
>       dma-buf/fence-array: Add fence deadline support
>       drm/msm: Pre-allocate hw_fence
>       drm/msm: Move submit bo flags update from obj lock
>       drm/msm/gem: Tidy up VMA API
>       drm/msm: Decouple vma tracking from obj lock
>       drm/msm/gem: Simplify vmap vs LRU tracking
>       drm/gem: Export drm_gem_lru_move_tail_locked()
>       drm/msm/gem: Move update_lru()
>       drm/msm/gem: Protect pin_count/madv by LRU lock
>       drm/msm/gem: Avoid obj lock in job_run()
>       drm/msm: Switch idr_lock to spinlock
>       drm/msm: Use idr_preload()
>       drm/msm/gpu: Move fw loading out of hw_init() path
>       drm/msm/gpu: Move BO allocation out of hw_init
>       drm/msm/a6xx: Move ioremap out of hw_init path
>       dma-buf/fence-chain: Add fence deadline support
>       dma-buf/dma-resv: Add a way to set fence deadline
>       dma-buf/sync_file: Surface sync-file uABI
>       drm/scheduler: Add fence deadline support
>       drm/vblank: Add helper to get next vblank time
>       drm/atomic-helper: Set fence deadline for vblank
>       Merge tag 'dma-fence-deadline' into HEAD
>       drm/msm: Add deadline based boost support
>       drm/msm: Add wait-boost support
>       drm/msm/atomic: Switch to vblank_start helper
>       drm/msm: Avoid rounding down to zero jiffies
> 
> Thomas Zimmermann (8):
>       drm/msm: Include <linux/io.h>
>       drm/msm: Clear aperture ownership outside of fbdev code
>       drm/msm: Remove fb from struct msm_fbdev
>       drm/msm: Remove struct msm_fbdev
>       drm/msm: Remove fbdev from struct msm_drm_private
>       drm/msm: Move module parameter 'fbdev' to fbdev code
>       drm/msm: Initialize fbdev DRM client
>       drm/msm: Implement fbdev emulation as in-kernel client
> 
> Tom Rix (1):
>       drm/msm/mdp5: set varaiable msm8x76_config
> storage-class-specifier to static
> 
> Vinod Polimera (2):
>       drm/msm/dpu: set dirty_fb flag while in self refresh mode
>       msm/disp/dpu: allow atomic_check in PSR usecase
> 
>  .../bindings/display/msm/dp-controller.yaml        |   25 +-
>  .../bindings/display/msm/dsi-controller-main.yaml  |    9 +-
>  .../bindings/display/msm/qcom,sm6115-mdss.yaml     |   10 +-
>  .../bindings/display/msm/qcom,sm8450-mdss.yaml     |    6 +-
>  .../bindings/display/msm/qcom,sm8550-dpu.yaml      |  133 ++
>  .../bindings/display/msm/qcom,sm8550-mdss.yaml     |  333 +++
>  Documentation/driver-api/dma-buf.rst               |   16 +-
>  MAINTAINERS                                        |    1 +
>  drivers/dma-buf/dma-fence-array.c                  |   11 +
>  drivers/dma-buf/dma-fence-chain.c                  |   12 +
>  drivers/dma-buf/dma-fence.c                        |   59 +
>  drivers/dma-buf/dma-resv.c                         |   22 +
>  drivers/gpu/drm/drm_atomic_helper.c                |   37 +
>  drivers/gpu/drm/drm_gem.c                          |   11 +-
>  drivers/gpu/drm/drm_vblank.c                       |   53 +-
>  drivers/gpu/drm/msm/Kconfig                        |    2 +
>  drivers/gpu/drm/msm/adreno/a2xx.xml.h              |   54 +-
>  drivers/gpu/drm/msm/adreno/a3xx.xml.h              |   30 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   11 +
>  drivers/gpu/drm/msm/adreno/a4xx.xml.h              |   38 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   11 +
>  drivers/gpu/drm/msm/adreno/a5xx.xml.h              |   44 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   69 +-
>  drivers/gpu/drm/msm/adreno/a6xx.xml.h              |  795 ++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   64 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    7 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   30 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  183 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    2 +-
>  drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   52 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c         |   33 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  174 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    4 +
>  drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  115 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  210 ++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  210 ++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  237 +++
>  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  217 ++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  244 +++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  156 ++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  129 ++
>  .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  119 ++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  226 ++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  158 ++
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  222 ++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  234 +++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  239 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  297 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   57 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    7 -
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    8 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |   21 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 2152 +-------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   94 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   49 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |    5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |    4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  187 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  115 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   96 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  867 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   40 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   22 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   12 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   19 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |   40 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |    5 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |   40 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |    2 +-
>  drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   40 +-
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       |    3 -
>  drivers/gpu/drm/msm/dp/dp_aux.c                    |   90 +-
>  drivers/gpu/drm/msm/dp/dp_aux.h                    |    2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |    2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |    2 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |    2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                |    8 +-
>  drivers/gpu/drm/msm/dp/dp_link.c                   |    2 +-
>  drivers/gpu/drm/msm/dsi/dsi.c                      |    7 +-
>  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   41 +-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  161 +-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    9 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c                 |   14 +-
>  drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   40 +-
>  drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   40 +-
>  drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   40 +-
>  drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   40 +-
>  drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   40 +-
>  drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   36 +-
>  drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   40 +-
>  drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |   38 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |   62 +-
>  drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |   40 +-
>  drivers/gpu/drm/msm/msm_atomic.c                   |   29 +-
>  drivers/gpu/drm/msm/msm_debugfs.c                  |    6 +-
>  drivers/gpu/drm/msm/msm_drv.c                      |  109 +-
>  drivers/gpu/drm/msm/msm_drv.h                      |   15 +-
>  drivers/gpu/drm/msm/msm_fbdev.c                    |  173 +-
>  drivers/gpu/drm/msm/msm_fence.c                    |   86 +-
>  drivers/gpu/drm/msm/msm_fence.h                    |   23 +-
>  drivers/gpu/drm/msm/msm_gem.c                      |  150 +-
>  drivers/gpu/drm/msm/msm_gem.h                      |   29 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c               |   37 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c                  |   91 +-
>  drivers/gpu/drm/msm/msm_gpu.c                      |    8 +-
>  drivers/gpu/drm/msm/msm_gpu.h                      |   12 +-
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c              |    2 +-
>  drivers/gpu/drm/msm/msm_io_utils.c                 |    1 +
>  drivers/gpu/drm/msm/msm_iommu.c                    |   38 +-
>  drivers/gpu/drm/msm/msm_kms.h                      |    8 -
>  drivers/gpu/drm/msm/msm_mdss.c                     |  198 +-
>  drivers/gpu/drm/msm/msm_mmu.h                      |    1 +
>  drivers/gpu/drm/msm/msm_ringbuffer.c               |    8 +-
>  drivers/gpu/drm/msm/msm_submitqueue.c              |    2 +-
>  drivers/gpu/drm/scheduler/sched_fence.c            |   46 +
>  drivers/gpu/drm/scheduler/sched_main.c             |    2 +-
>  include/drm/drm_gem.h                              |    1 +
>  include/drm/drm_vblank.h                           |    1 +
>  include/drm/gpu_scheduler.h                        |   17 +
>  include/linux/dma-fence.h                          |   22 +
>  include/linux/dma-resv.h                           |    2 +
>  include/uapi/drm/msm_drm.h                         |   18 +-
>  include/uapi/linux/sync_file.h                     |   37 +-
>  125 files changed, 6659 insertions(+), 4519 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
