Return-Path: <linux-arm-msm+bounces-102024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPGoBS881GlqsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:05:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B843A805B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 992EA3013193
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 23:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8E63A0B24;
	Mon,  6 Apr 2026 23:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMb8irn+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nl9QG8lN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E71539099F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 23:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775516694; cv=none; b=mwwRl15OBnq3+ZjoWq46aJ55E0duRp6NdifTZQaeP8XNqex7f9N9DltWC4x4bmV8bYx1ETGWvgAp9BiSItAvevFeV1P3AyBfA/u8N/9O+K7hnBuv/xzTEgKQI8qUCMUYPRZsJUCZgMVvEZGh8Sx96Vw4tWEc4IKHLJBqx/gQGDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775516694; c=relaxed/simple;
	bh=87ps/Ub+FLbeIuQgomrTeISmDS2VqUQ0G/nSUcnumu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SRGXxSjaTusv9h9qmSn8irgS6r2OoeElx9ag9AwBQilFVUptwBjM2yWrDn6RUb6e4xJLb79ZiLtfpFEr7gLIP3LvtQ2UgVkfllWyRt6zn5N63PL9VGyjOEUThnxXs8cMXunWB3gldnJWqBTNzisjprIAXAQmEvLFWQI/nP5UFKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMb8irn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nl9QG8lN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQBn41405879
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 23:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRrExp+CliHW1h1Em/dhvVghqdhqLPZQ+xt7fU/p5jg=; b=fMb8irn+yO0Bb9T6
	xGeQclurtem9NB8qECsEru7dUJ+9+Z0ZW4/m0DfWHt/X69OqzV3zUZ3z2csnjGNB
	t49hWE3f8D/lWv93peYp0OOeZ01RUkR4BMm73ll3O7wEsW92DlF3sZiycPWF1/qy
	K2qGBMhtvnQNUiIHCSmyC5702PFIODc7Dj2xoE8h2mpE8EUIQlhNk01mLwZBKUyY
	ir+UlWhzHv3z7YYDSNZ9Ebo/UgERFzMiH2wNSxxxzgef4cJnDgNTNtUEKytTCcKH
	jyMQOvkHU+9oV1Br/iNhcVfo27RJ7hb7XyZAPbW8fOK0Cvz3tjnQOvYRpLJ0/OLK
	XrIW1Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrar70e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:04:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so5010133eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775516692; x=1776121492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRrExp+CliHW1h1Em/dhvVghqdhqLPZQ+xt7fU/p5jg=;
        b=Nl9QG8lNUeo/0wzZrKKr6frSZ/qXJSEcff8CrsMcYEzucV1yu4hxlI2mca2OCPo69Q
         H1XoS2cijIAemqDp60Zqs6QdVZggIk4yoj/KpggLagqmqmDT9Xyh9rzl5g/fxZSEDM4P
         8lZOLdz01Gc+ilUAvnc03M41JGuNz0vT62fTRjxaM11VPnV1EtJ7ItCU4KfrnAv/TyUv
         EDZORAKW9YF/itONnJi5r3B5kwJPjzyxVOJe5bIdz9H2wpZNF2JGKLXpFcFO85HmIDJY
         imIPLNPjMGln7/nRjrcYLG+NGPjZRh+xQJlCr5xQbKmSM4NGXe4/wa45p31jRq6eNr8t
         MSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775516692; x=1776121492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uRrExp+CliHW1h1Em/dhvVghqdhqLPZQ+xt7fU/p5jg=;
        b=m9MG8oVaHVl+dkVaYiFkhLL+DUGccNzmacRZNQsOEa33FYUAPgRZILScbq9bNPU85v
         vTLpweaPyPiAZiN8Dm0lKIDxOScpkc0P2EpyKQYLnheAk7LWKOzn50bpLtD0jWA/zhW3
         6zZFWJCLYoL4MACACgnCWHgBFcpoKpkF6g+a6Fs+m26URwiQd9oPVvnJCx+V7jAAm5nU
         SwTQXIRQUBZi74UMSIuroNJssp3bL81RFp4zKjFMYn0eTNPfY4n0sFhUEoVZFzkYzPfb
         pRA6qLejetXKgAM06YWbzEwZ+JGAiU8ipO5aA1bi7lRK+knHjM6vY+esnI3DW9qFwq7l
         JFhQ==
X-Gm-Message-State: AOJu0YxT8a6TdLJJAd5kX9bbqhjpWQuqGYw8N11CE+gWrTnrOYVGSqyj
	+T1pThRK07AClAbCx4hoGtnlCgMd07DdxyS8b/WjEymWrnJ+nJ7vmZ0Vj9Mi5rLtdA5cYcpDym4
	IX6/Vykj4p9mcJ2XQGE4x/gdpIx51Wz8Y+hWvNEHK3N2SGBttrGRugbQfe+EG2yo30yJv
X-Gm-Gg: AeBDieutkCWBZGXzYd4ztaL35xiorAakYFh80L5/mgC22a11Zkt23w9j6EM/xRZOAzp
	pMNskzVDZT53uj0lZ6BOzgo1SGCt5PFiHMRpu5+a4p4rP7Nk/9a3A5/VsKNBC894lyMSgFSSyYW
	qJxjcdE7c5/y0BZXzDE72fM6oJB3KULO5wvZVOG6rKS0Xdi00ZUoLQWGN65lD9uM2a37umfMneV
	/OOvu+pXW5ssybxzHdC4FK4Y080YbANVDLXic4iWXkQ3SMQhkwT9vpMjI2hKbzJcdHLprE2pVmm
	vmTK8YANwuBNoGIaihl0Tz1MsMzzA3xIXtCcO/NfiWPO3WCNWwuOAXHPHjjCvUfaReJ09MtRNz4
	H7oj2uWy9cMcMoN9XogdogfsVmxwARn09MHtxnn7a0bAI6EFxXdVNAv2hlE+Vw8AObl7j96CGA4
	w8
X-Received: by 2002:a05:693c:2c14:b0:2c4:ee64:13c3 with SMTP id 5a478bee46e88-2cad874a0c0mr7015858eec.17.1775516691907;
        Mon, 06 Apr 2026 16:04:51 -0700 (PDT)
X-Received: by 2002:a05:693c:2c14:b0:2c4:ee64:13c3 with SMTP id 5a478bee46e88-2cad874a0c0mr7015840eec.17.1775516691314;
        Mon, 06 Apr 2026 16:04:51 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c151sm14853281eec.19.2026.04.06.16.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:04:50 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 06 Apr 2026 16:04:41 -0700
Subject: [PATCH v2 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Hawi SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-icc-hawi-v2-1-6cfee87a1d25@oss.qualcomm.com>
References: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
In-Reply-To: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775516689; l=9253;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=87ps/Ub+FLbeIuQgomrTeISmDS2VqUQ0G/nSUcnumu8=;
 b=8QYoqyO2001uDjK23Ds9EMju9LHRRsJSJRz6iu50xpL+7wj71hDqMh1OloAPTN/qBmvK11Wq8
 meuGmWtJN1hBVUS32itjC8zBV0Jq3HWCDUNNgUZkdDV/fI69OrTSo9S
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: dj2k9MwuMXKEzDOGXVdNRUg4I1RvRkt8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIyNiBTYWx0ZWRfXzz8khpPWMeEZ
 o9wPl3kNFn8MVRRsGYIxRLOLrBTfdLGrll78CGkGA3OizY8nUwYuoEm21eVx8m+koRv8/5JtF95
 ZlNU7PTjmjQmcqAmh5jA2LbCm7r5kvLAOzDexaEh3M5xDhuSi0lcVnKuNUXMT2KODnDMvqvxCQ8
 SfKv4WcucePjUcee8WVh5rM4jA+QIJk6n+yExyvlSVYdstt4upw+vvq18tBeqYU/PX+DDHoK1+r
 qOq+QYqHEU7qQAvB5p+mmzLF4CJdziScPEn5TpvpHCIFd/EgsNWuMeu+KrvhblZHZv0wx9RJfBx
 2/AMA8zodD8E1Ak2EIdSaEwYZmdorYH6ERqOI3dmMog6rRwoo5OIsbNSH174tYJrb6ZdDSuSZk9
 KIDiZQvlmyQP7e9IzHGmlrerzc7l1l+pwuTKewMJLtbgU0LGlsLsBVofo+6xYf+gIyDAYPn9szT
 uJ5L/v3GqLMZl8OIDhg==
X-Proofpoint-GUID: dj2k9MwuMXKEzDOGXVdNRUg4I1RvRkt8
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d43c14 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=OWpMj97m4owJn-abWywA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060226
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f00000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102024-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 37B843A805B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the RPMh Network-On-Chip Interconnect of the Hawi platform.

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
index 000000000000..75312cbbb80e
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
+#define MASTER_SOCCP_PROC				7
+#define MASTER_QDSS_ETR				8
+#define MASTER_QDSS_ETR_1				9
+#define MASTER_SDCC_2				10
+#define MASTER_SDCC_4				11
+#define MASTER_UFS_MEM				12
+#define MASTER_USB3				13
+#define SLAVE_A1NOC_SNOC				14
+
+#define MASTER_DDR_EFF_VETO				0
+#define MASTER_QUP_CORE_0				1
+#define MASTER_QUP_CORE_1				2
+#define MASTER_QUP_CORE_2				3
+#define MASTER_QUP_CORE_3				4
+#define MASTER_QUP_CORE_4				5
+#define SLAVE_DDR_EFF_VETO				6
+#define SLAVE_QUP_CORE_0				7
+#define SLAVE_QUP_CORE_1				8
+#define SLAVE_QUP_CORE_2				9
+#define SLAVE_QUP_CORE_3				10
+#define SLAVE_QUP_CORE_4				11
+
+#define MASTER_GEM_NOC_CNOC				0
+#define MASTER_GEM_NOC_PCIE_SNOC				1
+#define SLAVE_AOSS				2
+#define SLAVE_IPA_CFG				3
+#define SLAVE_IPC_ROUTER_FENCE				4
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
+#define MASTER_APPSS_PROC				3
+#define MASTER_GFX3D				4
+#define MASTER_LPASS_GEM_NOC				5
+#define MASTER_MSS_PROC				6
+#define MASTER_MNOC_HF_MEM_NOC				7
+#define MASTER_MNOC_SF_MEM_NOC				8
+#define MASTER_COMPUTE_NOC				9
+#define MASTER_ANOC_PCIE_GEM_NOC				10
+#define MASTER_QPACE				11
+#define MASTER_SNOC_SF_MEM_NOC				12
+#define MASTER_WLAN_Q6				13
+#define SLAVE_GEM_NOC_CNOC				14
+#define SLAVE_LLCC				15
+#define SLAVE_MEM_NOC_PCIE_SNOC				16
+
+#define MASTER_LPIAON_NOC_LLCLPI_NOC				0
+#define SLAVE_LPASS_LPI_CC				1
+#define SLAVE_LLCC_ISLAND				2
+#define SLAVE_SERVICE_LLCLPI_NOC				3
+#define SLAVE_SERVICE_LLCLPI_NOC_CHIPCX				4
+
+#define MASTER_LPIAON_NOC				0
+#define SLAVE_LPASS_GEM_NOC				1
+
+#define MASTER_LPASS_LPINOC				0
+#define SLAVE_LPIAON_NOC_LLCLPI_NOC				1
+#define SLAVE_LPIAON_NOC_LPASS_AG_NOC				2
+
+#define MASTER_LPASS_PROC				0
+#define SLAVE_LPICX_NOC_LPIAON_NOC				1
+
+#define MASTER_LLCC				0
+#define MASTER_DDR_RT				1
+#define SLAVE_EBI1				2
+#define SLAVE_DDR_RT				3
+
+#define MASTER_CAMNOC_HF				0
+#define MASTER_CAMNOC_NRT_ICP_SF				1
+#define MASTER_CAMNOC_RT_CDM_SF				2
+#define MASTER_CAMNOC_SF				3
+#define MASTER_MDP				4
+#define MASTER_MDSS_DCP				5
+#define MASTER_CDSP_HCP				6
+#define MASTER_VIDEO_CV_PROC				7
+#define MASTER_VIDEO_EVA				8
+#define MASTER_VIDEO_MVP				9
+#define MASTER_VIDEO_V_PROC				10
+#define SLAVE_MNOC_HF_MEM_NOC				11
+#define SLAVE_MNOC_SF_MEM_NOC				12
+
+#define MASTER_CDSP_PROC				0
+#define SLAVE_CDSP_MEM_NOC				1
+
+#define MASTER_PCIE_ANOC_CFG				0
+#define MASTER_PCIE_0				1
+#define MASTER_PCIE_1				2
+#define SLAVE_ANOC_PCIE_GEM_NOC				3
+#define SLAVE_SERVICE_PCIE_ANOC				4
+
+#define MASTER_CFG_CENTER				0
+#define MASTER_CFG_EAST				1
+#define MASTER_CFG_MM				2
+#define MASTER_CFG_NORTH				3
+#define MASTER_CFG_SOUTH				4
+#define MASTER_CFG_SOUTHWEST				5
+#define SLAVE_AHB2PHY_SOUTH				6
+#define SLAVE_BOOT_ROM				7
+#define SLAVE_CAMERA_CFG				8
+#define SLAVE_CLK_CTL				9
+#define SLAVE_CRYPTO_CFG				10
+#define SLAVE_DISPLAY_CFG				11
+#define SLAVE_EVA_CFG				12
+#define SLAVE_GFX3D_CFG				13
+#define SLAVE_I2C				14
+#define SLAVE_IMEM_CFG				15
+#define SLAVE_IPC_ROUTER_CFG				16
+#define SLAVE_IRIS_CFG				17
+#define SLAVE_CNOC_MSS				18
+#define SLAVE_PCIE_0_CFG				19
+#define SLAVE_PCIE_1_CFG				20
+#define SLAVE_PRNG				21
+#define SLAVE_QSPI_0				22
+#define SLAVE_QUP_1				23
+#define SLAVE_QUP_2				24
+#define SLAVE_QUP_3				25
+#define SLAVE_QUP_4				26
+#define SLAVE_SDCC_2				27
+#define SLAVE_SDCC_4				28
+#define SLAVE_TLMM				29
+#define SLAVE_UFS_MEM_CFG				30
+#define SLAVE_USB3				31
+#define SLAVE_VSENSE_CTRL_CFG				32
+#define SLAVE_PCIE_ANOC_CFG				33
+#define SLAVE_QDSS_CFG				34
+#define SLAVE_QDSS_STM				35
+#define SLAVE_TCSR				36
+#define SLAVE_TCU				37
+
+#define MASTER_CNOC_STARDUST				0
+#define SLAVE_STARDUST_CENTER_CFG				1
+#define SLAVE_STARDUST_EAST_CFG				2
+#define SLAVE_STARDUST_MM_CFG				3
+#define SLAVE_STARDUST_NORTH_CFG				4
+#define SLAVE_STARDUST_SOUTH_CFG				5
+#define SLAVE_STARDUST_SOUTHWEST_CFG				6
+
+#define MASTER_A1NOC_SNOC				0
+#define MASTER_APSS_NOC				1
+#define MASTER_CNOC_SNOC				2
+#define SLAVE_SNOC_GEM_NOC_SF				3
+
+#endif

-- 
2.34.1


