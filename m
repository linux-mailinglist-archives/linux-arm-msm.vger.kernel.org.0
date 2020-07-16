Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47FA8222BC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 21:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgGPTSH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 15:18:07 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:60229 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729399AbgGPTSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 15:18:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594927086; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=821OGAVDUhSCY8vDD5l+pZi3vMo7wwG14w+yqfyRJrY=; b=lgRyosIrBQSk/W4DZbAOwzfuVUv49YP6dvibAatYK9z32tNFVP+sK6FLJsdkiy4YjVhPoOUu
 E8T5AeobcqzNzk6Lqqd11FOBTkPBueoOyw+EywtoFx6qr6dlkGyWMT4KZ+5exnlnVObR2wh4
 uGVNJpAvWWyKJqSgw22K7T/CCZ0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f10a7ee03c8596cdb317d3d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 19:18:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 55ED4C43395; Thu, 16 Jul 2020 19:18:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 044DFC433C9;
        Thu, 16 Jul 2020 19:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 044DFC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, dianders@chromium.org,
        pillair@codeaurora.org, robh+dt@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Move the fixed-perm property to SoC dtsi
Date:   Fri, 17 Jul 2020 00:47:46 +0530
Message-Id: <20200716191746.23196-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All the platforms using SC7180 SoC are expected to have the wlan firmware
memory statically mapped by the Trusted Firmware. Hence move back the
qcom,msa-fixed-perm property to the SoC dtsi.

Fixes: 7d484566087c0 ("arm64: dts: qcom: sc7180: Add missing properties for Wifi node")
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 1 -
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 860fc4658b8b1..26cc4913d3ddc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -392,7 +392,6 @@ video-firmware {
 
 &wifi {
 	status = "okay";
-	qcom,msa-fixed-perm;
 	vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
 	vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 126e2fce26c1a..a91d3f074625e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3233,6 +3233,7 @@ wifi: wifi@18800000 {
 				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10 */>,
 				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11 */>;
 			memory-region = <&wlan_mem>;
+			qcom,msa-fixed-perm;
 			status = "disabled";
 		};
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

