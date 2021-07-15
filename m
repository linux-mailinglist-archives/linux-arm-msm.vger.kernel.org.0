Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5B73C98FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 08:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhGOGzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 02:55:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:57384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230016AbhGOGzS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 02:55:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B3906117A;
        Thu, 15 Jul 2021 06:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626331945;
        bh=Ol1Ypfkrt453Oh84OpaT+qh/m2pWp+qFE/FGZ6U2BQs=;
        h=From:To:Cc:Subject:Date:From;
        b=iISRNiogDeisnuwSXGhjF81JrojOJQtWdvksKJhM45KhFrPqk8x+K6YnNGRa+/ctm
         qk3fWEa98j7n4wqVZ2w7wUq9raMUrTBBSCjnCfLASK79QRu0RbUJfv+9oJUcidEvaf
         6ivlDAjtgD9LZzKQ/hYRzyxt9ORcITlmqG59i25dPIvbBED+K6Dqs2YeQMPXiZVUVf
         qMk04UAZWM9q1ojchXuid21tf5edaSV+EJUWZYGd2KZ63BotiO52VnnaSosHOJgXZl
         M6tiHg0VDZPtiA87tEq0NSgs8ozJ+kniI4XNh8nTWDNhTqsTcYZ0TWAU4fMjy8oscD
         JK6g17bk5RbWw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 00/11] drm/msm: Add Display Stream Compression Support
Date:   Thu, 15 Jul 2021 12:21:52 +0530
Message-Id: <20210715065203.709914-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Display Stream Compression (DSC) compresses the display stream in host which
is later decoded by panel. This series enables this for Qualcomm msm driver.
This was tested on Google Pixel3 phone which use LGE SW43408 panel.
 
The changes include adding DT properties for DSC then hardware blocks
support required in DPU1 driver and support in encoder. We also add support
in DSI and introduce required topology changes.
 
In order for panel to set the DSC parameters we add dsc in drm_panel and set
it from the msm driver.
 
Complete changes which enable this for Pixel3 along with panel driver (not
part of this series) and DT changes can be found at:
git.linaro.org/people/vinod.koul/kernel.git pixel/dsc_v1
 
Comments welcome!

Changes since RFC:
 - Drop the DT binding patch as we derive the configuration from panel
 - Drop the drm api patch as we no longer need it (use pps drm api)
 - Fix comments raised by Dimitry
 - Add dsc parameters calculation from downstream

Vinod Koul (11):
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

 drivers/gpu/drm/msm/Makefile                  |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 158 +++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  11 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   2 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  22 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 221 ++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  77 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  32 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  32 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   1 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  10 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 289 +++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h                 |  21 ++
 include/drm/drm_panel.h                       |   7 +
 20 files changed, 925 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h

-- 
2.31.1

