Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1736D3FDF25
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 17:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbhIAP6f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 11:58:35 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:48489 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbhIAP6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 11:58:35 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9FEB93EBAE;
        Wed,  1 Sep 2021 17:57:36 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, jami.kettunen@somainline.org,
        paul.bouchara@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, jeffrey.l.hugo@gmail.com,
        robh@kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v7 0/6] Add support for Core Power Reduction v3, v4 and Hardened
Date:   Wed,  1 Sep 2021 17:57:29 +0200
Message-Id: <20210901155735.629282-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v7:
- Rebased on linux-next as of 210901
- Changed cpr_read_efuse calls to nvmem_cell_read_variable_le_u32,
  following what was done in commit c77634b9d916

Changes in v6:
- Fixes from Bjorn's review
- After a conversation with Viresh, it turned out I was abusing the
  OPP API to pass the APM and MEM-ACC thresholds to qcom-cpufreq-hw,
  so now the driver is using the genpd created virtual device and
  passing drvdata instead to stop the abuse
- Since the CPR commonization was ignored for more than 6 months,
  it is now included in the CPRv3/4/h series, as there is no point
  in commonizing without having this driver
- Rebased on v5.13

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

As to clarify, SDM845 does the CPR/SAW/OSM setup in TZ firmware, but
this is limited to the CPU context; despite GPU CPR support being not
implemented in this series, it is planned for the future, and some
SDM845 need the CPR (in the context of GPU CPR) to be configured from
this driver.

It is also planned to add the CPR data for MSM8996, since this driver
does support the CPRv4 found on that SoC, but I currently have no time
to properly test that on a real device, so I prefer getting this big
implementation merged before adding more things on top.

As for MSM8953, we (read: nobody from SoMainline) have no device with
this chip: since we are unable to test the cpr data and the entire
driver on that one, we currently have no plans to do this addition
in the future. This is left to other nice developers: I'm sure that
somebody will come up with that, sooner or later ;)

Tested on the following smartphones:
- Sony Xperia XA2        (SDM630)
- Sony Xperia XA2 Ultra  (SDM630)
- Sony Xperia 10         (SDM630)
- Sony Xperia XZ Premium (MSM8998)
- F(x)Tec Pro 1          (MSM8998)

AngeloGioacchino Del Regno (6):
  soc: qcom: cpr: Move common functions to new file
  dt-bindings: avs: cpr: Convert binding to YAML schema
  arm64: qcom: qcs404: Change CPR nvmem-names
  soc: qcom: Add support for Core Power Reduction v3, v4 and Hardened
  MAINTAINERS: Add entry for Qualcomm CPRv3/v4/Hardened driver
  dt-bindings: soc: qcom: cpr3: Add bindings for CPR3 driver

 .../bindings/power/avs/qcom,cpr.txt           |  131 +-
 .../bindings/soc/qcom/qcom,cpr.yaml           |  167 +
 .../bindings/soc/qcom/qcom,cpr3.yaml          |  241 ++
 MAINTAINERS                                   |    8 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |   24 +-
 drivers/soc/qcom/Kconfig                      |   17 +
 drivers/soc/qcom/Makefile                     |    3 +-
 drivers/soc/qcom/cpr-common.c                 |  385 +++
 drivers/soc/qcom/cpr-common.h                 |  115 +
 drivers/soc/qcom/cpr.c                        |  399 +--
 drivers/soc/qcom/cpr3.c                       | 2901 +++++++++++++++++
 include/soc/qcom/cpr.h                        |   17 +
 12 files changed, 3888 insertions(+), 520 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
 create mode 100644 drivers/soc/qcom/cpr-common.c
 create mode 100644 drivers/soc/qcom/cpr-common.h
 create mode 100644 drivers/soc/qcom/cpr3.c
 create mode 100644 include/soc/qcom/cpr.h

-- 
2.32.0

