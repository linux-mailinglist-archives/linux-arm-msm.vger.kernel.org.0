Return-Path: <linux-arm-msm+bounces-108055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPWQCZj8CWpPvwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:36:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDC6562A00
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE51630276A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC351F875A;
	Sun, 17 May 2026 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHayhwpt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Au561M8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37642566D3
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039216; cv=none; b=EmqMkAD+IiyD/OQgeTCkEv/iXHM2wmTsMoaZRVakSbolcjgcY+XudAjxzKt/i4eCegmee2qbUI4CTazhZ7N3RKs0Dg/tQtM46dQ+Y88evjLNi8GTfGvcqPL7H5X45cczoaZ4ej45xzYrwFELW0L0/uw4Ypte+3cCBsoyw5llGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039216; c=relaxed/simple;
	bh=9e/rU3y9FiY3ZktFyJuwJcqEkyq+fjBmIt3hjGxM5Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rD+BiJbtNUnnmIjhWQBP6Rkv7kd6JsKqTdZ1W4wkK7SKkbPsRE/P0XGWlAyYOmx4liHxrmxe426o9P5GzkEk7u2k/mrRy/hp+bvaU4EGYDdMmoNfQZuhvwE/0/7yBKKVk/zCdddi4MrUWYDgoleUQFvh7WZjRLBPYDMWHY2anew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHayhwpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Au561M8L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HANBpC2216526
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCH7Ji4S72tbjTt1JN9O0xKaoBsRwmicvzKvcsw0nFo=; b=iHayhwptk2MAiDC0
	8aloC16Pdu4imas41g9TJh8xOeSTzy2YUx3p2edfMtIxk/WlSO4EQBXt2qZBp6B9
	weOIBwHhYEeXvgPlU86jhfL9Xf9TIv2BDmaOCENBg0723pmunqNpl6LhBlHxZUjb
	LIzJjmW+0gS2Ph02Qrn93JVybQEwOyq5MoZIMa2/NOiBT/nfiNxCU2Bd6ARJ3eh4
	wq/Exp+QIzx13ctYj81BQnXk7lpWcORo4ZyRMSNJqzygRw51hdJl6h1I9ZPBe+Zg
	E/kAs8M1Bqq5cjlSKEVVAYMu8LNPWUsSclS1lI1Ha7pGYCiBpykhsVwKmBJP1Hk0
	1R61DA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7u6pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso855996b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039213; x=1779644013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCH7Ji4S72tbjTt1JN9O0xKaoBsRwmicvzKvcsw0nFo=;
        b=Au561M8L2iR90djZ5xlET7StMrFwaRFZazETcft0IHCi8YSYyqb9iBqhE+C9XZa8lu
         anFweeOp3WdO4PFngeRF8eHncV1DApy88g9cxgzBd+hzOqzgZmOZl5+WgcePXCqx13aC
         uw5Tfe4bmmK9JmZOV+t8cK1sDAaMojm4zC4KmW9wfXCXqIBPDjqIiyp/vMWAPU8itDpq
         57g3CE+U+1ZEkEqi298k4NCWOXt/cdDzwzzKzXyB8cMwyX3KbZ+CroN3wXbmESnh1Ayu
         c9cKDREtG+svOaOPNmF8TbO/kVulKH1/hy097t79VuW94OZxffLiybxUaigCCbVcj/E7
         +UKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039213; x=1779644013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sCH7Ji4S72tbjTt1JN9O0xKaoBsRwmicvzKvcsw0nFo=;
        b=XLNLg2T9uL98up1QaRo6ZB1gtqCNXwUa1lW8fHmKaUCexpSaDDxRHvCM3Cg2gfyo6j
         cFtvG63nnMqybtNig4L9R8amh/zhP6/qVX+TvZ0QQGG3DX/tF7dE9M9MAWEFVVziH/Ij
         Fbc3IQ7GttDZD+a+YJx6B3mjTAOc79quFaVWJvfCGwSdRTWAOqRhAfYj40ToHk0FFNCl
         uQmJjmGmZ5940LhLSF/IiILezcG8A3TSoK6gXXeHg/jyxcS+jBpWGxZnLLWGKhf9DZ0C
         ljDb2RFXpZaL/sA6TRQrnm7wbmmFRsNIplLNTZjraWuypY9IZIU0EpwA+Rmkd9/boMIR
         uelA==
X-Gm-Message-State: AOJu0Yx1MKmwqqOEE2+l0aIOnlmIDXHM8C498HxZkzRkzNqkR6JrTDWg
	jmn4XnCZT5g4JLsmzWLiENqv1MvvnjwS1aXL0J8aT8YqktzN48/sCI830Acwrg/lc7c0vnlhWVI
	6IQErArPrrCk//PJkjDvzigYcz6UTJG8WTDlVIjiYSxWEZkG+sPKaJ/3laPPiJfpk2kmB
X-Gm-Gg: Acq92OHzmBuTFoouRnbdqNxD5M4ERWljDDOb3Xmc+DLB/iiCeQlHV3Oa9JLMv78pJT5
	49it6ypa6PgvXkdTvzMZZfyn4W6gDae0T3gYQfEP9oAvs9dAmGKb4GoEs8nvZvjSKGwB/JVjy0W
	DOLnKfdtwuQocadczXqaj2WJCCN47DL4u4LFwiQzLrxpDQWzQU7MnHmt7JxuTza9BoCq71khDE6
	1BZkadT2rAvO+KqU8XH5QqVsC5HzwUpYFPvpC4Mc6Nu7ns5ItA0XpXUuFhcKPZOO51N6ZAUoAsO
	2hi0kmYAKEO1HcV62EjgxC5RqNHh8G70iaJsxZkxnvJ3JVgShJl+PGW/q9O4/UQx9FnLg/FP6NA
	LhoWnb78JH5V+TZmK4evma9wOs0cfHK1grI5s9GSktmauM591biC6
X-Received: by 2002:a05:6a00:3928:b0:837:fe75:104e with SMTP id d2e1a72fcca58-83f33bae7d8mr12644011b3a.5.1779039213482;
        Sun, 17 May 2026 10:33:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:3928:b0:837:fe75:104e with SMTP id d2e1a72fcca58-83f33bae7d8mr12643992b3a.5.1779039212956;
        Sun, 17 May 2026 10:33:32 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm11331567b3a.19.2026.05.17.10.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:33:32 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sun, 17 May 2026 23:03:07 +0530
Subject: [PATCH v4 1/3] dt-bindings: clock: qcom: Add Glymur camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-glymur_camcc-v4-1-9d00acffdbf7@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
In-Reply-To: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OSBTYWx0ZWRfX//6b7QTgkgr4
 ix4MK23zxfs7VhxxfyYMyfOeffusfGcARUHpuK2YOLzOeeMH5KYz0866MrUZMD9wQCNoX/67LMp
 XPINUCCu/mx+s/wEMy6YWoyAHDwuh1paoy3scXmvDkQDBusld9amiRg7AilnJ09kF0BklbaGsom
 EMVjg1GUNUb8er7RaA8IT8WQ/GgV6M+FfoXv6XFLWqk78adrPTCnn69fl8uym/81WpfzWyVxDGa
 +c0Mgosrq0t3f+TV9gPPSgb+oGQhhcL+SSUe3DqVwJ0hlgF/CVZdKsZkVQxPCtgvzWfyWCJoi9g
 xxf0l4i3VQrwE5Wkot9VX2YIYucfYagHsFyIUF7834Uz9gjeu5WoJkuLCPBkC2wl2aJpf9dZ8On
 mC66wkkIseJe/1Eo6rxUr1t6VIwdgqQuH35trXOBcz/2+OOpd+85RtbezdQdNaKHcTjgdhxOC2L
 BbT+n0rsqFgG3lUqZZQ==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a09fbee cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Dk9EUgma8fqr-VUMxRAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6UEKsdW5m9x3MxHDQzcmJVnOR9FBYdCf
X-Proofpoint-GUID: 6UEKsdW5m9x3MxHDQzcmJVnOR9FBYdCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170189
X-Rspamd-Queue-Id: 6FDC6562A00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108055-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add device tree bindings for the camera clock controller on
Qualcomm Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |   3 +
 include/dt-bindings/clock/qcom,glymur-camcc.h      | 122 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..93a379a4347cfc83f647e6f52d2af2713cd06514 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -8,12 +8,14 @@ title: Qualcomm Camera Clock & Reset Controller on x1e80100
 
 maintainers:
   - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+  - Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
   domains on x1e80100.
 
   See also:
+    include/dt-bindings/clock/qcom,glymur-camcc.h
     include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
 allOf:
@@ -22,6 +24,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,glymur-camcc
       - qcom,x1e80100-camcc
 
   reg:
diff --git a/include/dt-bindings/clock/qcom,glymur-camcc.h b/include/dt-bindings/clock/qcom,glymur-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0c93fc77ef268b5971e671c57ea5cfca3d630471
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-camcc.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_GLYMUR_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_CLK						1
+#define CAM_CC_BPS_CLK_SRC					2
+#define CAM_CC_BPS_FAST_AHB_CLK					3
+#define CAM_CC_CAMNOC_AXI_NRT_CLK				4
+#define CAM_CC_CAMNOC_AXI_RT_CLK				5
+#define CAM_CC_CAMNOC_AXI_RT_CLK_SRC				6
+#define CAM_CC_CAMNOC_DCD_XO_CLK				7
+#define CAM_CC_CAMNOC_XO_CLK					8
+#define CAM_CC_CCI_0_CLK					9
+#define CAM_CC_CCI_0_CLK_SRC					10
+#define CAM_CC_CCI_1_CLK					11
+#define CAM_CC_CCI_1_CLK_SRC					12
+#define CAM_CC_CORE_AHB_CLK					13
+#define CAM_CC_CPAS_AHB_CLK					14
+#define CAM_CC_CPAS_BPS_CLK					15
+#define CAM_CC_CPAS_FAST_AHB_CLK				16
+#define CAM_CC_CPAS_IFE_0_CLK					17
+#define CAM_CC_CPAS_IFE_1_CLK					18
+#define CAM_CC_CPAS_IFE_LITE_CLK				19
+#define CAM_CC_CPAS_IPE_NPS_CLK					20
+#define CAM_CC_CPHY_RX_CLK_SRC					21
+#define CAM_CC_CSI0PHYTIMER_CLK					22
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				23
+#define CAM_CC_CSI1PHYTIMER_CLK					24
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				25
+#define CAM_CC_CSI4PHYTIMER_CLK					26
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSID_CLK						28
+#define CAM_CC_CSID_CLK_SRC					29
+#define CAM_CC_CSID_CSIPHY_RX_CLK				30
+#define CAM_CC_CSIPHY0_CLK					31
+#define CAM_CC_CSIPHY1_CLK					32
+#define CAM_CC_CSIPHY4_CLK					33
+#define CAM_CC_FAST_AHB_CLK_SRC					34
+#define CAM_CC_GDSC_CLK						35
+#define CAM_CC_ICP_AHB_CLK					36
+#define CAM_CC_ICP_CLK						37
+#define CAM_CC_ICP_CLK_SRC					38
+#define CAM_CC_IFE_0_CLK					39
+#define CAM_CC_IFE_0_CLK_SRC					40
+#define CAM_CC_IFE_0_DSP_CLK					41
+#define CAM_CC_IFE_0_FAST_AHB_CLK				42
+#define CAM_CC_IFE_1_CLK					43
+#define CAM_CC_IFE_1_CLK_SRC					44
+#define CAM_CC_IFE_1_DSP_CLK					45
+#define CAM_CC_IFE_1_FAST_AHB_CLK				46
+#define CAM_CC_IFE_LITE_AHB_CLK					47
+#define CAM_CC_IFE_LITE_CLK					48
+#define CAM_CC_IFE_LITE_CLK_SRC					49
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				50
+#define CAM_CC_IFE_LITE_CSID_CLK				51
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				52
+#define CAM_CC_IPE_NPS_AHB_CLK					53
+#define CAM_CC_IPE_NPS_CLK					54
+#define CAM_CC_IPE_NPS_CLK_SRC					55
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				56
+#define CAM_CC_IPE_PPS_CLK					57
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				58
+#define CAM_CC_JPEG_CLK						59
+#define CAM_CC_JPEG_CLK_SRC					60
+#define CAM_CC_MCLK0_CLK					61
+#define CAM_CC_MCLK0_CLK_SRC					62
+#define CAM_CC_MCLK1_CLK					63
+#define CAM_CC_MCLK1_CLK_SRC					64
+#define CAM_CC_MCLK2_CLK					65
+#define CAM_CC_MCLK2_CLK_SRC					66
+#define CAM_CC_MCLK3_CLK					67
+#define CAM_CC_MCLK3_CLK_SRC					68
+#define CAM_CC_MCLK4_CLK					69
+#define CAM_CC_MCLK4_CLK_SRC					70
+#define CAM_CC_MCLK5_CLK					71
+#define CAM_CC_MCLK5_CLK_SRC					72
+#define CAM_CC_MCLK6_CLK					73
+#define CAM_CC_MCLK6_CLK_SRC					74
+#define CAM_CC_MCLK7_CLK					75
+#define CAM_CC_MCLK7_CLK_SRC					76
+#define CAM_CC_PLL0						77
+#define CAM_CC_PLL0_OUT_EVEN					78
+#define CAM_CC_PLL0_OUT_ODD					79
+#define CAM_CC_PLL1						80
+#define CAM_CC_PLL1_OUT_EVEN					81
+#define CAM_CC_PLL2						82
+#define CAM_CC_PLL3						83
+#define CAM_CC_PLL3_OUT_EVEN					84
+#define CAM_CC_PLL4						85
+#define CAM_CC_PLL4_OUT_EVEN					86
+#define CAM_CC_PLL5						87
+#define CAM_CC_PLL5_OUT_EVEN					88
+#define CAM_CC_QDSS_DEBUG_CLK					89
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				90
+#define CAM_CC_QDSS_DEBUG_XO_CLK				91
+#define CAM_CC_SLEEP_CLK					92
+#define CAM_CC_SLEEP_CLK_SRC					93
+#define CAM_CC_SLOW_AHB_CLK_SRC					94
+#define CAM_CC_XO_CLK_SRC					95
+
+/* CAM_CC power domains */
+#define CAM_CC_BPS_GDSC						0
+#define CAM_CC_IFE_0_GDSC					1
+#define CAM_CC_IFE_1_GDSC					2
+#define CAM_CC_IPE_0_GDSC					3
+#define CAM_CC_TITAN_TOP_GDSC					4
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IFE_0_BCR					2
+#define CAM_CC_IFE_1_BCR					3
+#define CAM_CC_IPE_0_BCR					4
+#define CAM_CC_QDSS_DEBUG_BCR					5
+
+#endif

-- 
2.34.1


