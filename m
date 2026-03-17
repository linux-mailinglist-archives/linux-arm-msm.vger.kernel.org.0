Return-Path: <linux-arm-msm+bounces-98087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BysGeoEuWmEnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:38:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C8E2A4EDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9AC4D3013C69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA10391832;
	Tue, 17 Mar 2026 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdHZxrn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lm5rCSzK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FABF39184C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733078; cv=none; b=PpI9sY/j43MuFlJjUcdO9c2AHdThXtbXQ2ZjdjY30FcMEUQC+KGCGWSbQI57rIzC74k9pa/e6wbvKZTDyMYqirYz7JGkkr5gehNFtfKrjKh8CZUZ9hrHtCqdnyMh/QYV7YMnZ5c72ez6j/j/hgWJTGRlHn9T892F9oTo0C7PltE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733078; c=relaxed/simple;
	bh=XViG1o7NK/fekQIuGZGdtzGD27y9g0O5/gvLZEfBBQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGWAeqMuQ6FSYD/RrZ4ChK8ddzeZggb4emocUBmc4RvVSK1SLKgh4UJBaYVqtHibLQFOLykNskKiAGm2hBEbA5/cjIQP66mnOqQ/cWIfOL3ryTrntJ9zYXfcLYOocVuHSYw4JUuvkv1UT9kZSzw0+tpPaXFgq8/sw4JPrZ9f6ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdHZxrn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lm5rCSzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H28Ic13101974
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvM9E+8JJx3jc2ADC9jNU5WrRrtGusv/wpsibJtmLio=; b=UdHZxrn8vCKJpxPi
	xsI6AQT9Jamc3I1bSv/bKB6m7lIxAzhywkcRCwQB4YmitYKlUaxHoXmURq7FKH/F
	yQGY6YHhe0NXgZ6/QHZwvuH03BN7mSGRHNkMQOEL1GsXY14s5/9j1mtI6gsm/+j2
	gHZ0jRbZ1Z40/cSR4F1pa9CrlXXyt6m+hCmI9aNbYeEUqcJXBFZ3C7+Q9f/3WqlT
	iYFsU1cTN1NdZGTRbpcDO0ainHB3snCG8OHVSC937jXuxnI6sWgyA2QEiQi7qSrh
	Eu2Cg0S+EixqRr4VGA2y4/mviavjK4uCdKcvEOGVY3wpkmGop74NmUCeX5oCuaL0
	Fu6/ng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7apu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:37:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c44bf176so5981511a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 00:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773733076; x=1774337876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvM9E+8JJx3jc2ADC9jNU5WrRrtGusv/wpsibJtmLio=;
        b=Lm5rCSzKHdeGROx7PmkN97r7suCevJ0Y7galv3A6/HPe1+7g6A4c52JOBaaX2SJxMN
         vquM7t541nnmQsVG59ZponqnJd9aoq+wJVmKsfj91t2fbbs0M47XGkXpW67gtX26/BmD
         VcjC3wxrO8stb5qpNMVNj21p7zvxXAYu7SkNfm+HgOLJKa0C2xu9KsySG1jZOxWcWCST
         /gTX5GNAHlW4R+5PKVftw2w74qRKapU3/OIol0CkUp7OEqhxurPrcgl8f36T5lDF6Ct0
         3TFkvd38+xONOHw5CJgGSE1DTlMa2IDWEqaX9ASbI9BErPsVKwhxfrYWmic5L5N5Q8RS
         5tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773733076; x=1774337876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NvM9E+8JJx3jc2ADC9jNU5WrRrtGusv/wpsibJtmLio=;
        b=WALQWCm6Vl4l2g8FNDRTxPHBP2skDwB4hcZI6nW6Qrdyv4hIvB3BVTj2pZlnxFoZ8s
         JymIdswgI6cmIOCJCeXjg2fM1Qi2HSLuzkcV8k4bCxfSrfBWWnGS0V0HOyEovhA//aIV
         yzzLDuhyPOaGAnehabswyLTJSUogADhdqCuvp/sQ87vIRe62OpQ8Rm6bIy9kh9J3zOGP
         PnCUoMB/uNFXAsa9N/IlOUcx2rb8f1SaS6o2XJG8UHxgV7pjlphSLDMEd0M0tQNUlZ/B
         2EiPB0o+fGyynqZe/7ne4FgogMOt105j27uTlWxmIqfiMJTqJwh/QDFhnFm1CRTw+OmO
         UNSg==
X-Gm-Message-State: AOJu0YypVAF86rAw758y8F+qDzV14vQhCrtvabhUB+YKH+D9Lwz1lMN5
	+ovbOGqO8GtAAaXyLb/UUL44pWaEV2/rBh+RH7ezOtUP9oQZeEdeloF1vCGPtZM7s7l9w9mU7rx
	aDli22eRGNmC47Q2lljc7r81DRhPGGCNcmDCg5MX80H1n8IK/1lNDzCVGBb2pCEoQuCVf
X-Gm-Gg: ATEYQzwHl0JuiPzZ6HZCEfaicl/efzHesdoq6+hde+g2Gj2Wggh8nkM7ni6GbA5WmG0
	RDjBrHUb8an+bLYR7uiwfhTOoGt3j8ps7S64ZMgvW3qXgah63QPPxV7I+QTgdnkKE4PwstudHnw
	C/FZCNxua4gfKwWO3DGnwTBl4yUaPDdguIaNenva3qehYlTFa1l7fHprndVc3+mHqXIfGxgsnxZ
	wQvS+iG2laE+hb2nvZTxCXLnENVNla1PIMrMsJJZMOHNpiXJqC6eutInBpMdDn5WtO1XTNVocuR
	dJHcOEnKwbrsFkVhnfADvvCeiz1M1RESULwWyhyIOusOZMdrN52NAXBvU4vd7OHjzlLCd7q9T7G
	Rgg5svoAHUnsfqHnNs1BxndNYuSsPG7Y/e03KfcHlPLsC3dB+oNqg+yVkuw==
X-Received: by 2002:a17:90b:1cc4:b0:35b:9958:4edd with SMTP id 98e67ed59e1d1-35b99585066mr6374929a91.30.1773733075968;
        Tue, 17 Mar 2026 00:37:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc4:b0:35b:9958:4edd with SMTP id 98e67ed59e1d1-35b99585066mr6374906a91.30.1773733075449;
        Tue, 17 Mar 2026 00:37:55 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada2bfdbsm1954913a91.3.2026.03.17.00.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 00:37:54 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:07:07 +0530
Subject: [PATCH v5 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for
 PCIe0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-industrial-mezzanine-pcie-v5-1-1358978517fe@oss.qualcomm.com>
References: <20260317-industrial-mezzanine-pcie-v5-0-1358978517fe@oss.qualcomm.com>
In-Reply-To: <20260317-industrial-mezzanine-pcie-v5-0-1358978517fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773733066; l=5090;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=XViG1o7NK/fekQIuGZGdtzGD27y9g0O5/gvLZEfBBQo=;
 b=/FLTOKIVA2QiQNYEZ17ax+GVVvt30NlW+UiO//hedsEKit1d3Bqkhy7DfJ9p5h2StytmV/1+b
 XQSmre+f15/CiOLWRZ46G8+L9o86GRQrYFVpego+WWZ4qDKHIs9BIz0
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA2NSBTYWx0ZWRfX74koUYBx9qQx
 93P5yB1yUbXwd2Zuzx6s8ti7PiRStrSRE/UXimctojanxrkIDP7qDyoB7W+4kcjVqootYO03l5D
 g8D+gAmwrZGfUyjbLMFqYgwfxsnOGVlBif2gCSfXH2M+4GiE0gfbBnY38DAnBJ2ihS0CPFVypoj
 teRnnsDK4SfFPfM832vXzBG9P1cvYvUyqMp6a84RakJp8BXGk1WwqMZJAqNDNBh+rf1cfA6FW3y
 t6Gs8U8O4AdJVsBynyakck8LFmeKJiyd0K5ehyE+OQkLev2KoBNi/CKNaQAMHP1y08CaEGFtki7
 0kaEkwCs4Z31s/XmUFe0nLcIzG0xYUybpH+u2PswmoAKwWps9zFBUTrGzr5VZK5JzxzLR5F4C28
 LmZoMkpiN1qLYww97d19lHTjy/+5lMdyiicvhQY9o1AzHY0O2GgLMZs1em0kkgJHesOqD5Fayb1
 yeKjCNQotn4eAWGlcuw==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b904d4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RBLAtJqH_bkH6XPhXP4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 3aoQeebNb7wmB_aqXq7NNECgRywlkTIX
X-Proofpoint-GUID: 3aoQeebNb7wmB_aqXq7NNECgRywlkTIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170065
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98087-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,0.0.0.1:email,0.0.0.2:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65C8E2A4EDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a node for the TC9563 PCIe switch connected to PCIe0. The switch
has three downstream ports.Two embedded Ethernet devices are present
on one of the downstream ports. The other downstream ports route to
M.2 E key and PCIe x4 connector respectively. All the ports present
in the node represent the downstream ports and embedded endpoints.

Power to the TC9563 is supplied through two LDO regulators, which
are on by default and are added as fixed regulators. TC9563 can be
configured through I2C.

Since PCIe0 now routes to TC9563 instead of WCN6750, disable the
WCN6750 and WPSS device tree nodes to reflect the actual hardware
configuration and avoid probing issues.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 167 +++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 619a42b5ef48..ad2795668ec8 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -5,9 +5,37 @@
 
 /dts-v1/;
 /plugin/;
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+&{/} {
+
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&remoteproc_wpss {
+       status = "disabled";
+};
+
 &spi11 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -19,3 +47,142 @@ st33htpm0: tpm@0 {
 		spi-max-frequency = <20000000>;
 	};
 };
+
+&pcie0 {
+	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
+	pinctrl-names = "default";
+
+	iommu-map = <0x0 &apps_smmu 0x1c00 0x1>,
+		    <0x100 &apps_smmu 0x1c01 0x1>,
+		    <0x208 &apps_smmu 0x1c04 0x1>,
+		    <0x210 &apps_smmu 0x1c05 0x1>,
+		    <0x218 &apps_smmu 0x1c06 0x1>,
+		    <0x300 &apps_smmu 0x1c07 0x1>,
+		    <0x400 &apps_smmu 0x1c08 0x1>,
+		    <0x500 &apps_smmu 0x1c09 0x1>,
+		    <0x501 &apps_smmu 0x1c10 0x1>;
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&pcie0_port {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c1 0x33>;
+
+		resx-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&pcie0_tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+
+	};
+};
+
+&tlmm {
+	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
+		pins = "gpio78";
+		function = "gpio";
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+
+	pcie0_reset_n: pcie0-reset-n-state {
+		pins = "gpio87";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-disable;
+	};
+
+	pcie0_clkreq_n: pcie0-clkreq-n-state {
+		pins = "gpio88";
+		function = "pcie0_clkreqn";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	pcie0_wake_n: pcie0-wake-n-state {
+		pins = "gpio89";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+};
+
+&wifi {
+       status = "disabled";
+};

-- 
2.25.1


