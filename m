Return-Path: <linux-arm-msm+bounces-42054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0189F0FE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6953F280574
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3481E2843;
	Fri, 13 Dec 2024 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EUC9EL9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41A41EE03B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101689; cv=none; b=c3xqm72Zcv2TpPRmg26y/ybx5uJ1kuErdxoh6ZmYeCBVJ4o98sWJM+QOW+pxuRIWoN+uJij9t4S2QYKCNKu2RJRip7/bBAEKQrsUBuoj5VqxlodxDETg6HV73IVvw6+iMyag29Ate0bGvP3DBe9Hw1bHgwlFyiM+/qZnfhv14kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101689; c=relaxed/simple;
	bh=EcA3AxO87EuFrzlEa5mrjriGcLseV6ga0NZTRsRrdhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsVbXC9kXDJey4cJCZr5jE8KY+H9eODqEFAP1ZK6AGNR3kFBrAn9fA74/CkZZgwq+ENnLzA+Hdstme6yfuIJ8TimTfEe6ud/5ZGpK7tXzPX6rL9EC2nria6j5BDbVaZS0G/hXNOkIkwxQkOh2rt4GVgtfFT5SUx58EAZD/JwY2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EUC9EL9Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436203f1203so1856735e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101684; x=1734706484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PVT1fCbshpWOGsa9ZzCq+MntBR2n7i/zJ2kSfD3DHo=;
        b=EUC9EL9ZC2VBNzOFqu9BaRU3VJAyG5atvRDX+advk8LpWjZH9rD4Qg3V3NZ5ZAKr61
         JNjcAxH8aVdMBBbO1AHBqrlHw/B0a27cB1KRroDA4scOOrOdSrZOL7jDsiYEV9wlkrQR
         uN0Exe63KxJyMB2VfiWX6lahmdvOgpqwi+bvV/IY/KqufAB4gLj4ohsUKWg3TNpsZs3/
         ZzTEBQCk9B1LxWDllanFK5ZG1k/x1J+m87HmoxhGCpGSp+5SXy6dX/Bye29s8y9ulBag
         LmmDp8OTrmcwQeykHbFc6ZckIPZ7HteB2WIaV7OlcYgYYci6IP12oXp5wuZj0gukz0Sn
         DPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101684; x=1734706484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PVT1fCbshpWOGsa9ZzCq+MntBR2n7i/zJ2kSfD3DHo=;
        b=s2VhJoMYc42QH1q/yqTP6/60eAt4+jlImxza+PNq02z4EfF2H//bFHf/YihrM6a0hY
         rtZZEJ2LgZPxYESqZ70sEhhPk7zjfn8TvMEY3TXdSxTlfC1DUtPFrA1yw8N1Em1RvNHY
         sYvQLBjjcjJ6XLfeV+H9S8m0zkptlLR9pVlmvrpHvv2fzo1jOMGyzPU4a2XtiRe08ZRZ
         HNhF9aPcyb2BExVcNTzLqB/n6NKRxrpDLrPfIiRzwqPmvG1a4RDnQI/Phsi1fE2tO527
         1QJkf6WIVPieBYFPJTrbYdR/AJT+022K2vIHlnTwTmzmMDg4t0q4tu5JZ5Wvstys/TkU
         vFhQ==
X-Gm-Message-State: AOJu0YzWzRZ4KaHpGLQ3vp/sNhEOWuTE/KuW1/heu6rsV2dVih1JzMJd
	JpUppk4DJXtlEX9fMN7o3V5lBKTIet2nMxOF9pDVnp22ozAOoNtlJwMgbnZc4pI=
X-Gm-Gg: ASbGnctYsY5P9/dR9o1N9EpLEjJtO4mt9cf94NOdZV1YWzMsBburWzyR4euAbqe8oIw
	/Gycr+vMLL7aS8fqq9IPvN+ffsgItkylC9f9NKC5QyppLIXR125MBqkUMVR4fdOSs49h+XrFLpp
	vtOb0OzwzwOeuLEvE/WKKfRT+S21Pln8zruEZe8hhf96JVFRtJSM+et1QOhXmuhms6T2TpjEp8M
	dVYSeor+FdSqM+30v0D5hbfasiESEr0ltniL2YbPfuZ8d64IcyJWcqEfSiLjPKNy6hmg2mp
X-Google-Smtp-Source: AGHT+IGLMWUYJwXXmWC9P5uTPHM8O8cGQhCiPEJUYYym8zd+LTu9K/nV7skob+XKQbIOyC2bDbRW5Q==
X-Received: by 2002:a05:600c:3b0f:b0:435:1243:c542 with SMTP id 5b1f17b1804b1-4362aa26efamr9576605e9.1.1734101684049;
        Fri, 13 Dec 2024 06:54:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436256b42c8sm51547305e9.29.2024.12.13.06.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:54:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 13 Dec 2024 15:54:02 +0100
Subject: [PATCH v3 13/23] arm64: dts: qcom: x1e80100: Fix ADSP memory base
 and length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-dts-qcom-cdsp-mpss-base-address-v3-13-2e0036fccd8d@linaro.org>
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9150;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EcA3AxO87EuFrzlEa5mrjriGcLseV6ga0NZTRsRrdhg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnXEqS2b1PVvzHLPQYcjDmPNEH1DquXImO5iyTZ
 BcAsW1dGOaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1xKkgAKCRDBN2bmhouD
 10fbD/9Jx6/LiYs58m4jrngdXmQAdgN1AzLCOkBeAn7CpOrp7G0vYWrBmYzQm2UBJisS648lTgd
 1IPOdxUOVEVeXDnZQfn6Cv3aNjxtvGxSkrJmkDcFfCxwCS9u3TiHqs9iPpFR3a1R55PG3C/qm33
 DALkLT3sBfwUbTGUndSqOYg2MGYOtuoAbKkMeRWhmRswLg8z8lkKPdKT1n9yQT9xEEYBsmXrMd7
 qGTSXA2pF8DI4G8jh27YIgVME+OzWcZrWaEUsR3uK4FMrKLBNpXPM5RfiE80VWy0gHHJPe2PodH
 94uX/hzOcQmHGMsri3ylfBfimyZQAim9CrCgFZT01N5ckR8FMTP8bZSjSeVnzRoO9j3FcMvMZ52
 cegrgij2b8GIapaLdKwQwe4ugB36sAUn2SD/JIhGN4km9ths7BaPRfrHd0cFR70Ibc2RfUfCd6A
 tPgRXR9NCcAq176N8yc3Oq3w91WwOBL5IpI70KqFrbyRm7PgkZrEl5dh5bfqQ0yU9y2QUky3ygz
 nGPxNa2buuFfdQ6RxuXgoGf1zpFRk0sTgCkuYMh+2AAQrzUoex5zprkxGVXGYPa6p3zk9uBi+VV
 LcbGOR4hb/yu89IL00H8BERzNZ+FKhGE28a+UFpG+7MTn9fUOy3qEtRMRtvDZRryjp5CVvyGh50
 s0gABgP5ATVBz4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in ADSP PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB): 0x0680_0000 with length of 0x10000.

0x3000_0000, value used so far, is the main region of CDSP and was
simply copied from other/older DTS.

Correct the base address and length, which also moves the node to
different place to keep things sorted by unit address.  The diff looks
big, but only the unit address and "reg" property were changed.  This
should have no functional impact on Linux users, because PAS loader does
not use this address space at all.

Fixes: 5f2a9cd4b104 ("arm64: dts: qcom: x1e80100: Add ADSP/CDSP remoteproc nodes")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. Commit msg corrections, second paragraph (Johan)
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 274 ++++++++++++++++-----------------
 1 file changed, 137 insertions(+), 137 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..9df6903b5d59aadda26d9e0d4d9f951c5c3add7b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3720,6 +3720,143 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
+		remoteproc_adsp: remoteproc@6800000 {
+			compatible = "qcom,x1e80100-adsp-pas";
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
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&adspslpi_mem>,
+					<&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
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
 			compatible = "qcom,x1e80100-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
 			reg = <0 0x06aa0000 0 0x1000>;
@@ -6319,143 +6456,6 @@ system-cache-controller@25000000 {
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		remoteproc_adsp: remoteproc@30000000 {
-			compatible = "qcom,x1e80100-adsp-pas";
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
-			power-domains = <&rpmhpd RPMHPD_LCX>,
-					<&rpmhpd RPMHPD_LMX>;
-			power-domain-names = "lcx",
-					     "lmx";
-
-			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-
-			memory-region = <&adspslpi_mem>,
-					<&q6_adsp_dtb_mem>;
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&smp2p_adsp_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
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
 		remoteproc_cdsp: remoteproc@32300000 {
 			compatible = "qcom,x1e80100-cdsp-pas";
 			reg = <0 0x32300000 0 0x1400000>;

-- 
2.43.0


