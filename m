Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 265516A5838
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 12:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbjB1LeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 06:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbjB1Ldz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 06:33:55 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEEE2B619
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 03:33:45 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id g17so12734544lfv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 03:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gksnxxX/SJU2VlO4S7zB6Wz+KfFZU/24XQ8BPKrME5w=;
        b=NtrmDXViP7EaLyJEdD7F+GwcHKGGv5Q3nGsFLVTXQh22Ev3JjLpBUDCys87d6I80Mt
         FPKVMcrsiYuHpJX5Q+1XwH4aANtwIc2KPClmfs5gZ8OnXKPHCCBLkwzP/ty6/aj9mwTw
         e7zvElqY+r7PS3FOpFnwBTMxiwrdyha9+fveC8flGbwOfYKPJ4oyGKcrrE6NNf1hng3Y
         /N+kq1kpDgCJgueGAGkl4r8apJAVK+mr6y4q9dmGgNEPiPbDKyS6RjaxaaQlJTSJB0Qk
         Gw3oQFK/Mx7/eePDkC75SftPYjPhWZi27cz+wRAXyEKpgPrYyOUWyG23H+T1R3J0ibQC
         QSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gksnxxX/SJU2VlO4S7zB6Wz+KfFZU/24XQ8BPKrME5w=;
        b=xV+eu4+pue6KfhaOpzh2TxZURyRcLtsl2O2cVsjWWW0nXCYBsPYnJmQZ5bUaYXzNM0
         Pcnt5mso6hLYDeo9uVFyKYm36AlFXavxZrqbqS5wapo89MMls/SBQ8dGWZhVkiDOfr8+
         jzNw19h3mB7LfSNEsIgpc2/IL3kPpc4+Pk3ALzTX2i/HNNNS7soJtrWURUEuN7EM6dKS
         NSk2ynCYHfYxLEHwmQp/lhuGTpbkkKVfW/veiR3W9EafXKSlRlNUfHkJZG9iM+MuEpMl
         ihDy4/Lfeu4CaTQxm1VFbKAe1DivCvsBY1zv2X7bXh8qRfP+IrSJ6eFMDcenSzpoSL3m
         12uw==
X-Gm-Message-State: AO0yUKVuaxNT+W3tRtT12iTRng+RnLx8fHJHivT34EKWwcu0UL5ve/wt
        j0TQ/RVXJ5abzkS7cU39dDSqCQ==
X-Google-Smtp-Source: AK7set8LyLZxJ6mqchlZfX9cUnQCtJhEHIcCkYIveiPayIAkSS+07aUaymBatka4CHPDvAxThlXnew==
X-Received: by 2002:a05:6512:481:b0:4db:ee9:7684 with SMTP id v1-20020a056512048100b004db0ee97684mr681618lfq.56.1677584023607;
        Tue, 28 Feb 2023 03:33:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h20-20020ac25974000000b004dd0bbc89a1sm1288472lfp.244.2023.02.28.03.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 03:33:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 00/10] drm/i915: move DSC RC tables to drm_dsc_helper.c
Date:   Tue, 28 Feb 2023 13:33:32 +0200
Message-Id: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Other platforms (msm) will benefit from sharing the DSC config setup
functions. This series moves parts of static DSC config data from the
i915 driver to the common helpers to be used by other drivers.

Note: the RC parameters were cross-checked against config files found in
DSC model 2021062, 20161212 (and 20150914). The first patch modifies
tables according to those config files, while preserving parameter
values using the code. I have not changed one of the values in the
pre-SCR config file as it clearly looks like a typo in the config file,
considering the table E in DSC 1.1 and in the DSC 1.1 SCR.

Dmitry Baryshkov (10):
  drm/i915/dsc: change DSC param tables to follow the DSC model
  drm/i915/dsc: move rc_buf_thresh values to common helper
  drm/i915/dsc: move DSC tables to DRM DSC helper
  drm/i915/dsc: stop using interim structure for calculated params
  drm/display/dsc: use flat array for rc_parameters lookup
  drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
  drm/display/dsc: include the rest of pre-SCR parameters
  drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters
  drm/display/dsc: add helper to set semi-const parameters
  drm/msm/dsi: use new helpers for DSC setup

 drivers/gpu/drm/display/drm_dsc_helper.c  | 1001 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c |  432 +--------
 drivers/gpu/drm/msm/dsi/dsi_host.c        |   61 +-
 include/drm/display/drm_dsc_helper.h      |   10 +
 4 files changed, 1058 insertions(+), 446 deletions(-)

-- 
2.39.2

