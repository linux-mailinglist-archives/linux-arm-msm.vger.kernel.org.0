Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03E6853B9AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 15:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235319AbiFBNan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 09:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233869AbiFBNan (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 09:30:43 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA733A180
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 06:30:42 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id a17so876818lfs.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u3whyehpi0aZCL0iJ2vFWoTKNdbN9RZd/7JoMAO4pSc=;
        b=w0WrhdGE6Xjz/JLc7g9BFS2Yxgn4ta8BjzEhys1Q09fliDtkgxhIZTu5Z3A3fTueO9
         8fqIdvpV6L80t6WIeGUQPWmfqPbL3DhbTELR2bL6DCzkFivhotsgkrJggun0OoJplkzm
         XqyJ7q7IKAod117wVmUZlG7OOnqnwwpeC9VVykFpPgDt4qDC+62A+USnA3V/9iB+fSDI
         Aa4ctRn0nA332JPPVy/0oil3RrjgSOgm+i+Oc+8niuXlELV54c1UC8+EZTpZKCLopcXL
         qIk7li5O+SqwjAdBGwsaXcbnL6CrmhbiYKroh/RPhVyhx1fK5ftyiU5E24Dcm1WUeNhU
         pYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u3whyehpi0aZCL0iJ2vFWoTKNdbN9RZd/7JoMAO4pSc=;
        b=hzTaQMmPp5ScU2YmUEqFOIOTWxMOrfZh1dvkdUUE8t6OuJw59QCxIpp3QkhULd8S6z
         JP7YWVOgHujMyWTh0nFqDr74yKjOZMRVQdC4brUaOmpG2tUuaGTDvn7OvHErwZIh4Smt
         dwRVllrwikgPbHWcEQH2KhERrh1yBsQUaZzuoOq7flgjvL3lybtolVF0QKLp/zG8xGhm
         KCK+Vnm0XCE6zfcp8jO2JfXxhrFTnXqTpZgJr/Wm5uI0CObj9yuoyyKSfFXt/RsilkF7
         y6BuA8X9bQeaGuPxU/HvV+npFhoE83g71CCudyBPgxguPe7hyc59FNs0Yo8ZxI9dQ+1p
         tAGA==
X-Gm-Message-State: AOAM531gos2SIQzRye+BLuf3zy3Yb29eiPNRxabZDfu5JIQC9tefYIMC
        CUL5JLsM47Dm+MqJ+TzQuil2lxzDgyJ/fIoT
X-Google-Smtp-Source: ABdhPJwFnfXhKy3OI3IhgNTaU8saaxeVINMCI7Yz4/mhqO9i/NQxz2ls+H55yXTyM6K+JhIF1o80KQ==
X-Received: by 2002:a05:6512:31d3:b0:478:6a68:e24 with SMTP id j19-20020a05651231d300b004786a680e24mr3764732lfe.364.1654176640376;
        Thu, 02 Jun 2022 06:30:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i20-20020a056512341400b0047255d211a2sm1025399lfr.209.2022.06.02.06.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:30:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/msm: clean up the hw catalog init
Date:   Thu,  2 Jun 2022 16:30:32 +0300
Message-Id: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Replace superfluous cfg_init functions, which just assign a static
config to the struct dpu_mdss_cfg, with static instances of struct
dpu_mdss_cfg.

Changes since v1:
 - Turn catalog->perf and catalog->dma_cfg to be pointers, otherwise
   clang complains that they are not constant.

Dmitry Baryshkov (7):
  drm/msm/dpu: use feature bit for LM combined alpha check
  drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
  drm/msm/dpu: remove hwversion field from data structures
  drm/msm/dpu: change catalog->perf to be a const pointer
  drm/msm/dpu: change catalog->dma_cfg to be a const pointer
  drm/msm/dpu: constify struct dpu_mdss_cfg
  drm/msm/dpu: make dpu hardware catalog static const

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  12 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 500 ++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +-
 27 files changed, 282 insertions(+), 358 deletions(-)

-- 
2.35.1

