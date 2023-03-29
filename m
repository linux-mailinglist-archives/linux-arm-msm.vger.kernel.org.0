Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC216CCEDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 02:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjC2AhP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 20:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjC2AhO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 20:37:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506DB1BCA
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:37:13 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e21so14406302ljn.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680050231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BoN+U4KTTFxXWQmwg13Yxlkx1E7Pohg3WEKsSIowviU=;
        b=uKWAwoxBzBWP0lm4jboJdDtbdnJQFPCUPy64D25rIUT6v7Iw2HVipwvHwuZBBIA3nd
         lDbGgXUvGX5TLQH367xV+SpRrOzokAqVyK8x52/0933V4EM7LdPupCFkQuYUwkIT2b4w
         Vem8bKb2NLTOsfHs0ULO+Sgy1KGBX3UyGpJzWlofXfJg2T6r5TeHLViHEVefh6optPpr
         +eBOo/spXoY3XSCqTkumK8CI9tqgizGBXI0kOuhYpM9EOFqbRtd9bdKqbf1saQVaZ54/
         6vQ40EgFMFDgqwKDzyqF0Lsm8Npz9On5Phvkp7ut0jiDQKnIHxIkNpFdW9j11p7bE2yh
         Ty6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680050231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoN+U4KTTFxXWQmwg13Yxlkx1E7Pohg3WEKsSIowviU=;
        b=ybtxX0D/4AHUsPaqSSqLrWP4FFXNs08Zj5cxVMFpCYiQAEmaBgYOYfGYxEDBfH7CJx
         BBwl5hpRqXYL2UoT/5I2EnCERXZt3KsrXD6pbYlrPBH31HShYdFrqtj8E6heOsECJL0e
         GGebhcz0MjQ2XPCT+uPdzBQk3fp2NZDtrsieZwUxqLW6RAcbEaZYDc3IgIWfqwr+FlV8
         maAiSNApWgT63SC2nKJuPRsMQXMcgCoYDvLGFke/VKpVNlQwwLmAP+NF0eyNpjoiiRDf
         4wNvZCErj22O5NoGFGNRAu+y+2PKeq9TJ4fJZGfXGIhroDIMoBa87KAD7baCR4NMQN6N
         1D/g==
X-Gm-Message-State: AAQBX9dM2W59juu/lGmCWyvCyvbUPYmWbFEHBjH1BBBauwx0NqeE2Qux
        a5n9DDCP0RD5QoNm1Ql90chJbw==
X-Google-Smtp-Source: AKy350a2RS08zoZZOG+BWubmWseK/rNgE24Z6x1MnkaDt3fQcNspibs70tW9EreTz3AVcoQITjjJIg==
X-Received: by 2002:a2e:910e:0:b0:29a:fe9:3b2 with SMTP id m14-20020a2e910e000000b0029a0fe903b2mr5273444ljg.36.1680050231542;
        Tue, 28 Mar 2023 17:37:11 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y3-20020ac24463000000b004db00b4c671sm5254138lfl.7.2023.03.28.17.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 17:37:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
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
Subject: [PATCH v3 00/10] drm/i915: move DSC RC tables to drm_dsc_helper.c
Date:   Wed, 29 Mar 2023 03:37:00 +0300
Message-Id: <20230329003710.1073261-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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

Chances since v2:
- Rebased on top of drm-intel-next

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

