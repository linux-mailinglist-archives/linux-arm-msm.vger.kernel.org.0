Return-Path: <linux-arm-msm+bounces-105777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA08FKvK+Gma0wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:34:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4892A4C1773
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33123301F0FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 16:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372203E3D87;
	Mon,  4 May 2026 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+ltgAOZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHEObvZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A713E3C5D
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 16:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912284; cv=none; b=VEh4cAb79VjnnS0YybrLriOZtEk9OeNlIXzLJNSBmV6CcNsiiNiXMtMvFn2Rjr7+4U/iEZ+q279esUMfj3TuWsyFzvhhAYLJTQ3J7HphGMMNj092W3zMBbNY1ke9F3VsdU3+GdNQ2Xaai3voz/RUyOTUJAXpU4PLxWmYt6fUzUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912284; c=relaxed/simple;
	bh=OZVG5wDgPtQpzl2yREv+RZ28OCca9gc4KNEciXY21rM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Khy1UoFHzGbKID7SCwZsVUNV56+S/k+WKs113MFfGE/CiLZGPKqaGIGlltDOp9Bkplfztfcbn4euY+BP7fls8LAJPMeNJ2Icp756Ij9YyfUf2SVQ2EmeocnAFnWZ+FWGcu0OCJNz2YmeOt2r8GR8/GRvuclTDds8su68YmokoRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+ltgAOZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHEObvZC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B3wrt1150998
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 16:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PiBV3kcFVwNY/938jfDNtTJvoJ1v7x6jrHVGzKql6PY=; b=T+ltgAOZjEQNA32j
	/8mAkoLIx81O749bNgv/blG5aU9seEnw20ZPo//0w2u2fu8egXJucgaEmy6Pa7Kw
	QqUylo1gZdjgjI2apfPH0X/jN49MklpYPpwfj+zqD45/qgknzkTQb4CwlFqPVNB8
	XiJMnWJ/kFBrBT4lgqncsW/+fJDD8mbxXeQ9SAH1467qCuMazVzMCHMfoB1dyJc4
	vVA9lUssrrA3MfIrgESOQCLi0eBV6wdKhf/6oSLn4I5tibBPWzuQ2B3IG08zsHbO
	OxHMJP8/VobOi9UMdNt0qrDktSB4OOssiYTg3uibUe1df2OebVtHhjJjlQFXE713
	sDi6bw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy98uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 16:31:21 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-479d602f323so7638215b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777912281; x=1778517081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiBV3kcFVwNY/938jfDNtTJvoJ1v7x6jrHVGzKql6PY=;
        b=MHEObvZCYNdcgZNinke+QZgXSysW/nVmmbwj3lGZ6RfEbgYZAa8y5OZLxhQy0FwrR5
         pZlYG1ll1Weu/u+vLCamvb/9xA/Sgdj+O8ciJIL+JHgvKzhRazXEA4TsIiw1BpDNkBiU
         DeAeJn09ULzyN5w7ju2FnlBryl6uxI3vFOtMs1VnHyuDiotJ5QiNlR44Hokbt8KKWAPC
         CeL1g7QZkMu5M8trNAvSc7zwLY8WdixwQJCd73SvS7tWugRNK89tQyRQaR6Hg+j6U0rC
         Lqe8nrBMT5iCKig7SsI6r6pkcGOM/yj1UyAca5FHqhcA/E89XabuldTPP0yhTf9jV1Wr
         kivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912281; x=1778517081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PiBV3kcFVwNY/938jfDNtTJvoJ1v7x6jrHVGzKql6PY=;
        b=gsCiLvTWw+ouQSHpgjqLeaRkEbAJbUcSMNaTjU4OwJjXQ5dTFYj2U44Hzp53k06mPA
         Eghl9vukd5oSg60zz4QIjWkuQ8+ONgsKTn8k7XyBCUKrQpZW07fbO75bbyBLEAlaNbZ8
         Bl8H87ne8jcE2Es4y3j4ItGy62QW+PjTknFrokd2K5AGNlOupfVvlETZwvDm7hqS9E+T
         a3JelF9i9gQRhF9J1ISJjAux1pqkGqpbXk47m0zjrgJmCWts1nOii1/r2n637lftjedN
         wpZysyfGSDC8nosVDFduurgqMWgEqURX5bWdgPCzXFS9uwjvnhu6+Yq4SG+MYx5t5r1L
         B0zQ==
X-Gm-Message-State: AOJu0YwZlIb6smhpxf5WzrO4QalSiVuJLm3+c65F5jDK7ogYqlyd5jj4
	+pBcm+MoDl9EWk1g5fmuPYngk9D04ohrlt5K8oBJdeGg6kMYvb1wPh+POHRVIxt9t314nP52/42
	JAFLS6akR4G7wgFH/iIi9Ped3PNmGF1oOhI3+PGuc7MsqLcYKsDFaQWnqhbkzzIlm3PK/
X-Gm-Gg: AeBDieuAMS8rklbsYWfSybKPnYWIu5iEM7qPXvzd/G3pg5cDhpj5b+lLQCSJuUtcGX6
	fyoVjPfdn0RcOzcGkdZwv0HC0Wag1XWgT4BVh8i2QRwH9IcDt48rPyp4JBAiv0vEhxN25Xb5iVp
	LZngw4IMD0u8h+WKf6hyglhxhy3o0L9h7Yob6Q/Un6vLfVdx+HkYRyJy+vkzKCuP740WOfDetRS
	nhsUaou859I8+Ipa6uFQspDgow3JZHW8Bf/UKgyQ4MtZBzaoi17ZmxipW0JZ5eElpyKkwW00Zin
	bLde7foaS7QNA4b7Eh4cIFai7qM8YaX1T6A6vdLUppDFbWvu7kxOatH4Q2sULD1HHc/YQ6SRiJX
	y1DYZI0V1g9WpVtl5iAzfS1YMZJdlQTaciBtsPLXB
X-Received: by 2002:a05:6808:1446:b0:45e:f0af:5148 with SMTP id 5614622812f47-47c892315e3mr5282480b6e.30.1777912280694;
        Mon, 04 May 2026 09:31:20 -0700 (PDT)
X-Received: by 2002:a05:6808:1446:b0:45e:f0af:5148 with SMTP id 5614622812f47-47c892315e3mr5282433b6e.30.1777912279830;
        Mon, 04 May 2026 09:31:19 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb75fc1sm294986075e9.7.2026.05.04.09.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:31:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 19:31:05 +0300
Subject: [PATCH v2 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-adsp-usb-v2-1-18e0b0b0407f@oss.qualcomm.com>
References: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8887;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OZVG5wDgPtQpzl2yREv+RZ28OCca9gc4KNEciXY21rM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+MnQ9OoNbCyO5xHBgAe1M7DkvbaPXcLVmiG0D
 XNMp0s700mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafjJ0AAKCRAbX0TJAJUV
 Vhe5D/96uWRTFC0/zblS2UWQtOQYGsHmgv1rsnmjou0DL/87edJm88NB9LEDsC051BrpbT7ksAp
 dtZK4gMnn+wzh4djd9VBzZfmYq/MrS9BSbf3MJFsX/iO01hYrXN5fGmfUV1r0shXDEKDPqMGEpM
 va1CLqN7dGGA+/mtE/w6LtThKvhw07z8l5ifim55wkia29pNJkPrOPlvSIplVl2qoG5PGWZ02qy
 eH6jz8pB4OQY+HlvIaH0l8i61m0Gcdogfsb6OO216FUo1qzVeYo9/6Tf1nygHBAL0tH35Xf6bR/
 9vFUKNuDQhsndosutj5t9VhPzZVUUeb4SCoZZVGzWT9jpVcMwymWF618S2+SxjdSHyWh8uCxSt8
 w3HTc65+kRhhfvVTNa4oZYof7wOkGc/GCim7khCyi1yq8zIN2k/aXtKGPBZm8pCCPCxpzRhX+jg
 TefTQahjEh9Hd1lE9RXj+/ShNg0VdhboKUNjtivohmzF+1uk5FmLHD08w82MlsKqTAdrqFiHnJX
 eWLGLcVFu4YUz4VTCeDOlClIwsKmLT397eYvl5wo8G46PKqDSKaCVhzTHNN3sQ73PNlo6kzKuqM
 gjtX0RJbW8mNLk408mUZi1ey4piWYqqBWYPjp3869rypnqFlA+HHsnaLU2sVYd9X6Alsvw/DHoI
 Q7NP/72c6u3Nq5w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX/+7JML7MTeXB
 zgXp6giyytrZxgxzFSVtzaud3KvaKoosMca15ct/hQfBsjqfZ/cevi+8XrAG72/Qq6tUnjMctBx
 HE48IFlh4VwJ2YXpYQvq48yUCOpOlEBpEacnvkfy9C7eIMEXGhpUGY45xaV0f/PWpBQlDIcclNj
 h4DGnwswoH+GOeGy0j1TCATcP/sDi1xkwZ9B6B+y97fXSr5Nx4DyaCNKU2VTwvuyoWeeqIaTjkh
 LWadCL7iQn8bsdn5ZX9vPZdzdgJY05x4FpqkfkBsqXtLbnmqxJx3btNFuZL60h/B5Q/eMENWWOn
 74GlJfHQ/qkrV1Lsuy1Yy7rdy2h4eD3BB3RICzZG1yySwlGv4vI/G8zmm++51YLLsDRy5tJRxT+
 tg5lLukfZmM8KIUw3sP2vdpRMF5U2iTiQM/Xu0CDhrAq43VCYDG5BaOlybcaVCYBdho8VtdqbbD
 DVZniZtXUk5+A9KseZQ==
X-Proofpoint-ORIG-GUID: w9q71N7ZEOjAGkwITuimlqk8_rTYBCi7
X-Proofpoint-GUID: w9q71N7ZEOjAGkwITuimlqk8_rTYBCi7
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f8c9d9 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0aSsbouhDs5aZSzchFYA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151
X-Rspamd-Queue-Id: 4892A4C1773
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-105777-lists,linux-arm-msm=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.208];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c15:e001:75::/64:c];
	RCVD_COUNT_SEVEN(0.00)[7]

Describe the ADSP remoteproc node along with its dependencies, including
the IPCC mailbox, AOSS QMP and SMP2P links used for communication.

The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
combo PHY and an SNPS eUSB2 PHY. Describe them.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 261 ++++++++++++++++++++++++++++++++++++
 1 file changed, 261 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6..02df7125b2a4 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -6,10 +6,13 @@
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -596,6 +599,30 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -624,6 +651,17 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
+		ipcc: mailbox@406000 {
+			compatible = "qcom,eliza-ipcc", "qcom,ipcc";
+			reg = <0x0 0x00406000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			#mbox-cells = <2>;
+		};
+
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x2000>;
@@ -862,6 +900,55 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		remoteproc_adsp: remoteproc@3000000 {
+			compatible = "qcom,eliza-adsp-pas";
+			reg = <0x0 0x03000000 0x0 0x10000>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +970,167 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		usb_hsphy: phy@88e3000 {
+			compatible = "qcom,eliza-snps-eusb2-phy",
+				     "qcom,sm8550-snps-eusb2-phy";
+			reg = <0x0 0x088e3000 0x0 0x154>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,eliza-qmp-usb3-dp-phy",
+				     "qcom,sm8650-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&tcsr TCSR_USB3_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb: usb@a600000 {
+			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>,
+					       <200000000>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			phys = <&usb_hsphy>,
+			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			iommus = <&apps_smmu 0x40 0x0>;
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,usb2-gadget-lpm-disable;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,usb2-lpm-disable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+
+			dma-coherent;
+			usb-role-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,
@@ -957,6 +1205,19 @@ tsens2: thermal-sensor@c22a000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,eliza-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0x0 0x0c300000 0x0 0x400>;
+
+			interrupt-parent = <&ipcc>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+		};
+
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";

-- 
2.54.0


