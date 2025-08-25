Return-Path: <linux-arm-msm+bounces-70757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C6B34A20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 20:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 498E6176B3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 18:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41E33126D2;
	Mon, 25 Aug 2025 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aY3xfU2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26A83126C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756145980; cv=none; b=ObfSLRxDby/+xp8xjgnA/3t426TdzV8Dzlu4cmzXdcpEhVCo6ZLYDDEBVgratwJU6qKj2LQ3JnJKYI/OSp6Z/SUjT+wYAoVV9VUQWO3dThxmzXBa6P5AxljOGd8zmo78swV+qZeztmAoDfdNrbxCFgo3Kvm7wmYJzVG0fZrBnKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756145980; c=relaxed/simple;
	bh=GtbwmtuoA/RBe5b8zxBPGEtjM/G6nG/3ONfOTQxsQ8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWeOO2gtVdQg6644m4LKh2Kcq4KlAHegbC3csT27dpjTT3kybsEkvEujBCi9yS6GfzUfv7TDoMuQldBdmTxwBqsgsWAHXt0xDkTlyN7mbM7b+d8VtD6aqRxscz+OIwJ82c2sPybc1jZ1uwFrsE/FHZ9XOrr/UWPxGasFeAVT7r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aY3xfU2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGod0U031549
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 18:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8XNNR5zTZOnEFE8Ns2yHRkIaTcCY0LcCd9f6zu7FJM=; b=aY3xfU2bNCIpXG3u
	xsC/f8Dg0t506GCODq6BbPtQKCsYky3eXjgkGpPkl9CzdzafEqu9o27Gfer0hvYM
	VO5e/f41/5HEX9oXbBP9tih7GRdn4eei9lnKaGy0Unb8udp6UkLUFT9Xa/FVCOzy
	ymjUSxoPkhTcbKQbRY7J6ZIndLYhI6Ri+nMWRV8ZTaEYpOyCXLBGwdQUX2cuD0Rq
	oyh9h7npuxaClhnRnF0cyHjoafm4S9Rt45bkS1TK3JKwDMrn+j11nyRoaYkIDc/E
	RZP8Db5u1WV0GiCv1LhlvI8fg+Y2KSDqltfhy1wNZp1fEVJf98ZFogkMdQo7SI0s
	bXrM7A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615e158-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 18:19:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2465cc58b28so19833945ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756145976; x=1756750776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8XNNR5zTZOnEFE8Ns2yHRkIaTcCY0LcCd9f6zu7FJM=;
        b=n2wxA5fnGWqV3ZghFiIEQYWi2ftiEVeTtd+XD4x7qZvUEis5ugri7JKuLIBLhk0Y0T
         8bcyHaJnKLbnOHXoEG/YtKoV4kp2orIv0waHEX/jZjU/7ZN2v67Nj6JogNQJsA7ZTbZY
         IvLmK7uXwCJ8ChmAjTrbjjbuqIgeO+k8G9ktghWCRM7bqF0N8U4qOgLpVoP6eL7plgK2
         8mePUrAGTHKkrKSzi0yumJcPUCHgE451TmGr2dPXTuQsBHPjf7V9uWO1ON6MagKtFDY2
         fo5sWs9KBWAe1ERVogC2ozhOBrsidIFJLLX/f2J++wSEvFD16BjGQMdZ9DCUnHBepN84
         N5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXChWnQsEmMbckOe+WlAO7AJBBqyDXG45JGm/D3clV5mlZ9YrndYaOLsSYic4UokX64/TbqN7xbijf/MBPe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw909aquyTU2LUwj1IU8WWI0Y0wxQeLgJlPlHuyjdnV17p+zGhe
	9NAsihcehfGo389k6Zxsi8S9OKjOPovHPGf9jtd1Ne9GDdw/au40GXb0mZAgfNxiN+c8MOq7RLK
	cleLE9W3JJjwsToqjhhF5fnXTgww0NgwOQtjyeQ4cRjFyNyZZzsOFCGifVeOBXf3wnhVf
X-Gm-Gg: ASbGncsYEAkmPed7M7azU7F172qKoCBX7QZX2/MWBAUi6ZqvJJj4Qi40Fnyxy6Bc/Xw
	SoysQDLAqiqBuLJEwZ+GYYEoyZQprjusN8sK+cftci6uRnO3cl4VHgryFtaGZmzoEQy6JJWgFrT
	up2mVoyf1si0TfaD8Wj8T6Hp2+nWnOrlTFon+N4Vu+F3R3tNwyKHXCUitYoaCxhjS09/KCEaJ+O
	hR8Zn+LDw/C7qIaGR1eZ9byDKE9izb53KI71pUABrvBCakb1/Bk6HhvCxl2HPDirBKanFYy/pyv
	slRa92S9uIdnTXx2pn4xtKAsQENSwDe4Fw+x0QYXrCObeRMFKph/YpJl+sXIHla6
X-Received: by 2002:a17:902:f690:b0:240:6fc0:3421 with SMTP id d9443c01a7336-2483deef02bmr5266455ad.3.1756145976350;
        Mon, 25 Aug 2025 11:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxgqJNt5H3Am11ZyaQvv80Pcq57RRvU2s0dMUVrSGwe/SucEQAzGZOcYHr2zqbV/FlMVTGRw==
X-Received: by 2002:a17:902:f690:b0:240:6fc0:3421 with SMTP id d9443c01a7336-2483deef02bmr5266015ad.3.1756145975781;
        Mon, 25 Aug 2025 11:19:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688647acsm74174015ad.87.2025.08.25.11.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:19:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 23:49:09 +0530
Subject: [PATCH v5 2/7] dt-bindings: clock: qcom: Document the Glymur SoC
 TCSR Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-glymur-clock-controller-v5-v5-2-01b8c8681bcd@oss.qualcomm.com>
References: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
In-Reply-To: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX9e5rBXL7Z8De
 9tawInR6Yx1H2E4Wf0ZJICVUjxjiciDfeRgvITdZJ3vXxTOoAsF/HvpMqFx+pmXnHpKYwKwYDic
 dW9nbjmbJeSpWEGE++46p9e3cAC+3m/YPmAOr61xMX7hKhPLVmslzlzYQX2msj7xdeSET0ZEFwp
 u4gR0C6/fnK/UxRdpW91wYS3cmyG/5fiF1bFNMj9ZppS3hFpxS85qEkTTdnRjF3WEVMjO4o/iv5
 wlhfbMMBb8aybv5+KEoMJY60erQFeSd79gzP8ab7DeOZoFAcmp1esX+dVXoppWl+neQwjnaBTiq
 VcE4Pg4ThNaFjR8oGt5M5QeWiP/Go86nzcmT+1rRD09W+jtc0X/4A2kta/PlfEOC98uYjdI3rd+
 59RLWVe+
X-Proofpoint-GUID: SyHd9oOnnJp49B28YnfR5MaNlVoUZRaE
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68aca939 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UTa3es7JcjS1KsmnmHQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SyHd9oOnnJp49B28YnfR5MaNlVoUZRaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

The Glymur SoC TCSR block provides CLKREF clocks for EDP, PCIe and USB.
Add this to the TCSR clock controller binding together with identifiers
for the clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  3 +++
 include/dt-bindings/clock/qcom,glymur-tcsr.h       | 24 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 2ed7d59722fc7e1e8ccc3adbef16e26fc44bf156..2c992b3437f29b38d9c73e3c600f2c55e0b8ae98 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -8,12 +8,14 @@ title: Qualcomm TCSR Clock Controller on SM8550
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm TCSR clock control module provides the clocks, resets and
   power domains on SM8550
 
   See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
   - include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -22,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-tcsr
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
new file mode 100644
index 0000000000000000000000000000000000000000..72614226b113bb60f1e430fc18e13c46c8b043d3
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_GLYMUR_H
+
+/* TCSR_CC clocks */
+#define TCSR_EDP_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_PCIE_2_CLKREF_EN					2
+#define TCSR_PCIE_3_CLKREF_EN					3
+#define TCSR_PCIE_4_CLKREF_EN					4
+#define TCSR_USB2_1_CLKREF_EN					5
+#define TCSR_USB2_2_CLKREF_EN					6
+#define TCSR_USB2_3_CLKREF_EN					7
+#define TCSR_USB2_4_CLKREF_EN					8
+#define TCSR_USB3_0_CLKREF_EN					9
+#define TCSR_USB3_1_CLKREF_EN					10
+#define TCSR_USB4_1_CLKREF_EN					11
+#define TCSR_USB4_2_CLKREF_EN					12
+
+#endif

-- 
2.34.1


