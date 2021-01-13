Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B9E2F5234
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 19:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbhAMSeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 13:34:23 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:42197 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728315AbhAMSeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 13:34:23 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3AC653F0E3;
        Wed, 13 Jan 2021 19:33:41 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v3 0/7] Add support for Adreno 508/509/512
Date:   Wed, 13 Jan 2021 19:33:32 +0100
Message-Id: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In this patch series, we are adding support for lower end Adreno 5
series GPUs, such as A508, A509 and A512 that we have found in the
Qualcomm SDM630, SDM636 and SDM660 SoCs.

On a note, adding support for these three units, also adds 99% of
the required "things" for another two GPUs, A505 and A506 but, even
if adding them requires literally two lines of code, noone of us has
got any SoC equipped with these ones hence we wouldn't be able to
test. Even though there is basically no reason for them to not work
correctly, kernel side, I chose to avoid adding the two "magic" lines.

Anyway, this patchset also addresses some issues that we've found in
the A5XX part of the Adreno driver, regarding a logic mistake in one
of the VPC protect values and a forced overwrite of the register named
A5XX_PC_DBG_ECO_CNTL, forcing the setting of vtxFifo and primFifo
thresholds that was valid only for higher end GPUs.

This patch series has been tested on the following devices:
 - Sony Xperia XA2 Ultra (SDM630 Nile Discovery)
 - Sony Xperia 10        (SDM630 Ganges Kirin)
 - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

Changes in v3:
 - Rebased on 5.11-rc3
 - Changed emails to reflect new ones
 - Tested on F(x)Tec Pro1 and Xperia XZ Premium (MSM8998)

Changes in v2:
 - Define REG_A5XX_UCHE_MODE_CNTL and fix open-coded
   REG_A5XX_VPC_DBG_ECO_CNTL in the all flat shading optimization
   disablement commit, as requested by Rob Clark.

AngeloGioacchino Del Regno (4):
  drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
  drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write from main branch
  drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs
  drm/msm/a5xx: Reset VBIF before PC only on A510 and A530

Konrad Dybcio (3):
  drm/msm/a5xx: Fix VPC protect value in gpu_write()
  drm/msm/a5xx: Disable flat shading optimization
  drm/msm/a5xx: Disable UCHE global filter

 drivers/gpu/drm/msm/adreno/a5xx.xml.h      |   2 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 195 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  52 ++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  15 ++
 5 files changed, 241 insertions(+), 27 deletions(-)

-- 
2.29.2

