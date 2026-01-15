Return-Path: <linux-arm-msm+bounces-89203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB3D23DE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 11:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 937F9302BFA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA41236167F;
	Thu, 15 Jan 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJSH0icB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjpcitDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1915635EDA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472013; cv=none; b=fMShmCkIn+XNiWQXMhs3iq3ePQK8J4wrWXdfxjVe2YENuIPzCehwciTB/aBfmq1uzzpZXzsnCR/a3qdc/jvWLUEl8OTuN14u7sshCSvWNhv/Bhwi/uTH7JaR6CmCvMYmCEbMz0UgIk6PxBQjrrqhaaqbn2w0DEBvY1JbMkjfdbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472013; c=relaxed/simple;
	bh=IAlQ9wjSqjHi2sXh9LPkom3twHwIndc2QkvvmikUsaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLEuqWq5SM3MHwxA38Xu5VChKIhbSfwCExghW8Vy+uwaNVrgNt5jZc5h/sewni2XGXSXo4GzXtOBYoApiLAeBHccoeq3DYTNF9mZzI8/K9PHB/IfeE3aSvB0htf86Zhg+5BnVyO0e647PJ/LnUbRbJ+yIY2GAISwi+3TsCXVpa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJSH0icB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjpcitDX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6foig3419538
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IAiypVbNNKr9va4u59sYj1IRIL4ZDpAjwidA5VMHVU=; b=UJSH0icBZG4JWex9
	IT6fMWUNjjDkVEGAU3dtiD/+ldFsmwWkdcV0JJ9MwrhxGqgH8xWCq2D/cBCeWYM0
	N1JsBfpn3p3WOi1ITzoRHewgHFfDQCXxfSgWDJ3BbLWQpDHfvNy18E1V9+ZXHXkh
	aTKTkHv9PTuX2IUhEdFymJ6fz6ub21towKGOd63vJ2hkaYRMnWj2QsJw/dlDTMHx
	woNEOYYyZKWNpzQrv0cei9oE7d67Kk4sTKqff85V03j/GQciSjfcuH40P4rlAbbD
	C35xArHk0HTX3h/qxI1aRwgDmwHfi/EuKDVIfMQEa2IExqeay3jZOi+TNS0nu2T+
	PT2CIA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj8a2xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:13:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a360b8096so18627226d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 02:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472008; x=1769076808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IAiypVbNNKr9va4u59sYj1IRIL4ZDpAjwidA5VMHVU=;
        b=OjpcitDX9J7FKkhTT25gKqOUSMtDtuintEIvSunHttPWyDdtuUyJa0Nrwv7DnwJyO8
         jzuAxuPnXqoqg2VAzvBa+TV7VuDL2oLH0icikvNDd1rRokeqK0JpufTAfGUXXl17F/Ea
         /6eI3FYMZ8QvCpyMM9IrH2SIXi3RRox6EsLKjCxsYLf1aK9JpXusq6DI2bduJeCO3v/f
         bebKIZ/W2e08frbC4Z+FaLUd4n3IOEFO2lF3KOL1aigCRIpVtm8NyNMdfPKUNZo7Bt1h
         v2HLbttiRZfuJj3isz27RDCdsJyyiNAoJm/0NQLCf+kklClLd69CO3UYiPH8s4j5bFJt
         9R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472008; x=1769076808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+IAiypVbNNKr9va4u59sYj1IRIL4ZDpAjwidA5VMHVU=;
        b=Al6YVOTkwFw10O/LAbwiu1bV7c48fIlzKoMCnwrQuXTk6CvfFmvl8fBmmFvpqa1Dag
         gcDbgw2vpnHCaIec5NpcJE4BDYO7naLmk8MZnzwMEziO+xzRgHdV/tXzWkgzecdF0Znt
         AOqPnCH8Eq7zRkMUvAlOrDxMr4DOVvvF49GLX01zAqDSbX3aqHVQrhMz+M+XOduqQQFd
         Ot4t4dvJza3nSNkYE2xq6mLR2mYITHZX3H1JtKpAposoiD3wJyxXbitQ6GRSZDWUEKu3
         UECUyujqfg5vejPnSPo+QxYzjpfROvTcoqpKUBuO1ZcQuSEW6/AVPFosCa2peqhilGIg
         Kb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFkBoziFRbzd4WFyq42O61WS1ARslvrDAjf36tHMe2Ls0kO4QB8tgx+U2RYN8EB1MX08AUJDHs2THpwhVl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/pBeMtP1J3T+NpoW723kU/G+cQq5w6GaPsXA+QCdMvFNRMH3h
	/EVShlAQUKBtypA/+c8vl6f9Mcs2GskTF5tQCs387ic1rA+Er9CrghkH1ma3A7Nq35gS2rn9oPj
	+Rw+mkqzBYQ22DbWDyxJ05Vr6LBYefWkvE9Gnx3v+gHF7LlYygkxYyvnnMQm8O5lbEeTA
X-Gm-Gg: AY/fxX6p0Cy3c/4G1Hm884u5Qntaj1En1gG1lrLFdUJDbldrQ0Wdcq4p5zVptO1+qVD
	n4G0eT47e/Zp+pqOUCr2GTgFOucgVn1LPXUxDJII4BvrNGi9BMihcqzwNH61vrigOqL7UHhTFDi
	GOOEZG66uv2Kyuko43Jm/YhujrJb421wHwGEte9JIp6RAVMUmIrjKeEdfODieC2FNgnmhxrAXmD
	1MIKa+WMg9trAnZ6AKSEdfrvICWmq2ANaIedJRpbuK8mb4xba+WhVcLUam8+jl2sEFpRv16oz01
	EmVVtL77rN9SF94dWt71OwE3KWeyuaYVD0WPnuQOb0aQfnDKzr5jPgVrpH28GQP/abGCPfruap1
	r0Je1X5NIO1x/8hVlBdGZ/gx+sZQOG/vFeikYFiST4A2ddqU1PQ0Vv5SQiFV4d3H+yqsCZZu8hx
	el
X-Received: by 2002:a05:6214:2b09:b0:882:3781:e29d with SMTP id 6a1803df08f44-89274362a8fmr76524616d6.10.1768472007797;
        Thu, 15 Jan 2026 02:13:27 -0800 (PST)
X-Received: by 2002:a05:6214:2b09:b0:882:3781:e29d with SMTP id 6a1803df08f44-89274362a8fmr76524156d6.10.1768472007315;
        Thu, 15 Jan 2026 02:13:27 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:26 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:39 +0800
Subject: [PATCH v3 3/5] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-3-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=2240;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=IAlQ9wjSqjHi2sXh9LPkom3twHwIndc2QkvvmikUsaw=;
 b=BRX2gKz6e8V0TWE0Qdo7jEe8nKdfVoDB1q0PAiVCcYJ53QlRwT4om8ubdmD3nmrj8eDbHrTdy
 Ui6NFJL5ESiBpewiWXg88g6rQbTsH0wl+pzV2SHQuyQA4lBIYCzWsTl
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: -aP9MLt3Yf45UAXs3Q4OGGfywXoS6WbV
X-Proofpoint-ORIG-GUID: -aP9MLt3Yf45UAXs3Q4OGGfywXoS6WbV
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=6968bdcb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=RMWakvN5gFyazINGlFsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX94E+mfwtFmJP
 VlyhkDmaQmwJgfs+3sbcHWvmWNCwNkIVbLyxJuHTWNkNyjv2ageKiEhPK2rfTSkhCXUNHJmkrFt
 YwYsCNtL40dzspd8HxR6XT1Z8ntw77HjXCrgPQL30bj5GA2X8q7I6uFh7WZWVRMN+jiTxx+5HhM
 //2fFCWzuiyqUQPlq/xPt2Ial6A0k8AX7igtYjNTVeshRbhB4RSikFYpYGK4y98ChMNm0JCaRm7
 rsRs3oX/h8S9uRPa5jcTfdx5/dr1igIS7PCuPKl5VpzjuJPe36d2UzANujSxl4RUnQxT54MyrGm
 V6zc6xagIkSwct0k1hygHxJuEfm/3MkClFgvZq4NBpO779HhuVxJJmygABqJUSE+Mb7/8sphAc9
 RiMHCYY2sXD9PBHa5nAJSzDr4T/1rIqfILtnATE5jfJQnnzI8CkEw1lDo0cgrx7w6vP/w1SX8vU
 KmgT9qq+KUWHFe7vezw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fe59975d56d6e65163dc7fcce8e08c50fadc3786..162bbe353b62342478885f22972a816f1b60d820 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1554,6 +1554,22 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio34", "gpio35";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3790,6 +3806,41 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000 0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "bus",
+				      "iface",
+				      "cci";
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1


