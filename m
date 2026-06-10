Return-Path: <linux-arm-msm+bounces-112527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jSXrEO2ZKWrvaQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:07:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA566BDCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:07:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dM9noVBE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W9SvX1fE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112527-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112527-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 461293065737
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBF63264EF;
	Wed, 10 Jun 2026 16:58:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4015931E838
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 16:58:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110716; cv=none; b=gMa/abDAc6eQdGChxM/EsNeThcDyA07lUq4o4xx8lhcfIl7ahQZk2/hOJeWgqF//1zS+EbFUvWccAYeA3LRc/Mxr+pd3vXDCCQQPU8Ase+4bpCUZn5rP5VEz5olRqWb82znFfreT2tmDFnCaBrlYLgLT4bNreqsAPb0OIpa1tfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110716; c=relaxed/simple;
	bh=coutn8kHZx0KwY6Liu/+GJkAssj3lLlvauFhcZDDVxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BRsMCaUASmBa71lyNZew9rxEpiuqFD6bedBdoGukU9N8jeuIlAO+QgjpOES0eXzVu/UgD9B/OnFoOTUX46DeXRRwKTUARcQD5zjpMcytEyJqkb9RO5xd1LMQjzMvP4nIX81qHr9OUZXO4r5msAnmeSwbEXvUsGLozn05gcDT3aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dM9noVBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9SvX1fE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwjfW104416
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 16:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lEKTxMakFBBE2KLlDpCjm4
	7UTf/xRvsT8S1VFXuxhN8=; b=dM9noVBE+7ZK3ka8yYdw5aWUR9puzID72/G66i
	SmJvdr26bwFvnwPyiIagNnDeMGqw4ucMRp3hWJsOM5M5fptxcw57sq9VzQ+7m4C9
	7FNUrW7k2wqSKSSC+dQk3i+PK4HMLKe02YVNhTakkjh8DEYOyoC+kvKxXBjgWsFv
	WVHpcBCGnR3u2WMdW7wdingvrTnJoR4aDBbrVl3K2Zfd7X2lrp/3svHXbPYHIB1f
	kmN6M7U/hLEv6Yp51vOKoxn1WGZ7pWLHRLxe2BZys4KunJ0gMCBij4PWwa/lm3di
	u3JBAHomyAVKo62TPznMsCl4G4nycqVhr5HJ7jxuuS1cuGgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwneuny9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 16:58:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf1845bddfso80181265ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781110714; x=1781715514; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lEKTxMakFBBE2KLlDpCjm47UTf/xRvsT8S1VFXuxhN8=;
        b=W9SvX1fE8e2pBFPJj32Orfd+dyrRcWH0o5u/uqv33QEfCFdObseVV6nD7z6s+2f9T0
         3XyK4g/CDUihNvbjwJATpQhmnIFI3nnWsAlmcrzsCQUBUTsK1lk6wv6zMKrFeO9zLLiq
         4I7BAL3JRiaFInAwRZJyOkke8TseFCH/E6EYteyLyJCtQU6o7Mv2J7kiOit5tw3gRpkV
         sneBEWf+OYw/td3XsJ33wfmiki77dwUtzZDxDorQ9SzNjVRKQL4vOX+Dxz3rEMuR3Oid
         qE3nodtURZIhhGPpkoVzqi9s9xZpuBuw1JdS2uhFxWTjXRTPkVx+ZHXvzsINybEyfAcm
         jVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110714; x=1781715514;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEKTxMakFBBE2KLlDpCjm47UTf/xRvsT8S1VFXuxhN8=;
        b=FCKSxCGl+FR6StjoYj+4qc3FYTL4ui3tth3vlUhE2MQJWPKgKUByNvVZBws33WmHNC
         jjNX7maxfhMgWcMvKU2sfNUhKD9NJzLp50AOa9myDPWCdUyp8GJwLG53w7g1XIR4hXCf
         7rv8q8ngt4mT2dWmrQaB6FRPihECj7c3W2ECD7uqUUi7g7wj5u48sZPQHTJ3gVqkrSO/
         74PwMF5zQIZMkGONLv8XU1camvfl1SFLRv5tq4rIJ3rBeOwECULYinhaR67x9daJfjxb
         cbBcLz97V2U4ZhEdTqeaPzkvitj3wcvGT+g0NSxZsPx4dZKHMZV6DZGXrTQG+tleHUyz
         IFTg==
X-Gm-Message-State: AOJu0YxRJoW8DZC7aHlk0LuMY/HyBRUEk/ULg1X4aPWQqaxrvPQHuMoV
	tJN4uEXlYMkqzzpVEGJhPrLPKVtxzyLOe/b1/WLwVGUR1fWODIJoRks9Tkv6Te7YPukJHNT1ASQ
	mWmxVnTk7Ru/IiN0eSEzBCUgWCB8xl/ZlHT8CqtCjc1+zTvK3FpfN5NcknmAodATOfzzhgvZDpg
	Xh
X-Gm-Gg: Acq92OFIpsMCG0F+i6scyLA+nS/OQjApCgzycTlU+/P+/0EWNIhDT9s1COdKmuoI5t7
	6zkGaUA1lbVOhduEVIwXzbfozihKTkQwBEq+Yz5D8YuTZdlCzAzL+JaukV3XC/zl2rAt98pxn87
	TzoL5JtfDUHhPD4EiMmagobkZnN3s+GbLq0+9+50UROgqZ5Mugp6QWBPoDP2ZYJwevbcfXKInKQ
	uxtarASB2RQwaj0KTfqZCt0tV77bu0Mykj4UrT0Ei1pgyEOGtMLHEbAfOxZ4o/wb540PcXxFlDS
	jnoqUhjSGh6fUvKOfrgjkd6fCK0PEQ/LJGFPTvfbDgsp7gYx7YT23PFq6qiqZeSG+0g4ZdpNhKm
	UbNHYhuQFwZ5q2enYWspZzZVn3p5DMl7/eWCuVH2t7jmCN5PEE5kZ4KKR3FDgnwjn3O18/8/ft9
	iCxLMkXFzXNFYaOG/oefrjyS+LWKdzyMRF2hfGYbote8RgYIFLiPYpRDkX8His0t67qdM=
X-Received: by 2002:a17:902:f547:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c2da750d42mr1013035ad.13.1781110713707;
        Wed, 10 Jun 2026 09:58:33 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c2da750d42mr1012705ad.13.1781110713248;
        Wed, 10 Jun 2026 09:58:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166396fa9sm253963755ad.66.2026.06.10.09.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:58:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 22:28:27 +0530
Subject: [PATCH] arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALKXKWoC/yXMTQqDMBBA4avIrA0kUaP1KqUEk07tFNH8qAji3
 Y12+S3e2yFiIIzQZjsEXCnSNCaIPAP77cYeGb2TQXKpuBKckfOPqi61s4S6HybTDZqCZ2hkUzR
 GqKIuIdUu4Ie2+/x8/R0X80M7Xzs4jhNbSPRMewAAAA==
X-Change-ID: 20260610-ipq9574_pcie_global_irq-eb2838b16374
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: pPNQK6G4wqQ5a__cERV5iK8wTWs25DIG
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2997ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jkYWTDicirnocBHR9mwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: pPNQK6G4wqQ5a__cERV5iK8wTWs25DIG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2MCBTYWx0ZWRfX7xEg1zMO1fSi
 rJ5XzSKp4HXRIY+uSsYT94phfDWUomuYbvWMHj4QYKtYFHc+N2hZo97fZCG/pqi52h213MYVLhn
 UkJky+2hiq77ZijOOKKGkxkhKKpJsIjLtuLd3a1r084ezOvIjbkuiF//hSXm6ADti6ukWJ6c7UJ
 ByAHWpD2D6n1MVfr1XW/915gDkFJkvdR9Mr4WqOthyT9DVqCnMYkZGuvAmLwUHVYFPxd6CyxqQW
 0jRaPzUsH47BRtotOfHlw8+4FAvKdZAl52irZAVKloe3UFMJGwcApyuTTbvPCnvMyCjm3k4ffCK
 zN9quQ/wubrIoRLf1JXXVryfLpyzTp52UCiM9vQyoPW22XZ0R2GQT00kCvi9JXey75vva4tROg3
 tPBWp+Vjkwg5wK5IgByREYFDLCY+qNg1ziNjyTKREvGYq4bsLJrVgNKpf1stfDMGQkOnjAFbC1A
 fLtsD+TYLXnUvGTLOKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112527-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BFA566BDCC

IPQ9574 also has the dedicated 'global' IRQ line for each PCIe controller.
Add the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 622cfa96ed2b..a7e7115477c8 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -945,7 +945,8 @@ pcie1: pcie@10000000 {
 				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -953,7 +954,8 @@ pcie1: pcie@10000000 {
 					  "msi4",
 					  "msi5",
 					  "msi6",
-					  "msi7";
+					  "msi7",
+					  "global";
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
@@ -1031,7 +1033,8 @@ pcie3: pcie@18000000 {
 				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -1039,7 +1042,8 @@ pcie3: pcie@18000000 {
 					  "msi4",
 					  "msi5",
 					  "msi6",
-					  "msi7";
+					  "msi7",
+					  "global";
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
@@ -1117,7 +1121,8 @@ pcie2: pcie@20000000 {
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -1125,7 +1130,8 @@ pcie2: pcie@20000000 {
 					  "msi4",
 					  "msi5",
 					  "msi6",
-					  "msi7";
+					  "msi7",
+					  "global";
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
@@ -1202,7 +1208,8 @@ pcie0: pcie@28000000 {
 				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -1210,7 +1217,8 @@ pcie0: pcie@28000000 {
 					  "msi4",
 					  "msi5",
 					  "msi6",
-					  "msi7";
+					  "msi7",
+					  "global";
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;

---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-ipq9574_pcie_global_irq-eb2838b16374

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


