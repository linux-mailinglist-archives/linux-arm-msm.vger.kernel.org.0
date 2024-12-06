Return-Path: <linux-arm-msm+bounces-40802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE19E744C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C462816C282
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCB820FAAE;
	Fri,  6 Dec 2024 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HkOCRoTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3220E6F8
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499191; cv=none; b=gfNzF09VqGO5RKxOL88X//jkU/wo93piJ23icO9Jw1iaw3q8a/Dvxd/gggt7rXcS2P7rphu4lLFVYmtEho5siXPGQfOYp4FiVAAfUsigM5DHMIsvjX4G4vY0I47sHmIvvoZz90+prXYoMA7vbDlBB+CZsjQ+JYEpK38ORNJckdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499191; c=relaxed/simple;
	bh=Y3iK9HXH+xNghLsIEd8ypf+z7dkAPKg52kfqwiJzb6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLqA+Fvi7+mgbIwfySs7hxtjknVK+w+kucKDivtTiT+ZINiw3PzqTcuqdF1P0iuX1jKYdsKumnqUTx+bBwCFrsYbVSmCaFvCkAU8AsucV0HGRCPA1G9cmEIMkK0cqo2LxAtJcVujRlzJXD4iBYn526RkJUEDP063F7eNCeOcPFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HkOCRoTH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a1582c86so2336045e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 07:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733499188; x=1734103988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mJHB1rWdlBq3icp69zuNHIDCdgvGLLuQv3DzTUvhS8=;
        b=HkOCRoTHxvrqyW/j3Q0HvG8Lo2FLaj+h4T2Sf3jlW+uJlWc+PAVTZhY4VsISQsl+5c
         zwVfTOx79HQxcJRHGiNHEElPBzmGAT6U5MQYM4h8kiTHgshiothTB8SquUomGHMSbK49
         fJVKG/VbHBzFXYoTPM+wOfBkpirqQccUw2z0/wwO/lkvYRCG2mA6qB3zcDMMt95ucvVt
         iZgrWkhrdVxDDctcKpc6bEV6nDpIy2/IIPfSE6nVhtXwTVbp9SaLWIDSUs9617sGR9hy
         oe1CNBJLmujFjYkB3QJOQqxLAf4VBTVGpkM5+1cbbx7LUFSoKZyACcziKJsvCeoMI/Gx
         aU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499188; x=1734103988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mJHB1rWdlBq3icp69zuNHIDCdgvGLLuQv3DzTUvhS8=;
        b=syib4Lc+SogfMBhTGoLxUmUGXIMNwWNryWkbIaa6jhEswV8ziiA6Om+CfzPNijGwiR
         MpDQpxuMz9NInrcoNSrtI+3mBUoohesYtDE8m/xIoJ1xCCpi0BRHV2g3HVOM+BF82jGH
         nnPHcaySCmsIYAMLi6ZKKvjvk2281cugBBMjJD8ehKLeVOqRNr7AIk9jW5AzcGiL5Yhr
         m4GiBPOIB8C1n33Yn/btQZJTWvfvYrZQfRvDEGZzKGh9r8ZzbTQCXOO+a3dEfM5w3nFV
         mXILhG9VQN0jgtzZEsWN8Fu/OrNCuKlXBTqJMBle6dygeeZofL9EchvPZdZH26vw90Wu
         IbFg==
X-Gm-Message-State: AOJu0YwkS3kN6R/mdCKvGI+M2iMQUPoeK5dQ2PfYpIuXdEYIfKwsokAX
	6M08QTyondjuLAPbJH+edXNXd+CJJ9hyLtMrEFH8GXNeyaA/+MuC642g8LKqac8=
X-Gm-Gg: ASbGncsL6Io1OdozWs3ah3pq3BEfnXdn6nvJqoY79J8OMMsMuI6ob22WwDNmnkjaWL9
	7h6E0SvsVyxi2Mtq9T+69Fp8NS0NALf98hDNTrnZil4pim2rHT4Hc+E+zAxWW3VOOjP/e/LlVm+
	77GGsFl6OcMkHUwGeC5CNQ3gfR3+YWcgOpybwF6PWKxK8tJWHygbJSeGgqiVkg6MSEAX95biaef
	pLvWVXnHi1lt1vqU7wdDglIzv24dXMIVb/iIyM2BnGxa/9DVVwckBfaE3YrG6FEyA==
X-Google-Smtp-Source: AGHT+IEmIgLq9tR3xZw+6Hghk1vy9YDhiFf8DLTVCUpw5U2Ti1q92++L5SmdeTjF88Jdp39yKhIFpQ==
X-Received: by 2002:a05:600c:3c90:b0:434:a30b:5433 with SMTP id 5b1f17b1804b1-434ddecf92fmr12861845e9.5.1733499187745;
        Fri, 06 Dec 2024 07:33:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113580sm61158035e9.29.2024.12.06.07.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:33:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 06 Dec 2024 16:32:34 +0100
Subject: [PATCH PATCH RFT 10/19] arm64: dts: qcom: sm8650: Fix ADSP memory
 base and length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-dts-qcom-cdsp-mpss-base-address-v1-10-2f349e4d5a63@linaro.org>
References: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
In-Reply-To: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9221;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Y3iK9HXH+xNghLsIEd8ypf+z7dkAPKg52kfqwiJzb6I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnUxkWsXkvEW+Xq6RhoKxApGRdd7+TDBBPINarY
 QJqJtG4bd6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1MZFgAKCRDBN2bmhouD
 1+xuD/9shPGkZFYGUmZ/tlglB89hJyXFW5yfiehpk+vLgATshPEBSd54PBbSkx9UDolVHzoUdT+
 BYa2xkIjGVb/rmRD+tzAPf27ta5kVl67eNVoGxJ+ssK87nzLnKrlza6rTIhvXglGh+BDYsGDHiv
 lldmA9jRyqQmzm4GLEIoPL/nhm+MNTnP1oMKHBr7HNXNUx7f5ljlcrHbjCQ4s8hqAKt24Z0R8gA
 eJDaiG32AEfuESejyUH84h+nIvBGdc0I41QXhlkaNtGeR/yTmTEqlLPhT3fUr5YgI80PHP31MpZ
 t6ZHpxtQN516INLk4drwr8xv6Cr3e5aRv36SOGBRCsbwLWcYMDL5vHvwgbkUGLGxbpEJqSy/sse
 sHYR8DCuDaKwIg+CNvyFEECLLPkLVrbM7oPk9qdCTCIY4lSKWfuKyPTEe4qcB4aHsjksADBH/D3
 r7nNPI5UXC9tVHlnNq0pU6WNgXzmuF3tNsZxuGYTRINTlcjWcBs/J/30zMFOPi52XlFZHEQTzKl
 8zBg8w9IyiRbWHoScGy1jmi8FAr4pauKQ/WBXfG2WvweBbVGEha9a347cbEjP18SF5yq80JZ08w
 JF2/SPPKUyYGx7dDjchxD4urmgUZigIhIwaLFzgpiu63mTUSVJ4rIott461AAkVvnJ9U33/j5Ew
 ANG/ir9EzyhcLrA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in ADSP PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB): 0x0680_0000 with length of 0x10000.

0x3000_0000, value used so far, is the main region of CDSP.  Downstream
DTS uses 0x0300_0000, which is oddly similar to 0x3000_0000, yet quite
different and points to unused area.

Correct the base address and length, which also moves the node to
different place to keep things sorted by unit address.  The diff looks
big, but only the unit address and "reg" property were changed.  This
should have no functional impact on Linux users, because PAS loader does
not use this address space at all.

Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 296 +++++++++++++++++------------------
 1 file changed, 148 insertions(+), 148 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..95ec82bce3162bce4a3da6122a41fee37118740e 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2904,6 +2904,154 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		remoteproc_adsp: remoteproc@6800000 {
+			compatible = "qcom,sm8650-adsp-pas";
+			reg = <0x0 0x06800000 0x0 0x10000>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			remoteproc_adsp_glink: glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				qcom,remote-pid = <2>;
+
+				label = "lpass";
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1043 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1044 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1045 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1046 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>,
+							 <&apps_smmu 0x1087 0x0>;
+						dma-coherent;
+					};
+				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1061 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
+			};
+		};
+
 		lpass_wsa2macro: codec@6aa0000 {
 			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
 			reg = <0 0x06aa0000 0 0x1000>;
@@ -5322,154 +5470,6 @@ system-cache-controller@25000000 {
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		remoteproc_adsp: remoteproc@30000000 {
-			compatible = "qcom,sm8650-adsp-pas";
-			reg = <0 0x30000000 0 0x100>;
-
-			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-
-			power-domains = <&rpmhpd RPMHPD_LCX>,
-					<&rpmhpd RPMHPD_LMX>;
-			power-domain-names = "lcx",
-					     "lmx";
-
-			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&smp2p_adsp_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			remoteproc_adsp_glink: glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-
-				mboxes = <&ipcc IPCC_CLIENT_LPASS
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-				qcom,remote-pid = <2>;
-
-				label = "lpass";
-
-				fastrpc {
-					compatible = "qcom,fastrpc";
-
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-
-					label = "adsp";
-
-					qcom,non-secure-domain;
-
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-
-						iommus = <&apps_smmu 0x1003 0x80>,
-							 <&apps_smmu 0x1043 0x20>;
-						dma-coherent;
-					};
-
-					compute-cb@4 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
-
-						iommus = <&apps_smmu 0x1004 0x80>,
-							 <&apps_smmu 0x1044 0x20>;
-						dma-coherent;
-					};
-
-					compute-cb@5 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
-
-						iommus = <&apps_smmu 0x1005 0x80>,
-							 <&apps_smmu 0x1045 0x20>;
-						dma-coherent;
-					};
-
-					compute-cb@6 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
-
-						iommus = <&apps_smmu 0x1006 0x80>,
-							 <&apps_smmu 0x1046 0x20>;
-						dma-coherent;
-					};
-
-					compute-cb@7 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
-
-						iommus = <&apps_smmu 0x1007 0x40>,
-							 <&apps_smmu 0x1067 0x0>,
-							 <&apps_smmu 0x1087 0x0>;
-						dma-coherent;
-					};
-				};
-
-				gpr {
-					compatible = "qcom,gpr";
-					qcom,glink-channels = "adsp_apps";
-					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
-					qcom,intents = <512 20>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					q6apm: service@1 {
-						compatible = "qcom,q6apm";
-						reg = <GPR_APM_MODULE_IID>;
-						#sound-dai-cells = <0>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6apmbedai: bedais {
-							compatible = "qcom,q6apm-lpass-dais";
-							#sound-dai-cells = <1>;
-						};
-
-						q6apmdai: dais {
-							compatible = "qcom,q6apm-dais";
-							iommus = <&apps_smmu 0x1001 0x80>,
-								 <&apps_smmu 0x1061 0x0>;
-						};
-					};
-
-					q6prm: service@2 {
-						compatible = "qcom,q6prm";
-						reg = <GPR_PRM_MODULE_IID>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6prmcc: clock-controller {
-							compatible = "qcom,q6prm-lpass-clocks";
-							#clock-cells = <2>;
-						};
-					};
-				};
-			};
-		};
-
 		nsp_noc: interconnect@320c0000 {
 			compatible = "qcom,sm8650-nsp-noc";
 			reg = <0 0x320c0000 0 0xf080>;

-- 
2.43.0


