Return-Path: <linux-arm-msm+bounces-106180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFHNGM2K+2mWcQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 20:39:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E0D4DF6EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 20:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08292301D973
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 18:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA3D4C6EEF;
	Wed,  6 May 2026 18:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHYFgLBo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcMv2zQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536BF2D97B5
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778092734; cv=none; b=t1y/7sxVcWpLx1lFie7diLfhco78+fLxEk5o5fp4+w6UoES0EW1bys09Vxof2bSmWbxBEqiRpLvPZAmjISnl2ztfUauLU7O9WBqAsh3FSrpIB1H28x1rQsaHjNdbDCNdDmi4nppRpiwXOhNGX8ITjDS33L7yPoL9qMVqznkt7uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778092734; c=relaxed/simple;
	bh=fNPQZTds78ybFJXdy2t9S3I6otL2iq5CHGp0Og6Nk6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIvQ53MzKWYZKf69q1XwBt1BYJo7LckOvlgGk4LTjg1qmLkCXRo93efM/Zpn/DlI8QQNNbIITUyj4dypN53FhkFg1jTGrCEjCV/kDBWS4EPbqpOat1XoCfPwaBqZnBLB3YzaafkW29cZE3GXYituLbLuOd9CSiDq8madzAjh0sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHYFgLBo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcMv2zQw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646F2GXd442974
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 18:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qBNUNsDyrzLas3cPp2XU+3XGXfevqRcipS2WoL1crFs=; b=HHYFgLBoDNKxrkUT
	7c6tTc7Zo3XVsmB5pWRdK44UG4DpXAxN1lp1YjSJpmOngO42G1UXIwAxps6jSb1d
	XQC5E6ACYDLuOYGkIwB4FRDMmzUBwmuBXhMwHPGKWqT5ZFbJKbZzpI4O4uFgrn/w
	kH1V5pudNX2zPRUUY9gr5fT3nlsN0AC1i25uMHXmU5zHEsSmFOa9TXh4SqlN/h8m
	HI44+9tvRHSQdqyob5feKK88yjGoR6T+66dGCJtsOQ+IH+hiuFDEIalrrmu6cQFC
	c+eCbEFMw7+W3bS0epkm5CD6CEDc2HFj/b/CFooDG1gd53d1XaseCqr6wo9jcm5V
	r9LnrA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299j869-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 18:38:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so24243eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 11:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778092731; x=1778697531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBNUNsDyrzLas3cPp2XU+3XGXfevqRcipS2WoL1crFs=;
        b=HcMv2zQw+pn6qLF3rP79gvrbwvsBmWUcHMOe7FUQcXLOxmJRGhzRGc9lUyEErMw7db
         GB5hVJp2NFd4cF4nGt/ExXI1MQ89W2ojHEXL6tq663YYWeaTxwXb+E8eo5eKKeNGBGhy
         5VRxtk0CRyME4vd1sbXn1gkcbSFUvf6JR6L1YGFkLTN2bHriJjr4sr9cQbi7IFwbzlBE
         1HG6ZPnbfxjx1tfu8jpHXi+QEzgYqlabG94dLKQakfLm0B8VOvggxaM+VdzCo0bFXYXr
         DJQOxATeYkdPTNR02TTtAgbdjKaaBauBEzHN2GWfCWEYc4ItaeRXxeUgXsT1OVn6032V
         CwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778092731; x=1778697531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qBNUNsDyrzLas3cPp2XU+3XGXfevqRcipS2WoL1crFs=;
        b=Mgf+uZ/B18HGoF+63n/1uVBuLGfPzKNvs8j4cfvyQpOGcI2RXe1BpwJWCl0EwMe0/A
         8Ij7+/jkxrTk6dLmgE/Y4Wmt3/8xmh7YR7SuiVnbHLqwt07tvvBsBUWtas80zOoYN94f
         UAfYIMn5tiAiKwSFAhfAVShcK3nQMZMu4nOD0nFNBJDlOG0gpfKYAe+/CpxoU1zZ1jTD
         IR4e22HumKOVMwRp1ZUVzsBn1P3WuT8hTIHe0OTVngRHian5yV1qtcfx4l4RBL90/18L
         TvGswreb07JTpHOSbACUhe61JEpL35TjYc9Fs10XMIB8Pre40u8nFVmq9LzgLvHylFZ9
         AxCA==
X-Gm-Message-State: AOJu0YxoXQdiVCcW54NdS3idVt2x0CEKCSG4y1H2vyATWfkvzCR6bktk
	eV88rHq6ihBc0MmHCzvDphWTfaFQbliVV9vCbeNl3QUxHZ69N0LFnSd9ADnMqNRgmVHbpllWd+K
	ek35sQj0MVVuzwfNAY9BIDvJxV/UjjcV/Nn/0QXc6/An5l69OqCph7CTPWgYp1x7mBCLgPdXdZc
	Ex
X-Gm-Gg: AeBDietY2MKhJAzZSUfE37ocqNgCY3eQ00si4c8ZxxI4xHiS3nE4K6UIGKy9+uI5ifK
	ysnfQ9g/yYhaprYQY+p20HTedyB99H0TITvu87aE2QAgv0S2osWdnYwkVSkKf0xSAQACSVSJxC0
	r+kS3+adeuW5bDZzf5mPT6KGRLJwlzyOil5EwgvIIXBFhIEbCEL8RMB6+9nIHzoWamVOW+9CuRQ
	Mkl7wjenknM/35hzCaz+aHFxos8x6CGItQTcYxURBc3jPq4ozTPPe0PYFV1h7xfVbqMTRVF2F4m
	wF7ds67s07nEPgGUjPyLszcv44KkMHuQJ0my7iyF9gtAWzEggTp7eHS7m2nBTlvJCl4SuEZFFp9
	ilhQlpxN0NUFCwbri9aaqWcEuc1GN8Y9a4inAq1MkyTzSsYYAvo47nuiTohDzpUgFeAKZvCBAUG
	EQgB03OCkaE6c=
X-Received: by 2002:a05:7300:2387:b0:2de:6fac:f666 with SMTP id 5a478bee46e88-2f54b892ccamr2434869eec.27.1778092730979;
        Wed, 06 May 2026 11:38:50 -0700 (PDT)
X-Received: by 2002:a05:7300:2387:b0:2de:6fac:f666 with SMTP id 5a478bee46e88-2f54b892ccamr2434841eec.27.1778092730346;
        Wed, 06 May 2026 11:38:50 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56fd92780sm4958372eec.23.2026.05.06.11.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:38:50 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 11:38:46 -0700
Subject: [PATCH v4 1/2] dt-bindings: interconnect: qcom: document the RPMh
 NoC for Hawi SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-icc-hawi-v4-1-35447fdc482b@oss.qualcomm.com>
References: <20260506-icc-hawi-v4-0-35447fdc482b@oss.qualcomm.com>
In-Reply-To: <20260506-icc-hawi-v4-0-35447fdc482b@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778092728; l=9326;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=fNPQZTds78ybFJXdy2t9S3I6otL2iq5CHGp0Og6Nk6E=;
 b=aDrYi72RLXxWzRBLwdElFJoUNlITF2bQ7fAuhj8m0ic4kUno4uYAsOqjzmqCcj+5hqMQzpwkv
 iRdS5lrGj/kC7YW8dPCO2AyUR9QkctTdxtFkAG4hFQqEtUkn0y/GAVR
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb8abc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=cs7kp3l6qqXMur9OmOYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: c4kcX18fTMNGVHFkRFsAXr39wv68C1ce
X-Proofpoint-GUID: c4kcX18fTMNGVHFkRFsAXr39wv68C1ce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE4MiBTYWx0ZWRfXwxsqeOi68pCx
 es/3brZwlVXA5x/XpVsQtbdeKdNUvt+nBQKwzat1GY1OL//9Vake4oSClU1DnvCuZ3TeRA9VOq1
 ZU28GxJewa1tpv5MjKzgVtTAZ0ivvtvEg6oHOcUXpicVFOnYThZxlCjuHEaUvhMFnvw4ISQXRCD
 DsqFLZFq84jFtPJEqSlOOCVkSelCrhFswer30+k1OqVspEcj9wVBP4I4NnrgU/btFyI66+VkLkU
 JX+zjxA3YT/d5mIf2qUOysi4IheYZKBnlQvMn6/VKFBpjD0dmqy847t2E8Ue7XZcQGxX9tycWjX
 uD2Nd8iZjm5PEFj/CL1vRqgYoBJexp3RzfK57/PyG6J7z/FJgC+21W/oww5/BZuNu1hO3wwuu4o
 N4qv8ojZYac+DkjE06C6JTAy8R5I5G2/wOGWeAvZVLIkj/JOH7v1V38KIVe6VEano4fuXlYbWCL
 PfkuPA2BxSOSIGKf3XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060182
X-Rspamd-Queue-Id: D9E0D4DF6EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106180-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the RPMh Network-On-Chip interconnect for the Qualcomm Hawi SoC.

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 131 ++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 165 +++++++++++++++++++++
 2 files changed, 296 insertions(+)

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
index 000000000000..a8b649679846
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,hawi-rpmh.h
@@ -0,0 +1,165 @@
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
+#define SLAVE_PCIE_1				11
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


