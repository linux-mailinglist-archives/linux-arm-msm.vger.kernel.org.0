Return-Path: <linux-arm-msm+bounces-104726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP4PKWxc72m3AgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:54:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786F472DBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55B623038AD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620EA3C3C07;
	Mon, 27 Apr 2026 12:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI9xGh/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9oJZFMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100263C1976
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294017; cv=none; b=nS/MN9+wD/AdpFC5+xYulXDyzC5/uwOsq7ICeEsnHZyu4t4X81Cy4FeH6mhRiE/B6xaiuv/7s6+r7xyKP6T99YkVIObMifV0V49Nrn1dVFcBd/Sv1S//soWgptm4EGsgE8BH87WrNLYzWFd8zvQ3SZ5q3jLdusdY1p7iVr4Fano=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294017; c=relaxed/simple;
	bh=MOx96nk8+K3X65iJbnE7cnDVWRW2qZP90gd3iYGxINQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLF1pe3UCf8PNm/CpZXpZKe0zs73Gav0ENb2bSysJvwsTFz1geYdC5V5ZLo1JKEHmWmskFOmzmA+Ggd9vQgvTgpZQ9nEzDnJCvwvKd7/2982azF8hmYQH6l4/4h9SE6raxmjeaK744JUiJlCNj4B9fcesfFeY8L/SVfbTGW3HZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI9xGh/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9oJZFMl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kGLG3961981
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60/MBbjIS4gVvBbUhWp9MfPwL6PKKn1z3/apxZjK3bY=; b=AI9xGh/BRtgdIiC/
	G3cXNFb2/9zGLySsZmTuS71/F5HZ2is7rBQyDpAyZ5DO9itit+OLa7lGpJTSTDv3
	LWGdm6yuujh+U9hRMP5eL+QNAq0se0Bbc8iPHIcW76P5/H/XX+0pEx/V166H05HD
	goCPdVPFISgU36lMEZuevGetYm2QL9Fi9dqzHk4czy0g+ub/FfktFJpofaGn81XQ
	04PdpGRC5AyNCIRNr2Ansut5spZyzRa0O8DEgCjyvqdz3TKe3wEZ51dfY8m8QNjw
	Qtop29DAzQH9b0N9bEKq7TWWcHVuz3BGc9s9c/Gndcf5pQ+lgY3t7CovxnoCYIyC
	nrhWpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k313pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9a6a853bso143496001cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294013; x=1777898813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60/MBbjIS4gVvBbUhWp9MfPwL6PKKn1z3/apxZjK3bY=;
        b=e9oJZFMlZe7Xuu+aSI3VgRbRgBefH0AF7hE16xZ5skg2TfoEjBMC9xxGmril5Hkpv/
         2vhGJZS4TyVhXX4kzAdp/TNnhl7XAyWcYs7vGP0pxm3WqVILtyOY8/9IHv7pkM50s5Hj
         BxC6KsQwKlNH/nRWC7tYKSEtlLLwA27iGeMi6qCNnZMOh7MzqA4eboi8Zi9rTEQs50fl
         tcK65/sAAV0jb87sceUWxI/N0ok7PjPwTbXTT7+eQ1k3twRUtMUVa+rWjLt+h9emVnUB
         CM94PYNQgxI1Sfv6t7QBwkQHCTsOAfZ/QDeGfxPqUuyZyraxPiwdkPhPl+QRrNSR088h
         EnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294013; x=1777898813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=60/MBbjIS4gVvBbUhWp9MfPwL6PKKn1z3/apxZjK3bY=;
        b=cDh0FnR4V9U4NhsU7qy6HeTF8Qpb8ELXzL9D/B1Mc2Ss5Ttxg5gvIp1wCEK1V4Bz6W
         ivIrLRv13Xfq1IO2d0bHmbSYx3nnYZ8qWJ5alyv5AiVg1u+x5f3uBZ/tEcNz9zsA5IUv
         u8zB33h4RFy06pYkTDCqXYAMVcO4KVEaynEHXe2aQ1hpVaj5w+YvgZ1hfAfD0A4jCYEH
         v8Ms19fz+DTcxg2W7CmwpgUwu6bc5bJXIut1eMgPs89vBFtVapHQ5GTSXcN6vPDa0odw
         b1amLdtWRtQOy2STWfqwVO8rg636Y3pAzpsNlWZx3/DoL8zrj4qtzmDwRHAZeRyxZEf+
         kcKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cGphLY3WxE0M9BwXspYKhC1FMOntLGyk8RIsYCSqzp4vKF1HvZTQVGvGDsuR4V2rkAu3apg6A71UzQnu5@vger.kernel.org
X-Gm-Message-State: AOJu0YzJmv5zIYp72HdsI5gNO1TcUnHERMQWio65c8yNuwadEj1m+NiE
	xFKa7UhKsn7QKwy7Mn1ntqEnqToViZw0pbDQT1bj14ndc+YLWBwcwLZrmKTXrfeOaAZfOkko2r5
	DR34rnarrlGpJEWR+G9+RSAcrLrXItagK0vgE+DiyDmiiSeFpTpqGczQg//lou7TixYos
X-Gm-Gg: AeBDieuY+swNGPxDNnlk3xajGojpC60hkea1IeVk2aUcM64l7dZwt4pGrEKgD2sR25K
	ctkgrsmOOcGqaSKeWiifTIHRDXsG/X0GzI+Nnf9C7Mju5luFtyzxgFiQo+8a0fWgQMQhm35Yxl/
	bkTwP/gJQmsIq9jzMokSxPczNZOTj893tlKkJUv2tRVcejrJrQoMAXGL4rZWVjSeZLtgKOWBocv
	tlYB11UWKRI7nE0ib7VCl3zI287Bp0R3nhj0DJQi5VzcLPaZ23+I/mWd43jPER2RGCqwleaFS2L
	mGNnAdmc0CjNw5Zk4QMNzP59dIwtwmu0YpYhzDmlPop1cHHj4xgmbCB4TqBtKAPRcQpvDhLr2Fs
	F9muoD1m5egof5VyaHZxb3KCC7AtSgVUrUEQSF9gUBe09he63JIMLLtAaHktNhSXaUls3i9Tdjw
	8L5Vw6qoY7GJ8sYlCKFnijlZqSnKs=
X-Received: by 2002:a05:622a:5e16:b0:50f:c36a:3821 with SMTP id d75a77b69052e-50fc36a3c68mr332980821cf.34.1777294013355;
        Mon, 27 Apr 2026 05:46:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50f:c36a:3821 with SMTP id d75a77b69052e-50fc36a3c68mr332980301cf.34.1777294012973;
        Mon, 27 Apr 2026 05:46:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:37 +0200
Subject: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX9fJZO77k6Lf5
 q0F515JBAuwAHfHsJDMmKNRAuEaVtdtyqMGe0jGIWInji1FglNye7510ELyxwCV6P/Wq1COnHF4
 IsKzrBJhKAolkGv1oz6Ddf7eKUlk/EttJcp/MNUDPGXMWBCgRY/e+xSvio+2SdVlbadOPAMjkm0
 DsAFztLB1IutufdV9fR0DNKL+nZrPcaLynTAk+ou7SLB6ld2bFyc7XfKYsxBw/pYA+vQ6Qy3a0B
 NQ4CsqgkMm7LsnVxlOQd6Tuvl/cK93nvzmart+SGZlumuDhYP7yW6HDeWAAYPTAvLEr7uF3813s
 KFJE6SddpTO4ZIDZIdLgMQ0rpVQj1d1rSwGcwLdEKJXoXqdU8r6LIhzKWASO/TGiQEG+GnbZ4Yr
 FaNk2tjhfmkESYYL1XMxbioV8XvaqAoH8PwMoRntD3PHept+DbzUI66OvVL5+A3xFtGiZq1CejH
 FTFuQBtfoN5d6arKMcQ==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef5abe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=V6_9baJ7xsrOGZ_p:21
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: kvx8evQmzEudD0lhSerH2gNv5IIb4ujf
X-Proofpoint-ORIG-GUID: kvx8evQmzEudD0lhSerH2gNv5IIb4ujf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: 1786F472DBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104726-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,5c42400:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c91d73af61f5cbf8384be5ff9b03683de8413542
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
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
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: data
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
+    maxItems: 1
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
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42400 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
+        clock-names = "core", "iface", "data";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&rpmpd QCM2290_VDDCX>;
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1


