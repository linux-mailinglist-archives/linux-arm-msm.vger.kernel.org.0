Return-Path: <linux-arm-msm+bounces-65944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5A3B0C9F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 106291AA3FB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C622E264C;
	Mon, 21 Jul 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XYZ8wwlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09D02E1742;
	Mon, 21 Jul 2025 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753119971; cv=none; b=PNVtqDm6P3TUUklnHwki+RZ4fjCrGYABr1RfjimqVTZAvVAr+mnSWlhil3kojbABLNPjiV7C7MpKyIMtCFMEj6vAB3+dnROGFAGl5PVqM1GnulISwl4G4LCTwNHRBhKnLn9aF4CztEAYljgMLZyutVBh1Et0uNKCOsd3TmEnmPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753119971; c=relaxed/simple;
	bh=SjytDc8WlpvqjacFKfLPp6CVFWgNIvdU9cdms1oGaUo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P1Q7PGmCXjE+lXajWGoyXLH2KtGL+lmwW6TsBl7pzcdeZzvK75D8CJ4Zn1NWvh2gWlJcJGR5lo99g9ZDpLz/yORYRu4CZ77unweWF0llVDfBWYL0qNk5KPBsmBQ4gPY/T3V3lg8BiChkwdzWkXOKskl931Fd07+sO4bfPBMIsWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XYZ8wwlz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGTTnq000919;
	Mon, 21 Jul 2025 17:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=5dtR7qlH8D4LRg2XdKu+ZYf/tjmhk0aNzJDd0i2GGxA=; b=XY
	Z8wwlzP/xhEbzqLGMslC2MIncFnOQ+vNsyLcnBkDklXnnV3o/WBFZ5/9K+iUO4Go
	xzA4swAtyzsZM0wXbRWfYMFdin2cPxbZUbADb/a8dstSWAPi/0JiCoY03Y/eA7Fx
	1I6YjaO6OXt6XefSXGH7LhWpm0WPSsRL3gxQJ/z3q+IdzU7xIRXfrwWxPrUv+UA4
	D9Bw2RKFpCji+zrTngMTD97XxIisirOzakLAPm9Yox6+xF8vamt05pNPQnwIPfpT
	BPpVJrgxZCZNGK3y+VEArX4bX6lPaMatTvner9H6O/y2YlW4IwzBVrWwILtzAigp
	i7YKjrKqDd6TSgkFYGfA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044degsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:45:56 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56LHjtWH000861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:45:55 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 21 Jul 2025 10:45:50 -0700
From: Praveen Talari <quic_ptalari@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Praveen
 Talari" <quic_ptalari@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <bryan.odonoghue@linaro.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_cchiluve@quicinc.com>, <quic_shazhuss@quicinc.com>
Subject: [PATCH v7 0/8] Enable QUPs and Serial on SA8255p Qualcomm platforms
Date: Mon, 21 Jul 2025 23:15:24 +0530
Message-ID: <20250721174532.14022-1-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687e7cd4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=wPpz0gULE6-aHRqVbM0A:9
X-Proofpoint-GUID: VGAt20fRZM2vLkEJaoOEvzWmqcQTAbAa
X-Proofpoint-ORIG-GUID: VGAt20fRZM2vLkEJaoOEvzWmqcQTAbAa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1NyBTYWx0ZWRfX9XT1HDrcxPkE
 ssMUc5tzCQEKIWTRwvdjo1RiZ/iE7lJl72HA1PK/yeSLHsdBlWCEr0Gz6lx1r4TGpm0v6iUbtSZ
 kFljE8RewDlBnmVhTEyVMRgdA9jjU+FX78WQkdRjCJ8WtqAvZvbkizmWaJQxI508DNxRNmTOb41
 vgBE1cK/QJkwI9cXQ/PkRKcOFTs3toh5gzcLYyScwmg2jg0S3Rh3ayOun+vmYUwVpqgdPi++5tm
 jT2SsPkstHktoKx2fS1UXM/rEewsMHBSNBdTZxtNjmu5BfUYIteiZprzTE+xzAe/wWsq0sCZc0M
 zTpbZsrDnozk/kB8rIKb6HeQO1l7Hb7EI+kmVTh/so/KU4uSPzxXvz27DGtGU+4wBOgrDuDV3p3
 2Yl+XchrCHJcjfbeK41F+5gP5vKYd+F+h5DKXaCs8i3C19NwteDpkjXoIkHw0JtyNpRugyIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=790 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210157

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM. The device
drivers request resources operations over SCMI using power and
performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages UART baud rates, with each baud
rate represented by a performance level. Drivers use the
dev_pm_opp_set_level() API to request the desired baud rate by
specifying the performance level.

The QUP drivers are SCMI clients, with clocks, interconnects, pinctrl
and power-domains abstracted by a SCMI server.

The serial driver has a dependency on the dev_pm_opp_set_level() function,
which is applied in the OPP tree's linux-next branch.

Nikunj Kela (2):
  dt-bindings: serial: describe SA8255p
  dt-bindings: qcom: geni-se: describe SA8255p

Praveen Talari (6):
  soc: qcom: geni-se: Enable QUPs on SA8255p Qualcomm platforms
  serial: qcom-geni: move resource initialization to separate function
  serial: qcom-geni: move resource control logic to separate functions
  serial: qcom-geni: move clock-rate logic to separate function
  serial: qcom-geni: Enable PM runtime for serial driver
  serial: qcom-geni: Enable Serial on SA8255p Qualcomm platforms
---
v3 -> v4
- removed patch "[PATCH v3 1/9] opp: add new helper API dev_pm_opp_set_level()"
  from series and serial driver has dependency of this API which is
  applied in the OPP tree's linux-next branch.
---

 .../serial/qcom,sa8255p-geni-uart.yaml        |  69 ++++
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 107 ++++++
 drivers/soc/qcom/qcom-geni-se.c               |  13 +-
 drivers/tty/serial/qcom_geni_serial.c         | 338 ++++++++++++++----
 4 files changed, 452 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml


base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
-- 
2.17.1


