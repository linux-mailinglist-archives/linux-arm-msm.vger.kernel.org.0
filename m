Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415716BF9C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 13:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjCRMSh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 08:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCRMSf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 08:18:35 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1435588
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:33 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id k25-20020a7bc419000000b003ed23114fa7so6516091wmi.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lcqSDxRYHcLuhJYWzxu/HppRyPaA6X4IrKVZOnB9svE=;
        b=Fx4pghFbfTbWA8lHGz6OEpXvk8dRCR1+H1x7TmGfbkIe20+rljerU3WRs7V8FEreuC
         YA9ggStnwhjhRGZDdpk1B7d5Z4wwD0FGYWk9v3XKCn2exat5bpshe2BNOFesQjfAJj8c
         DBHuCvOFWboS1q2cv5BjDdr6lOrd4hIduTKxrYxyqbQ3ExWfVWrTvuZI3lgnS6pXUBZh
         L6KJglzRlp6KKC2E/Ul7SevKYGYhdUF7q0Dl1eTqeDKHQWA6uuIAuaEuxyMOvSV4VM0e
         I7F4Sd5HzsAZckkqkgPezKsh3+th+xX5T1/xnFC38l2GucUZ7Z/GFVfkUAiJjSw7KWTx
         NuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcqSDxRYHcLuhJYWzxu/HppRyPaA6X4IrKVZOnB9svE=;
        b=WbC7QCn9DVvC7Ex/d3DNF8DA/NM3LueOtw0hKC6F5fhpBKIWKd6W68yN3iCuVki2Dq
         Qny629zAwd9boPJ8vYqdI9cpJrRqBuJTRe3PexO2GzIyE8l14vjfjJhhd+qsUY8iu5PC
         EcgnB+xk1eQRX3e6CZbku4PPORNaW1g0fCBiEiLnkPxJplS5I1woHF1xbb5j+zuTVhQ6
         AIsqKoLprJISZTpTcw23X10wUse2iTZeH8y6h9/6f19yFEQB9djjJa3RtHxR9du8IIkO
         VTZuNLa+qewyWcwHOiXVoTeqyof+nUZJs4Snj/NJOQdnVmLgfESqfI/rg1uBB+7ywkT6
         DLMA==
X-Gm-Message-State: AO0yUKUdxOOmCaEW19FxQ9weFahXHZ6Q4yfePysCpjx7O03RV/DnjSlF
        QF8EnhYJ38jDkot+YDHtPeWiOA==
X-Google-Smtp-Source: AK7set+zgnz2k2OH6rR7W9QEwGUXEBwEjCdAcki+V2KbBWLnczgQ5eZN5XvbMkMcqT3qQ34n0R5fzw==
X-Received: by 2002:a7b:ca54:0:b0:3ed:aa86:58f9 with SMTP id m20-20020a7bca54000000b003edaa8658f9mr1556111wml.41.1679141911742;
        Sat, 18 Mar 2023 05:18:31 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:31 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 00/18] Add Qualcomm PMIC TPCM support 
Date:   Sat, 18 Mar 2023 12:18:10 +0000
Message-Id: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v4:
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


Bryan O'Donoghue (17):
  dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
  dt-bindings: regulator: qcom,usb-vbus-regulator: Mark
    regulator-*-microamp required
  dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch
    as optional
  dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add port as an optional
  dt-bindings: usb: Add qcom,pmic-typec dt-binding header
  dt-bindings: usb: Add Qualcomm PMIC Type-C controller YAML schema
  dt-bindings: usb: Add qcom,pmic-pdphy dt-binding header
  dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
  dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
  dt-bindings: mfd: qcom,spmi-pmic: Add pdphy to SPMI device types
  dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
  usb: typec: qcom: Add Qualcomm PMIC TCPM support
  arm64: dts: qcom: pm8150b: Add a TCPM description
  arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
  arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
  arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for
    usb_1
  arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for
    usb_1_qmpphy

Dmitry Baryshkov (1):
  phy: qcom-qmp: Register as a typec switch for orientation detection

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   8 +
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |  10 +
 .../regulator/qcom,usb-vbus-regulator.yaml    |  10 +-
 .../bindings/usb/qcom,pmic-pdphy.yaml         |  89 +++
 .../bindings/usb/qcom,pmic-typec.yaml         |  88 +++
 .../bindings/usb/qcom,pmic-virt-tcpm.yaml     |  88 +++
 MAINTAINERS                                   |  10 +
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         |  70 ++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  63 +-
 drivers/phy/qualcomm/Kconfig                  |   8 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  80 ++-
 drivers/usb/typec/Kconfig                     |  13 -
 drivers/usb/typec/Makefile                    |   1 -
 drivers/usb/typec/qcom-pmic-typec.c           | 261 -------
 drivers/usb/typec/tcpm/Kconfig                |  11 +
 drivers/usb/typec/tcpm/Makefile               |   1 +
 drivers/usb/typec/tcpm/qcom/Makefile          |   6 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_pdphy.c | 605 +++++++++++++++++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_pdphy.h |  85 +++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 637 ++++++++++++++++++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h | 163 +++++
 .../usb/typec/tcpm/qcom/qcom_pmic_virt_tcpm.c | 326 +++++++++
 .../dt-bindings/usb/typec/qcom,pmic-pdphy.h   |  18 +
 .../dt-bindings/usb/typec/qcom,pmic-typec.h   |  18 +
 24 files changed, 2388 insertions(+), 281 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-virt-tcpm.yaml
 delete mode 100644 drivers/usb/typec/qcom-pmic-typec.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/Makefile
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_pdphy.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_pdphy.h
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_virt_tcpm.c
 create mode 100644 include/dt-bindings/usb/typec/qcom,pmic-pdphy.h
 create mode 100644 include/dt-bindings/usb/typec/qcom,pmic-typec.h

-- 
2.39.2

