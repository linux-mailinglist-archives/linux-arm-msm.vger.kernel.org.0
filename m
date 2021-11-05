Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE75E445EAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 04:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbhKEDgl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 23:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbhKEDgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 23:36:40 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C97AC061203
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 20:34:01 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id c71-20020a1c9a4a000000b0032cdcc8cbafso5598704wme.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 20:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S7Yk+FkXQ7I5h+tDc4CVkiVNjrz23sJGozwpLzZeAPg=;
        b=HMZoT9WgqjN5QcNfw9dyEDbvihwWTiB4GO+ZzTZnwjPRjZEsY4qV6Ja+HBNpkud6K8
         7yAC7g5Kd3qwKH7Lex4iN803cyHtGSmF26RjOSUDggCLoojPVNFqpdt1gk5dDbb+1JzX
         fc/OxKBBO6FsdOzZmg9m4O4bMHg9PVlyS+fhiaBIR0mLbwTxZQkVDZdgik8be2GQ6Vle
         l1BhUipniDlmgcwSAUzum02Km/qHwC9tk7QvZ8QgMq5bi8xSYm+sBoiCF9sejcPzjJo4
         wocp7fRrMF+S5oTwcfSd+KRW7i0HHFOhlJcVaCxgYeyOv1O7o6OoVOMDgd4X65mPy7kh
         ZBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S7Yk+FkXQ7I5h+tDc4CVkiVNjrz23sJGozwpLzZeAPg=;
        b=pD81H3Vd1s5ai0cneYA5ZvelByRs5r+fuxASwAJ3YgI0kTSH3n+FEW+jZoYCN2XdYM
         pWimhTlCRy5j+g8wraOPhSxde53a/DlO7X9dS6NO+BCDnyRvcHAT+MKg1NEcukssqjv2
         mxZ1uJZkZ6TtGUHu7JP9/rlu9FADZYzKw4nFoAKxoVHej8sl/D9Fha/rc1m8w97MEfFo
         gk4clzrOX063uB5FHhhjj46/p7sMjuD0R67oDHP8cgVcjXl8Gor44CsqR4utXKWncMQy
         WJT1onIoDTaT/1gW98BG59g5owx80Vtcrpfbcad+Hh7HOehMQ3Epp7/ZLuaBI7XmFJXp
         YjtA==
X-Gm-Message-State: AOAM531USRTr/JJI0WyDBgFntuND2ZpXCiXrDHnpg7IjrUNwZ5qtGAHj
        yoxXR6Sf/VvNeVP8qnVw2fufNg==
X-Google-Smtp-Source: ABdhPJxV54X4bO4PZ5cGazBrYh4+m7ihDzMu1/HqZRWCjnFFpb67eBHeJbYC7gT+9YUX8Wssr8kldg==
X-Received: by 2002:a05:600c:354f:: with SMTP id i15mr10617800wmq.59.1636083239553;
        Thu, 04 Nov 2021 20:33:59 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l15sm2546296wme.47.2021.11.04.20.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:33:59 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/7] Add pm8150b TPCM driver
Date:   Fri,  5 Nov 2021 03:35:51 +0000
Message-Id: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Bryan O'Donoghue (7):
  dt-bindings: usb: Add qcom,pmic-usb-typec dt-binding header
  dt-bindings: usb: Add Qualcomm PMIC type C controller YAML schema
  dt-bindings: usb: Add qcom,pmic-usb-pdphy dt-binding header
  dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
  dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
  usb: typec: qcom: Remove standalone qcom pm8150b typec driver
  usb: typec: qcom: Add a pm8150b TCPM driver

 .../bindings/usb/qcom,pmic-pdphy.yaml         |  92 +++
 .../bindings/usb/qcom,pmic-tcpm.yaml          |  68 ++
 .../bindings/usb/qcom,pmic-typec.yaml         |  93 +++
 MAINTAINERS                                   |   8 +
 drivers/usb/typec/Kconfig                     |  13 -
 drivers/usb/typec/Makefile                    |   1 -
 drivers/usb/typec/qcom-pmic-typec.c           | 262 -------
 drivers/usb/typec/tcpm/Kconfig                |  11 +
 drivers/usb/typec/tcpm/Makefile               |   1 +
 drivers/usb/typec/tcpm/qcom/Makefile          |   6 +
 .../usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c | 320 +++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c    | 607 +++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h    |  85 +++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_typec.c    | 638 ++++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_typec.h    | 163 +++++
 .../usb/typec/tcpm/qcom,pmic-usb-pdphy.h      |  18 +
 .../usb/typec/tcpm/qcom,pmic-usb-typec.h      |  18 +
 17 files changed, 2128 insertions(+), 276 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
 delete mode 100644 drivers/usb/typec/qcom-pmic-typec.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/Makefile
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.h
 create mode 100644 include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h
 create mode 100644 include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h

-- 
2.33.0

