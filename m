Return-Path: <linux-arm-msm+bounces-83702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4EC91448
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 060C54E88DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40C12F12D3;
	Fri, 28 Nov 2025 08:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsDCZMna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgg6YV6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089D32E9730
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319221; cv=none; b=hdta/yukyWoIyGR/W/pRZJXd8JjSPB0OGmkqUKyXy82IqACAG/GGjg8bg4YkK1qLbcJo6Ug+7C9t4Uf0MdnyaTaGc3N0ynTzqZVMZ9peipzs93lqVFw9W2UzJR/sFaIL/gp7MoTXzymozb4XLX5k50IIBew2Ivb7FjACtbpN3mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319221; c=relaxed/simple;
	bh=mdTKrQaO2CwTi/sY5WXYOpI7r0hZMTX9d8qAooQvEKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0sByyjl7T4kJ7sjT6NSjqU2sAwnEDtxQ5s+t4trV/8TeZ0VXbMVni2DT0s2kxCnAJFM3O46SFt/LQRxyHuWeqHciYWzK5b6K2H0o/29xbqxAoSKk/7f7AMtoxmSsUe1hM8V/wG6QaEZjQj5PCL1YUhrHGMDVTIKzGd7+aIMTkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsDCZMna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgg6YV6I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8P9tE2986626
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gaZYfkbyWSSbK06U3P+ZJxgr48S83AtihkRfFF/3psM=; b=jsDCZMnaqv8wUPda
	RBegeooVVnKN1zIa5/y6cCZZPrrcDhYHsmj9PcXn6TxCk4V0L43BmbpDP8j0TbV5
	ZRLqGnVTp0iX3B0bSV00nT3Cowq8DFf0/jsOUnI6qAXjHoAGPVn9BGcLXnT5+1aB
	bw2dREh5bUOzY9/NYpMayXPBAGJWmkO9vETAsC6l5DEE3LL8BmqyEiHyFSzsOEyj
	GHB6FE6L74a9u5ubHFIkvVZfD2njAGMihIU5YgXH9/3LHEuQzxOfTXCb47wm6pFi
	yDX8Mw9Im0a3BHG2vmdJ6oBlXxiDoXDhVzuQeM/eZcbdu266DMmY68YJm9+LYrrG
	XQ8tDw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxjn2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso2314604a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 00:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764319216; x=1764924016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaZYfkbyWSSbK06U3P+ZJxgr48S83AtihkRfFF/3psM=;
        b=bgg6YV6Iu4IUnRpAKHsH/RA2I+yQ8Vb7jA2ZoOrfV/nLf1s4yvG7IZIG+fFUlnthhC
         aFmpdjbu50oeMyYCTWNqX1BapJ6C34K+HuJLjl5sAm5AMW7ZaFrQYMMscurbiePhOzlj
         MJaCD6eCsTalXvSAeJzZsmWhMEJYl6EiJGSkVHeFpp1uyt/DeiIXHddZWVZ22CQ03cnF
         UmZY21MHRXgyZ8FERw+FatSpBgfDDthopF/WdOzRja/860EFMUqEtTsIviVBfShXv29V
         I4NtPPpK84wdkvx8HqYjgJboyK1KV46baLmthwkCM7IHqBbiF5SEAlv9m1XcVwaEfojm
         RfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319216; x=1764924016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gaZYfkbyWSSbK06U3P+ZJxgr48S83AtihkRfFF/3psM=;
        b=PGo1RHnONmA4FfviQb2fKa3+STqN1vK+AeGKo1NJ2LGohqXzZBs4O8k0AcKNmqbCwp
         46yQylmKkuiF2MqdX7A3a13QDRyCHZbAdnmBikVBx+xQ9Jr5tpO9pjrKjznNLxh3Sc2a
         HybIIlnYodSlELWqP84Flon8KF2TLtpKovzfNMJ1HzikqfynOP1JJZtVq80RKrZ25R0P
         eXDNXLaEP5Uvckvm5aZTbH+h5Ig04TBy30EnYTW6mOC7ehz3iOIqz9F23TyEA1xkcTwc
         dS69XZfcnAG62y9lgvqTtNbzDjDfw37xsLRIwHwSdPC/TXTOkkur0gvK6Goa+tXeGDTN
         p/9w==
X-Gm-Message-State: AOJu0YwwUeNZiF3mX+NGGkzORxgtxmOQy9Umu+YQOivTRbcFdQM5gfea
	GPj4LOdq6wr+6ZQd6QotS+oBjfyhrlpapyH9/L2Myp0xiWgvJGnW9fWYfwGe26kt+oqwSDZTtuc
	dlmaKlc70ySB2evOjlSJ7VMb+9fB20Nvor0Iaef+1p8EIHTBBARbPDRyv3+6j5bQBhyuK
X-Gm-Gg: ASbGncv8vsJQA/paoEwqNjr5Py5MbpaFiizLpUPXGk+bULES69lMEx4C1yfAfY1O0UB
	dMMq76fqNdA4iMygXQNIHwYXfsUrzb9LaS9Sh7dz+gqDfF/OG3Q6/urZF9ml1MVXJJykRP7Ksk/
	j9XcWi0ZlbqMgifGuzVMXf+U10SDULACgSvktG7rEE7DUtbflrcTo4QXf6rlAFlYeAA94Iemqsc
	nlbU6U0PlBmCKlmU9cMsZVkpYc71q5LLK6ATXRv3+WXf9alsvn2V9mJNbRSPUBJBE45+u9QnP4r
	QSB+1jqxPko8I4XGtufw4l+XbqEkRr/zuo5Vq3bl/fb0Lov6ND4QUEKaqSuo4t2LDSApoxRcgJ0
	2O9f7jMHZy67sRtzh0y7JJe71r6ED4j/ePBxqjIRN+CZVCocgdiaE
X-Received: by 2002:a05:7301:4887:b0:2a4:3594:72d7 with SMTP id 5a478bee46e88-2a719098177mr15042558eec.6.1764319216004;
        Fri, 28 Nov 2025 00:40:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpi0jJTfiq3rYck6iysDU045xjbxtvyNK8UdmA/TD+aoMiiL3kGlKB44hOPyGtYUr65M70rQ==
X-Received: by 2002:a05:7301:4887:b0:2a4:3594:72d7 with SMTP id 5a478bee46e88-2a719098177mr15042544eec.6.1764319215454;
        Fri, 28 Nov 2025 00:40:15 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm21895872eec.2.2025.11.28.00.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:40:15 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 00:40:12 -0800
Subject: [PATCH 2/5] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5332 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-qcom_ipq5332_cmnpll-v1-2-55127ba85613@oss.qualcomm.com>
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
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
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764319213; l=1867;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=mdTKrQaO2CwTi/sY5WXYOpI7r0hZMTX9d8qAooQvEKg=;
 b=6RPLnk35pqsfIQLXWp59Mlqfc1HKHdelAJF7LOWF6303O/EYItNAcur9ZkFdouNlODMu6oZNY
 jc0G5oqt4f/Aucku0XiM90eLk4g4W2VBuGORcZ82euci7g7BqRIX+w+
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=69295ff0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AwWNtY6N_Kgxn3dipz8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: LzX6mkB_9yty-iQ3aFbm-UpzxSQ8Y-av
X-Proofpoint-ORIG-GUID: LzX6mkB_9yty-iQ3aFbm-UpzxSQ8Y-av
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2MiBTYWx0ZWRfX7JHUBb/PUG83
 bt8uxgOkN8ZaX4YqP0WNMaWZdjNO5wMesGY478JaAAWK3fLi6QRMMlaPNlcaUeEZvJ4xXQ/V3N3
 NhPediB5tHqw3MxyvDQpQmcMobneS0FQPo+6OEhtZfxWr5NfGYyBqqbP6W7gGe2TrbfIxFIoq+G
 sOqxoNUzmuju29kHUxBZCn+hu9BmVIFfYxtbevDkKZ6d0SFPRMTt341UbKRjXqwYBTzE5LmjJBM
 /pZK/s9ikJ3b8RgBoAPJGGScIFulgYG4IyOY66au3UDZoOyILftq6InkUZSO6xLKIrzfy/jpdoY
 BWyeFQThbVan7CfwyBLXPXYq8ipm9LQEmccRG4VvRzBhpaBxQy87B8H05Oy7GJQzQkmDkulzjHp
 I0K5J3maIiCmIpe4wnuDQXMonEWSwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280062

Add device tree bindings for the CMN PLL block in IPQ5332 SoC, which shares
similarities with IPQ9574 but has different output clock frequencies.

Add a new header file to export CMN PLL output clock specifiers for IPQ5332
SoC.

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


