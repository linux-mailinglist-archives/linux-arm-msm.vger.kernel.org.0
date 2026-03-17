Return-Path: <linux-arm-msm+bounces-98158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHyRIgFJuWmK+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:28:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1432A9DDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DEE93302D9EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F273C276B;
	Tue, 17 Mar 2026 12:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DM0hkytw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4dyzZu0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3783C199C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750520; cv=none; b=cDe9WgGRqigitfxi0ovkVIB1MnTqejwLhNXdcqduKPqTPVF6dNKw+IXtjfRh6+BDIFIT+gUogT0ub2+4Ink5k7AJzBRPhPZFVdUYjdxoVUuKLT+P4wj4IvIY+Ew4iVYCwf0GK2B2WpBOagM4eguO/I9CzK9vcTfB58wtrhKUAso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750520; c=relaxed/simple;
	bh=jwEbSknkTqA/WdCoJsnCio3M5fUYzjYKyaflSmFl4vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mnLaJLjNuXLoGqbmERFSAbuLPfLwkFXs2ceQr5jy2Wf1df384DXWheWRMN4NTKk6AWIyrGXcfnCOg5JtYIa4+kn8SxwGWBGtay2jyXV4HvEpzIytUyYjE4f/LiPWpgjG9DCOGOfLZWHch9aVc7CSjdrm7jLluYZ2UslKGsvK7pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DM0hkytw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4dyzZu0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBd9DO1621856
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niM+iJC0eeL7X/cWaAOnCvf7tfxCWSaK+2g7VjRLFk8=; b=DM0hkytwO+R6YrR1
	Zp47SabKTjE0NRt8Sq5NRz9Q6juqcSgThsJtJhkAcAwZIzoAt98g77fUIz2fjI0V
	7xIxS961n8zpeChVC8tO6e/gniHhqQKRwxV5YUABak1tQNxpPdtk3Z+iskbsXNKt
	wQAB3PbTOe5s3HYXwOAYYrJ25jBMaOIecMz/eywO9B611Uv/r9qBlZVpTQQQjkCz
	XEMQYG1BKpG18N4R/0CVB4+mJGXLL17GXskb8YWCS2NkcG0d5BUsVeDc9Z6RryOI
	uzXP/Q0exkR1a3aOIlqJXtMjNNv0Hae2pfqD3RWLR0bsA6leW84rdzIG06tEvcgW
	p3kiYg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyemhug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:28:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82988b04c5cso19553477b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773750517; x=1774355317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niM+iJC0eeL7X/cWaAOnCvf7tfxCWSaK+2g7VjRLFk8=;
        b=Q4dyzZu0b/69X0e1zNDXxmgxD7Gbg5WOQl2xKMHo9cr6YPvJyJZWIxc18cU+REUEjI
         V6ZX5C4nfxja9efse0sibKR8oJt36OB/HmvfwyUIInOwTfQIfMmatSUSBo8VugKKayB7
         kGzuSrne5kqK0uaCADrTZya6jrVAKjpitKB/6344QinpBbkZug4gIWkz4XOJwZCCnc7y
         8SPgzbk6Qq9sTvHw4ZO4e0ie4XMWCxx1aIXPHhCGlOLO5oct05f6bIVn477EbO47Df1i
         rwNDlwnIyh4UFQquXaLMwULyZQ+tKLahBBPBL0n9gsaZ2sXM18RskDYo6Ol1NIAvy4sQ
         QOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750517; x=1774355317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=niM+iJC0eeL7X/cWaAOnCvf7tfxCWSaK+2g7VjRLFk8=;
        b=mKSRooVqc1yWg6uxotPcFVv4rplVPKPSQRzvvk852TcfqPni1a6u6h6sMq9jODD2b/
         ZDbx2ckOrCVkZVe2CVvFlQ/gVy9UrAqGIXl66l6j+6tdvkKsYHSsa9n0wh/vnv75p+gu
         VXNHAiDNyeybVmdpvJGxb3TdJ7xQIZR4slShwZi/4psC7NiKF2iQLK65S40LKycWYwCX
         RdmEZMGJq5/8u6hX7Tn7cGs48A61uVfSFHVeAAO0vVP7wuRp6DWreb3yuYTPGi9TUnmS
         VcJd9Qxq1tsfywbq6U5DzEfxdjsFb91lf11hKt6vNjPygPv0kvDIYLw5mE8d8e3zL5Fk
         uQcQ==
X-Gm-Message-State: AOJu0YzfnEittAMQN6lFzpJxmN1INWyN3FRfp+HbHEDHMaHRYfUHyZVZ
	I96xIzNLuBbVUMkkO1i90VC/oDZSdZwmqNw8QMQL46fDUpZcMaMWV9ykN/hRtsJwVGFvpArCrY2
	ECAe3WJdRrr3/pvg8ZQDrFE6JMGhdS9CXaX3nNknMDLlKazrD7cV9j03JlfVlka5aeMtS
X-Gm-Gg: ATEYQzzukzukpeDWdlwbqK7Yq3rZYbQwdjZXgtNW1GAGTM1os3q4M6iLhE2MIwRtQoB
	g4axzoYqN3wcWv8QAXdREAg42W8kHJiz/dj7uYo7ToP/XjQcSXF525YRBq8mbJjrlrSTrWrarIb
	8D0+EZDPtz0TJUTVMyKYCwFaB1EByQmDixb82ocRoUfCoGGTCXuxaJWeiHAE8lr5B54tN/h/nvL
	pwb/HJex42bZIcqQbQDEq3Z25AAJrW19bYP65YJPeICkBEQ7A0qxpXuqjggpaXA08P3sMLIQZl5
	AYpz7UD8WaLymjD4IxHByw+Od8UdgsliPqKzlyf7J/BfSXD2QEzWSTXPYC+/L+YGwM22jFOeGpS
	/zmIG0b+4XCohznxXTPYEwYXF6NqYSlSdszKOw5prk/DdoMUhA/Itq5P8XdcWrJHi9nRtRIymV/
	lqDyWIH7xvyPqG9UOivvtJLHUvfMAsWeBz0g==
X-Received: by 2002:a05:6a00:9083:b0:829:af4a:5ebc with SMTP id d2e1a72fcca58-82a196d2ef4mr16274077b3a.7.1773750516985;
        Tue, 17 Mar 2026 05:28:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:9083:b0:829:af4a:5ebc with SMTP id d2e1a72fcca58-82a196d2ef4mr16274056b3a.7.1773750516542;
        Tue, 17 Mar 2026 05:28:36 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm16654056b3a.34.2026.03.17.05.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:28:36 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:57:55 +0530
Subject: [PATCH v5 1/5] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-add-driver-for-ec-v5-1-38d11f524856@oss.qualcomm.com>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
In-Reply-To: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773750505; l=2257;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=qrvxHlVtDdMnB751P/2Y3pnvwn4siZ5kMuXc1Ih3Jfs=;
 b=sUJdn8dmTBJPbcArrBkAeJ02VYrFQdVwAsKKIjC8AMKu+i5hmpy5f5kFQIo2tyqVmDyDQ3to8
 8H4sPIz1gX8DrkuOmnxyn3FCvKNPQl9NYc7VnwojwgUVuGpO8WRCyV1
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: Pk-H-7lLxQlQBcsGcg3mxkdSmInuBuGJ
X-Proofpoint-ORIG-GUID: Pk-H-7lLxQlQBcsGcg3mxkdSmInuBuGJ
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b948f5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOSBTYWx0ZWRfX+Q/xOwDz9mnc
 tHSjGo7tG4Z+Nzo9JToi4rcecTLt50Gy0+JzloWqjK1l1ZtYpbFqb6ZUAgumvL+qXlK9UYY/gEK
 FqV5o06UXSCziqw3f/UQBXokYmfTJJmyLd0Bb6Z7Wd9oQBERLni1L1X8MFYDs+vJl6QciGia8uY
 CtqIzDpaaawvpAuDfq3UgHegDWDWwpC3qXQLUCHqDWmZy6kL5y60TrX9ZAClB+tyGpgHE5O9FQP
 +G4aIZH2oX/LP2u7Xwrrkkv3kuWs9XUpjfPtp9kJEWtq6Y7cIXut0oGcn1qafg73A8HchHyBS6k
 8yN3OTawP+ukL5tQx4L90r/UaIKAsBEwh3cXntvt4FY4nRhrVVBNtOA4VKQkRLXjq6mbi7dIbcU
 2Y5mTHdaANtZd/8RvvFMkuXEjOk5pRAUhq40LkXeguSN2rZIp5yp9R2C9qEwrMCwwgj+kNCAOrI
 aUMi6DlC6Hr3+mMC6zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-98158-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,0.0.0.76:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5F1432A9DDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Add description for the EC firmware running on Hamoa/Purwa and Glymur
reference devices.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
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


