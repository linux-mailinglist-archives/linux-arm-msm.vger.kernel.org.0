Return-Path: <linux-arm-msm+bounces-105953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHTlGcri+WmlEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:30:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5622E4CD7F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1472C3038E54
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4ED43901E;
	Tue,  5 May 2026 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9o8/5+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXI9QbLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3707438FF3
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983929; cv=none; b=bpdjH26doem1E8/lCjN06Xo7kL8VGviH2tEp/GzWfGObYQb/9U/8J4mQrUBMTsRLi/KXMPOVNhLtt9EoKAutKjQCOVuQgolHV2iymNJcSsK5bSJLy7T9i/f01WkSIhEu6ecy4DT3ORVfd+0koEO7E6UUbvdmC+oz53Lgx5Q2MG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983929; c=relaxed/simple;
	bh=UHYiBMmAeYcwT/oKI59kIU40Oa6oQXNeQvw8DW7wwUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLavLyWht83oBKggjM7qDiR9Bz/xPC4qNC3ovJ/+wypp0qPsSy0GleZIU1pehBmbBAq54KHVu2WYjo5w9KMzrVFqz3purodrMxkB+hstOjvH+zukOFIiMZYYjYRStAG+deZTCNP5drDL0BgNbcppVlql7v9XZJSbSjvvoVc8pfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9o8/5+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXI9QbLZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457l6uW1186937
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 12:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZf2r7pK9NMV0g29eBVq5NPT9XVCIRwIpXmVRC6PE58=; b=W9o8/5+tUm3HVB/t
	J5eJi8MBnY7bQiFTQttZ6Ym9KWPRiYnODu3IrHMJHOlz0PfnbITjE6qt1JHnPoXj
	5yeUJsHcsKFN+ABhxEn2nBPXygwo8BE0XWrQ80XxxcslVXyFTZaJjVp5K8z7CqoJ
	owYdO+UdkBC+0q80r2TI5+3ZakMwyMcIIvrkCi8f6xqGXVnG6O3YdxIy9hshjray
	RsWAYdKzrwrM9a6zQma3IXR0hr/0AnE0TlHvw/vM9shQjE7XJAIhYwdfezjky0x6
	FqMCJeYh3aysBgMpSeBN6DZWt1P5EibBlTmLMrFjTwbyfQRDV6zlzxi2fwABpraN
	bEWgMQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvgc9ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:25:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8385953d8e9so371304b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983925; x=1778588725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZf2r7pK9NMV0g29eBVq5NPT9XVCIRwIpXmVRC6PE58=;
        b=BXI9QbLZd96v9FJOPXzW+ez7i4jW2dLLIU5VWeN6P1bIWIU42ZazJdBCpUtcozfmnY
         OVJkhvShvieGcOte3akXvHbGh9abtLOs6cgJPFGP9pw8SY0bcLW+WqSpUi7FB08+WCtU
         Y3OIhw/XUc32cmT6DQSxwo15uLyN31kUJ+T4P8YkmK693PzzHaw+cTygM4rIF+xT2k+8
         q/GhRtx6VmnU1KXEADBZKAzL1XwXIxTlVh4Qs8fVjMtVNbDryIXAUo16sEdli01piUS6
         MPjfFJ+lCBP7xRfFH01SIZLH2mkhsP1h83y7hxljkzUKLZ8aAs6Rs4PSwqcIhXbFmIfW
         BEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983925; x=1778588725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZf2r7pK9NMV0g29eBVq5NPT9XVCIRwIpXmVRC6PE58=;
        b=KGkgPhFwMkTjbyUVVWIsW8AACxgXAGMmnncGa1FSaGTgysZCuP76PhIBp1M8jIO/ZH
         nJo160ydIcQbziPVpQyq6t8CMcMzFylt1oXRLM8zf/ocMkoatJCzMwJkB56ZwF97Ffgg
         54QaQw32zkSVj4ollwRFm4uoFbYtFzdzfCCH6vAvkqjawnDOEIm9F7lBzkBjkOeaUTqz
         6i74aXtweoZZSN8DnDumMWNAHymc8nfNKuO0/TlLszFBQiV5JgbFhcF9EExgeONIQhlW
         P3vRW2G9DrIEW0wY2ckZ9dSSNc2sTUWtpmr5a4y9mmtKYSC/pN1NQ7oXPB7rhzmkkIlc
         eL7A==
X-Gm-Message-State: AOJu0Yw9peyTq17MNNN4E5+SxmKFtQFEspHFfPKGF33QjcaNPwHBr7tB
	Ucx6g2MIuwJ4LFf8L4cv34tC0z5+Lp5QxN6HZ+z5oIAZ/bmpixaFozHwwymyLiQliqTa/jCsjMK
	y8ajScXsCySvASwDCW+iDenFVUtcUbYUwUoOFpXPC6z1+6n9A3VDi3wCYslww8e1m8WSL
X-Gm-Gg: AeBDieu0u/ZBXv0Cclra1ep8601nTSMlzZB5NWZvty2XIPiKGBkOsjX1tfzA3xSQWsY
	+H8LpFBFZeXwYvl+BxZHKGtfGXo5+o3eerM8xObYFgQ+t7Vh21LbLU4Ic7pvqHR9fGGc/TBbKhg
	4bbApGEX6j9H7zEhvggGOhQEv1pP/yIC3s9dH/y6nUEKXZ6FUcJyTJyTdHDOos1ROaPoDli3uyc
	XqonhsxZnX85mFWtPgJnR4lHPMD4sIIRisW5IEGW6V247guKThZgKzfKmaSdHP958fO6tzPUocG
	mlXBrDh8zWixHTvLU26lVZr8thDcEz0AFM6Y8vloJeaXMyI5jqYG90jE11X2GfUV6TQb6AeuDZe
	q92ZM9hoSpD7HK+LqEXM0txiLmsH5XK9oy9lFvgl748+s1gBGiHeEDRf8kttpE1g=
X-Received: by 2002:a05:6a21:e58b:b0:3a0:b812:3a84 with SMTP id adf61e73a8af0-3a7f1ab60cbmr7561842637.1.1777983924548;
        Tue, 05 May 2026 05:25:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:e58b:b0:3a0:b812:3a84 with SMTP id adf61e73a8af0-3a7f1ab60cbmr7561804637.1.1777983923927;
        Tue, 05 May 2026 05:25:23 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:23 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:49 +0530
Subject: [PATCH 5/8] dt-bindings: arm: ras: Introduce bindings for ARM AEST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-5-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=17370;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=UHYiBMmAeYcwT/oKI59kIU40Oa6oQXNeQvw8DW7wwUc=;
 b=f4X30PASN24PpuxlrbpxYQZBWzx209SeZljlnp69AjiGRkj+36R5vxwg3Qy5cQBrM/hbFOpjx
 u4UP5xT2z8ODHJb/19T3Ngha9QvMUP2gtbjutRuGfrAcWKWTjmmt8b6
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-ORIG-GUID: U1Lu0dngg1G0HXRFaf91eTRP7hgrHFyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX6MHVyNp7RHZr
 ZuHBd/pdgnmArkXuODgJG/Y5A6nQqwgr1RtPe687YlO9ejdqmvuPNo/Egj20w8Cqqb0FP6UQaIG
 flZN/AVwFIWYqq1lg5F0+Nnw7WkvuGBN5dgPgd6PTVX8tnEJYX4mF/dkgla+NDgayv3FTdWp3W3
 vH1DcTE0U2u8eYPruSTaCMNFQRv0Cqx1VUm0pj+EuiBn7K4Q93NQTZDTon12/F2/GwhptD+nOaO
 1KNSJcVYsNXh5gUBs6CbkHWkuOuwHuFKkvQejxIpp/CyepPYiIq52bMwUeQBZHOt4MPpHopk44h
 4JJ/XWBdco+ECufeGunpLHXPr1AsnCOecYBIWFyVSN3M5b2CfhSY5chFmrDqaYvNVrd8/9FBKEv
 xUCRX+r44qCFNFmPI9napU0qhhapHy8CetD1y2Km4Z0JhzBNjoQWe7gak3RXUMqd8Eq1dnTtP4D
 cRh8yllSB3xArecF2Lw==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f9e1b5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=vTNCWx79gXjKDdEYbRgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: U1Lu0dngg1G0HXRFaf91eTRP7hgrHFyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050117
X-Rspamd-Queue-Id: 5622E4CD7F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105953-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,2.251.23.144:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Arm Error Source Table (AEST) specification describes how firmware
exposes RAS error source topology to the operating system. On ACPI
systems this information is provided via the AEST ACPI table.

Introduce Device Tree bindings that provide an equivalent description
of AEST error sources for DT-based platforms.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++++++++++
 include/dt-bindings/arm/aest.h                     |  43 +++
 2 files changed, 449 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,aest.yaml b/Documentation/devicetree/bindings/arm/arm,aest.yaml
new file mode 100644
index 000000000000..7809a0d38270
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,aest.yaml
@@ -0,0 +1,406 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,aest.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Error Source Table (AEST)
+
+maintainers:
+  - Umang Chheda <umang.chheda@oss.qualcomm.com>
+
+description:
+  The Arm Error Source Table (AEST) describes RAS error sources and their
+  register interfaces. Each error source exposes one or more error records
+  through either system registers or a memory-mapped register window, and
+  may signal errors via interrupts. The top-level node acts as a container
+  for one or more child nodes, each describing a single AEST error source.
+  Refer to the Arm AEST specification (DEN0085 / DDI 0587B) for details.
+  Flag bit constants for use in DT source files are defined in
+  <dt-bindings/arm/aest.h>.
+
+properties:
+  compatible:
+    const: arm,aest
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+patternProperties:
+  "^aest-[a-z0-9-]+(@[0-9a-f]+)?$":
+    type: object
+    description:
+      An AEST error source node describing one error source defined by
+      the Arm AEST specification.
+
+    properties:
+      compatible:
+        description:
+          Identifies the type of AEST error source. Each value corresponds to
+          a distinct error source class defined by the Arm AEST specification.
+          arm,aest-proxy represents a proxy error source that forwards errors
+          from another error source.
+        enum:
+          - arm,aest-processor
+          - arm,aest-memory
+          - arm,aest-smmu
+          - arm,aest-gic
+          - arm,aest-pcie
+          - arm,aest-vendor
+          - arm,aest-proxy
+
+      reg:
+        description:
+          Register ranges for the error source. Absence of reg implies
+          system-register access (interface type 0). A single range implies
+          memory-mapped access (interface type 1). Two ranges imply
+          single-record memory-mapped access (interface type 2).
+        minItems: 1
+        maxItems: 4
+
+      reg-names:
+        description:
+          Names for the register ranges. The base error-record window is
+          unnamed (or first entry). Optional named ranges provide access to
+          the fault-injection, error-group, and interrupt-config register
+          windows defined by the AEST specification.
+        minItems: 1
+        maxItems: 4
+        items:
+          enum:
+            - fault-inject
+            - err-group
+            - irq-config
+
+      interrupts:
+        description: Interrupts associated with the error source.
+        minItems: 1
+        maxItems: 2
+
+      interrupt-names:
+        description: Names of the interrupts associated with the error source.
+        minItems: 1
+        maxItems: 2
+        items:
+          enum:
+            - fhi
+            - eri
+
+      arm,fhi-flags:
+        description:
+          Bitmask of flags for the fault-handling interrupt (FHI), as defined
+          in the AEST node interrupt structure flags field. Constants are
+          defined in <dt-bindings/arm/aest.h> - AEST_IRQ_MODE_LEVEL (0),
+          AEST_IRQ_MODE_EDGE (1).
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,eri-flags:
+        description:
+          Bitmask of flags for the error-recovery interrupt (ERI), as defined
+          in the AEST node interrupt structure flags field. Constants are
+          defined in <dt-bindings/arm/aest.h>.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,interface-flags:
+        description: |
+          Bitmask of interface flags for the error source, as defined in the
+          AEST node interface flags field. Constants are defined in
+          <dt-bindings/arm/aest.h>:
+            AEST_XFACE_SHARED        (bit 0) - shared error source,
+            AEST_XFACE_CLEAR_MISC    (bit 1) - clear MISC registers on error,
+            AEST_XFACE_ERROR_DEVICE  (bit 2) - error node device present,
+            AEST_XFACE_AFFINITY      (bit 3) - affinity information valid,
+            AEST_XFACE_ERROR_GROUP   (bit 4) - error group register window present,
+            AEST_XFACE_FAULT_INJECT  (bit 5) - fault injection register window present,
+            AEST_XFACE_INT_CONFIG    (bit 6) - interrupt config register window present.
+          For system-register interface nodes (no reg property), only
+          AEST_XFACE_CLEAR_MISC is meaningful; the MMIO window flags
+          (AEST_XFACE_ERROR_GROUP, AEST_XFACE_FAULT_INJECT,
+          AEST_XFACE_INT_CONFIG) have no effect without a base address.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,group-format:
+        description: |
+          Page-granularity of the error record group register window, which
+          determines the MMIO mapping size, the number of ERRGSR registers,
+          and the width of the record-implemented and status-reporting bitmaps.
+          Constants are defined in <dt-bindings/arm/aest.h>:
+            AEST_GROUP_FORMAT_4K  (0) - 4K window, 1 ERRGSR, up to 64 records,
+            AEST_GROUP_FORMAT_16K (1) - 16K window, 4 ERRGSRs, up to 256 records,
+            AEST_GROUP_FORMAT_64K (2) - 64K window, 14 ERRGSRs, up to 896 records.
+          Required for memory-mapped nodes (reg present) where it controls
+          the ioremap size and ERRGSR layout. For system-register nodes
+          (no reg property) this property is optional and defaults to
+          AEST_GROUP_FORMAT_4K.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+
+      arm,num-records:
+        description: Number of error records implemented by this error source.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,record-impl:
+        description:
+          Bitmap of implemented error records within this error source. Bit N
+          set to 0 means error record N is implemented and must be polled.
+        $ref: /schemas/types.yaml#/definitions/uint64-array
+
+      arm,status-reporting:
+        description:
+          Bitmap indicating which error records support status reporting via
+          the ERRGSR register. Bit N set to 1 means record N does not report
+          through ERRGSR and must be polled explicitly.
+        $ref: /schemas/types.yaml#/definitions/uint64-array
+
+      arm,addressing-mode:
+        description:
+          Bitmap indicating the address type reported in ERR_ADDR for each
+          error record. Bit N set to 0 means record N reports System Physical
+          Addresses (SPA); bit N set to 1 means record N reports node-specific
+          Logical Addresses (LA) that require OS translation to SPA.
+        $ref: /schemas/types.yaml#/definitions/uint64-array
+
+      arm,processor-flags:
+        description:
+          Bitmask indicating the scope of a processor error source, as defined
+          in the AEST processor node flags field. Constants are defined in
+          <dt-bindings/arm/aest.h> - AEST_PROC_GLOBAL (bit 0),
+          AEST_PROC_SHARED (bit 1).
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,resource-type:
+        description: |
+          Type of processor resource associated with this error source.
+          Constants are defined in <dt-bindings/arm/aest.h>:
+            AEST_RESOURCE_CACHE   (0),
+            AEST_RESOURCE_TLB     (1),
+            AEST_RESOURCE_GENERIC (2).
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+
+      arm,cache-ref:
+        description:
+          Phandle to the cache node associated with this processor error source.
+        $ref: /schemas/types.yaml#/definitions/phandle
+
+      arm,tlb-level:
+        description: TLB level identifier for this processor TLB error source.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,resource-ref:
+        description:
+          Generic resource reference identifier for this processor error source.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,proximity-domain:
+        description:
+          SRAT proximity domain of the memory node associated with this error
+          source.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,smmu-ref:
+        description:
+          Phandle to the SMMU node in the IORT associated with this error
+          source.
+        $ref: /schemas/types.yaml#/definitions/phandle
+
+      arm,smmu-subcomponent:
+        description:
+          SMMU subcomponent reference identifier for this error source, as
+          defined in the AEST SMMU node structure.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,gic-type:
+        description: |
+          GIC component type for this error source, as defined in the AEST GIC
+          node structure. Constants are defined in <dt-bindings/arm/aest.h>:
+            AEST_GIC_CPU           (0),
+            AEST_GIC_DISTRIBUTOR   (1),
+            AEST_GIC_REDISTRIBUTOR (2),
+            AEST_GIC_ITS           (3).
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+
+      arm,gic-instance:
+        description:
+          GIC instance identifier for this error source, used to distinguish
+          multiple instances of the same GIC component type.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,pcie-segment:
+        description:
+          PCI segment number of the PCIe root port associated with this error
+          source, corresponding to the IORT node reference.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      arm,vendor-hid:
+        description:
+          8-character ACPI Hardware ID string identifying the vendor error
+          source, as defined in the AEST vendor node structure.
+        $ref: /schemas/types.yaml#/definitions/string
+
+      arm,vendor-uid:
+        description:
+          ACPI unique instance identifier for this vendor error source, used
+          to distinguish multiple instances with the same hardware ID.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - compatible
+      - arm,num-records
+
+    allOf:
+      - if:
+          required:
+            - reg
+        then:
+          required:
+            - arm,group-format
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: arm,aest-processor
+        then:
+          properties:
+            arm,processor-flags: {}
+            arm,resource-type: {}
+            arm,cache-ref: {}
+            arm,tlb-level: {}
+            arm,resource-ref: {}
+        else:
+          properties:
+            arm,processor-flags: false
+            arm,resource-type: false
+            arm,cache-ref: false
+            arm,tlb-level: false
+            arm,resource-ref: false
+
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: arm,aest-memory
+        then:
+          required:
+            - arm,proximity-domain
+          properties:
+            arm,proximity-domain: {}
+        else:
+          properties:
+            arm,proximity-domain: false
+
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: arm,aest-smmu
+        then:
+          required:
+            - arm,smmu-ref
+          properties:
+            arm,smmu-ref: {}
+            arm,smmu-subcomponent: {}
+        else:
+          properties:
+            arm,smmu-ref: false
+            arm,smmu-subcomponent: false
+
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: arm,aest-gic
+        then:
+          properties:
+            arm,gic-type: {}
+            arm,gic-instance: {}
+        else:
+          properties:
+            arm,gic-type: false
+            arm,gic-instance: false
+
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: arm,aest-pcie
+        then:
+          required:
+            - arm,pcie-segment
+          properties:
+            arm,pcie-segment: {}
+        else:
+          properties:
+            arm,pcie-segment: false
+
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: arm,aest-vendor
+        then:
+          required:
+            - arm,vendor-hid
+          properties:
+            arm,vendor-hid: {}
+            arm,vendor-uid: {}
+        else:
+          properties:
+            arm,vendor-hid: false
+            arm,vendor-uid: false
+
+    unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/arm/aest.h>
+
+    aest {
+        compatible = "arm,aest";
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        /* System-register based processor error source (no reg property) */
+        aest-processor-0 {
+            compatible = "arm,aest-processor";
+            arm,num-records = <2>;
+            arm,record-impl = /bits/ 64 <0x3>;
+            arm,status-reporting = /bits/ 64 <0x0>;
+            arm,addressing-mode = /bits/ 64 <0x0>;
+            arm,processor-flags = <AEST_PROC_GLOBAL>;
+            arm,resource-type = <AEST_RESOURCE_CACHE>;
+            interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "fhi";
+        };
+
+        /* Memory-mapped memory controller error source */
+        aest-memory-0@50010000 {
+            compatible = "arm,aest-memory";
+            reg = <0x0 0x50010000 0x0 0x1000>,
+                  <0x0 0x50011000 0x0 0x1000>,
+                  <0x0 0x50012000 0x0 0x1000>;
+            reg-names = "err-group", "fault-inject", "irq-config";
+            arm,group-format = <AEST_GROUP_FORMAT_4K>;
+            arm,num-records = <4>;
+            arm,record-impl = /bits/ 64 <0xf>;
+            arm,status-reporting = /bits/ 64 <0x0>;
+            arm,addressing-mode = /bits/ 64 <0x0>;
+            arm,interface-flags = <AEST_XFACE_ERROR_GROUP>;
+            arm,proximity-domain = <0>;
+            interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "fhi", "eri";
+        };
+    };
diff --git a/include/dt-bindings/arm/aest.h b/include/dt-bindings/arm/aest.h
new file mode 100644
index 000000000000..43679314e98e
--- /dev/null
+++ b/include/dt-bindings/arm/aest.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for the Arm Error Source Table (AEST)
+ * DT binding (Documentation/devicetree/bindings/arm/arm,aest.yaml).
+ */
+
+#ifndef _DT_BINDINGS_ARM_AEST_H
+#define _DT_BINDINGS_ARM_AEST_H
+
+/* arm,interface-flags - AEST node interface flags field */
+#define AEST_XFACE_SHARED		1
+#define AEST_XFACE_CLEAR_MISC		2
+#define AEST_XFACE_ERROR_DEVICE		4
+#define AEST_XFACE_AFFINITY		8
+#define AEST_XFACE_ERROR_GROUP		16
+#define AEST_XFACE_FAULT_INJECT		32
+#define AEST_XFACE_INT_CONFIG		64
+
+/* arm,fhi-flags / arm,eri-flags - AEST node interrupt flags field */
+#define AEST_IRQ_MODE_LEVEL		0
+#define AEST_IRQ_MODE_EDGE		1
+
+/* arm,processor-flags - AEST processor node flags field */
+#define AEST_PROC_GLOBAL		1
+#define AEST_PROC_SHARED		2
+
+/* arm,group-format - error record group register window page size */
+#define AEST_GROUP_FORMAT_4K		0
+#define AEST_GROUP_FORMAT_16K		1
+#define AEST_GROUP_FORMAT_64K		2
+
+/* arm,resource-type - processor resource type */
+#define AEST_RESOURCE_CACHE		0
+#define AEST_RESOURCE_TLB		1
+#define AEST_RESOURCE_GENERIC		2
+
+/* arm,gic-type - GIC component type */
+#define AEST_GIC_CPU			0
+#define AEST_GIC_DISTRIBUTOR		1
+#define AEST_GIC_REDISTRIBUTOR		2
+#define AEST_GIC_ITS			3
+
+#endif /* _DT_BINDINGS_ARM_AEST_H */

-- 
2.34.1


