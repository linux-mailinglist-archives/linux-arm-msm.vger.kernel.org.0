Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89881706515
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 12:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjEQK2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 06:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbjEQK2M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 06:28:12 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584973C30
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 03:28:10 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ac770a99e2so5214751fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 03:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684319288; x=1686911288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UaapKQTgqt42Y+aSTlZRYOojhuaRvMeWFJhrnG9fR4Y=;
        b=g0Fb+8BqqT9a+uCaxy9zuhaDOeYvt66sSthalNiZ0pB8MVel/mj3CQlOvGGvtWNq9u
         6oNvodm1jHFvBxapZuaCZgkUNAoVJb3gjR0QKmwvULdGCvUr7OA0b4brEV0Z9qFIaG03
         N0AQV+7Upc0VAfTY8BWJDYdvl7wtrQUaMUX5a38grDqyL8nGLzRGrtudNgt8NaZMraKJ
         pbJbAhBgQDTsUwBRGlvqoOZP1qGp8ETTUP9iTL0g1DaLW/XjT/QYzy3wm+s9xB/4NRxX
         Sz/9MSF+eOrHNGWr8kqtDdB511hnBVQ7++h7H+6YBs7RDG/KYiAsnx0up5vxpO3+dV/h
         KABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684319288; x=1686911288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaapKQTgqt42Y+aSTlZRYOojhuaRvMeWFJhrnG9fR4Y=;
        b=fpnjTU/8weAeFa6BCX77iP7BSboQlyVdy9/8v9fla9Vokjy5aRjf0eOhg/Rs0ZrGcg
         NN/o3ESzX3EYkG7EucEYo2TceqaJ0j/NzdTVYaAsBM2FKOyHKPYAP+gZltPeAUfsAytu
         vfjpEm7JdkXh5bJYa8xtkmjZ6kJzEZXzvmF62eD16gvbIFuVtTuiBAC+4AZRFJRnzg5Z
         oE1+H6N719FwgxJo1mUvwyfNiSDnsOYMPNWFeqUyx6Y03i820d3CqouoNTwIwxl5Qn/h
         1SclouyVsw59sVKJGmUbzNOeTNd0xEQwKG9GX4UHQ1JLvgvyqyQh3iAoN6etJZxD2lYb
         LmuA==
X-Gm-Message-State: AC+VfDyfsJPOTQDZj21FlioeZcST2qcOYd23LyhqTCD6iy4wbDPrEIXA
        NeMNd9A3URBVo3b4wPR/eZho2g==
X-Google-Smtp-Source: ACHHUZ6YthURubL5hbSqVlTDf6PEgfpMFUcCSadv2rtJ6KlbB9mdng0+Mjk122ro12zyj8Don09oiw==
X-Received: by 2002:a2e:a3c9:0:b0:2ae:e05e:76b4 with SMTP id w9-20020a2ea3c9000000b002aee05e76b4mr3167811lje.28.1684319288591;
        Wed, 17 May 2023 03:28:08 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id e16-20020a2e8190000000b002ab017899e8sm4495356ljg.39.2023.05.17.03.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:28:08 -0700 (PDT)
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
Subject: [PATCH v7 0/8] drm/i915: move DSC RC tables to drm_dsc_helper.c
Date:   Wed, 17 May 2023 13:27:59 +0300
Message-Id: <20230517102807.2181589-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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

Chances since v6:
- Fixed a leftover of kind/type conversion (Suraj, lkp)

Chances since v5:
- Fixed typo in patch #2 commit message (Marijn)
- Reworded/fixed RC table comments to mention DSC standards and C model
  versions (Suraj)
- Renamed enum drm_dsc_param_kind to drm_dsc_param_type (Suraj).

Chances since v4:
- Rebased on top of drm-intel-next
- Cut the first 8 patches of the series to ease merging. The rest of the
  patches will go afterwards.

Chances since v3:
- Rebased on top of drm-intel-next
- Dropped the msm patch to make patchset fully mergeable through
  drm-intel
- Made drm_dsc_set_const_params() ignore rc_model_size, picked up
  drm_dsc_set_initial_scale_value() patch by Jessica and switched
  intel_vdsc.c to use those two helpers.
- Added a patch to make i915 actually use rc_tgt_offset_high,
  rc_tgt_offset_low and rc_edge_factor from struct drm_dsc_config.

Chances since v2:
- Rebased on top of drm-intel-next

Dmitry Baryshkov (8):
  drm/i915/dsc: change DSC param tables to follow the DSC model
  drm/i915/dsc: move rc_buf_thresh values to common helper
  drm/i915/dsc: move DSC tables to DRM DSC helper
  drm/i915/dsc: stop using interim structure for calculated params
  drm/display/dsc: use flat array for rc_parameters lookup
  drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
  drm/display/dsc: include the rest of pre-SCR parameters
  drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters

 drivers/gpu/drm/display/drm_dsc_helper.c  | 1006 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c |  443 +--------
 include/drm/display/drm_dsc_helper.h      |    9 +
 3 files changed, 1062 insertions(+), 396 deletions(-)

-- 
2.39.2

