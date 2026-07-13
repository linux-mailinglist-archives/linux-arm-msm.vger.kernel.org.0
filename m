Return-Path: <linux-arm-msm+bounces-118867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hTuXN10/VWoimAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:41:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EC874ED06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:41:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=evfh9MG6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZWXHL7Gt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118867-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118867-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47483316C792
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 19:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19322357D1A;
	Mon, 13 Jul 2026 19:37:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C4356772
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:37:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971474; cv=none; b=LL8S9Y2RiIRbmsT8DMR8cPwPr9+vS/wS1GtZTq7gRIeY+pfkAzo68Mi/p3LZ6CnKkgzxPaZwu6ledhsI7i+IvlX2r3HJXsaRVmv+W2Vtq8c+yRcEE0bISQwu86odc2+d4XOv2cgayddyPiK0b1bCxluPDltHb6XJ6xGSngKYLq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971474; c=relaxed/simple;
	bh=W+J47DLyzKHe2QopLDHxTslHmL997c14k/yofWkF6Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0VRlWDvuNyrpFUAiDfmV95UWacDWQI9A0IDmkEuPq3Mt0biSvJ5NMDOf3iduwN4vN1yzG1ZOb4Emii8izvi1AMuI7k4Zbg6W8tq4Ia9Dyh7d3dxuEYgV+L4jQDHk3oNYGWk3HIFFZja3NIVQ6Ou6G5KkifR7eZSyw9SAMsFA9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evfh9MG6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWXHL7Gt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9P9O2256696
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=; b=evfh9MG6JUyN2/v6
	kcm57M2xZK4y8US3pVrShraZJgVU1GSAWUY2PqY4W+jGYIBCGqCHJWGZsKhUqCH/
	O95LOIID3tTCFZ3KasxYPJv5qRyJh5kUvn/wzjeeLwSuacU5XrNS3+9d2DVTfxgQ
	X3gJd9vEkP4O+ZVsLY6I//NNl3+02NLUvAGY/E3uDDfFi9STO7PqemazA39mIO1b
	7jGB5cmsh+sGxbNoFzg2z90e4w1FYl4XvLqmydoYiQHGzmIGvPI3idz43zbEw+rs
	jmtXKQpWtvgQJS6wH9FvCVv/rk1H3ukVQGXKGIUY/IZjRfdKNdkbi2GzBIyOjU3j
	MpUBCA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9tan2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:37:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so278242a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971471; x=1784576271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=ZWXHL7GtYsIn+ZXA7BUHWsJYUiRvZRAXI7+Q2Lb3NnbAZUytZ55gPR2yx2lR3QqliP
         c9YPOaGirM/wd3H/OjV3Ke0/24nwLUo8n2TyGEn8vX0OsfutHclTotbPloo/h1fUzxmf
         GImH/4cGQ6DQI7EuXnLvjih7USjSbAY03mfueAx0oeZNjdZ4+k1Bh47fCwBczdUPUgPn
         llHTrKVSJNcQAIV+LO05DGqsbmJ1CrW8zun39BOlXJYCavbhi2OY63GLyW51WA7A9N1K
         wnqaOooGulVMz7IrFCF3qgYsenBIRAndkxLHOxao4ZSe48s2+VJ7w050Dn2kgnRf0qFz
         sUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971471; x=1784576271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=Bhd9aarpsCHC70Yji+923UfHQs3uNQ5/DfsrAkDLQ0+DY/99DBg1L+HIgYa/LJgUbI
         nlFC/+FXzYPoEowvjMrkU6nqY9wpfVJdgwqbEl7OtUhAZZELLOQrlM0OxsxzaWzzpfLR
         CLbqMw79VMfQJNKVq/OcTl6b6L05e2YfmqoV9smovmMh4TQIRJn+ULr/RCRBmzOzYbmv
         nHxdFufjp7Bcxij8GoSAZVWbVo8l1PcF8IHZ2Dt9uBopwfsFBm93mbma5HME5/bAlQiA
         /I3z2caymZF0/HUKhRqesBwSMj24ACopAOmB2ZSXBX0bNcN7Br1e59mrcb8ZrOV3F9Zf
         mWeQ==
X-Gm-Message-State: AOJu0YxjQfxATUXjbz850Cs3nQJFG6qbfnHdhFJBK7WeDpPKSYAzJds9
	EKuqHJ39e9OQb2HgXxaMJF3FesEYVENsJjjn/L2EoBHORJqBTMTNKGDRulI1MFhHdSToqcZett0
	aN2tpb02tGrNYcckmbWIrhRBxSsG5JYU1OdrAGacsrRpJine2NFuLntm7OfVOVbQexFN4
X-Gm-Gg: AfdE7clMtYQRXGyv01/FWTPuGCmg7hAYTA6ik3eHrua8SfPhBaxCL8yNyKd3p1lhiiw
	y/tBR7JnPkvcD5oRY3oYrrCWTpATGR7+W56IiA6e4N4MPIKCryj2EmTDIwh6MIA2ikqq97y5JS4
	pX9baV8jsRW226qACvX6X8UWjw//U5jgFvESxs2UZZNxarRk47nefMm17RYQiGH5kML11MF3tA1
	wOI2B+yvWilqyyjTu3i93t2+M+vxzZfO3DUXlcuzwWGB74HwTFpZz4tLcVMQEsjroBNM8OoMs5C
	Xx8C7eh0DEryfY22kj4UQgy/nr/CNrcy5eveFu33MMU3FRGmqVzIeLVBD+2LbwFzUbkrVXxgNgy
	vZ2lC9AQwz3/yrrrjyXrNh9c88Q==
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr8926055a91.7.1783971470511;
        Mon, 13 Jul 2026 12:37:50 -0700 (PDT)
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr8926026a91.7.1783971470044;
        Mon, 13 Jul 2026 12:37:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f3ea883asm207540eec.29.2026.07.13.12.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:37:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:06:56 +0530
Subject: [PATCH v6 07/11] arm64: dts: qcom: shikra: Enable CDSP, LPAICP and
 MPSS on EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-shikra-dt-m1-v6-7-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783971418; l=2699;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B2Dpn2axDYIMHLk1wigFR9Q2p/KX8LBdfSSHhm53znE=;
 b=wPhxBswjZZAlwtLStujD7+yOreUeucgnGXbxxcJrCntUXmrZDwz1FqCsCxtrq8T036Q9EXAdl
 anBjR+2P0oEDqNnZhlQ/QkESXOJV3ZpIIcYFLvo6FwnM2gxBub9rkhN
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwMyBTYWx0ZWRfX711ZJmp5dUjt
 tzPSqnCMlRLRmR47qe2c4qLsCiu5TFMlaF8wIFsK1co0xdrI05Evj+EcVioR3tLXDmJw/Hj7WBm
 Eys9VLCIX0C0LyCmjb+7Cnyu0Jnx2eL2hGgwPFDWhFkP8expMLt0FrV5bNYtkIaijN5O+awkX9t
 inqISsTJSTIzsrRkeEXnl1LWqTFnr/rj76lb5Y5OIIirUEnMx1RaznYdHmjgu/zk9pSFKAjCGmS
 OFGp9Ip18cU2ZHgIYJRtZ+n/E0NgXM4pNnKBJ9BnMziE1N7JJShVQDS8J0YemmzlKfI0sU/jY2w
 gE7JFrVHLJ2kJk8zAtz1QP5BV1MiK8r9/1mzW4N+pO7wr81s2z7NwGAhu/AUOa+KLrdpW7OHfCM
 FvS6ybER62fDNbZuueOQKRLt/4Gzyskyyil6WIOE3gPVN+WBkgw8X7nWngufmWuRYHDIe1tnaTE
 2Z+rs7qrM+LON3K/hJw==
X-Proofpoint-ORIG-GUID: su7gqUxsIT1dYo-0Cq59OQBRdGwMLEfZ
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a553e8f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: su7gqUxsIT1dYo-0Cq59OQBRdGwMLEfZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwMyBTYWx0ZWRfX8J8HFEY01PrB
 LTsms4SQEl5f0qkEc3X+DlfRqeit+zAcGC2kDLqmq8Pzh0vF5j+alqOLz7kkRa4YNpxByXR5YQ2
 wZkPqxL1E5+dKSJoIg5fKMT3IqyNk6c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118867-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:bibek.patro@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56EC874ED06

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


