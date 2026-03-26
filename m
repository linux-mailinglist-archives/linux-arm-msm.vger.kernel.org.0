Return-Path: <linux-arm-msm+bounces-100112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PXFEJMtxWnb7gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:58:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4C93359D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E105330391BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F149F28CF5D;
	Thu, 26 Mar 2026 12:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNj7sv3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+AIHeE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDD223E330
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774529933; cv=none; b=b+MnhNGqUAePUfQ64knoFoN9Fjsb/eqGjkU0e5C1wu1In2jJpz5A4DuJadEeyBeKRc1wwD7GbVCdb4jNKKcySvVG4YDJQtyhBXJQ0x7iCb00QrhuxJmo7jhrRNXiii+18NxUdWGx0T+EpmbWK7Ny9pslfr9muNdbM726RYzjiOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774529933; c=relaxed/simple;
	bh=Ixl7gLyyEq/SPWGuNNI3GOGTtT5V3OFcz7bvTjmm5Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hPfx3sq39Ro/gj+PYWIeLzDk/w1IcQQE3Uee6q25QqlVuEBe+U3xw0Si6z5Mw0MbJ3UZS7xKlON4lJBO+khrVczcGVXf1M39a6kxYXGoS/+Y8M90zn3k7QpK9zmjn0fDNJfHtQsOX+/F7YgH6MKqdZWPQgUXa0iMCD8OGABogww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNj7sv3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+AIHeE8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6x3jJ1060842
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 12:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IAUY1T64AJ4zQXFEnxXtoGFezJ96g7h5QWZ
	s/MqIj2s=; b=MNj7sv3cELfSx0qzLdTV6y28QuBelArBM91cjY/97rQwz2rHJkS
	XCS7G/NIdLVRgeUid61RBahVG16fR2XHDklQg7qWcyJkAzqbpjQ46agdPagnagA1
	iJ3maovuQvfJzpotj6NZ5TKMYPLXcIoe1Wt7NIqB9QIukTSB75RYIaUPiBQr7YAt
	OrjMG44jb+eJyMy1Vohzy+aUxr4qZW4vQU0E2dgRU+RwHCD6jDW41cg/Ec2T5vfx
	ugG4gD76HTEwhSH1+Tc1HPf9UcNkcuIRaMQJea2i51iU8goDEdWCUEnTLUK4RYI1
	+yPHzLuD5wK7yiiQcHLh5cwQrLUlje7HdiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkstq1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 12:58:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so19825581cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774529930; x=1775134730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAUY1T64AJ4zQXFEnxXtoGFezJ96g7h5QWZs/MqIj2s=;
        b=f+AIHeE8XTpSInpPHKKGlYkDVLs7WWgakTHtlWzOwQ+egBAQs0nWd214pM1Ti3RA0N
         Ah0ciWCU3Nnc70B0bxqs1vTOt/v70LFeaSbxOaoaWC/iShNxFoQiiTIi/xyKCrreHBVl
         LjahpEnIgqiFE2G4oIx+8fcRJB9jD1pODsTk/rhpOkPt7lZMzu95qZykBVjQAKAnlZXd
         2pqfHeitucIRfSWhyr31JpMkrx4cLH0RKrk4/3k7PTOFqQ3qvpRoUqoVm9GIEHDbtIcR
         hxc6jbgxd7XoraM3F9zMWPliMhLKGMKDgwddLmiYwn32eEEt3r+StREuuD8hVKtDBemP
         sB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529930; x=1775134730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAUY1T64AJ4zQXFEnxXtoGFezJ96g7h5QWZs/MqIj2s=;
        b=Iqf7BNr/tIc6XsGufUmebR9voBkVYfqKrxbz3IbZjrtB6t8nmSEGQ/z05W1X4DqyQA
         wwD3J6Y6Lr1sIo2Yk/sxdaSdeNu+2uRuoFdSILin2VUWzZftbA5C3FTAH6XV4h0WDjPR
         zPoF6f3wdp2bLnQxXo9Qn0DUViKT3jC2UDK3TRLnt2k2NGPXna50zPf3l3ibdPCsPcx7
         hzk2vy7TZttB7ZpU85dnKh/LYnfSGKhYmhJIePkOXH/Qve5lqM+ec0I7k2VVPNgS9+bM
         fwb+zR0/uEWPr0lTBAqEvWfgLUcBuMmg7SFDo9XlR4R8aMLacrcrsM5fpHg9WXlSTlgV
         VS4w==
X-Gm-Message-State: AOJu0YyJg+ClemHPA3/bTXylTprK07Izew1Q0vmKI8ClDwbZrR7hMEfp
	M4GBmRF5q8cbbqGw/BG0CARqc8ubv0x0WewqvxDzF18jqbp18IMTxusdXSiQEmeZrQhEYiecohZ
	AXXdtTWg4LIDpfq3ulukYgp216gYmDEQFq/9QxwmnMo0Y+JoPd9Gm3d4+bBQCsSxqoLkT
X-Gm-Gg: ATEYQzyF8VWgVwEvRPsm2Bt/hITUNXB/DrH2y63hvfAxyeaMMu5cKwX0YSsTZyS8Xnn
	Z6QVbWB3vQXXInQk2xu+xOPnJJlUSbRVJ/Q4znd5VjzgQei4+xildpApTVfJupYchc/C1P3lCL+
	OVbgJi5aXMly29uBsX6PX3Jlihhj4Ctd6FO4XGgD+TOnrYzKDdhsIBwjTJhlVOt9tTzdEoTH0Mw
	GjrG732LoVrJAx3aXSLuBq9jB/8xV/OzQUuQHBkzJ1ZyEY/jpVZ5HzV1FQqs/j/YD6hCN+NcGdt
	rEJp8S/ds5XcysuhQ4Zqzdkk7JhfLuydXVcqEkR7ky+4ROTF5R8zeVemDlNRlfwinz6QbUiIox1
	TCu780OStWWX9RVjpSTN45jG9jnUR4uGoaKOlQl318pD2E/cfAQ1quBM=
X-Received: by 2002:ac8:7d05:0:b0:506:baf9:5dd9 with SMTP id d75a77b69052e-50b993e4965mr14197641cf.17.1774529929886;
        Thu, 26 Mar 2026 05:58:49 -0700 (PDT)
X-Received: by 2002:ac8:7d05:0:b0:506:baf9:5dd9 with SMTP id d75a77b69052e-50b993e4965mr14197221cf.17.1774529929450;
        Thu, 26 Mar 2026 05:58:49 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb0d83sm29253065e9.13.2026.03.26.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:58:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: monaco: extend fastrpc compute cb
Date: Thu, 26 Mar 2026 12:58:34 +0000
Message-ID: <20260326125834.2758331-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA5MCBTYWx0ZWRfX9xP3IlIq7v6H
 W1tqCYkiMgySo1953Qaegfb1O5LaqCPHgVstSVdaR4shqb0xS9pS6r784j7MyZwew+JKXLRYQo6
 eDNVB2GpxCVA6m2kCncZGHMx/QVllRj4+a6wi0+A8vjXKjYoqduD3+JURYkdGIAyqidA5IAbMc8
 J96oplVUTRn4o97rf5bfpgkzd6lBdQzqPPyR9C8Y84L9+noR/GR/xcQe25EEL0goBNDE4qIrQXP
 q2OPUwCRj4qgcalAi1NUeLHCecfQpaVZF8TqZcGi7eewYClmXb9HDK3yd8Xm3p9mX+K+I/tqVT4
 I4otZThQdRMf10JbXcKUNwcfO5mqSqNYMPWdTPjWTBLXv2ubVFrWgIlHfUaqQEzX5CK3+cj6xrS
 J/IM+9pmfXSvJedc/B9wBnFc0i1X2EXUaU67woWDM+NYQLeo+TU1CU5zTG48UbbhtiA/IeGt4rz
 XlfkMbsh6Py18KXnbdw==
X-Proofpoint-ORIG-GUID: T68KMFGpN18QF8UA6PMFfPYAweRCeUlb
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c52d8a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ebg3YuX8VNz3oMcFMKwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: T68KMFGpN18QF8UA6PMFfPYAweRCeUlb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260090
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100112-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.7:email,0.0.0.5:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF4C93359D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For some reason we ended up adding only 4 out of 11 compute cb's for
CDSP, add the missing compute cb. This will also improve the end
user-experience by enabling running multiple AI usecases in parallel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 10e799dd4a78..884a49c0b019 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7739,6 +7739,55 @@ compute-cb@4 {
 							 <&apps_smmu 0x1964 0x0400>;
 						dma-coherent;
 					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x19c5 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x19c6 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x19c7 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x19c8 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x19c9 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@b {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <0xb>;
+						iommus = <&apps_smmu 0x19cb 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@c {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <0xc>;
+						iommus = <&apps_smmu 0x19cc 0x000>;
+						dma-coherent;
+					};
 				};
 			};
 		};
-- 
2.47.3


