Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D6638C6D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 14:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233394AbhEUMvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 08:51:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230081AbhEUMvW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 08:51:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE40E6128A;
        Fri, 21 May 2021 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621601399;
        bh=G6ouIauR05ZjrZdPDoLSgmtuQODfUpudDe0dhIJwxGg=;
        h=From:To:Cc:Subject:Date:From;
        b=RXyaAIs4G0Wi1Rot89jVxURym/6ZQSoS/jdA8GQctBWZDIgCvsVVQWExpQBN9oF+K
         HMEy6DtuwtA6mmNjtELemlALcpBAOWrRfq0gKd47AjhhQKIsWMoN/FdlBHSBno+/xr
         TP8FSI0GuhTUqrUYr0x6VMucqe0fv1oI9+6/NhuDPGdnxds2iSVdZuEU11Pubs3wou
         B1fv4Y2XlkPjG9D5BQvEPUxQZH5x8p+vXQb6P8HR+IbcJQiD/tMogtphEyCoIeb9ED
         LyqRj+2W2RVnyqc06wU879N3lQAw5wOoMnk8E/o+Ucla6GsnhUJQ0PVqfM4M3dwkpW
         ZsgAu2R9CDXkQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: [RFC PATCH 00/13] drm/msm: Add Display Stream Compression Support
Date:   Fri, 21 May 2021 18:19:29 +0530
Message-Id: <20210521124946.3617862-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Display Stream Compression (DSC) compresses the display stream in host which
is later decoded by panel. This series enables this for Qualcomm msm driver.
This was tested on Google Pixel3 phone which use LGE SW43408 panel.

The changes include adding DT properties for DSC then hardware blocks support
required in DPU1 driver and support in encoder. We also add support in DSI
and introduce required topology changes.

In order for panel to set the DSC parameters we add dsc in drm_panel and set
it from the msm driver.

Complete changes which enable this for Pixel3 along with panel driver (not
part of this series) and DT changes can be found at:
git.linaro.org/people/vinod.koul/kernel.git pixel/dsc_rfc

Comments welcome!

Vinod Koul (13):
  drm/dsc: Add dsc pps header init function
  dt-bindings: msm/dsi: Document Display Stream Compression (DSC)
    parameters
  drm/msm/dsi: add support for dsc data
  drm/msm/disp/dpu1: Add support for DSC
  drm/msm/disp/dpu1: Add support for DSC in pingpong block
  drm/msm/disp/dpu1: Add DSC support in RM
  drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
  drm/msm/disp/dpu1: Add DSC support in hw_ctl
  drm/msm/disp/dpu1: Don't use DSC with mode_3d
  drm/msm/disp/dpu1: Add support for DSC in encoder
  drm/msm/disp/dpu1: Add support for DSC in topology
  drm/msm/dsi: Add support for DSC configuration
  drm/msm/dsi: Pass DSC params to drm_panel

 .../devicetree/bindings/display/msm/dsi.txt   |  15 +
 drivers/gpu/drm/drm_dsc.c                     |  11 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 204 +++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  11 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   2 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  22 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  26 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 221 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  79 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  32 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  32 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   1 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  10 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 293 +++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h                 |  32 ++
 include/drm/drm_dsc.h                         |  16 +
 include/drm/drm_panel.h                       |   7 +
 23 files changed, 1043 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h

-- 
2.26.3

