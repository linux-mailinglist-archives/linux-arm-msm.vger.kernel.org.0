Return-Path: <linux-arm-msm+bounces-106919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODUQMvLQAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:52:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5189E50E3FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E758307EBED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA343A1685;
	Mon, 11 May 2026 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkDjHxjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqXiQj4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244B63A383B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503480; cv=none; b=EHLV6l840+5KfS00RAfdQEEjrOdRBtqs0tDV0Yev05o2xC+u3+QkrR9byu7grbXH35VIv+gS0C/Z8yoyumnld/kbHrxAGyH9qtzSA5ZmStG2qtnIqWOzp5sjb+YG5Bnfz3clAm1oJgCWKpOOIP97afXBpOzlT1jHtQwQy6QOTAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503480; c=relaxed/simple;
	bh=zFarwFyP7Mwjc36+jVJxSXy6/e4tQoyriPLsSHSmWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5bhsTAfPX5Oz0b4PrWDZngrpumCaaDiqu3u01kNNfSgZmC0o58x7YaX4nUDTZl+0ORidbXSMAGMU8VT2V+v+lR/APeKZ+rw9G6vYa0c9vqcbXuJ9uJpnXd9SpnEGlK9WHEfB8VsbhptjO/Tfxcj+/nOwTUCmk9lvDgG6QIAwBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkDjHxjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqXiQj4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8SYYk1294358
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=; b=MkDjHxjyTMIt61R2
	za9VUFS5uTkWlSCaQZu+C0BoD8BuLB7RXbpVT5qKEVpHIMBIYq7EXdDK8K6B35wk
	tCDnJ/OObrzgjiqb+wis9lQ3tNFLCXM0anXPyBe2bHTq6QVQGrCEqNPUogZp8euu
	5zJ+PVHlWUisX+XHjCTJxuRRg03Pt4AEXvitc++22ejCj84IZQ2yqcjpszpfEE1N
	C3fQWR8VGOs23NUndE4pFqZ4lO97sq10QxWXfZUYcqfa4M/Ix2R/wtunl9GJKupO
	sQJkC8xFm9BUILhq6TmQIZXzg1iI8+hXkpa1TJ3ipHtSpj6JXRFaYUBw1yZ4ioGJ
	p6B9jQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dksm8b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:38 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7c24193e2b8so20212697b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503477; x=1779108277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=HqXiQj4NG+qTDYdqzV50NKnFI09Zo2G/Mng8ezwcAvH7p5/3IIENQoelR2P+4xypv1
         oA9OdMkTIe8oFpbD8Hly3jH88SKQ1rXVoam3PUL5eUOF5XHQkH9q52/wk4SGhByiVs+B
         E9dXEqyEjn4SbC8Xr7sYZ1P2QFhZUU4kW95zcER49dX9mT+doAOavzJq0hUeNkkhdgwC
         xm+qxXVtZPsxAjR9P3P4k/Vs1xPUsHSVjMaw9iZPodOHgdkLlr2H/izg30CcFZilvroX
         9rydW2BeA8HqJC02b6yeBG+pHrr1M4xq/A2O1coIZJjOXyn4i5HNcVugh0byH2A/G2J9
         tAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503477; x=1779108277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=mDekMKwDp0x/ibwhHMV8zvGkanblQvC4l7RL6o310h7O55sD5lveFp3o1d2UXXGJsY
         TwapzA4UjeAxxJYz/Z7WZpSmaVq4Yx3wI7FOCnnlGEjcQ38CIQNhzkKSjMZ0+PjRCB2D
         m5mlGvLzUPlADKzhO+cxQY8XqfXlAPEnImZW5QSJN0vpub+s3GShxuyYoiXuBPhedun2
         31lEhRB3UZPM83T18Kg58wKeYdFu4U29CcztrB4Gy93w5UIY2MjSujQJZZRihdAaZCcq
         B5Aa49bTY/LGRWyHuTgN1RM0rkR8ADFAg8Q9m7gD3lSy/2KxTuQsfyqDt4t8r0XWQQiu
         fgCQ==
X-Gm-Message-State: AOJu0YwId0ZFd4+dWDrDFboiCly0CNOj0omnMi8aTDHR82fAyb3YG6b4
	wxmoBpSJDe/OFVfefdc3Lcqjln3E1yTYTsfH2khnl0iQsllyAKa1kr6g0Jesyzmw3HUB/W47LD4
	0Ano1C+WjIQxqfGQjbWahacETCz9DUa+a9HkJfoDe/ceg3uwHquwt+kJjmQ7bYSo+LDkN
X-Gm-Gg: Acq92OFg9l4u5GUKl8b1t1bOb/EyLRC6WuIXViolEC52Q89x5PJlwUmKCs9wuJIGGTC
	doFqAtpvwkgXWCs5gPNX74X+R8i7/N0I7gosLhbEjf4al5mTaP/YMyGbhtJiL9NK+IRXPWZ0FxJ
	YKDUtfuekGHwn2wAIbLqL4oNQRQhIb7sM3xU0QRrLZ8aom2mFnnLSG+hzg0pVilLa61ck5rSvwc
	IYURlgCKcNvrx71D+k0MOGkALtPJ4vScTUSIojWz7kKeFFYmGAUzVcJeNljgrCELpZqAKL3h+y5
	BJQSenugsIRVPCFn3KlbbY7++7BqRkKunM4MfGgNGHzAXVnmh44IVdFC8gxkh9Sz+8dHUr5p7p8
	WkANnWvBlqifVZROokXRlWqXVYrzXySHaugWlX9C4FevZAtRPYipHoH4SfKw8mgCW1B0wDERwFa
	8Hkk/MocqKGFoeCq3vkyqlk9Nsk/D+iRjPZQ==
X-Received: by 2002:a05:690c:6989:b0:7bd:a6ea:c508 with SMTP id 00721157ae682-7c104dab240mr82943377b3.24.1778503477430;
        Mon, 11 May 2026 05:44:37 -0700 (PDT)
X-Received: by 2002:a05:690c:6989:b0:7bd:a6ea:c508 with SMTP id 00721157ae682-7c104dab240mr82942977b3.24.1778503476919;
        Mon, 11 May 2026 05:44:36 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:44:36 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:19 +0530
Subject: [PATCH v9 1/6] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-1-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=2330;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p1qib2l7A/JEOeiEFUXoqiCJEoH/aeCCTCy9wrPvB6A=;
 b=FCKxXhfphZfzNrqt3+fgaJMTaJIkPxTyUKk1I2quUplNtgZlNkRiJFkRS+Erh/joPXZuPFGRi
 nA+DuAdTtQXA7FrOkEGSNkCK2JaHd45xLiw55hQB25jfFuhnaHt3Qq8
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX95swkAguM4iu
 Us1RIeiWqxbAdF3JaWjwFhdg2I1Ts86jGuw7RFqhcE9ZkV9I4CeKL+gA3YXtAG0/pRoO5I0xjUf
 42jBBmaLs1wMWjrNt6FekLkYunqMQaIa6JCDj+PUEqaNFBNBvDlMC6DrF1FS4+afEAJoo66m/+E
 8TGWoxCQNXgCbtw6B7wQbAilbqphLL4HFoOVKGdZmaJoRHxuYHbivfZ/8K/akGu4sDeVlkUN7gK
 FeDXVbwUGVxQamcXP0Aijke5edKnIcVjnNsU/zkKBsaid/tltgOafFNpv1OcXBOKXqoVIpMcf1z
 3HisQOoYKsywXElBskvLPvBvSJNCM+WwxvrzM3ZY0C4J5Zc8ZtmvIimdAQZrHt6rb0xFoUw7j5i
 jQy+QWYgSolV8IBHTPY5B/OSKaUdJqJZGYtnet5SgMFzsqKv14O34g5k1V+9tx49Aw/SmKygoNY
 ogSDm0PsfpoBDc3nauA==
X-Proofpoint-ORIG-GUID: Ldt9im005sJxTz_KXffYZ9vRiEo9Ua70
X-Proofpoint-GUID: Ldt9im005sJxTz_KXffYZ9vRiEo9Ua70
X-Authority-Analysis: v=2.4 cv=cKjQdFeN c=1 sm=1 tr=0 ts=6a01cf36 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141
X-Rspamd-Queue-Id: 5189E50E3FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-106919-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.76:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Add description for the EC firmware running on Hamoa/Purwa and Glymur
reference devices.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
new file mode 100644
index 000000000000..ac5a08f8f76d
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hamoa Embedded Controller
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description:
+  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
+  EC running on different MCU chips. The EC handles things like fan control,
+  temperature sensors, access to EC internal state changes.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-crd-ec
+              - qcom,hamoa-iot-evk-ec
+          - const: qcom,hamoa-crd-ec
+      - enum:
+          - qcom,hamoa-crd-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "qcom,hamoa-crd-ec";
+            reg = <0x76>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...

-- 
2.34.1


