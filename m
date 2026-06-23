Return-Path: <linux-arm-msm+bounces-114216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TI+sE7OEOmp5+wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:05:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 489EF6B7503
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:05:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lkPCSvDv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gmxS1Rk1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114216-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114216-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7F673023094
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD572D7DC6;
	Tue, 23 Jun 2026 13:05:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F232D1F40
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219936; cv=none; b=N6PlFAGm61bl4QSMcKKIo+cBK7NYL4GGve4gFYk4Y1UUlE2xl0PH70nrSlbp9OXvu/zPVJ+A9hHC4HWaMMUXMT0mrqoi+lZa2sBYvPw00U9oC6VsAvinGxEiBgTYfMV66BV91XZrb+zH4VQqGvqQh+T6f7JVs88hpv/YcVBqr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219936; c=relaxed/simple;
	bh=smafLhLJEyw2iNEacE9cOrBfHQUswwkZ5s1LBtIJeG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMKl4+6VC3GL/pQojesobjJt2j02G4PB/v1JLB95WFPxD8ziaI9d69nru512XMsc/U67DHFTpvh68i2xUcr/wN7e4uXJNjPyuBSwXV7aNRK2PWW/FvWs7+FNPEd7haXL1rlriKkLhcwjZFY6Dul7Gok8RFjY4pBwliUfHS6O4Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkPCSvDv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmxS1Rk1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXoEW3668845
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZEilT/cbhc2S9bM/NCuST9uY/pwrLjDS8ZeCvp4RJE=; b=lkPCSvDvwwAjFhnY
	jt5EWZNvC/9R+0phaE1zmAlMjMdi4cjLcOrPa6jBbJPq+R77u0BjByaaSZJChktW
	fsOkLJ9CvREbPk15y7AZCg7hQcINjO0Ju+OL4FNy6L2o8pe2WnAHfnxNH+6X++i2
	gN2IpOd1mymebpctIWUX3zm128lhKT65AZOyI7A3Zi8ryasBBSPD9+uLCKa30DFl
	c2GWMYatKuRUVGLu840XQBdNT65ZPVSuB5v54n34A11Av3dDQ8Qy4qAUpqO1G+tg
	r51E3JqILq4XkjbgclbxqVgmo8BoRqf0MyeU/MzmEt5Xs4nGCSI9cz/e75O03DOv
	MzHSSw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyh2rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:33 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-806a62af18aso13942237b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782219932; x=1782824732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZEilT/cbhc2S9bM/NCuST9uY/pwrLjDS8ZeCvp4RJE=;
        b=gmxS1Rk18MwmVbDHty5/rmzPsU4eKjpinXwhoLwHwGeh2H6oGvYyUNyCMzxRL0nYIM
         4aqYWAC0geWaF6eiAsisa2+CexHKFxGCGr7MWgGH/xAk1DvfLgtqx2Vsg/G+PBe0Brw3
         O4roPRaomCXV4IrEuBFT9T2RR2JjcB41XWm0yYfCUL02izJmWKx3SWFPGWagxYKQ/pYo
         v8H6FKDr44ztHwwiJ4u5vp+4o7UjhuTRJY7Y6GnTgDvApztS7SSv9wp9VbD4PiUmXOh3
         6gxyiiYLqBzr2HiE/TgFfkc1SEazTR8kOSnSVXZekb07sNdfMPbKkUGyByakebDYHTuG
         NTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219932; x=1782824732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XZEilT/cbhc2S9bM/NCuST9uY/pwrLjDS8ZeCvp4RJE=;
        b=ReoFrvC9ye8rqQJSRznMM2u+R/iFtoO2a5lxyj7i/TOarL76bum+DOqERuSw5X2N7k
         qXoVEEE9bScB8S25GpiW1NaRA1V/JPFlbmepHmlIFz9FunVJnfFOHN8h/QEM/ur6dRpk
         e5BWFIqTxBF7DBDpDn3bcrQYuuCFBLU3//RBf+BgVcX4O2gAHuvd9IzKIt1HHNOBDl+q
         I2ye/P6pPRU5tx4rGIztN9SgUN2NmTwkHDwkEqfbyvBR0DHKguXVp2tE27meXTJ7+ryG
         s2czVGMUU3l+2W1lOOUhv19QzkcG1YcBpBoyvcI4UaOLNtPafUgK0RmulXGk3oY0llpz
         AhiQ==
X-Gm-Message-State: AOJu0YxkQSMTioSw4L5UUnq2nqRHmSVjysuUstUGAO/j7eOjMe8rmtBx
	PzrqNQTDQNmadNhCkhRNGGMZcssxQaS2XQcKMWh+3/iRKXFXfW8LqxJpPatiuQSiD5rI8PMWU+z
	wGDiGNRE0eLcUhlGC2eL7aLCfMFupC2CSAZzyENHKG+ljbP0rGwSz6mODoalw1qQ92Dr4
X-Gm-Gg: AfdE7cmAju8wX5heOdWSRsK6FdCbWwwZg6Ju7J//KcjgwYWHz04XKDHH3J8hnm4MR5P
	KEZZ2nhAFCi1H9/LEM3290gMQN/og7X3vZreleBeImQIFgYpHE0PjrXbof8cMWWZKf75lNDDk3I
	If/QsL5RNskRit2+8MeSib3Z6SZiX+VwIgQAkEJk/3inAZgrMX4I0sTeFoLZ2k2qk3fE6III8gB
	SGVENdGxj2A6gPjzLI1mPrjD5anRi98R/w/uVgv1/z/cf6eGs6iNUxFtUVl6RnCxsTgzdyZunIn
	xPYenhqzryqvDdBLUS2+B1eZJ/u9/DvAKiKLWn+jNpH+fMxxby6bhIl9lg6Wu3KXCjiUTs2MUqv
	evyuubuVDjJVIITgBNNhMfKkVuu6Qj5Ec08VaM/RBuan2T795cApFS5UCOg==
X-Received: by 2002:a05:690c:4805:b0:7fe:5866:a7b0 with SMTP id 00721157ae682-806df092f82mr22223107b3.52.1782219932089;
        Tue, 23 Jun 2026 06:05:32 -0700 (PDT)
X-Received: by 2002:a05:690c:4805:b0:7fe:5866:a7b0 with SMTP id 00721157ae682-806df092f82mr22222697b3.52.1782219931585;
        Tue, 23 Jun 2026 06:05:31 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc700bsm44091127b3.36.2026.06.23.06.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:05:31 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 06:05:19 -0700
Subject: [PATCH v2 3/3] arm64: dts: qcom: glymur-crd: Add refgen supplies
 for PCIe PHY on Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-phy_refgen-v2-3-4d15983bf91d@oss.qualcomm.com>
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
In-Reply-To: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782219925; l=1649;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=smafLhLJEyw2iNEacE9cOrBfHQUswwkZ5s1LBtIJeG4=;
 b=7Kd81yogwU1NAopdtPSSktTw91Z1Pmg1LdcC+9LflG5ab8B2OnAr8wt4npVlhUOgeGMPsSudy
 AXdkXs5nTVnDIItXDiaW6058DsfoTbCYjh5w1Y8PbXmcDlRxIR8jCEX
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfXyUuN7Zz9MRVe
 fdis9bKMebDLtKFRFc9JAULrxLm0TOcdkzMV7tJ/jRB31gIfThDJgriaR0bF5NBJkwY8quCRJss
 JCy6NGsXCSnUAxe6sTdmabpMaxRLX8fGOjV4QMgCjlTPi6op5r29E4aqZrKyaKefYjtO4/+dZnR
 WN1gXn1Emxabfv26vrkDH2DeYyaIWm5NVglpsurDfxGqnSVlfpRmM8RwHMZwFMikTuMHLrDK8d8
 7GK+JfTXK60Dwpm2K1o1R2qvPwjUCiD/NXll11HlLXDFSpmTvMAkUzcdrGiWnAe8yMAZdRMT784
 1qf7pf4O0slyhRVYf1QRoBq5ZvAt4dRmsMFK+JTugJik325/BbHCZe015CdKqExI6OwBBDe4shQ
 XrdfCH+b4watPGhWkExe9ECYSTM58CppUBYMvda8+aNpHqozuk83IsKbyyd9hYeHm9g3JtPc7mi
 AbWZ2poOPpUeDbdQFRg==
X-Proofpoint-GUID: ufI1NI1J3PkpqmSiMSAv9_nq98O8PDVy
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a849d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KHiVlrKLFnca6Sl0sUYA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX3CsWih27Um7y
 72u1NXCCEplxyzcDdSw3vDVf2TQFadYQ3pZbgHDekC4AavcVVxN6jNof48fJvP+R7VV3FAqd46d
 M/kpX8pkZQ0mrfSCwOV/fGZiwUCyhn4=
X-Proofpoint-ORIG-GUID: ufI1NI1J3PkpqmSiMSAv9_nq98O8PDVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114216-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 489EF6B7503

The PCIe PHYs on Glymur require a reference voltage provided by REFGEN,
which in turn is powered by two LDOs.

Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
vdda-refgen1p2 supplies for each PCIe PHY node.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..bdf7db3493bd 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -454,6 +454,8 @@ &pcie3b {
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
 	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 };
 
 &pcie3b_port0 {
@@ -471,6 +473,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
@@ -507,6 +511,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -528,6 +534,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };

-- 
2.34.1


