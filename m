Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C2B3E51BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 06:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbhHJEJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 00:09:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60775 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230267AbhHJEJd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 00:09:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628568552; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=e8JKri0Okbv2vxM0zIH+hKFFTMww7MckSWYA3czW6uE=; b=GzhtSd7zZ1Dbf74G1RXpURPsoPNQTF873KoW9jIru/CkndEujvyL8wOKMKO04jj193vpP5KR
 ZNLKN0Tol1KFzcM0wCHjWTlZzPvp2a7xtf/j/UMKoS5W7xq9wwj2HBh4bgNo1QNAQ4gLcor9
 9FUCZoaWFswzPMLhU5YFjz0RUOg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6111fbdc454b7a558fe7ca67 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 04:09:00
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1AF06C43144; Tue, 10 Aug 2021 04:09:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 64708C433F1;
        Tue, 10 Aug 2021 04:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 64708C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pmaliset@codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v5 0/4] Add DT bindings and DT nodes for PCIe and PHY in SC7280
Date:   Tue, 10 Aug 2021 09:38:32 +0530
Message-Id: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  38 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 126 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |  18 +++
 4 files changed, 199 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

