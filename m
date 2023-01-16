Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9453566BA94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 10:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbjAPJjJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 04:39:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbjAPJjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 04:39:03 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6234818B1D
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 01:39:01 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id g13so41907131lfv.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 01:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6E8WoXJDpX3GaHcHEQZM8VLCG77wbMOMppd5oqMPYNg=;
        b=xWSr9kCeXrXLP0XNuZMwVbjMo01m33GBGWBmYLy9300gOeN7EMwP5apQ2OLgTL1spL
         0nWBc3BeJX1H2ohURIIAqnd8ZqSo0FzA4619RLadA61Yau7NqEl4xKthGU2CX2V4MZvG
         FXqEPy6NVEpCzqHSSc1ZRLtBZ69mJRAuYoAtoGAlxrox66qHhoNw8W6uchsbZhaHYO/i
         y8jFt/xMVHKm0bM+WhA8ne0NO+xzMjfmKK0Q3Q4usnftjccNNSFXGLNi5O/SXdofA8ky
         BjyJh2eDBdx8IxrMr93zeFqCYh5r3I6oqbNZkwGvR48uaP5YDA+F5V7xA1d0zGVGw7cX
         vptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6E8WoXJDpX3GaHcHEQZM8VLCG77wbMOMppd5oqMPYNg=;
        b=O8/mYUzfheWixKtFGzGSbIkD1I9Nsy9OHhSug7vZMBYCOVo6gyMnmeSKr9utXljnzA
         Pq8WExLS+3x+SLgJAMsABnFQjUepqyiPrX1tHlw4tsyJPg3zY6DkHiKMaY67QEfc5x+9
         EWT9/DidX4yMxrS/55M+PuOuvChonXRhU3gu6hsPMNfs/7UkH/rrj5gnSm/us9T2Wlh6
         WmlQ2xhsiUEVLrJw9yLGDzJ40BVpWPq2d08i/BPGq5Es++J4EW9Per13pMlTVXjbjGb6
         8X492EG7AH5xyMlCQholRY3nMme3e2ipt+N19Mi4uafK1yA9evyBQwZLUVSP3CkTfHkN
         nLEQ==
X-Gm-Message-State: AFqh2kpTnbYTM11LUciJLO93f1t3qILziKMiJ3rWanFmUOKadxZBI3V9
        0+sRQS6k3+AP05D2VlCUBOhdYeqJMPmgUzVP
X-Google-Smtp-Source: AMrXdXtOC0mV4CaU/JzsJcrhBvVetfwRO6GMSSbLezp8xwsJ1MZ3tKsmRQPUMKLgd1HxKI7VQ/X18Q==
X-Received: by 2002:a05:6512:1285:b0:4b5:b937:7896 with SMTP id u5-20020a056512128500b004b5b9377896mr30148798lfs.46.1673861939446;
        Mon, 16 Jan 2023 01:38:59 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id c5-20020a056512074500b004b53eb60e3csm316985lfs.256.2023.01.16.01.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 01:38:58 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v9 0/6] Add support for Core Power Reduction v3, v4 and Hardened
Date:   Mon, 16 Jan 2023 10:38:39 +0100
Message-Id: <20230116093845.72621-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v9:
- Restore forgotten MAINTAINERS patch (oops)
CPR:
- Include the missing header (big oops!)
- Fix kconfig dependencies
CPR bindings:
- Fix cpu reg in example (why didn't dt_binding_check scream at that)
- Add newlines between nodes in example
- Change opp table node names to opp-table-cpu[04]
- Change opp table labels to cpu[04]_opp_table
- Change CPRh opp subnode names to opp-N from oppN
- Remove some stray newlines
- Bring back nvmem-cell-names and add the 8998's set
- Allow power-domains for VDDCX_AO voting
- Remove Rob's r-b, there's been quite a bit of changes..
CPR DT:
- Send the correct revision of the patch this time around..
OPP bindings:
- Add Rob's ack

Link to v8:
https://lore.kernel.org/linux-arm-msm/20230110175605.1240188-1-konrad.dybcio@linaro.org/

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

AngeloGioacchino Del Regno (5):
  MAINTAINERS: Add entry for Qualcomm CPRv3/v4/Hardened driver
  dt-bindings: soc: qcom: cpr3: Add bindings for CPR3 driver
  soc: qcom: cpr: Move common functions to new file
  soc: qcom: Add support for Core Power Reduction v3, v4 and Hardened
  arm64: dts: qcom: msm8998: Configure CPRh

Konrad Dybcio (1):
  dt-bindings: opp: v2-qcom-level: Let qcom,opp-fuse-level be a 2-long
    array

 .../bindings/opp/opp-v2-qcom-level.yaml       |    4 +-
 .../bindings/soc/qcom/qcom,cpr3.yaml          |  314 ++
 MAINTAINERS                                   |    6 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  873 +++++
 drivers/soc/qcom/Kconfig                      |   22 +
 drivers/soc/qcom/Makefile                     |    2 +
 drivers/soc/qcom/cpr-common.c                 |  363 ++
 drivers/soc/qcom/cpr-common.h                 |  110 +
 drivers/soc/qcom/cpr.c                        |  386 +--
 drivers/soc/qcom/cpr3.c                       | 2923 +++++++++++++++++
 include/soc/qcom/cpr.h                        |   17 +
 11 files changed, 4655 insertions(+), 365 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
 create mode 100644 drivers/soc/qcom/cpr-common.c
 create mode 100644 drivers/soc/qcom/cpr-common.h
 create mode 100644 drivers/soc/qcom/cpr3.c
 create mode 100644 include/soc/qcom/cpr.h

-- 
2.39.0

