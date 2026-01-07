Return-Path: <linux-arm-msm+bounces-87781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA26CFC149
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 06:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE4AD3040F06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 05:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83A126C385;
	Wed,  7 Jan 2026 05:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxq4WgSc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lig6USya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704F826A1B5
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764118; cv=none; b=gpQKMyx3cm9uqfJqaJT2gkO8zL6XsaE1e+7cH38Ue5PSfaOnikGtQxl8uCt+RjqUf0ijXT5Ai7DrkO1dL+Z0jxE6MMVKWmK7N+jmr7WILj2tPKm+2PnRVu8gLPWvreiOwYxUGNSHm6nOHoppy104Vpk3l/kTldZwUrDWWsC9XeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764118; c=relaxed/simple;
	bh=d5CKrxn5IxYD4RSv8tB4qdRIzqCt9kOKFhSG2rU9068=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VwZ4ltAIQvuHaq4KlxNUIUExvz7D9HrhSBF4Jd3s8dpItZS4qGKzuF9t87meSyc2kW3KXk0Uui4FhHrGbdHWE0K2cfYeGjFia+oaRAvflRdlS48/fDHDoEdUuRoZA8UtClap6iA75u5m4PSF2H/lmFZTwnjB1BuDfCQit4fSY14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxq4WgSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lig6USya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6070KCpB322770
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 05:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzgPXGnOGNwbVFsGIJAcSSeNLNj4i9epjPxiZPnwAJw=; b=dxq4WgSclfU12Y1e
	GoUip3IbCS9rqdYVzo51Jo1jND9kf58nMvjqSejHdJe7t7R9QR7aAaUsw8ZJ3tKn
	0Yl90IDlDMS+tkj81puMr9aQnCbGNsYeEsKZwA9bA5M4tlpYwQe+CEFYqF6AxMX2
	eMksmggZqhdl7DSZXZY/pJRsHnZonoN+Ca4mP+ulJW/+eMIUdxwSMpbDT0LRibKZ
	B2JrfL4P7RkPgshLrHGOabrLqp2evwNYeBd6cTT686VD7axvorT/e+mxjFuz8S97
	vLYcaL3tS6O1SHzMzy/XIuFqC1U5dT8c9jHsgBkYMj2TY8Ctb4UJYB1PWLvcnHMj
	v8sXMw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh4crjbjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 05:35:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae56205588so1335817eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 21:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764115; x=1768368915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzgPXGnOGNwbVFsGIJAcSSeNLNj4i9epjPxiZPnwAJw=;
        b=Lig6USyaVhKIQrNx+klmkIKSXmwIVCVrGXIvVamztHgxSaNNBYLLvf0pyyrp3zhFsO
         gdJqvccwrNA3ARlIgCaifEPSyAUNJkdoef/lNJBSqTbIsKFdpjB9mpPhK/1j/7JtZHCE
         NOBz3Ri4sVz6pK6FTMyQDpwvsp+PyvyWiNc8m7jV2HzJ+gAY8oLqxMDV87FnuEBwwqoX
         Z/G5DOuKizZtgj3CGWSJGU609CdYb7/XqpaVlMB/6qKovp+PnZFJ1RFtqaqYDZIrJ3er
         c1pPN9GD7TmAD6sOI4MZskJS6KN6eVJ2D8vPMs9HOlBDlwlg175cJy82Sdf2KjQOGZe4
         fWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764115; x=1768368915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzgPXGnOGNwbVFsGIJAcSSeNLNj4i9epjPxiZPnwAJw=;
        b=mCCBWQIptXCceWcNJf0hY0FgpSyLUWCohTmgaTUjtHztJ/Ii5X+KktF5oSRVWpfTqm
         KlEsK4CVmn5WqSW9v2J4dO73A7l4HIZb7G40Xzsar8f+azqGKXXHZa7BZnlE+LVe9ZBT
         MVkaHzGmG/54sMDnaSmhvyvIJC2qWkEK5uxSUkTH1J+3M3vbSpxgnU2DNTJMJo0kOLZJ
         pGZV0Umt73+JCBkfm9I8d6dzpNldB5/m9Od+ncjflo3a0uHv00NsZfyyLrrRnhe/5h3x
         dQ923Y+Feav93ihd5gHX84BnxPaCWPnct05cbYy33Lrb+JSXJx+50ncdAgEox56p4gsQ
         VrOQ==
X-Gm-Message-State: AOJu0YyvA0u8Z+amoHWdDE2Y7x25oqV/8KOSiAiaufvC1uUKpSHODx6B
	18Ohiwo5TG7uw6Lc7awNSj3ET3j53LRVTESS8sQp7P0elaDQqvTqQtLD0sc4GVtQea1zrt94sZd
	qqpyNEy5x6yiMUunYZdoN5sJ9haRdv1G+M+zcjBiUWoTCzdoq/3QEpy8MY1D8+im5f5nT
X-Gm-Gg: AY/fxX5onTDwfvL6GQV+15at6ut5Z0DmZJnsasHEGBk7zXPvvw/heG1LbHtUprEL0SY
	Og7jzmvqDArufW1xq4JtG+FZ5jm06nB6x9BAh6KcgzqT8uyf/k6YAT9jPg9AzymjwOLuXk1u4kO
	UDW/DjbVOgVJzRFdZKLz0+hW3cJPOM0SHnMirToA+zCKlFw1xG/o7mNYHNQ7loYSHUcuc28LiL6
	KJUy2BSgc975+4MwM31Z/jqkHv0LfFs2rT6dXtI7nHuAsuhmdUvVgUwi4FTThV1xcak+rafPFDq
	RWoKcSsnK5E1AzENfCQgm66+n1AWQhmUJTbAbXFdU/YnIA6AAiBoa3MPI75vUP546Xu6Mo4ph6N
	cCU42OMclZ2h4+2AwFMfPx0HvpGIWCNimtiyRr8dDeOkU0ZqIGbAm
X-Received: by 2002:a05:7300:d709:b0:2b0:4fe2:6a2e with SMTP id 5a478bee46e88-2b17d238bbfmr1140806eec.9.1767764114854;
        Tue, 06 Jan 2026 21:35:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLO3+EQQIJQJxnwyP3r57180yzS37i+MezNwqawryfST1RMLxt2iIy9G27t2QK6bM/94PVZw==
X-Received: by 2002:a05:7300:d709:b0:2b0:4fe2:6a2e with SMTP id 5a478bee46e88-2b17d238bbfmr1140791eec.9.1767764114314;
        Tue, 06 Jan 2026 21:35:14 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm6120311eec.2.2026.01.06.21.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:35:13 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 21:35:11 -0800
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5332 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-qcom_ipq5332_cmnpll-v2-2-f9f7e4efbd79@oss.qualcomm.com>
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767764111; l=1937;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=d5CKrxn5IxYD4RSv8tB4qdRIzqCt9kOKFhSG2rU9068=;
 b=pnGDtV4GL6odErG6ovfr1Gm5EiLzWAoCDtqrBNE7NwfSW9KmnFjxqUsMtxzJ+mYKkmTdeolgW
 aDSx1ch9XfmDqvqO5enISDqS1bdXWt91oL+rLGeiECv0htMme4dy8ii
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=V9FwEOni c=1 sm=1 tr=0 ts=695df093 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hkflQMVECjqu9LUcpI8A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: O390K2klxme4UfFvNlX81i8FIeoA3XlH
X-Proofpoint-GUID: O390K2klxme4UfFvNlX81i8FIeoA3XlH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MiBTYWx0ZWRfX01H284rxfhvE
 KQhEvJ4C9BIjK9zAgeutDszdZHgVCbPhEtP7S7gZxdJ3DNvom4vx3+2ZuHJwdM1o3zS2XR4Qa/C
 HR3rX04uVKVpW3zfAagcvD4Pf99NF2cZ2eL1jnf3CPSkXvqCjg5VNHf3bjPXyuZW2Ev4MCMXb3P
 Csk0rYxJP8cCVuiyOevHWrltdraY6ZMBx3jk8rU9YDvj8Jke7nwNVe62/mu0O65YXjOEErm8WBR
 mUdddxJA7ec6MVAgPga8Vqsi0Mpf8O0RZJ3w/bogNbzg6RZJ24jWfiBjDNxWovUZgnpdJHhpbA9
 aTDzCdTC0ZsBF6oBwNrGimjmNzDqM0k0DZHqPgPbfNm3FqRSNwKFIgHc/3DZ/DT387Mpha8hKhw
 /k5t9S0EhG03vSUpSr77xPEAyvL5Qn2bC3rPu0ln4y0YSlucDp7Vvlw4Nnhu6EzLCMHK1XmN9LB
 kzU4c+7Lf2nUfA8tGOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070042

Add device tree bindings for the CMN PLL block in IPQ5332 SoC, which shares
similarities with IPQ9574 but has different output clock frequencies.

Add a new header file to export CMN PLL output clock specifiers for IPQ5332
SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml          |  1 +
 include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h      | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index 817d51135fbf..5bf29fcd8501 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-cmn-pll
+      - qcom,ipq5332-cmn-pll
       - qcom,ipq5424-cmn-pll
       - qcom,ipq9574-cmn-pll
 
diff --git a/include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h
new file mode 100644
index 000000000000..172330e43669
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5332_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ5332_CMN_PLL_H
+
+/* CMN PLL core clock. */
+#define IPQ5332_CMN_PLL_CLK			0
+
+/* The output clocks from CMN PLL of IPQ5332. */
+#define IPQ5332_XO_24MHZ_CLK			1
+#define IPQ5332_SLEEP_32KHZ_CLK			2
+#define IPQ5332_PCS_31P25MHZ_CLK		3
+#define IPQ5332_NSS_300MHZ_CLK			4
+#define IPQ5332_PPE_200MHZ_CLK			5
+#define IPQ5332_ETH_50MHZ_CLK			6
+#endif

-- 
2.43.0


