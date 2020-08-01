Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4ED523525D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Aug 2020 14:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbgHAMbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Aug 2020 08:31:49 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:59426 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729134AbgHAMbs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Aug 2020 08:31:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596285108; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Baqm8dth5qwp6+8TbHMunp+3b66zCxUrZAIoJWJc8dU=; b=KLkOCfXzM2SMzWdOdZurjVeUsWEcv8ghUl22xMy5a0oItaQQAm41UTyZLvyLk9vAYvqrHmHX
 bauoaR02SdeQKs9E6ciy9tcPqzQOBZIqlCHZFSbhApkk2fRgqEouUBUYsddnHQyiUHiDjpbq
 0GqErO2iqd61WofWx41+t16Gybg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f25609f9403087e104bcf44 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 01 Aug 2020 12:31:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 70A59C433B7; Sat,  1 Aug 2020 12:31:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 243E8C433A1;
        Sat,  1 Aug 2020 12:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 243E8C433A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jonathan@marek.ca,
        linux-pm@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 7/7] arm64: dts: qcom: sm8250: Add EPSS L3 interconnect provider
Date:   Sat,  1 Aug 2020 18:00:49 +0530
Message-Id: <20200801123049.32398-8-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801123049.32398-1-sibis@codeaurora.org>
References: <20200801123049.32398-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Epoch Subsystem (EPSS) L3 interconnect provider node on SM8250
SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 73f02f712d035..2bcdb7a3b9fef 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
@@ -2150,6 +2151,16 @@ apps_bcm_voter: bcm_voter {
 				compatible = "qcom,bcm-voter";
 			};
 		};
+
+		epss_l3: interconnect@18591000 {
+			compatible = "qcom,sm8250-epss-l3";
+			reg = <0 0x18590000 0 0x1000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#interconnect-cells = <1>;
+		};
 	};
 
 	timer {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

