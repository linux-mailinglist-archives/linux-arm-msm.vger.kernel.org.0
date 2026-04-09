Return-Path: <linux-arm-msm+bounces-102551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDVeCXUR2GldXAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:52:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ECA3CF9DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A7F030131F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68AD345CCE;
	Thu,  9 Apr 2026 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHgTS+1u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLo96KPR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E71341ADF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767906; cv=none; b=Nys72/6FyTZ6s2Z3p2hsrQsr6y96gafD2Yubfvag8tOgUrdOFfFibRni+BSX73r66cyDw5W34SCrz5m833cR/ruVKp9DeWsnvf2KOVqXRjJs8k/7DTSP+t8hacHbAx7HxU8IDPjXZziU3zJGk3tls1t7aqld4oF/9XOX6VYeNeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767906; c=relaxed/simple;
	bh=DbxTHWyL45ppZZhZJyucCVaCQh/9qUzqYo+NMgEKj1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1Vebyav//pUMzFbWn6p3rOfg5jb9aqPQQIXglzWOZupkKFoGfyg9gKw9umTSOGkmrIXAuj507K1sCKjh0sa/m2Y9eB9u1cwdmo8NoneqL8N/USlhh1qYOxwWLkU/R/FFO2mW747RsXEmIPHyXOjxZ5QUbw0aDA/rMZclA/lzBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHgTS+1u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLo96KPR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdRsb2812184
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 20:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhHEKi8k65BZs3kIKnHRSV/bv8gBAf74sMurR+R+HyA=; b=XHgTS+1u1e6ah034
	F8BAzviKmNoqhM0fqfJnqOrpyc1vlDs+RjQDIXa1D0K/CdfG5XijwhTW9tyVSzez
	UTQfzx1R8UpV/9eM1Lx0zzTAx4SWXQKHU5NOO1mTAsnnPgVLsTfj08UcIqebg/JR
	H4GcOohbLcKHY/c9NtpHUQ/RFwcQBLpNImcoL1NJK8gSh/Gi+tzxq4Asgb18kMFS
	EqeDEPYc5roza0KTzHSywYegHCubWc+pSEtLEMez0jM0H3sUqT3pWp4tbULncSpj
	i4Hdyu7fBV7pXsacNHYxtbz7fxbRFU6SfuCq0bVPzn4A0eL4ZrVvhRjVZ7UpTbsX
	SVQz6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h9few-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:51:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so5430019eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767902; x=1776372702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhHEKi8k65BZs3kIKnHRSV/bv8gBAf74sMurR+R+HyA=;
        b=jLo96KPRc0jpi/ylvx6dcexG6AK83mmVYmxf1xdDQH3UC7dyteh4yS1UW9nkxgMx6f
         81TkUTwRybAoQ8Qz61pGmUp8smd2c6AQ6lW4z+XJufmw2d/dyDesArEFEksSiWUNGJAS
         Uz+HyJCp3y+5pbl4l3gtuAV1pJEMj/DiJ9FpO4O1Xn29jUKPRo85zLSVufe1qLX07k9C
         64tFviNY4rrCm4FqAvW8qJ8b6hMhLxB2yJFyHe/eY08NR2zWmWoitYHhTBaIep3V3vqW
         x0a6e5Gq8lXMbFDxeBV4ZP4jRDS+0J47PM5NwovWcGkj5dYmcxQu5IPd1LH9+lEmy68p
         HF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767902; x=1776372702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mhHEKi8k65BZs3kIKnHRSV/bv8gBAf74sMurR+R+HyA=;
        b=m+fdhehCtvEdwv/WyRxDx2+yUDWfj9bpZeiJM4+aylYyaCJKDsI5oHB627j/LwNctp
         IJed0TjxYdIfHqNaBbqlDd1kvP1oC6ygzFkTIDlSRDL4bcpujn+6qgfumn9cVeMs9Twy
         UMkGgSBXM0c/mewOA4dcgtLTJtkGl1MoKXAafnVsb2aq78gjAaS2/ZKC0xitTd7wIMls
         0EkxvSasEAjeReelh4B5xxxYoEP/367RStWMyLwuTqzc8w18Ye+tHYFQiVr4SUi3tqO4
         MVkAlhkGrXPJ+Jn6kbVdsBzSHieI+p/bM91THlBsu2UJVwULuzpC9p/e6GUvSz+FZaYc
         nZ5g==
X-Gm-Message-State: AOJu0YxO/3FxxcE8qlbeH0i2tHefw2WyJjINzZ3XnYohQG9cssrd7GmZ
	0ASx/rBHv0rUswdbAbjozJRvK6pAWQMAQzQ1BCg35K1hJqep5mP3p+ugWyOjfBxhxOZN9og9h/L
	wmVeSarn8fyNAaPTfzDBCKXjS9pXZAXmrjg0qQofV8qepQOhS0Ua0I11UAFCRyd4dNF/4
X-Gm-Gg: AeBDiesZJXqRPgQUVC8zuri2Kmk1P7mSLGqPN3WcwJzuMnDYXZFWgPCaSZePz/73kqS
	9K6HivLQIHDWTvMMBZel5XJ5OYpts27+XxlP7nM2cI1FZ/4zgqKqRSMkultFwoanbxK+H51ltk7
	c7zinxsluRUg9wB1jAcf8kk18U14byikou7/wKNqyyW+IylKerhi6aSAB7rR13O5anUc/OrZeGx
	UnsmUdItQ4O4LutfO0Duw9M9s4bDv1LASozBT3ymqwFfz+xBbz1KWyleuKnWb871Fcm/WN7NgyK
	nUA+IFxJoml7GySQlbNaLmgPYz/Kv5uK+D94XEJ4WnhxRziKeiRlR3ryom96k0OidHISMQvB43R
	GXEpra5nuuDoUKldg+0+jfRz2ZYs86y4xdVp7IMggTOWjTEBoSiJcKkVI7cgYqK4KTQjVksL9KB
	Qa
X-Received: by 2002:a05:7300:8628:b0:2cf:c1e7:521 with SMTP id 5a478bee46e88-2d58965f54amr362452eec.17.1775767901770;
        Thu, 09 Apr 2026 13:51:41 -0700 (PDT)
X-Received: by 2002:a05:7300:8628:b0:2cf:c1e7:521 with SMTP id 5a478bee46e88-2d58965f54amr362429eec.17.1775767901049;
        Thu, 09 Apr 2026 13:51:41 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:37 -0700
Subject: [PATCH v2 3/7] dt-bindings: clock: qcom: Add Hawi global clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-3-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=12586;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=DbxTHWyL45ppZZhZJyucCVaCQh/9qUzqYo+NMgEKj1A=;
 b=spAT1/zqspdPz5/xrzWR6Aiwhqf4Bkyn8sazzD7fwMFks6ytexkE/7B6ddnMraJp70dP7ka1W
 Qw4hV63PsjACnVfzBbwN7qE4m4Xzmquf/UZ60dy8OIARlogNK9ariYY
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d8115e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z2lVzDD_EwnTmjuFXOsA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: X89JZNvWXC6c2POvYY3GHkW9XDD5AwKn
X-Proofpoint-ORIG-GUID: X89JZNvWXC6c2POvYY3GHkW9XDD5AwKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfXwVZy9w96KFoJ
 cUGLOHDGDWowQVPgfFjchQEmUX63jJV1bTd4V83CLSt1LWt4y1OHSlzwmLcopvrZOowTNHTvgFa
 fNrISTdxmTC39sSRO8+HEIYd3CcDBZpfe4qcQ54a+Lc/eMC8GXpICeP2fqYBLk7FVamxDz6Zgcy
 a4v/XNsSKjPUjimUI86VdWiz/TmYyvWtJralOnsm/uucGC82zIZ/a4JVg+rCNFRaMIXr/fTVHhG
 4hv640iqZ0d5MC8eRcMgHAePwXk7p39HRXVCB9Q0DFzPDRaL/tkL+BINnwtMl49JVRuxfiKRAtO
 d8ByP6snjDyKUON1UexyjLxGSZpF1wD2xd/L1hRp3V+aWFAtVCKy0b8DI7bthDdgC5YDsUHaJ9w
 MfWLQlMBaCtUwVsDJGxmdU/sHPu7A2X/bBQoqOym4Kdn8NLOu3SpYL7894CiaksEPk1BIZ1HRSZ
 D5P4exwIDbJPB8AFlqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090192
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102551-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28ECA3CF9DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for the global clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  63 +++++
 include/dt-bindings/clock/qcom,hawi-gcc.h          | 253 +++++++++++++++++++++
 2 files changed, 316 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
new file mode 100644
index 000000000000..4f428c0f7286
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,hawi-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Hawi
+
+maintainers:
+  - Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on Hawi.
+
+  See also: include/dt-bindings/clock/qcom,hawi-gcc.h
+
+properties:
+  compatible:
+    const: qcom,hawi-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
+      - description: Sleep clock source
+      - description: PCIE 0 Pipe clock source
+      - description: PCIE 1 Pipe clock source
+      - description: UFS PHY RX symbol 0 clock
+      - description: UFS PHY RX symbol 1 clock
+      - description: UFS PHY TX symbol 0 clock
+      - description: USB3 PHY wrapper pipe clock
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,hawi-gcc";
+      reg = <0x00100000 0x1f4200>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>,
+               <&pcie0_phy>,
+               <&pcie1_phy>,
+               <&ufs_mem_phy 0>,
+               <&ufs_mem_phy 1>,
+               <&ufs_mem_phy 2>,
+               <&usb_1_qmpphy>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,hawi-gcc.h b/include/dt-bindings/clock/qcom,hawi-gcc.h
new file mode 100644
index 000000000000..6cd7fa0884f5
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-gcc.h
@@ -0,0 +1,253 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_HAWI_H
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK				0
+#define GCC_AGGRE_STARDUSTNOC_USB3_PRIM_AXI_CLK			1
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				2
+#define GCC_BOOT_ROM_AHB_CLK					3
+#define GCC_CAM_BIST_MCLK_AHB_CLK				4
+#define GCC_CAMERA_AHB_CLK					5
+#define GCC_CAMERA_HF_AXI_CLK					6
+#define GCC_CAMERA_RSC_CORE_CLK					7
+#define GCC_CAMERA_SF_AXI_CLK					8
+#define GCC_CAMERA_XO_CLK					9
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				10
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				11
+#define GCC_CNOC_PCIE_SF_AXI_CLK				12
+#define GCC_EVA_AHB_CLK						13
+#define GCC_EVA_AXI0_CLK					14
+#define GCC_EVA_AXI0C_CLK					15
+#define GCC_EVA_XO_CLK						16
+#define GCC_GP1_CLK						17
+#define GCC_GP1_CLK_SRC						18
+#define GCC_GP2_CLK						19
+#define GCC_GP2_CLK_SRC						20
+#define GCC_GP3_CLK						21
+#define GCC_GP3_CLK_SRC						22
+#define GCC_GPLL0						23
+#define GCC_GPLL0_OUT_EVEN					24
+#define GCC_GPLL4						25
+#define GCC_GPLL5						26
+#define GCC_GPLL7						27
+#define GCC_GPLL9						28
+#define GCC_GPU_CFG_AHB_CLK					29
+#define GCC_GPU_GEMNOC_GFX_CLK					30
+#define GCC_GPU_GPLL0_CLK_SRC					31
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				32
+#define GCC_GPU_RSC_CORE_CLK					33
+#define GCC_GPU_SMMU_VOTE_CLK					34
+#define GCC_MMU_TCU_VOTE_CLK					35
+#define GCC_PCIE_0_AUX_CLK					36
+#define GCC_PCIE_0_AUX_CLK_SRC					37
+#define GCC_PCIE_0_CFG_AHB_CLK					38
+#define GCC_PCIE_0_MSTR_AXI_CLK					39
+#define GCC_PCIE_0_PHY_AUX_CLK					40
+#define GCC_PCIE_0_PHY_AUX_CLK_SRC				41
+#define GCC_PCIE_0_PHY_RCHNG_CLK				42
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				43
+#define GCC_PCIE_0_PIPE_CLK					44
+#define GCC_PCIE_0_PIPE_CLK_SRC					45
+#define GCC_PCIE_0_PIPE_DIV2_CLK				46
+#define GCC_PCIE_0_PIPE_DIV_CLK_SRC				47
+#define GCC_PCIE_0_SLV_AXI_CLK					48
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				49
+#define GCC_PCIE_1_AUX_CLK					50
+#define GCC_PCIE_1_AUX_CLK_SRC					51
+#define GCC_PCIE_1_CFG_AHB_CLK					52
+#define GCC_PCIE_1_MSTR_AXI_CLK					53
+#define GCC_PCIE_1_PHY_AUX_CLK					54
+#define GCC_PCIE_1_PHY_AUX_CLK_SRC				55
+#define GCC_PCIE_1_PHY_RCHNG_CLK				56
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				57
+#define GCC_PCIE_1_PIPE_CLK					58
+#define GCC_PCIE_1_PIPE_CLK_SRC					59
+#define GCC_PCIE_1_PIPE_DIV2_CLK				60
+#define GCC_PCIE_1_PIPE_DIV_CLK_SRC				61
+#define GCC_PCIE_1_RSC_CORE_CLK					62
+#define GCC_PCIE_1_SLV_AXI_CLK					63
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				64
+#define GCC_PCIE_RSC_CORE_CLK					65
+#define GCC_PCIE_RSCC_CFG_AHB_CLK				66
+#define GCC_PCIE_RSCC_XO_CLK					67
+#define GCC_PDM2_CLK						68
+#define GCC_PDM2_CLK_SRC					69
+#define GCC_PDM_AHB_CLK						70
+#define GCC_PDM_XO4_CLK						71
+#define GCC_QUPV3_I2C_CORE_CLK					72
+#define GCC_QUPV3_I2C_S0_CLK					73
+#define GCC_QUPV3_I2C_S0_CLK_SRC				74
+#define GCC_QUPV3_I2C_S1_CLK					75
+#define GCC_QUPV3_I2C_S1_CLK_SRC				76
+#define GCC_QUPV3_I2C_S2_CLK					77
+#define GCC_QUPV3_I2C_S2_CLK_SRC				78
+#define GCC_QUPV3_I2C_S3_CLK					79
+#define GCC_QUPV3_I2C_S3_CLK_SRC				80
+#define GCC_QUPV3_I2C_S4_CLK					81
+#define GCC_QUPV3_I2C_S4_CLK_SRC				82
+#define GCC_QUPV3_I2C_S_AHB_CLK					83
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				84
+#define GCC_QUPV3_WRAP1_CORE_CLK				85
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK				86
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK_SRC			87
+#define GCC_QUPV3_WRAP1_S0_CLK					88
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				89
+#define GCC_QUPV3_WRAP1_S1_CLK					90
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				91
+#define GCC_QUPV3_WRAP1_S2_CLK					92
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				93
+#define GCC_QUPV3_WRAP1_S3_CLK					94
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				95
+#define GCC_QUPV3_WRAP1_S4_CLK					96
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				97
+#define GCC_QUPV3_WRAP1_S5_CLK					98
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				99
+#define GCC_QUPV3_WRAP1_S6_CLK					100
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				101
+#define GCC_QUPV3_WRAP1_S7_CLK					102
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				103
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				104
+#define GCC_QUPV3_WRAP2_CORE_CLK				105
+#define GCC_QUPV3_WRAP2_S0_CLK					106
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				107
+#define GCC_QUPV3_WRAP2_S1_CLK					108
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				109
+#define GCC_QUPV3_WRAP2_S2_CLK					110
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				111
+#define GCC_QUPV3_WRAP2_S3_CLK					112
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				113
+#define GCC_QUPV3_WRAP2_S4_CLK					114
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				115
+#define GCC_QUPV3_WRAP3_CORE_2X_CLK				116
+#define GCC_QUPV3_WRAP3_CORE_CLK				117
+#define GCC_QUPV3_WRAP3_QSPI_REF_CLK				118
+#define GCC_QUPV3_WRAP3_QSPI_REF_CLK_SRC			119
+#define GCC_QUPV3_WRAP3_S0_CLK					120
+#define GCC_QUPV3_WRAP3_S0_CLK_SRC				121
+#define GCC_QUPV3_WRAP3_S1_CLK					122
+#define GCC_QUPV3_WRAP3_S1_CLK_SRC				123
+#define GCC_QUPV3_WRAP3_S2_CLK					124
+#define GCC_QUPV3_WRAP3_S2_CLK_SRC				125
+#define GCC_QUPV3_WRAP3_S3_CLK					126
+#define GCC_QUPV3_WRAP3_S3_CLK_SRC				127
+#define GCC_QUPV3_WRAP3_S4_CLK					128
+#define GCC_QUPV3_WRAP3_S4_CLK_SRC				129
+#define GCC_QUPV3_WRAP3_S5_CLK					130
+#define GCC_QUPV3_WRAP3_S5_CLK_SRC				131
+#define GCC_QUPV3_WRAP4_CORE_2X_CLK				132
+#define GCC_QUPV3_WRAP4_CORE_CLK				133
+#define GCC_QUPV3_WRAP4_S0_CLK					134
+#define GCC_QUPV3_WRAP4_S0_CLK_SRC				135
+#define GCC_QUPV3_WRAP4_S1_CLK					136
+#define GCC_QUPV3_WRAP4_S1_CLK_SRC				137
+#define GCC_QUPV3_WRAP4_S2_CLK					138
+#define GCC_QUPV3_WRAP4_S2_CLK_SRC				139
+#define GCC_QUPV3_WRAP4_S3_CLK					140
+#define GCC_QUPV3_WRAP4_S3_CLK_SRC				141
+#define GCC_QUPV3_WRAP4_S4_CLK					142
+#define GCC_QUPV3_WRAP4_S4_CLK_SRC				143
+#define GCC_QUPV3_WRAP_1_M_AXI_CLK				144
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				145
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				146
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				147
+#define GCC_QUPV3_WRAP_3_M_AHB_CLK				148
+#define GCC_QUPV3_WRAP_3_S_AHB_CLK				149
+#define GCC_QUPV3_WRAP_4_M_AHB_CLK				150
+#define GCC_QUPV3_WRAP_4_S_AHB_CLK				151
+#define GCC_SDCC2_AHB_CLK					152
+#define GCC_SDCC2_APPS_CLK					153
+#define GCC_SDCC2_APPS_CLK_SRC					154
+#define GCC_SDCC4_AHB_CLK					155
+#define GCC_SDCC4_APPS_CLK					156
+#define GCC_SDCC4_APPS_CLK_SRC					157
+#define GCC_UFS_PHY_AHB_CLK					158
+#define GCC_UFS_PHY_AXI_CLK					159
+#define GCC_UFS_PHY_AXI_CLK_SRC					160
+#define GCC_UFS_PHY_ICE_CORE_CLK				161
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				162
+#define GCC_UFS_PHY_PHY_AUX_CLK					163
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				164
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				165
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				166
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				167
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				168
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				169
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				170
+#define GCC_UFS_PHY_UNIPRO_5_CORE_CLK				171
+#define GCC_UFS_PHY_UNIPRO_5_CORE_CLK_SRC			172
+#define GCC_USB30_PRIM_MASTER_CLK				173
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				174
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				175
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			176
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		177
+#define GCC_USB30_PRIM_SLEEP_CLK				178
+#define GCC_USB3_PRIM_PHY_AUX_CLK				179
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				180
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				181
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				182
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				183
+#define GCC_VIDEO_AHB_CLK					184
+#define GCC_VIDEO_AXI0_CLK					185
+#define GCC_VIDEO_AXI0C_CLK					186
+#define GCC_VIDEO_XO_CLK					187
+
+/* GCC power domains */
+#define GCC_PCIE_0_GDSC						0
+#define GCC_PCIE_0_PHY_GDSC					1
+#define GCC_PCIE_1_GDSC						2
+#define GCC_PCIE_1_PHY_GDSC					3
+#define GCC_UFS_MEM_PHY_GDSC					4
+#define GCC_UFS_PHY_GDSC					5
+#define GCC_USB30_PRIM_GDSC					6
+#define GCC_USB3_PHY_GDSC					7
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_EVA_AXI0_CLK_ARES					1
+#define GCC_EVA_AXI0C_CLK_ARES					2
+#define GCC_EVA_BCR						3
+#define GCC_GPU_BCR						4
+#define GCC_PCIE_0_BCR						5
+#define GCC_PCIE_0_LINK_DOWN_BCR				6
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				7
+#define GCC_PCIE_0_PHY_BCR					8
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			9
+#define GCC_PCIE_1_BCR						10
+#define GCC_PCIE_1_LINK_DOWN_BCR				11
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				12
+#define GCC_PCIE_1_PHY_BCR					13
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			14
+#define GCC_PCIE_PHY_BCR					15
+#define GCC_PCIE_PHY_CFG_AHB_BCR				16
+#define GCC_PCIE_PHY_COM_BCR					17
+#define GCC_PCIE_RSCC_BCR					18
+#define GCC_PDM_BCR						19
+#define GCC_QUPV3_WRAPPER_1_BCR					20
+#define GCC_QUPV3_WRAPPER_2_BCR					21
+#define GCC_QUPV3_WRAPPER_3_BCR					22
+#define GCC_QUPV3_WRAPPER_4_BCR					23
+#define GCC_QUPV3_WRAPPER_I2C_BCR				24
+#define GCC_QUSB2PHY_PRIM_BCR					25
+#define GCC_QUSB2PHY_SEC_BCR					26
+#define GCC_SDCC2_BCR						27
+#define GCC_SDCC4_BCR						28
+#define GCC_TCSR_PCIE_BCR					29
+#define GCC_UFS_PHY_BCR						30
+#define GCC_USB30_PRIM_BCR					31
+#define GCC_USB3_DP_PHY_PRIM_BCR				32
+#define GCC_USB3_DP_PHY_SEC_BCR					33
+#define GCC_USB3_PHY_PRIM_BCR					34
+#define GCC_USB3_PHY_SEC_BCR					35
+#define GCC_USB3PHY_PHY_PRIM_BCR				36
+#define GCC_USB3PHY_PHY_SEC_BCR					37
+#define GCC_VIDEO_AXI0_CLK_ARES					38
+#define GCC_VIDEO_AXI0C_CLK_ARES				39
+#define GCC_VIDEO_BCR						40
+#define GCC_VIDEO_XO_CLK_ARES					41
+
+#endif

-- 
2.34.1


