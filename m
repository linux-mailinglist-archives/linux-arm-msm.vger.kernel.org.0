Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF0B16CCD60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjC1WiP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjC1WiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:13 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE951BD7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:07 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id x20so14160767ljq.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TD7sqkfPpaQWvfvPFZ0+jRqio3L7H18Rm7F/+Kcu9Xk=;
        b=CDGtS1sbbK/S0Oc/g3JVA8LOO3vu9tN2dJ4lmxdvHGxKq/QimetFVqh27rq7LxVxAu
         OGem8KrO8OIZdd0tnaqiR+httRCYsd7/jaWsp4exPDC3Rm12SXOWLiadufl95aw4hiGz
         0q/qm9T1T7b4fB6mtV+IX/809BXHY80aiJOy7cCyq+Cu7zJwmclr+R5N2M+GDojx9W5p
         /zpX+pgcnX/I00ymnBgIjWZrIiB03zNVNAeBT34TLdkZiX02vW1orumIwNprX0ghXUI6
         uSmRpTTXuCjzI0JLyCm1zlGjEBlHMT2p7uKot68K7r2CAwu2PVhI26pzXcR1AZtVTkZx
         yIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TD7sqkfPpaQWvfvPFZ0+jRqio3L7H18Rm7F/+Kcu9Xk=;
        b=vhge2LveAJyBxM8ZxEncHsY/Q3bSBG7ToHzEevsCPGtdmR6DQrwoO83eZZ5cuC83fO
         nBMYCIhrZ4u03li8Zo+382sHYoDoj/9ydPZ+hVy8RKVHYS9IM2v+ghAkf+aXFKjQhIfM
         hwXOPu6SA2qvGxXCKQ5DDXzGJ7JRjNHn76ath1YGie/RDLQ2X31Y6ctVqGA+J+585H8w
         yU9Rln8RZ9TjxfdwrmEjEoyN7cEu8/w5KwOovGkyRjbBtHKDikUgCgwwBpPGgLy9VzI2
         RjUtdK4DjaBoVL0LMnn77k/ydZI2+N2Xb0ztbvcn2s2+7xiQ7qAyhTHCT3Fp2G1kSPKI
         veOg==
X-Gm-Message-State: AAQBX9cfCKIsmSnaR11yYMWNv+Y0I/EmJZz/RboNM5M1vGVQ9sY111Br
        GmodXv5lwHXwISKqexKVcBNpwg==
X-Google-Smtp-Source: AKy350a0i43zHw0/cH8Ye04ya/XYUc5nNEKDabwcksLAb19PnFXgjqHH8//uqjFoYLzRkwBckev2kA==
X-Received: by 2002:a2e:8894:0:b0:299:ac61:dee5 with SMTP id k20-20020a2e8894000000b00299ac61dee5mr5196462lji.37.1680043085393;
        Tue, 28 Mar 2023 15:38:05 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7 00/32] drm/msm/dpu: wide planes support
Date:   Wed, 29 Mar 2023 01:37:49 +0300
Message-Id: <168004255465.1060915.5381648060712142697.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 16 Mar 2023 19:16:21 +0300, Dmitry Baryshkov wrote:
> This patchset brings in multirect usage to support using two SSPP
> rectangles for a single plane. Full virtual planes support is omitted
> from this pull request, it will come later (I'm at the final stages of
> polishing and testing, will be posted today).
> 
> Changes since v6:
> - Really fixed line width check for UBWC formats (Abhinav)
> - Also dropped R0/R1/R_MAX previously used by
>   dpu_plane_validate_multirect_v2()
> - Explicitly enabled SmartDMA for SC7280 following Abhinav's testing
> - Reapplied Abhinav's Tested-by tags with the # sc7280 comment
> 
> [...]

Applied, thanks!

[01/32] drm/msm/dpu: rename struct dpu_hw_pipe(_cfg) to dpu_hw_sspp(_cfg)
        https://gitlab.freedesktop.org/lumag/msm/-/commit/995658a1c749
[02/32] drm/msm/dpu: move SSPP allocation to the RM
        https://gitlab.freedesktop.org/lumag/msm/-/commit/476754a8ac86
[03/32] drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ff77cf2eb1a3
[04/32] drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e29bb8dfd072
[05/32] drm/msm/dpu: move pipe_hw to dpu_plane_state
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6d8635715af1
[06/32] drm/msm/dpu: drop dpu_plane_pipe function
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a2d023b21887
[07/32] drm/msm/dpu: introduce struct dpu_sw_pipe
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f2f524de417a
[08/32] drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0e2e459260e3
[09/32] drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ad03f6653014
[10/32] drm/msm/dpu: clean up SRC addresses when setting up SSPP for solid fill
        https://gitlab.freedesktop.org/lumag/msm/-/commit/49f06532da0c
[11/32] drm/msm/dpu: move stride programming to dpu_hw_sspp_setup_sourceaddress
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8148109600eb
[12/32] drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_sspp_cfg
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3a0421182198
[13/32] drm/msm/dpu: rename dpu_hw_sspp_cfg to dpu_sw_pipe_cfg
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6f32a14dcaa6
[14/32] drm/msm/dpu: drop src_split and multirect check from dpu_crtc_atomic_check
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ec72f615f49b
[15/32] drm/msm/dpu: don't use unsupported blend stages
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6a67280b594e
[16/32] drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/274a82886182
[17/32] drm/msm/dpu: drop redundant plane dst check from dpu_crtc_atomic_check()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/36ca301a498e
[18/32] drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe and dpu_format
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9a6b14e3c2d8
[19/32] drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ddb9302ca7be
[20/32] drm/msm/dpu: add dpu_hw_sspp_cfg to dpu_plane_state
        https://gitlab.freedesktop.org/lumag/msm/-/commit/949859a56a29
[21/32] drm/msm/dpu: simplify dpu_plane_validate_src()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d92254e80244
[22/32] drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4a59602f7c6f
[23/32] drm/msm/dpu: rework dpu_plane_atomic_check()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5aa11fa2f523
[24/32] drm/msm/dpu: rework plane CSC setting
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0ef79e954d75
[25/32] drm/msm/dpu: rework static color fill code
        https://gitlab.freedesktop.org/lumag/msm/-/commit/43a636a55622
[26/32] drm/msm/dpu: split pipe handling from _dpu_crtc_blend_setup_mixer
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9081cb73a25d
[28/32] drm/msm/dpu: populate SmartDMA features in hw catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b9d4f598cb69
[30/32] drm/msm/dpu: drop smart_dma_rev from dpu_caps
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a4188f96d0a0
[31/32] drm/msm/dpu: log the multirect_index in _dpu_crtc_blend_setup_pipe
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a0d1028e968c
[32/32] drm/msm/dpu: remove unused dpu_plane_validate_multirect_v2 function
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0a48a0014533

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
