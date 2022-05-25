Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340FA534719
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbiEYX6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiEYX6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:58:46 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C949C9E9C7
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:44 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id h1so133119ljb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M0etsjt3N3Ag/ghkmKC2eVWJ+UlMScMu38fKLV6Dh50=;
        b=hE+V12yDph0Sx/2fqnXMiatAsnD2dZQbMuRzUsjyj7YfP1tDji7fJDS5PLhQ//S9eS
         UMhd5SQsy22nSNl6ATkplBpIxEu3RrCFqrmYx54VUnvXNs1QxPrI+X9Bt1R97yCCeEtB
         9OjeYq7cmnxLVFKz44iz/r1V4nczworDtKURfyGoBAAdtmYiRuXGKDS9kR37vPWHW6ao
         n5pOV98PcTF1M1Om5Psj/bShidAbBKbtZIPnFm95rHj3jqT8llL0Rb60boU0UhWKRC2q
         U89bNTWCzI7s3UxKxXwH6m69I4PwdsQZIsrDAbw6PD+seJoTaej4d4tOFhHZNJblaWMh
         noOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M0etsjt3N3Ag/ghkmKC2eVWJ+UlMScMu38fKLV6Dh50=;
        b=o9KgfaJL+Z6pBRIo/w9BDdb5Prks0yRvRC3f1djxYi4BRO31UtHol452zzfojpMsNk
         oEmzowWhNb7wJPiDtukckHQyc4oiS7lVrOqAtPT4NsuvhE5Sqmthi/KfSVfEl+a8wbxK
         JbjFoZO+/NtgZLE4gHguaFQTmHNC9/nBQSMLcQcUmGXgJga53nxmv98kzMel9+DOhvbi
         TCn0pP5t8a1ffFiY5hKtqXAEl7LXSqh5qRJbUVZ/Tr7oKPD3e+wJY3XQE8a8uWrkTXNr
         cBAtQ6NL+AytuJe1gV+3GvS1BGHakrQ47YbGmkoooNKYXFYdn7vFY88UMLwCJ194I3Si
         4GvQ==
X-Gm-Message-State: AOAM531YDYw1VJtQLPfFxxTP5LoXER2um79K24oOKGzlFwG0qlYQmKKZ
        WsZlOZzyvN+i/qmQhjD6kN2gwA==
X-Google-Smtp-Source: ABdhPJzAl/VQBwjybEtdG3Q+pNXcG6IZKYTAx8FwbB3J8y9hJEXqVKTCtjKPrIA5IZVh1zdFi21YAg==
X-Received: by 2002:a2e:b4b4:0:b0:253:fdf5:1a1d with SMTP id q20-20020a2eb4b4000000b00253fdf51a1dmr5587013ljm.18.1653523123160;
        Wed, 25 May 2022 16:58:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:58:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 00/34] phy: qcom-qmp: split the QMP PHY driver
Date:   Thu, 26 May 2022 02:58:07 +0300
Message-Id: <20220525235841.852301-1-dmitry.baryshkov@linaro.org>
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
QMP PHY driver into four smaller drivers, each targeting a particular
family of PHY backends (DP/combo, PCIe, UFS and USB). Yes, this results
in some code duplication, but I hope that the end result is still better
than the current situation.

If the idea looks good, I will continue polishing the drivers. A
feedback regarding the common functions (ones, left in the
phy-qcom-qmp-lib.c file) would be appreciated.

Changes since RFC:
 - Split the patchset to be able to get through the email size
   limitations
 - Minor correcions to the split drivers

Dmitry Baryshkov (34):
  phy: qcom-qmp: add library source code
  phy: qcom-qmp: add QMP PCIe PHY driver
  phy: qcom-qmp: move MSM8996 PCIe PHY to new QMP driver
  phy: qcom-qmp: move MSM8998 PCIe PHY to new QMP driver
  phy: qcom-qmp: move SDM845 PCIe PHY to new QMP driver
  phy: qcom-qmp: move SM8250 PCIe PHY to new QMP driver
  phy: qcom-qmp: move IPQ6018 PCIe PHY to new QMP driver
  phy: qcom-qmp: move IPQ8074 PCIe PHY to new QMP driver
  phy: qcom-qmp: move SC8180x PCIe PHY to new QMP driver
  phy: qcom-qmp: move SDX55 PCIe PHY to new QMP driver
  phy: qcom-qmp: move SM8450 PCIe PHY to new QMP driver
  phy: qcom-qmp: add QMP UFS PHY driver
  phy: qcom-qmp: move MSM8996 UFS PHY to new QMP driver
  phy: qcom-qmp: move MSM8998, SDM845 and SM6350 UFS PHY to new QMP
    driver
  phy: qcom-qmp: move SC8180x, SM8150 and SM8250 UFS PHY to new QMP
    driver
  phy: qcom-qmp: move SM6116 UFS PHY to new QMP driver
  phy: qcom-qmp: move SC8280xp, SM8350 and SM8450 UFS PHY to new QMP
    driver
  phy: qcom-qmp: add QMP USB PHY driver
  phy: qcom-qmp: move MSM8996 USB PHY to new QMP driver
  phy: qcom-qmp: move IPQ6018, IPQ8074 USB PHY to new QMP driver
  phy: qcom-qmp: move MSM8998 USB PHY to new QMP driver
  phy: qcom-qmp: move SDM845 USB PHY to new QMP driver
  phy: qcom-qmp: move SC7180 USB PHY to new QMP driver
  phy: qcom-qmp: move SC8180x, SM8150 USB PHY to new QMP driver
  phy: qcom-qmp: move SM8250 USB PHY to new QMP driver
  phy: qcom-qmp: move SM8350, SM8450 USB PHY to new QMP driver
  phy: qcom-qmp: move SDX55 USB PHY to new QMP driver
  phy: qcom-qmp: move SDX65 USB PHY to new QMP driver
  phy: qcom-qmp: move QCM2290 USB PHY to new QMP driver
  phy: qcom-qmp: add QMP combo DP+USB PHY driver
  phy: qcom-qmp: move SC7180 DP PHY to new QMP driver
  phy: qcom-qmp: move SC8180X DP PHY to new QMP driver
  phy: qcom-qmp: move SM8250 DP PHY to new QMP driver
  phy: qcom-qmp: drop old QMP PHY driver

 drivers/phy/qualcomm/Makefile             |    8 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 1401 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-lib.c   |  417 ++
 drivers/phy/qualcomm/phy-qcom-qmp-lib.h   |  311 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  | 2098 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c   |  983 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 2229 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c       | 6350 ---------------------
 drivers/phy/qualcomm/phy-qcom-qmp.h       |    3 +
 9 files changed, 7449 insertions(+), 6351 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-combo.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-lib.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-lib.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp.c

-- 
2.35.1

