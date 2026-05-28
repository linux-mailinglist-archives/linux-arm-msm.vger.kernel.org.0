Return-Path: <linux-arm-msm+bounces-110039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAzTA1CqF2qhMQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:37:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EF05EBE1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B975C31687FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 02:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF73E3090CC;
	Thu, 28 May 2026 02:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpNKy7Ls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3UDR4HH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37452F7F19
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935373; cv=none; b=LhUVNDOJz2Rk+KmVY5JA0DqCL0r63FtLcriYSWkjPvHCrFrii/rLy2i2pxzdC7MTr8Ew7FmFGFzobzERVO8wt8sAwzzzpyCByXY5HVZwUBqe08Ehp5vU50tu1IdXTnYSgRER1w346jc3eH8YdU6e6fa2sdV1QQAJF97DTVOAVuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935373; c=relaxed/simple;
	bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pf0RIokgGBoMs1+QJdzpOh89xSH8z59STH0HxC4FBAP7Vr0RiLEroHFgRL7kFzv3W3rnwDML4ICaZb/LPZjI7nNJPTlPqKje6cWwI992QH+VhDxYo6EK0G2p9x61J3OgcvUTcbppVulr7YDmXSIT4bIwn3IKYUiNylz5ZGsAxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpNKy7Ls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3UDR4HH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKlXwO1975743
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=; b=CpNKy7LsBQy70RHr
	Sr9oeufRQjLPz14Uh58H2MUt9x7ilPTalznpNKLBQXC7u0ScyOOElFP+LFI6Mlkl
	NHIs9VUYuvqGTpSQrCSYnlWbv4Da0ltHUWkitP/+ORCanavYb8uOdBuSBZ4QGilZ
	ksll/JCJt3CBqRvcycxRqyUYkw3l12L73kXaamqnwa7mL7/gkUBStII8f/UHIHd2
	xIrCCQkDhSTcmKeR5JR/ARb4NYlHtAbIc/1HxvgHLmTznwsFQREbRSLSbq3UPs7Z
	6q2bNt2pDFbUTUVTP5PB7GT1VF/HT0LKZ3DLYhjz8dx+BJIwDdMbjkQl/d9eq0YR
	t2zMKA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3ryg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f5943ca81aso4762253eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935371; x=1780540171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=a3UDR4HH4+HTq49M2rfm6DImXfxXeSKpsShthGTVo7kK9Z38UfE8PpV4HsJLZaeadg
         ombZGHEGc/LrPgQU8tDRfRBz723aBhCMb8jIjAIrPDQOaQe/xb1srneqAevolMmd/8rs
         tBfMD9QRwubReQ9nIQEo6MhZnJc2dB6h9jiKOapRET/OXuOawU493eblZUCXy4PF4GeP
         MheOMOG+rMPoxB6rAvY/wTVTb8StPVViGjkWlF/iU4CBXp1aO3px5SFZMNb29KkC6iKi
         Q5F12arbPsR9qJjE5xqYHhMTQmI9yClwb1aISi88Xtn4X55MZQhfQdhgHpIUcva53L+2
         4Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935371; x=1780540171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=bIR3lFkXGW0Ux9JDw9Wdohjl/ucaiBFYyBUInSRtkp0dm+kczAZoDkTJxyFl29TqeR
         IIFYaCnsREB/jjIXmuybfkTpujxNYAnBhyfo3zdBtcjMcZ++vgNACvEOm2r+YgYkfloR
         ODu4mZTUL3GD+Z21IDLSWtNO692eZaK1lfl6H8q9Y2pNUkd7QXJX14ZnyX6cqhPekHQu
         DeEaXuiPk6hVWTKHoQmTjEhe2DPWHCyM+j1Bkatxk57iKeAN9hlX8Fv8TI1G6s56QmW+
         QoaCBpn+HWbtwvrs2QUWXU39SInkxS5KjhifdH+PNR+WRm/I7ApL4EkSaojGEf0h+6BJ
         ia2g==
X-Gm-Message-State: AOJu0YwivJxIwT7ofyPriJhTmnIS+mqYFZYj1C2oIV0T0gk5oqYHLtHP
	Uhc5tX3rY/WHr3dsZL3fmGb0G7xMa7Glg4qFfdStSRg++83gSeQNdo1qTRESM6GMw2xDSNVMJGb
	psyY6TWgZGZxSA94gonttMiaOAZt328kekKLXLYe4uO+WG5zMOkRRpg2Eih3h7JWNcXSH
X-Gm-Gg: Acq92OFbAdM6eZ+51zdIB08GcwjZgEpSae9+5q88wiZRwmtOHRJpWJWBxDNflFx4R+A
	dyPs9uRrJBTn7kOGKIzjA3Jgw00xu2q9bI8My1OZRHoi6o2Yd0eOTeVA2qbB1nv3dN4HTVrPhe0
	ma7AUa2gk3dAitB70NYAps8PSOzb2TjAckGBo+BeQGKdwIH695JYAs0NHpW0PkpUTk2QYiCZHm2
	8eIBhn4D/7pkAVmtKyVvLreuP0sB2CumheIJ0AmSY9aj5vUo+HB7+kmAj2C0qeY0yOXyElJ5nCf
	QmmlW/1hIcmWff6fXO9vtXCywjBoymqAqdcxhpmK1s5StPAETGIoboHX2Mzf0v7z7LKxQI0RAbq
	TigxatM3a4E9jmq4OsMQ1CpVsvK8iSqOMENmwQEaOB4mohHbNgdNpga0uyJApWoW80zrYo4HLju
	eL0Eo=
X-Received: by 2002:a05:693c:63c9:b0:304:705f:e4e8 with SMTP id 5a478bee46e88-304705fe96emr4415251eec.32.1779935370664;
        Wed, 27 May 2026 19:29:30 -0700 (PDT)
X-Received: by 2002:a05:693c:63c9:b0:304:705f:e4e8 with SMTP id 5a478bee46e88-304705fe96emr4415246eec.32.1779935370137;
        Wed, 27 May 2026 19:29:30 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:29 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:17 -0700
Subject: [PATCH v4 6/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-6-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=1791;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
 b=eYyn85cRgwDDB/YpWyAJfuJjduiRtwbqwZMpnEsTKvCOI3RVwRimdZ0bP1dbxHouGIYQ2qeVZ
 R/P3sr11VDcBmNvu/Qzj4kCqikqo50jdnj2dEOFvPGXkSYgQ6gxQVAx
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: pFYUckw7Qp-U-rLmSWJrpCJ5g3r0FSoB
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a17a88b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: pFYUckw7Qp-U-rLmSWJrpCJ5g3r0FSoB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfXxkjSabOtS1GY
 gtudIGSAXO7P4kqMsv3TPVvZN9EH8dWYKjGKEwzYxg+HeqHYYnC02k4M+FdKHMwMlPMR0YXis54
 J7fVwuk7gcIrDRVGUCuw/nvybgF7mB9DtxRwAWQLqf3MH/Z6P0Kgti8zstdYDp8sVcDxoVr4RIO
 kGsYYe2+Qdzl5ohMTK9iHO6eySKH7HJx6ij1UWD8LP7O696pLUfAz0JqKK0Zg6ynsv/2vxyRNCZ
 tlRIoff15VmSI1aX6edgkfvrtgc0fHLPqz1MkUtlTx3niiYHOSE4hw0rpOh8lIDmPpRc+AGFojX
 KYAwY+lhygiICXLyaFvoIIp9zLlfefPdEo62Rr88Q/DEHUOgf/3WjuPes4Yflrg1fL3SLGS7AT2
 OciQQ45expFmQknp9prIS0/GCSNyD45LJf9n16lkSh9ja3H71fsFlCY4bMxOFR6T/62+a//3aBZ
 SuMVvpB15MWJImwsIdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110039-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8EF05EBE1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mahua has a different PCIe QREF topology from glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies for the PCIe clkref paths on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..8b42f5174b31 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,18 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..eb45adc8a0a2 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -286,6 +286,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1


