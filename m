Return-Path: <linux-arm-msm+bounces-21516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663368D8B27
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 23:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97F6B1C21E39
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3175D13B5BD;
	Mon,  3 Jun 2024 20:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LgIBvEy8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C346313B5B6;
	Mon,  3 Jun 2024 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717448387; cv=none; b=Wk0nttr3Sdj2In8TMLvClOiAWg/wT59zyTk17kFCC6ECc5yPUPw6HEK1CCFKBPa05l8Cp7YyUxZe+jTgXT5meyOJAPwUybshvuzmBPyJcp7MdLCV8KtIzW2/uIGaKZMo9MSezB4oP382xcZzx5A5rl5g2TTEVpW9/2H9fYA6sZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717448387; c=relaxed/simple;
	bh=5zeY9wzyW8QUr39N1kkHmV8Ro5ILDqP3BKvJjPkPLR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UPt3npE7/YYBFqO2dx8uFfFCnncCHR72nHKgOfUC5+RsqVgjM8kJPA/Gu4W9qflXww/kf+2jGLBNphNWA39+2aJswzx7KBt0Bkpngbqx7GMZ1BhYjUye+Uswq5/RhTrMLNQmae7X5Gkm0eWJ3uu2DL4leMVO8x6QuuLbKv7poLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LgIBvEy8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453C6dfD019807;
	Mon, 3 Jun 2024 20:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYd4O/XWfI+fXPqmIriWYDSfSfUwEB/+5ID43XD5y1c=; b=LgIBvEy8prHPpIIV
	9tgo0RqNVUeETv9yxxyjN9PoGnkhv5FCyEZ0CMB775yI5Xt95mc7DdPw/Pl6xWmI
	+6RRgPXz89JCNFEZG966Qu+PS4lbWIVGMaoq7UyifF97O16OpHbux76niy4L2+Kz
	nOS027Oj2Tox4hdJTOC+5wYH/Pb1bkUCZ7ej0gUHtTyAb5s5GHrWNqPA/dnkVm8t
	37eY+rufNv4+gYAO7exEqvobkKWUkt+2cIAJVz6RCuNgmhxAZcfwhtgGN/CweyMR
	HnqwbPR5KOi/2XbTpQLWuJdgqHcf89hpf/yuvEXJKqx828SKjYj4h+8NQpxtj6ZS
	FYLc0A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5t4rp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 20:59:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453KxbvD027612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 20:59:37 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 13:59:31 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <jassisinghbrar@gmail.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>
Subject: [PATCH V5 3/5] arm64: dts: qcom: x1e80100: Resize GIC Redistributor register region
Date: Tue, 4 Jun 2024 02:28:57 +0530
Message-ID: <20240603205859.2212225-4-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603205859.2212225-1-quic_sibis@quicinc.com>
References: <20240603205859.2212225-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 46bWgkRm6SrvaiWsnqBR-MH-j9e6lMSs
X-Proofpoint-GUID: 46bWgkRm6SrvaiWsnqBR-MH-j9e6lMSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=674 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030169

Resize the GICR register region as it currently seeps into the CPU Control
Processor mailbox RX region.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index cf8d8d5b1870..a537f3117c9d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5080,7 +5080,7 @@ apps_smmu: iommu@15000000 {
 		intc: interrupt-controller@17000000 {
 			compatible = "arm,gic-v3";
 			reg = <0 0x17000000 0 0x10000>,     /* GICD */
-			      <0 0x17080000 0 0x480000>;    /* GICR * 12 */
+			      <0 0x17080000 0 0x300000>;    /* GICR * 12 */
 
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
2.34.1


