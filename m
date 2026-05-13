Return-Path: <linux-arm-msm+bounces-107321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFX0C/KEBGrVKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:04:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C67534A5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9272F32925B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C998310645;
	Wed, 13 May 2026 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJfI6FBb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEwnQzaY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5885F285058
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679660; cv=none; b=PsAB+p+FhBLdaZrGxYBJ//FiJXOBQBGMQ9FCM0K7O7VmjBlpHGQQFIilFfhDHbG234dgGFnBt9Hps31G8aB+aItLBx3Y1fKGstH8BUOkYPJ5Qg6J+1cdIo7BwEchS90dzKooWsjoNdTn+jbSwh8TQOLVAsH7Ii0ubHw9NhzX8wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679660; c=relaxed/simple;
	bh=zjHZlUWyJcyXeRZYOGVOkl/BkM9iscfpl/MqwmfdlXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKYIy4pqUaSs8z8+LRUxbezBAAd7IA+ls+g/n6l4RdzzXgXM9jCR3vj2o5Rln3p0WCiuLtfMLbO8Y9zprvAo5mfnVWu/MPoXNUqII01n3oVCZkvSJj97hgbIekBpJnHw7U8AUPLW44aF6y0MDmbizpIgojZTips162h4wZCjRAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJfI6FBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEwnQzaY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DATsof2321368
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Og7zLYM2ewiyQqmgb9e8qK+45a/W/Fnm/o3b+5Pe1g=; b=BJfI6FBbIvzQgrQv
	gFGgYKG6uAnzo3GulN5rYMiga5c3sPlFyKu0wXo/CAopzFzlCR5B1GxsQwi5uonB
	gI+uaRar27jtLRi5WYln6+8eP83yYiZ/24Iv59Nj240yqx5Oh3WYV/Ue89BZFv4X
	PKQFJSgFm+Qg52IYd2xi/wVKFhkaxnrxaAMkDGFrvmS72xDaW7uC8dAGKZWzTAWU
	rbQP8s/jUv/iVRcIfSIN+WtjN6WQnugudlMvf6CP8PwH6gDDRsWWNUz7EdJ1ssgh
	zKYVqk28rqQUm7bRFMwGRY80LPkDUK7GXUd2GTXrsfpYPHtohHJWy7KVqs/XOz+Q
	PuyQxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgua631-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:40:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36603ad6709so7187016a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679657; x=1779284457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Og7zLYM2ewiyQqmgb9e8qK+45a/W/Fnm/o3b+5Pe1g=;
        b=hEwnQzaY5b8iL38QAZPsim/YMz1/tgflZ1/cgX+ZSbciv3B8TSJRgp/9oKwdFvLPsc
         enIsgQBt3qG0hWsIfXhVf2FnOsEy50m8aHJzPyg5yK1Zsx+Gu2BTDcdHZORMAu8L8sRJ
         a3l2NmbE+rKjBiAaoa16dhBVT1jCG1oi3WR3R3RlJYxN+hQVuYNWAnq0NxuG6t1cleXb
         AUoTc33OvEdrE5qy/uEYUuiMEweveMc2aKWuwJPfVfTuYU6oyrPgTkl5o90Hekq/JtvA
         fSaw7X9AxA5aZ3g8XJlVwnrguGfJz3pdbBn+YBo6OLQr/07I0gFNi7Lx+MvUJZelyAWH
         r6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679657; x=1779284457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Og7zLYM2ewiyQqmgb9e8qK+45a/W/Fnm/o3b+5Pe1g=;
        b=SO7h46AkcUu8uu1E0E23lhTlPQH63zEZIA2JkRjWkthWwYiosSzYI1fqhPgO3e6c7M
         AAx4JLwr+N/Rb5ezAI9Jvz8DTP9S/MIkBHBTvWo0OvyRWl6bNOwbZbtI4CAw1f+tYa/i
         anotJulS8CpZZhkjDWQMGyMWHKRem46VUaf1rWN20eMIM1YQmsSHbAveST90WUYmxsbp
         wZut+SWgYi473fLOR+GgKuD2KGTCbMsGbLbAAg9PWopfghmCgWVCnHG1cu9A+mrXCIPP
         02fTKrVeFan8eVJROBF3crlWHpAnnnO+ZpigpGQsszRedHxvUDQ84dP/HAPXAnVz1hL7
         Nl1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/z9ex58rON6zFrIFBe9zI6QhuR1PJw7I8zKyrQWXQVQR9WgAdlt885mSzyHPF6COCO8wHI84fqOzPlveSg@vger.kernel.org
X-Gm-Message-State: AOJu0YxZKf5ecxFQCazidHQv461biaDLu/6tBHq2yRVHx6Rdq1tgb0VV
	AKZUWDRdhGEfH/wwl3r4pMtlIqSsgHQUrJJcEHAuun9CLgQuMAv32e/fXUX6XbEZAp6Hc6VkZRj
	D5Vqpq+pL15hqFstfsP7096KIPi/3MdjL1WwbgZ/TGV60C/n4lNgm6E3e8sc9gpcVEcXb
X-Gm-Gg: Acq92OHpY2Mf8jiXq2LvMsCAUP8UI++JI84KiQiKhqK4X6jRQuC2MjkdmF1y5v6Gsj9
	ujhbVFX2js2UAzeBm7RE+2maMWFmU4mYySGnPj9SvLrbWUj+MwyVXN099XkpTPIz9Zi9GkryO71
	Az1qtpVFDxAnt6F9Wx33a47weIYqBoUCme7SnahjLTTWBsVRuOOsGtNYlSG75p5M01tsJ1Futj5
	v1pj6s0/3/VyVf3608/2S82RFHH7XLkIA34vChKn+CwhwXhtLPZqRmI8RQwe9t/naksb6G2/krZ
	nPknPvm3o/Pfl1Sjc2zdA97/R8WxQIjQk6wQTtIPMBI3YI/+rWd9InPdm+7BxrNbFqdlVDJvWa1
	ziOcKuYU6shFu2UmO3gF3DgSf6tZ3sXCPCMVM3tyjNQ5vlt58x+Nh
X-Received: by 2002:a17:90a:617:b0:368:f7a7:daee with SMTP id 98e67ed59e1d1-368f7a7df06mr1778014a91.8.1778679656850;
        Wed, 13 May 2026 06:40:56 -0700 (PDT)
X-Received: by 2002:a17:90a:617:b0:368:f7a7:daee with SMTP id 98e67ed59e1d1-368f7a7df06mr1777979a91.8.1778679656235;
        Wed, 13 May 2026 06:40:56 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm4317403a91.1.2026.05.13.06.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:40:55 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:10:36 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add Shikra Display clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-shikra-dispcc-gpucc-v1-1-5fd673146ab2@oss.qualcomm.com>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a047f69 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MM9pdrEQ6VUtxjYSux8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: jk9MpBnVOeO-Rtg0CUl42KI7-dTuBybs
X-Proofpoint-ORIG-GUID: jk9MpBnVOeO-Rtg0CUl42KI7-dTuBybs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfX4Uv1sZTtuKdX
 +PWsPWuZ4MYr755nswz7Ua8AQUG/PnbW0yilgs1gIat0czIjfR8JH6u2rjRV6UMMWBAMxdEKmC8
 yOklbuP2/hhkbVcN87lPV3NRPZMkQYGV6noD6RDsqbrW7tw5CUUx8PBjbetejsk79OGcS5Kdk5u
 710ca8m2v5n6uls3xEFpNtA7OyEiTyOFJJe/yT0Wk3o3u9yQYkcYfUsQmP3vVlMqIyjzZuP2oEe
 O/g/pgNN2ynQOG4w3VNDJnpgMT6hHUnVVlWr2uPnOxx2DcTe3+ccinOdMajldFMYCh50J8mWq9A
 7A15mxLT9vrUf2jCpl8azsLcpui+8ERzstMgklwHyOMpw+uDqEHc/G+cGCnC6d4FBDMPFL1OXy7
 G232QZqtyhBFQ5G3E9ZTQYq5VtHwjhi4iBgfjX6zsnuMjRcMzLbSQU1LcfCWq4pMvv4DAaDQUSR
 pyenqrM2xbx+/1mMIbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130141
X-Rspamd-Queue-Id: E2C67534A5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107321-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[clock-controller.5f00000:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,5f00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add device tree bindings for the Display clock controller on the
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,shikra-dispcc.yaml         | 62 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-dispcc.h     | 39 ++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..38302eda7942ebc2e4dfecae511b75cba0b09916
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-dispcc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,shikra-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Display Clock & Reset Controller for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+
+description: |
+  Display clock control module provides the clocks, resets and power
+  domains on Qualcomm Shikra SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-dispcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board sleep clock
+      - description: GPLL0 DISP DIV clock from GCC
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
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
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    clock-controller@5f00000 {
+      compatible = "qcom,shikra-dispcc";
+      reg = <0x05f00000 0x20000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+               <&dsi0_phy 0>,
+               <&dsi0_phy 1>,
+               <&dsi1_phy 0>,
+               <&dsi1_phy 1>;
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-dispcc.h b/include/dt-bindings/clock/qcom,shikra-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..088a7c692ad5d2bae38d2799ec1fc6e8ebbe6c0f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-dispcc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SHIKRA_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0						0
+#define DISP_CC_MDSS_AHB_CLK					1
+#define DISP_CC_MDSS_AHB_CLK_SRC				2
+#define DISP_CC_MDSS_BYTE0_CLK					3
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				4
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				5
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				6
+#define DISP_CC_MDSS_ESC0_CLK					7
+#define DISP_CC_MDSS_ESC0_CLK_SRC				8
+#define DISP_CC_MDSS_MDP_CLK					9
+#define DISP_CC_MDSS_MDP_CLK_SRC				10
+#define DISP_CC_MDSS_MDP_LUT_CLK				11
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				12
+#define DISP_CC_MDSS_PCLK0_CLK					13
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				14
+#define DISP_CC_MDSS_VSYNC_CLK					15
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				16
+#define DISP_CC_SLEEP_CLK					17
+#define DISP_CC_SLEEP_CLK_SRC					18
+#define DISP_CC_XO_CLK						19
+#define DISP_CC_XO_CLK_SRC					20
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_RSCC_BCR					1
+
+#endif

-- 
2.34.1


