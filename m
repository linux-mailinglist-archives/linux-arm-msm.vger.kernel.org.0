Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99045B3358
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiIIJOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbiIIJOk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:14:40 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D20DB49C
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:14:36 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i26so1614138lfp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=+0z4HKJD1eS//CKtJWyPBgSJ1scmlJeAL3y8G7IiU2g=;
        b=hKq7saiNkBLJb5v7dRXRX7Bh3jdG8DwHCgkwtmtriCm4YWaQ0r8gmSLlc9sN9Gfz8t
         pb0WpWhtbg1XwoZ2S2tEBLhIfzrHb9N0abMy+XdD3iRkBgzmwDxKOFVZJ/bYw4qfksAM
         vsBjYu9yt6cJigo/a41j/4s3TRzw8zB3f+3cD248BN+AHV8zck4FvH6J+HCUnF2KHADZ
         0Fu0T2LdX1nxBpOSZlVlTgDmmDRnQdOy5+vLLVhplUSK5Gnz3VVbIAr46ofnZHMbPBX0
         Oa75BkfgnW+KwT04qPpMqKXfy++qO/hBF6pqcr4kfscr/S+tNjguugU8qYgRDlN6NgO0
         nkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=+0z4HKJD1eS//CKtJWyPBgSJ1scmlJeAL3y8G7IiU2g=;
        b=Vyn4BZqMh37VEjQLvfXdVyIgFpmLEhWAXdD693xyFZ+9vPXb05sFHU1GpPgetLtjKm
         qkABaTmY4+gET57BdMiOsrI12R+22SeHxjq7+KMPhSTVurHYffK84LjDOLFSl1jz6Z4w
         hsGnLAM5xSm70Fi5J4xcSWGT+4qIPnKumerE0iuE7ow0+uJg1PlIZWbnwGXF8iVR2fEb
         gGYurlWrRFY04CowYjbJFlzDN2URVPeTMtrQkp3b8fo/4JHim6WSdFj1T7sQqNwkYdls
         RvauqttA7pIFDEz1BGJvttjJbI8lGXmUi6tZOpn1Z3D0eQizpHUMYo+qpMymxnsnyHFr
         5wTA==
X-Gm-Message-State: ACgBeo2L8QkdpHSETEc6LgrP9nXUnQpdO2kI8EEs81ez1ahabD1PSzwd
        xynLk9Ghf4RB5O6I44zbJyilBw==
X-Google-Smtp-Source: AA6agR5s3gvz9R067NMsiWXtYVKGJctpoq2Me9bOJ6xPk3ekGRsEUfodjLVGuqUvJBVUEKdzholYDw==
X-Received: by 2002:a05:6512:3404:b0:48c:e32d:c9a0 with SMTP id i4-20020a056512340400b0048ce32dc9a0mr4303852lfr.212.1662714874512;
        Fri, 09 Sep 2022 02:14:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z26-20020a2e4c1a000000b0026acbb6ed1asm201615lja.66.2022.09.09.02.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:14:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 0/9] PCI: qcom: Support using the same PHY for both RC and EP
Date:   Fri,  9 Sep 2022 12:14:24 +0300
Message-Id: <20220909091433.3715981-1-dmitry.baryshkov@linaro.org>
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

Programming of QMP PCIe PHYs slightly differs between RC and EP modes.

Currently both qcom and qcom-ep PCIe controllers setup the PHY in the
default mode, making it impossible to select at runtime whether the PHY
should be running in RC or in EP modes. Usually this is not an issue,
since for most devices only the RC mode is used. Some devices (SDX55)
currently support only the EP mode without supporting the RC mode (at
this moment).

Nevertheless some of the Qualcomm platforms (e.g. the aforementioned
SDX55) would still benefit from being able to switch between RC and EP
depending on the driver being used. While it is possible to use
different compat strings for the PHY depending on the mode, it seems
like an incorrect approach, since the PHY doesn't differ between
usecases. It's the PCIe controller, who should decide how to configure
the PHY.

This patch series implements the ability to select between RC and EP
modes, by allowing the PCIe QMP PHY driver to switch between
programming tables.

Unlike previous iterations, this series brings in the dependecy from
PCI parts onto the first patch. Merging of PHY and PCI parts should be
coordinated by the maintainers (e.g. by putting the first patch into the
immutable branch).

Changes since v2:
- Added PHY_SUBMODE_PCIE_RC/EP defines (Vinod),
- Changed `primary' table name to `main', added extra comments
  describing that `secondary' are the additional tables, not required in
  most of the cases (following the suggestion by Johan to rename
  `primary' table),
- Changed secondary tables into the pointers to stop wasting extra
  memory (Vinod),
- Split several functions for programming the PHY using these tables.

Changes since v1:
- Split the if(table) removal to the separate patch
- Expanded commit messages and comments to provide additional details
- Fixed build error on pcie-qcom.c
- Added support for EP mode on sm8450 to demonstrate the usage of this
  patchset

Changes since RFC:
- Fixed the compilation of PCIe EP driver,
- Changed pri/sec names to primary and secondary,
- Added comments regarding usage of secondary_rc/_ep fields.

Dmitry Baryshkov (9):
  phy: define submodes for PCIe PHYs
  phy: qcom-qmp-pcie: drop if (table) conditions
  phy: qcom-qmp-pcie: split register tables into main and secondary
    parts
  phy: qcom-qmp-pcie: split PHY programming to separate functions
  phy: qcom-qmp-pcie: turn secondary programming table into a pointer
  phy: qcom-qmp-pcie: support separate tables for EP mode
  phy: qcom-qmp-pcie: Support SM8450 PCIe1 PHY in EP mode
  PCI: qcom: Setup PHY to work in RC mode
  PCI: qcom-ep: Setup PHY to work in EP mode

 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   4 +
 drivers/pci/controller/dwc/pcie-qcom.c        |   4 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 312 ++++++++++++------
 .../qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h    |   1 +
 include/linux/phy/phy.h                       |   9 +
 5 files changed, 229 insertions(+), 101 deletions(-)

-- 
2.35.1

