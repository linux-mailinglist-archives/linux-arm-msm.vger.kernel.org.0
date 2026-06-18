Return-Path: <linux-arm-msm+bounces-113808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N+61BaVqNGpPXgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 00:01:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1576A2D99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 00:01:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ML1c5myD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Uw6KV/dO";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113808-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113808-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FFEF304B680
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 22:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF01325491;
	Thu, 18 Jun 2026 22:00:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F6B23E324
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:00:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820045; cv=none; b=U24B2YhYHFKHTFPkfIVxbP03k73iYq0U/h1s5WKxC95qg6K4yuQKgoEHHiCuvKca7ZLp1wpNH92qt7P2nLS95IJS5IBaqZBT415MOF0o0FODUkJ1oUNPvr+fDuWx/SPqmKL733cb18GGwWhagap++F27c2kDqFYugPZwW8EkGLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820045; c=relaxed/simple;
	bh=h6VN9igtKI9aq+/SVm0t5+m0FtDU71HqlJW2YJM8HVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jw4eDGPCAD8PE2ah++xZg7FgpplcExxl3VP3in7zfxI3IVu7gsqbw7NfKm1Jm2b9GcAUiYtQkmVioesh802aNn0YiW/LoiQ/T4nbqZhtoiqBV3B3/4noakjY1Zr61BamH55VQOz3efjjfuB++Rog8vdRQnfJMC+Ql41b7V2O/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ML1c5myD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uw6KV/dO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILs8jJ2785217
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbKrEr1Y7XrK9od4gILNb3lHt+sx4fwLqMT5Ub5jpBc=; b=ML1c5myDIOrU1KIY
	f9ox/5ll6fLcStiogwIPReyKUv5rlIH64SedIVZJ1R+zkGKzHs9/NScnajDDG0OH
	iA36Lep1MqxOOK8/7M/qyxIu6cbCj1M/SqLIh1Oy06oKWHbTD8WVT2+Ru035dm6H
	4U/ylq40Hfl7UHSNBB5mbU4XU6Mb55cwx4uQLDXFlVUv7tjkzL5t+eaTwaduPoJA
	4JjboOzKH9X4Ws6E/OB5KwbhW61jA2Rwjwy+8lYVzfRco02kKqzRG0BxZTUyTyzm
	GQafPDSHMJBurRdrC1Qig7a0bJtni+bxuk3hlwFfHLTE+yNrjKkiIyONhaMo5wJz
	0SDjXw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyurk14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:00:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30beab99453so2512194eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 15:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781820041; x=1782424841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbKrEr1Y7XrK9od4gILNb3lHt+sx4fwLqMT5Ub5jpBc=;
        b=Uw6KV/dOZZ7hFV5LiMkWs1Iyo+VksOGlLR8EynFL3ZUxMp+LOtndbgpbqxkD9lU1pt
         JRoepyj2PVrN6GlkL2wgKAY4ZbnJ68TCKPMnauZReeLvujnNbcrUD3wQRNdietahl/DL
         pOgsRumRIXWexrIlAjbLAh0hTuSmy0/bugRrik6G+DZwhDTlfUaO9T7BFSxuZ0tv6eN/
         vavTT0N9yHhCJ+t1d1vwPQUdTG/PoZQMhC+2hVxLifVYTCGUth1DwZ/+YPWt8IKEDmUM
         jqc0ZDjuicAckB1dqTWOz6egKr0ZhCxO3tgzrzWzv1iiWsvnYRmbYb+H8boKr++qX4pW
         U8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781820041; x=1782424841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nbKrEr1Y7XrK9od4gILNb3lHt+sx4fwLqMT5Ub5jpBc=;
        b=bX8WfYNs6mC1y7W9oD4Mi6EEj0LWM6ctQ4MaT+LXOxcMtc2D2OxHIcNSZtm2idiAWY
         YS7Nn16qIfpqKnjuuUSjnn/KNYlxG7ToFcpoQR+WaIefkyw56w+3IKYGvN8GSZJsciEm
         V/YXwbI067cMyfvI5crazUYSCZ61yIuvm+RoG+VtihLE5p1OcvOjP8Bby+UmJE0ZF0L/
         MLdSb9FteU2NU2V+4g/qs6NIseAeq9/udrlK3oKs4Anhl7B7SBXyZt6tdGftXfNGGDcL
         8dp4gCX9nnp8ITlGT5RGJ+ht+lpR+uqzTT0zWZrAFgLRGjW2VCgiarLiHaq6ZHrlXUGK
         xSrQ==
X-Gm-Message-State: AOJu0Yzf4GxrhuPPFI+pyRA5IrCl0qXvrDmmmZIBG/tZp8YVzpcZE4Sf
	Ol+DTVH4KfF1jirWTcjw+5NCXQMWUoWWYiVJuy0tDRRwMBD/WivUijuhpuIYaFcOKmZg52PCwi5
	WwphE49Wq5+Fcj7AeAeNnSjeHN5++LeCXCXwh00KhO15JZLhX9Y3XXmhE4SJm9K04rI6B
X-Gm-Gg: AfdE7cmI1cP73iJ2xCYzWrtkz1zbHT/Jx7humX3zJvjPVTIx0oddkQQhVFPNiLO5oQA
	HaGl12T9AbGVmTQWz7o0LpOj6ioau+QGk87JFGSM81Nab2YV6s7ABGWz4IQJLXX98rtSavtLy9H
	1QldBeFMrmxcG5zm7DmBN72nnTXnqJ+p7X/RWt7IS3T3Tu5OPs9ps76xQw5MbbQHEINomFQ6w93
	otVD8W8yHPuyI3CPxVXOuZ4BAKliunEB24zH7YRGIf8fbvX0anOsKwc9WdF01XIUuyBz1kBc83N
	OBlsWh1CyEnrsnlYTbKwwv/kZuYOXTpuXhfTYLFAQpeqz++d2OvqOSKB00UxgrErRDPX6adXTJ1
	FCrifRx1BqdEt37OyOTcldRo6sknoqUFIAbyQWLv+9V0WLgEB
X-Received: by 2002:a05:7300:7b83:b0:30c:ea:add4 with SMTP id 5a478bee46e88-30c0714d302mr1017417eec.23.1781820041288;
        Thu, 18 Jun 2026 15:00:41 -0700 (PDT)
X-Received: by 2002:a05:7300:7b83:b0:30c:ea:add4 with SMTP id 5a478bee46e88-30c0714d302mr1017389eec.23.1781820040572;
        Thu, 18 Jun 2026 15:00:40 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm628436eec.8.2026.06.18.15.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 15:00:39 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:00:32 +0000
Subject: [PATCH v3 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-hawi-pcie-v3-1-f31880bfb3ec@oss.qualcomm.com>
References: <20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com>
In-Reply-To: <20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781820038; l=7158;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=h6VN9igtKI9aq+/SVm0t5+m0FtDU71HqlJW2YJM8HVY=;
 b=Ypm4JQUIxI2dhUMNcG9BmUZyfHFg8KkX49KgrFCZqaj3u0A0OXEERAulfaanI8Sk3Dja8i3Qz
 BjO5xBKCxCJA1KxU7xFSuMya6VONIXUN1ub/GiRgIlt3+0n4wlbbReq
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX61FHtTPVQt/g
 0ModfmIpeM8/hSrmD754DEX4odcfb1R/ntFX4Cwdd3IFiX62l9WqR47sAoFKy/ich0PGWTcX5J4
 bOLaX6c0Dfc2RniiIOngEN+4t4M3Riw=
X-Proofpoint-GUID: CLlsK8oIU1pk_83Po0mwCD3SeLakJsFD
X-Proofpoint-ORIG-GUID: CLlsK8oIU1pk_83Po0mwCD3SeLakJsFD
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a346a8a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ICk-tmyBBRKrNCK0fOMA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX2vHvUiekG6a6
 xoVv7y4u7eWzn+ZElrqdGu6dk+t2bHL+hZbL1E4Jy75U1xg4gn1TbNCQay3koj8c5TEUqpa5ejX
 +UOORUK+3tjjlxzPVIvwolgTFrbhotn8MrNudXUgxKx5bI0rsMfIbwj3xvGftMsDqr/WofcZ5G2
 RqBnDlNW+28+r1gw+cgAungduCbQqm39GFl++khKt4XDv3ZGZG1Ta3hPkfISdt5zUYDBlkbG8PZ
 nLbJEutl+VdrmO2lLnRVpVudTCZXGnccsEi1SEib2Bnu0GqLL29yXaobVKk2vjkROlUXOFU43tf
 oGMHywQ9Y5hIP8Ohiv+zDHOqv+Jh86kAWjCjcxUMLBefr9aTnmnzTm0p1ihzZPD4NYq0Bga8nvw
 zbTg6P+HVe/1TzhcxFbrnMQRQdDslrw5PVivmnHF3seQRjioIxc512O3YYfh4ptDxI/VgJD4D6O
 cle8SewG54EoPRft3QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113808-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE1576A2D99

Add a dedicated schema for the PCIe controllers found on the Hawi
platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 202 +++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
new file mode 100644
index 000000000000..fb3145f89f7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
@@ -0,0 +1,202 @@
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


