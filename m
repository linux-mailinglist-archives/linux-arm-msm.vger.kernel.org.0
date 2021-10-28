Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEB643E24E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 15:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhJ1Ned (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 09:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbhJ1Ned (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 09:34:33 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7251C061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 06:32:05 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 131-20020a1c0489000000b0032cca9883b5so8089626wme.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 06:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lfDmpZUDAy7S9lpt6Xu3S5V2mdIItsEYI21m3JSsXtk=;
        b=i69zD2mG7gnNR7MDjeeUHO6VBTyK3x8rI/qHQgE70g4Cgtk6Mt3WR5UW4tmd5NxT8/
         SztF6vUM+uR7XzTJc6TFG3Da+AqAKFZBCmGOxMRfCaI/chbC3cfZ8EKFfJ/czo49ALZI
         aie+nMU1gdiAn3KbS8H7u9K5SJph3k3wV/ixXH3TDRPJf8xKkOwLHPRkU0By4kSElJbq
         NYewWSZHnLXKAevc1tnGCjQUDM841F14aUH6YbBTcL46mqKOudpAKKTr3+RFyL6bhh93
         vxqWFHaeS6jehNaTzah1blXhlsELX5G0w1ddFO96Cr+S13oJKotVomSkKeq4UkjzumMW
         woyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lfDmpZUDAy7S9lpt6Xu3S5V2mdIItsEYI21m3JSsXtk=;
        b=pQr0ieXvuawR1udE5xWJlGf3bHvlGxXP9B9FmqOuU4XVdsqaiqHuHT6uUyW5dQq399
         6J8ObeAz65ZSXstAG1x9RKqQh67ujFaEHwp9rpXuIie6yBPqZtwNNlAnJLykhJfBeEVJ
         u8GTjz5WGf4ZFK0ZzK9xGzH0yqjoqPhCtxngyGlMuLEKkGUrGZRRwstigauwgQ5r76zX
         WCTlrbpPEtC4xN+8cS0EELgqEYDtritnzmJ/KoDrgp9d5RHLOh/oJSmJwqZW5gzHDR/c
         EDdAGF7x5Swl8bYvivYtkY+RDIViz0l0YVRKWdlnT6NVBe0ELp1nE8t8JZG/gAzTJOfL
         6z9g==
X-Gm-Message-State: AOAM531DXGu5aVF/JqSdOR4WgepKtSLDaDL7molMEdhUXiNFljzmPBNp
        LfXA0NDmvghJxjp6Yi/8iW6Psw==
X-Google-Smtp-Source: ABdhPJxHn9a2c1t+s4FBhsJnDQk2fsM6x7ZKtsJ/bcN6rH8AKDBcmLabSTqFwrCfpN3VtO7ITG+gkQ==
X-Received: by 2002:a1c:7f0a:: with SMTP id a10mr12869511wmd.60.1635427924404;
        Thu, 28 Oct 2021 06:32:04 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y23sm2774845wmi.43.2021.10.28.06.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 06:32:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 0/7] Add pm8150b TPCM driver
Date:   Thu, 28 Oct 2021 14:33:57 +0100
Message-Id: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

 .../bindings/usb/qcom,pmic-pdphy.yaml         | 115 ++++
 .../bindings/usb/qcom,pmic-tcpm.yaml          | 110 +++
 .../bindings/usb/qcom,pmic-typec.yaml         | 116 ++++
 MAINTAINERS                                   |   8 +
 drivers/usb/typec/Kconfig                     |  13 -
 drivers/usb/typec/Makefile                    |   1 -
 drivers/usb/typec/qcom-pmic-typec.c           | 262 -------
 drivers/usb/typec/tcpm/Kconfig                |  11 +
 drivers/usb/typec/tcpm/Makefile               |   1 +
 drivers/usb/typec/tcpm/qcom/Makefile          |   6 +
 .../usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c | 313 +++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c    | 606 +++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h    |  85 +++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_typec.c    | 638 ++++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_typec.h    | 163 +++++
 .../usb/typec/tcpm/qcom,pmic-usb-pdphy.h      |  18 +
 .../usb/typec/tcpm/qcom,pmic-usb-typec.h      |  18 +
 17 files changed, 2208 insertions(+), 276 deletions(-)
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

