Return-Path: <linux-arm-msm+bounces-86516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D0FCDBC1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C519430281AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E7432FA17;
	Wed, 24 Dec 2025 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkGGFlfV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4g31L2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661BE1624C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567249; cv=none; b=Oc/9poWKEB1aWMkAgXHUy8+dY7l/aAbeOdgWTl5Bp8SfpVSUKDc9WzUaAuWAk7xx5wd3RwUGaq2jg0dDtD2GNhmCYlSFzMdPMnqrcvcvLTYEa1Ra45ZkWndL+lmt4c8sICUnvr+Eu7oktvJwqj6nOfWGLI5rdjFlWDBEKw6dtjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567249; c=relaxed/simple;
	bh=D10EnaHvzxc5IcCAThb9a/AzzqWooUS88J0GgYqXhUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+BJzZbG5rbNqoDinggZvaCaHvIapIQsSyxKk8YxQ5mwTo7XTYn8NjhjiZ/Z2TqbVexVI6gJQU0fPXtsoPj9ywqrESx03hgOxJSGLem/zvKWQpM9zW0qAvCJTQGyXXwpHylsIZAazeVknjWRtwolpALVb2fS9cjsEwzalpi443I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkGGFlfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4g31L2a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNLg2Xu700565
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=KkGGFlfVJeNvO8nW
	DO5c75xW7tB2eW8su7rJMJ1aW6AQkzjDeVIJ//9yr4/DvhEFoGxRHNv5O8n8hN+N
	D+Y31zvGf+XYWMDwP4JD0vLnnj9w2bna4JrUVB2/vHz/QqIYrf/wJcVN7X/OdVlI
	nrXT+KqYQzdoe8YA0aMlZVqBspjypgbE2ZnCf7BEBkJDei/fngmMJc9fWHnUWADs
	AOr1CejqUVBTz6WsbbaLrHnDZwsDOfilWH+gGXwp7h+BL2wChaI0EiCLtAiTbhTx
	G4d2myIYVKPQ0Z1nnxkCD+mvvhP0PtNpI0QH9zXKxZ+ceeYBD9ZoSalYz39dJgEm
	JxO/UQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7ju8bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f29ae883bso82786945ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567245; x=1767172045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=Q4g31L2arGS1UhpebplBvjubyIiIED/WS6DvcBwczDxSuD69b5LnHUHJu+DvQ4Puiq
         UdWZE4b0cUKbU/sGTeUYdBPwHrXsRGyG3RJ9EXeEdH19fJghpUcfv6Hi+a5jdQ5Apdp2
         Zi/i273BtKa7FZRYDs5NElJN5FnAJdnjE9LwRqrU/dZ4RTUzUDNaHiCO1aw6Q82u4qNu
         a6yXBm7LH+6kZceo90ybR5y3GeLNBvAp0Ge+Sv2IrqU96AeQKjw/addzXK9aCNn1lmju
         1Cy0CnG4ypG38yd1VXZuHIErEKGI3btcVnN/BkzGmkS7xKVOCSl/RNE+fFMEe4EBiOxk
         +q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567245; x=1767172045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=Yh836qDD5IZbxzAkXjrqpbgrVq8y9B0W/sdozHfE33fx4Ukg03tKN1tjunFOKeR14d
         7rOSRP/EWVAvnEmdLjvhgV6vyjZMOKDc/wKKm38AIcncx1ehwRCYYyFNfRzzsYdSKGoN
         iBIgsiOYvgKebcKC1egzF1uKPcfpirvHxGf1UdwCFq18Pqcjr3XzcCOd7PWmf2G1SByS
         RUOTgqwgqY4FLOzYG9Q1NF0S7DHzB/lLFMPfmyqMuFYpcLpdkC6uLJclxjcTYCQ12T9k
         fXE0H05k6Im4Pugr5VfLNqqq7H80BI0lfogRvvuRtLYzMZRQD3fIMBA+ojNaq8QDlLGw
         5VUA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ5uH5WFqtJUEH7KCkH/u4rnJms0mx+cr8QmXg8nuVNZ9U18jD0sDJhX8njpaYJqmqNPIVqwGN3MRta4X/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq51lGwt2MsNzYiFl9PrI4igvWsKbE6ocluciC7oVhXHHOSl+g
	8GHJ4opd7rW7JNH4TSfeVBxwUdNtpmCtNoYB9jQ5d1BQ5rs1Syrjm+yMZV3pLueSPiUKMXGdoZq
	NgW2DPTw2YvwExmVi57BXiRTOR/ccN90jRN+y8TKcbaOGBtCyYC8Ke3tfGJYAGzFetLVC
X-Gm-Gg: AY/fxX7rv6eYVg7tSxN5aIaG8muPgW+ee4KZh7uPsOPX5PSoiuPhcqzEBvcdltFo38Y
	UnsbtuuLd+it9usvFfucetNoWU/b5bNzlz8evGenuvv1/IkNOOlZAxic9lq/LQ8aPl2M6FK/tQM
	Z9AaSXB6MAHfemaY2GTbCZobGjSSlbEXKEVckhppojckbO5h7cjW5bh1X+El747AF9SAac0IJIP
	uipbuV1V9ygrTVQjl3nvI0IDnATr7cSB+TTiGYWd9vUzf3TldeY5Q7KyrfgJPDRO4OboMSHjVsX
	hq5wkTCOibHPHyqQ+X8ophqVw+wMm2ZjPlNSPbMEDzvhJsVeGvG8MgSsul4cBi8Jbq7XNJmxSed
	qgvmGg0NdqtbDhrobCULFwtkUl38Yq6z1sUR+E5fc29rG9UMLFKYJEcSiETGeyuj/Xch+cPWH
X-Received: by 2002:a17:903:3bd0:b0:2a1:39cd:7462 with SMTP id d9443c01a7336-2a2f221278cmr148934415ad.8.1766567245445;
        Wed, 24 Dec 2025 01:07:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQJSCcEDJYpAElLBdwqPKFsyNLcK2o3ZpFHifNOj2aFk1A63DITNNzdU1841TN9YFANz2I4A==
X-Received: by 2002:a17:903:3bd0:b0:2a1:39cd:7462 with SMTP id d9443c01a7336-2a2f221278cmr148934225ad.8.1766567244933;
        Wed, 24 Dec 2025 01:07:24 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:24 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:15 +0800
Subject: [PATCH v9 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-5-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567216; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=D10EnaHvzxc5IcCAThb9a/AzzqWooUS88J0GgYqXhUw=;
 b=tKR99cySKmryaYnNrYe05xHL6TEQFTTMHE0xGP1WEUL9152DOtRwuSu4OlI2/9ZkD/Y8RUsDv
 045i+bqbKOZDc9WJKr1W1gRHkc/BycGY2HUPjFzCpHYx1zIvbuBsZ9C
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX35g7wp1glx0P
 nZReSvZX+d9Hbh90SrAP8kJ4F6grkGi0IT9xG8E9ngnoiVNMhudIx2H1V3u6NcT9bTIGlRqqrx+
 GFihiju3mUeM6vyJvSYkwXyCxQUnvxEjvHAb1ARYQwjueGHv1eBvDo6jtyAaj1js+zLc4+NT43z
 PvZmCmjYXTrBtjRShhOVUnKeiR8D/aHChDynj6Q/84Xz03RsrQnSSEAcxx4lTwBu4Hpbhf/YRo4
 B2rFcDngUatuwBEZkVOBpdg/nFLNQLsbW/nYBBcgUL07O3SwNxLFIqHH8592P3Zt3N2yzveGZpJ
 69R5jwx5rqvM2oxDjy9zcLtrsP0l7l+6nqZCsqx81/nPMF8nvy8XcYfIZ27+kphLdJeA8yGCnlu
 1yFdiiE+fPen3FSMUeNsjs/MT6ZGw/+cFQDDvsOTJeXfj0BjGMINVLSE3X0S2107x9K/61AeweL
 L19x8koqPJoJnNvZRJg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bad4e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7wBDXVgMU2ueaAFnXxVWPWukVNE70dTQ
X-Proofpoint-ORIG-GUID: 7wBDXVgMU2ueaAFnXxVWPWukVNE70dTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078

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


