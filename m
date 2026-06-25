Return-Path: <linux-arm-msm+bounces-114536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1cRWE5MvPWqUyggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:39:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B42E06C630C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:39:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=opcPxYQV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A5B0Zg30;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114536-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114536-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7ED7E30558A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02AF3451C6;
	Thu, 25 Jun 2026 13:39:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F2332EAE
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:38:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394741; cv=none; b=Wd6edE8cWgRIS0COFQZv8qokzYpkzcHV3cVL3RpXWBlFD0H2YiXCMpW7gv4AUJtcoQ6hLZnKJvevzhxg1VKsRP+qQpK+KcASe4EVC2B7yU47n66IoW2fAkahV9w1iS1HJaio2RHAsrSn1wKZjdV+zI+OT+aTg9EbXf5rcksPYpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394741; c=relaxed/simple;
	bh=BeeUpBP+MqcSp9z+rfQuEFHTfniuNHSPXQVaYkS/Ams=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4p0FQzM9NBPuSHsbrKOt115L99ahD07TPodX//GGNOKzP+VoLfXblMdiWCX8foLV8ls4riejo85DAYlFSnaScJH7nB/Vp3Wluzi0yI6zLB3aWqrhUBkTZTABCJjyUdCwjjI2MmIZjR4U9V0CEvMCpK+Xga/UiUpn8UYsHlz6Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opcPxYQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A5B0Zg30; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jx9Z1371513
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MmXxdsWF9PR
	x9r6aStfR3QBWOWUptVPg6sB1TDaNcaM=; b=opcPxYQVi+iBT5WWXmsCqCBiUS7
	dh1JmgaqWK4TP4YQZalSHGpU7Zmubx9XGAbgp90vCfOCpWxxHeg5udPZTe5cSOI6
	vcJxbjdsUGk+eWowEcl/yM5W8HnEGLFFFFV8K5SI4IswzDlWQRP/UEUo7Sm+K4Es
	EE38Y9a5qwh65nesv1hhDAXUrxcdYvYdum3jIfarz5LBQqsETRBI/Djp3nA/hMx1
	wFUSKkhv/Fvwko7/WOKgN3PTtdN5GjRc7ThUAe19+6eJpzlRNIPVfYhwestB7VoW
	XwCwhI8HwBi6uB3RFjJ4GUz62x6AWHbiinDKxVDRnrBgEouQiUOVBANCk8w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ymv1e70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:38:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6a2b8b91dc5so857519137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782394738; x=1782999538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmXxdsWF9PRx9r6aStfR3QBWOWUptVPg6sB1TDaNcaM=;
        b=A5B0Zg30cbA2qZfVjg2IZSjhX2vHkCz2OjYJKmW20ILcMUg6W64AnkcSSgSLriAOKG
         AEeTugPH53k+Do3ux64liX8PmWqTiipES9GWSq9MQO26A3gfR3o+TMxaMFXXpr9d5eSj
         XvYuYSLjL+rc2vQPegiBO5hvinNKLNC7oP+flKL5oOkU76Aj1zmPjyk2YkLsTYXe7jn1
         5p1dUSAjOh0gijQS5lWR1qgy+4NBf5GIpAvBu1a8wRmKDr7UCqRfJampBr9sUFAF0C8A
         E/sGNL96UtgqizoU6FI/frqEIiEtZB91DnVnUJQQMCXcJEbpT68d79YBKaUagM0nR2aK
         Y9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782394738; x=1782999538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmXxdsWF9PRx9r6aStfR3QBWOWUptVPg6sB1TDaNcaM=;
        b=o6GGliz/o7bWd1zlwF+m1E+yZTN9Tf7am3wwRcb66td30r1bi6w2gUlbQgthniq9/w
         dehtZNcIOQfkIPMX+rzuIGVk/8EjJCsM+eVXpKfTfFn29obRjO322dRBd8T/raRJKfG+
         XGfnLN3R/qiDUEu0DsyfTk07kO2EXuMbV0gZcEwSa77ccvBcaY3ifDFSoadal24iwDkt
         KYWoKPFAp5mvxyeaqz1L3Cr+vjnO1DIqR/x3li3MEZZwolk16vmudU3FucJip9PkzM9A
         pZJUKnmMHcAsQYKSKDFVeZvvt2JV5LL+famd6T3zZkvSzDfLFvuiDmzDt3RLZ+Joyymg
         cjrw==
X-Forwarded-Encrypted: i=1; AHgh+RrXPz24isxOFZxwgG5/KkMh2YDbNVI1tQ9Zbzp1u0xOeakjLP3dpYq7Q3IGYpHG1xzyinKJgaie/8juunqt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9H0znI43hO9O8oCAxXQ6hgMnOC0rIhwtIVm9UGrg0go/1wxhb
	+bMxae8geoGTCg90eat1Ev+k7kfcs513GY2TR5SZnqhHuQOa+wpuVyBA50Xmz1tCQMBqWVnDbUg
	WV6qmout/8Gvym96dF76HaSPy+98IHO+dhDwvKIVU1p+frPY2cJdPTuTNopMCyBec28ox
X-Gm-Gg: AfdE7ckZAL+xJjFToT7fk3Fdp5SM5TnF6kxCUrauQ2clsP04XaKbhbOKrvTDbcYGwew
	WNBBopKLNbGjK/S+SU1rM0CtTfGW82WzfgywjH72Ra0vzJdGjTEgwHGpdhbaWaJuRry6N0Djb2H
	kxIC7ihIDN+g6gNLj6MJoODaP3fui2mKch9w9Z7hPynwRP7WcVTgln6UbpcGewpG+VG2J1KkXuy
	GQgFDqcwzXIWDabENbYPS1daDVZCNLU1pTyPSFKCMMaESS5ysZWnICIkL8GRKWayOyfb8DHWUGj
	Bp0+BURXheqzpycUkPZTA1GUWJEDUNbdz87+SDW4m6VNZMdXDZe3kJpvQ17fQCJGq0K7QQ2ouMn
	vm2C7Xaz8pQ901O1RtHJv2RYny1yh7DLqy3M=
X-Received: by 2002:a05:6102:8014:b0:6d3:9409:d1bb with SMTP id ada2fe7eead31-734361a0fddmr771914137.19.1782394737633;
        Thu, 25 Jun 2026 06:38:57 -0700 (PDT)
X-Received: by 2002:a05:6102:8014:b0:6d3:9409:d1bb with SMTP id ada2fe7eead31-734361a0fddmr771904137.19.1782394737208;
        Thu, 25 Jun 2026 06:38:57 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa238sm189172266b.8.2026.06.25.06.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:38:56 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 25 Jun 2026 16:38:26 +0300
Message-Id: <20260625133828.3221781-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DqBmPm/+ c=1 sm=1 tr=0 ts=6a3d2f72 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VGq5m62kFjE_L6vmAZkA:9 a=-aSRE8QhW-JAV6biHavz:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfX6kxGEt/gk59c
 yWBRzAy5btlng/CeAj/YZEoI93Hra4CtA6Sg4kt6W+WlmR9seP0DtEjVF0kd14bZErdEuV6aTVQ
 GHjlW++qyULKeUvYVlVW2dn6hAGv8bc=
X-Proofpoint-ORIG-GUID: Fu-mWoIfOXrAfHfrypV_Z0JHPBhRsT64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfXwvDiMtzL6i7t
 latHvz9xMMNo8AAErv9g1l7spE8yKsJdIDmtEjNSpxsKfSv0SuPn2MQ502bjZOxNgBBUrcltZVj
 oncMrTxeorpr8RhjpIuOIhbInqSRI6Ohm5i54M9+naIYDPilWJChqwULX8tHW8O/nGt/9Vw6n5J
 CAazL3sEjkD3iOCpSvbaOIkN0aeWoNdoxmK424W+8CGiQ69SFhGn5pQlBLZTEUhIwq0wESVVTx7
 6xJnZe/cJ3OGUCoeDrBuAUdq82iMOqOhgzytAX/WbLC67jpAf6T2Q2k3G18rhsSgig/fWR/y4q+
 6GE1KdXgFfMvZlAgP0SXPYThHUeSQkw8EY48dh5SnIAXwuhKmmvflRoRlmV3Xh/BJKR6G0m/JU0
 P90ZzsungoXXg0dQZxxRNZHRc4xODFNEsPj3QW/bJYB+KxNQQIxwrT074mKqC4VdCl9l8uZ9H+G
 Lfo4/v1IZqJ1YwF3PnA==
X-Proofpoint-GUID: Fu-mWoIfOXrAfHfrypV_Z0JHPBhRsT64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114536-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B42E06C630C

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Properties documented:
- compatible: qcom,sm8250-jenc
- reg / reg-names: single MMIO region named "jpeg"
- interrupts: single edge-triggered interrupt
- clocks / clock-names: Common clocks and JPEG core clock
- power-domains: TITAN_TOP_GDSC common domain
- iommus: two SMMU stream IDs for JPEG pixel and JPEG DMA processing
- interconnects / interconnect-names
- OPP table mapping performance levels to clock frequencies

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..ab8d8951d21f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-jenc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: bus_hf
+      - const: bus_sf
+      - const: iface
+      - const: cpas
+      - const: axi
+      - const: core
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description:
+      Two SMMU stream IDs for the JPEG hardware. The first entry is for
+      the JPEG core engine; the second is for the JPEG DMA/scale path.
+      The exact stream ID assignment is SoC-specific and not publicly
+      documented by Qualcomm.
+    minItems: 2
+    maxItems: 2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0_mnoc
+      - const: cam_sf_0_mnoc
+      - const: cam_sf_icp_mnoc
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - power-domains
+  - iommus
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jenc";
+        reg = <0xac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+        power-domains = <&camcc TITAN_TOP_GDSC>;
+
+        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names =
+            "bus_hf",
+            "bus_sf",
+            "iface",
+            "cpas",
+            "axi",
+            "core";
+
+        iommus = <&apps_smmu 0x2040 0x400>,
+                 <&apps_smmu 0x2440 0x400>;
+
+        interconnects =
+            <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+        interconnect-names =
+            "cam_ahb",
+            "cam_hf_0_mnoc",
+            "cam_sf_0_mnoc",
+            "cam_sf_icp_mnoc";
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                opp-level = <0>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000>;
+                opp-level = <3>;
+            };
+        };
+    };
-- 
2.34.1


