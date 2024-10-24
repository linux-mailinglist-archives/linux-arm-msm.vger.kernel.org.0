Return-Path: <linux-arm-msm+bounces-35688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188C9AE6AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FC801C22F25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E221F12F2;
	Thu, 24 Oct 2024 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TwmiH8Q/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AAA1EF928;
	Thu, 24 Oct 2024 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776709; cv=none; b=mBexw8PcX/F87uuMcWlGQHgfVJ7/wsVhOVZ4KthK2KVY36Pty7F8oJ4cVgaho49TNxef9g+z0QY0R+PkyZT9i0ByBeEkfm4tCNAF0uiG9MpbRq3JGlSocnKbvvExXDud4fVgd+Xuc12WEwwu60AfLoZt2n6eX5dYm/5Q0dchsYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776709; c=relaxed/simple;
	bh=oTtMuyGg647Xg12QXZayF/oc2/E9jTtXnQJfw+PaLDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fIN35BjW/8QTeeuUGeuo/pl47CCwGy0+TpOa4z+B5UXETuZZOooKy4um9yO6cW335YBii1dDKos8Yvnjg5QLvcgfy5nstJHhRqdl5xG0KB9Mw8pOXvLZm1IcwkXtllo04CgHh8sMmZjdYVmwuKb8IkPZtO/FMd5BejOAau5FKlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TwmiH8Q/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O94T0v031330;
	Thu, 24 Oct 2024 13:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqHbNYsMeFa3UrTGWv3jSO+xp3GmSR8jCoM2wX8a16I=; b=TwmiH8Q/AeNbAWhQ
	u2QObvHxvhkokie19Gf0FJZS2neZpkPYFoRB1ZQrJddKsYS8atrFtnLT/hP1Zfuo
	pYm3fhEVPbVhNmlKTfP9pGCGLM6Mxj3DEb4zrNiLZ5HR3DD+QuD9AdfWlAdzb/pj
	g5MuRPDgyeBZ+xCOHQbiLxnM6ZZNxQmniSqc8wudr4pvzlzvinPo7CPvw0ptagR5
	obSIiKDGVZ5+9wLuhUna9XUnVVRxFmbiFz5Qn5D8RrpPS9n8N57ikjDjSzrJQp62
	ahwHoYxIw8kZWe2Q8TShC8pXMLzfbY4okU9SvH/UrGC1ZEXB4EnZn4xbfTJau7CP
	KpClAQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3vwufu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:31:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ODVgTa010191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:31:42 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 06:31:38 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 24 Oct 2024 19:01:14 +0530
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-qcs8300-mm-patches-v2-1-76c905060d0a@quicinc.com>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
In-Reply-To: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PAhQlAermx00Rp5n2cghx3AG6UnwGT_1
X-Proofpoint-ORIG-GUID: PAhQlAermx00Rp5n2cghx3AG6UnwGT_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=902 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240110

The QCS8300 GPU clock controller is mostly identical to SA8775P, but
QCS8300 has few additional clocks and minor differences. Hence, reuse
SA8775P gpucc bindings and add additional clocks required for QCS8300.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml | 1 +
 include/dt-bindings/clock/qcom,sa8775p-gpucc.h          | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 0858fd635282..b2b8a1e0297f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -27,6 +27,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-gpucc
       - qcom,sdm845-gpucc
       - qcom,sa8775p-gpucc
       - qcom,sc7180-gpucc
diff --git a/include/dt-bindings/clock/qcom,sa8775p-gpucc.h b/include/dt-bindings/clock/qcom,sa8775p-gpucc.h
index a5fd784b1ea2..54eaaf1c4e52 100644
--- a/include/dt-bindings/clock/qcom,sa8775p-gpucc.h
+++ b/include/dt-bindings/clock/qcom,sa8775p-gpucc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
- * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2023, Linaro Limited
  */
 
@@ -31,6 +31,8 @@
 #define GPU_CC_MEMNOC_GFX_CLK			20
 #define GPU_CC_SLEEP_CLK			21
 #define GPU_CC_XO_CLK_SRC			22
+#define GPU_CC_CX_ACCU_SHIFT_CLK		23
+#define GPU_CC_GX_ACCU_SHIFT_CLK		24
 
 /* GPU_CC resets */
 #define GPUCC_GPU_CC_ACD_BCR			0

-- 
2.25.1


