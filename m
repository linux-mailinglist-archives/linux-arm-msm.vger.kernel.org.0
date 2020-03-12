Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7880183676
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 17:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgCLQom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 12:44:42 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:33091 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgCLQoi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 12:44:38 -0400
Received: by mail-qt1-f194.google.com with SMTP id d22so4923475qtn.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2020 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M8I0tibm0x9o216WA6J8pQVPILtFuntNhRaRSj7eG4A=;
        b=Ps6uYL78L8tiiefDveevpxYZYKo1t9+cCCagwNnkPLBaPSV2pPdfXTIXk604ph2xpw
         faAVSCi08gDu/GHSdCihjkCKqIZSC2IleEQoObaiVDFlTPmjYm52pvdzdaISQ9hf//Pv
         FodTrRUDCzthOuurF7NFtvTYK4oPZVJw9M/IozV4SMQzttu16TI5wTezqHL46bbcltwQ
         /kSxZi3YBmPrNogjVuKfjbEAmaL6NE7CmpTD/CO+q3VYSldYo70H8zjtDyhMYExHBeHf
         iV3HE8sYXetkWPcjjwtfAJNRiW034zFfHwuVUuIIQo35aeFKxDYrLLidYWAh9MJ0tHKD
         WFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M8I0tibm0x9o216WA6J8pQVPILtFuntNhRaRSj7eG4A=;
        b=m1yOg6pK6uX0RdikLXaQq5X9B8GKvTkDq+e814CG/xMkWlYEp/ObQI5cVGL+2RnVB6
         vNiBNZoustTYHn1QBehUjl6B+aEcda+gDMsv6JeLdkDUJ+ZWWWmeKsH4jV9cot9G2rTb
         kXvmBM2blSZVI5BK0pMPC0htT95Yk4+BftJzyirMSaZh9WYQ6mLJGKz9NTPccvragl0B
         CwZ7j9gY2AuD30F6IkDaisBbiCbWSLMLKFt8KeXY4j1Z0U/eKXXOkKQuiMlUmdR962X3
         z+BDPmFopgjaBlOnL0oZI+Lm3vF9SPX0iPjCrTfGgD/HxP/g8GLFEO4nFIOgMI2dcrgZ
         KnPA==
X-Gm-Message-State: ANhLgQ1jB0Ua3tb43jSfKbrEziTWmwoY+QNY0CD6pMZ4eAATAThGddLQ
        TXlP19RI8SsHSWNW8k4NNIETAA==
X-Google-Smtp-Source: ADFU+vtn1v3TaOzby5HYYtlyHy9Ftixfhi2XKzOU4sP3mHDxuJyhG7MDqq56wClzWXEfwdgTOCMy0w==
X-Received: by 2002:ac8:1e90:: with SMTP id c16mr8251707qtm.265.1584031477341;
        Thu, 12 Mar 2020 09:44:37 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id j4sm7244743qtn.78.2020.03.12.09.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 09:44:36 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     David Miller <davem@davemloft.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] Revert "arm64: dts: sdm845: add IPA information"
Date:   Thu, 12 Mar 2020 11:44:28 -0500
Message-Id: <20200312164428.18132-3-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312164428.18132-1-elder@linaro.org>
References: <20200312164428.18132-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 9cc5ae125f0eaee471bc87fb5cbf29385fd9272a.

This commit:
  b303f9f0050b arm64: dts: sdm845: Redefine interconnect provider DT nodes
found in the Qualcomm for-next tree removes/redefines the interconnect
provider node(s) used for IPA.  I'm not sure whether it technically
conflicts with the IPA change to "sdm845.dtsi" in for-next, but it renders
it broken.

Revert this commit in the for-next tree, with the plan to incorporate
it into the Qualcomm tree instead.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 51 ----------------------------
 1 file changed, 51 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 58fd1c611849..d42302b8889b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -675,17 +675,6 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
-
-		ipa_smp2p_out: ipa-ap-to-modem {
-			qcom,entry-name = "ipa";
-			#qcom,smem-state-cells = <1>;
-		};
-
-		ipa_smp2p_in: ipa-modem-to-ap {
-			qcom,entry-name = "ipa";
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
 	};
 
 	smp2p-slpi {
@@ -1446,46 +1435,6 @@
 			};
 		};
 
-		ipa@1e40000 {
-			compatible = "qcom,sdm845-ipa";
-
-			modem-init;
-			modem-remoteproc = <&mss_pil>;
-
-			reg = <0 0x1e40000 0 0x7000>,
-			      <0 0x1e47000 0 0x2000>,
-			      <0 0x1e04000 0 0x2c000>;
-			reg-names = "ipa-reg",
-				    "ipa-shared",
-				    "gsi";
-
-			interrupts-extended =
-					<&intc 0 311 IRQ_TYPE_EDGE_RISING>,
-					<&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,
-					<&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-					<&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "ipa",
-					  "gsi",
-					  "ipa-clock-query",
-					  "ipa-setup-ready";
-
-			clocks = <&rpmhcc RPMH_IPA_CLK>;
-			clock-names = "core";
-
-			interconnects =
-				<&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_EBI1>,
-				<&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_IMEM>,
-				<&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_IPA_CFG>;
-			interconnect-names = "memory",
-					     "imem",
-					     "config";
-
-			qcom,smem-states = <&ipa_smp2p_out 0>,
-					   <&ipa_smp2p_out 1>;
-			qcom,smem-state-names = "ipa-clock-enabled-valid",
-						"ipa-clock-enabled";
-		};
-
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
 			reg = <0 0x01f40000 0 0x40000>;
-- 
2.20.1

