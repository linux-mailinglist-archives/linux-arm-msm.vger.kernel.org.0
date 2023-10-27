Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10CC7D9B17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 16:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346165AbjJ0OUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 10:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346140AbjJ0OUn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 10:20:43 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7E5D4D
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 07:20:35 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9c3aec5f326so685207666b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1698416433; x=1699021233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvBWoApEQzNJmT0WsCerSguC4HxFjJesB2HE5zPn1Xg=;
        b=Dm6rL11oZgIsq6e66PJBxsIOdGIK/AXVpqZkxAtXZze/h6nHcoBmE1nLtX3bgcjySn
         3TQqNYwR6/YhAMkWm1fHgdp+iIRRBA5jcIRBqS+vq/RNhDIP2JGxihkK9TGFvjoIYNUw
         o1kglfljt2rR1xDJpFL3qmtG1nlEEvrIF4oSg+Z+MdfWii+0MBEVwjpz0paNfwFafp27
         z0cR4vXdomq3K4irIH141uHjIx5axfIO9Q5YqFEv9q7FO5GlGhWabneh+18FMPHWbIvI
         aIQwHTxithku7upt8gf+nWVJHDuTvCKwxfXlo66p0QtxRZlEs5ycUg6MX/Vc7LcFW8uO
         6SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698416434; x=1699021234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvBWoApEQzNJmT0WsCerSguC4HxFjJesB2HE5zPn1Xg=;
        b=ShksOFZ0z+scfhiRfquYba0raHSfHfL9tyGkwHw84bVa6upj4DtyJFIRf6tl0XCZ0k
         KdVvCbBA/p2bi7Wovoxhw6ZZ2YWxM6cOaGXE+dk1v8KGJjGDWTT00PKvlOcK+/6Q15op
         x41mMHvKR9RhgEhd8IRlSRO8WVwNsGdQDU5Ofn0Us3EWYGSYze3SkvLteOQrA3WPCiEI
         pzh2ny83gVa12kDC5qyZL04gBwMgN8E7OQtHKKr772aZuqlSp+uuAE/CYkmOvTd70qQs
         s7vn9psi6ekX5a/rxq4UlSf+nE9Rla2K1iai9ASP7inC8Vojgl3fb2cUlDNKyAYeiSQh
         9Anw==
X-Gm-Message-State: AOJu0Yzc1Io3GAb9xdVy5EyscaPK2SGn3TQwCJ+jTm+LXzOhUjRIanlK
        rv+LQuEGABhPVKnjoMeYcSVUCw==
X-Google-Smtp-Source: AGHT+IEhloj5oWSExt+QUqfNz3AnM72oA3FY49T71d2fGgkRPzfdtt4XnFPyylBwbLRJuE4AcCCznw==
X-Received: by 2002:a17:907:8687:b0:9ad:e3fd:d46c with SMTP id qa7-20020a170907868700b009ade3fdd46cmr6206576ejc.10.1698416433790;
        Fri, 27 Oct 2023 07:20:33 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906075700b0099cc36c4681sm1254076ejb.157.2023.10.27.07.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 07:20:33 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 27 Oct 2023 16:20:27 +0200
Subject: [PATCH 5/9] arm64: dts: qcom: sc7280: Use WPSS PAS instead of PIL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231027-sc7280-remoteprocs-v1-5-05ce95d9315a@fairphone.com>
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
In-Reply-To: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The wpss-pil driver wants to manage too many resources that cannot be
touched with standard Qualcomm firmware.

Use the compatible from the PAS driver and move the ChromeOS-specific
bits to sc7280-chrome-common.dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 15 +++------------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index cd491e46666d..eb55616e0892 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -95,8 +95,25 @@ spi_flash: flash@0 {
 };
 
 &remoteproc_wpss {
-	status = "okay";
+	compatible = "qcom,sc7280-wpss-pil";
+	clocks = <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
+		 <&gcc GCC_WPSS_AHB_CLK>,
+		 <&gcc GCC_WPSS_RSCP_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "ahb_bdg",
+		      "ahb",
+		      "rscp",
+		      "xo";
+
+	resets = <&aoss_reset AOSS_CC_WCSS_RESTART>,
+		 <&pdc_reset PDC_WPSS_SYNC_RESET>;
+	reset-names = "restart", "pdc_sync";
+
+	qcom,halt-regs = <&tcsr_1 0x17000>;
+
 	firmware-name = "ath11k/WCN6750/hw1.0/wpss.mdt";
+
+	status = "okay";
 };
 
 &scm {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0d9cc44066ce..23bb6c41fca3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3579,7 +3579,7 @@ qspi: spi@88dc000 {
 		};
 
 		remoteproc_wpss: remoteproc@8a00000 {
-			compatible = "qcom,sc7280-wpss-pil";
+			compatible = "qcom,sc7280-wpss-pas";
 			reg = <0 0x08a00000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
@@ -3591,12 +3591,8 @@ remoteproc_wpss: remoteproc@8a00000 {
 			interrupt-names = "wdog", "fatal", "ready", "handover",
 					  "stop-ack", "shutdown-ack";
 
-			clocks = <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
-				 <&gcc GCC_WPSS_AHB_CLK>,
-				 <&gcc GCC_WPSS_RSCP_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "ahb_bdg", "ahb",
-				      "rscp", "xo";
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
 
 			power-domains = <&rpmhpd SC7280_CX>,
 					<&rpmhpd SC7280_MX>;
@@ -3609,11 +3605,6 @@ remoteproc_wpss: remoteproc@8a00000 {
 			qcom,smem-states = <&wpss_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
-			resets = <&aoss_reset AOSS_CC_WCSS_RESTART>,
-				 <&pdc_reset PDC_WPSS_SYNC_RESET>;
-			reset-names = "restart", "pdc_sync";
-
-			qcom,halt-regs = <&tcsr_1 0x17000>;
 
 			status = "disabled";
 

-- 
2.42.0

