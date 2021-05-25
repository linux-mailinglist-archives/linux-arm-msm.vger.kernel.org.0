Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F56C38FE8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 12:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhEYKNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 06:13:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:58726 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhEYKN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 06:13:27 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 25 May 2021 03:11:58 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 May 2021 03:11:56 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 May 2021 15:41:25 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 5899E2270; Tue, 25 May 2021 15:41:24 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     mka@chromium.org, Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V5 00/11] Add PMIC DT files for sc7280
Date:   Tue, 25 May 2021 15:40:55 +0530
Message-Id: <1621937466-1502-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series depends on https://patchwork.kernel.org/project/linux-arm-msm/list/?series=478225
which adds therml-zones node.

Changes in V2:
 - As per Matthias comments:
   - I've Split the patch into per-PMIC patches and one sc7280 patch
   - Removed 2nd critical point, thermal-governer property
   - s/pm8325_tz/pm7325_temp_alarm and s/pm7325_temp_alarm/pm7325_thermal
   - Fixed few other minor errors.

 - As per Bjorn's comments, replaced '_' with '-' in node names and moved
   DT files inclusion to board dts.

Changes in V3:
  - As per Matthias comments, changed commit text, modified critical interrupt
    node name like <name>-crit for all pmics.
  - Moved pmk8350_vadc channel nodes to idp dts, as it is not guaranteed that
    a board with the pmk8350 will always have the other 3 PMICs

Changes in V4:
 - PMR735A and PM8350C PMICS are used in sm8350 SoC. Added thermal_zones label
   for thermal-zones node to avoid compilation error while using the phandle
   in pmic dt files.
 - As per Matthias comments:
  - Changed commit text for pmk8350 pmic patch
  - Moved the header files inclusion for the on die tempertures of PMICs from
    pmk8350 dt file to sc7280-idp dts
  - Changed commit text and made a dedicated patch to include pmic dt files
    for sc7280-idp
  - Made separate patches for on die temp channel nodes and for adding thermal-
    zones node in sc7280 SoC dtsi

satya priya (11):
  arm64: dts: qcom: sm8350: Add label for thermal-zones node
  arm64: dts: qcom: pm7325: Add pm7325 base dts file
  arm64: dts: qcom: pm8350c: Add temp-alarm support
  arm64: dts: qcom: pm8350c: Correct the GPIO node
  arm64: dts: qcom: pmr735a: Add temp-alarm support
  arm64: dts: qcom: pmr735a: Correct the GPIO node
  arm64: dts: qcom: pmk8350: Add peripherals for pmk8350
  arm64: dts: qcom: pmk8350: Correct the GPIO node
  arm64: dts: qcom: sc7280: Include PMIC DT files for sc7280-idp
  arm64: dts: qcom: sc7280: Add ADC channel nodes for PMIC temperatures
    to sc7280-idp
  mfd: qcom-spmi-pmic: Add support for four variants

 .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  4 ++
 arch/arm64/boot/dts/qcom/pm7325.dtsi               | 53 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              | 32 ++++++++++++-
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              | 51 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/pmr735a.dtsi              | 32 ++++++++++++-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            | 34 ++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  2 +-
 7 files changed, 204 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

