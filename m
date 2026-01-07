Return-Path: <linux-arm-msm+bounces-87828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0613CFD041
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 10:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3AEE30D760B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 09:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F9B32254E;
	Wed,  7 Jan 2026 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lbfo2pQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pv/Zw7Xz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C17324B3A
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779032; cv=none; b=YGe4+2799PPEvgXVLmX6uXtGdw6L4c+P08i1wBEC3TQkIikS2gjscHHxMjTzukrWNl5wQrHcttGXPWTFOqS2bkeY/XH2gm6k1SJCGC6sKYifM/FgK1VLtDpGuYn+wVhEsFDav2fQ7zVV2M4cJC0Jr6o3MIDwJLfXQ8CoBQcJk7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779032; c=relaxed/simple;
	bh=D3FF1lKRDNBWnKY6pRSNBT5xeLfpyDxPUCwhAPG1n5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rujSPOqPLxbgjEhbl6hJmFzAe7iUx2v0tgOSRt0Si+G0hl88+uWdXplNxIxZfU0ZdOYEyFUnzT6mvl2xoW4qgAqQ2moMb8RKrngRe29VsO9zM5sxc9eSD2MQlbMfzDl03MU4T02U9LI0+YChbDeJtF+WGwr9D0bhSnaKalsRhnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lbfo2pQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pv/Zw7Xz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6075eW3N1462298
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 09:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKH6QwyBnTx/S2RWmV87LLJJbPjEJCMBmvP99Qy/THo=; b=Lbfo2pQ07D5vHOVY
	AaV5+WwW1vpUIXy6w1TwWV/YqT5bo7KNZmkgLMrM53X88BSM3KGG31yHcTbxP2Qy
	r/iYTj+aWMXkscqOuthx1q+s4dynyAh8nRvQfdPXStkQU/fKtc9T8puzcRghlb85
	wCSte8e3PnwXLkKbPV9ukytrhYGbJxULe9U/G60cixoVCw6fGyTbMC+EPABTV3pw
	yEXMEkMys49yvBZTEK+5xjbsMvEuoR/x/yGNSdFzkr8ehP1/a1wwXIPo3ckHAu7b
	Q+8Af4GGPosj8ke59aleIsi2ogJbGSjH2CeP5waz1QmPMenp1NeLM/DQ7ZWNYy+4
	5mC/kQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh0vm3t75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 09:43:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b952a966d7so4100602b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 01:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779030; x=1768383830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKH6QwyBnTx/S2RWmV87LLJJbPjEJCMBmvP99Qy/THo=;
        b=Pv/Zw7XzDSfxiIA1UmFvhCyZ4bo5/gpgdYWlc/elZ5QpL+BCg2YbS7xodf+rajZeAo
         6dU8RZjhSULx9INqLvS7foNeM3w91zP1Q+NsI/8f1OwURPIQ0lpvmDV+xXs2GvD699cO
         ZirfKcgBbO7OJHF1IzgpKGgryJIlcdnpvDRiDBqqW1l/ij1VyExYYbNZgZcXfjXRKDht
         c+UZ70J8NOqmKO/KU6w8cCEuEI3pthUPqdrHQ9VkR/41moCn6fkvjQq6728ZJAaU4Vuy
         g4Y2Oo53xZq5hjhkBK5qZBOem56S/2ddaQ3TlvT9P/23CxCvbtlT05XwPaIEbwcZUaaq
         W/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779030; x=1768383830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OKH6QwyBnTx/S2RWmV87LLJJbPjEJCMBmvP99Qy/THo=;
        b=VZ1w1GC8nqfU6NN0pd2OfRgZrFD63Az41fXdyzPOsez8ORtp0xmECK+fz+jA6XMYED
         ml92BRVcPGCfnEJoEPqBQuZFfjSbB9Y5X+7qTI4vo/aqwGNqReI+wcIMpIXP0SPxHY1t
         9fkrMUpjydoTMuxWDk9V74GT1fuQzig0rVv6B1cC9Fcz6Qrs1Cddh4WzoPluSJJ7cC4O
         btLLsELnJhPX/288Ud/FKI7wDVuc4mp6OOTvT4MjYWYdXP6BxFsRLsuMfJARGzUndhuN
         SKJVmeSC8VQpEad3Pc689r+ti1gdJq5f2DwHOqi9fC+PC12UStYqWKaEFxf6b26bkxCz
         iB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEpQ1+AmQA1yVuisqqyj3dxbr3IFLXxYaibX6MN7eJ8zQTfS3PzfVRdN1gE4/zsQzuoQoBDP9WIw7b93LN@vger.kernel.org
X-Gm-Message-State: AOJu0YzRg2AD+SZQ1sy19nkap4CqvP2V4eeFGbp0UA7+dSBsRdJK391G
	VgXN0Y8hRFWh9Svhpfwm+iZ8xvS1I+g7xI/VpM2cs6e/1YC2o5uku4/srojjR4iub7h9nQe2kU4
	XV62nKzudBQJ7jn3fpzXGulp4/lfIgI8WlucH3rsaVyk4Fuzy7Nid7MI1x/BAhofWJQN6
X-Gm-Gg: AY/fxX4U7iof4dvm7pyFkbTCJL/WTK/Pdh2DtW7V5rysKWJx2RqTQtjzeN3ImwsYZjy
	JGJxeyw/uQ5BOcnbTKOYIN4+glXrTdYlHGCodcVZEANT0+xyTDqYzuPu2kd8bdSzkR1eCRiwaTi
	DhFS+AwKnehgho4BuczuAEn2wi4azZDIN9b6z+UdFJ9Ou7DXlL0JbK2zG3qbka+BlPl4Kfoj+go
	stL20C+d2M1CcSgaXCTKGUAn16Eb7t2MmT4jhhg4jkYE3ZozTR4sElqZrnr02DMF5f8Hqbcn/r2
	sYakflTtwcKG6cq9/Q7cp4WyPmXnBJvvq13u1OO4e6QMxd8tjLTtfuOg5GWfBYUgVjNbQoKRyja
	SzgsZBM2s3nCfObm7CAzXDyCGo10O3ZtTYQ==
X-Received: by 2002:a05:6a00:4187:b0:7f6:4922:89d3 with SMTP id d2e1a72fcca58-81b7d85ececmr1803820b3a.17.1767779029602;
        Wed, 07 Jan 2026 01:43:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/pqC6H8MGqDxRq+fjVSP39qlm5v0pyLNBFluukJ825Haoee2Rp0skheV3Yp/6uFPPKQUEyQ==
X-Received: by 2002:a05:6a00:4187:b0:7f6:4922:89d3 with SMTP id d2e1a72fcca58-81b7d85ececmr1803783b3a.17.1767779029105;
        Wed, 07 Jan 2026 01:43:49 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:43:48 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:07 +0530
Subject: [PATCH v3 04/11] dt-bindings: clock: qcom: document Kaanapali
 DISPCC clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-4-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Pa3yRyhd c=1 sm=1 tr=0 ts=695e2ad6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=T4V0RJRh0Es9bX5-c24A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xfoLl_tB27oYCoD3wAYz_1drYIxtSSx9
X-Proofpoint-ORIG-GUID: xfoLl_tB27oYCoD3wAYz_1drYIxtSSx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX0o+kdCqFo6E/
 qJcuzRFGZOgbe1E90yxaSNn+HF38JeRnFgROGrQC9r/TdNsX5S6TTqfuHpIQUYiLKEdo6pRAq4J
 +gEWK99u4A+LX69WKeLiwsqI+c/aA1hlAoTFlT6cthp3T12iNwwtPD2BcqWX5if+jDkRiosppBB
 yKT/r8DYSNQSXCStcQhJ5CwPqS+zC7uLNAiZzdQB28Dz+myzLHmGytteC4wwmXfiOtPlu2sMFem
 j5jB1JYMgosKilQVniSckM59L5KV/vh7PgBeNE26ebH8coZSl1i863SOzH6BQUW2cYMYEYHEWWU
 cG1vU6zWTSFZVNdcfNkr6UcHwWpeWGkllqZ40/+t836pdxCDRaMmVjwjHdbQt082dqwtDcEHDHH
 8A6473I77NWYkel2YctTMycE88clUGc05yghn/DQMZoG2pPxjzcxC6IP/6LPdm4ZmYSEnCNNvo/
 74EzFinEiRKzPm+7ROQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070078

Document device tree bindings for display clock controller for
Qualcomm Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   2 +
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  | 109 +++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 30e4b46315752b93754ab2f946c684e13b06ab93..591ce91b8d54dd6f78a66d029882bcd94b53beda 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8550, SM8650, SM8750 and few other platforms.
 
   See also:
+  - include/dt-bindings/clock/qcom,kaanapali-dispcc.h
   - include/dt-bindings/clock/qcom,sm8550-dispcc.h
   - include/dt-bindings/clock/qcom,sm8650-dispcc.h
   - include/dt-bindings/clock/qcom,sm8750-dispcc.h
@@ -23,6 +24,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-dispcc
       - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-dispcc.h b/include/dt-bindings/clock/qcom,kaanapali-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..05146f9dfe077a0841c253b7fc0b6e76347f8e3a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-dispcc.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_KAANAPALI_H
+
+/* DISP_CC clocks */
+#define DISP_CC_ESYNC0_CLK					0
+#define DISP_CC_ESYNC0_CLK_SRC					1
+#define DISP_CC_ESYNC1_CLK					2
+#define DISP_CC_ESYNC1_CLK_SRC					3
+#define DISP_CC_MDSS_ACCU_SHIFT_CLK				4
+#define DISP_CC_MDSS_AHB1_CLK					5
+#define DISP_CC_MDSS_AHB_CLK					6
+#define DISP_CC_MDSS_AHB_CLK_SRC				7
+#define DISP_CC_MDSS_AHB_SWI_CLK				8
+#define DISP_CC_MDSS_AHB_SWI_DIV_CLK_SRC			9
+#define DISP_CC_MDSS_BYTE0_CLK					10
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				11
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				12
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				13
+#define DISP_CC_MDSS_BYTE1_CLK					14
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				15
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				16
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				17
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				18
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				19
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				20
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				21
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				22
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			23
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			24
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				25
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			26
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				27
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			28
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		29
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				30
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				31
+#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				32
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				33
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				34
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			35
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			36
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				37
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			38
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				39
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			40
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		41
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				42
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				43
+#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				44
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				45
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				46
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			47
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			48
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				49
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			50
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				51
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			52
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				53
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				54
+#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				55
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				56
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				57
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			58
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			59
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				60
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			61
+#define DISP_CC_MDSS_ESC0_CLK					62
+#define DISP_CC_MDSS_ESC0_CLK_SRC				63
+#define DISP_CC_MDSS_ESC1_CLK					64
+#define DISP_CC_MDSS_ESC1_CLK_SRC				65
+#define DISP_CC_MDSS_MDP1_CLK					66
+#define DISP_CC_MDSS_MDP_CLK					67
+#define DISP_CC_MDSS_MDP_CLK_SRC				68
+#define DISP_CC_MDSS_MDP_LUT1_CLK				69
+#define DISP_CC_MDSS_MDP_LUT_CLK				70
+#define DISP_CC_MDSS_MDP_SS_IP_CLK				71
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				72
+#define DISP_CC_MDSS_PCLK0_CLK					73
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				74
+#define DISP_CC_MDSS_PCLK1_CLK					75
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				76
+#define DISP_CC_MDSS_PCLK2_CLK					77
+#define DISP_CC_MDSS_PCLK2_CLK_SRC				78
+#define DISP_CC_MDSS_VSYNC1_CLK					79
+#define DISP_CC_MDSS_VSYNC_CLK					80
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				81
+#define DISP_CC_OSC_CLK						82
+#define DISP_CC_OSC_CLK_SRC					83
+#define DISP_CC_PLL0						84
+#define DISP_CC_PLL1						85
+#define DISP_CC_PLL2						86
+#define DISP_CC_SLEEP_CLK					87
+#define DISP_CC_XO_CLK						88
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+#define DISP_CC_MDSS_CORE_INT2_GDSC				1
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+#endif

-- 
2.34.1


