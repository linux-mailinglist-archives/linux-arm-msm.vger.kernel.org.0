Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E009E3C2BC4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 01:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhGIXxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 19:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhGIXxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 19:53:12 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9257C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 16:50:27 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a18so10647187ljk.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 16:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sn0jP9DnLuphcw0YXtYqDYqKI3YxyEQFHRMjVN+jOvc=;
        b=xV8l78WU8UxRjNv+nVa245XgCmMJfpSGkEwsjN7diyuHONzbyxpoH/eqdmwKCrd3TT
         WT4RM/Ej2xty+Jul6ScQG1zeIUs6YcIs7tqg/0klfEkV15sbqWsn5WeOg+K89gPwY+qX
         xxk0Zs5zc/gzLb2k4C3HTsnfX0oqmoh1m6MY6cXnMVpmGndxKWOAMT5c5zxmg62nYKBr
         +Qp1APOlrOO8//Y5l5aUPMrR7/TQOga8On+w2TNsYs0kU/g6UhMsS+YcI9bbVoT5ou0q
         j5O3tcb/7RfIcvK9Np808G1vz8+8VECiYzomvkz446FnBdmCu8qVExllflKAu5mwXSXa
         WVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sn0jP9DnLuphcw0YXtYqDYqKI3YxyEQFHRMjVN+jOvc=;
        b=Mwxq8A+UG0KK+gtD/vJ7JF3YYPxBwa6c/9rwoU/CRWH/M816pVRySNFgvBlPUdV5VZ
         s1IcLoh054FWwXo+VkqdelT/i6idFtMqlNd5JKQyN/VJuynrLxLw6+0ee2HI0shRz7O6
         6hqmlFLmHnWFG17w87sZ6qPMta0WIhV1KZbgN6eqPr40KS1IKZ7/PQhJQHYlaQ5m6K8M
         HIPCCNvyoxIaMcPgh0VfE0XUCn4AYoTMy1l6krs42Qt/DvOmv/a8Tgu2jZpsK6MH2ZAO
         ms6uWyw8pZYR8MiKelmcgqxr8l8DqftYaE7PdVfoullE31Qf+CYwyaEaBAPeXjjEmWMn
         Iuww==
X-Gm-Message-State: AOAM5321eeseDqKArnpX8pSvayrL6Be9yk5IGkOJs2zRKBDMpessxi+j
        bCQrqYU2g0Q2Bqv8hbeXWn1y9Q==
X-Google-Smtp-Source: ABdhPJyjoB4ZEO4ir2no0ThokAQYqxv3KsDYgYA5XgCzVrVEBeS6wwizc71TcMr2/JFMK2iDRr/z7g==
X-Received: by 2002:a2e:8244:: with SMTP id j4mr21369949ljh.364.1625874625964;
        Fri, 09 Jul 2021 16:50:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 16:50:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/msm/dpu: add support for independent DSI config
Date:   Sat, 10 Jul 2021 02:50:17 +0300
Message-Id: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
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

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-drm-drop-set-encoder-mode-2

for you to fetch changes up to 3e10b945035d638bdf94f06b3fc86a6deaa41e63:

  drm/msm/kms: drop set_encoder_mode callback (2021-07-10 02:46:00 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dsi: rename dual DSI to bonded DSI
      drm/msm/dsi: add two helper functions
      drm/msm/dpu: support setting up two independent DSI connectors
      drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
      drm/msm/dp: stop calling set_encoder_mode callback
      drm/msm/dsi: stop calling set_encoder_mode callback
      drm/msm/kms: drop set_encoder_mode callback

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 130 +++++++++++++++++++------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  11 +--
 drivers/gpu/drm/msm/dp/dp_display.c      |  18 -----
 drivers/gpu/drm/msm/dsi/dsi.c            |   9 ++-
 drivers/gpu/drm/msm/dsi/dsi.h            |   9 +--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h        |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c       |  30 +++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c    |  93 ++++++++++------------
 drivers/gpu/drm/msm/msm_drv.h            |  12 ++-
 drivers/gpu/drm/msm/msm_kms.h            |   3 -
 10 files changed, 158 insertions(+), 159 deletions(-)

