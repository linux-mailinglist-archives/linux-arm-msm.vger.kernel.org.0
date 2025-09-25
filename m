Return-Path: <linux-arm-msm+bounces-75154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BC3BA01DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 17:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E33EB38202A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D932C301017;
	Thu, 25 Sep 2025 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECCmUncj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FA62FDC4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758812586; cv=none; b=U2/Sfvwk3EkDvZ0Hf6S2DKh96eOfbZ/RHRhY8q6f+x3VNGqOAvRT370duIYlrjYpDKGQIPQcZR9EnLYENikv3IlRd3WkoPjG7xJDQMIYDg+rvP+HLcHf4RcNakGNUlMDPuRtp7BxIfyqCTUipOXgpYVmNBjkcDBm6orkz3HTUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758812586; c=relaxed/simple;
	bh=hW5vCXkvvQEAJ8q2Lk6UaplPBYXPmZjBYqqn50/88GI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u40PbDWX9ivMojS+DdGHTRXTZLWcDsv246hYY/N2nLvNIxOgCBkeKLLFiUoiyZn+PJVf8hKFTJnvzFeiSE7xgB3pSDFT+m+R920ebVgXT5zPtzEEvjCB2XDIxRLnFlkfSLD1wIahivOHVndyY7pUxXv4wU4OG0N2XD37SdoxpxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECCmUncj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so1063117f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758812582; x=1759417382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZ3V+Dus5VxNlMIsnY+uJIxJvCz9CKj72KqGIxjA0nQ=;
        b=ECCmUncjmecEW31kQckvgwR95kFZlQc6SfBuZypEeAROJPJgx461XRawYa1S/hoGmY
         ZBJ+w1LPtntRf0VZgltQ23J6GQeq9+Q16ofPfCekuSuC8GLKS5U/3fWnB8yTt2DRSZ9p
         jj8xx9DkG6jm/YWQebiVaG7RBLZnCPaGeRaWV08CN1kpj7DE1qoERbIwPZcU9/5A0yOX
         zctmKdQP1MxZ1wHJtkYC/wyGujKj2BA5YDfmAHb8jvsl7yRuws99RIBWMNh/XNdQU1xa
         T5FW2pW9+nyvl8lP3t3O4yFES0/aPNsN4QtkSxrcl/kjLvv23Hc6C0frEPq0/qQpp1/6
         +amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758812582; x=1759417382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZ3V+Dus5VxNlMIsnY+uJIxJvCz9CKj72KqGIxjA0nQ=;
        b=qJMocvMREGDGn5mvRBeUFAbWbdKugaAgkMH34IoAfDpv7v0Ak5aSlmDki/nz4In9V/
         xxt4tO4/ub26ojlKBtXSpFTIrEnhUeYIoxuU1UBHi+SgA3i5jSPYFU1g+kQMasl/guL1
         N5igGbWOlE9v9zmA+86Ln24Tdx8xb2pNXXA9nIdWsJWJwGFg0ZHB5H2+paO2D0xceHfs
         3bp8dM49Al9F+pZv8sdS3jpdxqjEZNOch9tE+HCViyoJNz5+1VIFnGHHafOGzeGQmpYo
         G4+mGEwHXm7KskV0FLvMQJGx2awv8xu53eqytaQ3iAPiqtiKKoB2oxXOYjyCHskSw1El
         ew7A==
X-Forwarded-Encrypted: i=1; AJvYcCUCGL2eFeHRXCecGpZZLkWcd+SfoA4nSowK6e4/VR5wC7ePAkLJ0dk3JuKzIPwMuJrSrC3GqV6uScsjpbT0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3BOLSWy9OKLSpne05NsTxwbULLr3eXGOVDjVRycmPVQggnhW
	VjCOjw5Tg4kdBXKZBu5EzvWvCk4hgoKAHXT0lYsgD2Tv1vHTDoztDznpj+FXjLzdtGk=
X-Gm-Gg: ASbGncsFACIOQMxGhK1sLT5dBmT0yHvWJmWmBTS7ndakRi3e5gup46wJVo9WrWpHnim
	unmV3+v8eQ52iic4gD1ROLX9iXqk9/o0Qhtk1XLTfL9+FnznntuKAGpEnAZrb2Nryp6J8/elChd
	ltV6FmhFDgQk2X+A4j8i49UxDf2sEpY4Lei5K4wNjjYTc5mlWG8Lcm5VSbonfpGGCBVBRwQHBKp
	evnSvJGWKwfAXydx9DmJ0df32a9429IugkGFDMo1jss/JmTJqVevOfWLHz4sWDcS8loAASJTC/8
	DWGXxEnlE5m9ZNnyYxyX4QpZ2hrQ2oV/x3ARsAFU2AoKojgja7aLVbnLNevdf52jJefBcJsMYr1
	zuNy+pvZgCf+uaEYPU1UyDMM=
X-Google-Smtp-Source: AGHT+IFegLF7D0v7NmZJTuKzIn5EP8qJb51VEpLmW1yA1hM64TPIlVjL4TcPJYAgg3aTzPvd5bBXyw==
X-Received: by 2002:a05:6000:2dc9:b0:3e0:2a95:dc90 with SMTP id ffacd0b85a97d-40e47ee195dmr3619536f8f.35.1758812581824;
        Thu, 25 Sep 2025 08:03:01 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33baa625sm38516575e9.7.2025.09.25.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:03:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 25 Sep 2025 18:02:48 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: glymur: Describe display related
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-dts-qcom-glymur-crd-add-edp-v1-1-20233de3c1e2@linaro.org>
References: <20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org>
In-Reply-To: <20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14319; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=hW5vCXkvvQEAJ8q2Lk6UaplPBYXPmZjBYqqn50/88GI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo1VmgDyxBj56qxqK0mctQCTxrK0WNDn0z98L0j
 F40d0Ear3iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaNVZoAAKCRAbX0TJAJUV
 Vuc0D/417qjnDS79Hrhp+12NBNIyDC+PanEOfoKBO4k6EvVzVvTJEGY/Eg6vzMIN2l1Y2Glywtx
 7eZI3sd45NgtLlCkciE+QO/Ah9hyAWX8dfiZROdWMMPjAC8hX3tYgQtLIcoB0zdjDkV3fZ+7Tl3
 HrHF3l1p3e4qg457OW2xIJ4tjKCg0Vgxa4xUyOrPWPly8KpPSPQaq0yQ/JMHKp4UCsFWc2OOqn9
 sNAiXqB9F5Hra0p2lhLUZte/7VunT1HwT45i+oAVMlgoaW3wCQJHmb90sPEwmr06LWuEb5GbSJ2
 rpTF5zs6lXOk+GJNew1hlW8momYHXEgucI9qY2vhV3SCChjIMX9F68q3ygtN/Go6PXkVnzusxfU
 yQb34ObTtugZoNogflOKnDw0nczqFAkF4vpUPV+DgpWsNuoeYuCe8taHcHxQ8hoq42dwRi3CFzV
 uYOvpf5O81dlPfS2mcjiAsB07uQDkHk0pcxD085lIwwPye3cCRxv58jvr0UowxFJaDcckDz1/E0
 g9db9VfOVtr2WW4n0sQXkWOUiQBCEMOt0fEz/UTxPl8FjUu9y466xYMnjh6nyy9Qx8Ol8ERsytm
 ELMtv8ltPgjhuiJ2NmfPHuFYniU1mOrzabAxTKTkSWfkvHu/4zF8ZNcnS/20dq9zvn6T2VXsit6
 WIUmSYL+/hk9amQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The MDSS (Mobile Display SubSystem) on Glymur comes with 4 DisplayPort
controllers. Describe them along with display controller and the eDP
PHY. Then, attach the combo PHYs link and vco_div clocks to the Display
clock controller and link up the PHYs and DP endpoints in the graph.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 492 ++++++++++++++++++++++++++++++++++-
 1 file changed, 484 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index a131cd6c3d9e7f14ed1c4aef4b68e1860cc3bca5..41d89998b1fe14a24cd528e73afc37cf2a840bab 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2698,6 +2698,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -2766,11 +2767,34 @@ port@2 {
 					reg = <2>;
 
 					usb_1_ss1_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp1_out>;
 					};
 				};
 			};
 		};
 
+		mdss_dp3_phy: phy@faac00 {
+			compatible = "qcom,glymur-dp-phy";
+			reg = <0 0x00faac00 0 0x1d0>,
+			      <0 0x00faa400 0 0x128>,
+			      <0 0x00faa800 0 0x128>,
+			      <0 0x00faa000 0 0x358>;
+
+			clocks = <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&tcsrcc TCSR_EDP_CLKREF_EN>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref";
+
+			power-domains = <&rpmhpd RPMHPD_MX>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,glymur-cnoc-main";
 			reg = <0x0 0x01500000 0x0 0x17080>;
@@ -3248,6 +3272,7 @@ port@2 {
 					reg = <2>;
 
 					usb_1_ss2_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp2_out>;
 					};
 				};
 			};
@@ -3523,7 +3548,458 @@ usb_mp: usb@a400000 {
 			dr_mode = "host";
 
 			status = "disabled";
+		};
+
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,glymur-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+
+			iommus = <&apps_smmu 0x1de0 0x2>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,glymur-dpu";
+				reg = <0 0x0ae01000 0 0x93000>,
+				      <0 0x0aeb0000 0 0x2008>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
+
+					port@4 {
+						reg = <4>;
+
+						mdss_intf4_out: endpoint {
+							remote-endpoint = <&mdss_dp1_in>;
+						};
+					};
+
+					port@5 {
+						reg = <5>;
+
+						mdss_intf5_out: endpoint {
+							remote-endpoint = <&mdss_dp3_in>;
+						};
+					};
+
+					port@6 {
+						reg = <6>;
+
+						mdss_intf6_out: endpoint {
+							remote-endpoint = <&mdss_dp2_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-205000000 {
+						opp-hz = /bits/ 64 <205000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-337000000 {
+						opp-hz = /bits/ 64 <337000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-417000000 {
+						opp-hz = /bits/ 64 <417000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-532000000 {
+						opp-hz = /bits/ 64 <532000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom_l1>;
+					};
+				};
+			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0x0 0xaf54000 0x0 0x104>,
+				      <0x0 0xaf54200 0x0 0xc0>,
+				      <0x0 0xaf55000 0x0 0x770>,
+				      <0x0 0xaf56000 0x0 0x9c>,
+				      <0x0 0xaf57000 0x0 0x9c>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&mdss_dp0_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
+					};
+				};
+
+				mdss_dp0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dp1: displayport-controller@af5c000 {
+				compatible = "qcom,glymur-dp", "qcom,sm8650-dp";
+				reg = <0x0 0xaf5c000 0x0 0x104>,
+				      <0x0 0xaf5c200 0x0 0xc0>,
+				      <0x0 0xaf5d000 0x0 0x770>,
+				      <0x0 0xaf5e000 0x0 0x9c>,
+				      <0x0 0xaf5f000 0x0 0x9c>;
+
+				interrupts-extended = <&mdss 13>;
 
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&mdss_dp1_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp1_in: endpoint {
+							remote-endpoint = <&mdss_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp1_out: endpoint {
+							remote-endpoint = <&usb_1_ss1_qmpphy_dp_in>;
+						};
+					};
+				};
+
+				mdss_dp1_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dp2: displayport-controller@af64000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0x0 0x0af64000 0x0 0x104>,
+				      <0x0 0x0af64200 0x0 0xc0>,
+				      <0x0 0x0af65000 0x0 0x770>,
+				      <0x0 0x0af66000 0x0 0x9c>,
+				      <0x0 0x0af67000 0x0 0x9c>;
+
+				interrupts-extended = <&mdss 14>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&mdss_dp2_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dp2_in: endpoint {
+							remote-endpoint = <&mdss_intf6_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp2_out: endpoint {
+							remote-endpoint = <&usb_1_ss2_qmpphy_dp_in>;
+						};
+					};
+				};
+
+				mdss_dp2_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dp3: displayport-controller@af6c000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0 0x0af6c000 0 0x200>,
+				      <0 0x0af6c200 0 0x200>,
+				      <0 0x0af6d000 0 0xc00>,
+				      <0 0x0af6e000 0 0x400>,
+				      <0 0x0af6f000 0 0x400>;
+
+				interrupts-extended = <&mdss 15>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX3_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dp3_phy 0>,
+							 <&mdss_dp3_phy 1>;
+
+				operating-points-v2 = <&mdss_dp3_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&mdss_dp3_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp3_in: endpoint {
+							remote-endpoint = <&mdss_intf5_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+
+				mdss_dp3_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		dispcc: clock-controller@af00000 {
@@ -3531,14 +4007,14 @@ dispcc: clock-controller@af00000 {
 			reg = <0 0x0af00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
-				 <0>, /* dp0 */
-				 <0>,
-				 <0>, /* dp1 */
-				 <0>,
-				 <0>, /* dp2 */
-				 <0>,
-				 <0>, /* dp3 */
-				 <0>,
+				 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp0 */
+				 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp1 */
+				 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp2 */
+				 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <&mdss_dp3_phy 0>, /* dp3 */
+				 <&mdss_dp3_phy 1>,
 				 <0>, /* dsi0 */
 				 <0>,
 				 <0>, /* dsi1 */

-- 
2.48.1


