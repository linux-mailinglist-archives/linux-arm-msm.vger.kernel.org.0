Return-Path: <linux-arm-msm+bounces-118075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sD4NNJjjT2ohpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:08:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 641377341EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:08:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="d/93a1G2";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GhdSWSHQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118075-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118075-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCDDB3031FFC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690EB4DB572;
	Thu,  9 Jul 2026 18:08:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0DB4DB564
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:08:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783620501; cv=none; b=f+V/rwRt/lgfNEL84UJlcinlFmXxtfh5X4XyNv5KKemi6jEIdJMzpayKPmg7RsfTGtjkH58EjyzZKYTgnuMwZhUVFvPNeEce7ELfj3FnmoUtHDajCydaMWHjiBrm8dP1oxmjtKaRlhjATeR83bzjHya0zDLu6t4k9V3H+Jxz/nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783620501; c=relaxed/simple;
	bh=uz+vzd7RmgZ7kpP3XZeKq6BnOvCey2UnJqF+9iQN0cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NiYprMYzuVsca9K4y/LdGdV0r/mDTDyyJV5nITbLlJYRA+Z8v8WXpr3uIV3o5+wx9N1C8SEuWmglx0meXrP2hNrQJe1uNAb8Zw/SrrZo+eu0yIGQURVJv5yKvXr42y0Pnb9EWNO/RuTcZyz/5mwkoHZQIajhxuP6ruXXb4TMk7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/93a1G2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhdSWSHQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HX8MD2563673
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tlzwApBJdY1epxcxrXUYA/9lKWGCP3U4ygrGwNfttyQ=; b=d/93a1G2wUoGPdkJ
	lPhX05yJrmtKIbfi6eBe5lcAZdLzL7BnH2XHKoq1hmuxQ0RmNhaSceWnzqGEWoRL
	2iYQFA/7gmAr2jU99WL2jxQL/ir1Z7MAKy9Q25/GFW2ozX3NeVks5Q982niKPiXw
	DFPvk/dAyMrYSGjXY0jonawQGgCaRjjvRgabb452f3KSFhYvGFS8rliEEMEkPYRP
	4WX0jJqez9VjROk6i1VogrYYFoj4ypzdmFHNZ74xwDVaPtYSZNq46nd9psg9k4mT
	IT2SkI2T00TjI8JL5GsVTMNHmnn16JkFn3jVQqiGrMvo1BoKOAaa9auh4Go3ECm7
	Bi5ZfQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3gsd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:08:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c892143db7fso98803a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783620495; x=1784225295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tlzwApBJdY1epxcxrXUYA/9lKWGCP3U4ygrGwNfttyQ=;
        b=GhdSWSHQL1r0vUmCL1+y7Hc9UouiLdPCZhToy+dFozzdarlwiSRML0KtJi61h3G7XI
         PCOe7nGcvPMZK//XxS7rmKQ95knnW51TawE9h2E7ta7deTbCn8YeV7ZgwchuYiTDMvNF
         D/cK0bFkQ+q6aZYjsBe/mnctfKbYBPOH6wi/AvRDmGoq8Pqi02lCE7womjxLuZpCx9mT
         +zCY2uECkCP3WL8bXZkGyR92pYRJtL6jU/Nc+/UDviqoidBzITfENQ3dBXMF/nHhl60p
         dLeU9da/AVjB2s1X8JQvtCVZhz/GeVkP/WZrm1n6+78y+SaWgFKBpXcRiyW+sMzRNFEf
         L+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783620495; x=1784225295;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlzwApBJdY1epxcxrXUYA/9lKWGCP3U4ygrGwNfttyQ=;
        b=jYO02uTTNHmDYp61+oS4diolMPI7fQaIpdDsUEtsLvOQEIL/En6x/+iNuRwvS1pv94
         kQ4WAIw6WzNn4zxnxhX9ovZJDMvzcKFfkA2za+1zig3zCMZqdDUE6hw2sX/tlgnjbrMm
         v9WqJ0y/nar83I0gYyY16v0YEd42Tmlu1agwq47R0XpshG9od7K6C8Z9W3CqRmMS+vaq
         K2HHW8/gT5hTPPv/0yolLCAr5KLsK7VNw5LTV9FFxBIiXoSQ+jMTJCu7QYDwFgC6cjv1
         EDNJmtaKM8UA/yp0yuN6rairXWhgplLkPQT8iIDk/dcYdYF4co8gC1FWSu7aLkQJ4oBh
         G8zg==
X-Forwarded-Encrypted: i=1; AHgh+RoqP12Q8BBSOqrbQhb81QVLdSU/5TKXzkJZvxsHlu3r48xL15Y6EuC1ssw1jVIMtODTd3V5GEfIGwV19ONM@vger.kernel.org
X-Gm-Message-State: AOJu0YzaV0wlU1F4mi5c20zVYayxxiT6x3wHQRJXwnsMDnDfzE8lCjnY
	BCSqolZiOidSGPd/IwhSXc66jmBnWJlpj2k4AqiAUqDzr9g+XIz/2vpjwGXzUVeS5mDhQYWRu2a
	rRX/lkFKFmhsNjJNd2x47VbmWm8/dNsQe5O1RzOw9inWayQZbAbLqYMCixagFkWQgsVpg
X-Gm-Gg: AfdE7cngwC5qLT6lD1MRttfjn2JonyqC54zza/t+eFgGwJWpcGR0HHdBNkVpWgryQg9
	wLutA/UxeM664FrDFXpZwHrPcvHXzEmtq7w7nPHXLPjCx8n6jxmqAbBU4s0u9VBlGBaHL53zRip
	j2NUAps6KJdjvMFFXY7Plz95iwd5sdQwyMkk0OcWAAgBXNI+OuZZoIAXbtuGF+ilByBtwywIjJ5
	o3GcIfGy9u13lQIj+eERc3lUxQ/jtPoy5D18b6e6b2aBwip+U/TG0kp0s3JG0H144AkZOio/K1u
	uf687NI3mMQ1Nk2ngxi4N4YgW6aLJG1c0oZBbk9C29rNqrySlyupmPDSEO9eotLNYWbwi4oNJ33
	bxogTFaEnDBpYE5Doi4BNnGjMwTyy5w==
X-Received: by 2002:a05:6a20:d491:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c0bd1764damr9970597637.40.1783620494889;
        Thu, 09 Jul 2026 11:08:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:d491:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c0bd1764damr9970550637.40.1783620494243;
        Thu, 09 Jul 2026 11:08:14 -0700 (PDT)
Received: from codeaurora.org ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311b00048a3sm3283638eec.5.2026.07.09.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:08:13 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [RFC PATCH] dt-bindings: power: Add power-limit-controller schema
Date: Thu,  9 Jul 2026 23:37:26 +0530
Message-ID: <20260709180727.4015267-1-manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703-modern-indigo-wolverine-6b6eaa@quoll>
References: <20260703-modern-indigo-wolverine-6b6eaa@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX7YjVmxU/eTmH
 1aIBlkmgyExOavzpyMuLcVrG8I0G//esNtpq0G0a61ketpY0AC/fJbc9QNNqKD948eY94sKIWgc
 +/J7OAI/vpZxjQlam0x7gcUo7hza3Gi1Gos9g6N4+M+rYk2ZN8q01HE966FnpcUpTCI9j7bQEtT
 mmDsz7P43dcOO5m+76NdMY3Lvi5N9Ytlhc7mASYIC33LLYb8DRqnTB1VT58l5eGIscz6SJrpa39
 FqNnZNbr4dQu089PhC3mhMvLEZAjedspg0odblad0MEpFBXih4DM2abTuGX1Nc3qr8t+FmkCV9M
 S4ju4IITbDwDo18aOEJ7zFSpQZcNgOv0YaPRu4SVJEX9KNREeZgEM4vZq96nj4932sH+dztwNfh
 3tyfVu5Ute6zOOvDPMBb2+tkunDE/vwWoyZlRsFd5Pp+pZmYTSgBfM7tJiYRtWaB0JR+3fiyhBt
 F7GpxPFnbdIppD39JRA==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a4fe390 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=LaiKnl5kAYiPZcn9ShgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX63nMckNAbZpg
 VLXL5vKEv0EeEv2YjD8KSWGDUT4VHnoRuM7xTWHRuuAT72MeuSeSrLOUdw2WnUwMKHc2IvoxAjn
 8HW0XMa+KmVMCFPwMRU9eY8a2ZHPoU4=
X-Proofpoint-GUID: 0FdnqxROgALRnBCVrd7G2WM-jAt-Eejg
X-Proofpoint-ORIG-GUID: 0FdnqxROgALRnBCVrd7G2WM-jAt-Eejg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118075-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 641377341EB

This RFC proposes a new device tree binding schema for power limit
controllers that manage SoC power domains with hardware-enforced power
capping capabilities.

Background
==========
Modern SoCs implement sophisticated power management hardware that can
monitor and enforce power consumption limits across multiple power
domains. For example, Qualcomm's SPEL (SoC Power and Electrical Limits)
manages hierarchical power domains including system-level, SoC-level,
and individual subsystem domains (CPU clusters, GPU, modem, etc.).

These controllers help prevent thermal overload, maintain system
stability, and comply with platform power budgets. However, there is
currently no unified device tree representation that can describe their
hierarchical nature and diverse capabilities.

Proposed Schema Design
======================
The schema supports a flexible, hierarchical structure:

1. Power Limit Controller Node
   - Root node representing the hardware controller
   - Uses #power-limit-domain-cells for domain referencing

2. Power Domain Nodes (power-limit-domain@N)
   - Individual domains/zones under the controller
   - Each domain identified by a register index
   - Optional parent-domain property for hierarchical relationships
   - Can be either:
     * Monitoring-only (no power-limits child node)
     * Power-limiting (with power-limits child node)

3. Power Limit Constraints (power-limit@N)
   - Multiple constraints per domain (PL1, PL2, PL3, etc.)
   - Each constraint defines:
     * Settable power limit (with min/max bounds)
     * Settable time window for power averaging (with min/max bounds)
     * Default values at boot/reset
     * Constraint name for identification

Hierarchical Example (Qualcomm SPEL)
============================
   System Domain (with PL1/PL2)
     └── SoC Domain (with PL1/PL2)
           ├── CPU Cluster Domain (with PL1/PL2)
           ├── GPU Domain (monitoring-only)
           └── Modem Domain (monitoring-only)

Before investing further in this direction, we would like to check with
the community on a few points:

1. Is a generic power-limit-controller binding the right approach here,
   or should this remain a vendor-specific binding (e.g., under
   qcom,spel)?

2. If a generic binding is acceptable, does this schema design look
   reasonable as a starting point?

3. If this is the preferred direction, we would need to design a
   generic driver that consumes this binding and exposes the domains
   via the powercap sysfs interface — effectively requiring a
   significant redesign of the existing Qualcomm SPEL driver to sit
   on top of a vendor-agnostic core. Does that align with what the
   community would expect here?

Any guidance on whether this is the right path forward — would
be greatly appreciated before we commit further engineering effort.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../power/limits/power-limit-controller.yaml  | 238 ++++++++++++++++++
 1 file changed, 238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml

diff --git a/Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml b/Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml
new file mode 100644
index 000000000000..9cd4d9d6414d
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml
@@ -0,0 +1,238 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/limits/power-limit-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Power Limit Controller and Domains
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description: |
+  Power limit controllers are hardware blocks that enforce power consumption
+  limits on SoC power domains to prevent thermal overload, maintain system
+  stability, and comply with platform power budgets.
+
+  The binding supports a hierarchical structure:
+    - A power limit controller
+    - Multiple power domains/zones under the controller
+    - Each domain can have power limit constraints or be monitoring-only
+    - Domains with constraints support multiple power limits (PL1, PL2, PL3, etc.)
+
+  Controller capabilities:
+    - Hardware-enforced power capping for one or more power domains
+    - Multiple configurable power limits per domain (sustained, burst, peak)
+    - Time window controls for power averaging
+    - Energy or power monitoring and reporting
+    - Power balancing algorithms across domains
+
+  This binding describes the common properties for power limit controller
+  provider nodes. Individual controller bindings should reference this schema
+  and add device-specific properties.
+
+select: false
+
+properties:
+  $nodename:
+    pattern: "^power-limits(@.*)?$"
+
+  '#power-limit-domain-cells':
+    description: |
+      Number of cells in a power limit domain specifier for child domains.
+      Typically 1, representing the domain index.
+    const: 1
+
+patternProperties:
+  "^power-limit-domain@[0-9]+$":
+    type: object
+    description: |
+      Individual power limit domain/zone under this controller.
+      Each domain can either:
+        - Have power limit constraints (with power-limits child node)
+        - Be monitoring-only (without power-limits child node)
+
+    properties:
+      reg:
+        description: Power domain index identifier
+        maxItems: 1
+
+      domain-name:
+        description: |
+          Name of this power domain (e.g., "system", "soc", "subsystem").
+        $ref: /schemas/types.yaml#/definitions/string
+
+      parent-domain:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: |
+          Reference to the parent power limit domain, if this domain is a
+          sub-domain of another domain. This establishes a hierarchical
+          relationship between domains.
+
+          For example, a "subsystem" domain might be a child of a "soc" domain,
+          or a "soc" domain might be a child of a "system" domain.
+
+      power-limits:
+        type: object
+        description: |
+          Container node for power limit constraints within this domain.
+          Each child node represents a power limit constraint index.
+
+          This node is optional. If omitted (or if monitoring-only is set),
+          the domain provides only power/energy measurement without limits.
+
+        patternProperties:
+          "^power-limit@[0-9]+$":
+            type: object
+            description: |
+              Individual power limit constraint configuration.
+
+              Each constraint defines:
+              - A settable power limit
+              - A settable time window
+              - Optional min/max bounds for power and time window
+              - A name identifier
+
+              Typical constraint indices:
+                - Index 0: PL1 (sustained/long-term power limit)
+                - Index 1: PL2 (burst/short-term power limit)
+                - Index 2: PL3 (peak/instantaneous power limit)
+
+            properties:
+              reg:
+                description: Power limit constraint index identifier
+                maxItems: 1
+
+              constraint-name:
+                description: |
+                  Name of this power limit constraint (e.g., "long_term", "short_term").
+                $ref: /schemas/types.yaml#/definitions/string
+
+              power-limit-min-microwatt:
+                description: |
+                  Minimum power limit that can be configured for this constraint.
+                  Represents the lower bound of the allowable power range.
+
+              power-limit-max-microwatt:
+                description: |
+                  Maximum power limit that can be configured for this constraint.
+                  Represents the upper bound of the allowable power range.
+
+              power-limit-microwatt:
+                description: |
+                  Default power limit value for this constraint at boot/reset.
+                  This is the initial value that will be programmed.
+
+              time-window-min-microsecond:
+                description: |
+                  Minimum time window for power averaging.
+                  Shorter windows allow faster response to power excursions.
+
+              time-window-max-microsecond:
+                description: |
+                  Maximum time window for power averaging.
+                  Longer windows provide more stable power limiting.
+
+              time-window-microsecond:
+                description: |
+                  Default time window value for power averaging at boot/reset.
+                  This is the initial value that will be programmed.
+
+            required:
+              - reg
+
+            additionalProperties: true
+
+        additionalProperties: false
+
+    required:
+      - reg
+
+    additionalProperties: true
+
+additionalProperties: true
+
+examples:
+  - |
+    // Multi-domain power limit controller with mixed capabilities
+    // Demonstrates multiple domains with and without power limit constraints
+    power-limits@ef3b000 {
+        compatible = "qcom,glymur-spel";
+        reg = <0x0ef3b000 0x1000>;
+        #power-limit-domain-cells = <1>;
+
+        // Domain 0: System domain with full power limit control (PL1/PL2)
+        sys_domain: power-limit-domain@0 {
+            reg = <0>;
+            domain-name = "system";
+
+            power-limits {
+                // PL1: Sustained/Long-term Power Limit
+                power-limit@0 {
+                    reg = <0>;
+                    constraint-name = "long_term";
+
+                    power-limit-min-microwatt = <15000000>;     // 15W min
+                    power-limit-max-microwatt = <28000000>;     // 28W max
+                    power-limit-microwatt = <20000000>;         // 20W default
+
+                    time-window-min-microsecond = <1000000>;    // 1s min
+                    time-window-max-microsecond = <10000000>;   // 10s max
+                    time-window-microsecond = <8000000>;        // 8s default
+                };
+
+                // PL2: Burst/Short-term Power Limit
+                power-limit@1 {
+                    reg = <1>;
+                    constraint-name = "short_term";
+
+                    power-limit-min-microwatt = <15000000>;     // 15W min
+                    power-limit-max-microwatt = <64000000>;     // 64W max
+                    power-limit-microwatt = <45000000>;         // 45W default
+
+                    time-window-min-microsecond = <10000>;      // 10ms min
+                    time-window-max-microsecond = <1000000>;    // 1s max
+                    time-window-microsecond = <28000>;          // 28ms default
+                };
+            };
+        };
+
+        // Domain 1: SoC domain - child of system, monitoring only
+        soc_domain: power-limit-domain@1 {
+            reg = <1>;
+            domain-name = "soc";
+            parent-domain = <&sys_domain>;
+
+            // This domain exposes only:
+            // - power_uw (current power)
+            // - energy_uj (energy counter)
+            // - enabled (measurement control)
+        };
+
+        // Domain 2: Subsystem domain with single power limit
+        power-limit-domain@2 {
+            reg = <2>;
+            domain-name = "cpu";
+            parent-domain = <&soc_domain>;
+
+            power-limits {
+                power-limit@0 {
+                    reg = <0>;
+                    constraint-name = "subsystem";
+
+                    power-limit-min-microwatt = <5000000>;      // 5W
+                    power-limit-max-microwatt = <15000000>;     // 15W
+                    power-limit-microwatt = <10000000>;         // 10W
+
+                    time-window-microsecond = <1000000>;        // 1s
+                };
+            };
+        };
+
+        // Domain 3: Another subsystem - monitoring only (no power-limits node)
+        power-limit-domain@3 {
+            reg = <3>;
+            domain-name = "gpu";
+            parent-domain = <&soc_domain>;
+        };
+    };
-- 
2.43.0


