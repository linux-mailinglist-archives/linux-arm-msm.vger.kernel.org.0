Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7515C48DA66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jan 2022 16:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiAMPEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 10:04:52 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:51671 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiAMPEw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 10:04:52 -0500
X-Greylist: delayed 557 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Jan 2022 10:04:51 EST
Received: from localhost.localdomain (89-166-24-184.bb.dnainternet.fi [89.166.24.184])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 304BD3F62F;
        Thu, 13 Jan 2022 15:55:30 +0100 (CET)
From:   Jami Kettunen <jami.kettunen@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jami Kettunen <jami.kettunen@somainline.org>
Subject: [PATCH 0/3] MSM8998 DPU1 support
Date:   Thu, 13 Jan 2022 16:51:08 +0200
Message-Id: <20220113145111.29984-1-jami.kettunen@somainline.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v2:
- Not disabling the example of dpu-msm8998.yaml (patch 3/3)
- Rebased on linus/master as of 2022-01-13

This series brings up functionality for MSM8998 in the DPU, driver which
is mostly the same as SDM845 (just a few variations).

I (Jami) am doing the sending instead of Angelo as he is still rather
busy.

Tested on the following MSM8998 smartphones:
- OnePlus 5/5T (cmd mode panels)

AngeloGioacchino Del Regno (3):
  drm/msm/dpu1: Add DMA2, DMA3 clock control to enum
  drm/msm/dpu1: Add MSM8998 to hw catalog
  dt-bindings: display: msm: Add binding for msm8998 dpu

 .../bindings/display/msm/dpu-msm8998.yaml     | 219 ++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 329 +++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_drv.c                 |   1 +
 5 files changed, 541 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml

-- 
2.34.1

