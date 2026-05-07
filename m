Return-Path: <linux-arm-msm+bounces-106550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHjoFigY/WlLXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:54:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F844EFFAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 902D430A3BB5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 22:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E966D3D7D7A;
	Thu,  7 May 2026 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUBFhLsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O43INbA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A573D75D3
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 22:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194235; cv=none; b=m7StD1GGwGH3G0NV/dFl9H9EnL64W1Seq7QlRKIggEic0GrVULkO+jIjyKCZhv8eQHFdOcC/F+gKo/+ovWtu+JHo8ZPvY/sVzXkSTlAAEaNS3cdEWv1wbBAkjWbI3fJarC4VjTMbST7LnfXSBJnRFVBo8oA6j3SA1HP0k1kW4fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194235; c=relaxed/simple;
	bh=HnARY+NkaPNMNUfBnCSEykpZMQqEGOfF6pr1czcSrpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kC38mX3bCdCagtf+oLqmIgZ9kphhJGmdmZloq/fN9xbknjbRxaNu/fhgBf9n6FqLT+aKDwaG3iDMC3Vt7iutcLhB6zUm6Gl4EVLFnqw5TRvSUUFJoRFBMaDPeChvc5MXStsNZgs7qLEwb1fmIQfLCCgSr7Lg6UITJ3e2aX77wQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUBFhLsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O43INbA3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647HbOiF1971798
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 22:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Q0b5h3vUIlMdYhm0j7sbnZMJtdjyZUlMTDf45sV05Q=; b=bUBFhLskwAmbqqKZ
	WBd9gh4rFtkYZ2PJs7seBp1fnAbqgGZ3o3Z/5MxhhCQnCdKuGtjPg73dozAVMQ6e
	/YS5/KktrLbxVDC8E7om3a/2tTiM2xwU8LayCXkbrE9zXfMGO+rGEHu3dR4LyPbR
	ELXZidV4g7EHfR6x9EsfPnwNjrj/xnI/JmkXe98BdCdlAuzSaHGnlUEKcggQ2AMg
	aUE3mdzVFd/0RMYQ1JoycCPPjia4Rkyqgoqn4o0ZL/NQ3802SiPup1epPj44rKJ4
	uv9L2QcUYOyA/Bc5ThCrc29pycE6TnKlGwiEwuS4dfUq/2MmN8Hx7vT/a2QCJH5z
	VssuKg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tejacfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:50:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-61002acc895so1698588137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194232; x=1778799032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Q0b5h3vUIlMdYhm0j7sbnZMJtdjyZUlMTDf45sV05Q=;
        b=O43INbA31XQNhHM6Yes940vuK3EAa3vrOR9xqVx87BFLjiXxvhAJrI/gGoVluw9wYO
         libeDdrNbKea2z/fEO6cG7tlXmSn/00nky98ZZZP5pgNchOSVRB7pag6RnqY1e2FEJJu
         jnqkVirPOuvdLU5z0LO93yHcLqFOstBe8nXlWX6uZxu/ARm3KE2bi646E4Vuuhljk23F
         2vzlFGFwDNgFzHJGfCX3BEFWzveGMuCJBu0tgItU+/G1AE3I2vrS9JXXpB39XcG/LHEQ
         JhlnPekE4RscmE+CGpfYCPfOx+ao2NudStWbvuCgkVv2VZGvNyX8d3NHqoYB3Cj3GcDX
         3HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194232; x=1778799032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Q0b5h3vUIlMdYhm0j7sbnZMJtdjyZUlMTDf45sV05Q=;
        b=NbZbj9lyNGtgXY1RwJHJGxJkKaAspIWiYwGBSqSWGLExYloK7O0P8gXYvoSYQOjOAb
         CjwFSxzntZWGK8CwOksD+pgt6S7q+/jaCLCPxGo8p44EMpJcqJSPRIM4S1G6UhyGS1kq
         GBYFVd+o0bcmUqCYS3v9qTPeUnhGxFCqnnM+4NPHRUUbgjo/JIp3KougrPcuWGBCD0Qa
         NzFU4k1RtrDeb2Q32Ity/RXxp+ElF1jrSJ9QQvhcfc+B2lCHzItHH446ArxfewEgIBS0
         wyb3vn9K/5rGTUq40viKr2LBXxn7oGmLcPQvswAq3BEB7Y3+xUrP9DMSXI2R73ojRzHm
         yNyA==
X-Forwarded-Encrypted: i=1; AFNElJ9NZwWafQ9RktYs4qcVMhQLe8oLVkOssuUwjP2pxu20w67ND/lptJFGAQE270RA1b97cKvAMQ1nCtsCV/IT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5GjXb0rRJJUj0sxq9YP4aXUfh6ErQsAOkpec5RZ6CBQwWWsqH
	lrBghm/Kn2zuQpsrZgNdTLrYYD9KiWQNhKqCxZATAaSGU+ufploxGtmmUBBxzj/CJvRHz6zAQr/
	vNCElVZTG5MtdHbZRXS96aBvqBAYItrKarXyXPuIhcAzCtHyQubsHvya/gGCiZGYMw07+
X-Gm-Gg: AeBDietSlyqeCjWvIVjYw7Y6vfKsQ01m0JinWXD6JK1buHOHf+IpqNGAnSgFb8vRJNJ
	D2TmJ2d32WxFtejr1gtGOdCdsZTNv6TVC01m7YMXYPezKNITN7o2nxDq+e6DEmU1MzFQ6xDAF62
	IjB5Cw3d5omPGZZZmQuNKJWQ/HPmkBtEW5Ra7/zjogAl7pS5rPHKnwWOmcAj3/1PuKYnvBkt2mF
	jsKlFkJHHSmSJrtHr/jCyH9qsVjMyOM443/X3ayRdS51Fd67yTOOEyCMSejpIGF7tzLAB3OuEzE
	yA6oGrRbj864yZcyvBZOzARqpXcis/iaysXEam1Xyz/uo8ZfXgJQjqqQFgY8soM/4a3n52B9USp
	GQk1pzhbJbgdFCd2YGpNmPmdtOd6qCYeCgW4uOnwl1snJDdBblXp/Fc7EZB90t9vt9xw8LdOKah
	ugI2wSLKGgZtwFlVq9
X-Received: by 2002:a67:e102:0:b0:60f:c9ba:b999 with SMTP id ada2fe7eead31-630f9023892mr5232263137.21.1778194232264;
        Thu, 07 May 2026 15:50:32 -0700 (PDT)
X-Received: by 2002:a67:e102:0:b0:60f:c9ba:b999 with SMTP id ada2fe7eead31-630f9023892mr5232256137.21.1778194231783;
        Thu, 07 May 2026 15:50:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:24 +0200
Subject: [PATCH v3 09/15] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-9-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfXz0o35JjjIT5m
 tP3ZORQ9gQ2C8hCnt0YR3vxo6OX2l0M/8yMeeE2j7IVUmRHOiBB9R5J/1pwaLP2iAq4MVfJa7kp
 iKmiHPa8mBhgzjdF5b9povvzaUzR2172/f7/xV87qnkXokf2MExhmTxGhOEivNXxHSBSNIMpIrs
 5hDQZJQ0fVkRsOsYEBbVNOHj4fAz6gbMZ4t5efWD0d5C7KzrfGg1+x3voULNVtfVUbJDCEKac4c
 0pqva/wbfFZHymqPg1VCHaaenLJ8aR2dDu4nPibMI2H23TqXZRFq48cZKNvxdoTY+fhTvQO0pVV
 tq8sMPUXXvuTVJvEiN1Z1lRF4zJ9g+T/0LUsqIz6M60gJCHbXrf9hxP/vruYABWEBCWhyPjt36j
 RHrhjwAFdJ4C9G1Sub41DS04MROuKX2Gxuncr+C1tojtG0Rv87xq9qz2DhoXPIvWnwJUOr4xp6z
 +i2288uCmXFvgTQrc6A==
X-Proofpoint-GUID: uL5FVSpHgzfIQ849wH_B4q-QrjCNeYve
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fd1739 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: uL5FVSpHgzfIQ849wH_B4q-QrjCNeYve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232
X-Rspamd-Queue-Id: D6F844EFFAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106550-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,5c42400:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c91d73af61f5cbf8384be5ff9b03683de8413542
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: data
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    maxItems: 2
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42400 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
+        clock-names = "core", "iface", "data";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&rpmpd QCM2290_VDDCX>;
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1


