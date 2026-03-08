Return-Path: <linux-arm-msm+bounces-96095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJgoFSMIrmkN/AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:37:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 042EC232B52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 564E7300C30C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 23:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F2335BDC4;
	Sun,  8 Mar 2026 23:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuGmkyg9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MaNGHTSs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65603537CA
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 23:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013023; cv=none; b=Qaa6wsYAAGrX32n0B/c15pRc+x8tjwuXiQcPeQEu0BeyZ+Lz27l4ADKB69ux9mhq6Kwl8NdFlgZPE+eXzP4ETmWbOpn3xoVIppm2T8Agun2BwC4OMF6WLDSlowV2W5uPZyy+NBeu7Zz2hVhGB9ZjHhUSbPGbPtlUxwnoIIBz9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013023; c=relaxed/simple;
	bh=eYkkvK51MTx9Bdfkthyx9CLf6igJE1ETRsExN/41P7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NOuXiSXZXIPeMJr4HS3bs80/mVmRfO7bhRbaR4q8sO7VQ8CtyfkIupAcIMy2VVe3UBU+UtmA9rm/C+MWYBdhMfEsfDnc/9z8Udded4iAFkhux7kjaUiwwsFH5p1H9q07rtskT+PET34mZEf20mqWEHviHGvbpzTxV8FpgJLJhKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuGmkyg9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MaNGHTSs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628MnlAM3686497
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 23:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HLnC0O84/rB
	xJH7HK8btP2WKZlrp/hXgCjy/ALgrKbY=; b=RuGmkyg9UIosFzajyGOPZL9W36o
	ykcwZ+tER9klK1Q+oUjomhtQfTRYUk0laLzNnIjnikD47BMC5QJZKzqX/W7LCtNw
	hZoVmcLoklr3SV40+60C9J4BOq8SyREi7Is9d9kzdNjeupTaaCGP48gC/9ES5OPz
	yo3J+KKDsCxexOdGKY/CPp03BhDte0dUp26/HYNLF2xPxjl+X9IeXjCxp5IWCGz7
	X6tDk7WvFPENCZB2Xi6drav0vvu2gX78z1lfjF5HxOVL1Mn+4JAAPLwR3etH73Jp
	NniSwpOOT1Xs9qReeOz/ar1g4Rz+PnnlBnDDe2V3hZxyh7BoteKLOzjjCZQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrkdtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:37:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae502a1dd9so92907085ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 16:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773013021; x=1773617821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLnC0O84/rBxJH7HK8btP2WKZlrp/hXgCjy/ALgrKbY=;
        b=MaNGHTSsIAhz9i1D7RZG9RCqlH9V7pqub68ePWYWnCiOhWFC1+beYt1y0R3R/6hhCt
         Ptz9eAVK26w8frqDMqfshkP7WJWivpDb7IA2gOwedJSUArFVj3o3HoPKjzH9Xai4VZX4
         gX1nK3xHOsLDUpDx0J4eNYJl0UDssim5SL+R315KesCegeNmIsaLltyQ7czucLgdFkMH
         YTJCZTmbl+4WkKuX87HdgH5DIiN9SdjsLT1uiShlsTcJzKILpl5xex6iGTiZtL1nBM0H
         I3wFMCO1Tsh3F2Z7twG0tyaOoxdXizOirv448phYTXz4WB7Z2hxI3fk+LN+oDQPpDAmR
         ItdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773013021; x=1773617821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HLnC0O84/rBxJH7HK8btP2WKZlrp/hXgCjy/ALgrKbY=;
        b=IFSsbxYzj02Bviz09XeuI+va5A194Hs4MisSIhDZc88f4VqudJQUsTwpow4XZ0cZ57
         TifGt/zRF+Oo5sm0zGXlaH+oRuOP5sy4Jj4PaRv19/6dHA8uNZWaUXfDj3PQ78kNjKZg
         lup2AzP3mTnj3eMxdOuMzYX8fV3bx7ARsdkVHnSYigyIokxCN21b2n3x30jc7MjIir9m
         obeXy2TPyudShAH3cUIIVTNdGZQwTPsu+fxdniijWDumrNo9Hee0PLZhuU5NBJJyFoto
         tzLYGtQC8fEHj47HlIa9BDpI/iV9LdHb40e1vMbU5S8L9aFTeb9wlsgVv8MgLfpEtdsU
         W3+w==
X-Forwarded-Encrypted: i=1; AJvYcCXonPK2qePuPSjvLjCOLnSVVxy4hsZyJPrEqSrm5nERp53Ad+SOnKwJfNmdAEQBbAZ3z5LNWjTF/I7NHLXw@vger.kernel.org
X-Gm-Message-State: AOJu0YyKfwZs+ZF9ku1Br3qjtuI5y6iXrcdJcFjLFr4R8kEoDY7If/Q7
	IucJZcmaqhge0En/ARGw3X6tioTNwHHVjDG7pHK4pZvLYQS92wiTTg7k5gLRaG3os8AhTNMAwSV
	DNIgcOxGq1SvUOXnkMqc7aWUa13qzxAKUj3nExTu6wV61FtwqeNCWmb59ok4b8vn90oZA
X-Gm-Gg: ATEYQzyRocMjBXJ5tIcb+qhbAims3dM21U1/ovsikcL1ZY4kL9sZlxGQcHGKRZ4xVTA
	7+h3YulKUULhsIBnx1rAbVaIhAzuSksz/p6kg8Z7qw9m4iINZVLKnedUhCPMS8Xjw5UP2MhW/90
	JxUZrtrpNdodYinOltu5mKfoNnk0FFTKHrhrdCe/dZ49xm6uVRqd1KQ7NuYpkJ8v/hXzSyoWQFt
	nSINjtcINMPrK8jhE9zjBvXUESSTTBPucpZwRbt8nOEGtFJ8s/BwYHmc3JRPKBn2pLVoGKsF6AR
	ajg4kMoQ3oyPJt3y6hNIvYs8bA+VYr7VBTW9fDNQy9hseCpEC1n2P63SnXD4KKo7i/fJ4c/AI8V
	JnXC1qtSeUB+h2sCVo1zIsYJDndKJ2Y/vGywNejIvOnBogFtCBbxR0bAKgHIvh0BC0gKEHrUqsM
	zNKQ2WPBmsZ+tsggaRkKsohhkLgG7dFJDxkILk
X-Received: by 2002:a17:903:2411:b0:2ae:517d:5cf with SMTP id d9443c01a7336-2ae825373b1mr93783925ad.54.1773013021306;
        Sun, 08 Mar 2026 16:37:01 -0700 (PDT)
X-Received: by 2002:a17:903:2411:b0:2ae:517d:5cf with SMTP id d9443c01a7336-2ae825373b1mr93783765ad.54.1773013020865;
        Sun, 08 Mar 2026 16:37:00 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ad26sm114274845ad.28.2026.03.08.16.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 16:37:00 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 1/5] dt-bindings: embedded-controller: Add EC bindings for Qualcomm reference devices
Date: Mon,  9 Mar 2026 05:06:42 +0530
Message-Id: <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ae081d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6bqoFnLgofmmdwMbvCAA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: qOOc8_RAbsid6Bx1_3Tu1RYBqC118x45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDIxOCBTYWx0ZWRfX7a7tTa/s7mEp
 NXb1YeJQmT5aL4q8IYZByachUyOlZATUbosRFhX0NxWBciSWBHmccbBWGTywTFsJAj5cSYKVYXZ
 OLQ85z4crnu+wIsNViiZocgP/M/9f5NctRYaR9Oy4RD80B4d6+d34KBvCv3ttQWaP8Bl9YBiq0z
 nHcQuByPOyj4gwHQoQt9QqSPLa6PwlbUx4QDMk6d8bSRSN6QefIh3466xgwJ3w8lji7JTD8iocH
 sMYyLxSl/c7a6RWLEORBOuiUw1EPpn8hvQy5lpAeTcVvf9p+hoWAPZQyrEkjbRwVtSvVZ4ifR2x
 EdtUJnepBEXT9+5zV8JTaKiEzsBZBqj25x810jXiKZ5Me5od1+Pfi3/1rUDTsLIgDWAdyzEImbI
 5zhzlcxj7TTmDU6VxeeubvbHIER5oVq8fl5x201earfoDPuAtVbKs5t5iYPMoDfo6VWSX25HVQ1
 VY10IyAi1i1NQebrkEw==
X-Proofpoint-GUID: qOOc8_RAbsid6Bx1_3Tu1RYBqC118x45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_07,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080218
X-Rspamd-Queue-Id: 042EC232B52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96095-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.76:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
reference devices, which run on IT8987 and Nuvoton MCUs respectively.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../embedded-controller/qcom,hamoa-ec.yaml    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
new file mode 100644
index 000000000000..ea093b71d269
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hamoa Embedded Controller.
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+
+description:
+  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
+  EC running on IT8987 and Nuvoton MCU chips respectively. The EC handles things
+  like fan control, temperature sensors, access to EC internal state changes.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,glymur-nuvoton-ec
+          - qcom,hamoa-it8987-ec
+      - const: qcom,hamoa-ec
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
+            compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
+            reg = <0x76>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...
-- 
2.34.1


