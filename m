Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C502353FD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Aug 2020 20:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgHASOU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Aug 2020 14:14:20 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26982 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726477AbgHASOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Aug 2020 14:14:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596305660; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4G27Zl1+E0JAY/pLZNnLlP6h3k5h3oQBdUrO9rd3Gi4=; b=ms13z3AY/dKfe3ip6kQ0loMusf0bjfiWPPS6c9He/4ftqNDDAWJ9Ns/Ivj3v5qwgD9Mtitdm
 dzGMeGKlUuXdkj6c4flyK68AnSjuCTy148IU+mS5MJvsbER0cos9MIXP1D2OUymQq/qBY6U/
 tYSOlj/s1HuMmq0hOHGxfvMuk3Q=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-east-1.postgun.com with SMTP id
 5f25b0e59403087e10de4306 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 01 Aug 2020 18:13:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2F6EC433CA; Sat,  1 Aug 2020 18:13:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3303BC433C6;
        Sat,  1 Aug 2020 18:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3303BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7180: Add LPASS clock controller nodes
Date:   Sat,  1 Aug 2020 23:43:35 +0530
Message-Id: <1596305615-5894-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596305615-5894-1-git-send-email-tdas@codeaurora.org>
References: <1596305615-5894-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the clock controller nodes for Low power audio subsystem
functionality.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b383..7cf8bfe 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
 #include <dt-bindings/clock/qcom,gcc-sc7180.h>
 #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
+#include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sc7180.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -3312,6 +3313,30 @@
 			qcom,msa-fixed-perm;
 			status = "disabled";
 		};
+
+		lpasscc: clock-controller@62d00000 {
+			compatible = "qcom,sc7180-lpasscorecc";
+			reg = <0 0x62d00000 0 0x50000>,
+			    <0 0x62780000 0 0x30000>;
+			reg-names = "lpass_core_cc", "lpass_audio_cc";
+			clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "bi_tcxo";
+			power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		lpass_hm: clock-controller@63000000 {
+			compatible = "qcom,sc7180-lpasshm";
+			reg = <0 0x63000000 0 0x28>;
+			clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "bi_tcxo";
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 	};

 	thermal-zones {
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

