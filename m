Return-Path: <linux-arm-msm+bounces-118340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TV+XDFUwUWo/AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:48:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 974EB73D1D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:48:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nXCdjvBk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VGeVUCh0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118340-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118340-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 313D73029622
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB7B20C00C;
	Fri, 10 Jul 2026 17:47:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA9379EEA
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:47:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705622; cv=none; b=fLIeZpMaQi8fXqpb+jnWHEeoagd19bn1I9RCwRKlPRk32vtMJZuxxrD4KaZ3ogCzYh5eFQt9aDgRgvLew5YXeyWwSI2fyE0Zo8lkYRRN36XGKWKKRVQbe+pAscciHHELZDlRUh0ACNsu7U77uby5y9hsS5fgkRJO6XdoqMKKJe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705622; c=relaxed/simple;
	bh=1OdkbJ3eL3GbSteCcmsYZGBMIEhFB5HxyOaTSjHW++E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=auz/QY1N03ZgmJKwIlJGAzVhd1OijhH2v81m/C7a99NV71ORoIMkALcJv8PzmGU0UkURuXGw/dmmHg3ob/a1ffD14pNw8ZsnIrDVSo58WeiCR/MrUIYwOfcH1Slq73CLhDXWiH/zLpMlF8/TKN/Zzw7thP/yrGEykO1iZNJZJMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXCdjvBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGeVUCh0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH55b21407270
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gCv2zKv+N9qth4QiOXkrhC4viQDxXUkZm3urZ5/gsF0=; b=nXCdjvBkCnreod3L
	xsmwjIznMZdIdz93s9Wa9ZzIDRY5PPK8bFZEK0+6Y8zn5b3mrn++406HiFgw0pID
	+6faqeAh+VORhF5Ve587U0CQtCdZxZW+0qXchNdcIC7QwtKKVFg+sBx8R0d1rf+i
	eN15O9T3ZfbTnDMMO2GVz5iHImIB4CaVj4yDLVLHrYR6Kyn+LDfbeO1usQjy7UcB
	vmDKil4mzcwXTbolAYp6R7jRa8p31crxb7CTt53ISj5rkYDZcHD8NpEeArYEB/qO
	aM1HFXWLXUbWmg8VlfxzX6M9R57Tp6RfzkNyQeaQWP+ZAllcompeJ8kW2cjXahAW
	xcWL6A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f9u9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:46:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so443245a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783705619; x=1784310419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCv2zKv+N9qth4QiOXkrhC4viQDxXUkZm3urZ5/gsF0=;
        b=VGeVUCh02l4FvRIaPvlCVwls9xNQNZJKT8N4F+s6HU1KobChIidwLkjuKQWknm0j9u
         nZaumdWmT67fHfbcB7C9GZxK6WKSwkMppN5k0nS/OtzZjAYRp9C80M2bUHd/isQ3GaNt
         vazUt3Vmm0xl3WlfXQk0xi+/JHc4uWm7l6YBgzVg4OnkSwPpJhiXdpqXe2qFLr/nv8X2
         xBO0IfuOZwkuPgQI6oKUgk6k8qX40Me9NeD4KAmf+TBh4/pY/cS2MZjSqoogi0bpKBe4
         Ri5+wmp8pWiL96X0BVLeiSU8j9O2Ryxrcj7op6TJYESGi5XPtWd8d19Io4RKzBLBgusA
         7QOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705619; x=1784310419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCv2zKv+N9qth4QiOXkrhC4viQDxXUkZm3urZ5/gsF0=;
        b=NuwbKIKRRQTVpuhYWt47mr38yDsM7L216grIOTOnErd6D6bUN6JKKrnCUvcXIKR80R
         Fus1RfxIx4fedpt6y1ZMGdYSOqAk7P/T1YoqdAiWV2jEsMLPZ7KYaSxRNOD62aVVoBnA
         ecB/pwMxTMZRFcAshWbR5zzXhopfIcm4IRY10L50LxEpUzmya9guz/0oaWGCG+qPAUTY
         fmF/9fqXv1lnZzE1YixwGsbfwXpTApNKtBr7T8BsHvJYEhhVN+wBLKZStrW8XrYqkEt2
         xUPJEpcfOOUUm/YoohYyMCN7z7ux24FBAlUIJE2NFcZkJnPst9WllnT2Nd+OceDRi3Dc
         jGqg==
X-Forwarded-Encrypted: i=1; AHgh+Rpi9nBVnP/GqrpvbsRj1MZ20Qrgikz30twPnDvHMeAFNXUzu3TTvqjpzBUmZ7GboKoXWu+WN1srrNhJew66@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3gDLbiTHcRRSQg3qRRZmeRT9Tl61E8R1n9x2C+Bnq2yLpGleG
	efgZj/pD5+DLtSlds60/8WyhlxFEkn7BLwdrEvbvrrL72XoIJgkCFPR7PlHr7kBPn7jvHl4NDd+
	7JaRbi6f4UyglSLhWFk7uL/biKw4NVb746hd+MhML7cQMak07HRD/alPN4Np4xPBgYpkN
X-Gm-Gg: AfdE7cnDCJC2LESztmePtcoEc3HBE7FUHOVszsFAaq+8ruEaQfoa+QcGgeJnbEvcR7A
	UEdb4ztEWy8grJbMRyfn8zRLWXT7RjYbLRhQpQ0R9j9NEWQwO4lyopcO3eQEUuADRJxNCdD50aq
	cMVXXEJm2VrFNZnWKPbIvSr3dDrBduI9CbQvq1Iay4HBw8qF+xUrxTlMdSrQngwEIdWUS/GMN1v
	y0mFPviNwjzx4483bgV0o+JaM21Wo87fHgX1+sDa6PtPZt2aS7tG3f3C4kL9bW3wcDLFMBmahJm
	bYBImqUbkq1OYHBpF+Z90SfjHlc5cChSNNT8KgF7YVGXTOOqHCT8rgUkMD54E17qM1WkkEI5CCL
	1DnV/KKYyZT6Mb6zjelllK2rb9SiM/NpM44gQLclQRkjGC3SfGSdZNQdnNuwTu0xCO/zNq6eA6U
	RrlbviGjJN532PxgOwMIgOQHWlDVBzgvd535Oj89Bx9G3I2w==
X-Received: by 2002:a17:90b:3c09:b0:37f:133a:3e01 with SMTP id 98e67ed59e1d1-38dc75d234emr23136a91.4.1783705618694;
        Fri, 10 Jul 2026 10:46:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3c09:b0:37f:133a:3e01 with SMTP id 98e67ed59e1d1-38dc75d234emr23107a91.4.1783705618275;
        Fri, 10 Jul 2026 10:46:58 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm33008273eec.9.2026.07.10.10.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:46:57 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:16:40 +0530
Subject: [PATCH v3 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: document
 IPQ9650 QMP PCIe PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-ipq9650_pcie_phy-v3-1-ef6018818d33@oss.qualcomm.com>
References: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
In-Reply-To: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a513013 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pO3CVo40WvI9-LPkYfMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ckVfuJQMwAbASI0Gjx_s8uI-zOwVrwFf
X-Proofpoint-GUID: ckVfuJQMwAbASI0Gjx_s8uI-zOwVrwFf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE3NyBTYWx0ZWRfX5pCxV7Dp+Xgu
 jLHjFGzF18OUd2ts4WDIQERMlxMBryKkHExtiNIb07efNAgJQz5wopFXCLjjqWE1i581wJsqIow
 liPMNZpRUSkiLhH9xLpwtyFNekvEaX4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE3NyBTYWx0ZWRfXyGifs2X7msS8
 pJP3kIy1+Jz6/jh4A4/FDxzDcNTg9kt7eObRc9dM1qAG7olGct0xV83pN1S2/HxbHb9fmxl96lw
 le7GoL34e+vvfFgqs6slL8+DllOsACkCcl9f2GNdPHPBD9msIRwTosqSRqeXkT6Cl+mYLFm2Aov
 0RE4mkpXvfcJntsluns1fCU0nAhCVdeyw1N+KWgfdkKZt/3cBbzJNwDym53618KjnOETjLASjt5
 scRkMBKtDR5y2xq4st6j7ZbEewQAuZtlPHLcyvKRM4j0AJHTFg+HOpT9KmViWnApkA3WPVK+3hk
 JImhPrAQMJPwEvYIXQQAmgJZgXRWEuMGUTSNsIMv3/zyHPw/92a2kXeO5tYPU2aiXeTRdq9o+qW
 TNtnB/9YS/+hEt+i883pR1JPQ6UdvaiDJ3Ica+b1IPpReVfUqYiM2jNGrAxgv+A3FH4juaA3UBY
 J16dBjAFDfzxtdcNiMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118340-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 974EB73D1D2

Document the single-lane and dual-lane QMP PCIe PHYs found on the
IPQ9650 SoC.

Unlike the PHYs in the other supported IPQ SoCs, the IPQ9650 PHYs require
the on-chip refgen supply to power up. Add the refgen-supply property
and require it only for the IPQ9650 compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..048b2e3ff0ef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -22,6 +22,8 @@ properties:
           - qcom,ipq8074-qmp-pcie-phy
           - qcom,ipq9574-qmp-gen3x1-pcie-phy
           - qcom,ipq9574-qmp-gen3x2-pcie-phy
+          - qcom,ipq9650-qmp-gen3x1-pcie-phy
+          - qcom,ipq9650-qmp-gen3x2-pcie-phy
       - items:
           - enum:
               - qcom,ipq5424-qmp-gen3x1-pcie-phy
@@ -61,6 +63,8 @@ properties:
   "#phy-cells":
     const: 0
 
+  refgen-supply: true
+
 required:
   - compatible
   - reg
@@ -72,6 +76,21 @@ required:
   - clock-output-names
   - "#phy-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9650-qmp-gen3x1-pcie-phy
+              - qcom,ipq9650-qmp-gen3x2-pcie-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


