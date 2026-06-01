Return-Path: <linux-arm-msm+bounces-110597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJGYNKaBHWpZbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:57:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCE861FA86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 609CE300B466
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 12:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1B939F162;
	Mon,  1 Jun 2026 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0mrGx4K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhmiALvL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660A63A2572
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318564; cv=none; b=GOTE2/TPN28T8XG+zb8Qlg/P6/0HKm8tGRYSWnCBCngLIlynrffRVHG5loCBj9/HsOSFX+N3FxZVrcYmyHspSRcbokoz7uiUSiuwoPx8tsKmzc5SEgaC6Gj39RAgXRWsudO4oEt4/Bc2cu6qa8sXTZbAQWxgeh54VjnJ4PJfKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318564; c=relaxed/simple;
	bh=O0ITinEiBDoqyNtfUbyM/puvl4+BRtjPN1CGKUba4DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJK5Q213hflZMR1wQB7TKddt7mfYJezlT9itSr9J2qhbv11t1lGunpBgCmLJPfEhbJFdXQcSaw7iZRZvknBzlUl5yfj2493tQtptuWySLGJopxuquii9JlNqv7fh+dcsbB8+9sQ72fdNTrfGfAzhYHyyBAUIiEpWeVMgUNTxUF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0mrGx4K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhmiALvL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BM98Q622614
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 12:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=; b=N0mrGx4K4JtV1ruv
	EJChM2z5p99YNBJaVb5kSHMspT7rNu0cFrhujlGmLyB8pj4x11xQDOFc/cbtBWOd
	y3PTnGbkusssw8IEwL4ZHcyF2fbKlsy/vhF/1sYVtY9n+AUeww/ku1d0/r60JHMi
	GPeq+zQlrauSVBDOyFY0tyhWTBbezwMRwbolP6sBdBcqipa9Ie9YLDUZiFf+0PQ4
	TtP8QPrsrXAlJsFIjd7HKKxFws5bn8IHkXX3fANZi1RDMl/CrjIGPolBYywNR7Qo
	wMNouhWDPrqcns2fyxqIA2rIpkv4eis/JGgU86kA7ED1VsVaeb/GTzL7Wsuw10+y
	zzSKNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954gbtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 12:56:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c331eda3so17036525ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 05:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318561; x=1780923361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=;
        b=EhmiALvLy41HwzENteYKy9qeTxfaVbr1ZpujHB+Os6BWqqdWI57Eq3H7Iw+Hc7oOkU
         zB7aKvrn+L/h/lKvoKsQZlHhx/7k6SItlmyOgzs0ZjcU68IHW1aZPtugmROQ1aEWJGci
         XQh6r3lmngNixvMDW5Y6UO3cPdh4gsAsIZd4xhFraYsZrbstGpWgVkAvOjfeTikZIOCJ
         JoSpOycnh1wKg//iHL3KCPV9pTT2TRL1BM4SiyyyhnqIjCPwdRMXhlUtDTQ/DVvE2qcu
         e5e0pIgDrUkeEqfJ1WQrV3jGJ+lr5HNh2d1kUrNASxgSb+z7OUVrd0vpUNachm/iGMjO
         wg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318561; x=1780923361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=;
        b=IUQZ3cBChssXe2tFTyOMkk5jgTinfE7qiw85BqxszURZb81oYuMDxOIYSMkiJiS++6
         89TE40YQO1mFImB0XnmF7yj5HggzTMD9Eqhk6la4cddiws0Q//D87GTgt5haDYYSD+a9
         p0U7tzjMQrxI/BUf5lrX8Y9AR2KAAu2poY9fiz7ld46RH9ohNojLm51WyUkP19p/5CvB
         bgvs4dlPPtjWOW+oq8NfShYfe4OFmNfFoKtf1iE2v1ptRzD8VTUVJE8p7PDobCU+1DjR
         3fEdb6L5eDyCNLw1opsrjPjOf6JSP22bACQpTXG9DE0vsmmlQvlaOEswXG/1I1RQWynn
         sygA==
X-Gm-Message-State: AOJu0Yw4wFKgd7Qp/4QnkB8+uGL+VDS++5XgTisn0OaOIyiqaPGzs0a3
	eL6i/KruHrHfH29MaxwG7iC/Sr3s1OQs50fXWrfNH6O0f+Nvt3w2GInBg/tPy8mp83R7Q+vmzi+
	Q7mWje3LiAEN9pNbMpJ/HgahDbkI1n9WgetBcnIndkVMWcIandYKTAM7GeOSJcPqBNbys
X-Gm-Gg: Acq92OH9U5hv81Z6IKmARfYu/KZbuFZpKk1gKg+Bz36fAUicfwq7pRDs0JxVI62zw0V
	GVGpcbPsnfIE/fv0IN5dIJP+/VhBU58hPDgK8GYFLQvs0LLizIgzc7jiyw0c55uXKdIsdW8MIwI
	dDwxvNNeTM2JMKp0ylqtJfs89zLJgtFJQHo6Q3A4xgAzJ9jtiRxDgm0jsXbKiPUi6s6Fxsqvvqx
	OeY46LDPfMSuV2yX5yi0N0LAasLo51dFRrGfnnP8iOZu8s80xKU881zZNQ0faZgEozrlHIlztb6
	O8ugPywbkyV/PeyAovouRJSHJzvwyAIe+2rn5bxw+UuQP4JPAVQqgteYA86+Wy5JdYJlXI+HI3u
	MYKk9vjVRhc7yfM1+lMTUlBB4tmqxeOeHtouyyqNXnTwAAGs=
X-Received: by 2002:a17:903:3585:b0:2bf:2243:d4e9 with SMTP id d9443c01a7336-2bf367c1458mr133131135ad.13.1780318561108;
        Mon, 01 Jun 2026 05:56:01 -0700 (PDT)
X-Received: by 2002:a17:903:3585:b0:2bf:2243:d4e9 with SMTP id d9443c01a7336-2bf367c1458mr133130675ad.13.1780318560657;
        Mon, 01 Jun 2026 05:56:00 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm98584135ad.34.2026.06.01.05.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:56:00 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 18:25:10 +0530
Subject: [PATCH v3 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP and
 MPSS on EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dt-m1-v3-8-0fe3f8d9ec48@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780318512; l=2571;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jZ5sk6mDCOuUmvLcAvbMml5Kmz0BhTO2YLQnfm6VPW0=;
 b=oCFQRf5uugbIlMfn3dajQc67joQaFaK47HWl9OtR23I+WDu/VDYFCfc8DgIwVAldaSgNeGgh8
 cpaBde0NDQjBkq82ad5QmDXqDZjCQv6UyY5uUwbTAtOzs4wkKkbGtqX
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: _HTl6Z4-rGA19mBR7_j4JEjD-VFvBjFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOSBTYWx0ZWRfX5b1ZYRIRwNFK
 IN/LQTubs9i0kstBlo6sPcwKAXg85niaJnGhAoYEsLVLmYHGx4S1JENJsL/CFJ/A9ioXNWb2hEV
 4qkKKmW800oxgkJ3nF5KI2NoBhcwHvLkPl+UJDQ2OpEKptu/RJ5fXBdfThEZtRLGo4oNCm9MuwC
 5jMV4sMQdgcb4+J5TtRsn82bdj1dW3Dk0HmJ3GrS5lXXQKm+01b/16X0+6+vosjikGa61FfFpja
 F//1JWokdqMSQknXw0RBBXSpOrOUPhlXehhrdJQussNV3Umif5ITsPCtQb5+FuEn9hd4Ej8gBXN
 hmXSdPHCDu7MJFGsveBE7LkkXYmVZV+MjYOYy0qjZTrxMr0o9l+BmxArYBXY8CBRxg3sGdcpYNt
 SlM0Tu8VLRyGP61QNJr7K6zCJFkM0Y1DxvRt5Mfzcgf2MopdDwUyZyGCS96dEjDnIB8TuVPEoUp
 cfgYGRY+crPZd+Qz/Bg==
X-Proofpoint-GUID: _HTl6Z4-rGA19mBR7_j4JEjD-VFvBjFq
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1d8162 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010129
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110597-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FCE861FA86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1


