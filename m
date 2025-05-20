Return-Path: <linux-arm-msm+bounces-58624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D24C2ABD0DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8308F4A66E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F05625DCF3;
	Tue, 20 May 2025 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QnOsBHQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54C425E460;
	Tue, 20 May 2025 07:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727289; cv=none; b=SAQ+mMVIOI5WLaz+4w22PhNoBP6EYiVI+uMU8ZPUnEKo2+UW6WuNYC0IpeWgKnxpuAAnyui3lP0VfOe7juxrsFmycjqsXScFllWSBWcTP+7YipIL0SmZM6vRZc+H9zD6O4XH1aTZmGpWgfLV8AwzMxECls4J1Lk7DO9CZyGfaWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727289; c=relaxed/simple;
	bh=vkSWXGd19gmNSP9npfbrN5UA72vmjE4fzO6Z1X6c6SE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A4JzQqf1eKmoZ/xc/fnAhq+6DJEuybUC95e2gRb0FVe2gbOZK8ig0cyZknHENV44MGzTT0Qc2wimGVPUzsheZwJ/3y7Hii/MDeKTYrbbuxHVKEMj6FrEyF++3rSeD3NHVLfq13R+1rqmRNQhPR2Fvvvyk3dTyPwcYFP4MTi++gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QnOsBHQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6Qgpf027166;
	Tue, 20 May 2025 07:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vXtNjMJXQnzIz9vkpl5FMzptlTgSdEEoMQV45P5w1w0=; b=QnOsBHQXxZTqCtiH
	2VZ2j1x9kLMeP2xsadkMtB3nMPoQ8Zr6bPwQt3Tmp/nP3DpYJR7jhvaACbO4LPDn
	kgKjzqI383TOqImHPKx7g2bpBYN18rgQMRiwcfB6OvN2jVZHQs65lvVmSuq+1/Eq
	hwFD/wHBV2ELJv32vRliNiAGxMsYzNZ1aKiM+IoKOWacZoLyqdR5mvjwOG3665Wz
	n6T0D1gc75dr9KxwPgpsVMbWgCBNvz+3VNABPHL8uB0BT/4VzEXxNGtTBydR0xFF
	4tGT5IQA28MD2nljyEhRnfApn0MhaGiaQU/MlcBgngrOXOiaw/pDdHMLFc+LJ0Bo
	4JdO8A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9xy17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:48:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K7m3oH023073
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:48:03 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 May 2025 00:48:00 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v3 1/3] arm64: dts: qcom: sc7280: Add memory region for audiopd
Date: Tue, 20 May 2025 13:17:35 +0530
Message-ID: <20250520074737.1883495-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520074737.1883495-1-quic_lxu5@quicinc.com>
References: <20250520074737.1883495-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JzX-bjFuEh9HzNO0dttLjkDWgPlkM34f
X-Proofpoint-ORIG-GUID: JzX-bjFuEh9HzNO0dttLjkDWgPlkM34f
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682c33b4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=o7O2lQN-kgvADfYeIdcA:9
 a=TVi5PsLu-Zlr5RWK:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA2MiBTYWx0ZWRfX6R3vb+iur9WM
 XJK5GBmtDCv4xIlde96090S6up6cOLL7WKTo7NRZR97dKUPdNp9ooi1Ws+uGXh8ccGHlZr1ME5i
 FlRaQZ+9t7iv9taU1Iqu2ENSqgGbj03l9ZIqygtLXgPvE0lqkGXuLmxYV/XFInK7pJXdvF8m1NE
 70RC/oEyu3CC02YI4VaQct9+5zmqOHYVMm9aayWh4VnInHlWwOOH899ECSf++nqvdJvyWLXeTYh
 +LnO1yPUTofBLPN+rjEKb9LyvCAyzmTkN95nCoTncA6rksRVsMZHzCNG3i9NtgYUV8ohm/C+CTW
 lTljIFPSzGT2Zc+kg1Wx3mka+3qWr0dGeBu09rA1Ipn5UeE7Yb6J6rhGfwe1v6AF4Eh95N4tJot
 rtvELUCjPjKJCgrG0q33R8TOavU9Z24J5i4oSNE9vEf/PkA6aKLA5o3kg0pgK3F5O5cO4NIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=528 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200062

Add reserved memory region and VMIDs for audio PD dynamic loading and
remote heap memory requirements.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8e86d75cc6b4..aae6c54bcdd9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -188,6 +188,14 @@ rmtfs_mem: rmtfs@9c900000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x800000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x80000000 0x0 0x40000000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -3863,6 +3871,9 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					qcom,non-secure-domain;
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS>,
+						     <QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.34.1


