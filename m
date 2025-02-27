Return-Path: <linux-arm-msm+bounces-49731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6C0A484A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 17:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0596174F40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC83B26E178;
	Thu, 27 Feb 2025 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zf0vIVOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5E26D5BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672279; cv=none; b=EekYJYnMtmWa4ZwqtJmTRsjWXgZnKRt7w7QQPZiivnznCt7oxyqozdKRuBS+2WF8YMxjeUX+K8iC4q3CBWJc2sLQQ1VLLsSZoWQbQyhiGk77FxDdCdiYeuPIFdT4M+TbIg4uCUHEv1JlQSrALhqMERL1gSRFCNkip9yPKJAHiVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672279; c=relaxed/simple;
	bh=k/Ub0j4ZPZ5XJlCOR/aNVmHDxi435bw376+PW8znVRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uehKvxdKCChT3gvxYqosvf0PArgRbg5CjaPrccyKvlkSovnUpzQJEtN88v7NQU8hDOCcAyTX6vUAltDxb3mQfVyB4VexVBMTPjwGYBgZKRPpql3MYPFQ6r1oRmp6sNJyU/pav2IkDays1p2wSnTzleCeO3/lDZ/X5W4IkDsSxV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zf0vIVOq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-439950a45daso7633375e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740672274; x=1741277074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkITjQmr9TX/26VhCMssjv/ZXVYw9RYOTlGukmEo+nk=;
        b=Zf0vIVOqkJ27JlI0LjgopLVeiTf4y55u1JT6Tdvd9bq2iXknTH4yJt0vXaZ/EKnmBE
         Ve7IDf81b/C2NY8U7rIBqgSfrSvkNNDQwMYfj3IF0f9SFfiQgd2EzO1bK5ljT/wFFz0m
         jGQuTrVctBKDFcqBdUtWw8Pq6ZIJOQuWhYLNzdoq56t09HUkLdbn1R5WafVnXhca46yw
         MeJoteUo3SDqTcRzyn+mtz1BwikiBXK77hOlRM8SHGIhGJfqZIbH5uSSwjI4qOAzYZZa
         f+Iq9VUybieeMjXRWsiX955kI9uiCkjWyzwaZrKahtuYLtVKrbUX0wJrLkNN0Xea8AN4
         CZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740672274; x=1741277074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkITjQmr9TX/26VhCMssjv/ZXVYw9RYOTlGukmEo+nk=;
        b=n6V8uxj/EOPd2FwC2oNpxxFZgb8WZTZMfstnKbFTXriYdDJlKfv//Yqn7j7lJftDoc
         wDTz2kwZEx0wDT78dTmWrUb44a7x8FeilkXGeYdXH+TwzyrcmQS+f5f4tTDzLPv1Cg1L
         rxxGQEPCZ3M32a4Qx9GjNY5pwVw/ilk7LZGW+ErxpICEoiwLcLNHNcowXfvGPpX9OENB
         9diCVAXI1ocvKW89h8tjoRGwaYxGUc+ihDamKSjrNqeZG346Lg8Hnnt/vUsp4VDR+K0c
         +xZdeKZMEBSiWo9Ip6wwgPFQ3wEpcQn65B5qTuWfeXtV21dQaIuS9D5ksmsfk6QDnO5p
         cy1w==
X-Gm-Message-State: AOJu0Yy+0zpMqCrfs4ifLoaVfqFjP8vfNgTyPQF2EgNgh67oLt/ZTOq8
	9sYOtFiRCtFJaJJKGsIowVRe+ZTFElQ2ezfvAsraIEev0MvItGOI5K58Z0He53E=
X-Gm-Gg: ASbGncsMB6BnoSkeozfsiPQmIcEf8RTPrbYzI8RekoCn4/Dt5/5MlxxYqeaaf9lYfUa
	8mwqW4Fav+cc4ThI/XKvoLjAdFAcEFYJcZuxUVvbGyZRNTRsFPqtObLmFVEVFhIJWJXUctAdwNi
	p8p2ALR9SXJPNV5aXEFyNDUzXHJwwmtjhwE103IrvkPHKDl2H9gagy7R1AxpbA7r/deXOupfiJ2
	mfpdxC5c5eKwdUMj0fBXbjGC8WtR+iEwKizpNHXBEHdGhzPWFDnZ7qG4agvvLfCsT4SbYca7ww3
	wka8H5RnN/PD4LpzGlqzPm+q6MnvD5hThUSILw5rTrgm9LQ=
X-Google-Smtp-Source: AGHT+IGvE+jugbR/iYq1Tq9sdNrtTDnhF17ycAcebZLYaEztCw8UWLz01Kt1SnRaA91VfoNeOfYyuQ==
X-Received: by 2002:a05:600c:3111:b0:439:9f42:c137 with SMTP id 5b1f17b1804b1-43ab0f31010mr115437385e9.11.1740672273805;
        Thu, 27 Feb 2025 08:04:33 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5393e5sm58811225e9.20.2025.02.27.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 08:04:33 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Feb 2025 17:04:30 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8650: add PPI interrupt
 partitions for the ARM PMUs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-topic-sm8650-pmu-ppi-partition-v3-3-0f6feeefe50f@linaro.org>
References: <20250227-topic-sm8650-pmu-ppi-partition-v3-0-0f6feeefe50f@linaro.org>
In-Reply-To: <20250227-topic-sm8650-pmu-ppi-partition-v3-0-0f6feeefe50f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=k/Ub0j4ZPZ5XJlCOR/aNVmHDxi435bw376+PW8znVRM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwI0OSMi8BmNu9kqZwskc/n45+T5S+IDHSOwrFvgU
 aajWWiKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8CNDgAKCRB33NvayMhJ0UX2EA
 C9T+dPGwjHwrmCzRoZ58DcLXjiJra2ao+YaoCCUcvJ2CNuRapDYRTEEDR42Bby6k8+NEkO5WTW11cn
 We2VIjBvga0zu7mUqXQDLOZLUkXnBxPCTcaUHyJC8KMn+rvE/4rndUWpB8TH7uI3Nbl66uM0UJbIVQ
 DuXmiSZyHvZg9M/oGClFSIPb5lmBL7o3a3WSv5TOHIdFqEoG2xRyxBfR2Z7OtSyqx1sv44EzmFD08n
 vXqHyHcs8sKyGASDXcZBjXL6/KyZ8TvdgORvtKRR+wOYzCfLop0zo3lA3kk58Plb/kjaNK8J9BNWP+
 iifjroFtbm0rJHYr4ZhV8CLotj7urOla2cV2MEfflxT649RlHKjRWg0ZqQy+iLLlF+IXllhvDYql1G
 UJy4UhqOfvv8LeAWn26jhgFJSe8iS8dV2cQIfsoUpvJeX7dQ5aiTlEUHX9awUC7SY8MzVRlkbs0q9Q
 keLgDTgAR2WeDXQu7GdVre/gq/bSJ8hE2e4SS/Y4kBFMOybWew76uzkYOvnKOxwo/cdHedFdZUVbwz
 imjWxoOzsTPdEU8b/Nely2CnrN+gFAF2jg631BIKjeqaFXKslaZfknLxlEyMxhHPWSvAdaxYkgl08D
 s/vI0AOp8NK6sNN3ZN+8M4Wf+4pV5MHxpG33+FEkkrpcAGeFS4sBJVyc0Kdg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
interrupt partition maps and use the 4th interrupt cell to pass the
partition phandle for each ARM PMU node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 273170a2e9499b900b3348307f13c9bc1a9a7345..58646b50bb437fd5eb2ac8cf3955be2db020d6e1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1417,17 +1417,17 @@ opp-3302400000 {
 
 	pmu-a520 {
 		compatible = "arm,cortex-a520-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
 	};
 
 	pmu-a720 {
 		compatible = "arm,cortex-a720-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
 	pmu-x4 {
 		compatible = "arm,cortex-x4-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
 	};
 
 	psci {
@@ -6590,6 +6590,20 @@ intc: interrupt-controller@17100000 {
 			#size-cells = <2>;
 			ranges;
 
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu2 &cpu3 &cpu4 &cpu5 &cpu6>;
+				};
+
+				ppi_cluster2: interrupt-partition-2 {
+					affinity = <&cpu7>;
+				};
+			};
+
 			gic_its: msi-controller@17140000 {
 				compatible = "arm,gic-v3-its";
 				reg = <0 0x17140000 0 0x20000>;

-- 
2.34.1


