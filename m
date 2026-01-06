Return-Path: <linux-arm-msm+bounces-87658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A04CF7995
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 10:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B31E930D4EDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 09:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD16322B68;
	Tue,  6 Jan 2026 09:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+itOZeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SClUV4FK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541854414
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692433; cv=none; b=L4D3EYOQoHc3AA/b08KDPMJo/935cE1Yg9E7piL2rwOXi04UGnZ4MbzKZXu968eW7z08Vnbr5Jv81qdaR27aNb4ujGnCX5uqDFVJ/gmfNG6RvZTi8rOaWnWQF9NFmCUr9XHMSSwWI0vf8rX4SeNPjic6yv2NZWtDwY9OWZpX3So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692433; c=relaxed/simple;
	bh=zSk1APnfdThvvuoMQXB5XRjhqPJzasZhcJEjPa9ow14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GTBzvDopVoQagdpK+l34sGCUg9sW2BYWoYm4f1qLomc2C2MAQFDiNMgNH4SSow7toh3iVGbMrfnAWCMnHRRYq2j8M1fDIh3Y8ukJ5+DmOs9U6Usy+Efhg2tI/ov+QbHXte6odkTigYYiC9/ceeIDsE2xGfOfLcoGmKx4CQRvUa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+itOZeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SClUV4FK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q9AY2429868
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 09:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=; b=M+itOZeNvFit/ilV
	winrUrYjmxhgRVbOougbrh35IKIBS/cXYcGkzGPK6NsC0wcfhxPd3ergEwyBM81k
	WpoCSnX+1jbGjQelXKMeIOHjWHEPiLqD+fsasmHEwQz6XaMftNf87y1cd0VMhPhD
	1yzhUSRXlXm7xFZ+x4rdwuOjOmB8kGddt9MQ1c+99xPRsOYWrYfocHSQI7+h0gqv
	DuRJKp02RDQ9wlkkx0fleJoog2h1F3U6mbwlzGQ/Xxy50knHt49VWX5HGzA1I1nx
	cXNMyhLlR75OJch9uYlXmwirB4ERnxtJhE8LrFUQb/OUU2edXPexPYoPD4k5prrx
	AOc1hA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr739cu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 09:40:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2f0be2cf0so279812985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692425; x=1768297225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=;
        b=SClUV4FKMkrcwQsFJixhDus4MLXCh0sCzY8m4j28gvbD/3AytVCYkJLz/Xhve4JtQA
         CjhkuOqGFroCL/KJQQSm77rDDoTzAG/rciyY8HFNnPWCbAygcNjMqnrc9ye8SXC/2W3j
         iv0kRmPgZUPPeh7war5MNjKsRkoByj5Yh2UY3cbxO8oTu/M1UyitLdbn4xMwiXDDLLQn
         uyXdigNeJ1zIlFqiCAkISAxljlRUVaS1aUv00CzRYn6omR3sjkypG14PYQ0hf+5tYGRg
         e2sC2TrcNzJcXmGBKEn7CRsFhkMFFRrAPMcuMIQO1Z4tDQ22VL4aRcYtFHqxYkITtHjh
         bgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692425; x=1768297225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=;
        b=rVYnNZNKoYqQuTvbqIBmJbqTTivQbsjR83BTrvQZn06C9SfjFkFnpvTsiNKyladufp
         /Qc/+R7e3o0UeEjs1zPWCbxey0lXmc2eKghA2DdmmyfqkYpF19W0SsNYhaX0zOAEZsyg
         U9ST1/2ya4s/jWWg7CPof6RFrFr4R/Jl1XR+1X2ylCbRwOKxSzF0RzVkkj783rrZyQHs
         d19mhB7qbjlGFwwgKIwqXOqTfhv1O02MNmM2aicCGYUrjF0ud+6oVmntD++AkaF1oHE7
         PdZIn916lY/eXZeaQialVlmwKkLNCiDObTuMmjYUD6l/b2d5teZgyQLf4y25dEY1JZxU
         QECg==
X-Forwarded-Encrypted: i=1; AJvYcCXPiScNnQUtTXIeSc0SvgDaRNV4v1fcKS3HaOVYWFFPrW2UtaIhLzvtheIzSl+zuDLqqiFS6uu4+zLJ9bR9@vger.kernel.org
X-Gm-Message-State: AOJu0YyHnZ9CBY7GNqvWqsUfAn7Kqera35PH5JdZzyB5XM+gXG6ox9sd
	ad+mT/UwUePDYRVrAasa4tfCJ9tQlPPbKmkbyqWP/b7g2ssgdFZ2OtNEgIAfuy4/MsnHh1I98Yu
	UA0uWhGxq16zF24NSJ6hGhGVfP4OzXltBQR9+SLSsCM/Rw61ljyCm7jnC3oJ99SISMReY
X-Gm-Gg: AY/fxX50CM3aVF/PnOsEvzefx/6VZayYhKZ1tuNa27HmuOdTiq/eCv8ZC7QNPLLJrGL
	9jJwPbRKxEEicABi0x0kDMn0AzowVNJuiYB/0g6q4u6xr8KhybPoWdzC3Otc1pFZ6wcotPrPGOm
	m3j27SdIR7g3dLe+ZyyTT3+w0xypazS1WpvqWp1MWovO+/Pclg0xMx5MIBKjsTh4aDkZkmfIscq
	rIKzchv5zn9ONJjWs5b03bpEe/wFoX/e3HvFn79uFCJrs6C234bQm9vRjCkaA3FLXN/FwUO836d
	P3y7GrT7mbZWgcdOjWUXhBNze2RXHTUdF4cYXuRL27q5Fqczn1MqPzG013yB3rS0l3FlzSzscVE
	VyX8HKJ8NV7Jn1W5RL/beehaQUP2FB7VI0UpkPbll3WqVNaH9TXrrwejK2WLqJJKrVZnWD6mBAp
	fQ
X-Received: by 2002:a05:620a:25c7:b0:8b2:e87e:1093 with SMTP id af79cd13be357-8c37eb72a4emr298598085a.3.1767692423451;
        Tue, 06 Jan 2026 01:40:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMAm/z0JG4VqfvPOutweGcWxwBQ4HC4pgvIqFOkKyoPOyPw4PYsNpVNOXjFwkqMz/+ZcH1iA==
X-Received: by 2002:a05:620a:25c7:b0:8b2:e87e:1093 with SMTP id af79cd13be357-8c37eb72a4emr298595385a.3.1767692423064;
        Tue, 06 Jan 2026 01:40:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:22 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:39:53 +0800
Subject: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=1364;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=zSk1APnfdThvvuoMQXB5XRjhqPJzasZhcJEjPa9ow14=;
 b=ydzKyJw8JaSS17eXOdSXbA163ARvdltQImiQp4zHz7oi2mhkpTlWS6QJkxenalgitCtGsFmsI
 6kszHiwHWUTDwgyDutf8pOQL9Ke+mPC2CD0vbWtUsQB2gsfihh1Srxb
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cd88a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gOhJHmANR_8o__jqBkAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: x1_L07hD4Krlye0vn9-bbGLSbnSMwysv
X-Proofpoint-GUID: x1_L07hD4Krlye0vn9-bbGLSbnSMwysv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MiBTYWx0ZWRfX8abEsooTSotW
 p1peHv3hy+EdCEFVgDvr8qmByRqVkE7O+KIbP+rWCsjhqmzj0ANZqB3lY+jM92w2o16Z0DzWz7v
 Ku2tWD7pFRiAHGuP6hCzUrcEokD8G51RNFq1YRzM4BsR+RUjnaw4bhmunl8Gp7tn5bI8IOsEw9K
 kAXulkoRSIhWUsRS2YjjIuHoeO/AVbxMI6iIRDQH9+q1A4j6HqVoOpYWdVJvV/ji1CSWKfpdEyB
 k3RJtWt0qSuRYC41BjLRRvL7KeQ6Gnrx0SN2i+tiV/t3w20WpzakzmBXPEqTSxemAVU1TRlancH
 o9MGIdt96qBp0fvofNs9MyaZeInrRKySIAkzaclKd3er4/MvfwTfImhPrkIcFIF8mBVzzMUB22H
 HAE9y9RK1iybjYToVppEq5D8x/nMKrv0rtvBwOs701F78ariFkjohRXoiXzkNJKf0RzAQPD0sk9
 fwlpxlzC1/Q9FWmBYvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060082

Add the sm6150 CCI device string compatible.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -263,6 +264,23 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6150-cci
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: soc_ahb
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


