Return-Path: <linux-arm-msm+bounces-102557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLXpEcwT2Gn/XAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:02:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 467B63CFB67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E3D3300A58F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 21:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DAC377006;
	Thu,  9 Apr 2026 21:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBHhp+Of";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3nE6s/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3B3344DBD
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768504; cv=none; b=vEkolN4SXjUFjKuQXZUOmAw3x6bjslX442jUbfdVLWaYkXGgFzJyBIque08qdLtnTGZ2Y3tUzMX7mawBrKNkXiHrmjKSZ1C3J1Ibwn8iMFgDq9shwubyBg8qIMCnI62xIQXsFL/YPx3k/fOCJklWJwRpKQC44sTLkqYYyOgJ7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768504; c=relaxed/simple;
	bh=Ob6W0oiZLfqCBw6yYs9XOIpnmLmpUMr1BTuvqxLZ7UU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZW7rmZJefdfDrZsM9rJHMdxWiKn2dSDToWcjCaIEqFeb2SZpv278MY9wBy/AzPQZUaeEnt1z2UAfS6Xb91yAykd+ed3FctQK2MexFZBTwr4YyWjF2RovKua+yQkya6D48Sb0BzkK5tFLxM59O+ijGY0kOA/Z6CTBf0Xb+gAbGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBHhp+Of; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3nE6s/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KtIt61729939
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 21:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b34JrBbVwfCelMOZnB0VD47ts657W7EkA+kg8VZoaJs=; b=aBHhp+OfRiKGonKA
	oXt/qKls4rMH+IODtZiwaesXpHDYqZ4ocptWUELFK+fhK4CWzZxW7IB2HLAdTH2l
	kpGlYQjVOxgqkGColA7G9sHXcJ6IN1VkdBiYvIUNMVRD8bDdHoAEMQ11TQrqHV0d
	c2WZ3Qk3fOvj+AHtv9Ss4OIwEAsgOnibz7r8vHmdUCH8tOe1Jq0ujP1F4YatRHge
	58S7MKBhxJ6Hy6PvyACKXW91KkF1tKh5kPVoNNTS7TuqzQIUfEVwIGytIGzoH3CF
	VV7cyDXp1xee98ma6mzOPGsTzc64pQqvMIVJRnZ0Elr5EjSTeYFaAHC9AVqxPVFK
	4eRGPw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxhnw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:01:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c68a134df8so1144670eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775768501; x=1776373301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b34JrBbVwfCelMOZnB0VD47ts657W7EkA+kg8VZoaJs=;
        b=M3nE6s/lZdmg31Epu6k1oojBXBQvNwmfBYsvtJ9vkuC7WMLRXMGS8zKPWuVnhzGg8y
         ds6RvqKZNUAwtmC+awg7t4xJxfDf8CbgUyEYE3m//pjavnubF9wJiq6KXiOOgxOUemOP
         oF0g3wBhx+8f9QEc6R0JSLPPiVEWyxR8psOqP8JjFTwvh1jPO37eA8oglUIaN/yZin9N
         VQY/NWqB9ygx1+QOQadvW84SloCrX9V4uPyV4TPQt8Z4GfBbOkgYkEKR5ieRjJTDjYXV
         apOrJuZFiq4lpn5i7zY588/6T3rW1piscNBVhlCp2tJkWt43uGAt2pXEfO8EJ2tVB+OW
         rEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768501; x=1776373301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b34JrBbVwfCelMOZnB0VD47ts657W7EkA+kg8VZoaJs=;
        b=J6XCUBs7gQI7YvLIRZwXpyNUKOp2LnQvpPoLqolgvw7VIOl+ga+cgFkrA53uHN+q58
         PmGwz6nQBUnETA5K2cbi/bvZyGag15vJRaS5BymXd4VbEi7eaqsUm9B+40cPfhPx/jrf
         67MR4bmFVV/ov8rwpJvDI/cyII/sbYoDRohu+DHGGF24EteACcqMWsboXjoW2cVTJX+p
         +hJuYPrS3wHCv26uKHIKpCGjDcScIvcaZLy4mvEDrWmqneeey/lRetLxTdsK7794kqQC
         OpRzJzM8TCQ6QkB5sW88ANoUdQ4yEdVfxL/fNf56tI4/DAz5AI2QliITNpAY9Z69GdDz
         FOwg==
X-Gm-Message-State: AOJu0YyATMYjGyqe/nPf2IIZJxu+QExaNDgMOHQ2J6q2NwsaC2zWzs/Z
	5lauo3wTA0Z1xGItgttb7yyCwuqKl/7RuhaKks8HZMsYUVjIoC4cLlu2InVKR5bVDEZ155rMazq
	neo/RB4raucKAqLF6WZrlDg2qD/f19EzQewRF0wIuhwybADYmPCAItLth5KyBZPq8FNX0
X-Gm-Gg: AeBDiesClcOtRaSgmlH0VGH+Rt6+FmObzEgBNPuuENdTbR1ggJx1KNSGhkmX+rPXDNU
	TobMYy6wbZLSd+1lsDcprzQoCg/CrVkA5T2I7op5jud8EgRlckmcvKGqQzwEfKUOjKpY5cvzEfH
	wPB3F0o0pCzBFxTj39ENHZSjkrGcYRVd28ar8eN/xJLpRq5r3OZ5dbA0EboYLiN59EoC3HSXhu7
	9vl/RNhQBEXWi8TeSb3QIi/P/iPrQT2TvrqufWxt59OhJE2e+QAMMbBj2WiA5MQVM5Zczgdzhvp
	aiKyi0toj9PQHrQqL/tbnftG/eoC6BzfbC5FeZswNndA3rwKveooOSGyWkWff9VdCod4+lNqnQI
	TgtTtIXc/kK/b/g91c4PKeU8DzaX87rWUqj/KejJ7qkwVfgjHOnfrBaqx0Aa17+jHiSVDByKYr0
	kK
X-Received: by 2002:a05:7300:7c09:b0:2d4:532e:7e37 with SMTP id 5a478bee46e88-2d589a9850fmr495628eec.29.1775768500660;
        Thu, 09 Apr 2026 14:01:40 -0700 (PDT)
X-Received: by 2002:a05:7300:7c09:b0:2d4:532e:7e37 with SMTP id 5a478bee46e88-2d589a9850fmr495596eec.29.1775768500035;
        Thu, 09 Apr 2026 14:01:40 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db6ac8sm1292549eec.26.2026.04.09.14.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:01:39 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:01:37 -0700
Subject: [PATCH v3 1/2] dt-bindings: interconnect: qcom: document the RPMh
 NoC for Hawi SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
References: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
In-Reply-To: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775768498; l=9167;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=Ob6W0oiZLfqCBw6yYs9XOIpnmLmpUMr1BTuvqxLZ7UU=;
 b=5Q+l9vBKEcWCtKqmP9HXufO8CAsDvtHzukpqU6beQLJdN4L0DDb6wXF3Y/HuB3w9IV4G7szXi
 Zt65E76x/xIBbfGIFicbhYkKzvXnC0qQUPYiMG+SD111knvH8PjNLKH
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: QEz1p4uuBwMyVJn8JSWkfsgNRHf0z7VX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NCBTYWx0ZWRfX3XCwES+/DjN6
 VIurY221DDVV9r/OuVpRybn8EliGz2tQHurm0KaI785UaQmPZIHQnEk55zum6yip4t3qYYV/i8d
 7+PP8O0bwS4mJ/zWplbfKgID4dRjBe9HvEVp811HiW+NVlorJZlr7BwkVCWYSWfp1+AmhRhcYt3
 /+29DCkXAS79Tr0/XV9egiddQ7OLVTg+SgzaIk6lUxYVTIdZmC94e7oXQ5mfnLPcxhEWaSDscPB
 F9BTExy8L/Cf3f20M4TIM/+XQairhxu5XA/tWZ4mO5LaWhxfWxH5tJEZOvCYdtp8UHRoJJLXYAn
 BM6qD3DnfTtB9KrHMdLVaFlyKFLzK7Vj9KUnIthFAS2k1F9NRCzuhsO1bj6Kyn2X4jq2L7eC7lD
 ikKcOt+Q52s3Uh10Qsucv+9k94f9koVhRhgcXwOmxYi+Ci8GJevadEYJDGVkYm56oYnlu9nJHu5
 fUpoRhUA5PGNSw8rLKA==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d813b5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=vAiBlhgdqqMfQzBjTAkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: QEz1p4uuBwMyVJn8JSWkfsgNRHf0z7VX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090194
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102557-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 467B63CFB67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the RPMh Network-On-Chip interconnect for the Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 131 ++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
 2 files changed, 295 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,hawi-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,hawi-rpmh.yaml
new file mode 100644
index 000000000000..49a2dca5db62
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,hawi-rpmh.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,hawi-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Hawi
+
+maintainers:
+  - Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,hawi-rpmh.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-aggre1-noc
+      - qcom,hawi-clk-virt
+      - qcom,hawi-cnoc-main
+      - qcom,hawi-gem-noc
+      - qcom,hawi-llclpi-noc
+      - qcom,hawi-lpass-ag-noc
+      - qcom,hawi-lpass-lpiaon-noc
+      - qcom,hawi-lpass-lpicx-noc
+      - qcom,hawi-mc-virt
+      - qcom,hawi-mmss-noc
+      - qcom,hawi-nsp-noc
+      - qcom,hawi-pcie-anoc
+      - qcom,hawi-stdst-cfg
+      - qcom,hawi-stdst-main
+      - qcom,hawi-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-clk-virt
+              - qcom,hawi-mc-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-pcie-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre-NOC PCIe AXI clock
+            - description: cfg-NOC PCIe a-NOC AHB clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre USB3 PRIM AXI clock
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-aggre1-noc
+              - qcom,hawi-pcie-anoc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clk_virt: interconnect-0 {
+        compatible = "qcom,hawi-clk-virt";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+      };
+
+      aggre_noc: interconnect@f00000 {
+        compatible = "qcom,hawi-aggre1-noc";
+        reg = <0x0 0xf00000 0x0 0x54400>;
+        #interconnect-cells = <2>;
+        clocks = <&gcc_aggre_ufs_phy_axi_clk>,
+                 <&gcc_aggre_usb3_prim_axi_clk>,
+                 <&rpmhcc_ipa_clk>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+      };
+    };
diff --git a/include/dt-bindings/interconnect/qcom,hawi-rpmh.h b/include/dt-bindings/interconnect/qcom,hawi-rpmh.h
new file mode 100644
index 000000000000..a018248ac6b8
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,hawi-rpmh.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_HAWI_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_HAWI_H
+
+#define MASTER_QSPI_0				0
+#define MASTER_QUP_2				1
+#define MASTER_QUP_3				2
+#define MASTER_QUP_4				3
+#define MASTER_CRYPTO				4
+#define MASTER_IPA				5
+#define MASTER_QUP_1				6
+#define MASTER_SOCCP_PROC			7
+#define MASTER_QDSS_ETR				8
+#define MASTER_QDSS_ETR_1			9
+#define MASTER_SDCC_2				10
+#define MASTER_SDCC_4				11
+#define MASTER_UFS_MEM				12
+#define MASTER_USB3				13
+#define SLAVE_A1NOC_SNOC			14
+
+#define MASTER_DDR_EFF_VETO			0
+#define MASTER_QUP_CORE_0			1
+#define MASTER_QUP_CORE_1			2
+#define MASTER_QUP_CORE_2			3
+#define MASTER_QUP_CORE_3			4
+#define MASTER_QUP_CORE_4			5
+#define SLAVE_DDR_EFF_VETO			6
+#define SLAVE_QUP_CORE_0			7
+#define SLAVE_QUP_CORE_1			8
+#define SLAVE_QUP_CORE_2			9
+#define SLAVE_QUP_CORE_3			10
+#define SLAVE_QUP_CORE_4			11
+
+#define MASTER_GEM_NOC_CNOC			0
+#define MASTER_GEM_NOC_PCIE_SNOC		1
+#define SLAVE_AOSS				2
+#define SLAVE_IPA_CFG				3
+#define SLAVE_IPC_ROUTER_FENCE			4
+#define SLAVE_SOCCP				5
+#define SLAVE_TME_CFG				6
+#define SLAVE_CNOC_CFG				7
+#define SLAVE_DDRSS_CFG				8
+#define SLAVE_IMEM				9
+#define SLAVE_PCIE_0				10
+
+#define MASTER_GIC				0
+#define MASTER_GPU_TCU				1
+#define MASTER_SYS_TCU				2
+#define MASTER_APPSS_PROC			3
+#define MASTER_GFX3D				4
+#define MASTER_LPASS_GEM_NOC			5
+#define MASTER_MSS_PROC				6
+#define MASTER_MNOC_HF_MEM_NOC			7
+#define MASTER_MNOC_SF_MEM_NOC			8
+#define MASTER_COMPUTE_NOC			9
+#define MASTER_ANOC_PCIE_GEM_NOC		10
+#define MASTER_QPACE				11
+#define MASTER_SNOC_SF_MEM_NOC			12
+#define MASTER_WLAN_Q6				13
+#define SLAVE_GEM_NOC_CNOC			14
+#define SLAVE_LLCC				15
+#define SLAVE_MEM_NOC_PCIE_SNOC			16
+
+#define MASTER_LPIAON_NOC_LLCLPI_NOC		0
+#define SLAVE_LPASS_LPI_CC			1
+#define SLAVE_LLCC_ISLAND			2
+#define SLAVE_SERVICE_LLCLPI_NOC		3
+#define SLAVE_SERVICE_LLCLPI_NOC_CHIPCX		4
+
+#define MASTER_LPIAON_NOC			0
+#define SLAVE_LPASS_GEM_NOC			1
+
+#define MASTER_LPASS_LPINOC			0
+#define SLAVE_LPIAON_NOC_LLCLPI_NOC		1
+#define SLAVE_LPIAON_NOC_LPASS_AG_NOC		2
+
+#define MASTER_LPASS_PROC			0
+#define SLAVE_LPICX_NOC_LPIAON_NOC		1
+
+#define MASTER_LLCC				0
+#define MASTER_DDR_RT				1
+#define SLAVE_EBI1				2
+#define SLAVE_DDR_RT				3
+
+#define MASTER_CAMNOC_HF			0
+#define MASTER_CAMNOC_NRT_ICP_SF		1
+#define MASTER_CAMNOC_RT_CDM_SF			2
+#define MASTER_CAMNOC_SF			3
+#define MASTER_MDP				4
+#define MASTER_MDSS_DCP				5
+#define MASTER_CDSP_HCP				6
+#define MASTER_VIDEO_CV_PROC			7
+#define MASTER_VIDEO_EVA			8
+#define MASTER_VIDEO_MVP			9
+#define MASTER_VIDEO_V_PROC			10
+#define SLAVE_MNOC_HF_MEM_NOC			11
+#define SLAVE_MNOC_SF_MEM_NOC			12
+
+#define MASTER_CDSP_PROC			0
+#define SLAVE_CDSP_MEM_NOC			1
+
+#define MASTER_PCIE_ANOC_CFG			0
+#define MASTER_PCIE_0				1
+#define MASTER_PCIE_1				2
+#define SLAVE_ANOC_PCIE_GEM_NOC			3
+#define SLAVE_SERVICE_PCIE_ANOC			4
+
+#define MASTER_CFG_CENTER			0
+#define MASTER_CFG_EAST				1
+#define MASTER_CFG_MM				2
+#define MASTER_CFG_NORTH			3
+#define MASTER_CFG_SOUTH			4
+#define MASTER_CFG_SOUTHWEST			5
+#define SLAVE_AHB2PHY_SOUTH			6
+#define SLAVE_BOOT_ROM				7
+#define SLAVE_CAMERA_CFG			8
+#define SLAVE_CLK_CTL				9
+#define SLAVE_CRYPTO_CFG			10
+#define SLAVE_DISPLAY_CFG			11
+#define SLAVE_EVA_CFG				12
+#define SLAVE_GFX3D_CFG				13
+#define SLAVE_I2C				14
+#define SLAVE_IMEM_CFG				15
+#define SLAVE_IPC_ROUTER_CFG			16
+#define SLAVE_IRIS_CFG				17
+#define SLAVE_CNOC_MSS				18
+#define SLAVE_PCIE_0_CFG			19
+#define SLAVE_PCIE_1_CFG			20
+#define SLAVE_PRNG				21
+#define SLAVE_QSPI_0				22
+#define SLAVE_QUP_1				23
+#define SLAVE_QUP_2				24
+#define SLAVE_QUP_3				25
+#define SLAVE_QUP_4				26
+#define SLAVE_SDCC_2				27
+#define SLAVE_SDCC_4				28
+#define SLAVE_TLMM				29
+#define SLAVE_UFS_MEM_CFG			30
+#define SLAVE_USB3				31
+#define SLAVE_VSENSE_CTRL_CFG			32
+#define SLAVE_PCIE_ANOC_CFG			33
+#define SLAVE_QDSS_CFG				34
+#define SLAVE_QDSS_STM				35
+#define SLAVE_TCSR				36
+#define SLAVE_TCU				37
+
+#define MASTER_CNOC_STARDUST			0
+#define SLAVE_STARDUST_CENTER_CFG		1
+#define SLAVE_STARDUST_EAST_CFG			2
+#define SLAVE_STARDUST_MM_CFG			3
+#define SLAVE_STARDUST_NORTH_CFG		4
+#define SLAVE_STARDUST_SOUTH_CFG		5
+#define SLAVE_STARDUST_SOUTHWEST_CFG		6
+
+#define MASTER_A1NOC_SNOC			0
+#define MASTER_APSS_NOC				1
+#define MASTER_CNOC_SNOC			2
+#define SLAVE_SNOC_GEM_NOC_SF			3
+
+#endif

-- 
2.34.1


