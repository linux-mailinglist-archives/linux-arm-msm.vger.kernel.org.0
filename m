Return-Path: <linux-arm-msm+bounces-36282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F659B4849
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD2E8B21F63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04F720514E;
	Tue, 29 Oct 2024 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T2LVJbO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABEB203715;
	Tue, 29 Oct 2024 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730201453; cv=none; b=boNqOlGN+vPc5dFUKaWXUVEaMTF9UjZCBYIPNNdZ9uCV310hpzQg9vx//8YD3gKozOiN6erMYBEO47J+a7nHEaU5wZMqM+xTuJHvdgeJ4+qNkAp6BBxxRv8/28IVwSKbQmR34YVgFZMh3y8u0VTL0FSdbf16cwCcX5+AYf5jxxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730201453; c=relaxed/simple;
	bh=2JuPjIemQ6jRBkDHYOlSIoqujMf4ZTHGf/7+6+5o7iY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jSU0gGBOwC+7XMrVi6tWz5m5SHmpGHUHvH8irRqUJODWaQEvT3SgjIQrBt5vZUclRyRHbCyqHUNz6PhrsRA1/Sk7Q5Ng/KVlMbUjHsIdrJVtmHQU/mz41l4LxDGoFRjsg389/te8IYVVz+PRke0elNlPf+V8vQm1S97yIlvf/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T2LVJbO3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T909tc010250;
	Tue, 29 Oct 2024 11:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxJrGFLyalFjpI5OizKweWF7tCe2FnLcYNKBnf0cMxY=; b=T2LVJbO3FBzAtO8g
	EMrCDS5rbdzwxI5JMpzW2Aslu9yiJjkSKhkvA4i6Vuw9LaVH6CEq0l26aIyBW3e6
	+xVjhZ+hM4WFJiCze/snowm+Bo0VC91mBaCtEBXNALxI8mOPSknH/uWCmSW0VCi2
	8MVEZxp4/mpx7fps57j1h77dHeGQ9uffiCG3m8OR9x9Myp95HwN8O5/Tm7xXtPBX
	TLCA71Ggw8avw1bUVo9/OJyIvVVZDPtrJza+vhYNp4D12ntFI2926s4XXWHZiIgq
	C3cBZVox7Z2KBke/csZd0fSdUj8uTrw595U1kjMfz4N1CXKE4e+9RHKG2+xQ/W4u
	4ESgeQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn50aa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:30:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TBUdwJ022265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:30:39 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Oct 2024 04:30:33 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 2/3] arm64: dts: qcom: sm8650: Add ICE allocator entries
Date: Tue, 29 Oct 2024 17:00:02 +0530
Message-ID: <20241029113003.18820-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029113003.18820-1-quic_rdwivedi@quicinc.com>
References: <20241029113003.18820-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CHB0tA3C2oWeuqNZ9kQ5XFhK1XS4FvJa
X-Proofpoint-ORIG-GUID: CHB0tA3C2oWeuqNZ9kQ5XFhK1XS4FvJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290089

There are three allocators supported for inline crypto engine:
Floor based, Static and Instantaneous allocator.

Add ice allocator entries and enable instantaneous allocator
by default.

Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 9d9bbb9aca64..803db1fcfe16 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2590,6 +2590,25 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			#reset-cells = <1>;
 
 			status = "disabled";
+
+			ice_cfg: ice-config {
+				static-alloc {
+					ice-allocator-name = "static-alloc";
+					rx-alloc-percent = <60>;
+					status = "disabled";
+				};
+
+				floor-based {
+					ice-allocator-name = "floor-based";
+					status = "disabled";
+				};
+
+				instantaneous {
+					ice-allocator-name = "instantaneous";
+					num-core = <28 28 15 13>;
+					status = "okay";
+				};
+			};
 		};
 
 		ice: crypto@1d88000 {
-- 
2.46.0


