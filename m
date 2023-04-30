Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3866F2AC0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Apr 2023 22:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjD3U5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 16:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjD3U5R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 16:57:17 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8FB092
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:57:13 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2a7ac8a2c8bso19301891fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682888232; x=1685480232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EdMs9PnBlFXX1tXo5IXm/xCYeEZWhh1WfqvD9B32TZs=;
        b=wcb9DIiaiQMAeTb56/HFi2Ya2rbjBAZoLAmde+J+JwpOCqEFjy+PPIp1eXJ5vZ05b1
         ZKrKuH+Dxd3TH3TcIvhRPlfcqGl7UlWQJM0RCWBtHJIKm7kw2dnDX+HGFbEjE+7LQZ80
         7Uoo+xk5Mk84ObZ1EBkaBImnfOFFQTcDfDaIH0RghIhLG7F9+xyB5RXQ2akYicsZK3D3
         y2CDfVcP068aSLHujHo58Smlt/AlMFHKNACDgLCiMRNcwpv1Owo2vdhq8maXBVsRso1o
         tNubnfU81EtABUJ18OQg9wM+rEC1y64HXFT4JcJDwkjBxhcu9efd/2l8vEv45hu0cwwg
         0x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682888232; x=1685480232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdMs9PnBlFXX1tXo5IXm/xCYeEZWhh1WfqvD9B32TZs=;
        b=js0Raqw3m4ITBkQOfAFkoLGfmzwfFzI5vg2wf4G7yL0LAdJBEdj0P1PO1ykLPJqusM
         fZWNjp6d+4s5gXrMfFRIFQdvOk03codvVw85bX0+wJs8VwALlHDbm4sImIcDftmyxVie
         eyiYOw7bFD6KPqj1MI2/gplYmkAXvlVu8mOo4yfVoGNZXdEdEnpujEP1FdHwz0XztOt1
         bG7BzyzrjMvAj74/u2rclhL/pYQP3nFOQwZ/ZxjVLBNazN732d+HiipzkymaxhsUAGh8
         ZPdGJTH6JfigWeafJeYx25OvvaZv8IQ3Byh/MEMJcwB34X/o3uzUdNTDCJd0sx4dJN9Y
         BecA==
X-Gm-Message-State: AC+VfDwV/fksCnSXaeGG7Bj+GNsgUi0MORJhDxwVJmBOu3u4+sInsmyi
        cb7ddWB+UNRCHZ03HJrb34mohg==
X-Google-Smtp-Source: ACHHUZ7WHu1hRnO/qgQtmzUhD/QlSVcPuAQZNmO6atBSNNmB7GcSdSpt8XVFQPULV8Voab5EEDNmfg==
X-Received: by 2002:a2e:721a:0:b0:2a7:76ab:c42 with SMTP id n26-20020a2e721a000000b002a776ab0c42mr3266826ljc.46.1682888232061;
        Sun, 30 Apr 2023 13:57:12 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 13:57:11 -0700 (PDT)
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
Subject: [PATCH 0/9] drm/msm/dpu: simplify QoS/CDP programming
Date:   Sun, 30 Apr 2023 23:57:01 +0300
Message-Id: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
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

Merge SSPP and WB code programming QoS and CDP. This allows us to drop
intermediate structures and duplicate code.

Dmitry Baryshkov (9):
  drm/msm/dpu: fix SSPP register definitions
  drm/msm/dpu: simplify CDP programming
  drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
  drm/msm/dpu: rearrange QoS setting code
  drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
  drm/msm/dpu: simplify qos_ctrl handling
  drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
  drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
  drm/msm/dpu: use common helper for WB and SSPP QoS setup

 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  23 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 142 +++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  52 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 168 +++++-------------
 9 files changed, 195 insertions(+), 353 deletions(-)

-- 
2.39.2

