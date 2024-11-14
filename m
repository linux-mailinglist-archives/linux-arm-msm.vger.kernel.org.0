Return-Path: <linux-arm-msm+bounces-37876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3C09C8428
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 08:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A396C281771
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 07:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052831F12E2;
	Thu, 14 Nov 2024 07:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n5ojcF45"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557A533CA;
	Thu, 14 Nov 2024 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731570479; cv=none; b=tijM38zOb+8NuFQtQZE8BEZmvr91oCB3XaMB+RxSPrtEjzsAT2/w+SctGWHwozmfmrqPK41rQtfSiVcUVXEzS7PZcaS0iB4OJuDNRsuFbGuYM0t9YLqdo30y5igUxJochQL0CJ5eJrD/D7Re29NoYNfF6UP8t+EtYkJPlslMzQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731570479; c=relaxed/simple;
	bh=irj4ImSZhIion7Z5JPQfU/mEzBgBkLCISDCpwV4fDyo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H4g00Q0s4uKnMyioBZll8K4a5nmcipAjsZIqTeD/DSwjAcoijfms1eCaWMym8cqPewWA120cTYB2Dszda4Y8pVs2vT4aruoWkVT6aqmgnDRPzuZhVN6n4Gy6wpJsB7AZEY24Vt3eUuQIRgyn++OmUI2rIgYUEIvsMZ6xW5h1qNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n5ojcF45; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6l07m028186;
	Thu, 14 Nov 2024 07:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=38K9nBITMijp41NngptL//
	/a/AQlhrt44KQIiSWz4HU=; b=n5ojcF45s9FTv+GWcuW6Ukis47vUMvgY3kM/5l
	2RlHO0l21+QuKpEe6PNT7ZiEmtHtlkPC0D5T/Bq6Z0dz9fkTvjHEBKF87ApVd005
	ubGfqLYcc+CjZ2OcCHaH/aSaKTCEI7MTOS/ov+rRtSTAPHz4IghpLnOdwqTK3loE
	oWeuAn3GbOk3M5VBPkaQ/vQeg+D9RxVaLModna95p83PwC9zhpICr7sCerQD1j3N
	q9a75I4Whzr3EOIXBt99rSv/HzWLwOKTqDOySK/5VtQqcS79wFM0TBmHKzQcS/Ar
	B3JAKTuDal0ykn4SCbI0hyadx6C0kzZ2coYp1cD1Muz9RKNw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w10jtf94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 07:47:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE7llhO027156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 07:47:47 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 23:47:41 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <mantas@8devices.com>, <quic_kbajaj@quicinc.com>,
        <quic_kriskura@quicinc.com>, <quic_rohiagar@quicinc.com>,
        <abel.vesa@linaro.org>, <quic_varada@quicinc.com>,
        <quic_wcheng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH v3 0/6] Enable IPQ5424 USB support
Date: Thu, 14 Nov 2024 13:17:16 +0530
Message-ID: <20241114074722.4085319-1-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WToL0mJjIcg9z2jn3qR4P1JUbQdutFuI
X-Proofpoint-GUID: WToL0mJjIcg9z2jn3qR4P1JUbQdutFuI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=651
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140058

The IPQ5424 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
can connect to either of USB2.0 or USB3.0 phy and operate in the
respective mode.

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


base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
-- 
2.34.1


