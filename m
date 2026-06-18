Return-Path: <linux-arm-msm+bounces-113725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DYGpKGnHM2qsGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:24:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972969F466
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:24:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RjdmvfIL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113725-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113725-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3025300B198
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9433D9040;
	Thu, 18 Jun 2026 10:24:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020DD3ED3B8;
	Thu, 18 Jun 2026 10:24:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778269; cv=none; b=BW2YI/lukiIhCUw7IjMBAIvCmAeY5K8alhq7wl+DoEXYVJKZc9ZD6UqbabhVmaO+fNnawGl3E3v/vlTJ6yERdI0509ZV7ckoUPTbtYZgu1Sn1RCT01wV1PqjPHIqUhr6xiEWU2l+1vRtL/XgmHTAyle7Dqd/radO3FbOFYSCGsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778269; c=relaxed/simple;
	bh=YHDmj5UtXPQYygK8XqVADahATufhTYmes1txdBjjs0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZFOGkIgT3ZW95IX0O2ymp8t43FM3FPqnmBdDYEyk1HUYkguv1s8241CYeX1xkmJnEszUR/GANWPymdQDGx6RP1mtGnBr24PzONNlWbLtllD0ne3Ja67X8TyAtHBg1CL0mzF5DJJyXG5HAYNPE0l8arqSNG2p+zqjA6fAHM7RaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjdmvfIL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8xDmT723341;
	Thu, 18 Jun 2026 10:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrGv87CLA4nFH3s1cTQZtvb8BtTxYrPmQ4s8Z71pl1E=; b=RjdmvfILQPaRdvU5
	RpOPld4zHIszlr9TFYA3GDXz2OpXlZIcUviSIz2y7qcHOiFlgzE50A7z6qc7rlb0
	0Ivz2kG7/N8kdvs2jkGTNCjmLffvLnAUe5rHXtIGF5KXIsSMHofZCPCoKYlExGhj
	tmX9c2hkr9mkQaFgj67hUoGXK3y0NPfdaNzXzBbbVa5yo0RaYDfv8Z9dMkF6aUZT
	odA4U2E0vKOyJX0I29RQxPA5BnKe/esT85x2TWZk0cKHu3SMPNFs0WNC2vqjxUfs
	PGS6ggOktTB9DIB0G7Ercps/7Aw+n4tNNGfyGhM3OuAZ5QxVFN6EXASdjoqLhp1a
	lD2E9g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evdn409n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 10:24:11 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65IAO7J8008714;
	Thu, 18 Jun 2026 10:24:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4es09kqmr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 10:24:07 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65IAO7HS008698;
	Thu, 18 Jun 2026 10:24:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-arpisain-hyd.qualcomm.com [10.147.248.17])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65IAO7SP008695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 10:24:07 +0000 (GMT)
Received: from hu-arpisain-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 47171631;
	Thu, 18 Jun 2026 15:54:06 +0530 (+0530)
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:54:02 +0530
Subject: [PATCH v2 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-ili7807s-v2-1-b3f0c109b102@oss.qualcomm.com>
References: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
In-Reply-To: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: arpit.saini@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ayushi.makhija@oss.qualcomm.com,
        rajeevny@qti.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781778246; l=2486;
 i=arpit.saini@oss.qualcomm.com; h=from:subject:message-id;
 bh=YHDmj5UtXPQYygK8XqVADahATufhTYmes1txdBjjs0U=;
 b=98isMFVzLlX8lIdDQndUO6JwhFRtjHCkm6lYyl5Bfs1/DSB0M5tV5uOUoh8ewgFlIaR/B6j+9
 b8rqyfOiquYAZWs6GgsaEudmU0py6KaQQzAnfKeT90B77nits7PzZCT
X-Developer-Key: i=arpit.saini@oss.qualcomm.com; a=ed25519;
 pk=OGOh7FGwrnkILHNlcTTABbBMQxxo319duzbTg0YPDAc=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX2VeJSXtsuO06
 tcCcHEmbjzUir3qRFRT9q9MAKUWr82whwmr1TMdOEWylLNNBxXhUK1IiN6968zIgbfscxWg8fpE
 b2YK9/lSj691jAlwmCoDRMOyohsoc4Iu5m4dG0Gwoe2xVDKt8rRLrOojvNThH0fLu4+pxJNdIDl
 llu3qyY0QRuObFKk8Q4dkzc96xUVRRq3Ywes59nVocGW/uZ4YI/pR6k/T5M+1lPY9hLaPRbG77w
 qoXcs2mN5rhLR7Dahn8HXLnf88RYi137A5MekCu2iHPmMyoCBi/+mJZ7j2m2sRemZlY9AgFCFmr
 EjeQAyuBJ+3ck+RL9ev2hn/HgoiWukY91uofFoyThVyibwrdAR1yHK0OUCpfmck/Z9DTrVF1luD
 FSNpud660V4jWy5kGnibZlz+N5VTRail6KjolFxeQ6nvuhXwQZfT8CXPpLethvlCcZvIboO9kqA
 7himXO85je1S4yybXDw==
X-Proofpoint-ORIG-GUID: qOngQGunjfU7ArLPaQVJqk0n3CshC8bq
X-Authority-Analysis: v=2.4 cv=FN4rAeos c=1 sm=1 tr=0 ts=6a33c74b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=rNL3eEAJdr9xQ0xVSqAA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: qOngQGunjfU7ArLPaQVJqk0n3CshC8bq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX3I83qqGRMdSX
 KpVSsD3h2AzVoo4gowRGC5LvOr6S+OmaEFZQLlP5yjfCM6/XSxLlvO8wUrCwb4RNLRE3BX0myyc
 xa+hKkO9g5fWogC6ixWp4isBN0UtDQA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113725-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ayushi.makhija@oss.qualcomm.com,m:rajeevny@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5972969F466

ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
The DLC DLC0697 1080x1920 LCD panel is based on this controller.

The panel requires a reset GPIO, I/O voltage supply (vddi), positive
LCD bias supply (avdd) and negative LCD bias supply (avee). The panel
operates in video burst mode with four data lanes using RGB888 pixel
format.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 .../bindings/display/panel/ilitek,ili7807s.yaml    | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
new file mode 100644
index 000000000000..ba8c5bbf8ffc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili7807s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI7807S-based DSI panels
+
+maintainers:
+  - Arpit Saini <arpit.saini@oss.qualcomm.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - dlc,dlc0697
+      - const: ilitek,ili7807s
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vddi-supply:
+    description: I/O voltage supply (1.8V)
+
+  avdd-supply:
+    description: Positive LCD bias supply (AVDD), typically +5.5V
+      (range 4.5V to 6.3V)
+
+  avee-supply:
+    description: Negative LCD bias supply (AVEE), typically -5.5V
+      (range -6.3V to -4.5V)
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddi-supply
+  - avdd-supply
+  - avee-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "dlc,dlc0697", "ilitek,ili7807s";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+            vddi-supply = <&pm4125_l15>;
+            avdd-supply = <&avdd>;
+            avee-supply = <&avee>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };

-- 
2.34.1


