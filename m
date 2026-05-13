Return-Path: <linux-arm-msm+bounces-107347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJArAIiXBGpiLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:23:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E789536051
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7CCF32675C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A2D3E5ED8;
	Wed, 13 May 2026 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YW1nN8Jm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdxORHBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB8E41C2F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682211; cv=none; b=ei/WYCOpvazH0CU2sy7rW1Tbclst/Q7KIg2IqVDw9nXHnZjALVTuKlxyIAPVGg9st4698QsHlDv7BGB8Bpkoerf1gN/V23JeimA8FXjV0FziieV0OZ29DYJhCOzrcZdDWh3bBL54RSpOPho+WZIBqU3bpNB2V0Z4BNevcdC160U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682211; c=relaxed/simple;
	bh=YehWLP7vzVkdqKiWVDK5gDg00nTbj62VF3TyWakSVho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckaKSLDAZOL9hBOs/dTkilu90GFGTPwB0geOxSJo+cnDlvolnipUBurrwF5aOv6RCS89M4wNAEvk1zz+R01fLCHNnnwK6XzGRKkw/SdKL5Niv/tumvBzCDKFMe9tt00Qsz2KRw89gN8U7KXIosNR1OCD7KzmqTl9WU7jKCNLzZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YW1nN8Jm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdxORHBy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVquf1393146
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=; b=YW1nN8JmLbhEhtNu
	zw5HDVTkNvyD1k/yriEQgu4yHWefe18S55v1j0hE29Q8fraxlBVgYRYriMiZfwYx
	aOlPEI/ms5aVWueDYxaSLcxIGEwvRnzyShIoHJOat1CwvlNV5tGMvJXg40YpfAE5
	2NoNvOkWObVa5CenPoRQf/RwkDU/WjYdUlRXZghVd98L9e3AIrypNK9WxVo7W/p3
	HXNSvZ6EOCozGlR34ax0qrjKHFnlIUvIibkNz+hW6bZ020BWZ1564aM/2/ONVMeS
	EAD6yYyzp2xSdsZvqUCe2R5TK3Ej1ESVlIDl4/piTxtUT0ehjY1u3CfJNESPfoKt
	f1kxlw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k2622q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a6d84522so128760815ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682209; x=1779287009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=AdxORHBy2b9GtEUUtccOUZSrj7+defgT+IVGgWHxcxnKSt4jcyoHf7QNIu2qm8XKyn
         jqswFVTB4lXeOm5kb7eqSgJyUZmY1AcVbXPrnlNkkTr7FFtQ0oNk9VDyowY9rQpWbkwV
         bSF4Njp9ZSlO7EEzhNzy8x+3KCnn+NKOEvVIYVUkDZBzzF9nw26EDTJ/fQGKDdBjqkia
         MS8fUK2AbuCsvbOs/NQ5QMdyJ1xfe7Arzh7qVLHjHblbd/BWQy1UCVgRBWGtWibui1kF
         P4KUXPOwlU5/2B4qA2er2A2C9F55e8bZeLhTW53FVyXFDNWnJxSXedrac/czXJkK5zvT
         TC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682209; x=1779287009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=HMyJvnVGW7TTCX4rWl2e9wy7B5jV2fzP4CDUa5DGJN5oYcXEB9dVstLBLxoNRi2P5V
         HgJKRrd3YCDOW68VJX4/r1SP0GVT9sEm5YpwjpQ51LwWYB4jQTMgqsI8iiUF8w0h4nrk
         oTYNHAqrVWmM/IxRUpFOK8Hk/qrMATvfmgYva4jl4ay6uJ4UxDeNmnBwLUf3o89YAM/u
         QTsfgJ7426Ol3RDNfNuBHX0t9+I5twAeKXsbpjCAaQaysIcbk5rhnSbrz4Fo2dKto9mQ
         fpRVi1s7d3umLadH7i/AhnsOZ5bjlj0Knn7+W1pbzAB/zWxiMbwgkpkEawefNpPQWe8F
         bq3A==
X-Forwarded-Encrypted: i=1; AFNElJ+bi6lZRjQSopnCKK/0Iri+USm8zcVZqoM6IFqLq3wJS0EHWfBpkwOgkKnS4W4J3WNH6R7N47f6wU9/V58U@vger.kernel.org
X-Gm-Message-State: AOJu0YwtndrA40l+c0jBByh8IU9BsKxxZHdGGxdRvxd4srBo+DjTSHxe
	n+a2r2YI06YTvTPNIoPTTHBb8DFgXVF5smxx/+fiXdznwao59az+ZmeBUAEe76YsNwGMZriSeDQ
	Q5w/YU2deQu/jH7IeyyYAeU3o2l+kt1uucvfSCvKAdUlI7G8BkfUNhdZQ5Fbs3yeMuz1C
X-Gm-Gg: Acq92OF4BMoG2KgmkaxLlUpijieQMBq2lUU9e+hgPPdS7pmz4PxBsWDHzXaEZ9LTA0l
	N5gyl4OvRBk1Nuc/LP3rQJYeJT7dhbea+vs4hzl1zPQ2ZqzG4xC3WPsfBgCLFWelXFMSDi9WQHN
	xCUcTjQH6cSVKHimlckLKc5jOkrS5fUX9+yiHbvxEjEoYhcjysVboHP3POUF50oGwwk2rJoEp2n
	WeO7XuC7mBWEvQpZH4J3E/94+1lUxMuQu6F4gW8EQl6I7k3YYuhsnQQ0ELH9MAdAlVBSDMSjyQU
	2B27GudRVtXxeS5KjgwOl3cki+T/yPTeq7AdPQtEAGoeH+0gXy1bPNqFkNQPeQSH0AL6DLyqmzo
	dHwyiVErjqx0B8KtxeTI531Q/GLRoobshpT+EuYgYx8GNtw==
X-Received: by 2002:a17:903:1a67:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bd27708f97mr39369345ad.28.1778682208432;
        Wed, 13 May 2026 07:23:28 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bd27708f97mr39368705ad.28.1778682207795;
        Wed, 13 May 2026 07:23:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:06 +0530
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-1-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a048961 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=YkJq1ijSw-fIvXJVljYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfXyzy2r5fOQHpp
 wavivQFHtPBlDi/MtGUGRq0Zdxua5QnC5st17HlBo5e2nmydkXZ08YVYAyBTuirJWAs6lcJIPf1
 Xbka1pvQedd3eH4yHBxriIpNHC1Q4aDzTt7qd9KqXYYA92iM5A3p1TjUy0GKYuEWdaPQzwe839c
 NS5Xd78FDBUk/K1e+m9Ql3t05bF99cWzRa8D/QO+ZqCvSP3MX9hxsoRGrbIfJAJ6m8pg5tV8cOA
 UIiaU28To6jo2gvvV18O02fc6AvD/7BScv0u4hvMqBCNV2jNUI+UlXQxcJT7XzPaWNHoQYlZhwr
 nertne4HyYDLVmcOFUF/xnU19RwVZ6VtkoWw4Im/Ph0ri2W6IvifM0XZt7LhurtQTLykQJlF/z1
 fW+6Dg5F2NSi7NIUrFnmVLK45OSk3l/vs5h6Ab1hrIYT1FRRGYB9OM81tsy4wPnquOulRzgoN46
 xUKqMG94qbZa59SMNuQ==
X-Proofpoint-ORIG-GUID: wWya0_5_h4G5_O6qZEeA3KTc3IOaM3hD
X-Proofpoint-GUID: wWya0_5_h4G5_O6qZEeA3KTc3IOaM3hD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147
X-Rspamd-Queue-Id: 6E789536051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107347-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..6e3e4424af78a93f6366378a66f2944a3bfdccee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1


