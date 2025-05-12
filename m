Return-Path: <linux-arm-msm+bounces-57576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8BEAB2EA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 07:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C50BA174A3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 05:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAB4254AF7;
	Mon, 12 May 2025 05:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ntnQHA6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE98119E7D0;
	Mon, 12 May 2025 05:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747026320; cv=none; b=hEL+41NMeveHeGKfQAdQ0sRsIdh8Mw5yhh1hEFTXNS/YIQCZTN8/c97nCHMQqew3o04yeF38QpMd/ZiA02sfPLYGQ6i4F2GCiXw7MCGd2anKbQ2kpyAUT5EmxXsJoEFRRdgDzCxSowung59wynDP4zt6dK9fHohLsXb2H1ibdcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747026320; c=relaxed/simple;
	bh=4l5mMbrbOHfrWNsTlg/M29+ecYs8JgPVjHQqSHsH/dI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=IpGmUy7Sa4+9CoGyBjRx4u84kSHxqVyeDrAbX3YOOBpSN6fXn5fm95VSTzy2xfmpuSidSJXJeoCp0qlu+XfgxjTuaYZ0CRONsiyJPV5Pe3uaDGn5O3ujdV3MQ3FvoM0hCuIX2juFwkOFUhwJQC7nM8pC3BSqIh8CEMlGo/3aeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ntnQHA6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BNfkjZ019765;
	Mon, 12 May 2025 05:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z/KCFuR9lj98At0wk6y+rC
	I5SbZS16idRvne1dbTV1k=; b=ntnQHA6zUv0FTrJirUW34AFE9LoRet5P8wZGSo
	au2o7B0gR6wbBa1jSK5aaZpaUj5kXfBN4YohkL/m2qJSBIAOVi62f1Y5Gjr144sB
	CIxraMCD0rHFPBk7OLfj5txZD7ZpXuyynsqnfgSYa3FtOLyiYfJkI4in+PQkkoss
	YFRsv/M+slKpjK8XHYT9gUp6gUyYsUIhl9SUsAhK52OAgSXpPY7M92dUONJmntp5
	s/R7g+3zJXdlsEkwlfOYLQfpW7skqVjdnkk2zl0EvVx5d78Mjz98/k9usmL7nzgj
	JDo8BMVY+lHsIM2gs4nzDhNHSfcBbv/wrj8ag4Et8HBaUITw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hxd1k442-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:05:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C55Awn004789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:05:10 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 May 2025 22:05:05 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v4 0/4] clk: qcom: Add camera clock controller support for
 sc8180x
Date: Mon, 12 May 2025 10:34:35 +0530
Message-ID: <20250512-sc8180x-camcc-support-v4-0-8fb1d3265f52@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGOBIWgC/4XNSw6CMBCA4auQrq3pi9K68h7GRTsU6ULAFgiGc
 HcLGzWGuPxnMt/MKLrgXUSnbEbBjT76tkkhDhmC2jQ3h32ZGjHCciIYwxEUVWTCYO4AOA5d14Y
 ea6PSviiZ4Rql2y64yk+be7mmrn3s2/Dc3ox0nf4TR4oJlppKKkrKKyLPj8GDb+AI7R2t5sg+H
 E72HLY61tqcikrIAn4d/nZyovccnhxBNBhlq1Ja9e0sy/ICpUQt0EwBAAA=
X-Change-ID: 20250422-sc8180x-camcc-support-9a82507d2a39
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA1MSBTYWx0ZWRfX1tMPDwpyPqeG
 9kNajn5zQZN2jiaEAcrlwQGGPrxEL+dgw0orpN7/5xhOi+zLHXLZDF9OEDpF6fYz5Ayh1cghIiY
 OFgklEz2S42EZZfEvlEoiqZIen3/Cf3/j5K6OHT9IRFaMs6g6NlTVOlgG9zl+qwP1KK7cSoK4yA
 hDMLvY/Vn/ujvWQL9nBeNKCWg/oKibzTX7iAvFOy/6KZKXNhyDaHzP/HE5ThXBREyNYBSGHpFqd
 g52HxfUEZfsJBwUZbd9Z8m8LC9cswBkeR1rsmE8HYcgrPTuU3FFFnDbfniWtjI0BYXQrbncsJNg
 JjtRaXo2oC2VR0H4NpVitxOOG07WaBU1+viz/VPr7LF4XUFhXMWe9j4cagwt3D9adD0iZzeH4+T
 2IteFm4iu4CdupwrkIRXbEsY80tAo3+XYNb/nDA6gcFyD2ZkxV25fuEzNicEiTEYXhxFR+zj
X-Authority-Analysis: v=2.4 cv=ObSYDgTY c=1 sm=1 tr=0 ts=68218187 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=k7QFFA99Od7ZzaYUATkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VagA4Zi2SQL4icvqU7scwLV1Be-rL1zK
X-Proofpoint-GUID: VagA4Zi2SQL4icvqU7scwLV1Be-rL1zK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 mlxlogscore=856 phishscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120051

This series adds support for camera clock controller base driver,
bindings and DT support on sc8180x platform.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Changes in v4:
- Drop the stable kernel tag in patch [1/4].
- Link to v3: https://lore.kernel.org/r/20250509-sc8180x-camcc-support-v3-0-409ca8bfd6b8@quicinc.com

Changes in v3:
- Drop Fixes tag in patch [1/4]. Dropped unused gpu_iref and
  aggre_ufs_card_2 clk bindings.
- Move the allOf block below required block in bindings patch.
- Remove the unused cam_cc_parent_data_7 and cam_cc_parent_map_7
  in the driver patch. Reported by kernel test bot.
- Link to v2: https://lore.kernel.org/r/20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com

Changes in v2:
- New patch [1/4] to add all the missing gcc bindings along with
  the required GCC_CAMERA_AHB_CLOCK
- As per Konrad's comments, add the camera AHB clock dependency in the
  DT and yaml bindings.
- As per Vladimir's comments, update the Kconfig to add the SC8180X config
  in correct alphanumerical order.
- Link to v1: https://lore.kernel.org/r/20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com

---
Satya Priya Kakitapalli (4):
      dt-bindings: clock: qcom: Add missing bindings on gcc-sc8180x
      dt-bindings: clock: Add Qualcomm SC8180X Camera clock controller
      clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver
      arm64: dts: qcom: Add camera clock controller for sc8180x

 .../bindings/clock/qcom,sc8180x-camcc.yaml         |   67 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   14 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sc8180x.c                   | 2889 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |   10 +
 include/dt-bindings/clock/qcom,sc8180x-camcc.h     |  181 ++
 7 files changed, 3172 insertions(+)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250422-sc8180x-camcc-support-9a82507d2a39

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


