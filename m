Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD8B6FB27E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 16:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234551AbjEHOXZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 10:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbjEHOXY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 10:23:24 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CC62736
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 07:23:19 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f37a36b713so46841515e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555798; x=1686147798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9G1leSGGglMdHgO7DDdvTpSALWNAimDPzEUF6uwyp4I=;
        b=k9OQsnGndg/I3ixOlbXuY4Ebpreh+Dqad/P+GTsOmi9voRIR57U1oisTqRWZvneoh+
         jnSjPy4SD/rQbCnuqp3/aCVLk3aq3OGtjFsrkCOmI71HHC/SHcfOq19scCLXhs/zqSXi
         1k7usU1eFGGkYU4kWseGy3XzRbpyzF0DEcX+a8YtMhnyPLZTb5WHlxFsbqj2PY8cY9bC
         ntKb0yyetNe7YhTl7QqpysAkxIg+XTw7zv16p6U4ZYjn0K7eUmeynTGszubV43OoOYjt
         ZEbPUyVY/TLxtlOpuqzFeCVcTVuxRSmF8FRfMtV19wd90lZk6eqaMkit/O8BsNjra3BQ
         +VCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555798; x=1686147798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9G1leSGGglMdHgO7DDdvTpSALWNAimDPzEUF6uwyp4I=;
        b=ClPF6VoL4N9o+VevG5wE+g35Q8YLyhtDSZDrdkR3HLJnxE4xJ+2Fn/2+8riTz9Ekpw
         SWPcjQIeQWztex+3aFpvNyQpENFzvKZGifaiP4gCI36fr/4b/tRPWxucua9ypEpGj5GX
         F0F8uXm9VYxNPY4znMQZsyWnQAKpfh4rp9NC/xbI00uZ0/QRDhm/v3H/AsUBxXZRLIoF
         rl0GB+gOJJqcxI++pWc+Lyjv+zcB6rF/0HBKFGS52Q2PBqBRuTJhSHvva/U6Flzw3Yd7
         k4zaRa7rI1Y965Ft2wwXV7d+y5diPJU37f0ylDMQSQSNSSe8sDHcFsUkJ55pvGfHqrK6
         IXhQ==
X-Gm-Message-State: AC+VfDx2wfL1PMi02r0pUM1uYASE4MGfp4/xerwKIWyvDq2oYoZAVlWP
        2MJ8n9BSCijiIdIi+8pOmI6cOQ==
X-Google-Smtp-Source: ACHHUZ4mlUY3frch+nF2E8SH83KRPctG/UuNn7RmdCSl5YTrd7l2W99kCPoH6tjVi4VUqX4s5PlWxg==
X-Received: by 2002:a05:600c:b4d:b0:3f4:253f:c3d9 with SMTP id k13-20020a05600c0b4d00b003f4253fc3d9mr2015425wmr.25.1683555797976;
        Mon, 08 May 2023 07:23:17 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:17 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v7 00/13] Add Qualcomm PMIC TPCM support 
Date:   Mon,  8 May 2023 15:22:55 +0100
Message-Id: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I'm dropping the previous V1-V6 log because the text is getting too long
here's a link to the previous cover letter instead
Link: https://lore.kernel.org/linux-arm-msm/20230501121111.1058190-1-bryan.odonoghue@linaro.org/

Bootable tree
Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-05-07-pm8150b-tcpm-qcom-wrapper-typec-mux-bjorn

Please note patch#5 and patch#6 should be merged in tandem not separately.

V7:
- Adds R/B to "dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add input and output ports" - Krzysztof
- Fixes indicated, adds R/B to "dt-bindings: usb: Add Qualcomm PMIC Type-C" - Krzysztof
- Fixes indicated, adds R/B to "usb: typec: qcom: Add Qualcomm PMIC Type-C driver" - Guenter
- Fixes indicated, adds R/B to "usb: typec: qcom: Add Qualcomm PMIC Type-C driver" - Caleb
- Adds R/B to "arm64: dts: qcom: sm8250: Define ports for qmpphy orientation-switching" - Konrad
- Adds R/B to "arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost" - Konrad
- Fixes indicated, adds R/B to "arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM" - Jianhua, Konrad
- Connector ports/endpoints left inside of connector
  Documentation/devicetree/bindings/connector/usb-connector.yaml - Jianhua
- dwc3_role_switch_in -> usb_1_dwc3_role_switch_in
  qmpphy_typec_mux_in -> usb_1_qmpphy_typec_mux_in
  Both ports/endpoints defined inside of pm8150b dtsi - Konrad

  I modified the name of both so that the port/endpoint would be directly
  adjacent to the containing node in the dtsi file for code locality/readbility - bod

- Fixes newline indicated "arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for usb_1" - Jianhua, Konrad
- Fixes newline indicated "arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy" - Jianhua, Konrad

- connector
  I have left the connector defintion and its ports/endpoints in the platform dts

  The reason for this
  a) Prior art e.g. arch/arm64/boot/dts/qcom/sc8280xp*
  b) The connector is really a non-SoC/PMIC component its something that is defined
     for your platform.

  I'm open to further debate on this topic:
  Link: https://imgflip.com/i/7kw6ck

- port@1 -> port@1 "arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy" - Jianhua

- OF: graph: no port node found in /soc@0/spmi@c440000/pmic@2/typec@1500

  I left this as-is since the DT model we want is to connect the connector directly to
  the PHY for orientation or controller for data-role switching

  I similarly didn't put this hack in place to remove the warning but "it would work"
  &pm8150b_typec {
        status = "okay";
 
  +       ports {
  +               port@0 {
  +                       reg = <0>;
  +               };
  +        };
  +

- Fairphone4 / sm7225
  pm7250b is a derivative of pm8150b I have the hardware but, haven't booted to test/debug on this hardware yet

- RB3 / sdm845
  Caleb has a WIP patchset based on this series which is our next likely upstream candidate

Here's how I'm testing using an RB5/SM8250

A) Confirm device mode works in both orientations

- Boot to a Linux shell
- Run usb-ecm-up.sh [1]
- This provides usb0 on the device side @ 192.168.8.2
- Attach Type-C cable to host PC
- On host PC "sudo ifconfig usb0 192.168.8.1"
- Ping 192.168.8.2 confirming ping works
- Switch cable orientation
- On the PC side re-assign the ip address "sudo ifconfig usb0 192.168.8.1"
- Ping again confirming connectivity

B) Test automatic host-mode transition, orientation and SuperSpeed
- Remove cable from PC
- Attach a Type-C USB key
- Validate the orientation detection
  cat /sys/class/typec/port0/orientation 
  normal 
- Confirm the RB5 sees the USB key as a SuperSpeed device
- Remove USB key and physically invert it along the horizontal axis
- Re-insert the key
- Confirm the RB5 sees the USB key as a SuperSpeed device
- Validate the orientation detection
  cat /sys/class/typec/port0/orientation 
  reverse

C) Test Type-C accessory automatic host-mode transition, orientation and SuperSpeed
- Remove USB key from RB5
- Attach a Type-C USB accessory
- Validate the orientation detection
  cat /sys/class/typec/port0/orientation 
  normal
- Attach a SuperSpeed capable USB key to the Type-C accessory
- Confirm the RB5 sees the USB key as a SuperSpeed device
- Remove the USB key from the Type-C accessory
- Remove the Type-C accessory from the RB5
- Physically invert the Type-C accessory along the horizontal axis
- Re-insert the Type-C accessory
- Validate the orientation detection
  cat /sys/class/typec/port0/orientation 
  reverse
- Re-insert the key
- Confirm the RB5 sees the USB key as a SuperSpeed device

D) Goto Test-A
- Confirming that automatic switch to device mode happens
- Repeat the above loop in ~ any order

[1] usb-ecm-up.sh 
#!/usr/bin/env bash

# load libcomposite module
modprobe libcomposite

# ensure function is loaded
modprobe usb_f_ecm
modprobe usb_f_ncm

mount -t configfs none /sys/kernel/config/

# create a gadget
mkdir /sys/kernel/config/usb_gadget/g0

# cd to its configfs node
cd /sys/kernel/config/usb_gadget/g0

# configure it (vid/pid can be anything if USB Class is used for driver compat)
echo 0x0525 > idVendor
echo 0xa4a4 > idProduct

# configure its serial/mfg/product
mkdir strings/0x409

echo 0xCAFEBABE > strings/0x409/serialnumber
echo Linaro > strings/0x409/manufacturer
echo qrb5165-rb5 > strings/0x409/product

# create configs
mkdir configs/c.1
mkdir configs/c.1/strings/0x409

# create the function (name must match a usb_f_<name> module such as 'acm')
mkdir functions/ncm.0

echo "CDC ECM" > configs/c.1/strings/0x409/configuration

# associate function with config
ln -s functions/ncm.0 configs/c.1

# Set USB version 3.1
echo 0x0310 > bcdUSB

echo "super-speed-plus" > max_speed

# enable gadget by binding it to a UDC from /sys/class/udc
echo a600000.usb > UDC
# to unbind it: echo "" > UDC; sleep 1; rm -rf /sys/kernel/config/usb_gadget/g0

sleep 1

ifconfig usb0 192.168.8.2

Bryan O'Donoghue (13):
  dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
  dt-bindings: regulator: qcom,usb-vbus-regulator: Mark
    regulator-*-microamp required
  dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch
    as optional
  dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add input and output
    ports
  dt-bindings: usb: Add Qualcomm PMIC Type-C
  dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
  usb: typec: qcom: Add Qualcomm PMIC Type-C driver
  arm64: dts: qcom: sm8250: Define ports for qmpphy
    orientation-switching
  arm64: dts: qcom: pm8150b: Add a TCPM description
  arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
  arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
  arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for
    usb_1
  arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for
    usb_1_qmpphy

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   4 +
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |  44 ++
 .../regulator/qcom,usb-vbus-regulator.yaml    |  10 +-
 .../bindings/usb/qcom,pmic-typec.yaml         | 190 ++++++
 MAINTAINERS                                   |  10 +
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         |  40 ++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  54 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  18 +
 drivers/usb/typec/Kconfig                     |  13 -
 drivers/usb/typec/Makefile                    |   1 -
 drivers/usb/typec/qcom-pmic-typec.c           | 261 --------
 drivers/usb/typec/tcpm/Kconfig                |  11 +
 drivers/usb/typec/tcpm/Makefile               |   1 +
 drivers/usb/typec/tcpm/qcom/Makefile          |   6 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 346 +++++++++++
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.c   | 528 +++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.h   | 119 ++++
 .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 556 ++++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_typec_port.h    | 195 ++++++
 19 files changed, 2130 insertions(+), 277 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
 delete mode 100644 drivers/usb/typec/qcom-pmic-typec.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/Makefile
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h

-- 
2.39.2

