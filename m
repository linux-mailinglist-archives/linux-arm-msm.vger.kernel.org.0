Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBCB18869F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 14:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgCQN5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 09:57:55 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34836 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgCQN5z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 09:57:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id m3so22104719wmi.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 06:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gE0E48YTccXbLL7Wbu4iPyqHzH6s/0ICIW3f6yKP+/M=;
        b=x08FyS2T11lS2rzYbZquOz72b/VYEhQW0IYOEhRHdIaWKC7c6IH50zqHBkykkzCS2z
         tlqO3+fvtycThLWxdLJ8ORoW7YLVdBWSNPgFDPxjaDPVoWT1M0z9XLu8AExRZtroGelh
         wjDC4HZRwOkeqdUcoTqMlGdUoVwrCtD0HV6C0AZZ2sPcVmOBtjHrfMqQck/DfqJx/1Qv
         vrsxAn+O2zmYJzq0MB+pwNCheLxJ+6wb/tpV7v0vmU5Kh81Gttp0XBMHuougn+cNcRjT
         mOnkCuzfDhMXhDrBvNh+Clc2n+2RNsZLQgFtryQ5Q+aI6721wxo/NS2w3EqFEqD0+IFJ
         fiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gE0E48YTccXbLL7Wbu4iPyqHzH6s/0ICIW3f6yKP+/M=;
        b=SsCcP+Dfx7A6u5aCSndmGiSRvn4NY+GqNW21aibMnxWZ62nnpAy9kklsxk7uRj3xZI
         cQu1Ih3ewPX/7348NgykObSxn1fz6b7R6ttjVp6to58X6DkK9cmCjRopW0H2YAWQcBXw
         nagBTuU4qOr581G4FkkixSYrmU7Y16aZjWd7bigeU9Cb18NBCrL320tUOo1L4c3ztnXL
         MRVbMFHBt0q/PJVRGksR+Ygn23CHiqWczx9HpU1kSSUQ6hhvrUVHmJnV5+c7Q9K+n7iY
         chx2XRdHUnSNrxm0KFHwS4CTTM/Er3SRzrCk/NpEZLB0s7khJpZH1vS1uXtYgeOWIvRh
         01mw==
X-Gm-Message-State: ANhLgQ01bIF1+RXlc5WnhdquuvraO9KzMfswodx3NrZcdUp9PW9WESiA
        zfu/UG1Bvq8KgMK4CQLE9vJkKQ==
X-Google-Smtp-Source: ADFU+vu0XS8SjB4/Yw6xnU/f/BoTF8gd2wERlztERMFvMKS5J+6ajXkkC526BVd31HEWQoXRWNZptg==
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr5331001wmc.38.1584453471765;
        Tue, 17 Mar 2020 06:57:51 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:84f7:5c25:a9d8:81a1])
        by smtp.gmail.com with ESMTPSA id r3sm2976558wrn.35.2020.03.17.06.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 06:57:51 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, maxime@cerno.tech,
        Anson.Huang@nxp.com, dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 1/6] arm64: dts: msm8916: Add i2c-qcom-cci node
Date:   Tue, 17 Mar 2020 14:57:35 +0100
Message-Id: <20200317135740.19412-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317135740.19412-1-robert.foss@linaro.org>
References: <20200317135740.19412-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

The msm8916 CCI controller provides one CCI/I2C bus.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
 - Add label to cci node
 - Sort cci node by address
 - Relabel cci0 i2c bus to cci-i2c0

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9f31064f2374..1d5cb3fef906 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1584,6 +1584,33 @@
 		};
 	};
 
+	cci: cci@1b0c000 {
+		compatible = "qcom,msm8916-cci";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x1b0c000 0x1000>;
+		interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+			<&gcc GCC_CAMSS_CCI_AHB_CLK>,
+			<&gcc GCC_CAMSS_CCI_CLK>,
+			<&gcc GCC_CAMSS_AHB_CLK>;
+		clock-names = "camss_top_ahb", "cci_ahb",
+				  "cci", "camss_ahb";
+		assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				  <&gcc GCC_CAMSS_CCI_CLK>;
+		assigned-clock-rates = <80000000>, <19200000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cci0_default>;
+		status = "disabled";
+
+		cci_i2c0: i2c-bus@0 {
+			reg = <0>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
 	smd {
 		compatible = "qcom,smd";
 
-- 
2.20.1

