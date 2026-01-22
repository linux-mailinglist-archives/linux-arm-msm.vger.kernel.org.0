Return-Path: <linux-arm-msm+bounces-90105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM2ZB7eHcWk1IAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:13:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E6F60C39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 87681844EF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258043793BC;
	Thu, 22 Jan 2026 02:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5WLRRyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gy77Xceg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1D4378D8D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047755; cv=none; b=R63LUajDuJC9hf8+KMqUOYAEN6RmB/VL19yo/r8Ujbivdg2VvWkHRyGQmRncubzvHV3c1rI+mQ9ZL+WfjyqBjn+KsTPHs1tevjsU76elqfQJTkU/SH/6k2Cw4DBlv/aXHW+olClfrXYhQkcB41krGXKJGXdSeO780LiPg1bggyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047755; c=relaxed/simple;
	bh=D10EnaHvzxc5IcCAThb9a/AzzqWooUS88J0GgYqXhUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uUuAUgSaAmnlZ+ci10/RHWIT+RBrtzcKgDZblx6BAZ2p3+RNZS6txGP/WfzEfty4bPQe04TmCjJGuuBNOK4qEMm2mhAp2aQftBfroR7cvZ11kFY0oAIHFUmJwfER69cMlUAXvyhEsHjd9iMWUVr01cfhc98AF7qTDHDBr82uJDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5WLRRyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gy77Xceg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LNELAA2727243
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=E5WLRRyNcki3om0y
	W+UWAkV7kgO0zhfb1tQkhrwV3Wb6mfiAheyRLqTFfE0m8icRRAVZmGQgDu/6by7B
	KZB4SlsOeqENd6Sp2Pz57SZWPZHmp4h/97/fJyV2oCPgfZXRxR6NOOCou6ijkuna
	U1eyi2O5YoYxthuyu7+2s3U6Gv873F+S/1ttytcYw3Y3YQ6zbfeyTifbjkIf5aON
	+oio1d3fedzzBTDThGeZaiJMVyxmX6i45K4vpDBe7CVqBhWaS9uqlc0t9bubXDwy
	kbAvjMfB1K0ORqtJSt8QkJ0V7eWWGheu4fMHXORWdM/xk5aoagn81zgyd9QTAxzs
	cnxDhw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btysft6uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e952f153so8987975ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047747; x=1769652547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=gy77XcegmpJPb3AVamwYE5XkWxz87z4etA0x2x6xTf0yknOo7zJIIx9zW80tLLJtCM
         p9TP47IsiaVTsNLmgZy7SSUyujrOmG9lshsMmWy9QwzrldOeITppyH9f28f+TS/p72JE
         RVyfe+N0ombDx3LOvVR4IsTFMQe05ZLyJT8+oNsXOr0POpDiSH5sYlh6CDzQ15+thkW3
         /SZ7/5cVuF7QpxyKtyLBBAZWPeESZKgb9VCJBC30P/dsxpb+gqHKdaYy4Jo+vyR89/VJ
         utrazp7jw6r9uuBTdw/w7OB+SFmx1wMKCVKhzXwZzKTFDBYpw/4TYiprgyDUYT1c01ZO
         QREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047747; x=1769652547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=kG7yv8yfxoQNe63qUu6yP9qAOEeRnPQ8gL3NZOFGiODY+XAyApKyp7zuW8ASGLR5DA
         i7epDiwv6GKhTezQ2BNFhJ5awEvRZA0Vs1VgEOwM4qUCflMekZamLxdm58g/Ky6t7sdD
         kUgwJXOFCDwXiipWhXvHAdgQfmvMpsw5CESpDurj33HtwaOn/HQqi1pIGf4qWRou4wIQ
         jIZ97PG5ipUQ/DoVz9aIW6v+b+kv0zBU6qOr+sf3NrTfEn8CnCYKY8XLpF2HG3fMdPHT
         LDVQqohnbrc/NMkqkpP0HHIOfoB1shKjTXS38Hs22GghtnfPaqZ2ImqjKm1aunTxL7uA
         5y5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZc5Htq4RwC1/Tlw9d5ww4XYuI9wSkPhWJJQUNplTgeKyWLy2tA6QJOoBDzxK+uHjKIvqn1VDYp61FXYrw@vger.kernel.org
X-Gm-Message-State: AOJu0YwpdWuFwvElWn2o/BuQhUzUKps5hRJnnNtzREcjI4+it2nBJcVx
	7XvHF2etjltR1YdwMunui04WNU9OFbmRiobJOXz7Tna7Xzoqs11nD11+LC9QVcM5CJnm92TWkgR
	HIZ3YyRrRsfUs0Gti1GAxeatFP1jXi9ooJr4Ku81pbOIAPyNi+8O9KWL4uhKLasr2xxBK
X-Gm-Gg: AZuq6aK6sczmr6dczfwpTGJ7C0ankbACvGF5baBkwjUpsk/5/Ml7HebFcgaG6lZmGLZ
	EkXPXi0pRBa5e5eRhRoPtJGsOFcC6u5M+Qq5jYrIlq+qUneVf+dLSEcUPwQFhRIANtgDVR/gPPg
	6wR8gsbOT8V+7yU+7cvG5Yu1fK/uN50n/dVIoL37vzk5i7GquJBVDjfxTNf9kwXa17Z/djKZ3IW
	/WT5iT+NJbh8UJbAHNvWO0wwWI1kXpnbDQ+vwIOvQIUbP3O/4zWXkSpDLyQ0EfrVh0ru0WUy8y9
	P4z1weg4uCAtlE77/js9kGrxjbfcNc0fO7ixMUkwDoCjHUnOGuAg1N0WcrM6R1JSzCJyx8V2Em9
	Y8v4+0vA3dNAUKwBdKrrv+V+KP0B9YcpwztY5F6l6mmqMDiWEL0ZRlGTx2R2QDarVlkHVbhhS
X-Received: by 2002:a17:902:f688:b0:2a0:9ecc:694a with SMTP id d9443c01a7336-2a76ad5c3b2mr66689595ad.37.1769047746719;
        Wed, 21 Jan 2026 18:09:06 -0800 (PST)
X-Received: by 2002:a17:902:f688:b0:2a0:9ecc:694a with SMTP id d9443c01a7336-2a76ad5c3b2mr66689235ad.37.1769047746185;
        Wed, 21 Jan 2026 18:09:06 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:09:05 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:18 +0800
Subject: [PATCH v10 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-5-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047715; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=D10EnaHvzxc5IcCAThb9a/AzzqWooUS88J0GgYqXhUw=;
 b=PWRV+OSxdyrgtlPlA/88c+zwxtpmLqdGmkgVUwG5GAA4FUiVev4B+usVORsZujvgNYb6XuyVN
 X743Pihp9HoBYSojQw1lDVFuTtCvvgoNzPqUQUjjgZhrXLAVA5GLOZw
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=N8Ik1m9B c=1 sm=1 tr=0 ts=697186c3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zQQ5LCsTf8rO3zgm4CeZIGubS3njKw7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX0iDaeKSSX0QR
 y0qT9/BjiDLEl7aAbXb3EdfG4UzN1FKjKCaMrIjCLxzj9NgSYGQqKXHdNHa4Yb1Fd3FjT5+lurI
 MpYTn9AuUlD0Z5xmh8wQhrsAesN9YmP6kb/JM8VH1N9GlrNOXk/dxt5zudW2QiNFscEuM5QdU3A
 BcZ1dBAdiD5mSaLFvlfJafKlaWVNm8BTeDvOogRsGl0pM/IF7S3/EHCbiSlnPxd1H/jvboLaWhw
 zzCHQBnUfG4u6F3jORdfEta6ufk7aoqImSkof5PDx493X2u4J90yjMokfPumyrJk8he4NvGnOdR
 nB04a24iAA6uoPmpbzCtjwOyB9LER0vArwpUCy/Plfjkum5eYAgioQthN6YxiFoVimpDF8BcvOu
 6LxaB4eXZqDFimGL/ELCjTS/b4MiOuL6IZT8Oenszu3tTm3OYWf4MlHL8qCi3FldWnhk8P9rpor
 7ZlrlLhIbl0WeXiO1Pg==
X-Proofpoint-ORIG-GUID: zQQ5LCsTf8rO3zgm4CeZIGubS3njKw7Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90105-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.15.70.40:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85E6F60C39
X-Rspamd-Action: no action

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..ac27a8b89085 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -60,6 +65,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -67,6 +74,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


