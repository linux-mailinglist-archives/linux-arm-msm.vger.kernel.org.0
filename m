Return-Path: <linux-arm-msm+bounces-41390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD03B9EC1CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 02:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48BE0188AFD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 01:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0001DF25A;
	Wed, 11 Dec 2024 01:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LXD0rmE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84891DED47;
	Wed, 11 Dec 2024 01:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733882359; cv=none; b=DFCiOTJ8ylEiNMlifycFEnZ/jYn7a+2/J/2wnkNDlTMyaSSVTvH9gpxvQplYeATAV+fcZOxvl+wb4E7CojMzPX7tefV/GXUWXAq0cFIzvDtjqYbTLMPteWFnyND/EXSH8IhOR2yU1Fap17i4JCQeeo1HAphjlIrU9PkilrgpLsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733882359; c=relaxed/simple;
	bh=Qin8aGcUZb8vNzoOZBdj9PnK2Rh+bnYpjrtsl+gWVD8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=fFbohoSB+6UA87nO2KRtdXPxIzScc+Y5ofetw6ociaSB7fmFJlcsAqNXKqiZLh5QyUP6+t4OirCRWt2RLeYrH3sKLvISV1fSrJRLQ9ezn51Ljm1D56mYblaS4aYV80P8WNH34jrM/mi1GEYpzZyAlrG/nHg7WUWjbQwB2wymtW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LXD0rmE5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMLvmF018051;
	Wed, 11 Dec 2024 01:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ognURcBK1+7hoSJ7P6ej1u
	5vSlt9elZKquIVaB6LhqM=; b=LXD0rmE5MowQuUdbU3R668Guz7Ng7nM6o7Wy7V
	YAhrxo6nL9tt1PU4sDkXut1ZxDFijAc4AVh2HlIfU+v9VGZ8ezxFqp7woq0XfNnG
	XpTMdIZZNw2G1t6HndAaSaEFSOr71hmQmU0TmUG9vlS8bw1+31jnlpHfjJrJ5TPS
	5TCG/ejyVdN0Af3resVdg5CQUyp9TjmmhnJM3lhVViOq+GXX2FSLskn0HBLoJBXk
	QagJ4zm3+CFMZNh09z5dNgUHWdVIS6M9Tjjcx3EX4ft868hrGR/RgGlhm3sK00u0
	AJ58FeIWwW8D0/TmrcHhodn/CL4QzsipPbS8L6jb4nkOoU2Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak3bw10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 01:59:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB1xDhQ025678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 01:59:13 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 17:59:08 -0800
From: Song Xue <quic_songxue@quicinc.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add DT support for secondary usb on
 QCS615
Date: Wed, 11 Dec 2024 09:57:56 +0800
Message-ID: <20241211-add_usb_host_mode_for_qcs615-v1-0-edce37204a85@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKTxWGcC/yXNSw6DIBSF4a0YxiXhouJjK40hwL1UBkoFbZoY9
 15Sh98Z/OdkmVKgzMbqZIk+IYe4FsCjYm4264t4wGImhWxAAnCDqI9s9RzzrpeIpH1MenNZQcs
 VeLIgvbEoWEm8E/nw/eef0+1E21Fe9ntk1mTiLi5L2MfKSyt65d3gRT10Xd00LUolFDrVohMDk
 IO+Fp5N1/UDT0+/sroAAAA=
X-Change-ID: 20241211-add_usb_host_mode_for_qcs615-61feb12fabd0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733882348; l=1089;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=TqlTX0bLEfiSPxAFrw520lc7bqKnFJ7oWldk8b4i/M0=;
 b=55MaLgjlOLvC2jPxz3eQGxepRZq2OQoqrES/0d1B8M9+zMl/mcv3/jgyimU7VuI+SJPK6O/r4
 EKWMoVOLsB7BliRJWmxHf9n9Cz2VKOI/jaBIsg7w5Uu/dz3Mon6wxId
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RUfW_0sVQa-Z02FFmy4doqvgRO-pBXM_
X-Proofpoint-GUID: RUfW_0sVQa-Z02FFmy4doqvgRO-pBXM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=666 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110014

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

These series aim at enabling secondary USB on QCS615. The secondary
controller is High Speed capable and has a QUSB2 Phy.

Base DT Support has been added and is enabled on Ride Platform. The
secondary controller is enabled in host mode.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
Dependencies:
Link to bindings and driver changes:
https://lore.kernel.org/all/20241017130701.3301785-1-quic_kriskura@quicinc.com/

PMIC DT:
https://lore.kernel.org/all/20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com/

---
Krishna Kurapati (2):
      arm64: dts: qcom: Add support for secondary usb node on QCS615
      arm64: dts: qcom: Enable secondary USB controller on QCS615 Ride

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 28 ++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 76 ++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)
---
base-commit: f2b086fc9f039773445d2606dc65dc091ec1830f
change-id: 20241211-add_usb_host_mode_for_qcs615-61feb12fabd0

Best regards,
-- 
Song Xue <quic_songxue@quicinc.com>


