Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E9F6647DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 18:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbjAJR5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 12:57:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238677AbjAJR5S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 12:57:18 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6094D489
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 09:56:12 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g13so19702310lfv.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 09:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gaIieSU7ux9Nd5O02FrhZTkWaxDhWpVEfA3+6o5OBc=;
        b=LDFpZv8dtpVm6GtI6pZhzOF8bX9XEgdg7FkmXZlbt76eodlEoz6dVip+ZR8aBQTL+D
         1SBJz0BevsNisjZtaAtkpHLlTMnVxtSV8pi02MH+hYdXAjk9MVSiVV0LqgJiUtObfhKg
         3PrfV2EXKhjpE3HNbqdkD797SZRw0IAMmeMXqeSqlsAmOgDEnxZLtBihlB1PNWPY78zD
         7xKr/eF1hL4xrAAWl58uH3yVOZEvKDDxtATxbMDhAyN212tIY5b5/spQFLHRFxTnCh+Z
         f7B+6Nyd9rIdZl/b/3UVjymKUL8fjcLOU/anqZIWSwQ9zV8Cujgk+qE4E4PtAOcofUYi
         n7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gaIieSU7ux9Nd5O02FrhZTkWaxDhWpVEfA3+6o5OBc=;
        b=AA7blS1oXll54AnSL3KCvcnnQKl6yV6eNahjZdFGO2d90fbAsSN7iYWFBkx/ibp2WT
         aZF1+5wxOubvAhFz0jvvya5V0UuoVSMV60V2MK2bZ8BaE1o31Scwqyg+PxyvgTtIhHrh
         ushuDI5SjruNM0zXQY+YyuJFIlWvz1j40NCAeaoNJbjmW36eaZ4XFvIiYv66OB16hxI0
         McNCHP4E3bDS3zuSypUyLvjckrZyKCSODNwNTtWEK4K6wmFqz98AvFFJOmURMiMkZ/Bo
         uBSF6DdUYjMRD/tRydsXnq/KB9JA7aXkU/cl6mL2C4f8TQgqk+OImObTEiX4th//I0VX
         18iA==
X-Gm-Message-State: AFqh2koK4UYuqmlG6ZB2e1aIh+YWxUgmH9kjn9JuRM+WYNWwtFvlXfVt
        7LpQm+UYC21Z4q400D/LuwkUQ5QHvc0VMyon
X-Google-Smtp-Source: AMrXdXtZKZPcj0uN1n+XWIrVe8u+34MhL11oSLdVL+7uuV8PVg+J9a4Bm+nAxisXzzuQwHpWAf7R4w==
X-Received: by 2002:a05:6512:22d3:b0:4b4:fbdc:a359 with SMTP id g19-20020a05651222d300b004b4fbdca359mr20893930lfu.54.1673373370976;
        Tue, 10 Jan 2023 09:56:10 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x9-20020a0565123f8900b004a1e104b269sm2275056lfa.34.2023.01.10.09.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:56:10 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        angelogioacchino.delregno@collabora.com,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v8 0/5] Add support for Core Power Reduction v3, v4 and Hardened
Date:   Tue, 10 Jan 2023 18:56:00 +0100
Message-Id: <20230110175605.1240188-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v8:
- Overtake this series from AGdR
- Apply all review comments from v7 except Vladimir's request to
  not create the include/ header; it will be strictly necessary for
  OSM-aware cpufreq_hw programming, which this series was more or
  less created just for..
- Drop QCS404 dtsi change, account for not breaking backwards compat
  in [3/5]
- Add type phandle type reference to acc-syscon in [1/5]
- Update AGdR's email addresses for maintainer entries
- Add [2/5] to make dt_binding_check happy
- Separate the CPRh DT addition from cpufreq_hw addition, sort and
  properly indent new nodes
- Drop CPR yaml conversion, that happened in meantime
- Reorder the patches to make a bit more sense
- Tested again on MSM8998 Xperia XZ Premium (Maple)
- I take no responsibility for AGdR's cheeky jokes, only the code!

Link to v7:
https://lore.kernel.org/lkml/20210901155735.629282-1-angelogioacchino.delregno@somainline.org/

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

AngeloGioacchino Del Regno (4):
  dt-bindings: soc: qcom: cpr3: Add bindings for CPR3 driver
  soc: qcom: cpr: Move common functions to new file
  soc: qcom: Add support for Core Power Reduction v3, v4 and Hardened
  arm64: dts: qcom: msm8998: Configure CPRh

Konrad Dybcio (1):
  dt-bindings: opp: v2-qcom-level: Let qcom,opp-fuse-level be a 2-long
    array

 .../bindings/opp/opp-v2-qcom-level.yaml       |    4 +-
 .../bindings/soc/qcom/qcom,cpr3.yaml          |  242 ++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  325 ++
 drivers/soc/qcom/Kconfig                      |   21 +
 drivers/soc/qcom/Makefile                     |    2 +
 drivers/soc/qcom/cpr-common.c                 |  363 ++
 drivers/soc/qcom/cpr-common.h                 |  110 +
 drivers/soc/qcom/cpr.c                        |  386 +--
 drivers/soc/qcom/cpr3.c                       | 2923 +++++++++++++++++
 9 files changed, 4011 insertions(+), 365 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
 create mode 100644 drivers/soc/qcom/cpr-common.c
 create mode 100644 drivers/soc/qcom/cpr-common.h
 create mode 100644 drivers/soc/qcom/cpr3.c

-- 
2.39.0

