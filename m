Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68011708B67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 00:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjERWWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 18:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjERWWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 18:22:43 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A783EE56
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:41 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2af177f12d1so13729061fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684448560; x=1687040560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTrPPkXtAjgeany9T7/bBVZNtr7AELIKsku0nhssAqM=;
        b=hrnegy+xhZZXCvWS8IxDzACL9QQIycl7nNn/3w+q/2Bs4wHgZcEckWBTTWYofZPsKj
         +/vWZD+tU5R84dlYFv1tXfDXYy43qX7M/LAbHKHKJaxDAUCVRZWgb6Y5hcK3VM08xKYt
         /DFO+r0RY0SJwOKdVcsa/jG01YmbkIBgk0pO6MKtGaeqDZr9OVrjz1JTb8Ve+RzmZ8SR
         0mz2G1UprI0hV3WL+77QGSTUs/h8ui+JfsPmd/zQuMMU05YIlZPD3c4GraQDdj5Ak93C
         jlChvfyFcKX1dju+q6zvHMlJ0QQpj4Skjhg06RY9GaQlRspyafM/ap7rDwxpi2Kflr+y
         dpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684448560; x=1687040560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTrPPkXtAjgeany9T7/bBVZNtr7AELIKsku0nhssAqM=;
        b=K7+9YE9mvwIOk26pTQigqiH6RYkNvXocKPd93y2iJwLT9hs+wKY+eYmBs+WpzkAoIW
         7jeDwj/B6tvIyfESk0c7Mxpf1KAzzGpM6AZyAFGjtFJDkDWSFyy1it3kp5rkovzMmWig
         F2GyADmMVpK4EG/dXiiEPPIcLRtBWM+0foosXbTv/TszC2ZwRcXRh3O6qi2HE91zeFCg
         eriV6Oqs76sUvD3qAObljjjL5JlKA3gjRNyjFnXNacVKhfGc661SO8oL7rJ498gjRBrl
         +u9Tfd4GcLwjSrCERzfDvx1ABFkMNs0eMI+u8lzLl6SnAfkJUfxPL6/cYd2Itj2UCftI
         0aaw==
X-Gm-Message-State: AC+VfDwwBekL5pGEUZAoJKoV4EV+b+b/lwkNVZJu7jPdAWL08IT6Sk3u
        eldkbx1wizlXaxoH0ZxcFyoDyA==
X-Google-Smtp-Source: ACHHUZ59ui0p0WnjjTbb0bokt2f0LkJJN32O4pZspP0FIGlF/mZGevrtK8RK9o8Q0eMsnVvGrjaprQ==
X-Received: by 2002:a2e:9816:0:b0:2ac:80cd:6c0d with SMTP id a22-20020a2e9816000000b002ac80cd6c0dmr11251093ljj.19.1684448559926;
        Thu, 18 May 2023 15:22:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 15:22:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: [PATCH v3 0/9] drm/msm/dpu: simplify QoS/CDP programming
Date:   Fri, 19 May 2023 01:22:29 +0300
Message-Id: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
- Moved SSPP_VIG_CSC_10_OP_MODE close to other CSC10 defines (Jeykumar)

Changes since v1:
- Fixed kerneldoc for _dpu_plane_set_qos_ctrl()
- Fixed danger_safe_en programming conditions (Jeykumar)
- Simplified the code surrounding setup_cdp() calls (Jeykumar)

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

 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  21 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 140 +++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  52 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 165 +++++-------------
 9 files changed, 192 insertions(+), 349 deletions(-)

-- 
2.39.2

