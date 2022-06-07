Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0A0542668
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiFHDgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 23:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234031AbiFHDfN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 23:35:13 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0A222AE45
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:06 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id be31so30299837lfb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/EMuaw8f99+zuol+Pslz84IOxSbC2zWg9rufPj8Gszw=;
        b=HhaK9gsTeW9KFD71hYHS15gkzPqIUFfsrm77V2YsjJ4EX5XtQ9PcOfgG9z6s/sKwjL
         YfwLx/gunsxgvDCX/rmu8ZsqTCqcN5LbI6kMRCROMMC3tY96SCYAj/C8CIpwITer/XBh
         Z2TULXInPZjAw18EY1ODVpX5RYyPFE4l1OJMprNJHufrQAgbhcx0E+mFNVBNZCd0/LKN
         SqbMraU+pIl2iIQNLV3h+xwcaNruLx71gcGJqgtCUOEF1RS5GkqZLO1mrHHU6GtG4Cds
         ZjjT8kJDaSGvSBI2n7nAius9cC0FoVyq0cyuU2IseEfR2nwhGDr0ZkrW5hWxotu2wGwu
         q1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/EMuaw8f99+zuol+Pslz84IOxSbC2zWg9rufPj8Gszw=;
        b=vkuxGXn6ZaqlSnbz7wf8cj0C1JDqPzuQtG943gVTQMKh0RvaMSx7jzET8uiS1WMHma
         SLd6UFqEeZ/itKLuwGdkImpduuQKpeKQGtHN8zuM1FMd7OwNjL6s9fF0e8v4kWH+bEzx
         ZcHkF6SdrlCFhOn+9CDqQg5WeQ/+uopBBqIjxlFN30DXdHYAvwxx1gnsLaJ+bZHaXGG7
         4zPOa88R1bYMxTJE/tBW6vrQwXQqZ4FoIsgeET5+s1bxTv8fHik/8+316paAXfturTxC
         +PyG6C0DyRv99kWo5svPXBybrxemcA/UgeQpmZi22LczmJtMdN8CddgW4QpKY3CS6r+p
         pavQ==
X-Gm-Message-State: AOAM530RTrVwi587YaGC9Je5FO2cZ/FVCVNZst3ShKQejg8st0/UGKjg
        svpSgW2rma1Yqt6jKnqeMD3yvQ==
X-Google-Smtp-Source: ABdhPJzkxnRuzcWsJIuLV5bpokvPPwTzUNr3THlMbyScHKNy/89s5chKhJJChIzmjkG8nggxyoSISw==
X-Received: by 2002:a19:e307:0:b0:479:47a5:3c4f with SMTP id a7-20020a19e307000000b0047947a53c4fmr8399800lfh.593.1654637525001;
        Tue, 07 Jun 2022 14:32:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 00/30] phy: qcom-qmp: split the QMP PHY driver
Date:   Wed,  8 Jun 2022 00:31:33 +0300
Message-Id: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

While adding support for the PCIe EP mode support to the QMP driver I
couldn't help but notice that the QMP PHY driver has slowly become the a
beast with tons of conditions and corner cases being inserted here and
there.r

This an RFC for an attempt to to cleanup the QMP driver by splitting the
QMP PHY driver into five smaller drivers, each targeting a particular
family of PHY backends (DP/combo, PCIe, UFS, USB and a separate driver
for the MSM8996 PCIe PHY). Yes, this results in some code duplication,
but I hope that the end result is still better than the current
situation.

Changes since RFC v3:
 - Fix MODULE_DEVICE_TABLE for the combo PHY.

Changes since RFC v2:
 - After dicussion with Vinod, revert back to the approach from RFC v1:
   copy the source and clean it up rather than creating new drivers from
   the blank space. This lowers the risc of breaking any of the platforms.
 - Drop common phy-qcom-qmp-lib.c for now. The goal of this patchseries
   is to be merged early during the development cycle to unblock further
   QMP driver development. Additional cleanups and code unification can
   come up later.

Changes since RFC v1:
 - Split the patchset to be able to get through the email size
   limitations
 - Minor correcions to the split drivers

Dmitry Baryshkov (30):
  phy: qcom-qmp: create copies of QMP PHY driver
  phy: qcom-qmp-pcie: drop all non-PCIe compatibles support
  phy: qcom-qmp-pcie-msm8996: drop all compatibles except
    msm8996-pcie-phy
  phy: qcom-qmp-ufs: drop all non-UFS compatibles support
  phy: qcom-qmp-usb: drop all non-USB compatibles support
  phy: qcom-qmp-combo: drop all non-combo compatibles support
  phy: qcom-qmp-combo: change symbol prefix to qcom_qmp_phy_combo
  phy: qcom-qmp-pcie: change symbol prefix to qcom_qmp_phy_pcie
  phy: qcom-qmp-pcie: change symbol prefix to qcom_qmp_phy_pcie_msm8996
  phy: qcom-qmp-ufs: change symbol prefix to qcom_qmp_phy_ufs
  phy: qcom-qmp-usb: change symbol prefix to qcom_qmp_phy_usb
  phy: qcom-qmp: switch to new split QMP PHY driver
  phy: qcom-qmp: drop old QMP PHY driver source
  phy: qcom-qmp-combo: drop support for PCIe,UFS PHY types
  phy: qcom-qmp-pcie: drop support for non-PCIe PHY types
  phy: qcom-qmp-pcie-msm8996: drop support for non-PCIe PHY types
  phy: qcom-qmp-ufs: drop support for non-UFS PHY types
  phy: qcom-qmp-usb: drop support for non-USB PHY types
  phy: qcom-qmp-combo: cleanup the driver
  phy: qcom-qmp-pcie: cleanup the driver
  phy: qcom-qmp-pcie-msm8996: cleanup the driver
  phy: qcom-qmp-ufs: cleanup the driver
  phy: qcom-qmp-usb: cleanup the driver
  phy: qcom-qmp-pcie: drop multi-PHY support
  phy: qcom-qmp-ufs: drop multi-PHY support
  phy: qcom-qmp-usb: drop multi-PHY support
  phy: qcom-qmp-combo: use bulk reset_control API
  phy: qcom-qmp-pcie: use bulk reset_control API
  phy: qcom-qmp-pcie-msm8996: use bulk reset_control API
  phy: qcom-qmp-usb: use bulk reset_control API

 drivers/phy/qualcomm/Makefile                 |    8 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 2579 +++++++
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 1081 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 2404 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 1390 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 2751 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 6350 -----------------
 7 files changed, 10212 insertions(+), 6351 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-combo.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp.c

-- 
2.35.1

