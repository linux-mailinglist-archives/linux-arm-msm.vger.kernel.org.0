Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862A753B40D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbiFBHJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbiFBHJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:16 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0587D55BF
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:13 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id y29so4300655ljd.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u+c3gcANzBU0S2++2DLVJJA31QArxjO8Cm7S9YoKYHk=;
        b=cLHJxha2/msURnLFsR3yWxkTiLxcJgVahhpKWYXAiMgleq6+z5jhULbC+7LGk4IzwC
         HLap4UV4PtNYji/abbVzPvtKAmQN0IittOW+jv2cXr/j4omS0A3GvIbIhR8kbFdCt/pB
         rJDiJk8UaD6vtV49f61tys7NKw1uh4leQ9J2Nj/onkUudqggb1YHCq39zCs+nbQ3QzCy
         C1O7b9J5WNvLJc7e4IR2s+aE01UrWmyVs3TNELRKkfDS0Uw/ksxWnvQCNDGAJOpEa3Op
         yMh1Q5EjTm8rRRubNr/z26WawjNK55NFXcWtJlNbdQEcE952Xps7vcJY3ruWpY20K632
         GPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u+c3gcANzBU0S2++2DLVJJA31QArxjO8Cm7S9YoKYHk=;
        b=TSy7sGHh7gzhPJ0ydICcI29VbzGeF8n9CN7KZWcr5DkaZaj6EvzZ0w2Z7l17vOtF8d
         k71l4woFDTpycqpfJR67In1LdivzfAqECe3LQiyWYFf+fAe60Gzbn04/kBSR9/PrMO0E
         8nBXjpXw85bGZn3bE97REuU6iPpwXvl67DzYhgpOtXRpXZwq1Frt2EVVAjAcvsvB/oJg
         wh0YyMAnWIUiTkJt6hYVhExAKcLS9OCOmMOTjA+0uivbi3gbQxcQJARrBVAZZIO99q0Q
         tLBrRV4pqSSG+SzBvSkzE0WPqzqQ2uqsM8q3NUB+8eJC3ps9RyGvBzQJC/7pPBKboTs4
         MhIA==
X-Gm-Message-State: AOAM530URCyO3maRoHA2nkwpcuNp1C9JxtC+TgULnQt9d/EL1TWAhYFh
        Cu7fZuiIztqou6id3k3Af2IMQQ==
X-Google-Smtp-Source: ABdhPJztGpktqqV0PJNWGuzm+9HcLnoyM7abtl++WoUKtgG+1VTbZ0L+t7g074qv7ZKS7ERo15e+7g==
X-Received: by 2002:a2e:8e73:0:b0:255:71f4:7db6 with SMTP id t19-20020a2e8e73000000b0025571f47db6mr2011844ljk.315.1654153750987;
        Thu, 02 Jun 2022 00:09:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 00/30] phy: qcom-qmp: split the QMP PHY driver
Date:   Thu,  2 Jun 2022 10:08:39 +0300
Message-Id: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
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
  phy: qcom-qmp-combo: drop all non-combo compatibles support
  phy: qcom-qmp-pcie: drop all non-PCIe compatibles support
  phy: qcom-qmp-pcie-msm8996: drop all compatibles except
    msm8996-pcie-phy
  phy: qcom-qmp-ufs: drop all non-UFS compatibles support
  phy: qcom-qmp-usb: drop all non-USB compatibles support
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

