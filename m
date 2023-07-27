Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 092FA765642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 16:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233949AbjG0OqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 10:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233175AbjG0OqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 10:46:05 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064DE30EA
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 07:45:47 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so1840141e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690469145; x=1691073945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AaVR++jkAbk5lOudvbAkb+yuYak09u1ZunnxV6fVwE4=;
        b=KznsrfP3bnT1LvVctNi3r+GWeMYdM8x8wGXQizIHC4eGlhDAlO5SuCh1+SDJ61/Kpk
         55xRPpguyS5txEdcSdp5rkBAschmdj/XB6fW7gGVh/JoFVVOACvi9qa4cLxmer82PpVS
         ZM9eWMiTXccRHATZmjigTUfClXw8iIWaFEipYO/AdRY22O69A16YWvdcL5fY4h+h5A/2
         Nq4APVomnRhchWRJHTx2SiIYKqY6Ze199UW1fZnbMn5ZyoIr3JYCWY+yqXYyFMpRhv+f
         nPJ1IaidhpLmhzYL6WfmH/sOI2q67zkPyF3ITXu3+iENbAnRwDv4B+0OXA9mI3RYQIe7
         4zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690469145; x=1691073945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaVR++jkAbk5lOudvbAkb+yuYak09u1ZunnxV6fVwE4=;
        b=QS24VSJeskpcyV+ifxBuFB6eHpn833Lh7OajtCc4B1sXrf704WKv/xr2fFwz3lHucL
         +/pypDi7oQH/3WLXBl5g/z0KCY+/H470W+uy8aNCRK7Q5OVd1WYbuAqqD6z5D6ibT9Ww
         JyuD3rIlFRsqFlASOUCniXuL/BzAWHjOFEnUCo0MmJsOQXM0M1Y/4zF0O0957Sir4MyX
         1t5JfN0tzPwsuYB7DTt10bWx6rTBShjoXXaWRajGyBoP/QAMxmNLC1g0XHmNSi80LyDL
         acc67nxB4qc2eRZxigj63YzkV0UTNocLeCkZNGVQ1YlP9i9dlDDUypXCoKc9m025fimx
         65Xw==
X-Gm-Message-State: ABy/qLbSLqRBEM/d+SZ/JHa+1E9xBwNStlrQGXTUBqyPO7/glQpBJExJ
        DZGVKavzsUz5QvZtHujT1pXwXA==
X-Google-Smtp-Source: APBJJlHcNaVsnq5IxLwKHZK87F69UYwFuKz7uKNszuET8IAmX7/wC5TbZLXxF0i9Uw+NvD4BgLLdrQ==
X-Received: by 2002:ac2:43ad:0:b0:4fd:f878:c3fe with SMTP id t13-20020ac243ad000000b004fdf878c3femr1744140lfl.43.1690469145136;
        Thu, 27 Jul 2023 07:45:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:45:44 -0700 (PDT)
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
Subject: [PATCH v4 0/5] drm/msm/dpu: rework interrupt handling
Date:   Thu, 27 Jul 2023 17:45:38 +0300
Message-Id: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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

Please exuse me for the spam, I missed the triggered WARN_ON because of
the dropped patch.

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this static configuration with the irq mask
calculated from the HW catalog data.

Changes since v3:
 - Rework INTF_TE handling. Stop depending on DPU_INTF_TE and enable the
   relevant interrupt explicitly.

Changes since v2:
 - Rebased on top of msm-next-lumag to be able to use core_major_ver
   instead of adding yet another flag.
 - Dropped the DPU_INTF_TE movement patch, useless after rebasing.

Changes since v1:
 - Enable dpu_caps::has_7xxx_intr for DPU >= 7.0 (Neil)

Dmitry Baryshkov (5):
  drm/msm/dpu: inline __intr_offset
  drm/msm/dpu: split interrupt address arrays
  drm/msm/dpu: autodetect supported interrupts
  drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
  drm/msm/dpu: drop compatibility INTR defines

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   8 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   9 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  11 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  13 ---
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  10 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  18 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 106 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  18 ++-
 19 files changed, 87 insertions(+), 190 deletions(-)

-- 
2.39.2

