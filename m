Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 944F75EAECC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 19:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiIZR53 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 13:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiIZR5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 13:57:02 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A748BE3A
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 10:34:38 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id g20so8264021ljg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3eBH9ZtwH+GTFt8HaXwfYSZezFnUoJTA70guBM37OMI=;
        b=cacUG67zWxuwZavxQfNyoL9Ipbh7EvP5+pviX/VL13Ltt/sTfe5AI1YMTNWKfCW4dU
         anDUG572cEsYhdnIqb0bssaJ/tardiiGdYcFgS18G5Bbqz5JCM/66+XnxETZwlTaInNH
         EmwlqF6lzqjtM7NAqYONYSEzGqyEMwY6WQQ/D+TBZ5XsnAdkL0m4U46i4RgD5xR6aho4
         FSj49ykhlbS2CB+tIR/HSL5okxOi3O9hHrq6wKa6Ev/RSrVMznYkXzkbBQy1i2jhD7sY
         FBjRTPD1lBTC8KFOU6EmXCptithx+qkVDtbGMRO/5i3X1W5pTafLu8FEEIY443A+bzUm
         BQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3eBH9ZtwH+GTFt8HaXwfYSZezFnUoJTA70guBM37OMI=;
        b=v14mS4EaVMWbWjd02JGNe4qOCJVZaE0ZWGqlmgdfFqqTzWXYYB0sbUiqKqe6WEtb8z
         y0xowC9zXpaCYMSmrvI2NcivSlLJuHOvUqK1rfJEsFoBbJMS3IWT6zc5euGrxZXVsqZ1
         Vuy7KJ0zoI+FjFWqxjoedKg9CG8hE6mD2XWw7gzweDkhgnEIrxzw8TlF+iEXXqYnpXcQ
         wNLfyIyQ1ubJtxdsU8X+jB2OTSYmpGKuyjAaE6VGoxQGX26zyAyPRPZW1wm3bweiTxAf
         Mu6fZ+nIb+mXZgA494BaLUNRl4o1pJKERh24Y4Lf9ertnMvqcotfXsUU5uFlI/SBbB3Q
         5YHg==
X-Gm-Message-State: ACrzQf2QZYSAp6K1H6aebtQTp4Nv4+0naeeZsXWjDK4bSkzwgZaGye+S
        POjS0YbYVFevhubHFabLllwTRA==
X-Google-Smtp-Source: AMsMyM4pxRcN2ISIho7dHyf0AgOpoOfBmClLxsel4WJpoWCRmMmdttFOPBwD3I9PILHlBaYJSI+vqQ==
X-Received: by 2002:a2e:98ce:0:b0:26b:e763:27d1 with SMTP id s14-20020a2e98ce000000b0026be76327d1mr7600971ljj.306.1664213676642;
        Mon, 26 Sep 2022 10:34:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v8-20020a2ea448000000b0026ad1da0dc3sm2402640ljn.122.2022.09.26.10.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 10:34:36 -0700 (PDT)
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
Subject: [PATCH v5 0/5] PCI: qcom: Support using the same PHY for both RC and EP
Date:   Mon, 26 Sep 2022 20:34:30 +0300
Message-Id: <20220926173435.881688-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

This patchseries depends on the header from the pre-6.1 phy/next. Thus
after the 6.1 the PCIe patches can be applied independently of the PHY
part.

Changes since v4:
- Fixed the possible oops in probe (Johan)
- Renamed the tables struct and individual table fields (Johan)
- Squashed the 'separate funtions' patch to lower the possible
  confusion.

Changes since v3:
- Rebased on top of phy/next to pick in newly defined
  PHY_MODE_PCIE_RC/EP.
- Renamed 'main' to 'common' and 'secondary' to 'extra' to reflect the
  intention of the split (the 'common' tables and the 'extra for the ...
  mode' tables).
- Merged the 'pointer' patch into first and second patches to make them
  more obvious.

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

Dmitry Baryshkov (5):
  phy: qcom-qmp-pcie: split register tables into common and extra parts
  phy: qcom-qmp-pcie: support separate tables for EP mode
  phy: qcom-qmp-pcie: Support SM8450 PCIe1 PHY in EP mode
  PCI: qcom: Setup PHY to work in RC mode
  PCI: qcom-ep: Setup PHY to work in EP mode

 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   5 +
 drivers/pci/controller/dwc/pcie-qcom.c        |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 523 +++++++++++-------
 .../qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h    |   1 +
 4 files changed, 335 insertions(+), 199 deletions(-)

-- 
2.35.1

