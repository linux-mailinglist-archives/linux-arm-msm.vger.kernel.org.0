Return-Path: <linux-arm-msm+bounces-114574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J8E7CE2TPWrt4AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:45:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 623876C895B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:45:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EiG4sWlS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H8pkl5ES;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114574-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114574-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6934F3076F28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 20:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54795371049;
	Thu, 25 Jun 2026 20:39:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DC430D3F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 20:39:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419965; cv=none; b=Ayrwu48HSnuONSWGnS2KuA3uy1/JbXo8iVctv4sac+BU1UCPh4I63wpgR4NyInC/Xrb9dKES9EL9Wi7V16BECmMKdpGgIOJllVQVHfEqaPwL7jQvTAPur1OSq1MEWdf70lIGZOtuMbDmezErd7eugLOd0tyVv8bwvu8lis3kkdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419965; c=relaxed/simple;
	bh=ISmYNvUoaB96MgkLalgc04Cap0JuQBWjqWuLI2ENf+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzaKXrfBGO8/qkQYWNfWrmdZx6YTwLvo69qjV5X44QVjF8Mo6OpfMFJabM6PlpDvPxNDS5fg+ZrfAS0aqMy+XOvdVsINLTmWDl3jbyme04q24kY4LmPIIGyA+QNI6mY5spiRWuIeLfFK0xAhI/aNVIxuYIfz0Bc6rEhPl/0qDLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EiG4sWlS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8pkl5ES; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFeJ0K2737270
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 20:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pcF4bTF2Bkbvr18UUoB77o3pNngPmQjwF7EVwOZWLAQ=; b=EiG4sWlSjqQi94Cf
	LC3x3UW9pxYgRnJL3EbnRBICNA8zTHDmCWxWjPRhX6GRj5fsCMVt8ZbVwjgMURV7
	FMABSJ028E3JJHzk5PSmlWApevrK3mPQCYc5ftX6LzKfLvOi5Ea1bOdDlV9ju64d
	k7qMMZ6xyFKLKWsmUwgeKtXmfRVft8rJX6ZXsyvxPCacULwDegXjwsTe6Db2DQ87
	wfWpMUDDi05HQZsD91sy33bHCBiBtAGqrWmtVWMiwYCRjua9TAjxSjNGnqp5OsZU
	aEe0mBGsSvW4KkBDXkk4APnzxx3jfTtr1g6OT9lyWPwqITHBJYgk1YKvk5JLROke
	oEOFzw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8uapn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 20:39:16 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137fc6f8e9fso607956c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782419955; x=1783024755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcF4bTF2Bkbvr18UUoB77o3pNngPmQjwF7EVwOZWLAQ=;
        b=H8pkl5ESpZUDyTTBMBMN4CIPTYz/7GbF5q4FY2TTKuOFREfSfLH6rAKSMuO8VODg50
         HjtH+DVyV82nXtkWpEEXLhWtDiupvvnhmpxlFSRYxfmq/cAe5N3NGRayGAFwMeIWRJ1v
         KMoDcQv6IRBRzJQBWeI6VNJLW96mdXVWLMNO1uAub6/GFFfAf5JHJrY/RYTTCu4rYHfT
         3D5EsBxf86zXNkROC90SSYMmy8Z90fzJw3e10CdaC0ZWGSN/GGP9VdDM/zz18ShQlEU/
         1bWEKEn2oHOSlcICYID5tQu+AhVq/sU7TD8ln3hGjHKjr3lYzfklJ9savyiKWU7Ms2xB
         VJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419955; x=1783024755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcF4bTF2Bkbvr18UUoB77o3pNngPmQjwF7EVwOZWLAQ=;
        b=cjl3E649PEi3sbN1BfptlK12LllI2xUx+fNUkU+tpcrOSqcAe7sFoXjenPdirt7o2B
         fb1mYAEwimDODFTqS79k8NwygaslyT0X98Rt8llSJp6ShJLi1CFULv8se1B6kgVGjrPH
         kRUGSdVsOYQEtG8vgBnwFMSIT67uMFEA3/9GzmhA09jEIIh2hiY8Eu3kIsjm54maX0K0
         6XODt7+z97eJ7v51MGEAXkUBIQKx/vGfgsy2QLMDrmHIRTzmKVC2I3IBTAICAAOWHf+P
         sZI7c6K6vlwGMZVxV6x1Vb7G7oQE76fSGJpoWdcHjbzK+InoGyx8j4e5dGEcxoq2y4nV
         vpQA==
X-Gm-Message-State: AOJu0YyXSRPszdLRHCfwTTVPQMdMXzmCnG9QAkmBUzFXIYvLO/5NJGND
	O6XT3ld8Dxvu1A3pKEcOWA3/Uey3+uoNiKG9CsuMLEiuoyKzmXkFJ552t/vUvk7QcB870szd1XI
	nA7hoPmDv5A7imtgbCvncca+S8OjkMod2EoCU2VO6s8HyzjgG5V/6ZLwkdk1ZhARFg6w2
X-Gm-Gg: AfdE7cmrNNDDfzMf6PQP/coIkrv78t6uA6tf6yZ37Qh+hRHLr76meuqgQ4FQqdbrQIA
	dzwk1WVSVETm47r9qkXfT3iqTOdJoIsez837i3gkP4rtOIpz+KrEkeJhf4DoCpsUy5BGmUBf+Ct
	GNP5aOZcAJE/1laTjkyz+vvegP3QzCNZQam+mm14MVtxPvw6fqJG2X8wkp4gRYjQJcr8bYEh/Kd
	k2aqb8S4UWXP+X2tLDuSbTV/uW6QdUxzTz9QXbauPNUjuqbjjXa3Dlg8mFk7m9M1xfg+MqKDaR1
	9khYGUQJFzrbYFtbtH8VxHccqG7hp+GYtrKuKyngKuJzjyUQtj/XbjavH5XfgcBROLyuJZi3c+y
	m2yR+7ai940H5sZFjcmZp7gCwtGvGIfod9oIQrurZs44eSV8X
X-Received: by 2002:a05:7022:788:b0:136:c443:80e5 with SMTP id a92af1059eb24-139db9f6888mr3647288c88.6.1782419955385;
        Thu, 25 Jun 2026 13:39:15 -0700 (PDT)
X-Received: by 2002:a05:7022:788:b0:136:c443:80e5 with SMTP id a92af1059eb24-139db9f6888mr3647263c88.6.1782419954850;
        Thu, 25 Jun 2026 13:39:14 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8ddcd34sm10858623c88.0.2026.06.25.13.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:39:14 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 20:38:58 +0000
Subject: [PATCH v4 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-hawi-pcie-v4-1-1a578603cd86@oss.qualcomm.com>
References: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
In-Reply-To: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782419953; l=7084;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=ISmYNvUoaB96MgkLalgc04Cap0JuQBWjqWuLI2ENf+g=;
 b=wCvh6TtumtqBeuKAE5MATG7RmIOCnKyhOhHmXQ0Auz1HUPHeNJfPeYdze96a0Cq78BSfE4gky
 COEJugXVgB3DL6/ms4p73ADdViJITTKETM7p2CQ3Vre/sp5X8TJN0U1
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfXx4LyITzVc1tk
 +Sx16JRWLMq5ZMtuCVcw7axNQd1jSmcOf8zueEp+TAXyZYKuBqsF8uFiTeMni+CkQ9lgvTZ1PKK
 DWCTo7GIIXCDmeYe/bS9eAentLJD05M=
X-Proofpoint-GUID: HPydOs6QUytZSRPyJxoHkdplwxQ82Qlw
X-Proofpoint-ORIG-GUID: HPydOs6QUytZSRPyJxoHkdplwxQ82Qlw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfXwVEbElxWNW4H
 GtvEqjutoVcLGGblL7+FcJFiuUhjiVP75Ha4QBOIG8WmEXZGzXQxcbXup/+gESk2hNXo+LKxUx7
 8uQPsfQG0oiV2+IpaATpRPiByq+kmlDdF5kbVIGebrqcb03pDUOFX48KTBayEidUA+7J4bisN/z
 ZTAMuVDHcPWQ4rdgxXnEQ2hWr1ZuIHOtRGMpCjMKw8cLs+m2QNOiOaIcJbKDUG+AmH4/HyQCzr7
 RXu8c2oAw09JVJO6KfRKCg3eABsMOe9NbUXlX2HYCeD4nailubpqjxJKmUv7PpksNRgZnqo/2Gi
 loZwBpM//RBIC/13SjCYVkr5V/INPp9LcCGmbJQjB2UToKIATeBJudMPjrww1AcxDR2nrcy2+x5
 ReMDvceY69IqMN7JpyDT3Zh4x1SaqqFb51Rj5VVPguIIjGfiqUmDlkeP2xhF8MqVao0VUbLDKvz
 /kseMmjdJ+HeLKWmE6w==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3d91f4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ICk-tmyBBRKrNCK0fOMA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114574-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 623876C895B

Add a dedicated schema for the PCIe controllers found on the Hawi
platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 196 +++++++++++++++++++++
 1 file changed, 196 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
new file mode 100644
index 000000000000..2c999ca6b205
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,hawi-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+description:
+  Qualcomm Hawi SoC (and compatible) PCIe root complex controller is based on
+  the Synopsys DesignWare PCIe IP.
+
+properties:
+  compatible:
+    const: qcom,hawi-pcie
+
+  reg:
+    items:
+      - description: Qualcomm specific registers
+      - description: DesignWare PCIe registers
+      - description: External local bus interface registers
+      - description: ATU address space
+      - description: PCIe configuration space
+      - description: MHI registers
+
+  reg-names:
+    items:
+      - const: parf
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: config
+      - const: mhi
+
+  clocks:
+    items:
+      - description: PCIe Auxiliary clock
+      - description: PCIe Configuration clock
+      - description: PCIe Master AXI clock
+      - description: PCIe Slave AXI clock
+      - description: PCIe Slave Q2A AXI clock
+      - description: PCIe Aggre NoC AXI clock
+      - description: PCIe Config NoC AXI clock
+
+  clock-names:
+    items:
+      - const: aux
+      - const: cfg
+      - const: bus_master
+      - const: bus_slave
+      - const: slave_q2a
+      - const: noc_aggr
+      - const: cnoc_sf_axi
+
+  interrupts:
+    minItems: 9
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: msi0
+      - const: msi1
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: global
+
+  resets:
+    items:
+      - description: PCIe core reset
+      - description: PCIe link down reset
+
+  reset-names:
+    items:
+      - const: pci
+      - const: link_down
+
+required:
+  - power-domains
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,pcie-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1c00000 {
+            compatible = "qcom,hawi-pcie";
+            reg = <0 0x01c00000 0 0x3000>,
+                  <0 0x40000000 0 0xf1d>,
+                  <0 0x40000f20 0 0xa8>,
+                  <0 0x40001000 0 0x1000>,
+                  <0 0x40100000 0 0x100000>,
+                  <0 0x01c03000 0 0x1000>;
+            reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
+            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
+
+            bus-range = <0x00 0xff>;
+            device_type = "pci";
+            linux,pci-domain = <0>;
+            num-lanes = <2>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            clocks = <&gcc_pcie_0_aux_clk>,
+                     <&gcc_pcie_0_cfg_ahb_clk>,
+                     <&gcc_pcie_0_mstr_axi_clk>,
+                     <&gcc_pcie_0_slv_axi_clk>,
+                     <&gcc_pcie_0_slv_q2a_axi_clk>,
+                     <&gcc_aggre_noc_pcie_axi_clk>,
+                     <&gcc_cnoc_pcie_sf_axi_clk>;
+            clock-names = "aux",
+                          "cfg",
+                          "bus_master",
+                          "bus_slave",
+                          "slave_q2a",
+                          "noc_aggr",
+                          "cnoc_sf_axi";
+
+            dma-coherent;
+
+            interrupts = <GIC_ESPI 205 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 206 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 207 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 208 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 209 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 210 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 211 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 212 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 204 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "msi0", "msi1", "msi2", "msi3",
+                              "msi4", "msi5", "msi6", "msi7", "global";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+                            <0 0 0 2 &intc 0 0 GIC_ESPI 214 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+                            <0 0 0 3 &intc 0 0 GIC_ESPI 215 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+                            <0 0 0 4 &intc 0 0 GIC_ESPI 216 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+            interconnects = <&pcie_anoc_master_pcie_0 QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
+                            <&gem_noc_master_appss_proc QCOM_ICC_TAG_ACTIVE_ONLY
+                             &cnoc_main_slave_pcie_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+            interconnect-names = "pcie-mem", "cpu-pcie";
+
+            iommu-map = <0x0 &apps_smmu 0x1000 0x1>,
+                        <0x100 &apps_smmu 0x1001 0x1>;
+
+            pinctrl-0 = <&pcie0_default_state>;
+            pinctrl-names = "default";
+
+            power-domains = <&gcc_pcie_0_phy_gdsc>;
+
+            resets = <&gcc_pcie_0_bcr>,
+                     <&gcc_pcie_0_link_down_bcr>;
+            reset-names = "pci", "link_down";
+
+            msi-map = <0x0 &gic_its 0x1000 0x1>,
+                      <0x100 &gic_its 0x1001 0x1>;
+            msi-map-mask = <0xff00>;
+
+            pcie@0 {
+                device_type = "pci";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                bus-range = <0x01 0xff>;
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                phys = <&pcie0_phy>;
+                wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+                reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+            };
+        };
+    };

-- 
2.34.1


