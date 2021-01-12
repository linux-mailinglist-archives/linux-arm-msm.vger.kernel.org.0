Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF342F3A51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 20:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406765AbhALT1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 14:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732196AbhALT13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 14:27:29 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC1FC061786;
        Tue, 12 Jan 2021 11:26:48 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 215183E7BE;
        Tue, 12 Jan 2021 20:26:47 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 0/7] Qualcomm DRM DPU fixes
Date:   Tue, 12 Jan 2021 20:26:25 +0100
Message-Id: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series brings some fixes to the Qualcomm DPU driver, aim is
to get it prepared for "legacy" SoCs (like MSM8998, SDM630/660) and to
finally get command-mode displays working on this driver.

The series was tested against MSM8998 (the commit that introduces it to
the hw-catalog is not included in this series, as it needs to be cleaned
up a little more) and specifically on:
- Sony Xperia XZ Premium (MSM8998), 4K dual-dsi LCD display, command-mode
- F(x)Tec Pro1 (MSM8998), single-dsi OLED display, video-mode

... And it obviously worked just perfect!

Changes in v2:
- Dropped patches "drm/msm/dpu: Add a function to retrieve the current CTL status"
  and "drm/msm/dpu: Fix timeout issues on command mode panels" as the
  second patch was wrong.
- Fixed patch apply issues on latest linux-next and 5.11-rcX

AngeloGioacchino Del Regno (7):
  drm/msm/dpu: Fix VBIF_XINL_QOS_LVL_REMAP_000 register offset
  drm/msm/dpu: Move DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks
  drm/msm/dpu: Add prog_fetch_lines_worst_case to INTF_BLK macro
  drm/msm/dpu: Allow specifying features and sblk in DSPP_BLK macro
  drm/msm/dpu: Disable autorefresh in command mode
  drm/msm/dpu: Correctly configure vsync tearcheck for command mode
  drm/msm/dpu: Remove unused call in wait_for_commit_done

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 90 +++++++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 49 +++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 26 ++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |  9 +-
 5 files changed, 147 insertions(+), 41 deletions(-)

-- 
2.29.2

