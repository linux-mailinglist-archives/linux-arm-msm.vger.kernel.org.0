Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C95405C35
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 19:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241491AbhIIRmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 13:42:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54290 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237224AbhIIRmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 13:42:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631209264; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=prNdcE1SYxw4b+K28K8kg3uoPgG24TCJQIzzLAc82Yg=; b=lxi3SS2arNK7Bp7YJRe0yhgONuJ5m8DYMDDthOF6sU4Hvbhj9ygjaaQhCpmHoQeeIPVjPB9b
 2ppJgh6MRvx99gAFGp6wvnZ+57v4AaZGQUDE/o+2Pj84f86csK+xFVXEMWSiMy3i48h8R5PR
 gQNvHTs2CCqCIxXtoyJ79u76/ts=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 613a472c843a8a103220248a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 17:41:00
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3BC57C4361A; Thu,  9 Sep 2021 17:41:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4BD51C4338F;
        Thu,  9 Sep 2021 17:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4BD51C4338F
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
Subject: [PATCH v6 0/4] Add DT bindings and DT nodes for PCIe and PHY in SC7280
Date:   Thu,  9 Sep 2021 23:10:41 +0530
Message-Id: <1631209245-31256-1-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  39 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 121 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |  18 +++
 4 files changed, 195 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

