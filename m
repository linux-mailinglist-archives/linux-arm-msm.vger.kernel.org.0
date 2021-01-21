Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A332FF4E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 20:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbhAUTnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 14:43:23 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:34943 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbhAUTl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 14:41:57 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E87453EECF;
        Thu, 21 Jan 2021 20:40:52 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, jeffrey.l.hugo@gmail.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v5 0/3] Driver for Core Power Reduction v3, v4 and Hardened
Date:   Thu, 21 Jan 2021 20:40:48 +0100
Message-Id: <20210121194051.484209-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

  **
  ** NOTE: To "view the full picture", please look at the following
  ** patch series:
  ** https://patchwork.kernel.org/project/linux-arm-msm/list/?series=413355
  **              This is a subset of that series.
  **

Changes in v5:
- Fixed getting OPP table when not yet installed by the caller
  of power domain attachment

Changes in v4:
- Huge patch series has been split for better reviewability,
  as suggested by Bjorn

Changes in v3:
- Fixed YAML doc issues
- Removed unused variables and redundant if branch

Changes in v2:
- Implemented dynamic Memory Accelerator corners support, needed
  by MSM8998
- Added MSM8998 Silver/Gold parameters

This commit introduces a new driver, based on the one for cpr v1,
to enable support for the newer Qualcomm Core Power Reduction
hardware, known downstream as CPR3, CPR4 and CPRh, and support
for MSM8998 and SDM630 CPU power reduction.

In these new versions of the hardware, support for various new
features was introduced, including voltage reduction for the GPU,
security hardening and a new way of controlling CPU DVFS,
consisting in internal communication between microcontrollers,
specifically the CPR-Hardened and the Operating State Manager.

The CPR v3, v4 and CPRh are present in a broad range of SoCs,
from the mid-range to the high end ones including, but not limited
to, MSM8953/8996/8998, SDM630/636/660/845.

Tested on the following smartphones:
- Sony Xperia XA2        (SDM630)
- Sony Xperia XA2 Ultra  (SDM630)
- Sony Xperia 10         (SDM630)
- Sony Xperia XZ Premium (MSM8998)
- F(x)Tec Pro 1          (MSM8998)

AngeloGioacchino Del Regno (3):
  soc: qcom: Add support for Core Power Reduction v3, v4 and Hardened
  MAINTAINERS: Add entry for Qualcomm CPRv3/v4/Hardened driver
  dt-bindings: soc: qcom: cpr3: Add bindings for CPR3 driver

 .../bindings/soc/qcom/qcom,cpr3.yaml          |  241 ++
 MAINTAINERS                                   |    6 +
 drivers/soc/qcom/Kconfig                      |   17 +
 drivers/soc/qcom/Makefile                     |    1 +
 drivers/soc/qcom/cpr-common.c                 |   35 +-
 drivers/soc/qcom/cpr-common.h                 |    4 +
 drivers/soc/qcom/cpr3.c                       | 2915 +++++++++++++++++
 7 files changed, 3213 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
 create mode 100644 drivers/soc/qcom/cpr3.c

-- 
2.30.0

