Return-Path: <linux-arm-msm+bounces-110205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE7GN5jnGGruoggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:10:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 910EF5FBDB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5AF9303F55A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 01:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A0C355049;
	Fri, 29 May 2026 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1o/TD1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hirY5vkq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE45352025
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017038; cv=none; b=VErkmaVRQFnGQEN9msh8U+XTKwxHJAzJp1lhhRkbnLptltXSO0CIhPu7KtvEeJ7qyDVs0Plk+PRdRwC5f96UVMOXYNBrLu8CQ+5BlpnSVswua5oOj0R0sHJDYmMjUHN6MWEPKd0XKYMTKrR9fDTMPD90QMjfFXXDUsGDmUsUF5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017038; c=relaxed/simple;
	bh=T0tWgEjR4o6C8nVwFL6x+ia02fTMEN/CzOEGgDTRQSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHkaVtnrhxYh7squkuahg+Orl1PXIkQ5qX4FIPyhqHrOhJsdP5BxcTRWDBF9Dsbg5M+BK5J1WxUYwgnIoeYAEB//AJXrXb/Vx5k8nnT9F+UeUNGcBWDYuI2M23F0AqIqiN2nhM1eMTjO2m/u7EKqjDpIWesbl/KVw8KalNMMO1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1o/TD1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hirY5vkq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkU5Y1386301
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U6UwOPnfpmq+WbFznF9N2HH3/nrDcz7jQbOt8fV/tNM=; b=B1o/TD1YUUnMVZfx
	XFMg22bhCrYvI+lmNxkrgiWgZkoctpdi0ZIoXjVk1PZEbek7TdL7sQGSqwTaZT4/
	eKgkChLltLc8sLnO5pdhnBXBoj89hvGvjdjFXrFNHUjf0UQ3UrRUIpQQiwoDH4jJ
	92tl3BOiXVvuk8xs7eIZqP9xMJCkpe1KXBagXO2E5nYRzraxF9QNV4wKFL/j8hBo
	Ho7ZV5ULSpybgQ7CJXKZb8uVgmamiHZQ3k82VdbynExZqZQ5VJ/QVPUR0KO/9bov
	EbyVU+EbcIS/9f/ZO4l3VthlflBxi9Qp/TWive6gtpDOJIga21DcsZGbc7w2LsmK
	Zmyksg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevums1c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:10:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304ea1eea05so823889eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780017035; x=1780621835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6UwOPnfpmq+WbFznF9N2HH3/nrDcz7jQbOt8fV/tNM=;
        b=hirY5vkqDbYrEK0mx5DKFfV+mDE/Q6iG5qlNjfWjtigBWI4FVkU4p8zdVsuW0+cmDu
         H45KDS4C8bt+qg8R3ReKYawkD8otbkDW+sK1h9Xs0sqH6tu47AxllG30i00tDMm1fOBm
         ym6o9C9f9ex4bqbD1peDXiD4uBphGFfrtnzOAuLpAjLORUFe3Gn8c8JGmo40LGtGmtT8
         2RfgLEOGqc6/NTH/exlapxFxAoQaNDvTn9aY6TI067yKv8R2DbjFbBMZkZzbK3LE7N4h
         nenBPpmQWmtsvd3pwq73XpEqosqc2oLV36V1/ShA7XAQXSnLu6BR/sJ+VJv6NEjNp4pn
         QBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017035; x=1780621835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U6UwOPnfpmq+WbFznF9N2HH3/nrDcz7jQbOt8fV/tNM=;
        b=cPozTCPDfC6riDLixMQ5kiCvdZoYSvI7u0ZaF7GszulgOknbwOLdjf3bc6BREppREQ
         A546Pc6FHmgr7yJeyf7Hi4w2ZUvRTTzbYGc0RAgxqcdgBhaAMJsCbqt9ZJWYsGCP5dw9
         ONdcArkknwA9HWtmalXMCWwv3jdYhela07jalBjOu5gaDsmR7HpxDUA5e0oD9SFMhraO
         LgY+2PReQSyFbSSL6x0jUOREtAxO1G3dy/EZmBQfTMEk4hvzgN3SlQ4uthpfJoyh6WMK
         0rUN6x9PbIXa3NRLuLPUHipULVIPXiPyYnZJDumg5B5VHcvupYfP7oEbkDcIrwWt5vlO
         jrlQ==
X-Gm-Message-State: AOJu0YzlVp88wV8SP9xdUlbGyjxE5XvB7w0GKzvjHERhVZcMHg58cHTG
	WJNQWMuW/6j7F4PhEnPLK4VtsY83FpYQV30XQve1rTyPR8cgUZQ3nl2YupMstWW7y4C0WNjGI+N
	ch0kby5turOOCXd+6jcB2suCf/++pmCrWdgBEgZTKC68clIAcIG16l/AUjSOw+IXpcpnP
X-Gm-Gg: Acq92OFaWuy4oeMf6RrI/4OowzPbu5vntPaQ5Bn3Lz7k2mn6nNnE+kreL7XisxxmIc+
	x85C3QL2IjR40M78jdkOvH4sJ6T24ikSyT5RqLXw7yamS8DnUVifJKj/j844ZbiIoZo9kxVk3yf
	ElpEBoj7e3sp7e4r0ztyoclQiRbPAVpr8+NYhW6M1opFUF+vt7HGaULQj7qlENC5VtBfiiw8w89
	naxHCWtG+5PVIk0Ha1zQF/TlmSWopKEYiy8s/CqTaEUt9evrzoLIAvESNlGReCbvmoBcuClSFy4
	WWtmA/DHRJ0KNQdm9WXHLSQSuKKnLAJAHoSJDFtjDtXddaKKypwPxK+lzKUyEzfrWFfW5eRfmJY
	9RsnvX+BEHxLiHJsPflcqb6GsE07L9ZDPM7u8RxlHIWQpMaNpWVpqpHBx7sODWUYJnTcORg==
X-Received: by 2002:a05:7301:fa0d:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-304eb133faamr440547eec.8.1780017035211;
        Thu, 28 May 2026 18:10:35 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0d:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-304eb133faamr440526eec.8.1780017034513;
        Thu, 28 May 2026 18:10:34 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5a114dsm173785eec.24.2026.05.28.18.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:10:34 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 29 May 2026 01:10:08 +0000
Subject: [PATCH v2 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
In-Reply-To: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780017033; l=7308;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=T0tWgEjR4o6C8nVwFL6x+ia02fTMEN/CzOEGgDTRQSg=;
 b=MSL6anP9TQ5j8LCPP3jobk6toKzVCjWc01xrEuT/IoVqGVXHslR3/6bTLV5dUQM9sLwvAGFq8
 RVsfCQKBeHUCjzavxmnwZC0fyn/I7Lp8Ho5xfoZ64vK2cP017ZldKzC
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-GUID: 0TsQYjT2gGhRx8YlQXRYwpIQqFJwcPku
X-Proofpoint-ORIG-GUID: 0TsQYjT2gGhRx8YlQXRYwpIQqFJwcPku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwOCBTYWx0ZWRfX0IIgDXwy7he1
 fAsx1rRkGiJQhuBtBT7zCqSBtnYbxFOPItk/+9L6TDdirz9RHUNqd2XUu3r/Jp1sI8+KrI9karC
 A6XkKqkIXXKXBvCF/tKnlrEmSVdrUJQDIUoKEExyha8FUumJ1vzqISOh+J86Z9SGPMLkyqZl2Is
 SESd24H5hZTUsEbnc+NLBz4Td1pYML4vewyhu0VOgl5GCfySrhxu8DErGyeWp8nfbvlFKzhILCk
 KICXxc4h82u/2ODmgw+G/pCLWzsuGIWEq8u4RmFZ8bF+TVoMeLqSKvVVWmzeMbWqZFfwTaQg75L
 ZTrAAh+APytK3xny9hInTKlGTw2S3eI6JTAFZRRROvpDVWpp3Buj4Z3eX8kffT9eTcI8ALur6OJ
 AlP1GX1JnSJbEbju/t2CeMPCSTP7+aIPEiYzzGO7CO3l4u1NbZBK2LxOBTcr0oJV0vB5aMxgILg
 3SPHnsGo0DTdaqtyzfg==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a18e78c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=y3igNv8VU7KrM5vZpNgA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290008
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110205-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,devicetree.org:url,1c00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 910EF5FBDB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a dedicated schema for the PCIe controllers found on the Hawi
platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
new file mode 100644
index 000000000000..7e47b8472af7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
@@ -0,0 +1,204 @@
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
+    minItems: 5
+    items:
+      - description: Qualcomm specific registers
+      - description: DesignWare PCIe registers
+      - description: External local bus interface registers
+      - description: ATU address space
+      - description: PCIe configuration space
+      - description: MHI registers
+
+  reg-names:
+    minItems: 5
+    items:
+      - const: parf
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: config
+      - const: mhi
+
+  clocks:
+    minItems: 6
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
+    minItems: 6
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
+    minItems: 8
+    maxItems: 9
+
+  interrupt-names:
+    minItems: 8
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
+    minItems: 1
+    items:
+      - description: PCIe core reset
+      - description: PCIe link down reset
+
+  reset-names:
+    minItems: 1
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
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
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
+                  <0 0x40100000 0 0x100000>;
+            reg-names = "parf", "dbi", "elbi", "atu", "config";
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
+            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
+                     <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
+                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
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
+            interconnects = <&pcie_anoc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+            interconnect-names = "pcie-mem", "cpu-pcie";
+
+            iommu-map = <0x0 &apps_smmu 0x1000 0x1>,
+                        <0x100 &apps_smmu 0x1001 0x1>;
+
+            pinctrl-0 = <&pcie0_default_state>;
+            pinctrl-names = "default";
+
+            power-domains = <&gcc GCC_PCIE_0_PHY_GDSC>;
+
+            resets = <&gcc GCC_PCIE_0_BCR>,
+                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
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


