Return-Path: <linux-arm-msm+bounces-87288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BEFCEFB93
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 06:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F50C301E1B4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 05:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A186F274B35;
	Sat,  3 Jan 2026 05:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnGN0730";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="giZcxX/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7115258EC3
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 05:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767419847; cv=none; b=ly/v2LKFcnyO7ARmE7/3nos91NvwLJDb4r8eoPYV3PdzBSFqB64eOWisCIIZFJIpVA1N3wHaUx1zURPz4X4Gq/+Oy+i/IPyY5k66WsNsuQ+zQ/eikdaDQoBnHv8VFiMmYU+70XBYmrKPR0lCdu2i8jgWSQvC+VdUoo7fC38IeNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767419847; c=relaxed/simple;
	bh=fgI89MV2uHp2zWK1ukvBbVFdMENbhIiHznDR+n9Tys8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0Uc4W8H5I9hx6n85LAEHoKPnTDmL3rd+QuwUYqguDXpq/CrpsNo8e/pm7gjY7yzFNBUyrfXws018c5O5s0hI70swPDrSuX2ruWCObPLNIdyHPd28h4zKU5nXtA/bM2+uMXkY1h3ZFzEj361nChhHE6fjzIKhADEdVAYf9Hd95w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnGN0730; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=giZcxX/h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6033PqQG2791874
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 05:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9TlWJCHPjO5TGXZzf9rxD+/ph2j1n0+xZIzY86QbQRI=; b=gnGN0730Grq3XSGh
	Bq8fjFjCwMellk0fMoms43ky2Je7DUB46lz5D3A3pY70vCV7nERGvHBFl81GzZuU
	+3415AjEggj3hKwV1FqEFH86zPmvcnnG5v4W4xaWxMBeXZBPbFSnnTz6dMjVcZm0
	HDIGeU9ATZf2EbuiwDciJHysdgF5sfW+6Ojrm1DqcAJUOgOF8zSa9rWeDdHGTQ4k
	XSWHgTXQ3vr6W0TaWJu+VG5xiLLlg/ZMn0fPEZJHd50G60peji33pVD4EDsqIUu3
	Ro/sNMv5BOVO1BkeYORkimMREi3r28iCgldWjgPYTxTgPeTyROkhj80ttQQmzVFV
	rPCgLQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beu6t05bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 05:57:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b80de683efso23347021b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 21:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767419838; x=1768024638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TlWJCHPjO5TGXZzf9rxD+/ph2j1n0+xZIzY86QbQRI=;
        b=giZcxX/h18JSoQ7GMMPVXdQyOQr8pD7B2rLSdsSyWeINrHehIHydPn1F8kBR1nEVJJ
         +N/X6y4ua5DnekaiZGpISyGLvl8r4iy+VbHwvxanx4erRrzf557mGNXKL3elSo6wLzI6
         vSyPOoIVIgWmVWH6wpncyuzm6IsMpY4RQE9uWI8S6v1ktAVHtl8NQd6jeKlwdRc7AhI3
         yMWi+CbyJUhphv2iw167Nmyb3byru6Mf49yhiy8mTDn2Q71YOUmqXlubVGqAPcz5SZjM
         rPHFeLEy2pVwgVWSUj7SbPez05sucEM5pCTwFkEVKYACtNQqDFj7O5Wgdd4Wb2bs4qHz
         eQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767419838; x=1768024638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TlWJCHPjO5TGXZzf9rxD+/ph2j1n0+xZIzY86QbQRI=;
        b=N9DD4cd1imJdKXBFX8P4g6QvRHaev/3RT9m6+S4V1o7HSrQNQQ77hNzBX7eA3DNVfx
         pd1RBxDceRvnTDCFKRtND5Jpp6E6jA7sfSsLA2mX2cgMQhZQgNsiQ0UQPqCsWKNWbN3Z
         Mc46G/PFJX+MyQ6zuKvjKA1MIY0Gfq298pV118Ux+S3F9JBe3bOOHdcsxdRYNRhCH5O2
         WnmiAJEgUWSR6b9fLAiW7SkwRKGrz5nCT50cjbQ+TwaYscyfgSnaWOdnXXYHc8RwCg2d
         OC+guJo0LtRu0iufC3knxzuIgDhf+AquW3Hn4lj0Mov+PvoVC7Cl23jIp4d8oMeb2Flq
         C6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4G0EZ4HQbzorTJCunOSUu+1ZC3q0ozBjH93RVH/I28oKnx2Hl/Kttds7YYEUYhuwmXauuhdpC6xhxj953@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2c0RIp5ahylae3tlj8ue4QAhzwRAbu44ew7an6UWVzXgRHwvx
	4IL6y4m5LePD8l2qOp2LBXMU4Sm24HNxJ7bwfebdspx1Ug4IFZY0Q4akNfeseZcqkVwfKGlB7UY
	6BbfSjGLf4sxoIuDBGTznupq1AHQT9aGHtm43wnOZxHh0TLJkaBid0Pyt7E8YFBDFxUoH
X-Gm-Gg: AY/fxX6IBwB1AjFdnGpFYwEBHs2qJxIeS3vuF9iSfUWF1pQxFl5tNY/uKYF87sxZ8AT
	8m5cpQUuuJvgGw5OMw9GC4LH2iKjbotrZpSpU28tHJZ9mDVXWws2D0Bvc2KBvhKjzfL+C0bDyXn
	/TRG20IM66YeTaQoCfGpUBGD6ir8LGEX+G2ErjInZra5SUulauMM7icDIYkxqr/t4jAOfcvkz5n
	BDeZe4BGAoMXbfkNsK/wRPkSYJkNd3c6f+nLXfefEnSSbfSQ8rpP59zpjzmyvy46SWHTnLEXb1U
	IAQ/LRITUMAsyBLXwtqSDHUgNcZ/9O0efcdZWQZfFUPkETTePh3VFrA0K2zbbKMAejTLaV58KPh
	3qEihrDotFmT2cf2rNGkfGxxfkNlhFIrgfw==
X-Received: by 2002:a05:6a20:729a:b0:371:8e6d:27fa with SMTP id adf61e73a8af0-376a9cf0ddbmr40092023637.47.1767419838485;
        Fri, 02 Jan 2026 21:57:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFlwF60yKEjsj9aIZUMLNNdkltwVx96Es9JEKzS0PR+E3Id/utD6V4LNefwo18VJ+sL2lXng==
X-Received: by 2002:a05:6a20:729a:b0:371:8e6d:27fa with SMTP id adf61e73a8af0-376a9cf0ddbmr40092004637.47.1767419838044;
        Fri, 02 Jan 2026 21:57:18 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f475f1726sm754760a91.4.2026.01.02.21.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:57:17 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 03 Jan 2026 11:27:05 +0530
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 UFS mux clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-ufs_symbol_clk-v2-1-51828cc76236@oss.qualcomm.com>
References: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
In-Reply-To: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDA1MiBTYWx0ZWRfX/ps8LzvuFOwP
 MlAl4SE9lk8iEWqEfTzsiiy3EpflxsZsR1ay2SA0m++62XKIB2YWt9VgZ73Vwep0yrEoN5WWJ29
 evfevxl0y2Ww6UJpVL/OdJ4xJjyBWqUJnK9UCt9uOEdFl6oeshRV4jbT55LUovXVIUjq4Kf+i5o
 HDOP1IiyskuPi3dP8g/FKpb0UE6KmdNQMN1oesJ0JJJQDZCrv1bzhBFe5AV77U3ncsYfzFSNtTy
 vzyan6ZgyeImRlGFy8gRneZ7W9Si4l0jUIEsXHkcTr6PHozLp1Y3DOOu/VTJcOKnS1+zjOPMlkq
 h0QzXe5RtAPAYJebCEENESk3qa14gASh9nFUOr085rqa9At/sC8DyhzYD2pS2TCn9SmDotCK4j/
 DCRyp2u3tiURVGeKRNbAAjl6JQM+EhaKy4Em3xZyAFd2hy53yncxc7YQgl0jrQtkv/H/j6pSJ+o
 zDpZ4zNOCYgpyRAHB1A==
X-Authority-Analysis: v=2.4 cv=HLbO14tv c=1 sm=1 tr=0 ts=6958afbf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eJk6mxms4T-ridc9Hy8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: xD9MaE3f4moJc5DlxDGDDCdcD-dbKoB1
X-Proofpoint-ORIG-GUID: xD9MaE3f4moJc5DlxDGDDCdcD-dbKoB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030052

Add some of the UFS symbol rx/tx muxes were not initially described.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml | 8 +++++++-
 include/dt-bindings/clock/qcom,x1e80100-gcc.h                  | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
index 1b15b507095455c93b1ba39404cafbb6f96be5a9..881a5dd8d06f924a4627db5f8d17ad147a1011dd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
@@ -62,6 +62,9 @@ properties:
       - description: USB4_1 PHY max PIPE clock source
       - description: USB4_2 PHY PCIE PIPE clock source
       - description: USB4_2 PHY max PIPE clock source
+      - description: UFS PHY RX Symbol 0 clock source
+      - description: UFS PHY RX Symbol 1 clock source
+      - description: UFS PHY TX Symbol 0 clock source
 
   power-domains:
     description:
@@ -121,7 +124,10 @@ examples:
                <&usb4_1_phy_pcie_pipe_clk>,
                <&usb4_1_phy_max_pipe_clk>,
                <&usb4_2_phy_pcie_pipe_clk>,
-               <&usb4_2_phy_max_pipe_clk>;
+               <&usb4_2_phy_max_pipe_clk>,
+               <&ufs_phy_rx_symbol_0>,
+               <&ufs_phy_rx_symbol_1>,
+               <&ufs_phy_tx_symbol_0>;
       power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
index 62aa1242559270dd3bd31cd10322ee265468b8e4..d905804e64654dc8d01ab20eb1106cebf6e54b0e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
@@ -387,6 +387,9 @@
 #define GCC_USB4_2_PHY_RX0_CLK_SRC				377
 #define GCC_USB4_2_PHY_RX1_CLK_SRC				378
 #define GCC_USB4_2_PHY_SYS_CLK_SRC				379
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				380
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				381
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				382
 
 /* GCC power domains */
 #define GCC_PCIE_0_TUNNEL_GDSC					0

-- 
2.34.1


