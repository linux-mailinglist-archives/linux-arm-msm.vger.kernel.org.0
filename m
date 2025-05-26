Return-Path: <linux-arm-msm+bounces-59374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDDCAC3905
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C66AA189174C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 05:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032211DED66;
	Mon, 26 May 2025 05:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cFPlsg7z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1451DED5D;
	Mon, 26 May 2025 05:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236957; cv=none; b=UZvZxeAmKK0xbVaEkjQ7CjiDM3FcPbYhvl6PUqGB6bfoH5JY3FvDttBa33OBQb/7lx88LKiiHEk4OE0cprcf4mBTxLUkOUpaUrbP/+CR+YxdzaoALXWGXg0tDzH2lx7TSEWH7xtYadKXa2A4QpQ7Q7piHzvKvg0RtKmLsz/YQhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236957; c=relaxed/simple;
	bh=WbclKrKNpH+XumO8udCZ+WnQuj7DovTwmfHCDYT4Vbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oxbbDNiYHvMlG63/atF5Qf8nLiFvmCpLe8/FSgS3BUX12J7MI+Fk12Q5E6Jwrz4HzrVFhfYnH+BT0RL6MOOC4pzAAt0Lti/SkhlVhD64+5oSuUbFHdLVpfNwF2z/Y2VaUpCdAJ2wBVlpqLaUNbr1fIUe3HX/s031M9ABmgN2F8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cFPlsg7z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNSv0Z030632;
	Mon, 26 May 2025 05:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xgZgVXFHKNEqF2MV79SagmshPphfRqIpWisK7VReKk=; b=cFPlsg7zsQ7ESr7E
	mT2cSXXRIdPPdcEIStqFkMJyLBV780LR29/dEmyMmunOVx21WFwdhhTCo4auF0ZG
	S5XJU8xSmmYzE4Kp8AHXU6MmBZoqN3qut1Fa7enid5oC0/M/7V79/3+JCAUTPnGj
	utlU0g3Kp2PhGmJGqOxJtyy4CDAxhaKcykTC+Wwn41vVjrl1KDsEkWHuvPdJViX6
	b6cs7knPzjAXxwmve3dAsXYsxniJOCWAYHTeZNm/TaRGwTf5bSxvrBm2MlUdWTzI
	FXt7YU3XfKFrJMQjDvP8jQ7nYNkTy2VlikaeoLjJHGNWV+/IyNyE3XycO+v9bjph
	jy0ZFA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5q1u1ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q5MUAE023684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:30 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 25 May 2025 22:22:24 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 26 May 2025 13:21:52 +0800
Subject: [PATCH v4 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250526-add_qcs615_remoteproc_support-v4-6-06a7d8bed0b5@quicinc.com>
References: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
In-Reply-To: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748236923; l=980;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=WbclKrKNpH+XumO8udCZ+WnQuj7DovTwmfHCDYT4Vbo=;
 b=9nCoEAijqSv7wjSjsUe6+n1WYuq3TRVJN1fOKNcLVyrKnGa+2qlMWc6xX4P3qzFy45838St7v
 VW3JXHoB9ilCgrdy/QZXKhBh7Xcc8zHQHcnsbiMwnZcufcffjQD3BwM
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tRTrA4B9BM9E5SVoOEaenfIEZgFhCUax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA0MiBTYWx0ZWRfX8usXWeq9ADMM
 h77ArXRu1o4aWJZvgcIYR7OqEE2517nFN2KP7DqSWG5Yvrjh2rvCn7JGapICnfcKAfar7tuYGoO
 htpYxsu6Ka8Qf6KpPOmIr1Bqq3ZTXvhKUIOJkyWex3nMNMnM41ZVThgdWVjjY6rKkS4dRvCpDmR
 tJbbiD3x9cLDSYnEsppT2uOvsCRhzvQoaCXSih5q95DK5s8eH+03qasaCkIMlB0yA1uGfew/TpF
 ohu+GSAKGwmxH3vbXN6fNf7og69yiBGZzu20FtikpeOYLS5h/aI24EMSkxi5mgk67v1CHaItKB4
 VatQFiI94bRLrhfUH7liaN3/yq9q8Em99MQZoS840lENuBj2p2IqHrsLAaBDrPgXD6I0V/krm1k
 dFUgETC6wUE7wVf/GXnWTu1WKZ6gMDTiu3QkdA4B6Wzvrmk9YHjCF0cZiIT6nW4yRP0I3bOZ
X-Proofpoint-ORIG-GUID: tRTrA4B9BM9E5SVoOEaenfIEZgFhCUax
X-Authority-Analysis: v=2.4 cv=FLcbx/os c=1 sm=1 tr=0 ts=6833fa97 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=tk-iKo2JpmutBzwaR1gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=638 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260042

Enable all remoteproc nodes on the qcs615-ride board and point to the
appropriate firmware files to allow proper functioning of the remote
processors.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867676bda59ff82b902b6e4974126f8..a6652e4817d1c218c7981b04daeb035e2852ac1a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -240,6 +240,18 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs615/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs615/cdsp.mbn";
+
+	status = "okay";
+};
+
 &rpmhcc {
 	clocks = <&xo_board_clk>;
 };

-- 
2.34.1


