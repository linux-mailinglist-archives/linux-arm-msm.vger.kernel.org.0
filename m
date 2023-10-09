Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B180F7BE8DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377350AbjJISKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376898AbjJISKo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:44 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6612A93
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:43 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50435a9f800so6218296e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875041; x=1697479841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cf3Eadkqm6Sq6Z7urOC8V+yKfv/PCxBmCl4bdQV2+XQ=;
        b=G6h+q2zojkg7WARNxyJFb5z6imJvlmBxNRpTjmanrPRVapiHSA5WgvXExRtfCvn3Lu
         O9oSVnpKScjbDUbuoLOqtdlxQ2Wp34qNs9beErcD4pweKP9lSDjKqWle7Af+BVirywSw
         rTqR5PtZ0qEGB2C8Z4cNFnbzpEccERM+pWHxgOM0cSAvzjRsGsI8g8UQ3Mc/DebiSwh6
         5H7LzYF82VEJbDxdDkFwiTeelgNRPoPqEWBLPAoI6Cm3bcuznZgZeRf6E6EkP0QUwnIf
         NlXjmC154Ec/KM+em8YSzTjMgaDnWI/MILoAse6VOPWF+dsVTauXe9e5NSPRLzYPAYtW
         T4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875041; x=1697479841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cf3Eadkqm6Sq6Z7urOC8V+yKfv/PCxBmCl4bdQV2+XQ=;
        b=m1JMIT184L521UiMRBu+XTtIEyCAe1enJvPWoNKXYtnZaROO/W5Nz0HOPDMxVyqE3e
         xQ2wZdW0p3I6mI0wsMBDttmkiHtVsZZL2gJ/m/ZvIP8XJE4P4BfoZRFaIs8uNDPG9Ck/
         bzzyygF2CcAg6zu9vVwBAHLwDw6uPGuIgirC/FVMawQSPCwgsTkGKq5jGc+yD5rGu37L
         +JGB86h7oGwr2MKRgwTjc8c2pvdNn/UnF9EEi/lT4/nUDw4TvO5VJ1yNmD5u/SkbnhpZ
         N6RiSmZ718aRvCurvCZoRuZNmYKlQFTJZecBhFx7y2TkvhbRlgnIz8mvaPt+WA8FM19n
         3/6w==
X-Gm-Message-State: AOJu0YxC6toxscu1arpxtcUgPhz6bfFc0wM4v0xqQDE56C1czEaPcK8l
        ZTEsjddIP3l1BcnRMh+GHgnbvw==
X-Google-Smtp-Source: AGHT+IEK23tBwzVPwBfjqxe7yhl9FWdLr7i7xfW87bmEbQPI3jGg+3emkhmQPpGKruvAUsHPjglIpw==
X-Received: by 2002:a19:4f0c:0:b0:4fb:7675:1c16 with SMTP id d12-20020a194f0c000000b004fb76751c16mr11472469lfb.49.1696875041633;
        Mon, 09 Oct 2023 11:10:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:41 -0700 (PDT)
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
Subject: [PATCH v2 00/13] drm/msm: move KMS code from msm_drv.c
Date:   Mon,  9 Oct 2023 21:10:27 +0300
Message-Id: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

Currently both msm_drm_init() and msm_drm_uninit() functions are trying
to handle both normal and headless Adreno cases. This results in a
suboptimal code, since headless case still gets modesetting and atomic
interfaces enabled. Two mentioned functions are a spaghetti of
`if (priv->kms)' conditional code.

Move all KMS-related code (not limiting the init / teardown path) from
msm_drv.c to msm_kms.c, making it more self-contained. This also
disables ATOMIC and MODESET features for the headless case.

Dependencies: [1]
[1] https://patchwork.freedesktop.org/series/105392/

Changes since v1:

- Rebased on top of linux-next / updated version of [1]

Dmitry Baryshkov (13):
  drm/msm/dsi: switch to devm_drm_bridge_add()
  drm/msm/hdmi: switch to devm_drm_bridge_add()
  drm/msm/dp: move pdev from struct dp_display_private to struct msm_dp
  drm/msm/dp: switch to devm_drm_bridge_add()
  drm/msm: remove msm_drm_private::bridges field
  drm/msm: drop pm ops from the headless msm driver
  drm/msm: rename msm_pm_prepare/complete to note the KMS nature
  drm/msm: remove shutdown callback from msm_platform_driver
  drm/msm: rename msm_drv_shutdown() to msm_kms_shutdown()
  drm/msm: switch to drmm_mode_config_init()
  drm/msm: only register 'kms' debug file if KMS is used
  drm/msm: make fb debugfs file available only in KMS case
  drm/msm: carve out KMS code from msm_drv.c

 drivers/gpu/drm/msm/Makefile             |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |   6 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |   6 +-
 drivers/gpu/drm/msm/dp/dp_display.c      |  34 +--
 drivers/gpu/drm/msm/dp/dp_display.h      |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c          |  21 +-
 drivers/gpu/drm/msm/dp/dp_drm.h          |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.c            |  28 +-
 drivers/gpu/drm/msm/dsi/dsi.h            |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c    |  30 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  22 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h          |   5 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c   |  30 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c      |   3 +-
 drivers/gpu/drm/msm/msm_debugfs.c        |  12 +-
 drivers/gpu/drm/msm/msm_drv.c            | 362 ++---------------------
 drivers/gpu/drm/msm/msm_drv.h            |   9 +-
 drivers/gpu/drm/msm/msm_kms.c            | 345 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h            |   3 +
 20 files changed, 451 insertions(+), 478 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_kms.c

-- 
2.39.2

