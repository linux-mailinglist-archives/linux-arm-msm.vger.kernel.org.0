Return-Path: <linux-arm-msm+bounces-49431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E29ECA45764
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475AB3AC09A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 07:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9E0226CE5;
	Wed, 26 Feb 2025 07:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MCrKoQHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BA5224256;
	Wed, 26 Feb 2025 07:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740556544; cv=none; b=BetRSvTgBALiDHKzwn9MlZ7Wn83T9WeyyzAP36ANOBSnQ7O7S8sIQXNjNzKKonMJKrEy6RuRrF2AKtcewntElFf1a2xis485ZX+JReZUZ1AuClObqLOkzY2UbZEw2ZN+cUjWivGIv8vEDnUZ62mBZPy4LsH9B4OtjNEZgspFHdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740556544; c=relaxed/simple;
	bh=NRlj14kFguGsKFs1U+BZcL7N6BZrHArBmVTKLQzEMOI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lQQdNQGtwADWpIyZ7Cw6upH9lrenGNF2xRPef2aost640FZxbCpNLpKXG5ZJ14fkwUd46I1N2HPlCkhdeo+FA5glbPzLap5nqGQdR+5jBeWEd5jLSKi7MTPkvEWtVVrPDq7unyMgzcfr5E8o/Xk990IzL8Rhm8xIs+FQuzgPUu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MCrKoQHI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMWoTC012154;
	Wed, 26 Feb 2025 07:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zsizWtkjWm8qfJrKiO1Lvb
	oF9dMVTu0yxG98B7uMums=; b=MCrKoQHIqwPrlJC7WZDl+mr/IZPFM7ihfneyMh
	Tl5rtGOvByKYdfDqcId4Vlf/f+Qpo27dMeDS7fBzPNDjc4m/p+ZNRJFnRzd9xwX8
	KMPX9m8dvDeQNpysEQRQQogesfQ8dDfNRud8Pw9PbfufZloRh6gFXYfvGscQnQxo
	ZwkECetKEFRVxLBuENC/+jAoGHkmY0B5fV7OauC4b3O2NjEMN+rKZxg6tBdYdRS+
	kYDMHj5hBGiF6lJ1aRWsGazflEEKIq/967D1sFWTp6sMi4EbLjcEBsBSGhw0ULxu
	7sXRfKWMe1x9wOVDj4RMKfVXfLlmn+JcdW2LzkDJctekR6lQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk162s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:55:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q7t7It019976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:55:07 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 23:54:59 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <biju.das.jz@bp.renesas.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <elinor.montmasson@savoirfairelinux.com>,
        <quic_anusha@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v11 0/6] Add NSS clock controller support for IPQ9574
Date: Wed, 26 Feb 2025 13:24:43 +0530
Message-ID: <20250226075449.136544-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: 969BKY-qV7X_FsjZC1JBdLynRMT8gQ25
X-Proofpoint-ORIG-GUID: 969BKY-qV7X_FsjZC1JBdLynRMT8gQ25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=927 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260062

Add bindings, driver and devicetree node for networking sub system clock
controller on IPQ9574. Also add support for gpll0_out_aux clock
which serves as the parent for some nss clocks.

Changes in V11:
	- nsscc dt-bindings
		- Renamed 'nsscc' clock to 'bus'.
	- nsscc driver
		- Added the 'pm_runtime_put()' API in the qcom_cc_map()
		  failure case to decrement the runtime PM usage counter.
		- Added the 'bus' clock to PM instead of 'nsscc', as
		  'nsscc' has been renamed to 'bus'.
		- Added dev_err_probe for all failure cases in nss_cc_ipq9574_probe().
		- Updated module description to use the full name
		  "Qualcomm Technologies, Inc." instead of the abbreviation "QTI".
	- dtsi
		- Renamed 'nsscc' clock to 'bus'.
	- Fixed review comments from Konrad.

V10 can be found at:
https://lore.kernel.org/linux-arm-msm/20250221101426.776377-1-quic_mmanikan@quicinc.com/

V9 can be found at:
https://lore.kernel.org/linux-arm-msm/20250207073926.2735129-1-quic_mmanikan@quicinc.com/

V8 can be found at:
https://lore.kernel.org/linux-arm-msm/20241025035520.1841792-1-quic_mmanikan@quicinc.com/

V7 can be found at:
https://lore.kernel.org/linux-arm-msm/20241009074125.794997-1-quic_mmanikan@quicinc.com/

V6 can be found at:
https://lore.kernel.org/linux-arm-msm/20241004080332.853503-1-quic_mmanikan@quicinc.com/

V5 can be found at:
https://lore.kernel.org/linux-arm-msm/20240626143302.810632-1-quic_devipriy@quicinc.com/

V4 can be found at:
https://lore.kernel.org/linux-arm-msm/20240625070536.3043630-1-quic_devipriy@quicinc.com/

V3 can be found at:
https://lore.kernel.org/linux-arm-msm/20240129051104.1855487-1-quic_devipriy@quicinc.com/

V2 can be found at:
https://lore.kernel.org/linux-arm-msm/20230825091234.32713-1-quic_devipriy@quicinc.com/

Devi Priya (6):
  dt-bindings: clock: gcc-ipq9574: Add definition for GPLL0_OUT_AUX
  clk: qcom: gcc-ipq9574: Add support for gpll0_out_aux clock
  dt-bindings: clock: Add ipq9574 NSSCC clock and reset definitions
  clk: qcom: Add NSS clock Controller driver for IPQ9574
  arm64: dts: qcom: ipq9574: Add nsscc node
  arm64: defconfig: Build NSS Clock Controller driver for IPQ9574

 .../bindings/clock/qcom,ipq9574-nsscc.yaml    |   98 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   29 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-ipq9574.c                |   15 +
 drivers/clk/qcom/nsscc-ipq9574.c              | 3110 +++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9574-gcc.h  |    1 +
 .../dt-bindings/clock/qcom,ipq9574-nsscc.h    |  152 +
 .../dt-bindings/reset/qcom,ipq9574-nsscc.h    |  134 +
 10 files changed, 3548 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
 create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h


base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
-- 
2.34.1


