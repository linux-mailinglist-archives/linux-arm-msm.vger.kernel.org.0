Return-Path: <linux-arm-msm+bounces-106670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCE2FfLL/Wk9jQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:41:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C034F5E2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E7B8304369B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC87175A93;
	Fri,  8 May 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xebmvqyr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihHcfF9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D718389119
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240484; cv=none; b=Hs86dprbUhF4CK6ITT+3qyRFNIvfjsLVV7PzZAc6/zwcoOIgDQ6nkH1iL1kFhhbtOfRa63uxuT9yH4CC9a95/Ha/IcYRyxv5fFfIOW4t+ruuMnSY5B7Uwv70TFj4NyFaiBP/1hYed1vBGd7agXO3cnJQ/y4lgKBPYdSUFyX/+Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240484; c=relaxed/simple;
	bh=LrVQzvK3aaFPI2VJ/t92Tum+Ag4s5MXEloeYF6b9XwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMj79sJquOgJ5bjvjTzmc6uEQRnl68oQ2T1ELcgSn6RUYx3qAe+xv17gZ9qMtNdvAXvggalDv1HzX+fCMsJLk2KKz9uVG0TSRKGr1smmhwunYNOztKk84YnSBdFwfwi2GCn0/u1Ffo1tU7uL8fqOF2HilMVXsi2rgxI3LZnkbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xebmvqyr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihHcfF9D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64863cH31173965
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=; b=Xebmvqyra6sMtzTX
	swcqjpfSqrvDMUqUE+Q3d8+0LuBvOi3FSH9SpZ+rMsHP72xE+bDtQZ2qF2GCTD9t
	iYbXpzdA2RIOyS+ykSFhon/g10NsJ1hRNzEoLjuQ1SYyc0jT9Bl3eslORXxAyQKU
	sBHy2A3g4s8Cg6Uc41/K6RXpFvmu5XLeU+n9gRQqxzAFBDc/G6QdEpC0b59ZSb/w
	FOY0IbpkvSfz33D4jFnPkx77ABTrPhDsaVVGKJ2hov6CttpuipyiGQ4u1CqHbkgX
	wm1RFdWKjZRAYtlTxk4Ve42+b8HJqoCx4+7PeVWJjHaA2vSjB7I2yFSiM/o9/C3x
	yD8y3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132haq02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:41:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ee454b1b8cso202224185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240482; x=1778845282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=;
        b=ihHcfF9DjeMorbsBdRMooYXTRqwV740RvzBA2M8F0creYvrbjXcTolfOogU1f8smrS
         rvCl3grUSyMjXepyKcbI2UuthMKA9NyRAkK7a40TSkjwnFi4mrbYYvj1yB2joHHN+qpJ
         3SgmysUSqWPugsRMvTNCBhDD0y7imG3S5Xu/4QFECwKqfklJzsNt6GLQ6oW/qBg/rSmD
         quLniHvWnHp1CKdS4o0nhsrLJBFlDhfbLKHoxxmnaXIW0EPlPE9M/KxDkDQjNfF3lY7e
         rrMykKTDHSOfXk4Td8Atb5bDnqp9NPDJuTRlWDUNt4EpYh+ROcY80QD0TP7Lf4kLXzce
         lehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240482; x=1778845282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=;
        b=KmY6edXtmlXPI8m4mJnzyJl6TP482LcNFnclgGQj9MxbcNlNuCrkfIpwuGeXqWfnbF
         HVa6ZWdgaqaKBBnxiixEk+o3K6nuCMpIW5hd5Czyg1pxNc6VorPYeyAn7uIIxvUYvSLI
         Lipti335HkvabCvZ9kEoZw7wy6wiJfQZmwxDtdr7sM/VlHF6lMqHZPWkClz2h8vU/D1u
         ON02Ogr+9ykZEejjyWSubAbPbQp9KiS1P5lFKR38Lj9mONoQGwkdbaq9Gl2ujU/D+ItL
         3gQgkJuhdXzFm1D1PjD17tQdtRq93vKAwUwaZWGX+qLlFwS+/ombHU2iPbpkpXY88OJS
         kWsg==
X-Gm-Message-State: AOJu0Ywm771tsuJQwVOUCdpBBVqCr56au6JYdnJ3ztZsgWURV3f2uW/w
	rABAzd08M4FchV+cMKnL3VsXQfxPCxqyjfgAOoN+R6Rfh6eF/RUBOYcd+uHhdAcVkMefYnybITp
	kHhVOhu27ALwZxHi6EzlreEH5yfAF+Jh+dXyT7OYXNy/sjqGUVac7jIEvk9RP5GRVlW6P
X-Gm-Gg: AeBDieuPp4zarXwe0wyPS9uCCAC9HM5QdHmsWLRhX1j5wNRZ5zpGgpUl0Fpk/DoRIkb
	RxOnqHwRUwrw8VppL10xGtFEHdXwXYLowAh99pMx7I6nnW1grlRuKxRGzxD48mB2TVbKHOii+O9
	mpWsgW5+vK3es/84QqiaEWuVc9zsnB50T2btE9Xnrrhz0Mwut+aEcGw/kSHY8k4Lp5+X9iuqXBt
	at2ONAYE5rigq+4X5Eb9y+t5xcJ3vcFildIFL6Tkpnlu98d8bjWdtk74eQFgD30IEGi38aftDzu
	MjJ5Cog4FYHjnGBIdDl96/h8fk8Vtj9z4GqjDrc2J3n5tEmgLgFi/22maxzXTTobynQjpHHEVFJ
	+nKf3cGA68XlEjvizc+8/GO8Q1kffjVwU/vriXyW6LavsYd0bB3jCwOJcFuZ+WsHWCYonrSkL5K
	ZqdutlMrKYeAYK
X-Received: by 2002:a05:620a:370d:b0:8d0:27b8:fb7 with SMTP id af79cd13be357-904d68e0a4dmr1850236485a.46.1778240481423;
        Fri, 08 May 2026 04:41:21 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:8d0:27b8:fb7 with SMTP id af79cd13be357-904d68e0a4dmr1850230785a.46.1778240480777;
        Fri, 08 May 2026 04:41:20 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:20 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:59 +0800
Subject: [PATCH v2 3/7] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-3-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=5190;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/I0mDof07x8EifLd7501yc6I3MTWZ4BBdf4ShwpUlpM=;
 b=CqwPvq9TmB48DqZyALYSV4F40gjNSmgNzB4Q9Ok04YbO8qTyGp4xqlb3vxMKLnirJRHw4MFZd
 pdss89cjjQyC/IzDy04KqUE0vjKKMazgFQA/K+rIFFMJQRDoChTfW6K
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX7XAFY3NFccq/
 V1yRPWO0sFywLUYixY4PBMus1Ril7GX5LI35WTtOzk/OJTp2KwyQDv2AB+BXgZZQ9Czgxblou4W
 jVqso0cNU1H8lfexFocdbnzC6yOWtm72aFGqUfvBojFPQtb29ZxNcYhsSscnu/bIkSTPdQ/LMDr
 gzi5BcHjw9tAbEP3ftFZN8mfJg8QSFLuRdc4AFwCtkfgZrQrIosYy1gUzgg+/DYGruODaydgTcQ
 pEyMxcKCYk4b0XG9y7mkISqhXLCCds8+DMleh1b9nuUMl3C67M8exsDhyT8S8FojEUQYn7Ar+f3
 o/ChnkvxHoj9kGVw9dwbfjOS4vzosqmrRwLnvUIMunhlWJ4jTWjyjvyfpv03VUAxuBBy+3tLSjO
 +i2PH1Asq4qAMT95XrjBYQANwARWPwyElRATrC+Z5N/Tf5z7DEncPGMyEsrZXJ0wqEhOL4QE5jL
 2ZDwJOb4QVRF3m2RfxQ==
X-Proofpoint-ORIG-GUID: O0_Gt2PAFhkkrwGzMqeqGkfnE4YnptWs
X-Proofpoint-GUID: O0_Gt2PAFhkkrwGzMqeqGkfnE4YnptWs
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdcbe2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EFDngOt3UxJXKfoqbMMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080121
X-Rspamd-Queue-Id: E3C034F5E2D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106670-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,ac16000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index c31462ba393fd77b7124db2ce680663945e7fee5..74d6e4300506645a63e09490883eabf749829e58 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5551,6 +5551,84 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
@@ -6201,6 +6279,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.34.1


