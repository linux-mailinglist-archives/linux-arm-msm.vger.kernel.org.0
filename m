Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEA535EFB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 10:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349698AbhDNIfT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 04:35:19 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:51686 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348471AbhDNIfR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 04:35:17 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 14 Apr 2021 01:34:55 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Apr 2021 01:34:53 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Apr 2021 14:04:29 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 3693C47EC; Wed, 14 Apr 2021 14:04:28 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 0/5] Add PMIC DT files for sc7280
Date:   Wed, 14 Apr 2021 14:04:21 +0530
Message-Id: <1618389266-5990-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PM7325 DT file with gpio and temp-alarm nodes.
For PM8350C, PMR735A and PMK8350 add the required peripherals
as the base DT files are already added [1].
[1] https://lore.kernel.org/patchwork/project/lkml/list/?series=489011&state=%2A&archive=both

Changes in V2:
 - As per Matthias comments:
   - I've Split the patch into per-PMIC patches and one sc7280 patch
   - Removed 2nd critical point, thermal-governer property
   - s/pm8325_tz/pm7325_temp_alarm and s/pm7325_temp_alarm/pm7325_thermal
   - Fixed few other minor errors.

 - As per Bjorn's comments, replaced '_' with '-' in node names and moved
   DT files inclusion to board dts.

Changes in V3:
 - As per Matthias comments, changed commit text, modified criticl interrupt
   node name like <name>-crit for all pmics.
 - Moved pmk8350_vadc channel nodes to idp dts, as it is not guaranteed that
   a board with the pmk8350 will always have the other 3 PMICs

satya priya (5):
  arm64: dts: qcom: pm7325: Add pm7325 base dts file
  arm64: dts: qcom: pm8350c: Add temp-alarm support
  arm64: dts: qcom: pmr735a: Add temp-alarm support
  arm64: dts: qcom: pmk8350: Add PMIC peripherals for pmk8350
  arm64: dts: qcom: sc7280: Include PMIC DT files for sc7280

 arch/arm64/boot/dts/qcom/pm7325.dtsi    | 53 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8350c.dtsi   | 32 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/pmk8350.dtsi   | 55 ++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/pmr735a.dtsi   | 32 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 30 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    |  3 ++
 6 files changed, 202 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

