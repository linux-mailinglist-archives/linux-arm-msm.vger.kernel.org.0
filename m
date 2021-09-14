Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4488440B6AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 20:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhINSVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 14:21:10 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:18870 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhINSVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 14:21:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631643592; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KNXk79FmEaSJ3K112by7LM009WaCltlpq4EGuwD2+Xg=; b=brCMVJIoHIDy/oi6/K4vT8nawIa3PwO8OLab47rhRQOjechVGoI3o+8PVPxo7MvzuUnqiIpK
 EHT/g9n+NPJcfoA5TRjZlggOOtTSDF+fwNyROVmoMSMozHz4IkpboiOn5mDu/hl+snEbatiE
 KovZUmfFHiiPxU0WrWRNfQ7FWH8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6140e7b5ec62f57c9a0eb527 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Sep 2021 18:19:33
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B6A06C4361A; Tue, 14 Sep 2021 18:19:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E4461C43460;
        Tue, 14 Sep 2021 18:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E4461C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v7 0/4] Add DT bindings and DT nodes for PCIe and PHY in SC7280 
Date:   Tue, 14 Sep 2021 23:49:06 +0530
Message-Id: <1631643550-29960-1-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes added in v7:

    * Removed two fallbacks qcom,pcie-sm8250 and snps,dw-pcie.
    * Replaced compatible method in get_resources_2_7_0 with
      flag approach suggested by Bjorn Helgaas .
    * Setting gcc_pcie_1_clk_src as XO in init_2_7_0 for
      gdsc enable.
    * Added specific NVMe GPIO entries for SKU1 and SKU2 support
      in idp.dts and idp2.dts respectively.
    * Moved pcie_1 and pcie_1_phy board specific entries into common
      board file sc7280-idp.dtsi file.

Changes in v6:

    * Removed platform check while setting gcc_pcie_1_pipe_clk_src
      as clk_set_parent will return 0 with nop if platform doesn't
      need to switch pipe clk source.
    * Moved wake-n gpio to board specific file sc7280-idp.dtsi
    * Sorted gpio.h header entry in sc7280.dtsi file

Changes in v5:
    
    * Re ordered PCIe, PHY nodes in Soc and board specific dtsi files.
    * Removed ref_clk entry in current patch [PATCH v4 P4/4].
    * I will add ref clk entry in suspend/ resume commits.
    * Added boolean flag in Soc specific dtsi file to differentiate
      SM8250 and SC7280 platforms. based on boolean flag, platforms will handle
      the pipe clk handling.

Changes in v4 as suggested by Bjorn:

    * Changed pipe clk mux name as gcc_pcie_1_pipe_clk_src.
    * Changed pipe_ext_src as phy_pipe_clk.
    * Updated commit message for [PATCH v4 4/4].

Changes in v3:
    * Changed pipe clock names in dt bindings as pipe_mux and phy_pipe.
    * Moved reset and NVMe GPIO pin configs into board specific file.
    * Updated pipe clk mux commit message.

Changes in v2:
    * Moved pcie pin control settings into IDP file.
    * Replaced pipe_clk_src with pipe_clk_mux in pcie driver
    * Included pipe clk mux setting change set in this series

Prasad Malisetty (4):
  dt-bindings: pci: qcom: Document PCIe bindings for SC7280
  arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
  arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
  PCI: qcom: Switch pcie_1_pipe_clk_src after PHY init in SC7280

 .../devicetree/bindings/pci/qcom,pcie.txt          |  17 +++
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   9 ++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  33 ++++++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |   9 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 120 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |  89 +++++++++++++--
 6 files changed, 266 insertions(+), 11 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

