Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77FF9100497
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 12:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfKRLoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 06:44:46 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:63202 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726881AbfKRLop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 06:44:45 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Nov 2019 17:14:38 +0530
IronPort-SDR: /W+N4905p9RK0bzC8y4pDHSxWzvdq35sFqc8fNnmGpEeyx23W0RIi20MpIt+GMOI1VPVpwU0xm
 Y4Ljit1xnXOmWuaiBFB8uNGIv4L6TzLJMCfEIa195KrgNKFa1tprP5F8SiaHnEJECo+aHP4lMm
 +FzjlHBsv/W/aYd4D3hYIxJWto3mWi/yah44ObFeh+kyRswsWY/CHaHbS+Jy736snlWow5TYWl
 RLuO3LTFJ+wL/rEFvp6W7E/mqeG+hBUHk73WRts05semvYkg/J0Xf9SptMaQNKjYvsEgV3tb5d
 VK7Oumec49RRXdGvnlKG5gwT
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 18 Nov 2019 17:14:09 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 521E1431A; Mon, 18 Nov 2019 17:14:08 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org, dhar@codeaurora.org,
        jsanka@codeaurora.org, chandanu@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH v1] msm:disp:dpu1: setup display datapath for SC7180 target
Date:   Mon, 18 Nov 2019 17:14:03 +0530
Message-Id: <1574077444-24554-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


SC7180 follows a newer architecture where in some flush controls have been re-organized to simplify programming and provide for future expandability. 
Specifically:
1) The TIMING_<j> bits that control flush of INTF_<j> have been replaced with a common INTF flush bit which flushes the programming in the MDP_CTL_<id>_INTF_ACTIVE register
2) Individual flush bits for MERGE_3D, DSC and CDWN have been added which flush the programming in the MDP_CTL_<id>_MERGE_3D_ACTIVE, ... etc respectively
3) PERIPH flush bit has been added to flush DSP packets for DisplayPort

The complete datapath is described using the MDP_CTL_<id>_TOP and newly added ACTIVE registers to handle other sub blocks
such as interface (INTF) resources, PingPong buffer / Layer Mixer, Display Stream Compression (DSC) resources, writeback (WB) and 3D Merge 
selections that are part of the datapath.



Kalyan Thota (1):
  msm:disp:dpu1: setup display datapath for SC7180 target

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 21 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 84 +++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 24 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 28 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  6 ++
 7 files changed, 161 insertions(+), 7 deletions(-)

-- 
1.9.1

