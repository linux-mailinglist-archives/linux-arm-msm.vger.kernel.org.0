Return-Path: <linux-arm-msm+bounces-118072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eDVnOY7hT2q5pgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 19:59:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9237734154
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 19:59:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UlnnUMf7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118072-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118072-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4402F3009CF8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 17:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC3C4DB540;
	Thu,  9 Jul 2026 17:59:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9464A138B;
	Thu,  9 Jul 2026 17:59:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783619979; cv=none; b=jafXKGDhVk2ygRv8WQuWRHu9w3Ypm7ZM39iN+86yEiAmM7pv1erpOHcrsNMxoTMNVrSvlAWWyzsedMyj5dLh/7mLugKZDkZVSRRgexXF2LOqFfRaVLYjhrMWElF0YwVbX3jkeetWI66BHtfvNsIC9d/5WYunpAhDvD9uwsUv3D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783619979; c=relaxed/simple;
	bh=HhBXEND9TcyG4vCf4K6lxzTUOUgSJ+9Zbj1rSh0OxCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=siJWd9oz9IFy/RzC8DSsyCGOn0fPSO616bCamDO9cZ3n2D/ypksrHK8u8lKdc9VpdDG/MGCnodkxsEB/g9vu/NmwCEfPF9cm35lE2u/4+JjiFdrR1AvTc2Ncv7Hucw3j8zIGZfz9Zs5TDg22CkozBIYJ1U5CqkLW3AzHaKDgVKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlnnUMf7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXHcI2296148;
	Thu, 9 Jul 2026 17:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GxVBimFKLA/
	+dc6O86DyZX01do7mut7irghFvAnFxL8=; b=UlnnUMf7pXH42WIoc0E4UfcBJSF
	BtMvBqYJFneI5sGrHcrG9L3X4PZU20XgvSkSUtg5/1Swy8RBLm06C+q0SuQGhRUe
	QQ0YUi/akVkNGBBboi2Kd/k63TSE+h/QgCKePJCjVvtUfs5nScbMEp57zgRRuF+P
	9xC2WvuZt7JttGKYI0paGnwb1tNPQi8CoP5dSG78yNRKzFJ1Y3OWes1mEoTysASQ
	BCZ/eYp2KnbWR0phu1r9k+J8XX6a1zxM6YRi4LVgnPzFnAcB1bjDJa3QQcRxWyCJ
	KYQJ3D3rjZna6UQZT07LupURTSyctOs5ePpxD8TJoRySzoQHckT6+zub0hA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vkhqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 17:59:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 669HxIHk020152;
	Thu, 9 Jul 2026 17:59:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8m4wru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 17:59:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 669HxHCe020137;
	Thu, 9 Jul 2026 17:59:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 669HxH9W020133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 17:59:17 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 84D64630; Thu,  9 Jul 2026 23:29:16 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: dt-bindings: qcom,wsa8855: add Qualcomm WSA8855 speaker amplifier
Date: Thu,  9 Jul 2026 23:29:14 +0530
Message-Id: <20260709175915.3805851-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709175915.3805851-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260709175915.3805851-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NyBTYWx0ZWRfX6ngr33ZFZJzP
 qmahu8UeEKADnoRYvcpzgJ5t0Bgd6AVsKJwQuGNZ/m/TC8PQdkTQiTBKSIcl66gT9iFpZNiIbuJ
 9pRZEVqQCDy6xfok5MWWWLjrcT0RthXa9NiaGF+9vnM2LWEZF6R79pR2ANdFz8BUviMSNgoGD85
 1LmMy9cZmgMtsKbrI7b3/+EXaP4uDqeY7lHuT4wGfw8bwfgjG6sbzSFTU9xoEWFCgOz901q8I4l
 ZZc2j4Ca7lwL4eG+uCeXuXCEcDATLIsrVX4U097JMC1oKxjeWkTgosWWpNGsV+zLRfUPZBrUPeJ
 eD4KRt5zQ4W8UOJrRyVhu5EwJTOPZrshfgSNmJQQQhT2lsUok2SxgLx4CTZpOxy7Poj3vUhx+IV
 KyGO7L/U36ixCyO+GLIddQu1wbhTddp5/1vtB8n/ARcVd+AtJ8TrgvybSjOFcVCG28TgIAjlhNl
 O5XfN6MkHfZxtpSpdxA==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4fe179 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=PrSW79t9vC0gYNWULBgA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NyBTYWx0ZWRfXxMpPrDM7Cfg9
 QgilTzjdQKAnDh47lEApXWNEegGeKs6g5uIFifoIqUF667IyKp1O7Jp2LHYJ3ipAECRZ261YmV9
 xyv5ei7qe1DD7Jq9QjIZBz9hUoA9+wg=
X-Proofpoint-ORIG-GUID: W3o5U4IgKShzOg6Yuew6RfqZYZbuy5vk
X-Proofpoint-GUID: W3o5U4IgKShzOg6Yuew6RfqZYZbuy5vk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118072-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,pengutronix.de,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:p.zabel@pengutronix.de,m:prasad.kumpatla@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9237734154

Add bindings for the Qualcomm WSA8855 stereo smart speaker amplifier.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wsa8855.yaml          | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
new file mode 100644
index 000000000..00a6a05e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wsa8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WSA8855 stereo smart speaker amplifier
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
+
+description:
+  WSA885X is a Qualcomm Aqstic stereo smart speaker amplifier. It uses a PCM
+  audio interface, an I2C control interface, and a Class-H amplifier path for
+  high efficiency, low output noise, and low idle power consumption.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,wsa8855
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  powerdown-gpios:
+    description: GPIO controlling the SD_N powerdown pin.
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO controlling the SD_N powerdown pin.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-1p8-supply: true
+
+  vdd-io-supply: true
+
+  qcom,battery-config:
+    description:
+      Battery topology connected to the speaker amplifier. 1S indicates one
+      battery cell in series, while 2S indicates two battery cells in series.
+    $ref: /schemas/types.yaml#/definitions/string
+    default: 1s
+    enum:
+      - 1s
+      - 2s
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+  - interrupts
+  - vdd-1p8-supply
+  - vdd-io-supply
+
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        speaker@c {
+            compatible = "qcom,wsa8855";
+            reg = <0x0c>;
+            #sound-dai-cells = <0>;
+            powerdown-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+            vdd-1p8-supply = <&vreg_l2g_1p8>;
+            vdd-io-supply = <&vreg_l1g_1p2>;
+            qcom,battery-config = "1s";
+        };
+    };
+...
-- 
2.34.1


