Return-Path: <linux-arm-msm+bounces-73185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3ADB53DA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 23:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 299B6AC1047
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 21:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36EE2DEA86;
	Thu, 11 Sep 2025 21:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hr4NFg7j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0562C15BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757625670; cv=none; b=dIjtRKyIEal964bGABQt0gYWRnx+qGODNOfA3HXp1Qm5E+e5pOZE8UAITcNh6+1bt8EG41v92aEIQxjTPvhypjhiS1t7urfbfQdJniRN3fjIzEj2JL9scB+zW92YjUWJvDJAmjoQPq5HIE8xf90FjysAQwOr6pSZupa+6RrVEUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757625670; c=relaxed/simple;
	bh=s06lMSgFUbsQsftyLPOCIcILNY+VCV8h/628COtxgqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Khpa3+H7tk/hj2e+Z94MvvAiCHVM2KDqZevNR+h3kkn6dBMtcyVcVOq3wC7w9wRAJBIkX+VFqy7Yu3rpvbSGsy1T943rCiYUIfYN4kmh44K0UnzzFyI0iuBf6n3uMT7rHFATN5ZamUWPai98nEFpYd4EFGcVUwe1aAeKTZdHpAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hr4NFg7j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BDhM7H019116
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PT1gCayuGIF
	IlQqnQzKpVckx59blbv/GdiBq89GHfVw=; b=Hr4NFg7jJaPF9xvZayufZfl/xG6
	UzrUzg7xLNWUBf4a629PsR0H2DEo0xHoDFDKFWGbdSLeneoo1YuEnXQcU3tBgcG1
	kK0/iFNVaRIZM7pBGSzA87JGpWcp3wGmiHMHe73NLnrZgA5HuiC5qp6HkgfhZWkP
	U9Yr8E/JysRHVlXg83GzXE+dHG74J27Jl5ZwQ4OaG4A1PYjQmb1p2A2Fu1TLxh5y
	fMOAv7W0zo098msvLqWB9RF2exmG87Hg+PTcmCE7JZ7NvvUTxoaKv2L/9tydYo4Y
	/+yPnJJYvbXlohuzBGreEByVw+vjWPimd52gLAPpYtOr32VoJjNldG3qarQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphu1wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:21:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b47b4d296eso30363301cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757625667; x=1758230467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PT1gCayuGIFIlQqnQzKpVckx59blbv/GdiBq89GHfVw=;
        b=M4C5bprhm4lTNn5Blb2H2dEky7/RiyCc/I0R8XBUSL2q/dHaulF5k/vOMKfhlJRvFG
         okNmHG4FvqaDXYgCk3QwBLKiWIh3zF8tB6IjByG8q7V+sO1bx20oOoZAHmtstk8pcu+H
         qvguj9onqFrL7PEDn8D71K5vzo6LpmgjXEhw+EC6UClYM11rkvcNe2OPi+NL+NX5rdQC
         9fHThs84hhHy1qp1ci34qcFHE3xmgWHgsaHelIblSyDPH/IuaNbfsUYcsfYPPNcp6B5G
         SoFLoUJ0nUN73waFpceAqmcs3QtqhmPQU+PyfrYATW/8buO4ZUkZnQ2jQoSHDz1ikpkx
         acPA==
X-Forwarded-Encrypted: i=1; AJvYcCWIuZEc3wjCZplYw4Kqlf1k/ey71LTetgSE0p5DMNSUQvDB34UWZ8NUqjU1ahWHxGsO0ffOZrw3JN1DauOo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnw45lnBnLMMJqEQjCG3cXboK5aJnNVGP8NQllMlqZGlLLGC37
	LgnIFm5+L3WELbiQ84h2/d8wMz/F5xIm1JyNZZ1bHnvQBA6mP7Ej86sqorwhPEKeKC0ljjv/o8R
	jive7Js/zKcs22/g0aFeZ9fSn8oxpYhJ+VhuBbfjS56CMpy8Shbk5uLHS1+f9hLFwBkrl
X-Gm-Gg: ASbGncvmk127z2bRQb1IEFMh6dmOkbnOGJYRmnmmg3t7OLzT01lbQaBiXfudcf3naex
	k5d5YsYq8560GqR0bAAfrhx2NkXOhjNXybRz5SP/mUUM0lcfqsZwEgZaKeJlCaQk6C6Uojlbw0l
	NuSdSC7BhgQXa4b7YnGzSLf1++fF661HnP77xQVT+0nDAi0iwNsk3lHcxAvfphB5DLLMhmQawV5
	82gJlF6tBTff4YdEpUvagJp92OsyEhmir4XMMQgwC8mDaAwpGeTrbdwYdizdT+pNND8laSM2EJK
	SfNNYrYDaJndTb1y/Qt7iYCIEnQbjwiKGQ3HeYmHrx5wtETZC/ZzCrTe1mZdcKIatIgsNxpuGGQ
	=
X-Received: by 2002:a05:622a:5449:b0:4b4:8ed1:2241 with SMTP id d75a77b69052e-4b77cfc2330mr8536461cf.15.1757625667189;
        Thu, 11 Sep 2025 14:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrO2PLPKA2mCIyBGV7Kqv20BSBqgWRCXp2pmuFmfOEs/8og5PKPIxRUT9YJrGxkW7UhKbLEA==
X-Received: by 2002:a05:622a:5449:b0:4b4:8ed1:2241 with SMTP id d75a77b69052e-4b77cfc2330mr8536161cf.15.1757625666685;
        Thu, 11 Sep 2025 14:21:06 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:3c22:d6b4:15f8:475e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0187f0a7sm21843935e9.3.2025.09.11.14.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 14:21:06 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RESEND v5 2/2] arm64: dts: qcom: qcm2290: Add CCI node
Date: Thu, 11 Sep 2025 23:21:02 +0200
Message-Id: <20250911212102.470886-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911212102.470886-1-loic.poulain@oss.qualcomm.com>
References: <20250911212102.470886-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c33d44 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=7004nz7suiqLHAzt4fYA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qXJR2h5ZRFn0wTVZgQG00w4MbVJUV6YV
X-Proofpoint-ORIG-GUID: qXJR2h5ZRFn0wTVZgQG00w4MbVJUV6YV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfXyShqbZUNCgea
 9P3p5MUonyXz1DyYt+r91BUpbblgioyWJicH6lDrFExEpV+6YylWurSUuDp5wJKm1Gvgnom2MYW
 rjFjtw0+KjLqSv8QGeVkV14MmhajmNH0MEdid9kBsqzOFsqWS/ftAmO0geTjSLb+XAzMsdy3Z0d
 e2kip/sjxT5E6MjHsj3uB6xcbY1QYxP3HinKrtjhVY13hM7soDqoh8mGtg8D/CCrNJEOFkE96Je
 kF2MWmzaaiovZb36SwnsPk51eGaKttIXTbONRghAY48vMBEkh4FMyzB+LiSrD4qcYlol0rWK017
 ZJnR0QSJSP44csbtjEH6R92WouITwMrSXKLn28GbjF03JY3WwU+9eaZTp+OvutQr0ZY6SABl4hw
 okFkEb1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040

Add Camera Control Interface (CCI), supporting two I2C masters.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 v2: Reorder commits; Update dts properties order and style
 v3: No change for this patch
 v4: change AHB clock name from camss_top_ahb to ahb
 v5: No change; Resent with missing recipients

 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 527705c7d212..08141b41de24 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -566,6 +566,20 @@ qup_uart4_default: qup-uart4-default-state {
 				bias-disable;
 			};
 
+			cci0_default: cci0-default-state {
+				pins = "gpio22", "gpio23";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio29", "gpio30";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -1635,6 +1649,42 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		cci: cci@5c1b000 {
+			compatible = "qcom,qcm2290-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x5c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>, <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_0_CLK>;
+			assigned-clock-rates = <37500000>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: camss@5c6e000 {
 			compatible = "qcom,qcm2290-camss";
 
-- 
2.34.1


