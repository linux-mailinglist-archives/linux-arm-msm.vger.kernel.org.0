Return-Path: <linux-arm-msm+bounces-35068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624389A4B90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 08:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6348B21D3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 06:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7AA1DA0FE;
	Sat, 19 Oct 2024 06:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NhUQ8glH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5842218C910;
	Sat, 19 Oct 2024 06:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729319843; cv=none; b=uqrsME8UYNDtWRPqze2HVOqYdT+FwW8U/MEfh6cLlPitEWX66Sy3/pU8NkrFOj3mcr+q5vfKcZoVBYNJwUKtRwuN7WutYGGHYba4OaLK1N7samhyyamtxtZ0kYS1x/LXDdbMrl4GbKPv/QO1W5JOdC/AWDQCbt5+qDHomAoOAN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729319843; c=relaxed/simple;
	bh=d+OfuxX+wO0ke54IoY1Ryl3CW+g91wnVudMKr1kFKs0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hTXTToFx01NmBfQKvc1lMRbqN2kCrv2CZX2KsM/0Myqr4M9JmJHDvLGPd4/BXv5BSQCRrNbWTXRXBZ7h4rAAlHzQEBc7QTudjVInr/NC2o04tx/q36fQ9BLCCsQh/3HOR3TKcVVzskW8VwiJ78jzbNHdOe1/CaRbA8pzODA4c+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NhUQ8glH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49J6RY6p015932;
	Sat, 19 Oct 2024 06:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=6RQwXFFMv3XGJHxGGVvTYcAav9yaMccdRgUiYwxWfQQ=; b=Nh
	UQ8glHxhG0gCWyrE4mLzpklZHWskYlcgWKkshnVoUOt6DmVqWVklr7yFLZEfZiLW
	LjRJDaJJSt6+3t27ze1LPyQqvfyX71+ORxdYJPJqugMxLFBN4M0X0vTs9w1sl8iA
	aCUPss7Yi6cfAp2XON5tokXwhjTtUfSorgfZJO2PYbzP5QxOluCpEoSYVNeOFZSv
	G0WUpGuB2u447I3EzuzaJMlM8yc+9nuWXaCBR7kChqKYrJM63kZfT7C5q1wYgCAR
	66/yHYEpd8ukyysoHsIqOPE8y+oAe/LP6PCfq82tRloaMku2jgCapIUEmH/aK6J0
	o5pKilDCnxcCYNoQqE/Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc02rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 06:37:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49J6bF4T002895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 06:37:15 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 23:37:11 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
Subject: [PATCH V3] arm64: dts: qcom: qcm6490-idp: Add UFS nodes
Date: Sat, 19 Oct 2024 12:06:59 +0530
Message-ID: <20241019063659.6324-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0XZDcDQFlDPoJdddZd9MntHUrVwVkUKF
X-Proofpoint-ORIG-GUID: 0XZDcDQFlDPoJdddZd9MntHUrVwVkUKF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=610 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410190045

Add UFS host controller and Phy nodes for Qualcomm qcm6490-idp board.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---

Changes from v2:
 - Included the board name qcm6490-idp in the subject (Thanks Konrad).
 - 'regulator-allow-set-load' for UFS regulator has been raised in
   https://lore.kernel.org/linux-arm-msm/20241016100511.2890983-1-quic_kotarake@quicinc.com/

Changes from v1:
 - updated correct patchset number.

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
---
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 5f3d4807ac43..c5fb153614e1 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -702,6 +702,25 @@
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l7b_2p952>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+	vccq2-supply = <&vreg_l9b_1p2>;
+	vccq2-max-microamp = <900000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.17.1


