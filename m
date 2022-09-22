Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDE15E6114
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiIVLad (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbiIVLa3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:30:29 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57B9D74FE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:30:27 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a8so14084266lff.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=LkD3jQHv+BqRf+/+wzrmLIW7XBT4WmGJ2Xf+6E77lbU=;
        b=EmtmBvgk03neDgJ3f0flqzedS12sROzDs2hrEQcsMUfzzTzJpsPSysdCvsqAToun04
         nmpeO7tHEXZ8mjegUQUYcGnvhNFXsMIxGGz8GwpTOOtpPhZf+AY/8xnBksAnXc3D4tya
         QN3ErhT9ooWRb7jDXBETIlpF5qYURJ8P517kXZ+3Wr36kLAJMMmuOjotIt6TBaZWIoQ1
         pEcAjNGvygroxJL6Vx5gbG82nYZNzh2MIxdOZ/vCwnAmegjfx8NXQmLxe1AXK5dd1zDS
         Mq507ehG+YD9PqiBjcnH6UdrOYkn2jU43/aGdnAcGykWx3+Rm0fUMih8giZK+bDL+11D
         s33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=LkD3jQHv+BqRf+/+wzrmLIW7XBT4WmGJ2Xf+6E77lbU=;
        b=1di6cnGTpjWcdZfE/YEFFTwXvDYPm/DpZxMjUxwxGAyoxuETLyeOVNI+Le/YfHZNCb
         RVId2sh+SkCMwHCBPanAB4L4Pxzap0fAzKpXy4qZbLR5+6uQmvCueqiBDgbn24DquH1Q
         IMC8blc7SLnrrSlzCefJY3qtwP24/pHvHlUnrh/PiAikLFaiFWAsfVu3XnJzaco6exxk
         GRPdo4GA0mI+TMVXzkgpfyqRanxD2AFxry8TLr240VmF3NF1vSsLc4ranOFfXVqpXxet
         NkG4J4DQMLmlF4cgDNkpthiinIjH1lOKyVg1NWCcruatcHUfovTfsalVYrHg1nTOnscF
         GKYA==
X-Gm-Message-State: ACrzQf07jxHyr7wkxneiegURB2mTAI2+jAPOlA1KcVBv2FV4SgOuYy3A
        cjTrq99Vxhb/5WMlUZHIHujdBz3agKbeog==
X-Google-Smtp-Source: AMsMyM5jLmRmuevxV1Zx6hXKJA7EoRFNvQ6KFDnrrY5fz9Q6cTAco/grcQKWL13VONg0Qb8Md9dvWQ==
X-Received: by 2002:a05:6512:118b:b0:492:e3c4:a164 with SMTP id g11-20020a056512118b00b00492e3c4a164mr1125188lfr.598.1663846218309;
        Thu, 22 Sep 2022 04:30:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 04:30:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm: add support for SM8450
Date:   Thu, 22 Sep 2022 14:30:11 +0300
Message-Id: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.

Dmitry Baryshkov (5):
  drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
  drm/msm/dsi: add support for DSI 2.6.0
  drm/msm/dpu: add support for MDP_TOP blackhole
  drm/msm/dpu: add support for SM8450
  drm/msm: mdss add support for SM8450

 drivers/gpu/drm/msm/Kconfig                   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 132 ++++++++++-
 drivers/gpu/drm/msm/msm_mdss.c                |   8 +
 11 files changed, 381 insertions(+), 15 deletions(-)

-- 
2.35.1

