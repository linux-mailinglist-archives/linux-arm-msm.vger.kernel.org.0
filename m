Return-Path: <linux-arm-msm+bounces-23035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A380E90D1F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA3C280E48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204A31AAE0B;
	Tue, 18 Jun 2024 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZK8I5vg5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854061A8C35;
	Tue, 18 Jun 2024 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718716475; cv=none; b=EOfcoOCeKdNxl2agA2kfT8V7Jqz8Zu8py/TrlvVjQ1wNNj4UZ4WAi83Yir9pQvSmxw7lrPQ2kFk9AU1BsqP64cNZwl0CjrhfccKjA8z8lpIeMq05j0kRu4oibDxWRJVT7NbilD5RPfOCU+p945mYa6ANLGuFMLRnLNS5wpLHwdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718716475; c=relaxed/simple;
	bh=BC53NUr5S1tyon6u7PNyp0ncpVxZDaFWVQC6lOvIsPs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hPaZypEGh3jNajjpcOrDbc/2H15p/cz3bRZQCODgZrBq/bQsHqndY43+gsLgU3PuIhUg3/QKhTZH6HhEIkG9LE0pPqFiTd1DAwBkvLH71WnvcvNfIpAGh1zS0dErd9dxVC3NSi5SsLCz7oSuWzX7KYn8QJ4oN2pASMFW24OCPWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZK8I5vg5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ICqk3F006324;
	Tue, 18 Jun 2024 13:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8AXDN2cjC6HX8I8LZqU07wi/8NyC63TdGCzNBVTdp1s=; b=ZK8I5vg58V0vpFMo
	S5Ow2t6OyniZdrZgZXpTnwk55v/JZc2XC8B4M7QcTEovtSuL1ruCuxizDSskpg8v
	VZOAvCnRyHrOC4uecJpUD7Ko7TFSvLgR9V1ESaRWV/ID4VXsijNNtBS0GdmP8bQD
	UmfO3kZskB1X7J48kUp6pxXJmMGFhIv10HJdvvmWkws+yqYinj7qAdE61ZYgh4eh
	bCwaFGQD1NvitBYS2VwX+dObKAMrBnH9mO0eVeBGVWg6bvJsP4JELVzrZPIR7m3i
	qylxp2ad1Q+TZc8HjBZlV3G2SIqHzsGQcl2t3gbeuXrkXaS1K+z23b1zntiDRW8R
	Kg2ZjA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuamp027t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 13:14:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IDETUx011985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 13:14:29 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 06:14:25 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 5/5] arm64: dts: qcom: sdx75-idp: enable MPSS remoteproc node
Date: Tue, 18 Jun 2024 18:43:42 +0530
Message-ID: <20240618131342.103995-6-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618131342.103995-1-quic_nainmeht@quicinc.com>
References: <20240618131342.103995-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YqdEQoviqlzHPjIV-l5s8QIuooM5FSL0
X-Proofpoint-GUID: YqdEQoviqlzHPjIV-l5s8QIuooM5FSL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=955 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180098

Enable MPSS remoteproc node on sdx75-idp platform.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdx75-idp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
index fde16308c7e2..f1bbe7ab01ab 100644
--- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
@@ -282,6 +282,12 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_mpss {
+	firmware-name = "qcom/sdx75/modem.mbn",
+			"qcom/sdx75/modem_dtb.mbn";
+	status = "okay";
+};
+
 &sdhc {
 	cd-gpios = <&tlmm 103 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_2v95_vdd>;
-- 
2.34.1


