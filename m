Return-Path: <linux-arm-msm+bounces-38155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F869D08D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 06:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A0D6B20316
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 05:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F77B13C9B8;
	Mon, 18 Nov 2024 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ou9PHM6G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69D013A863;
	Mon, 18 Nov 2024 05:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731907749; cv=none; b=qnH/VUPO57+0uTfiKlvmp3Z/qCJd/fGOjVfsidHUl/fQ1x51JfYtKIqn37SDXpe5z4G+kdqZIV3ASQmOeCkI3Mvk1KhrdUQpUa6u4Xq1Lj+Fe1lqjZROrVKckUmVdKMkMfyGIDoqUkDyv6FeGlCrqz5PdAizi3RuptteqvtGNJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731907749; c=relaxed/simple;
	bh=kafwhTmqxxkxJfUeVx/8s1zWhgfrRKyVJu/EHmabrsM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=INVsim+XIZzlWirqExFpGOAoYv5ZMzxSrF1PPBzfBABGm4isWYtiAiVLGyR2IC0RftCOy4CBR3qXboPz0tsWSZV0S/hiQJTa/riOAUIjFefCaxMF9hMz1L3cflLUNc/CPmd3ojlzp2qKosEJsXye68a7FiqPUHycsqHRYx3u4BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ou9PHM6G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5RdYR020043;
	Mon, 18 Nov 2024 05:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pwZBh2RtGY9XMlaWBuSL6g
	ry5U44OKq8gOb0pkJc/zQ=; b=ou9PHM6GG8GhJGVl1F1KRWsR1rrd2MVHWLQ784
	4iRSH2KcXW9tUB0V7AkkK+5L76O1PhNqbHz+7pc/0LZQUYa6kNv8TZ0Mxl+oZUH1
	Dhduwtcniip2tTAlRAYYQrdcNGnGbYplGiTzNbcohzsS0oHrmUuPFDi/7YtGv1KC
	IZqQr/9AzGGFb6LEEtlAkg3BruG2nPCVvnZrv/Y6VpFFZpxmJDvYFjZAsvsrzsCM
	wrzQEKkRqstsZW/hDj1hfpkVFThWZIiBTlqmXwzjwKZFBNa06rtVHrUPDQqTfvME
	Iv2rclw+QzbuYfe+7yZ2UquX3AtQGu5gRY2TuwbCIXi5OLxQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xksqkfux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 05:28:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI5SvKK004184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 05:28:57 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 21:28:51 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <mantas@8devices.com>, <manivannan.sadhasivam@linaro.org>,
        <abel.vesa@linaro.org>, <quic_kriskura@quicinc.com>,
        <quic_rohiagar@quicinc.com>, <quic_kbajaj@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_wcheng@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: [PATCH v4 0/6] Enable IPQ5424 USB support
Date: Mon, 18 Nov 2024 10:58:33 +0530
Message-ID: <20241118052839.382431-1-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jKxq4ZRDHj_iPZeYKlei5NIlD3r3-bZg
X-Proofpoint-ORIG-GUID: jKxq4ZRDHj_iPZeYKlei5NIlD3r3-bZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=700 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180046

The IPQ5424 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
can connect to either of USB2.0 or USB3.0 phy and operate in the
respective mode.

v4: Fix regulator names to match with other Qualcomm DT files

v3: Added reviewed-by to one of the patches
    dts: regulator node names changed

v2: Added acked-by and reviewed-by to few of the patches
    Changed uppercase hex digits to lowercase
    dts: add more interrupts & quirks as suggested in the review

Varadarajan Narayanan (6):
  dt-bindings: phy: qcom,qusb2: Document IPQ5424 compatible
  phy: qcom-qusb2: add QUSB2 support for IPQ5424
  dt-bindings: phy: qcom,qmp-usb: Add IPQ5424 USB3 PHY
  phy: qcom: qmp: Enable IPQ5424 support
  dt-bindings: usb: qcom,dwc3: Add IPQ5424 to USB DWC3 bindings
  arm64: dts: qcom: Add USB controller and phy nodes for IPQ5424

 .../bindings/phy/qcom,qusb2-phy.yaml          |   1 +
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |   1 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts   |  66 ++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         | 159 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |   3 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c         |  28 +++
 7 files changed, 260 insertions(+)


base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
-- 
2.34.1


