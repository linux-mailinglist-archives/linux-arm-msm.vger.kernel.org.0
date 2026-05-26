Return-Path: <linux-arm-msm+bounces-109897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M0IJUbVFWrRcgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:15:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 374745DA76A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C3FC301A9BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FE640B6CD;
	Tue, 26 May 2026 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie5Ycloo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eG+ZT9H6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B405E40802A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815619; cv=none; b=ZnhrtjcgjxyWTN/jPzmm+gHw8s30KI5dCRv6iSqboodjuN0eFz/dIA0eKMM4Pj+J751RdGb55wAcYv1XaB+O+59LaiF+T0b5T5jfbulLHkMtoqB8HOWpbgPvRIMS9Glam1SEbvO3Ui2i6Ec8c2A7321+KxXTCaeQZQdLHLy82MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815619; c=relaxed/simple;
	bh=sB1CH5fqfkvydQKUGQkQAAWvvAtcksY1vgaxmjxAO3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLGAvmPozEqDviZW0xYgBDT0st/kg9bxwqXe6w0cVcMER7hVJnT7LeIR7IyJF3TSVCJod59yx1t1hyk98DaI6qLZA2Wy5epFzJ9mxlmt0L27C7ZQFohjePvIdHzEfPu1gbhGX2pEBRfpNC7wwIwFb2OByOfcQJfzN0+Dl1dS8x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie5Ycloo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eG+ZT9H6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH0u3i2022394
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=; b=Ie5YclooSa+2jjm+
	azDNWrWUux0GlIlJQMFIR2ueQrGqWRhIVaTDWjADBXdx99tdFq7EK5gZlUDT0BJd
	kehYR9JUwXNRi3S79lpV9uG06MSYShkJDdW789uCs4ew8ltvPxf+CK/H47GWR/UD
	gybrQBqbJVJtCGnLlUvA2muzqFi1nzrGAY4zuSrM40cXmqQ1EgkbIrd1y7s0b6a1
	6AkIIq3G+JjnpCT3TD4WEt93mNQsHvzDw5bjovGiAOaBdXvT9rtBFexVWCSXUyKZ
	gg0M+HnEDegjbsDorfS3H1ieWPWjyV7woA45JLja91RCii46p1L5j4JOw2J/vm1z
	8ePCrA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefugf84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8353b042152so12059091b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815614; x=1780420414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=;
        b=eG+ZT9H6PrJ/jpp+8xV9jSdefK4vBY2YBFsUlZ7Gz0q3YyIsCPVEByEljBbIMbT81o
         KRSjHTig14YLtWGQzC9BNLStVc4TL3RCoMOIxtqqp48cB8evcaJykxnBGhmGzr7MHQCc
         vCoQnHanUYc+p2mkA+BqH4I0WlAU34SYBaVhzTVRtiaXtl32JHOjzW5lhzOENZncJ+R9
         fQNVc79FDj1bMDC+B/AbtyOz+WxlXfOx0W6aTD2L8P7ZiU74qH2+/GMIfgSoPEjQAZWz
         Zc+b/ydjX7hOwIdJNv2SAZ9vao1kl0h/P7aw3z016DeUIFs4B+7CSZl2RcT+VuxKhU4w
         2+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815614; x=1780420414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=;
        b=KfyT8iA04e9DnEI24GepQq3k7UtwuImnoSiEZmKu8cyEiTuoRS8xAKGC4UKGLyH+CC
         5XrNAiSCQWcca6uLiui759ONMRPkq3hrTJSjjhSi/8a08CW4gnRa0moZXJAW9lVag7b2
         6TYRVcGPsqU1ILTVqtcSGtbONp+P4J78CFhWS3hSDDJn5S80Adgql0xfDRqQJ87d1R0y
         ByLJtSm/GQco9EtGEQI8MiaD0924era20sCBb6B5JCXYXhLAH2itZEZI1y+/DPoaNBss
         ofQMg2Aw7b8owYdxD9rHLG40QS81tFo4ELDU+eD3gjB9x6dxJ5vR3xO/X0cKzNV46cSy
         6rYA==
X-Gm-Message-State: AOJu0Yx0BOU198tnXRc6e8RPxi3KNZ2DfZi7lDlp9SgcvEEpP5cm3Wwh
	MZ03tdzzZXcUZ2B8SGS0zV/Xmetrz1bFf1GHTyucgemLunAeqHyWkH/YEal3b8OXedWNy5q2Yd2
	7KgFFgSqbdx7AUzwQPqKdZG4mCnMuvjEifKvD3eFfH4GWmOSLWkCqX86GLw8nCb9vju7N
X-Gm-Gg: Acq92OHMvKwLQwwdenHLWaV1uy2QrynPvNNwbQlLuJm27YKor0zfywv1HT8D4CcmybB
	brh9idsUbscmT3lqx5YXlSY+L27Dnm11viOznEkoVGXh9nzSdEcGeDgXDY9vRSupCDiMWN1ecnh
	JpBqGMW3UatjR7GigwtgeIV6JCOV9Ay7+tr3G7K9TikUGD9sktcSctN8EJw22JmzU/zYG7uHcds
	6s/sLNbVVLYFM2i8f113JHZYvOH21IYF7Lcdb2ILlYJEtQ4DNo7B8UnHuyBq3uBuIXuWzpZQsAi
	Nsfmcgjb9veidDZFFN3W672bOEmHkuDtrnBHaWyVUe5kRVVmvNsq4Z48/lujowmt5mgcjo44PuK
	YgPjcLW4mFWxOvwUEA3vJBWmET+CM60l0FNI1MEAYN78g9hCyigQA
X-Received: by 2002:a05:6a00:ac8a:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-8415f158babmr19801918b3a.12.1779815614345;
        Tue, 26 May 2026 10:13:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8a:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-8415f158babmr19801887b3a.12.1779815613876;
        Tue, 26 May 2026 10:13:33 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:33 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:49 +0530
Subject: [PATCH 5/8] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-5-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfXzZRK8IwvwfK9
 O2sTajRHqkzYlsmHKUwJGJlKJanuV/w+COPL68lCnP59BNg6anoc2L2R6FPtVdk7kEostCouzpU
 Aq+iPySjS+uxUi2h4JQwekdSGbXVdEv8GGzYhHxwMv5FClwWNNnIydHrhKsyA+ILqc59vD1Jlc4
 2KbpIus28r/8dqxjUME9k95xUtvaWOGkq3Dj2ZwQSpc0E17jVJXAOdvFErgADxy32B2Xem/axiB
 QAVeAIJAuAFych7IByS+KwUfJu0jcbuSH5Y+8GPyRxVYT7gYPgwqjky6GnM8G/VG7lywKnLXQFY
 kIjy5BPPia6biSK3G1kbjPjUjkvnNi4vbd9wST5Fxti2Ex1BqDkRP9uXT9UFFOG5hcDttLmY3tO
 YbrwstikS7xfND3U+jbTIKBKwUKIs+FYGflwlIeMbKgisSM/+d0NBB408Vy2EqC4MBvfLfFDrBe
 lK4SGUSQF9mCeo27sNA==
X-Proofpoint-GUID: -VbL7E3263XxG0Gv6TfZpwdKscddAYtW
X-Proofpoint-ORIG-GUID: -VbL7E3263XxG0Gv6TfZpwdKscddAYtW
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a15d4be cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XuEftVTFR-VjiOTT8WQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,4ac0000:email,qti.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.1:email,0.7.161.32:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 374745DA76A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8..46de35971f629ded990827ebd76134e652758ce3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
 			gpio-ranges = <&tlmm 0 0 165>;
 			wakeup-parent = <&mpm>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";
@@ -701,6 +733,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
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
 		};
 
 		qupv3_0: geniqup@4ac0000 {

-- 
2.34.1


