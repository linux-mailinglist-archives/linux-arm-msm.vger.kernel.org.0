Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE10C3CC35A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 14:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbhGQMnU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 08:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbhGQMnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 08:43:20 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9F2C06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:22 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id f30so14110924lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxluHM0Kg15VbQXdZCw+cTpPGVJhl2e5U5S77sNpUgo=;
        b=F9qPRPbpZ/MDYTWcuECxoE5ld2DSfHlPETZMJQHvSEijtH3I/iL40+g81qNU9R7+gr
         I7brVhaVnH+ycpS6c41cgUmoa+K4kcFXKxtzpEVbJlVjWTUzlT2DLtwsTJVuh7J/ca43
         PBbb/c3sONb9VuZtLxfWZvOMHwyj9Yn0IfmZJJT16cUeOpF/gMSABHr65sOTi2BagLRI
         /O1Az3q/CFAETL2UKdhQXTBC+Jz6nc8k189A5M9Eb2kBWALZcLTlzf1DHjTqYKjbFHTA
         YRNXumeDk+0WkRNSF+vf6ZXBLYrzJnZHUB2lP9H+ajhflM+w9/Hs6GiZZE9prm2sQyA6
         7UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxluHM0Kg15VbQXdZCw+cTpPGVJhl2e5U5S77sNpUgo=;
        b=RIRIEIhmWyBA/QMNtLF0SYPo4vRUzOiFC06u/imr6ZR6rmoceCI3j1JV8ZsRJPu2vG
         adffVhSoMjiSthyn1uploMXQyaBUsvAPtY/i4djAhs5XV0uK/1oAsIkv/oQFHUYVPtHu
         kD/QwmP8Fuv+7eEZBnzj7WD9hCGOEzN2JpLeNZRF3tnLg7NBxy5vBxwdi+LEAxNcq6QP
         T9SazSqqF+PUJsZc5V5E/BmF6jSw5InUGO2mavinrd4+ISmyGz9ACHslKhddVoAM+EZr
         pU9RwkznNGKBswpQVrSeZPdomGd/VC+zM2eE2nWp8q0y+NS997KdKPSUtiMwKhBRNzXW
         6R3A==
X-Gm-Message-State: AOAM530sFj6ve49YwNCs+qi95q2B23NIfexzPj7RMAw3q3iaaBirS4Bx
        FofnPfo3pl/T2RiTRBFYfNY8GA==
X-Google-Smtp-Source: ABdhPJwISVShNgvCCESFTQM5nE5x7zXB8RXC/C4BdlA6CqHjawE14xWbC81UHGBs5rPw8sEl2p9iEg==
X-Received: by 2002:a19:6752:: with SMTP id e18mr8871245lfj.144.1626525620946;
        Sat, 17 Jul 2021 05:40:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f25sm794264ljo.126.2021.07.17.05.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 05:40:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/7] drm/msm/dpu: add support for independent DSI config
Date:   Sat, 17 Jul 2021 15:40:09 +0300
Message-Id: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
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

Changes since v3:
 - Fix missing semicolon in the msm_dsi_is_master_dsi() stub as noted by
   the kernel test robot

Changes since v2:
 - Removed Reviewed-By tags from changed patches (1, 2)
 - Changed more dual DSI mentions in the patch 1
 - Added msm_dsi_is_master_dsi() helper
 - Rewrote dsi encoder setup function again basing on review by Abhinav

Cahanges since v1:
 - Rewrote dsi encoder setup function by separating common code sequence
   and calling it either for the bonded interface or twice for each of
   the DSI hosts.

Changes since RFC:
 - renamed dual DSI to bonded DSI as suggsted by Abhinav
 - added comments to _dpu_kms_initialize_dsi() regarding encoders usage


The following changes since commit e88bbc91849b2bf57683119c339e52916d34433f:

  Revert "drm/msm/mdp5: provide dynamic bandwidth management" (2021-06-23 14:06:20 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-drm-drop-set-encoder-mode-4

for you to fetch changes up to 75dcb396a3230046f5967bd7363d6b8cab0bf743:

  drm/msm/kms: drop set_encoder_mode callback (2021-07-17 15:36:41 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dsi: rename dual DSI to bonded DSI
      drm/msm/dsi: add three helper functions
      drm/msm/dpu: support setting up two independent DSI connectors
      drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
      drm/msm/dp: stop calling set_encoder_mode callback
      drm/msm/dsi: stop calling set_encoder_mode callback
      drm/msm/kms: drop set_encoder_mode callback

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 102 ++++++++++++----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c   |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  11 +--
 drivers/gpu/drm/msm/dp/dp_display.c        |  18 ----
 drivers/gpu/drm/msm/dsi/dsi.c              |   9 +-
 drivers/gpu/drm/msm/dsi/dsi.h              |   9 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h          |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c         |  34 ++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c      | 130 +++++++++++++----------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c |   2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |   6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  |   2 +-
 drivers/gpu/drm/msm/msm_drv.h              |  17 +++-
 drivers/gpu/drm/msm/msm_kms.h              |   3 -
 14 files changed, 170 insertions(+), 177 deletions(-)



