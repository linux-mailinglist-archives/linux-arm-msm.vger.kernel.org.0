Return-Path: <linux-arm-msm+bounces-90616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ59JwX7d2nlmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 00:38:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7BC8E399
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 00:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E622E302C32D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 23:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAEC3101DA;
	Mon, 26 Jan 2026 23:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="au/b/C3o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHct52f8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ECD30FF13
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470717; cv=none; b=aaOdROOgdxIb7EiBAv2vb9F/hi9QaLfm7CKrjzXib3rc9glZnvR0O097u/WJQvfnPm+nxKN81fWQ0QlUo5nOHcELQr3qD7embih6SWC75mkURqs75trExXsQY62eBDhhhihipf4FY10YEBqEroQi8S5qUloUV8c7XQYNYfo+dxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470717; c=relaxed/simple;
	bh=RxzuPbR+inXe642TlbjVXDjG3ZxuxVC253tRN3sts6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRgIm5NRnkzFDY31Um2hS9ShN+HtqJMVeJWnLIR4a8KIhnKEVz5XNOXdZ+miwReYUZ4VJHR9VN28hF09hBP39ybQnS+fFGqj/lNz+Vd6ikXEWt6lqnZ9YGWRt/RG6/L0J1gcGzxxVAyFW8A7lz6tgTV4VnLCCFprDwNOnvXTNhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=au/b/C3o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHct52f8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKh9Gw3385975
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/ezxMfT+J06Hu5lQPZ+gHRpe87XG9lfHgNEoZQTLcQ=; b=au/b/C3o+vc3zMLj
	aFJfzai5gz1UlXm9G4J2vxSI0rzzqLTnI4rp0Yt+GZZNrri6rgSZ5LqttuPVJ4yh
	8Wiu5hBNzdDwD2ot7sPTA/gW9oFOK73tdnqzRIMOZc5l5ZdbkvqX+2qIsewrmGzk
	LtuzvtJZncCD49d6Qv4XSyc/AbAnZEBid5cOhX4MDMKAErm9PSaXN2822QXbQPBt
	g8aruQ4leuxXwpQkgjZYumlgsPQRcFi2JE3j7xPqBCsaX00Ed/gS8JoCwpr9LppD
	P97hLLIaCrdoMrj8uMgmwvoQ22vs4DMpqmqvH8SraFQ+1FG6fduEigzTY//VZwEm
	XwR1rg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a0f1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b71c5826fbso5335310eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769470714; x=1770075514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/ezxMfT+J06Hu5lQPZ+gHRpe87XG9lfHgNEoZQTLcQ=;
        b=OHct52f83dm/Xp8zAoSWIhZJTjXQpfCTpiV4hLZ3CeUyz794H+zqE6sRlXCEmfgWu+
         1T1DVAMp5fZYOADGw7AdhHxIfophiQxY64o5QWPd5saJCovwPmnPgOVzVGxLr64mQCnh
         3Y5XGpC8ZRiEcLJ5Fyn1LFmVnGjsnnkbbrK9Lk0qXhMl9hPucT0u8kWmepWZzElmUMPj
         JWmwUeeTAOqNXMNEr81PGnSx9X1AxmfbU9UPdWLmJMqU95pVY7r75vtGtGvKF03k6NDg
         PuuNtNdues1C3Dy/2WQDbqaVBkHsRqXOb+ifkmbp0TZ9qMLjLaWiDcpCBJ01X6oQed4r
         mnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769470714; x=1770075514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B/ezxMfT+J06Hu5lQPZ+gHRpe87XG9lfHgNEoZQTLcQ=;
        b=Nkym+xHgEdUs76aww/Mcg8nRC7N8COvA+2BPwjfTOtlRjL3FgCRPqAi3jM10diYIF5
         1JuLvvAqChnhiDhyV3+r3XgHC/r8js5CfxtGbdxaFB4Sgywz/MrZZ5h6rIk6jM6c1unG
         D26Jc6ffr5Dd1p5IY3RfewouRdkD4YzGhkajAuGxKnfIm3rWaDRFl4QAkL6LILawj5AW
         EzdFbOav+mmNMLEoSHpnCMq5xSVoKHTVuSvdlOcUAe6JHyMjH9hwLsn7NJv82GXk00tk
         /WS8yLxj9PJXqd9l1lJdxr9DiCkY98HEeaQNiix7Ug+QB40igyIoRGCsRvoGJOD9xkFJ
         TvMw==
X-Gm-Message-State: AOJu0YxZetEb1apyYayRQUIfWt4aHsn2KbI/myZutt531vv23heBQ2me
	zlBX+C4sGpw/baTKoLuK72GIHRVWYYqleepBrqcAutP4mvt0jZJcg/UeANwEvW3kjJSXm/uQ2a7
	7gEWnZKWnAv5q9bhvPk8DpOV6FWBBP7lN2qHOTUWvEsalU9PkUveoDUDlgqsXwE79ctwZ
X-Gm-Gg: AZuq6aJJ9pzA6CNI+5wRm9Ev6Fct7zm++1Ze+AXI012RJT0ob/906alLqo4Cvon0de3
	fOG2DTd4I7mkWLQp3MB8AbF1gbrAXPsJ2UVBPZfMM+wtm3aahGvVFBzjxLe4e8PUhfBPU4FVBuk
	kE60Fx/hNGammi+o2/ceCZjQSPQ1JQ+OvEnS5bd6fzRCQAYweP2fR6D9AymfNBiRWOjRn47hsXs
	ZtxwkArUa9Te9Jh2PXfnI3+87+rkztY2L7U/AjWSTV93sPP0jxQPiVpCnfwOkMzgBve9Ia8HV8e
	gYs7RMCmDTEvhOqnWenRTIQVpJVKEipib8n6lk7NJnRZYoEIXbL3/KF351R/sHA4SHORADMMmTF
	Lc7rcg2xTa3gRknJ8WY4UU1tO8kc3rAp+UcDFF3qKgW0pLHLW2LYMvqHIWOB7adg=
X-Received: by 2002:a05:7022:50f:b0:11f:2c69:31 with SMTP id a92af1059eb24-1248ec87142mr3620035c88.46.1769470713504;
        Mon, 26 Jan 2026 15:38:33 -0800 (PST)
X-Received: by 2002:a05:7022:50f:b0:11f:2c69:31 with SMTP id a92af1059eb24-1248ec87142mr3620010c88.46.1769470712864;
        Mon, 26 Jan 2026 15:38:32 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm19948967c88.4.2026.01.26.15.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 15:38:32 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] dt-bindings: soc: qcom: eud: Restructure to model multi-path hardware
Date: Mon, 26 Jan 2026 15:38:22 -0800
Message-Id: <20260126233830.2193816-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDIwMiBTYWx0ZWRfXwFf98FjpLIk7
 DbA8pbdM5BcR2LTd304snbVosodKIuc2vE5FgXoPT2QshjZ4qxvOSPmgXSbG8qNSXYGNx+VmjcH
 pbYBTdvirNjsfS65dnrY8rSoH9V4ppn67/A2cQIKDucCbjflDFibjex3+h8I3lhoBVfttDcsPlG
 c5iJLHML08VMm4+wh+XWfNToK7xWSKgo/15RHKZVL6LLbIDQrhSL261rgTOpeL4nrdTrIQyxzXX
 r2AZ8Kh0Jgudo++A5NoDKcK36u/ZW40Z5OmwZ+UgV/iOlTaAoy5nSxgvRkoYlYhbxIL60tCw4Zf
 2va5x7WApDEg7CPG7GTaZqhyFFgxUXjpgbjFmdXvySGGPH/2QCBFlJe59wcyEgYV4rZ4xULbHMe
 4qGze1SBm6yvtZRcFssXg8tsS72q/EZlEbj3MIu3TVy8QsXpddmtldiRvTAnCUWESzRFa5O6iEh
 kJg/k4a0wm/jmgAqtVA==
X-Proofpoint-ORIG-GUID: F5Z3DUile4ULvk_H-EMmAOzR9NWVVDyC
X-Proofpoint-GUID: F5Z3DUile4ULvk_H-EMmAOzR9NWVVDyC
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6977fafa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=ZoGLzPNB8GXcnAfKQAAA:9 a=hr3zit-iljVEbsnA:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90616-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D7BC8E399
X-Rspamd-Action: no action

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
independent High-Speed UTMI paths, depending on the SoC. Each path is
distinct with its own HS-PHY interface, connector/controller wiring, and
UTMI routing behavior. The EUD hardware sits between the USB2 PHY and
the USB controller on each path.

The existing binding models only a single UTMI path and does not provide
a way to associate the required High-Speed USB PHY. EUD relies on the
HS-PHY on the selected UTMI path for link signalling and correct operation
of the hardware.

Historically, EUD has worked on platforms that use a single UTMI path
because the USB controller maintains ownership of the PHY during
enumeration and normal operation. This implicit relationship allowed
EUD to function even though the dependency on the PHY was not described
in the binding. However, this behavior is not guaranteed by hardware.
The current binding description is not sufficient for SoCs that expose
two independent UTMI paths, where the PHY association and port wiring
must be explicitly described.

Introduce per-path eud-path child nodes so each UTMI path can describe
its HS-PHY, port connections, and the role‑switching capability of its
associated USB port.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 100 +++++++++++++-----
 1 file changed, 74 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..0507252dbf27 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -10,8 +10,11 @@ maintainers:
   - Souradeep Chowdhury <quic_schowdhu@quicinc.com>
 
 description:
-  This binding is used to describe the Qualcomm Embedded USB Debugger, which is
-  mini USB-hub implemented on chip to support USB-based debug capabilities.
+  This binding describes the Qualcomm Embedded USB Debugger (EUD), an on-chip
+  mini USB hub that enables USB-based debug capabilities. The EUD block is
+  positioned between the High-Speed USB PHY and the USB controller, where it
+  intercepts the UTMI interface to support debug and bypass modes. EUD can be
+  supported on up to two High-Speed USB ports.
 
 properties:
   compatible:
@@ -29,26 +32,62 @@ properties:
     description: EUD interrupt
     maxItems: 1
 
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^eud-path@[0-1]$":
+    type: object
     description:
-      These ports is to be attached to the endpoint of the DWC3 controller node
-      and type C connector node. The controller has the "usb-role-switch"
-      property.
+      Represents one High-Speed UTMI path that EUD intercepts. This node models
+      the physical data path intercepted by EUD and provides graph endpoints to
+      link the USB controller and the external connector associated with this path.
 
     properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: This port is to be attached to the DWC3 controller.
+      reg:
+        maxItems: 1
+        description: Path number
+
+      phys:
+        maxItems: 1
+        description: High-Speed USB PHY associated with this data path.
+
+      usb-role-switch:
+        type: boolean
+        description:
+          Set this property if the USB port on this path is role switch capable.
+          In device role, debug mode inserts the EUD hub into the UTMI path. In
+          host role, the EUD hub is bypassed and UTMI traffic flows directly
+          between the PHY and the USB controller.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description:
+          These ports are to be attached to the endpoint of the USB controller node
+          and USB connector node.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB controller.
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: This port is to be attached to the type C connector.
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB connector.
+
+    required:
+      - reg
+      - phys
+      - ports
+
+    additionalProperties: false
 
 required:
   - compatible
   - reg
-  - ports
 
 additionalProperties: false
 
@@ -58,21 +97,30 @@ examples:
         compatible = "qcom,sc7280-eud", "qcom,eud";
         reg = <0x88e0000 0x2000>,
               <0x88e2000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eud-path@0 {
+            reg = <0>;
+            phys = <&usb_1_hsphy>;
+            usb-role-switch;
 
-        ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            port@0 {
-                reg = <0>;
-                eud_ep: endpoint {
-                    remote-endpoint = <&usb2_role_switch>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    eud_ep: endpoint {
+                        remote-endpoint = <&usb2_role_switch>;
+                    };
                 };
-            };
 
-            port@1 {
-                reg = <1>;
-                eud_con: endpoint {
-                    remote-endpoint = <&con_eud>;
+                port@1 {
+                    reg = <1>;
+                    eud_con: endpoint {
+                        remote-endpoint = <&con_eud>;
+                    };
                 };
             };
         };
-- 
2.34.1


