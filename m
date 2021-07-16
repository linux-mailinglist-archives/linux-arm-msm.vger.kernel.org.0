Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1883CB83B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 15:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240103AbhGPOCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 10:02:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:60054 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232808AbhGPOCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 10:02:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626443954; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4OELohummFgsgQ1RQE8GgRV7LW3V8m2pafVToNQMbiY=; b=mxsDaHrJnwAi+v8FgdBI6Ik/1ORtgkWEb2HaDkz3ppXF0rYNgMFy1dhwep3Z02wWiBkk+vIJ
 aSYWie/Evhgxn8Byve+TiS2g/SKFnx7zkTzKUqJ6GGozZvakcwWCXHMwV2xhrXDnGeUuPfae
 olh2pYFE8kSuPsi2OAsU1dCizVA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60f190a617c2b4047dcb6eba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Jul 2021 13:59:02
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A09E2C4338A; Fri, 16 Jul 2021 13:59:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D6E9C433F1;
        Fri, 16 Jul 2021 13:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D6E9C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pmaliset@codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v4 0/4] Add DT bindings and DT nodes for PCIe and PHY in SC7280
Date:   Fri, 16 Jul 2021 19:28:43 +0530
Message-Id: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
  dt-bindings: pci: qcom: Document PCIe bindings for SC720
  arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
  arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
  PCIe: qcom: Add support to control pipe clk src

 .../devicetree/bindings/pci/qcom,pcie.txt          |  17 +++
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  38 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 125 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |  22 ++++
 4 files changed, 202 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

