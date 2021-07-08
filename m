Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C93E3BFA20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 14:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhGHMba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 08:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbhGHMba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 08:31:30 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8602AC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 05:28:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t17so15062267lfq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8CufoHY4b7Kdk/bGCgQwPghMrG3yF81c9YnZwFkA3Kc=;
        b=ioy8/5VastZrNccn7z2GRjdchRkTPdgIBgh/B9OctiBcWm5R/RNkRNoLblVP2M7/wx
         1NRJPTlAtmHMc7oOF2MKoxtyuazj4qb1bXWNYiByVwiFssKY8fbOvZ6llwrRH0CF2pnR
         PNNkIvWd2iEhW1MBjiiss3NbWayUjNimG90kyaIE4y3+v0sdOoKAFvRdiPGiIi+HrEIx
         oNMMGA479wZDe8bJpaBqjjmsbqRITlLPfH4D78z7peA4pQslpHudp7+9NbTeca3iE26W
         FeZnBbzMviUaafwPUQ6NMGGdecVJSU0MnM5mycWPIDBzRkA4qJxsS4mRG/KVI6k89CBT
         aM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8CufoHY4b7Kdk/bGCgQwPghMrG3yF81c9YnZwFkA3Kc=;
        b=M03RmoJCDOkTfKZ8XnIuquSsTCLCMIzriMLvkrExT0w5Kh/PfLNfE1hemzhU4jQQpU
         5REO0/3YJO/DOTWVNNMJPXO3IJPStagrfAtOtvucaDxsIZ5Lc7FKaHSv6sm2stREeaSQ
         P/V1U/nE5VCyMczVP3d6RYmeV4S+eWN9bupNgcAfgNUh2U9MjQi/L2QU4XgygAqDpYMp
         YzXIz8VkccSOTGLO7EZJgOKkM4XnfFsbPeualYw+hfwPaQ6fZWTK27cjOS3K064KM1um
         D1Qatl58Ull6/nEKP4fAsiMJVwOztpGw5XK3Kx1iE4p9AUDiqjiwAG1JmWR+d5igEVm2
         yCQw==
X-Gm-Message-State: AOAM531pC85RxsLjXBmgA4UBAoVdRseIh3fy3jMjoM6RWq5idjk0AnTF
        q9xMjr7ZNbI9gxsCHkLP0/IucmOIsRETcg==
X-Google-Smtp-Source: ABdhPJyftfBglnVIO3dRbWrXzjZDUxoP7xSZBt8uQU7GalcDpSNDqO6l6dPH8Jqlr7U8cx3iGkCbYg==
X-Received: by 2002:a2e:a548:: with SMTP id e8mr23628480ljn.331.1625747325564;
        Thu, 08 Jul 2021 05:28:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 05:28:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 0/7] drm/msm/dpu: add support for idependent DSI config
Date:   Thu,  8 Jul 2021 15:28:26 +0300
Message-Id: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchseries adds support for independent DSI config to DPU1 display
subdriver. Also drop one of msm_kms_funcs callbacks, made unnecessary
now.

Tested on RB5 (dpu, dsi). Previous iteration was tested by Alexey
Minnekhanov.

Changes since v1:
 - renamed dual DSI to bonded DSI as suggsted by Abhinav
 - added comments to _dpu_kms_initialize_dsi() regarding encoders usage

The following changes since commit e88bbc91849b2bf57683119c339e52916d34433f:

  Revert "drm/msm/mdp5: provide dynamic bandwidth management" (2021-06-23 14:06:20 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-drm-drop-set-encoder-mode-1

for you to fetch changes up to 142f79dfc41271576731a49516d63ad47a56e1ca:

  drm/msm/kms: drop set_encoder_mode callback (2021-07-08 15:20:52 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dsi: rename dual DSI to bonded DSI
      drm/msm/dsi: add two helper functions
      drm/msm/dpu: support setting up two independent DSI connectors
      drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
      drm/msm/dp: stop calling set_encoder_mode callback
      drm/msm/dsi: stop calling set_encoder_mode callback
      drm/msm/kms: drop set_encoder_mode callback

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 102 +++++++++++++++++--------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  11 +---
 drivers/gpu/drm/msm/dp/dp_display.c      |  18 ------
 drivers/gpu/drm/msm/dsi/dsi.c            |   9 ++-
 drivers/gpu/drm/msm/dsi/dsi.h            |   9 ++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h        |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c       |  30 ++++-----
 drivers/gpu/drm/msm/dsi/dsi_manager.c    |  93 ++++++++++++----------------
 drivers/gpu/drm/msm/msm_drv.h            |  12 +++-
 drivers/gpu/drm/msm/msm_kms.h            |   3 -
 10 files changed, 136 insertions(+), 153 deletions(-)


