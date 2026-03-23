Return-Path: <linux-arm-msm+bounces-99249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE+NITc6wWn2RgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:03:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57F2F26F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CE9C3047A48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB2D3AA4F3;
	Mon, 23 Mar 2026 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4bOTYQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgPPo+Z2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61043A9D92
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270713; cv=none; b=cWaPBxUPqK9+xYkwvAC6B0R72YkJopGN/NWDSuz1of9TGIMFAjLIRnlISiudirX84xi1KdDN2XzN0vMV4aj6awO5LXGAphbtxrs0qHip3SSYXTr4/NHlYhAvtyxaMHCysbCUtzfNXP2aORe69LPpRThdND4aC9zj2HIgRoStJkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270713; c=relaxed/simple;
	bh=KQty+qIegyI7QufJCyR7H0o8gE6RrZyNKWlDUtYTku0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HY/uARLejB1VIcEcHuSEsXIyQACDcvYlJbfOIaiANXUx4NO8Rk1pAn1FAzNVS4fpY0WfTOYnPhXvFnXy9Sk+UuEK4mSXlMbL5KPYI998OSb5byKasbTWUBBDIDriCm8R6b5dRFJ862ZKHjhoLNpwZCsh8udjGLA9t+PiCHzP+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4bOTYQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgPPo+Z2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72leJ3295180
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FbLe/4W/tcC
	wJ1F3660nrpNBZS4syb6G0J+e/7YYzwk=; b=h4bOTYQuq6bUumUdz1goKoJmtmP
	61wPfGPcWf0P7W3vwebwPwsBmXTf2aEbZRDWhXO1SzZil63qzTx4ZL+iJV7xgrzx
	Ruih3rYl1qjfMxOk5pEhBwrKc8QajTqXUZLDuatpy3j/8t/+KFhFLa1Ht+CpqRRl
	SnuauOEQd6dKmxb1ZvHpN8WvZN1d5W3p3uTRDNaxhqxSRW5XsXYkEmcuruAxajX3
	D1CHsXy4A/b/jH9C+pGlnLNMEm6drfBIzUUxLq3bLInenKy5FlGvkb/Dl430vXDG
	eV+Sf/ORoBT7eCKwRvU7n4ybmip8PFKiowXuYs9neVuT0DwilT+xsswtL8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8kbcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:58:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b92f327so313203101cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270711; x=1774875511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbLe/4W/tcCwJ1F3660nrpNBZS4syb6G0J+e/7YYzwk=;
        b=fgPPo+Z2UGz7nJREYLFJdmZvTabFKwxnTPpmSGe1IEN3CVK6spK1ENjLEbTHwmD/sH
         5uyBwR8bAYCjIV6PvUkJK9lpi9nLMTq7LlmCR6mSHMK4/t74XbPTyAqzFTPmb5An1otI
         Xga1BIdQFA/gq9gQ+Qr9jh2e9HoFrChNOmIGHQQcQ4abwFMhkJFN28VE8BR097YXTCLh
         C+4khq6xwA39r7ox92Bscs+NB7g/LSqFjJ1b+91ZW/a1RVAAAzTNYdsMvQTvq1xfdmEY
         8/xgbd1j27ngKE8tCabbGFvMFe2YKQLRjvBMk50+AW1hKJ5omcG8KfYYEft3cF66hRV3
         nDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270711; x=1774875511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FbLe/4W/tcCwJ1F3660nrpNBZS4syb6G0J+e/7YYzwk=;
        b=GN1qATOtnQixmv2lBXiQFmp+vE3/450X8jCehq7/GNw8Pq/hfzEJ+FJ2vPYq4P0XEX
         IP3DL93fFB/TUUWYCgmV6B7rFw7OxCtDNBPy0+rAX8fGbDLIa5cLNu7FmHNHdDBypL29
         lUYptTHSrkUx0mxJ60c7qH0YWfSjAOjk1JMGSTmn2xVH2eZFZYT7gXfEK8ult1zZDlRa
         uQXsyVrrqVVeEHmo6QsFWCeEbokkqKVEu8lncWa04V52SMLKC2OtSI3Ec3P54JUDRa6n
         ZGBvA7TgYrWDwshc+wC5DYVPI4EqOCtz7cW9a+nlxqP4dJUhorWSvtgoxO7uImZ8Ai3s
         okKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXilzdu1Okry5tEWiNvAYO4ikfJcFoZy34jXlY18hXJnifcTs8LXXhNua444202Hme8S0xleVQkkaA5ZYag@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4HgDUVJoKdyZA+7bfSfLfv0X9brNrlqVqula4Xnu4wVMi0NaP
	aU0hoowebaqWor2IBEo1YGrszBLc/yZZc3/TiLj3LN0b4gI6ErJFszxfrON96UuLmBLWRxchT36
	r8Z9tXwWSVDrujmhgJaNBMYUZ4E/3iT/doN63bW+HUn/3yO/FcwwgfnMAEvTLI2otk0c1
X-Gm-Gg: ATEYQzwfji4BFx+yaT2bv6Q6a47vvR6R7niKCe9D/28ZhK0Bo0+cp+y8fa9SHP/wApj
	8euB/PmjWFs0CwfeKp7xTczva5ZmXpbps/CX3TDhXQAm7lfwSSyOqIh43lhEayTp1xH9B/H3u+8
	tTdF+v/PmAw6D8aiZad9e1q6fGtd4arD0TO2TQiMapACkiRbIsreAw6Th9x/1WsIKo7SuQA00Vd
	HaJCnykI0fLdwuxXf6L20nPjrbiceMf/cptoJPM0VxQ6wN8UeTymeFvPNK8vOQmGk2GfcfFZ9bA
	g16W9BLrI/68Wb2/fYnycaCeMqdySkefv8JxQmL0wD1DiXtjUF+N5rw4WEjrM4xdrruyok0IuC3
	4D7RVW2MPxcbI0ObffUYVdYav6RI+lp4JwgaZYAKwX9vsBk9qnD78EOK5c7gsdR73yR6bWAUZo8
	J9wOHGBXgF02RS
X-Received: by 2002:ac8:57c7:0:b0:50b:567a:e941 with SMTP id d75a77b69052e-50b567aef11mr67494381cf.36.1774270710920;
        Mon, 23 Mar 2026 05:58:30 -0700 (PDT)
X-Received: by 2002:ac8:57c7:0:b0:50b:567a:e941 with SMTP id d75a77b69052e-50b567aef11mr67493751cf.36.1774270709953;
        Mon, 23 Mar 2026 05:58:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:d9f3:cf55:9f3d:be1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfb9sm487139066b.37.2026.03.23.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:58:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RFC PATCH 1/3] dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
Date: Mon, 23 Mar 2026 13:58:22 +0100
Message-Id: <20260323125824.211615-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX+zA3vQI+ZawJ
 K1HDb+AE3ncy2O2OwYiwayg26MjtX2b0B3VK4UajeXaOIjSBcmTtbQ8bONfoC+NH7Q/LouXZKg1
 w2/CiqRJLX9AjTMMR79sNiE14L8mXjeaO7jrFI/SvCB4j+HYWsyyAVxXANiDQSxEyR2cwvLE4BB
 AboShMBMMCfGKYOp6cWH06nBX15tAOn7gJIGhAvQA8ftoE0KZJbsXNyrODq12cdUh0RPB+fuQkZ
 AgAp7ckGuWrWrpbl0WAonJ5G+TiLIFezrF3fEtHc6PRuGxG2/bseE6fZEYtqmmuDjPBM7EQr0g/
 4E9zaMX6+XSoexMS6Pa3vZDYgq3YVuL4Y3IOcDpCCkeQvtlbGT9mdfrjdq4m3F5BfavMz2cKnbe
 CfkkEJV74xgoHTu3+D+LAnskFO16MqXcpMwGkkFIEwyJ1Ze1PaE/mGrixvEzA1pKo21ODiefPRE
 BAYed2JmlIZ4A94HNTg==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c138f7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=SSwZ1itlJRgpVSTRIaIA:9 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: JJ78QDe8tG-LPkldAZ03a8HKkxK1gBSz
X-Proofpoint-GUID: JJ78QDe8tG-LPkldAZ03a8HKkxK1gBSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99249-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C57F2F26F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,camss-ope.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-ope.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
new file mode 100644
index 000000000000..509b4e89a88a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block used. It supports a
+  range of pixel-processing operations such as scaling, cropping, gain
+  adjustments, white-balancing, and various format conversions. The OPE
+  does not interface directly with image sensors, instead, it processes
+  frames sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: top
+      - const: bus_read
+      - const: bus_write
+      - const: pipeline
+      - const: qos
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    maxItems: 2
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: true
-- 
2.34.1


