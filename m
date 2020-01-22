Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68F5C145BCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 19:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgAVS4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 13:56:16 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51365 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgAVS4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 13:56:15 -0500
Received: by mail-wm1-f68.google.com with SMTP id t23so204660wmi.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 10:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bzlb1RNJacHtUYCuYqwuP7wS2PSTXuiA30zpoldeYRk=;
        b=fS4TJ86UvRY2S+1xKKBWUiezqeWqQB35cOx93DhWPMXjoV1z6VWk+MAsoVAGPfc1Gr
         ylCBDBbzdNdfuSzpDbfsJdenPQh8vO99ITPBIV7v0q9pbhy8+O8vZsxZqJDVBZZ9KDf5
         VVedzf0r1qM/KDSn+GD6Aqv70DWHw41aGKIck55mpIq6i++qwRiyPdvb6XV6BOCYcMaC
         yMsfQzMEHQKz8GqqOV2s6O+4QSrPuDYE4UQ+sKXndB9S1K/jIWaFj6vUm2K/32RsxeWl
         1BzcYO6pW65aCzsDSGcDrkUhuotz7i2Kg04NZUIfDi61bSbO8VumN/ywOW6ADH8pr2OS
         rmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bzlb1RNJacHtUYCuYqwuP7wS2PSTXuiA30zpoldeYRk=;
        b=uKzO0gP3DCy6tZ0E9x3QTBHZ0VEvUOclZ3fN+MGRTpVcSPBQ0ZFxbnkfrIBvtMHC1Z
         O1GzlV+9VCInswaflao/vhbb2STNnazrzOOvPWhMMoxzY/W8DSyA5+Y3XWQjO/4Rq5sd
         5VI6PXvuGf+XgeAMzMr4wwmAzZDANQXM6AvMh05j8VuspAjjsnJuUW087nA5O1l6m8ZH
         QeKK4CaN8w/5Zm42JMQzvtRRADxK68VhCSxr/yeoY2sr2Irk9w1xdpFJBQkR25uW7gwx
         bs+cx0ugANywC0v5iR40rteBlgsLvWu4JhFCVK4quPiipklItKM3R8/yYhmq2T7XCVXN
         Xoaw==
X-Gm-Message-State: APjAAAUUAxFj6kaQdgi8sKlV5siimftXrnz+wZgdDY/8GWDzklWfXo/Z
        hSArzrp65P5wB/peSvfwTvhcvbTZ5qRk8w==
X-Google-Smtp-Source: APXvYqwr7zfPeZMdgSWPAsBZljn8ewVSiCdp3jsPhpI/n54/F6r8dRZSGwBb81uc8oZnO0zSYV5AlA==
X-Received: by 2002:a1c:1b44:: with SMTP id b65mr4300734wmb.11.1579719373155;
        Wed, 22 Jan 2020 10:56:13 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:12 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 00/19] Enable Qualcomm QCS 404 HS/SS USB
Date:   Wed, 22 Jan 2020 18:55:51 +0000
Message-Id: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
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

Bjorn Andersson (1):
  arm64: dts: qcom: qcs404: Add USB devices and PHYs

Bryan O'Donoghue (10):
  dt-bindings: usb: dwc3: Add a gpio-usb-connector description
  usb: dwc3: qcom: Override VBUS when using gpio_usb_connector
  usb: dwc3: Add support for usb-conn-gpio connectors
  arm64: dts: qcom: qcs404-evb: Define VBUS detect pin
  arm64: dts: qcom: qcs404-evb: Define VBUS boost pin
  arm64: dts: qcom: qcs404-evb: Define USB ID pin
  arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
  arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
  arm64: dts: qcom: qcs404-evb: Enable secondary USB controller
  arm64: dts: qcom: qcs404-evb: Enable primary USB controller

John Stultz (2):
  dt-bindings: usb: generic: Add role-switch-default-mode binding
  usb: dwc3: Add support for role-switch-default-mode binding

Jorge Ramirez-Ortiz (3):
  dt-bindings: phy: remove qcom-dwc3-usb-phy
  dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
  phy: qualcomm: usb: Add SuperSpeed PHY driver

Shawn Guo (1):
  phy: qualcomm: Add Synopsys Hi-Speed USB PHY driver

Sriharsha Allenki (1):
  dt-bindings: phy: Add Qualcomm Synopsys Hi-Speed USB PHY binding

Yu Chen (1):
  usb: dwc3: Registering a role switch in the DRD code.

 .../bindings/phy/intel,lgm-emmc-phy.yaml      |  56 ---
 .../bindings/phy/qcom,qcs404-usb-hs.yaml      |  77 ++++
 .../devicetree/bindings/phy/qcom,usb-ss.yaml  |  75 ++++
 .../bindings/phy/qcom-dwc3-usb-phy.txt        |  37 --
 .../devicetree/bindings/usb/dwc3.txt          |  11 +
 .../devicetree/bindings/usb/generic.txt       |   6 +
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |  90 +++-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 100 +++++
 drivers/phy/qualcomm/Kconfig                  |  21 +
 drivers/phy/qualcomm/Makefile                 |   2 +
 drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c | 415 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-usb-ss.c        | 246 +++++++++++
 drivers/usb/dwc3/core.h                       |   6 +
 drivers/usb/dwc3/drd.c                        | 123 +++++-
 drivers/usb/dwc3/dwc3-qcom.c                  |  17 +-
 15 files changed, 1184 insertions(+), 98 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c

-- 
2.25.0

