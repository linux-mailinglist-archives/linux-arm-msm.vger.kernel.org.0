Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C73FB6AEE07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 19:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbjCGSJI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 13:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbjCGSIw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 13:08:52 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E2E211E5
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 10:03:00 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id t11so18232203lfr.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 10:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678212179;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0TSxhUEvQkXWTsVAXJ1Q1imQ0J4W9uI3UZQ+fSyL5R4=;
        b=Bht81P6k/XAg+n/N+gyPZivsaHbnQ2rBqf2hRqNxh3hKozR7RM2TIgfeGFPe6bcoLb
         kizEMDbm16u84txJZ9JVr2jzWqqSxaJaT9bt01FyhPubW6oUxtwoTFm04u0UeHQ3oedh
         uB9MwFQx6HSsyqc9yay2CSWJGkOaBTv1+lzzIOgENpJQdwlvoYtHV7sgjr5qpe5wL8MP
         TXiCPaQGjbYRTiYU23tfaeqe5otSK7i6142N0Fd/qNSFaHQCCKM8BX9DKXOq/bQPKNZJ
         /e1x7M9c2O/bhS2O6jNgCgGT31nN892AYJTXH/NgW3uClr6U3pVe9gxFGrCd0fq4me7V
         dakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678212179;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0TSxhUEvQkXWTsVAXJ1Q1imQ0J4W9uI3UZQ+fSyL5R4=;
        b=8F8esyFM8cQX9OxR24UZNi5VAhlNqHf1qx+fRcOmCmeOjO2dm2N0hvi7U2f2rxsKgQ
         8uHKIK92jjnvIhSp1palsOF07htu+ClLjmiymS1yvKaoGKOFeBPh5sCas/EqP7f5EYCp
         XLglVWTPSbYkI0VPiL4fZHDRwWKTCOrtwp0TLjDBcjDNbB8otbh/7sP3Fu00BzNcYrT9
         5gmBZJZGxuy73tKvrU1/XKVFA7lad8npU6rqnlEELpkUHu5ssBtpg2q0UBBlTuZvAhni
         lU9enhSsOe3FtPmUOTUmyP8odx5iCOpPoZITVcFWARFN8Plykw+92rTISqzfE/g1ZiQ4
         bT1w==
X-Gm-Message-State: AO0yUKWGpT0JaU8w004P9UAyFr3L1vwLCs67xhdd1kSaTuFqW25DjIEv
        wb6gLWcjGmQnqtb4GgF+H8w4jQ==
X-Google-Smtp-Source: AK7set8xUV/BPM1GTO+rKZqLya4Y3OY4q2PeA46Mcsafu9H60jjNupxTmKDd6ODZtfoKwdLJB45sYg==
X-Received: by 2002:a19:5206:0:b0:4cc:5e3a:dd82 with SMTP id m6-20020a195206000000b004cc5e3add82mr4005136lfb.58.1678212178819;
        Tue, 07 Mar 2023 10:02:58 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q8-20020ac246e8000000b004b6efcb7bb5sm2095445lfo.169.2023.03.07.10.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 10:02:58 -0800 (PST)
Message-ID: <dff314d3-782e-1550-394e-5f86b1de6a95@linaro.org>
Date:   Tue, 7 Mar 2023 20:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/50] drm/msm/dpu: rework HW catalog
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/02/2023 01:12, Dmitry Baryshkov wrote:
> This huge series attempts to restructure the DPU HW catalog into a
> manageable and reviewable data set. In order to ease review and testing
> I merged all the necessary fixes into this series. Also I cherry-picked
> & slightly fixed Konrad's patch adding size to the SSPP and INTF macros.
> 
> First 12 patches are catalog fixes, which can be probably picked into
> the msm-fixes.
> 
> Next 5 patches clean up the catalog a bit in order to make it more
> suitable for refactoring.
> 
> Then the next batch of 13 + 5 patches split the hw catalog entries into
> per-SoC files.
> 
> Next 8 patches rework catalog entries, mostly targeting QSEED cleanup
> and deduplication of data used by several platforms. At this moment only
> three pairs (out of 13 devices supported by DPU) are merged. However
> this part lays out the ground to ease adding support for new platforms,
> some of which use the same configuration as the existing platforms
> 
> Last batch of 7 patches renames existing macros to ease using them while
> adding support for new devices.
> 
> This pile of patches is submitted in a sinle batch to allow one to
> observe the final goal of the cleanup which otherwise might be hard to
> assess.
> 
> Changes since v1:
> - Picked up Konrad's patch
> - Picked up dependencies into the main series
> - Moved qseed3lite vs qseed4 patches into the fixes part
> - Fixed sm6115 in a similar manner.

Colleagues, could please take a look at this patchset? If nobody 
objects, I'd like to pick it after Rob merges Abhinav's msm-fixes pull 
request. Patches 1-13 are going through msm-fixes, patches 14-50 are 
pending.

> 
> Dmitry Baryshkov (49):
>    drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
>    drm/msm/dpu: disable features unsupported by QCM2290
>    drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
>    drm/msm/dpu: fix len of sc7180 ctl blocks
>    drm/msm/dpu: fix sm6115 and qcm2290 mixer width limits
>    drm/msm/dpu: correct sm8550 scaler
>    drm/msm/dpu: correct sc8280xp scaler
>    drm/msm/dpu: correct sm8450 scaler
>    drm/msm/dpu: correct sm8250 and sm8350 scaler
>    drm/msm/dpu: correct sm6115 scaler
>    drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
>    drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
>    drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP clocks
>    drm/msm/dpu: constify DSC data structures
>    drm/msm/dpu: mark remaining pp data as const
>    drm/msm/dpu: move UBWC/memory configuration to separate struct
>    drm/msm/dpu: split SM8550 catalog entry to the separate file
>    drm/msm/dpu: split SM8450 catalog entry to the separate file
>    drm/msm/dpu: split SC8280XP catalog entry to the separate file
>    drm/msm/dpu: split SC7280 catalog entry to the separate file
>    drm/msm/dpu: split SM8350 catalog entry to the separate file
>    drm/msm/dpu: split SM6115 catalog entry to the separate file
>    drm/msm/dpu: split QCM2290 catalog entry to the separate file
>    drm/msm/dpu: split SC7180 catalog entry to the separate file
>    drm/msm/dpu: split SM8250 catalog entry to the separate file
>    drm/msm/dpu: split SC8180X catalog entry to the separate file
>    drm/msm/dpu: split SM8150 catalog entry to the separate file
>    drm/msm/dpu: split MSM8998 catalog entry to the separate file
>    drm/msm/dpu: split SDM845 catalog entry to the separate file
>    drm/msm/dpu: duplicate sdm845 catalog entries
>    drm/msm/dpu: duplicate sc7180 catalog entries
>    drm/msm/dpu: duplicate sm8150 catalog entries
>    drm/msm/dpu: duplicate sm8250 catalog entries
>    drm/msm/dpu: duplicate sm8350 catalog entries
>    drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
>    drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
>    drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
>    drm/msm/dpu: drop duplicate vig_sblk instances
>    drm/msm/dpu: enable DSPP on sc8180x
>    drm/msm/dpu: deduplicate sc8180x with sm8150
>    drm/msm/dpu: deduplicate sm6115 with qcm2290
>    drm/msm/dpu: deduplicate sc8280xp with sm8450
>    drm/msm/dpu: drop unused macros from hw catalog
>    drm/msm/dpu: inline IRQ_n_MASK defines
>    drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
>    drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
>    drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
>    drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
>    drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version
> 
> Konrad Dybcio (1):
>    drm/msm/dpu: Allow variable SSPP/INTF_BLK size
> 
>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  211 ++
>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  211 ++
>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   97 +
>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |   91 +
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h |  152 ++
>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  244 ++
>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  152 ++
>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   92 +
>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   84 +
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h |   54 +
>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  226 ++
>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  159 ++
>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  117 +
>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  123 +
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h |  118 +
>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  209 ++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 2193 +----------------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   39 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |    4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   18 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |    4 +-
>   21 files changed, 2434 insertions(+), 2164 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> 

-- 
With best wishes
Dmitry

