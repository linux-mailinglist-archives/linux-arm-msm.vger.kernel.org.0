Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1ED96AE143
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjCGNu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbjCGNuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:50:12 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB3985B09
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:49:06 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id h3so13167447lja.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678196943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb2LmnLi9basFISjOnLYVYII1gXbNsybO5NwslYa35o=;
        b=y5kdLG/CBTv1qYMVbgsbQeTOHeQMI8G9XDuZXNc96uOVtssp6YhJLSeXOrQ2jH50IZ
         FljEbFw2e+IW6vy4QWULUdmNqTzbmIego6uGmRD1vhP/gZC623DDjvqdrChhhiSC1fPX
         +vKNXogjsgeKk6A0H4etjM3EpEd0f8y1yjdQ6KmLD6iStAshFU86NKreH+5a2B8ll1zX
         SxR+jbkueDbdARhXvTPob9Kozx4jYFP4Cbj12Pv4IPx0B9z6BGZaAR+jBZq+RXNTzMAP
         cddh40ShcQxcB11Sp4/XDEcAcHuLLiHJGpDdV5IBpsqjNAlfvNHBdJroCW4LeANLwGuS
         pJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pb2LmnLi9basFISjOnLYVYII1gXbNsybO5NwslYa35o=;
        b=qTXwewt8CMkRuBqDnUja5GiIcDh3P9WFSGrXM6nPJOitz8kOKN0+g3ZzdQNWuL8gAW
         xRSWSbRm2qVAvV4nWnZ3UfVVR7BzuNYFR0g52aOhaOf5GM4kkUUv2x9AUxwC46PKdgWr
         F1roApph1XttotP4nasG+JH2MnSoTGtjU0L6jTJrxAd96GdXeqXehtnr9YNFMyhqLyWP
         DpHZGkx3MoXyK4z3OWEK3filZkQ7az/CEtY9aprmcBCAb79mIxiDuL0hR7yOXf8lXFcK
         fpDlaIV8iLGJSM1ZGWZ7M3Ss+ixAtEa4ir4fO/pBjIUOK9k6sQ8C5qWZqsu5x/yDKsej
         Vm3A==
X-Gm-Message-State: AO0yUKVUtUj+SG0x8XzxQiTR8tgx8HXJFy2wpqoUiryPyAFjZgHFNcyM
        ayiFujFas50CiB0SU6NLdaZJ8g==
X-Google-Smtp-Source: AK7set9aCXsQLLKfITapXEIME/b4HoKdOBCdpKVV0DLrLhqwUFd2zh0HuWLHU7kJQQr/1adKaapnew==
X-Received: by 2002:a2e:a58b:0:b0:294:7360:7966 with SMTP id m11-20020a2ea58b000000b0029473607966mr6924106ljp.30.1678196942974;
        Tue, 07 Mar 2023 05:49:02 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u14-20020a2e91ce000000b0029597ebacd0sm2128991ljg.64.2023.03.07.05.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:49:02 -0800 (PST)
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
Subject: [PATCH v2 00/10] drm/i915: move DSC RC tables to drm_dsc_helper.c
Date:   Tue,  7 Mar 2023 15:48:51 +0200
Message-Id: <20230307134901.322560-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

Chances since v1:
- Made drm_dsc_rc_buf_thresh static rather than exporting it
- Switched drm_dsc_rc_buf_thresh loop to use ARRAY_SIZE. Added
  BUILD_BUG_ON's to be sure that array sizes are correct
- Fixed rc_parameters_data indentation to be logical and tidy
- Fixed drm_dsc_setup_rc_params() kerneldoc
- Added a clause to drm_dsc_setup_rc_params() to verify bpp and bpc
  being set.
- Fixed range_bpg_offset programming in calculate_rc_params()
- Fixed bpp vs bpc bug in intel_dsc_compute_params()
- Added FIXME comment next to the customizations in
  intel_dsc_compute_params().

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

 drivers/gpu/drm/display/drm_dsc_helper.c  | 1007 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c |  443 +--------
 drivers/gpu/drm/msm/dsi/dsi_host.c        |   61 +-
 include/drm/display/drm_dsc_helper.h      |   10 +
 4 files changed, 1072 insertions(+), 449 deletions(-)

-- 
2.39.2

