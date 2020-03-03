Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C71B2177CE4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgCCRLv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:11:51 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43873 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbgCCRLu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:11:50 -0500
Received: by mail-wr1-f68.google.com with SMTP id h9so4378172wrr.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 09:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2lcwv+mahaDg/rAeUp7B12geaf+9wu8BKPl18AURuzM=;
        b=A3QSDncesnOKYshserpIcK2YANMHRLRx8GW9RSUMkvzZjE9jcSlhrHVhhSkp4wAySM
         NqI1vgrx8r8pqpuJW0o0MtRHDQcS4LalV3NxxSQa8AGVDsA5RdVRqT20T4iQgKau6Tkh
         YDa088oGFlIssHK0mHfwVOKYLLZLx55D+RPQNbR4cwZmY/m7me+NfGUFdGFczFV6uUY6
         zVmZ731SYEo8TKL/r3o3e44v7Gf/iNTTQiHbV6PhD66VVfN6ef/BmSiun9nGyKyZqVbY
         ElrFVNWL+f2n5r646XGOSYbLShbr004A27PYkSBPnnvJIS0l9kVcCO2eHpW2awHKakxJ
         PC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2lcwv+mahaDg/rAeUp7B12geaf+9wu8BKPl18AURuzM=;
        b=uPJzvEe0X07PmhmGnqXR6cDAKgsfpwn6hMnKUJFNykiJarn/qEareTo3+8CrqpKV6B
         DeeZJWAnOEBSJZ5Adno4SK6za9W4qnnZ8KLRyrV2do1yYaQutZ2VlQgD4WsYBWVlB3FI
         PLkht9XHVQAJbBuMkdl+wSrlAjNxqwUU6B9aCSR9AemknaxHBgbuiUOgjuIdRJ5YVaq8
         Uk8RVgnGEDYqateN5kya2DMSwkpEw67w2aL49u1B0Q00z9OM3czwjPfpDRM/516Zh/sM
         D0aD717NlSTx4yi+v4Z/g5lqAC5HXg6nFvdwud5l8qgQygyaP+gFEK52yIfuC+Fkx3rw
         x3IA==
X-Gm-Message-State: ANhLgQ0qrYliqs/FXHNhhic4IAdldsgjJMoGrO+ZMwhKBh/5OR2Jm9BR
        D+sEXBdaKUWmb8K75gYjp9PGEDit3xw=
X-Google-Smtp-Source: ADFU+vuk7w/+dbuT6xfNIte+qgXtkS9wHD8Z5rcQlBAi9uWqC7EZhEVH4rpu7NUdSdHgS729LjFY3Q==
X-Received: by 2002:adf:b345:: with SMTP id k5mr2885740wrd.55.1583255506937;
        Tue, 03 Mar 2020 09:11:46 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:11:46 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v7 00/18] Enable Qualcomm QCS 404 HS/SS USB
Date:   Tue,  3 Mar 2020 17:11:41 +0000
Message-Id: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V1:
This series enables the Primary and Secondary USB controllers on the
QCS404, associated PHYs, role-switching and DTS descriptions.

The series takes in a number of patches worked on by a number of people
over the past few years from downstream, through to previous upstream
submissions for both of these interfaces. Additional work has been done to
enable USB role-switching.

1. USB SS
   - extcon has been dropped in favour of gpio-usb-conn as discussed and
     agreed previously by Jorge, Bjorn, Stephen Boyd and Jack Pham [1].

   - Regulator API has been updated following suggestions from Bjorn.
   
   - Sanitzation of the DT compatible name - dropped "snps" entirely
     from the name - it made almost no sense to me and doesn't appear
     consistent with similar naming conventions for Snopsys based IP.

2. USB HS
   - Regulator API changes here.
   - Dropped "snps" from the namespace for similar reasons as above.
   - Dropped "28nm" from the namespace, looked superfluous.
   - Changed "High-Speed" to "Hi-Speed".
   - [2]

3. DWC3 Role switching
   - At the time usb-gpio-conn was discussed it was mentioned that
     role-switching was absent from the DWC3 driver.
   - John Stultz has some patches in-flight for that, that I've included in
     this series for completeness.
   - Adds my SoB to relevant patches.
   - Drops gerrit ChangeId.

4. DWC3 usb-gpio-conn
   Needs to be a child node of the DWC3 driver so some code and DT binding
   is required for that.

5. QCOM-DWC3
   Since we are role-switching with an external PMIC supplying VBUS we want
   to skip past toggling VBUS from QCOM-DWC3 controlled registers, so a
   patch is added to the qcom-dwc3 driver to do that.

References:

1: USB SS PHY for Qualcomm's QCS404
https://lwn.net/ml/devicetree/20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org/

2: Add Synopsys High-Speed USB PHY driver for Qualcomm SoCs
https://lore.kernel.org/linux-arm-msm/20181127100722.9993-3-shawn.guo@linaro.org/

https://www.spinics.net/lists/linux-usb/msg190003.html

V2:
- Fixes yaml error - Rob's YAML robot
- Exclusive control of reset in PHY drivers - Philipp Zabel

V3:
- Fixes typo generating YAML warning - Rob's YAML robot

V4:

https://lore.kernel.org/linux-arm-msm/20200122185610.131930-1-bryan.odonoghue@linaro.org/

- Churn names of PHYs - Rob Herring
  Rob questioned the name of the SuperSpeed PHY in V3.
  Looking at available data 

  usb-hs-28nm - There are two possible PHYs on 28nm litho node
		so it makes sense to name the PHY relating to its relevant
		litho node.

  usb-ss - This is not litho node dependent and is used on  multiple SoCs
	   and litho nodes.

- Drop default mode for role switching - Felipe Balbi
  Felipe asked if the default mode for role switching was
  required and the answer is no. It makes no difference
  becuase the USB ID pin ultimately dictates the mode of operation.

- Change "gpio_usb_connector" to "connector" - Rob
  This was a minor change in terms of DTS but, means I need to look for the
  DTS compatible string as opposed to a label given in the DTS.
  No matter what the name of the label, this is he right thing to do.

- Used IS_ENABLED() - Felipe
  The logic is the same but IS_ENABLED() is used now.

- Retained example of USB connector in dwc.txt - Rob, Felipe
  Rob pointed out adding the connector was redundant as the documentation
  already implies it.
  Felipe seemed in favour of I think adding the example.
  I've dropped the documentation of the connector and kept the example.
  https://lore.kernel.org/linux-arm-msm/20200122185610.131930-7-bryan.odonoghue@linaro.org/

- Added example of usb-role-switch in dwc3.txt - BOD
  
- Incorporated various inputs from Rob on DTS/YAML
  - Added required:
  - Added additionalProperties:
  - Renamed "phy" clock to "ahb"
  - maxItems dropped as indicated

V5:
- https://lkml.org/lkml/2020/2/6/913

- Adds a notifier to DWC3 - BOD
  This is done in order to allow propagation of role-switch events from the
  DWC3 core to an associated binding layer.

- Re-use the existent EXTCON VBUS power lane toggle logic - Jack Pham
  Jack flagged this for inclusion and as a result we need to make a
  small change to the qcom binding layer.

- Squash DTS changes - BOD
  I've squashed down some of the DTS changes to stop the patch count in
  this series going  up any further.

V6:
- https://lkml.org/lkml/2020/2/7/632

- Add RB Jack Pham patch # 11

- Fix a stale description in git log patch # 10

V7:
- https://lkml.org/lkml/2020/2/10/258

- Adds RB Rob Herring as indicated

- Updates the naming of the USB SS PHY for the particular SoC.
  The name of the driver is maintained, as previously mentioned, this
  IP appears to be in use on the 20nm and 28nm nodes. However taking
  Rob's feedback on the naming of the SoC specific bit the code being added
  is specified @ 28nm.
  If/when we come to add in 20nm for this IP we can add a new compatible
  for 20nm.
  Rob Herring

Bjorn Andersson (1):
  arm64: dts: qcom: qcs404: Add USB devices and PHYs

Bryan O'Donoghue (11):
  dt-bindings: usb: dwc3: Add a gpio-usb-connector example
  dt-bindings: usb: dwc3: Add a usb-role-switch to the example
  usb: dwc3: qcom: Add support for usb-conn-gpio connectors
  usb: dwc3: Add support for usb-conn-gpio connectors
  usb: dwc3: Add support for a role-switch notifier
  usb: dwc3: qcom: Enable gpio-usb-conn based role-switching
  arm64: dts: qcom: qcs404-evb: Define VBUS pins
  arm64: dts: qcom: qcs404-evb: Define USB ID pin
  arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
  arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
  arm64: dts: qcom: qcs404-evb: Enable USB controllers

Jorge Ramirez-Ortiz (3):
  dt-bindings: phy: remove qcom-dwc3-usb-phy
  dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
  phy: qualcomm: usb: Add SuperSpeed PHY driver

Shawn Guo (1):
  phy: qualcomm: Add Synopsys 28nm Hi-Speed USB PHY driver

Sriharsha Allenki (1):
  dt-bindings: phy: Add Qualcomm Synopsys Hi-Speed USB PHY binding

Yu Chen (1):
  usb: dwc3: Registering a role switch in the DRD code.

 .../bindings/phy/qcom,usb-hs-28nm.yaml        |  90 ++++
 .../devicetree/bindings/phy/qcom,usb-ss.yaml  |  83 ++++
 .../bindings/phy/qcom-dwc3-usb-phy.txt        |  37 --
 .../devicetree/bindings/usb/dwc3.txt          |   9 +
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |  90 +++-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 100 +++++
 drivers/phy/qualcomm/Kconfig                  |  20 +
 drivers/phy/qualcomm/Makefile                 |   2 +
 drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c   | 415 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-usb-ss.c        | 246 +++++++++++
 drivers/usb/dwc3/core.h                       |  22 +
 drivers/usb/dwc3/drd.c                        | 119 ++++-
 drivers/usb/dwc3/dwc3-qcom.c                  |  31 +-
 13 files changed, 1223 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c

-- 
2.25.1

