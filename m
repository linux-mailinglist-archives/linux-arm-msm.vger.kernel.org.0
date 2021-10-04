Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848214209E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 13:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbhJDLTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 07:19:18 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:14342 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232974AbhJDLTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 07:19:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633346243; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=mOlEBkWF4Oi0fv7TFeXw5Xz+6AEFIrhhPORZVKcRjgg=; b=D8pI+FUY+4Uwlq5Y4tafACjClehZV8r3vI8KMWC35Ix6apfcvj2oPr56hmvLNsirIpaQL72w
 K5EycN4CNwcUVJChIV/aYvLT7Xmf/Gbf4FiqPN86bD0myv4X5oDrhDnCHeplfZKDFqqTHzPE
 Y4r0EQ8Gjps95B0LeZmT4snwy+U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615ae2b7fc6e34f8cdbfb658 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 11:17:11
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A3DFC4361A; Mon,  4 Oct 2021 11:17:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54945C43616;
        Mon,  4 Oct 2021 11:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 54945C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <greg@kroah.com>
Cc:     linux-kernel@vger.kernel.org, ckadabi@codeaurora.org,
        tsoni@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V0 5/7] arm64: dts: qcom: sc7280: Add EUD connector node
Date:   Mon,  4 Oct 2021 16:46:23 +0530
Message-Id: <172cb86e7a05d967ebf061033d47e4c5e95af503.1633343547.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1633343547.git.schowdhu@codeaurora.org>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1633343547.git.schowdhu@codeaurora.org>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the Embedded USB Debugger(EUD) connector node
as the child of dwc3 node under usb2. The node contains
EUD base register region and EUD mode manager register
regions along with the interrupt entry.

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 53a21d0..21b16da 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -1308,6 +1308,9 @@
 			usb_2_dwc3: usb@8c00000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x08c00000 0 0xe000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
 				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0xa0 0x0>;
 				snps,dis_u2_susphy_quirk;
@@ -1315,6 +1318,15 @@
 				phys = <&usb_2_hsphy>;
 				phy-names = "usb2-phy";
 				maximum-speed = "high-speed";
+				usb-role-switch;
+				usb_con: eud_usb_connector {
+					compatible = "qcom,usb-connector-eud", "usb-c-connector",
+						     "qcom,sc7280-usb-connector-eud";
+					reg = <0 0x88e0000 0 0x2000>,
+					      <0 0x88e2000 0 0x1000>;
+					interrupt-parent = <&pdc>;
+					interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
+				};
 			};
 		};
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

