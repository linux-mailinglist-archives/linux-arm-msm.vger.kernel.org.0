Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A77E3511A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 11:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbhDAJOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 05:14:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25685 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbhDAJOB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 05:14:01 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 01 Apr 2021 02:14:01 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Apr 2021 02:13:59 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Apr 2021 14:43:36 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 7CBEF26F7; Thu,  1 Apr 2021 14:43:34 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 0/5] Add PMIC DT files for sc7280 
Date:   Thu,  1 Apr 2021 14:43:11 +0530
Message-Id: <1617268396-1837-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in V2:
 - As per Matthias's comments:
    - I've Split the patch into per-PMIC patches and one sc7280 patch
    - Removed 2nd critical point, thermal-governer property
	- s/pm8325_tz/pm7325_temp_alarm and s/pm7325_temp_alarm/pm7325_thermal
    - Fixed few other minor errors.

 - As per Bjorn's comments, replaced '_' with '-' in node names and moved
   DT files inclusion to board dts.

This series is dependent on below series which adds DT files for SC7280 SoC
https://lore.kernel.org/patchwork/project/lkml/list/?series=488871

satya priya (5):
  arm64: dts: qcom: pm7325: Add PMIC peripherals for pm7325
  arm64: dts: qcom: pm8350c: Add PMIC peripherals for pm8350c
  arm64: dts: qcom: pmk8350: Add PMIC peripherals for pmk8350
  arm64: dts: qcom: pmr735a: Add PMIC peripherals for pmr735a
  arm64: dts: sc7280: Include PMIC DT files for sc7280

 arch/arm64/boot/dts/qcom/pm7325.dtsi    |  53 +++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8350c.dtsi   |  53 +++++++++++++++++
 arch/arm64/boot/dts/qcom/pmk8350.dtsi   | 100 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmr735a.dtsi   |  53 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dts |   4 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    |   3 +
 6 files changed, 266 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

