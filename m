Return-Path: <linux-arm-msm+bounces-37073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0D29BD2D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 17:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E5A51C223B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 16:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B828B1DB940;
	Tue,  5 Nov 2024 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GKKjNF/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8F31DAC96;
	Tue,  5 Nov 2024 16:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730825419; cv=none; b=SCZKKVf2LN5Y9F2dB5O7jIGG1RtDtoeVFKCnDaeZsf1G5wGFFHky5rYXnqrnjoJzlDB+8ZqY2BNK7TnUFGjshmbfM1eBaLwC4hv83EQsseagP7F3l3u+RXRJkhyeG6x3X8s9tGotyQu17Pmz56Hb2oliVprIJfODXN7eF/08M4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730825419; c=relaxed/simple;
	bh=bmP6yTKNO4CU/ySIM4sbcPEtnsUto7baRVRmMxYXwdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J8++m6p0ckjSRXfN15s65u7LcsHBuu/9EcYdMetQGBxcojpozU7ypwRr//reuKSHdAbHLH1bVR9pjI3GjEh4nvJB+cZc3ez7b7RW1VUk60yAcgK4VH/J8jETCyBkryMg+4M9zLhTQJds5/b/CIi0/f6+sQJYLDhLtUUvJij+xeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GKKjNF/U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59Uk3t028847;
	Tue, 5 Nov 2024 16:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtStGag7Srw+W8e59JNtI3PyuyRYn79+MpofjU/CdyM=; b=GKKjNF/URE0+5KNy
	6gHT2FQ6ZJ0jDngQbrZZppmZWKgMMkqRFU5qlCsaCIjtoU7DMCOKeLr5sU2EPwrF
	UtQk+USqjE7nQXHRvQgI0jpPAZf3S09qab0hGXy7q4PQ22X+gARL01Qkl0taugKC
	mIATtGt2lyAxEdaqbOg9q3Z5goAmF0NSzCO/o2VdVLHqIkgUOx2KNN6MIRxjE+56
	35XLcksoMprj8TLk1+Y3Z7T0uV6wKiH+U+rqOJLh5LDNSD3kEtmKmk/pxfyd1c59
	aSOXkEie/SoiM9YXtvlVtLMsS9nrXYzh6Eo/yAnNhyBnQ0TLKSVz7RURsmwV9Y6Z
	RuEbhg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd288f3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 16:50:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5GoDnn005969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 16:50:13 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 08:50:09 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: Enable USB controllers for QCS8300
Date: Tue, 5 Nov 2024 22:19:46 +0530
Message-ID: <20241105164946.2357821-3-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105164946.2357821-1-quic_kriskura@quicinc.com>
References: <20241105164946.2357821-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-ORIG-GUID: rkNi-unHWI0Q20esCWyoIz-RHop1O-rR
X-Proofpoint-GUID: rkNi-unHWI0Q20esCWyoIz-RHop1O-rR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=494
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050129

Enable primary USB controller on QCS8300 Ride platform. The primary USB
controller is made "peripheral", as this is intended to be connected to
a host for debugging use cases.

For using the controller in host mode, changing the dr_mode and adding
appropriate pinctrl nodes to provide vbus would be sufficient.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 7eed19a694c3..3e925228379c 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -265,3 +265,26 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vreg_l5a>;
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l7a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
-- 
2.34.1


