Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22D317CE91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 22:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbfGaU3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 16:29:37 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:33028 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbfGaU3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 16:29:37 -0400
Received: by mail-wm1-f46.google.com with SMTP id h19so2071026wme.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2019 13:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J6ze2YAQiFMQcX08HvMMVBLcUCeG0njel810asmfh74=;
        b=A66eZ8wtZbNn3nsqtM7suQXkzBLl5zZ2enyjLbB1erWuNMARvWzGxmTkO0XuWMebS1
         1rrgocfWUtim/FHLitbJqyMTvJ0vH53EyYZGOq5A9uOfBGnIdK+ns5iFkpdrIvzFE/QC
         vxJa3zNO0ZGn3o+A4bMXPwxWZm0R+N6tX36UuDsxL8p3SP4d/HtT6X9glTrNCzjVG8ON
         zvo5NCiPTKZckQcenmPz/xqmj0F14Oj4f9++YheC9PPG3vjIjfIgPCwNIYvSXbU4+ICV
         iqtt2KtDC2yUoZpoaQ88sMaI5wbBYlCVgSG808PZBRXr8ba0mXzMpJg2PYtvjUbU1TbT
         eyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J6ze2YAQiFMQcX08HvMMVBLcUCeG0njel810asmfh74=;
        b=Rxd4LwgsRnBRN/CBwG7z4NYXsEG70soWUOZplaF1NSiFwXA7xoLD3KWCBIGvWZtBfm
         RGaLEKGkumIGCebBVCaAt23K9wcd+acI0JWSQbeAy1rWa2YLQkCEyapNaiWazNz6zX8V
         R5UOk897T8GNQqevibZXR1VpQDJGydsp9AWrlTcCnpCUrfXWRwxuaJctBIg2ydVkxxhL
         Mce623F+QA4TLrHb7TWsJ6m9ysqxVDpC4kfizdD3VyBE7WF0DhzmtSynbwcT0Egz1LOm
         6ITc0pLSKKxoREjAb5yaiLXmq+9rEO+HpQS/NlKs1IdU03XoVlU3QFHjwki4l0DxsjVb
         obow==
X-Gm-Message-State: APjAAAWqxSspt4BYuMtsy0PkZXmLBBXM6Fm8oPZ4ZdIYV6Iwl2B6nOzj
        Tgdj5TCRKRLDWXwRx6gL5R6J3A==
X-Google-Smtp-Source: APXvYqwlUrEDjH//rXtg1eVUY1CgRd0ZuDM1zafwJtzOhlHIQBzrAFHo/nx6y2h1NSrLpNDjGpkieQ==
X-Received: by 2002:a05:600c:204c:: with SMTP id p12mr111863989wmg.121.1564604974820;
        Wed, 31 Jul 2019 13:29:34 -0700 (PDT)
Received: from localhost.localdomain (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id i18sm91905591wrp.91.2019.07.31.13.29.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 13:29:34 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v4 00/13] Support CPU frequency scaling on QCS404
Date:   Wed, 31 Jul 2019 22:29:16 +0200
Message-Id: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following patchset enables CPU frequency scaling support on the
QCS404 (with dynamic voltage scaling).

It is important to notice that this functionality will be superseded
by Core Power Reduction (CPR), a more accurate form of AVS found on
certain Qualcomm SoCs.

Some of the changes required to support CPR do conflict with the
configuration required for CPUFreq.

In particular, the following commit for CPR - already merged - will
need to be reverted in order to enable CPUFreq.

   Author: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
   Date:   Thu Jul 25 12:41:36 2019 +0200
       cpufreq: Add qcs404 to cpufreq-dt-platdev blacklist
    
Patch 8 "clk: qcom: hfpll: CLK_IGNORE_UNUSED" is a bit controversial;
in this platform, this PLL provides the clock signal to a CPU
core. But in others it might not.

We opted for the minimal ammount of changes without affecting the
default functionality: simply bypassing the COMMON_CLK_DISABLE_UNUSED
framework and letting the firwmare chose whether to enable or disable
the clock at boot. However maybe a DT property and marking the clock
as critical would be more appropriate for this PLL. we'd appreciate the
maintainer's input on this topic.

v2:
   - dts: ms8916: apcs mux/divider: new bindings
     (the driver can still support the old bindings)

   - qcs404.dtsi
     fix apcs-hfpll definition
     fix cpu_opp_table definition

   - GPLL0_AO_OUT operating frequency
     define new alpha_pll_fixed_ops to limit the operating frequency

v3:
  - qcom-apcs-ipc-mailbox
    replace goto to ease readability

  - apcs-msm8916.c
    rework patch to use of_clk_parent_fill

  - hfpll.c
    add relevant comments to the code

  - qcs404.dtsi
    add voltage scaling support

v4:
 - squash OPP definition and DVFS enablement in dts
   (patches 10 and 13 in previous version)
   
 - qcom-apcs-ipc-mailbox
   replace return condition for readability
   
 - answer one question on CLK_IGNORE_UNUSED in mailing list

Jorge Ramirez-Ortiz, Niklas Cassel (13):
  clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
  mbox: qcom: add APCS child device for QCS404
  mbox: qcom: replace integer with valid macro
  dt-bindings: mailbox: qcom: Add clock-name optional property
  clk: qcom: apcs-msm8916: get parent clock names from DT
  clk: qcom: hfpll: get parent clock names from DT
  clk: qcom: hfpll: register as clock provider
  clk: qcom: hfpll: CLK_IGNORE_UNUSED
  arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
  arm64: dts: qcom: qcs404: Add HFPLL node
  arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
  arm64: dts: qcom: qcs404: Add DVFS support
  arm64: defconfig: Enable HFPLL

 .../mailbox/qcom,apcs-kpss-global.txt         | 24 +++++++++--
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 43 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/clk/qcom/apcs-msm8916.c               | 23 ++++++++--
 drivers/clk/qcom/clk-alpha-pll.c              |  8 ++++
 drivers/clk/qcom/clk-alpha-pll.h              |  1 +
 drivers/clk/qcom/gcc-qcs404.c                 |  2 +-
 drivers/clk/qcom/hfpll.c                      | 25 ++++++++++-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       | 11 +++--
 10 files changed, 128 insertions(+), 13 deletions(-)

-- 
2.22.0

