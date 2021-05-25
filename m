Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DADF3901DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 15:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhEYNOw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 09:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbhEYNOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 09:14:50 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C0CC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:19 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j10so45978685lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJL+Uzw/r0kzj1iQLltCJOxsq9P55CtDFAUVNl5JQjU=;
        b=PfYI/8d1lZPks+9Vdpgd1k8YHa1+KvlIPpcZ3yQ+xjYNtdtld4C7r0gSjZQ+5QCy75
         jWF26RjNKZneKVFOPPsskK+1lUWUyaMarlLt4oFCXeXYymdq7JKGfys5DOid1wx6lPzq
         OwnhV9PNkI6NXLRlUmA1EClF0uMJkDtE2UcBt2+2p7xEv/AOs9s2DUrqOhnYT1rdNwSg
         INicbcOgJLfEkPRxv8GHZVxVOdmspYuKjXvKzPdsiu2k+wAedNwuIjglAaXL11EAcZVa
         +Qr2MPNx/xkW3i+GnkLJTQnzP6iZAjDpYT4nsUw/Qge+YQJrGlNJbHJcP1N6Omm03JSZ
         Xm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJL+Uzw/r0kzj1iQLltCJOxsq9P55CtDFAUVNl5JQjU=;
        b=Ey3yy357XpAnEbVmAhnYsg0utX1SE4QK8XTFRp7OZDzPDRb90qzM3AWwRgF3r3ao9d
         MqBaWA/tDt3Uj74qy8yknLg31tm0gvqzo8uBBUlI9pr2un/+ywBgBezPU4J7Cyx/tt0C
         bsYGY4CjOcL7Ya3KoSr5+XD7nrb/xdHKagFn1XUfxKKBXLc2e6aBKip8YVC8YMQeynDq
         hiXq77IB+9hMF5UiwnoiFlbaKz5gIEifrr22y5Ito0PcEKPTz47S0yu64ShfnW1XWN8/
         YjIuzz+ConQoQD6LjzzfKINiR48FWcOV5Zt1DPmGxoK7L8iCPwbZhHUKVnwZ0jTRs4Cq
         zEJw==
X-Gm-Message-State: AOAM533Q0ZGcaMTx7+veKxSubFho8xGi/TicGsIOs798xZJecXJ+OyEe
        GytU58LOU1AYpu4rRnaChnqxySSZdPi2Jw==
X-Google-Smtp-Source: ABdhPJyLqqm8SZ2+GAzB/vRBl3YPCvaDaU9DFYRtpQJr62LEnKvMf8pXwgoXO2ZS17zZvgKdfCLa5g==
X-Received: by 2002:ac2:50da:: with SMTP id h26mr1845382lfm.390.1621948398298;
        Tue, 25 May 2021 06:13:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 06:13:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/7] drm/msm/mdp5: add properties and bandwidth management
Date:   Tue, 25 May 2021 16:13:09 +0300
Message-Id: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update MDP5 display driver to support current implementation of
alpha/blend mode/zpos properties. On top of that port bandwidth
management from DPU display driver.

The following changes since commit 8dbde399044b0f5acf704ab5f8116bd8b1dfcf95:

  drm/msm/dp: handle irq_hpd with sink_count = 0 correctly (2021-05-24 16:08:33 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git mdp5-update

for you to fetch changes up to 501c3f8c40e139d97b17240e0a5492a12b6c722d:

  drm/msm/mdp5: provide dynamic bandwidth management (2021-05-25 16:10:17 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (6):
      drm/msm/mdp5: use drm atomic helpers to handle base drm plane state
      drm/msm/mdp5: use drm_plane_state for storing alpha value
      drm/msm/mdp5: use drm_plane_state for pixel blend mode
      drm/msm/mdp5: add support for alpha/blend_mode properties
      drm/msm/mdp5: switch to standard zpos property
      drm/msm/mdp5: provide dynamic bandwidth management

James Willcox (1):
      drm/msm/mdp5: add perf blocks for holding fudge factors

 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c   |  35 ++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h   |   7 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  |  56 ++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 119 +++++++++++++------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h   |  17 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 177 ++++++++++-------------------
 6 files changed, 249 insertions(+), 162 deletions(-)


