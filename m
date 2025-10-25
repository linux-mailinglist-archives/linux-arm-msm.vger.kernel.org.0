Return-Path: <linux-arm-msm+bounces-78769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E048FC0876D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 02:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1718B3454C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 00:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345FC1F5838;
	Sat, 25 Oct 2025 00:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKp/9JhZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807A21EF39F
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761353280; cv=none; b=cjzpoMkRIuW9krwaKpMCz5tjkdLCnmlRNNIdSMqTCsjNkI90NXBdPvdyV0jPYGIsFXCIcaVtABuC9mdWpsZAL6TF4ADVx2+OIIe8WMhGpahIyoGgI/k0Je5Lvif/mkpHpgzJ+ggnXcwO1HrP+urMkukPN5kZzxlODFYVaUEH+o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761353280; c=relaxed/simple;
	bh=8f3QLSZbdMi9oAnzA0d0BJSP3MSQ5ZUA7CnreHeSgY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRC+n5krungaMv8v44YU1ZpXDqbXceoaVRONhj2LAq0eBJbMVoVwDjF2FLGcAjXvFA11sy6JWjA10rjjgcJFQRjYfBXZBx/ADA2uUseRWdiKuG39J4qXPuWYhmxSLNQXSt50dwA75VzkvaMYJwt/6hHUR6g7ilxR5yoUrWYj8D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKp/9JhZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9HSu023486
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OiyCrMPdV7eNoEt1MqrMVwtFtL3LASmksliQC+JXb54=; b=mKp/9JhZhZZ1TD7W
	PyTs+CK1Oinl6Ufl8v93qCKzz7bu0yEgtKx6LvhltTCQzViqTp2kiK21HYRXrNak
	4QFZOXKdIL3UdQKau7G00TJP1zNk8W3aZvNB8fqaaonXuWx1dtzY+s1WCwln78Zu
	MZZXl3Zf30YXGIA3Ao2Ycy76LZpft5xmPz33aK/rh9wGXggN7ZLPYMGG+argMi7+
	xlWHHMGmpp8hd3EhlJEap7jVsC8pcS0oqUbxpdFCEWt3ELDEnexjkP82da/kOy3X
	Y7a5VCKSLNuyX8GzTEuICmTG+EQV7GmrVzyip1wCnHr5KZ5tYQot72IR8teaRhKe
	8UJCJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8qudm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:47:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-332560b7171so2789729a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 17:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761353276; x=1761958076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiyCrMPdV7eNoEt1MqrMVwtFtL3LASmksliQC+JXb54=;
        b=QOFbjeonCaa64EktzbhSxADtagcSsL4sRE7sb/DdLdI8SsE5s+fk3mHEm6dNsvzIwq
         AwyqB/ftnjOpq3QvutFWvhXmMJ3mlVwKYqRcvyspv1e8PLIECdp9zEQjrPwRX7cXfhMR
         HSQlcqt/6aatwCgJPtye7oZpxpMQPcOQv3StmtXHbhImTQdknjHOkTuyiULRX1OHPS9p
         Elmttb1u2ffU/uXlqd1sjQVSXYJbVH4Nvv3N55+kRbnyh5wXlE7AuTH69CqCERyNY741
         Ut8XlPAgOi5pZORCIGwwA5tFHspRpGPr2ehHBBVNmioUzh4TOGKCeSnOUQYEtwK5cm5B
         wJkg==
X-Gm-Message-State: AOJu0Yzd46QbqfzcF18wna4L7vCkyOkOE/6PiaNCappTrMeZSmYdkJ8T
	VZNj4nPXJF6QRbpf2pnj2CiPKz+WmRtKeYLE+UDEyhS9ROu4UNeZ9/qXHw/7FQq3yQYYJ0y9oU/
	JuPmIFpNhqWDhN7l5EsNx8Tu1jlVFIrrQ3xmJFcah7ljAmC0a3V2SAgNZ2ORVFKTRy/xz
X-Gm-Gg: ASbGncuKF3BBie6Dr5ouFV1sOs+KYuBiIIGODMETJtSPFEGkCQpYmMNPbi1B54vXAIx
	ojlFWwE4poC3I7CjtLZYbif0NpYBvdSpeUj8rrFEe7e4gjxUV2Ub7p1XMEDKAijRqyixbgMjTdc
	pDb9aSOvae6B56yvpQvmJuy64uPM3Ts2gLYeh3KS3cTg5U2o3nmwhNzzUi/xOxr8O7zhegnyash
	XUmdIHpMdFu793WmrY3SJv5iebICiOIJ2E1zyPkoExWjJ/ZfReY0oXZPpxBfSWUX2ASCPnuCOJ2
	NLhmNLbSQMTFppSrJJgHmY573gBdTLxF69TWTD111ffEGz5OTy68gAtbJ4rPUXcMtPzzZyJYhX4
	c4VW8pJ/OVXa5SyZ28ZHQdlFwoWnoFDgSOWqXSYVswWEx02lz5U8=
X-Received: by 2002:a17:90b:3a81:b0:335:2d25:7a7a with SMTP id 98e67ed59e1d1-33fd3d2f95fmr5490257a91.10.1761353276306;
        Fri, 24 Oct 2025 17:47:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMxipVLSbzaSHbq2CMVQ8XouhSVyv3oe+2+wmcnIacWAZFWHjqUBUerrKYH+e1VF1BVwR2NA==
X-Received: by 2002:a17:90b:3a81:b0:335:2d25:7a7a with SMTP id 98e67ed59e1d1-33fd3d2f95fmr5490230a91.10.1761353275807;
        Fri, 24 Oct 2025 17:47:55 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed3eca8dsm167352a91.0.2025.10.24.17.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:47:55 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 17:47:40 -0700
Subject: [PATCH v6 2/8] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI
 PHY compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-glymur_usb-v6-2-471fa39ff857@oss.qualcomm.com>
References: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
In-Reply-To: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: k6WhuhyZf-SU8dgODa72ME01H07V_sXY
X-Proofpoint-GUID: k6WhuhyZf-SU8dgODa72ME01H07V_sXY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX8EtMSKf3fCof
 sf8WmYqV1pRjckIMTdhf2GELziQFnJAaUhx5j0COaQuN45KOqBxXKTJKAO61+nMDM2VxSZCOnw5
 bcYNvpuV9suZ/ZX7U4+fXOZPiWYIqhJEtbj/1iIx1jbpKmddp0njU/hwRxVtnU6WPE9HYHIFISo
 JM/JiDhz4DpCC9Z+1ZoSGSmiHEEml+MSHrcHEchkP9fdoF5NITzohkHtXOEJFzk8fKPHLSx/ZlW
 o2+Gc/rTQr2KcI13uX2my4XMlhyfFp87ea0UEoMPm+Wrxt+XzYX86SZcchGzqj2An6XfHrxHWlL
 pxM0gRhsk0pZKzBhgVXhmGJug3JWtt35CE4cG80w+AqsGJCxWf6jzcEvOPO2jESxKVxFivKYlWA
 8iVzM8aeArYRkatr3jVg4hDiPo0EzQ==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fc1e3d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hwycSGIRGvt53hta3DgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

The Glymur USB subsystem contains a multiport controller, which utilizes
two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC, and
the required clkref clock name.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index a1b55168e050..f277fd547746 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-uni-phy
       - qcom,ipq5424-qmp-usb3-phy
       - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-usb3-phy
@@ -62,6 +63,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 0
 
@@ -114,6 +117,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
@@ -126,6 +130,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 4
         clock-names:
           items:
@@ -157,6 +162,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
               - qcom,sc8180x-qmp-usb3-uni-phy
               - qcom,sc8280xp-qmp-usb3-uni-phy
@@ -165,6 +171,19 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


