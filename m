Return-Path: <linux-arm-msm+bounces-37071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A2E9BD2CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 17:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0820F281FFE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 16:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5421D516F;
	Tue,  5 Nov 2024 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aPt89ZaC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FAE757EA;
	Tue,  5 Nov 2024 16:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730825410; cv=none; b=eZEo/2GDeDmQrAUIdBwgVXzuAlhaVi5Cnh0IqRjPdju1/F7NGCMmAwrGE0pLCgXSe+GeSZnG/IrFRmsBS1+tJ2D9rt9SBhQEXsv+R/tGbxyLhLaJMCXdUVGKb7gJGRUxzUrSxCTTx8UdNf6sIxwR3yECd712SMUzxuWeoilYQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730825410; c=relaxed/simple;
	bh=+jxQ4m6ojnVrIiZknRHhFL0zF8P3yTebntQLrmCEsQI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kcM/QQxs6gTZXiuolQeyWhpu7Q9XsP00Ft1fzk1OqxGzfxEAAyEWpEIh80Z/VpUnDFt3/IfmIyp+VimbpO+6wLdQZdUY4Rzu1krFKp2PIY6OS0FWEMs371PgwPSyqGFBB6ziyzh9NJc/b2HCpZoDVHHmmyYrY1joDtQUWx2TWyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aPt89ZaC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5A9Ooi004167;
	Tue, 5 Nov 2024 16:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m5RGJklFLLw78PcIGmBV02
	E4pThNNSclTnW8NqPbHCs=; b=aPt89ZaCUcqUVX5bBADcn6E02LO1fzhYFuyafD
	wBLfkevFzYn9E2e6FrTbi8iDLgfG2Vco583Y87Mh0VZ6IADRf2D6Ld/Gi2V+2Sc9
	cZB3v1nX1LAgU3i9gQObQmciL64cAb1mHhWPaZrXtvGm9jHmyaxZXFz/nafQwvvc
	7+FMxTnhOvUWCqyX4NpRUVtKof3q1AWKEV4XCSmcgu2i6qvJtZR1xJKtTYMpz9q+
	0tOoJikDuEqxlhzjeHEY35y2CtVyyTV2YSnDxFTGmFQn7+fX2zoJMQ4IYQYs4MAO
	59rTSbFM3OmW1qCA298rR/c+azEK7aKKPGLYtoFf+MMcheTw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qhbu959c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 16:50:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5Go3jD005760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 16:50:03 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 08:49:59 -0800
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
Subject: [PATCH v3 0/2] Add Devicetree support for USB controllers on QCS8300
Date: Tue, 5 Nov 2024 22:19:44 +0530
Message-ID: <20241105164946.2357821-1-quic_kriskura@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1lGUtp05zZ_HwvX5NHgX2qi9KO6YAYIp
X-Proofpoint-GUID: 1lGUtp05zZ_HwvX5NHgX2qi9KO6YAYIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050130

This series aims at enabling USB on QCS8300 which has 2 USB controllers.
The primary controller is SuperSpeed capable and secondary one is
High Speed only capable. Both the High Speed Phys are Femto phys and the
SuperSpeed Phy is a QMP Uni Phy.

Base DT Support has been added for both controllers while only one has
been enabled on Ride Platform. The primary controller has been configured
in device mode. The secondary controller will be enabled in host mode post
addition of SPMI Node which allows control over PMIC Gpios for providing
vbus to connected peripherals.

This series depends on the following series ACKed by upstream maintainers:
Base DT: https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

Bindings patches posted at:
https://lore.kernel.org/all/20241009195348.2649368-1-quic_kriskura@quicinc.com/

Link to v1:
https://lore.kernel.org/all/20241009195636.2649952-1-quic_kriskura@quicinc.com/

Link to v2:
https://lore.kernel.org/all/20241011074619.796580-1-quic_kriskura@quicinc.com/

v3 has only been compile tested since only cosmetic changes have been done.

Changes in v3:
Updated commit text for patch-2.
Added dwc3 controller quirks that are applicable.
Fixed nits pointed out in v2.

Changes in v2:
Added quirk to use pipe clk as utmi clk for second controller.
Added wakeup source for second controller.
Modified commit text for DTS change.

Krishna Kurapati (2):
  arm64: dts: qcom: Add support for usb nodes on QCS8300
  arm64: dts: qcom: Enable USB controllers for QCS8300

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  23 +++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 181 ++++++++++++++++++++++
 2 files changed, 204 insertions(+)

-- 
2.34.1


