Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF1196E0C97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 13:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjDMLfR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 07:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjDMLfQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 07:35:16 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFCDA253
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:34:47 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e7so3815425wrc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385681; x=1683977681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ouw6a4fr3mpJhXhVrCVT1j4UksjAcaB1ZV5tukFlvg=;
        b=XUI6kmRs6HwRv7il5YS3FICivaLsWIPKmGKcaaBaR+SsnxzqMQ6tyJig5opOkcvV3q
         YXZXbqpZQfiYCmIhqpxWsfbKO6XyHnUKusX/ZPNZzg35iDBkDn22pjzYIsXMIlSROSkb
         xcL7/cySGo1yVn1J260gjW2nk2eh/EwnVIV1wrW5doBubZBeRis+XxfSfT0ee3JK7TUy
         Y2Iexygi6ulPulYbjRapkrTOXIQJ414NO3kKYf7yDr2QREKI92j4gsWo/a/0SKYq98K7
         jO6jTE/nb1YZY44yqsY0lUtmO8oUmA1hM4PNEH5FGNdAPq5w4HPhVzFdQvyQXS/U88p9
         XwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385681; x=1683977681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Ouw6a4fr3mpJhXhVrCVT1j4UksjAcaB1ZV5tukFlvg=;
        b=OTgcNVVL3+syLOaOIE93HbpEMwdlDTCAAWxBng2OLc4CozGrKMC1xfc2e8zfXlR4qg
         okGTzXdQWLR+cQ7tY7Io3Ej4mFrAIL51B6q+1fexdaCcwJ9gprJsGC+7BKcBDnaiRBZX
         IYEeQMNZHk4Lj7cfq4Ln/eLC/+ioVol9YYXTwJgd0rGRL3VGIwcdD8Ad0CyhCoUy60/M
         nnYnYlVw86KED5akrZky6dP5NIjnGrT4pfKTssmO0qV9uPOhtmXfvAxwiiVgYugb3NJQ
         /4gi5BSZVL9L21h0a6piviXVTwMwSyzrsFeUT/6M+xWNo10OfJf62Y0cP/uCPJ4Wnfnv
         VTiw==
X-Gm-Message-State: AAQBX9e+PaRd0YP2RR0vUBmzZ7k1UGr6I3l6It59sFbPOvXcjDfUb09+
        bO/T0CdRpg+Lj2BvedEqww6Aug==
X-Google-Smtp-Source: AKy350YSzo78VEZFHN7qZwpu5hVQ8oR+cxVgZ99TWtqFfeWRrnYjQEKL3la8kSy6Zqa6gkpXD6Xa4A==
X-Received: by 2002:a5d:4e85:0:b0:2f2:7109:b7a4 with SMTP id e5-20020a5d4e85000000b002f27109b7a4mr1538847wru.39.1681385681006;
        Thu, 13 Apr 2023 04:34:41 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:40 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support 
Date:   Thu, 13 Apr 2023 12:34:24 +0100
Message-Id: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V5:
- Amagamates into once device, Heikki, Rob

- Takes feedback on usage form Luka and Jianhua on VSafeV state transition detection
  dev_err() -> dev_warn()

- Orientation graph example and general expected bindings
  I discussed offline with Bjorn the conclusions of the glink/sbu model.
  The expected orientation-switch path is
    connector/port@0 <-> phy/port@X <-> dp/port@0
  This can then be expanded to
    connector/port@0 <-> redriver/port@0 <-> phy/port@X <->  dp/port@0

  - Rob, Bjorn, Krzysztof

- Data role
  The data-role path is
    connector/port@0 <-> dwc3/port@Y 

Previous set:
https://lore.kernel.org/linux-arm-msm/20230318121828.739424-1-bryan.odonoghue@linaro.org/

Bootable:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-04-12-pm8150b-tcpm-qcom-wrapper-typec-mux
   
V4:
- Per Rob's input the pdphy and type-c appear as stadalone blocks
  inside of the PMIC declaration which is a 1:1 mapping of PMIC hardware.
  The TCPM virtual device is declared at the top-level.
  https://lore.kernel.org/all/YY7p7jviA3ZG05gL@robh.at.kernel.org/

- Squashes the removal of the old driver with the addition of the new. - Heikki, Gunter
  https://lore.kernel.org/all/YYVHcHC1Gm92VxEM@kuha.fi.intel.com/

- Reworked Dmitry's old patch for the QMP to account for file renames and
  very minimal code-drift in the interregnum.

- New yaml checks drive update of PMIC VBUS yaml

- Some housekeeping on the sc7180 yaml side. sc7180 is not supported yet.

- Expands and fixes the examples being added in the PMIC tcpm examples.

Previous set:
https://lore.kernel.org/all/20211105033558.1573552-1-bryan.odonoghue@linaro.org/

Bootable:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/linux-next-23-03-18-pm8150b-tcpm-qcom-wrapper-typec-mux

V3:
Rob Herrings review

- Drops use of remote-endpoint and ports to bind
  tcpm to pdphy and typec replacing with phandle

- Drops pmic-pdphy-* and pmic-typec-* from interrupt names
  as suggested

- Passes make dt_binding_check DT_CHECKER_FLAGS=-m

BOD
- Noticed qcom_pmic_tcpm_pdphy_enable() was missing a
  regulator_disable in case of an error, added.

- qcom_pmic_tcpm_pdphy_probe()
  devm_regulator_get() should come before regmap_get()
  as is the case in qcom_pmic_tcpm_typec_probe()

- Fixes compatible name in qcom,pmic-typec.yaml should
  have read qcom,pm8150b-typec not qcom,pm8150b-usb-typec

- Makes sure compat for core is "qcom,pm8150b-tcpm" in
  docs and driver

- Drops redundant return in void qcom_pmic_tcpm_pdphy_reset_off()

Kernel Robot
- Drops unused variable debounced in qcom_pmic_tcpm_typec_get_cc()

- Drops unsused variable orientation in qcom_pmic_tcpm_typec_set_cc()

Latest bootable series can be found here:
Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=usb-next-04-11-21-pm8150b-tcpm-v3

git diff usb-next-27-10-21-pm8150b-tcpm-v2 -- drivers/usb/typec/tcpm/qcom/
git diff usb-next-27-10-21-pm8150b-tcpm-v2 -- Documentation/devicetree/bindings/usb/qcom,pmic*

Previous set:
Link: https://lore.kernel.org/linux-usb/20211028164941.831918-1-bryan.odonoghue@linaro.org/T/#t

V2 resend:
- Adding omitted devicetree mailing list

V2:

Guenter Roeck's review
- Converts suggested qcom_pmic_tcpm_core.c into one-liners

- Adds comment on how polarity is set in set_polarity()

- Removes optional set_current_limit()

- regmap_read/regmap_write
  Reviwing other pm8150b/spmi drivers I then added in checks for all
  reamap_read()/regmap_write() calls.

- Fixes (type == TCPC_TX_CABLE_RESET || TCPC_TX_HARD_RESET)
  thanks I definitely had the blinkers on there and didn't see that at all

- qcom_pmic_tcpm_pdphy_pd_transmit_payload()
  Treats regmap_read and read value as separate error paths

- qcom_pmic_tcpm_pdphy_set_pd_rx()
  Replaces boolean if/else with !on as suggested

- Returns -ENODEV not -EINVAL on dev_get_regmap() error

- qcom_pmic_tcpm_pdphy_pd_receive()
  Guenter asks: "No error return ?"
  bod: No we are inside an ISR here if we read data we pass that off to TCPM
       if somehow we don't read the data - it is "junk" there's no value IMO
       in pushing an error upwards back to the handler.

Heikki Krogerus' review
- Includes Makefile I missed adding to my git index

- Removes old Kconfig entry for remove driver

Randy Dunlap's review 
- Rewords drivers/usb/typec/tcpm/Kconfig

- Drops tautology "aggregates togther"

- Corrects spelling typos

BOD's own review
- Drops redundant include of regmap.h in qcom_pmic_tcpm_core.c

- Propogates qcom_pmic_tcpm_pdphy_disable() error upwards

- Propogates pmic_pdphy_reset() error upwards

- Drops error prints in qcom_pmic_tcpm_pdphy_pd_transmit_payload()
  I had these in-place during development and don't recall them being
  triggered even once, they are redundant, remove.
 
Differences between the two can be seen by
git diff usb-next-27-10-21-pm8150b-tcpm-v2..usb-next-25-10-21-pm8150b-tcpm -- drivers/usb/typec/tcpm

Latest bootable series can be found here:
Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=usb-next-27-10-21-pm8150b-tcpm-v2

Previous set:
Link: https://lore.kernel.org/all/20211025150906.176686-1-bryan.odonoghue@linaro.org/T/#t

V1:
This series adds a set of yaml and a driver to bind together the type-c and
pdphy silicon in qcom's pm8150b block as a Linux type-c port manager.

As part of that we retire the existing qcom-pmic-typec driver and fully
replicate its functionality inside of the new block with the additional
pdphy stuff along with it.

An additional series will follow this one for the SoC and RB5 dtsi and dts
respectively.

A bootable series can be found here

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=usb-next-25-10-21-pm8150b-tcpm

Bryan O'Donoghue (13):
  dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
  dt-bindings: regulator: qcom,usb-vbus-regulator: Mark
    regulator-*-microamp required
  dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch
    as optional
  dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add ports as an
    optional
  dt-bindings: usb: Add Qualcomm PMIC Type-C YAML schema
  dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
  arm64: dts: qcom: sm8250: Define ports for qmpphy
    orientation-switching
  arm64: dts: qcom: pm8150b: Add a TCPM description
  arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
  arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
  arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for
    usb_1
  arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for
    usb_1_qmpphy
  usb: typec: qcom: Add Qualcomm PMIC TCPM support

Dmitry Baryshkov (1):
  phy: qcom-qmp: Register as a typec switch for orientation detection

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   4 +
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |  40 ++
 .../regulator/qcom,usb-vbus-regulator.yaml    |  10 +-
 .../bindings/usb/qcom,pmic-typec.yaml         | 169 ++++++
 MAINTAINERS                                   |  10 +
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         |  40 ++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  57 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  13 +
 drivers/phy/qualcomm/Kconfig                  |   8 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  80 ++-
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
 21 files changed, 2202 insertions(+), 281 deletions(-)
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

