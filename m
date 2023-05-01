Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B13D6F309F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbjEAMLS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjEAMLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:11:17 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47718199
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:11:15 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f173af665fso13519995e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943074; x=1685535074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGd8Sd3W0ZmV/RZ6Kk4T+VGBaQCAOEIRQhIzzIbsDcA=;
        b=CQaphNYrxu/g4Wm9ibfpY/QhqxqyMUKiQs+k2+dPHgZK9NCjmQLlcEJw89YopHRCeR
         rqFU1A5qFq/QBVKC+8Hsa492oC3i8zSTom69+CBgMuK/UIQ7YNVcfb1f4nlsrXUyuMQE
         Br1Sm531j9SIsjhkP/tv2csA0b/DABn94LTagG1fddC7uk1Uzt7zgEF6ULDntGwcf5C2
         /tyF2GyoSUM3u/VCU89WLSEYGr39jHr8lJlOW8u+bf9HEZKIXg6lFsOXSgiJ6xlgUvJy
         68yIqvrGXD0Dxdl+unaCDscS52aWlVnVaj/TgYIRxqoyX7box68qrh4pF9jotYp02FjM
         NEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943074; x=1685535074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGd8Sd3W0ZmV/RZ6Kk4T+VGBaQCAOEIRQhIzzIbsDcA=;
        b=RCfhPkETRiTJmVG9EiPU6XyXzkwIFuzEsBSYXlUpRycJNDPZOfgMqbB0qV/wHG8jfV
         IXBCfn8prgDbJU05yDvW3oJYhIfaZ2ubeRrs3uu+cC0tLd1A+zXOdeqHW544Ap/tDBla
         Tf+CSkdT7SbQuqWNKoL/UrLwWadWLrYfpCqq7vygg3XUUNkSyRV4QCQVX3jnrDMCVtpP
         yCHYoPLn5wvlGZ2CM62aBNTpTFAap0WITRnZw0wmt/m+518eCMyDjJT7bCOxwNLjEqIL
         2eskcwegd4G+bPNynBjaNBqhV+MBeMb0GRtFtHBu3gnjTDj+NiCFjTWyH1ShNWEhtqA1
         bfYA==
X-Gm-Message-State: AC+VfDzVAWKeinohrbXpe9GGZGZJ+UPMTgjOvzJX939A82R05M+TX5r4
        BLINRi/nkSiYXicSsMJqtBRgjQ==
X-Google-Smtp-Source: ACHHUZ52NEPFXJX7QdoEZjaxGmKQ9qy/boJbHp7IIcWn/vTeJbG9lU1JyTU1E8UTXavdE2bQJbxDOw==
X-Received: by 2002:a1c:f707:0:b0:3f1:93c8:4a79 with SMTP id v7-20020a1cf707000000b003f193c84a79mr9151363wmh.29.1682943073711;
        Mon, 01 May 2023 05:11:13 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:13 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v6 00/13] Add Qualcomm PMIC TPCM support 
Date:   Mon,  1 May 2023 13:10:58 +0100
Message-Id: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I'm dropping the previous V1-V5 log because the text is getting too long
here's a link to the previous cover letter instead
Link: https://lore.kernel.org/linux-usb/20230413113438.1577658-1-bryan.odonoghue@linaro.org/

Bootable tree
Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-04-28-pm8150b-tcpm-qcom-wrapper-typec-mux-bjorn 

Please note patch#5 and patch#6 should be merged in tandem not separately.

V6:

- I found an off-by-one bug when connecting a Type-C DP cable from Amazon
  which sends the max PD PDU - bod patch#7

- Drops the partial PHY orientation patch in favour of Bjorn's sc8280xp series
 
- Updates the commit log for the driver per Heikki's comment patch#7
- Adds Heikki's Acked-by to the driver patch#7

- Ammends commit log text - Marijn patch#4
- Typos highlithed - Marijn patch#4

- Adds Reviewed-by - Krzysztof patch#1
- Makes port@0 input required - Krzysztof patch#4
- Incorporate's Krzysztof's comments for quotation marks, minItems patch#5
- Adds Reviewed-by - Krzysztof patch#6

- Defines port/endpoint in sm8250.dtsi - patch#13 Konrad

- Luca. Would appreciate your testing.
  I don't see anything wrong with your reference dts
  Link: https://github.com/z3ntu/linux/blob/5db89528bd6f0f2e6027f2ad64a9178699be9bc0/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts

  If we still can't get it working for you with Bjorn's patches maybe I can find
  a few cycles to debug with a FP4 after landing the 8250 bit.

  Caleb has something working for the rb3 based on these patches so, the gap can't be too big.

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
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  56 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  17 +
 drivers/usb/typec/Kconfig                     |  13 -
 drivers/usb/typec/Makefile                    |   1 -
 drivers/usb/typec/qcom-pmic-typec.c           | 261 --------
 drivers/usb/typec/tcpm/Kconfig                |  11 +
 drivers/usb/typec/tcpm/Makefile               |   1 +
 drivers/usb/typec/tcpm/qcom/Makefile          |   6 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 362 +++++++++++
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.c   | 528 +++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.h   | 115 ++++
 .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 560 ++++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_typec_port.h    | 194 ++++++
 19 files changed, 2146 insertions(+), 277 deletions(-)
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

