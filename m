Return-Path: <linux-arm-msm+bounces-102579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ly1GuB72GlMdwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 06:26:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B92813D20A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 06:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFFA2301C166
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 04:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DE1331215;
	Fri, 10 Apr 2026 04:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TqGs3fm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xc+nThXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D3F325704
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795153; cv=none; b=rGzYucuX9ufIgug8YgyMDQ811AHASKN16z7rQKWe7ECa+gcZom+AXQ2EFG5ubUNMfb2lwqToVh9PjeckhaoHCGE7yQVgarfU/KuvGzq+gIYtPfZ1HjQqIYmtR3RQql1CZn0/qXLhNtmcJPdHn+JrzXgI0Yj3sRZ6ecC0uW9DjcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795153; c=relaxed/simple;
	bh=5LeJV70V7Hv7p9V96eaJfXy+tY0FRYpAGwkHhlB0eOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rGK1AKvlA0EFex2D/TE3eNnHyJL7v5j8M0ldXWh4HAyV0UIX11zkrjfhL4tR5wWkxMx5fCFYWPlJGKvhbc1BLOiQe8Q51naBL2nedmSL7jwaWkizbB+1cgfaahF9NQHkv53SsLOjhUPVk+skTBF2xJi48bH1CGc/sqT1D/Zut/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TqGs3fm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xc+nThXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639LHhNg2624526
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/adAQC+6+ki9X2m21LCSo7zDbIXC9wN3xzPTNUeu30=; b=TqGs3fm6a0Q4iBS+
	XhA1Eox2yVQAlOVYYN7iQsUxuJE6O63kzofQYHCeTd3P+ri5IjrWa8UjrdMBI1Ur
	imJc9+uJr5Vi/POzVpcKRSqzyUZa6CuskPtjDLKDfQ+L+7lfNtt2aZK0a5e6uXSt
	LxPaKZ6Ch/xxcSMqsVPXzsDK96+KGXjmts3FJQXVzRGfw9Pu/QvNSPmf9T5/VCMY
	gNuwnDabJW5FsOqS8O8jPZ4PRWIp6V9u17d1nOJeIUR4H2hwEswYT1WI5a5OH7Jj
	EnUyexY1Oldqf1YnMLaGVdznU/R7GGh2aFMqanrsoE8n1Q3djSgZ+uwXmxZk/a3B
	++YYcQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu2nbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:25:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd722c1a69so282815385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775795150; x=1776399950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/adAQC+6+ki9X2m21LCSo7zDbIXC9wN3xzPTNUeu30=;
        b=Xc+nThXec3yOJ4gaH0EFQgvRf8u9aRjLKNF+zAYBD+fs/esFl3eqBBNBMgggSZWIf2
         EhqCIaJ4f4Q/Z0V9tvH1863tMhDdLHmt2cJYRMRIKv+aPkwB4kzaxU6lA59ui5kJt4JL
         0QoWe64o7vZdO4dRnV2UvwegLAYOvEchzgc3HP7f98DM/C2TTSYkodV5o+5xs2E6XeUC
         hPC4ZArA8i+kCk/Dd6k3Gjs796qNiSTm0Lt5C6CMoQs1l/eZheWmvwjR4TwL3fMtdbEL
         aFJwdXL8jSnWv5dMWpm9oRxoJzYIm2hTnsM92WvbJjdCied/e1on3BrN+Z4NOvsGmOHU
         YYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775795150; x=1776399950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/adAQC+6+ki9X2m21LCSo7zDbIXC9wN3xzPTNUeu30=;
        b=n8eSz5dQ3gsfeDZP6uu7YBSbdeWkWvLz5a+NNdi6PmpBWf1wNXVJdU+jOsBFMaQBjE
         YHvinjEb7rd5CJ8RFMconIe9ha6BS2mFNhXIx3bBD8YxrCnaJpt1kXIgPT9tGSoffyC7
         lNe+XUMCjYjgT+nbGBYWfIfCgOel/gwr3hLo4qYalmOe8zxjChwj72RLos6HOvPHzWD2
         2hqcU9oVucoG4y5ryVlooM1C9jpn978lLqGgbY2zkmXFWfuvAxgNiY4zVXDdqn58cKk+
         2cjmWkCWbFuDe6i8uc3+q+tBF7gPETj3oiJ+zHE4RdAglqJOZniLjC2hImaPBr/+cNNx
         Cxmw==
X-Forwarded-Encrypted: i=1; AJvYcCWn0C2eZ70jSFoyQoqpTgbD/hJmkpYhKtbip9BQCtB8bA0D9/hA4epcy18+/Ynv7QYTqZLEPkKojX28JomW@vger.kernel.org
X-Gm-Message-State: AOJu0YzklMz35Nmit5Kp8u5c2h8uXKTLtHDI8SpHHycD1p1ijOGYKmwV
	B+scprZGAQNNIzkcbKEzRDE8m1dCRQwj4QbbNbO3A4FnQC8W7rEC6U3ROVEMm3G6232y9L+LGyu
	XkYQOF5mGIMoFIUiQWyfnVhfyr70hery5XMJdjKcvNVGmZxRfxMnIq3AUIqJIS7H2s6dD
X-Gm-Gg: AeBDieviqQeJT5fCvXqhWMZZ044Km45mwQYrFCuYjcg+s0mOvR9H3ikPQ7Dzw4ZDURW
	AUeG2KhbyOyNxDAevJXpcuvaj2PJTrSfSWHrU9CsCtASNpVRh+hzEVv4mtlxAH1EkydbpriW5ZP
	3c8hzTasfMfNhf48uvtZF5OjqH21BpNxmocrNz9im5hjv7noCdS7HpPnet9cWcMbEi77C4Ec43b
	/jk0JVyyfqkH1sRuhpNwt6gyiFTvBrA4K+LMsCLjOQ39sQvYOHViYMjdmsCsmgt1e7r2hgZrkr9
	NRb4/MdoqSpuD/NLuSalhA0ITEWxfJ0sdiI7TSHhDNHxZ1jeOIBLqBk+l0nAcgSzlm4nYsJakft
	AjBFVn170ngZZMSVXWkmvk2t2+HKr7HAfkGL+qhi66bx8cGoxOK1cOuM8ousBI26be7c0fpZhdJ
	8CKVDiHbSigN6Y
X-Received: by 2002:a05:620a:29cf:b0:8cd:9033:172a with SMTP id af79cd13be357-8ddcd21945bmr235766185a.3.1775795150344;
        Thu, 09 Apr 2026 21:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:29cf:b0:8cd:9033:172a with SMTP id af79cd13be357-8ddcd21945bmr235764085a.3.1775795149853;
        Thu, 09 Apr 2026 21:25:49 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb934d8e9sm121757785a.35.2026.04.09.21.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 21:25:49 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:25:31 +0800
Subject: [PATCH 1/4] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
In-Reply-To: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775795138; l=14444;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=5LeJV70V7Hv7p9V96eaJfXy+tY0FRYpAGwkHhlB0eOk=;
 b=xJPlXdEnGXzFd+RwQW7UJj2Wta74/8/7A/JIuLT/1lhbD9PtmEy0kCrn2Hyqihk0qa6CA+QG0
 eS1dHzLDD0OCm4OCQS5RSlbzCT+eDCh4DVjcO46KnfG0Z7bW+BIitSH
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: iWC8kHdywlgJVo-eWpG0Ak7DIP9H8Jde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzOCBTYWx0ZWRfXx2hDIouaXr2a
 4iEuwBFtLmZ/XPb8gECMX7KDUiDChKg8dpzzzQBRTDY5L7KPm5pwgy3YEFvbxjr5kRNJ7esM+IY
 +M5/hLBJjXHGB1JDdlZqnVZZBKlu+QSkeD1h7zk5VIuRHN874Bb8jVqHMAiv9d2h6CShfBXSFkQ
 huf/yl3dmY949fotnybjtc7z+Np4Lb/KDhWtSR863pmIW3rXX2mkIJPCfrgCRqc/5lAe8/I90vJ
 f+s4vofxa9gZ5a38TFruOugIv7mcQs1qNKQ/StbNHrw22Yt7vm07PPts5BBeUkKAjqMdmJnzzcl
 SBO8QuaONFUCqFQ3Eepo68Ca5i9ExyZSY6rvqsTtm44tEWPUBxV8YtvE02wZuX90GlzFureCl75
 wLkQPsyaCa/PQx7uZ/A7dw3JGuY54wGvX7U2/0bn30UeNKS8Gr0tlVC4zvRNwHAZBj2RJbwXaI1
 4zyRoW0ZsE1k1myDvfQ==
X-Proofpoint-ORIG-GUID: iWC8kHdywlgJVo-eWpG0Ak7DIP9H8Jde
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d87bcf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=P1LTzt_rTVk3HkJ-OnIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100038
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102579-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	NEURAL_SPAM(0.00)[0.984];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B92813D20A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for the Camera Subsystem for X1P42100.

The X1P42100 platform provides:
- 2 x CSIPHY
- 3 x TPG
- 3 x CSID
- 2 x CSID Lite
- 1 x IFE
- 2 x IFE Lite

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,x1p42100-camss.yaml        | 424 +++++++++++++++++++++
 1 file changed, 424 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8bfa7e616c3b6b91adc8e21ebfbbe6fb579484f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
@@ -0,0 +1,424 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,x1p42100-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1P42100 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,x1p42100-camss
+
+  reg:
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_wrapper
+      - const: csiphy0
+      - const: csiphy4
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  ranges: true
+
+  clocks:
+    maxItems: 22
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe_lite
+      - const: cphy_rx_clk_src
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy4
+      - const: vfe0
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+      - const: sf_icp_mnoc
+
+  iommus:
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: top
+
+  vdd-csiphy-0p8-supply:
+    description:
+      0.8V supply to a PHY.
+
+  vdd-csiphy-1p2-supply:
+    description:
+      1.2V supply to a PHY.
+
+  phys:
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: csiphy0
+      - const: csiphy4
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports. Supports either standard single sensor mode or
+      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
+
+    patternProperties:
+      "^port@[0-3]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint@0:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            description:
+              Endpoint for receiving a single sensor input (or first leg of combo).
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4 # Base max allows 4 (for D-PHY)
+
+              clock-lanes:
+                maxItems: 1
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+          endpoint@1:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            description:
+              Endpoint for receiving the second leg of a combo sensor input.
+
+            properties:
+              data-lanes:
+                maxItems: 1
+
+              clock-lanes:
+                maxItems: 1
+
+              bus-type:
+                const: 4 # Combo is D-PHY specific
+
+            required:
+              - data-lanes
+
+        allOf:
+          # Case 1: Combo Mode (endpoint@1 is present)
+          # If endpoint@1 exists, we restrict endpoint@0 to 2 lanes (D-PHY split)
+          - if:
+              required:
+                - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 2
+                      maxItems: 2
+                    bus-type:
+                      const: 4
+                endpoint@1:
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 1
+                    bus-type:
+                      const: 4
+
+          # Case 2: Single Mode (endpoint@1 is missing)
+          # We explicitly allow up to 4 lanes here to cover the D-PHY use case.
+          - if:
+              not:
+                required:
+                  - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 4
+
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
+    unevaluatedProperties: false
+
+  "^opp-table(-.*)?$":
+    type: object
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: isp@acb7000 {
+            compatible = "qcom,x1p42100-camss";
+
+            reg = <0 0x0acb7000 0 0x2000>,
+                  <0 0x0acb9000 0 0x2000>,
+                  <0 0x0acbb000 0 0x2000>,
+                  <0 0x0acc6000 0 0x1000>,
+                  <0 0x0acca000 0 0x1000>,
+                  <0 0x0acb6000 0 0x1000>,
+                  <0 0x0ace4000 0 0x1000>,
+                  <0 0x0acec000 0 0x4000>,
+                  <0 0x0acf6000 0 0x1000>,
+                  <0 0x0acf7000 0 0x1000>,
+                  <0 0x0acf8000 0 0x1000>,
+                  <0 0x0ac62000 0 0x4000>,
+                  <0 0x0acc7000 0 0x2000>,
+                  <0 0x0accb000 0 0x2000>;
+
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_wrapper",
+                        "csiphy0",
+                        "csiphy4",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CORE_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY4_CLK>,
+                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe_lite",
+                          "cphy_rx_clk_src",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+           interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy4",
+                              "vfe0",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc",
+                                 "sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
+                     <&apps_smmu 0x860 0x60>,
+                     <&apps_smmu 0x18a0 0x0>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+            power-domain-names = "ife0",
+                                 "top";
+
+            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
+            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    csiphy_ep0: endpoint {
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


