Return-Path: <linux-arm-msm+bounces-103808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOgYLbRV5mktvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:35:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5023042FAAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1674E300E5B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB19A34D4CE;
	Mon, 20 Apr 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGwZpZQU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ByIF8L+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA6F34D922
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702596; cv=none; b=lSee30ioqukpsb3nR+pXsUU3sbIP60S31JEkSe+ljafCgSrZvE3CoM5lc0HS8uQwqEhdi4KGZ1BoMjkH5VAnuXh9xiHaJjtxJ6p1gPymmW/zthPj8TyTL0V57vwOfg3xzcNoVE7WORdjtx2DlyUIzqNmjBLH/SCpJ7ti4GHZvvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702596; c=relaxed/simple;
	bh=8++tdoM0bWTeLdr+13f1de1STU//f0CmIo3qeR+11TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHmbJrLMrCE1FlCj+yHx9rBr86qB6R/oaAmXOLKC1nUPfqNq6UsWKkx30z1BWvCbahb+Jd00aP53sARizf8vlFhsQHF34P3ViUGRITFRxcxRTHSh6a5rkTZ1k42Om+nODs62GahrOz0Yuh4YJi3e3WEdQibqQdUbLB5D9WYiDmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGwZpZQU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ByIF8L+F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KGD8PG2980963
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXWuxZCanFDMWHQocrsOySflKMnK78h7KKeCmnCbxV8=; b=NGwZpZQUD0lILMai
	HZHCb9ZB2WT/xlJ3skwW+zG/svWFPK6ZYst4BGXPmM9kVV2IbTuX3IX4COQXIltR
	6G0SbRqPmU8PaHU6Ucc9hTKnk74kKlfqA2TFWA8LTmKNYNNy+LtqlvvBU5Ismpt8
	FqOSpzaNPdqMr31WFqWijmrUoVUTLu4tqtdcmyybhwgaha56whNMn071yE7f4cVN
	Dn50dEDqnmU7yBfjQZ0cibhtlbHao8cjrAwwzKv15+4LISWLzlEltQ8wFO/J9bEC
	jvEkL4S0uAtvND1Z38OR7g1jhUd27Y0dSwie4AQwy25j3T/5PjKDnwlT/U+e4wj2
	S0fd8A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnj2psd9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:29:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso2018828b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702589; x=1777307389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXWuxZCanFDMWHQocrsOySflKMnK78h7KKeCmnCbxV8=;
        b=ByIF8L+FI7mzHZpHl1MshJwPoPz4J6ojxLcIg4D7KPoQD6KBhSaqTZBEeXBr7NZvhm
         MgxElxhZiC03jh0gT0JcngdMHZ+A34JZXvyeuMpj9amAa/eK/VWWljbtEuf8WhmBRhfX
         a0lsBxDaH8mowUHEh+8sVs0xrSXTkv70PbHJEj2o6PGSGbR89vrfeOQu5IgpPg/8jUSo
         os0UH1BF0riJXVyoJQwuzoM2KRukF83zoj9vT9ZGNe8cO6ZDGlY31tt+ULZxR3wfyhzy
         c0OgnMo03OoxqH5WPHAN3UeQnIbBz0luxgYQNH5mbZjgMQHCDhkCLakzCBHQoYwBVnCr
         xo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702589; x=1777307389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VXWuxZCanFDMWHQocrsOySflKMnK78h7KKeCmnCbxV8=;
        b=Qw1U3TFZNQSk7gWhR8SjKG4sm1er9zIcY2cajVRoPpVCJ2FT5XxPJw/DnhQggUjKDY
         Ga8tu5uVBR8FE/LkcVo1q+Jvdxj1mkQTK+Bo29geZNJ4xMjOvPTSyXBSDWhIyEI+8z3Q
         L+C1OfUxLxU4y3NUMoJOifaBc5jZEpCW3OfwXKGJpV3fy9+s10pWPP0sqJbGNB47Eokc
         zE3Isyu7QOD4dZOOiTSjXGEnrDkRsfzXQCzlHy/W+Iw3hMQuL62pLWuySR9ctcHDCunT
         Whuj+rmZd0QG/6elFpKUelw9YAinLrZPeWLghVTvHa33WGF3Nq1f9X/Hj2+ehZYL0mie
         pyZA==
X-Forwarded-Encrypted: i=1; AFNElJ+hEKh5LpW0cVihAII2ljEYU7P7vYyESmo0DrhUn4cClFqU3meYj9oq1p4NSI9GQEuRRfICrMR6ZFoeHgZk@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLfuyQfd6HbGQZC5+i4Hl/mDYY/+NOrSwX7HWR3lWxUDJxKEZ
	2+hgPzkTWJbTTdecn8p8sLuG5nFrccWRuLCxw+ZjKsEvPd+LNGNWZjplT2nPAjJKI8fsh7nx8Tw
	eqoYks+S6JRSQjgfFkJ/wXZ0VfBkqbHSpyWeMLpgZJo7EF+Ib+MOHAgYPM+nNRJD6jQfM
X-Gm-Gg: AeBDievf1BTQALVXo73OMpO5WeJqQGJPVwhyhVgWjjmZNWMdg1RDUH35M5qioZCyvkY
	CajThrLOGtwdsQu+0nzLdmWxqmFKfYGD7+jEZ2ovUZ0rax/V8GU2FyWjC9yXYx4LG2HClFld5cj
	uikaN8rTGtdBaBDnBFRQNYm2OyClYV1PaDOnNYxLJAFuaN9FrvJ1JjLX0aI8COdFhh1UGHkOAkp
	aNCQS+BkH8Zb+Sar0BgKuNghChOM3xsMp+9JpHzdU3qzIySkVJe/ByiUzCu6wJIe1BjTLPAaNi3
	J9M/xnUW93kjlAOv5bm6wU7l4zxdqYsmqb6RonrE1f2hZFXHS7dxQKDhplqaTUd8FyGhKB6OlLZ
	ZqJpoS3KkOPokc8f6BG4YAUywwN8wQyO2hu9MJZWFq666OI1zGy4N71d2i3bgF80=
X-Received: by 2002:a05:6a00:2308:b0:82d:162c:581f with SMTP id d2e1a72fcca58-82f8c97c71emr14267585b3a.48.1776702588687;
        Mon, 20 Apr 2026 09:29:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:2308:b0:82d:162c:581f with SMTP id d2e1a72fcca58-82f8c97c71emr14267547b3a.48.1776702588152;
        Mon, 20 Apr 2026 09:29:48 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:29:47 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:54 +0530
Subject: [PATCH 01/13] dt-bindings: soc: Introduce device bindings for
 CESTA Resource Manager
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-1-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: GFmSTBBo5Dj9uBpN0NnmpBBTIpfb4MUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfXwiLuw1ZjlD1B
 7L7Ww+WoYwoKwxaPUz1Y0kZ3jM1rfd8GQirSC3MCslkSE6+yihbhq5LtXT4dDa3mg21PIUlR9Ez
 nZHi4PBhOuZVax6C88V23AuFEvlDGWxNO6QUZD+ffnRua4wvTnrb5fpKdsBbTQWeVtGBbpBAhQv
 qnQ7224L6DdTOnbCEqaAly9q4g5Ni5jb9kyyZjcs/V6KutChHpmWjSob1X6MdoQLbRDP8nVE/C9
 76La3GIUkvujRXi0GLSG+kYiTD7fxNZGWuQbKH9fW3NAVQVHQkpI0c9vvFFq7qKyCEzmTonKaTU
 mWMHDA8NkrhaXoHEgOsNr85PHDQFNirtdGJhaC0aY3wf+hUTR5r7cFZ4jzVzItLB9CyvZUQ4Uck
 NuPyY8qMbbzq36zdiwu5LDaoZnZmzQE0SLXdBT0ZHHzWuncnb8ad9VPFcLsFEUht0I0JYL81AE5
 9Cuf1d7WAO5dOfusRbA==
X-Authority-Analysis: v=2.4 cv=XMoAjwhE c=1 sm=1 tr=0 ts=69e6547d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=E7ZTn-C8EJTiI1aftXIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: GFmSTBBo5Dj9uBpN0NnmpBBTIpfb4MUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103808-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,af21000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5023042FAAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
CESTA (Client State Aggregation) Resource Manager which is responsible
for client side management and aggregation of local resources.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,crm.yaml     | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a1485db8b7476b0cb0b4e8a41adc8fb4092b731f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,crm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. (QTI) CESTA Resource Manager (CRM)
+
+maintainers:
+  - Maulik Shah <maulik.shah@oss.qualcomm.com>
+
+description:
+  Support for communication with the hardened-CRM blocks. A set of SW
+  client Direct Resource Voters (DRVs) in CRM provides interface to vote
+  desired power state of resources local to a subsystem.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8750-disp-crm
+
+  label:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    oneOf:
+      - description: Specifies the name of the CRM.
+        items:
+          - enum:
+              - disp_crm
+
+  reg:
+    minItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 6
+    description:
+      One interrupt for each DRV. The interrupt trips when a message complete/response is
+      received from the accelerators for the desired power state. Number of interrupts must
+      match number of DRV blocks.
+
+  qcom,sw-drv-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 6
+    items:
+      minimum: 0
+      maximum: 5
+    description:
+      List of SW DRV IDs used within kernel. May contain holes as some DRVs can
+      be allocated to DSPs / can be spare.
+
+required:
+  - compatible
+  - label
+  - reg
+  - interrupts
+  - qcom,sw-drv-ids
+
+additionalProperties: false
+
+examples:
+  # Example of Display CRM device with SW DRVs
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    disp_crm: crm@af21000 {
+      compatible = "qcom,sm8750-disp-crm";
+      label = "disp_crm";
+      reg = <0x0af21000 0x6000>,
+            <0x0af29f00 0x100>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      interrupts = <GIC_SPI 703 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 708 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 714 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>;
+      qcom,sw-drv-ids = <0 1 2 3 4 5>;
+    };
+...

-- 
2.34.1


