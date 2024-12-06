Return-Path: <linux-arm-msm+bounces-40799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F49E743F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7517B1688B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D8420E6EA;
	Fri,  6 Dec 2024 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EuSwl9h4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E8C20E309
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499186; cv=none; b=G+YRl0ULLTCW/0HGai6tbE7mEdiSk+zDIcRH1c/kdOyxhINsy5uvSfOx3KqFclID7I12ey2MB8oZWNr6ywGeWGLmwsNDeuCnFY2/JlP3STzSU/ejJuenCNSbn/22NXpCnwDHp2AgOxJ2Nzhbjji/nIYKumY35y68BPBeOHaawdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499186; c=relaxed/simple;
	bh=daT2+9EeebhlEJ6tJUNtIoDmSA9BOCFek0CQIbV8254=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIjtqmQkWwWxdbVooOJ4CJJneu30UJfLaBrsOmD1GUY8OEm4yHa0SaezMHP8dwr5YXBra849Qvgvn8DayLaCX5TCnClzYQNve7ISSSsEpOsxTBE9/kvBes3YSkDROWLsVsdutGHc9cg4CuBke9yoYZkN/3aiZ62Hj9znyhn5AJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EuSwl9h4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4349dea3e0dso2367065e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733499182; x=1734103982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzh2BG5ixZ3maL6W2zlNQk9+T/6vgUqmwA91Ee+Q/iE=;
        b=EuSwl9h4LK48MKCTmid8IjMT8YdLxu4lXXRzpCRd2zA98J+Kc52nWM35zQX3pIaTCp
         LIzvVzeIC+k/c4JBL+Vup1c4G3SqxEmHx+aurMr4zQVbwA1bZIRl2tVwhnu04c0/jQDo
         ri+pPYBctO6IGoJrU+Q4BU0i6EzDSpnu6Aeb1Ny1MdGefHQ4un0X42+Wr+CDXNgRIpxS
         84fv26dMvYi2noqWL3JB1iO15ZubBZilIMPjj/Olfva2cgypAz8eDhMZ4BJvgoNkY1+A
         bjPuUNg+1kJZUQND7E3VPmLVjaXQLK63QAgOmHpZOo8ACjdkn1e7KNhHMNQ43W41aSjt
         MUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499182; x=1734103982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzh2BG5ixZ3maL6W2zlNQk9+T/6vgUqmwA91Ee+Q/iE=;
        b=UoaExEnIfV7vBHKgPWI8xOEswHRUM9gWPIwMg2m2ZKowmpaQl/vCRuI/m51S0ItFdN
         r5hy1RPerTGMcTZ4YE/ieg1UdbZST5h8nlPSQzMYcGzhY9jvXcodXTPwAAti/BJJ+Bod
         Qnn/QA8+VwklI8W3fIDBJvneHNj3QRH02dvFNdn68V1QGfJMXqfj9g+jVcMeS6FSh+YL
         o1LfMueSciQe6qEhTzHpB+nvHEI/VXylwJ09se7BDQMv/0hA5XdFKqUzlkNwN2hDXXjq
         SJ7VONtvVq6QlYQ0RWxOeIyZCd+HpiEqMeV3LAjYvw/bugSBSkqmI3A99Nsf7AFRF4pJ
         oToA==
X-Gm-Message-State: AOJu0YwNRUVNnwG2+I0n1SORErUlUx2FY87XBjILsVEjo4UpCebNEHsX
	BMG3Vkme08WrOnEgEEhN65eID6pWKwWx1OAUNh2fhwgmwHjg77510qqFeGV8SV0=
X-Gm-Gg: ASbGnctkM2gaRwMOuaI8rRm05cnYredtnzM/V5mkVBztAnxjClpiuFe/s5srdCECoLN
	+sxgPy3T2OWIUkmOwWZu9ZdNaYNmFiJ1feoTVWcyUkA8dD85rprAaLH15VTdfkgOhhhtjDOvvbz
	pOw0TWW6g8XxbbXRvj7rJcc/9hHUGF8mky71cZu5jWlMaJxFQNFtBbuYU7V82J0fLuVXDKchQsN
	FhMeCrxEQwHuiVZr3Zbkxt5WUizQZWahMp1H4mloP92WMLo1MUR9pLXMrOlNrKtbw==
X-Google-Smtp-Source: AGHT+IEN3BuNMLvYCBjx/Flc2GKn46s4vf9UvYA8Mr+eKJrCOgUI356Pu53XUCJ3WwlN065D3IGqlQ==
X-Received: by 2002:a05:600c:1d19:b0:434:9dcb:2f85 with SMTP id 5b1f17b1804b1-434dde4d0d1mr13270875e9.0.1733499182426;
        Fri, 06 Dec 2024 07:33:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113580sm61158035e9.29.2024.12.06.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:33:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 06 Dec 2024 16:32:31 +0100
Subject: [PATCH 07/19] arm64: dts: qcom: sm8550: Fix ADSP memory base and
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-dts-qcom-cdsp-mpss-base-address-v1-7-2f349e4d5a63@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8872;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=daT2+9EeebhlEJ6tJUNtIoDmSA9BOCFek0CQIbV8254=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnUxkTjQmiVAtfse5NQ25hDkbhN7lw0K5flvV2W
 qsBcFqCscGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1MZEwAKCRDBN2bmhouD
 16XTD/0SIEv+pOHyVdfEcaFjtHzJq+LDP7/+sKzq4P9tYReIXRkycU2gv9pHT/XytyKUP75xeJi
 y3ifoCqmbCSRHbj4coOKqUJdmUWySHmaBfJ4YPqEo1UT4cngtR5NSxd87J6v5chrtqDqAEUhGPR
 9ePkGyFOXmZ8Phxs8+9BL+CoGakWwsj8jdmIehDdonpc/IGhbphrnm6p2Z3LGJHEDnHSax3uHZz
 /0/hnefy5hMcQ3IYtQNrQEXg2SjXedDF0DJveBFI+ivPGd79K6H80ofqjsPIX0PlkjoSslpv8rj
 DC2dSHQ7cevonny/ZK23BKrWpxOnEaut0HiKvJ4pGx+sevWBrLIlLwgXcPz7F9TzB/BB5pjuGFT
 FDcn6EWhHDzR7XQpukdtlOV0RercYF0ePjOyCOgrwnXeflFGf4jh6h5R4ZA8P0RmfjGst0w5X9Z
 uExOiCGIUdrylu2fGN1QBiFDVoFzDyZS2aGeyxU4VmFVhMrO6VTvMSxXl3B6sx9HydBxFVN6PcF
 ZrlSTieW9NUmrpKIqrnBoAvhrjCdJMLxNmVNLDJAc7ko41x4rvRENN34kk2LsbSkqBzXvMESfR+
 OrRZ4Aob3KCWQJ7C9zGXFluaACM3nBTqYCPDEePX1VjAogp8PKox6KyG1NqrPvNpZEEocYKve7g
 DLsoeL0nHjw2p2A==
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

Fixes: d0c061e366ed ("arm64: dts: qcom: sm8550: add adsp, cdsp & mdss nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 262 +++++++++++++++++------------------
 1 file changed, 131 insertions(+), 131 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..f454015c5b90c7d792c01bf85256812857d79c64 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2354,6 +2354,137 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		remoteproc_adsp: remoteproc@6800000 {
+			compatible = "qcom,sm8550-adsp-pas";
+			reg = <0x0 0x06800000 0x0 0x10000>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;
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
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1007 0x80>,
+							 <&apps_smmu 0x1067 0x0>;
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
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1061 0x0>;
+						};
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
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
 			compatible = "qcom,sm8550-lpass-wsa-macro";
 			reg = <0 0x06aa0000 0 0x1000>;
@@ -4576,137 +4707,6 @@ system-cache-controller@25000000 {
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		remoteproc_adsp: remoteproc@30000000 {
-			compatible = "qcom,sm8550-adsp-pas";
-			reg = <0x0 0x30000000 0x0 0x100>;
-
-			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog", "fatal", "ready",
-					  "handover", "stop-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd RPMHPD_LCX>,
-					<&rpmhpd RPMHPD_LMX>;
-			power-domain-names = "lcx", "lmx";
-
-			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;
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
-				mboxes = <&ipcc IPCC_CLIENT_LPASS
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-				label = "lpass";
-				qcom,remote-pid = <2>;
-
-				fastrpc {
-					compatible = "qcom,fastrpc";
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "adsp";
-					qcom,non-secure-domain;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-						iommus = <&apps_smmu 0x1003 0x80>,
-							 <&apps_smmu 0x1063 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@4 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
-						iommus = <&apps_smmu 0x1004 0x80>,
-							 <&apps_smmu 0x1064 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@5 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
-						iommus = <&apps_smmu 0x1005 0x80>,
-							 <&apps_smmu 0x1065 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@6 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
-						iommus = <&apps_smmu 0x1006 0x80>,
-							 <&apps_smmu 0x1066 0x0>;
-						dma-coherent;
-					};
-
-					compute-cb@7 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
-						iommus = <&apps_smmu 0x1007 0x80>,
-							 <&apps_smmu 0x1067 0x0>;
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
-						q6apmdai: dais {
-							compatible = "qcom,q6apm-dais";
-							iommus = <&apps_smmu 0x1001 0x80>,
-								 <&apps_smmu 0x1061 0x0>;
-						};
-
-						q6apmbedai: bedais {
-							compatible = "qcom,q6apm-lpass-dais";
-							#sound-dai-cells = <1>;
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
 			compatible = "qcom,sm8550-nsp-noc";
 			reg = <0 0x320c0000 0 0xe080>;

-- 
2.43.0


