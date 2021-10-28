Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A78643E680
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 18:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhJ1QuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 12:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhJ1QuL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 12:50:11 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3681C061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 09:47:43 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id b12so6878879wrh.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MtSx5A+s1uno/sezJRQKPU9Vdfq+oNK7NxdXtZ/qoiY=;
        b=lc689bvrFmGMIZ8EgNGlZ3KrzUngrRY7OSVciTATvimB2ubXARabcIjx62iVbVhIgx
         5SXnhXAv3cTuzWdOgm4ayeXqPP8ohFOyzock6g6HkaPdrv87ius3eJrhg/POo++Cat5W
         SJ4TZ5K5S+GKQeCvHEHOrjonQWiNn57V7/wkZ9wtcTS7u19Iaxputm7K754Y9ZuYVg3Q
         IRGdE1F8SssbmNvbfUOYybkmJzkEy09FaV6v8MNBCKIrmKFH4SpfEUMGnp2hIfcRDLNU
         mEjJBnB9W/XcT/vUD6yn2wl+h8t1DIUUwxCsMJQdw3uATmBP9N0Qh0Zqsj6P1aJrZ/I7
         XCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MtSx5A+s1uno/sezJRQKPU9Vdfq+oNK7NxdXtZ/qoiY=;
        b=HnYaG1uO1LZWvcBAJO3dgWBGGUJU5+8WJkswWl27HaNNPfisgDpp+eobn78IDTIJht
         4rtsxKAswp4aW1ZuHNAt9Dxm07cOkt4fLkSzjCZIDvPi6T8QmFj7nnzzST5brbSMuedc
         BsZRzTy69+ptu7UphBO90e0qcBYn95MpQ9eF7mERl/YZFomomStfSfYzjoveaD8xGua/
         G6AX6HzUxLyh+cLVc1OzmaaodN7h5pyuth0uBW+TNoVmIsW4/b8djUpIO96qxv2G4K97
         JRwWXxq+Q4NqRJqkZ6k2P4batQPW4ebUQ1QvjFMnxcB5Hhy7mqV/wFuvcVzKNXOXw7z9
         y6Rw==
X-Gm-Message-State: AOAM531+QrEyxH1WLxhB3MHNrZLPkIL6eL437tUVsOEq6Ysazp5Fq6kB
        1OTNvirFrvP6p8ZDTRLDjBjXfg==
X-Google-Smtp-Source: ABdhPJx/A0myJ23cNQ2f+AqwP+juVov54sXiq6msHtv7bYef+09T4PmdUIiMxq+IvjOvN5FU8345JA==
X-Received: by 2002:a05:6000:1684:: with SMTP id y4mr7097993wrd.252.1635439662301;
        Thu, 28 Oct 2021 09:47:42 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y8sm3601724wrq.77.2021.10.28.09.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:47:41 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 0/7] Add pm8150b TPCM driver
Date:   Thu, 28 Oct 2021 17:49:34 +0100
Message-Id: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

