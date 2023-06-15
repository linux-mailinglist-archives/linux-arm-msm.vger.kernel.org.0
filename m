Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7FD9731697
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 13:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245638AbjFOLbj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 07:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245084AbjFOLbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 07:31:39 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAEF270E
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:37 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b1acd41ad2so25735671fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686828696; x=1689420696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HIhvOoQ0TWNFRCD6jSrp6XPbshCV+o8gS0gvm0cA9c=;
        b=codcU07VH/1l08yBIe8moRDqekQ+qa9MA24meplrjB/GfjiERlvYVyBtjKgqtGTcSm
         VINdEP3TNkQnD9GbpHjYkEiITOCr/EbeGdP2Mm+wassaHN5acrruRQFAVkMF4I0qmwBD
         d2PFSC7IRgnox6FKWApbOQbFYetb9QuMYt1jHgXN4OOVtppIAsyyefh0YgWDekvLngVY
         UUX0o7ZHBzhMqIod1PN5WmAYwr0XlzjJss1yLK71gHsSORVvLD3fMB3w8okLT9PL7+pS
         KOHDWis+GoihcNcIdSKhnpM3k8odHTEvpJ9GzwOkCNH7GCMIMQAYGBCEWQw/PaCFpkOh
         F6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686828696; x=1689420696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HIhvOoQ0TWNFRCD6jSrp6XPbshCV+o8gS0gvm0cA9c=;
        b=ko9Wz1SwO/O75B9yjGxEuFAgFFrBnZ3zDCvge27zXG211YU9rTFy22kJ1Jq9b6O1C2
         27o9Z+Hqd/R75lhwnWa0wpOZMLSIt5K+ooXpBVvaqKgFzunajuvDKEn69hw6i5d3fgft
         xIoiLXxAaFS3WkiaZW1fKVLOSmpXOWBFBwFwupsRb0EhjrwMHS5Pi/ArieMeBlb8EvXK
         8NtRTs7sDWwAaAtSApVgYf0wGpgpChpPmckhW9Wtm6TggzTx7/JGBjX3kjspICckOvnA
         QqZ/HgIIcpMRNM5sWer/rof0ObzEAo0LscmcaHHA4Q5cGbCBFE6NvqYCKFpf+sLsnWvK
         JQdQ==
X-Gm-Message-State: AC+VfDygXHkCnwidALRsdcSmPFRfpzkFi4vid/bfjrUraccqBme8nPO3
        xWmUU7jEePUQboVJGP4mDv/4lg==
X-Google-Smtp-Source: ACHHUZ7SSADcaAPRP5KYn2CMl2Rq1NcPT9lS6upii8Us8pO9C2lbr1tZ4cZdHrkss8uyf21GnV3qJQ==
X-Received: by 2002:a2e:95d2:0:b0:2b1:daca:676f with SMTP id y18-20020a2e95d2000000b002b1daca676fmr8191322ljh.36.1686828695949;
        Thu, 15 Jun 2023 04:31:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     freedreno@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v14 0/9] Introduce MSM-specific DSC helpers
Date:   Thu, 15 Jun 2023 14:31:25 +0300
Message-Id: <168682860388.384026.1953512234094498484.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 24 May 2023 10:45:13 -0700, Jessica Zhang wrote:
> There are some overlap in calculations for MSM-specific DSC variables
> between DP and DSI. In addition, the calculations for initial_scale_value
> and det_thresh_flatness that are defined within the DSC 1.2 specifications,
> but aren't yet included in drm_dsc_helper.c.
> 
> This series moves these calculations to a shared msm_dsc_helper.c file and
> defines drm_dsc_helper methods for initial_scale_value and
> det_thresh_flatness.
> 
> [...]

Applied, thanks!

[1/9] drm/display/dsc: Add flatness and initial scale value calculations
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7df1ed6ddf3d
[2/9] drm/display/dsc: add helper to set semi-const parameters
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e871a70d8ccd
[3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
      https://gitlab.freedesktop.org/lumag/msm/-/commit/688583281241
[4/9] drm/msm/dsi: use DRM DSC helpers for DSC setup
      https://gitlab.freedesktop.org/lumag/msm/-/commit/49fd30a7153b
[5/9] drm/msm: Add MSM-specific DSC helper methods
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b50f06f83e0e
[6/9] drm/msm/dpu: Use fixed DRM DSC helper for det_thresh_flatness
      https://gitlab.freedesktop.org/lumag/msm/-/commit/44346191a210
[7/9] drm/msm/dpu: Fix slice_last_group_size calculation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c223059e6f83
[8/9] drm/msm/dsi: Use MSM and DRM DSC helper methods
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ed1498f77419
[9/9] drm/msm/dsi: update hdisplay calculation for dsi_timing_setup
      https://gitlab.freedesktop.org/lumag/msm/-/commit/149419396a92

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
