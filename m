Return-Path: <linux-arm-msm+bounces-43584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE69FDFAF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 16:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA0E81882554
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 15:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF0A199238;
	Sun, 29 Dec 2024 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TjjIUwdL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F39197A92;
	Sun, 29 Dec 2024 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735485840; cv=none; b=NuzN5gromS+2aSxIbSyrqkjLBMakZjK76XufclVVP9yy+pB/kYhcy8TjlSiEAuDj+UsjXUPtFEj5qHhBOdVsuFuZFDrxtlaQ9rDnP0P+wt18jMkX5arUzxeEpBxgtcyqqtXsBmKr3OFfBEPCmGgL/ONp1xY+zM5Nu8wdSlWbHDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735485840; c=relaxed/simple;
	bh=68sqxqOe1Ebv3APnsAjOsaUFtNN/jikGHEt2mLGE1oY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nwa44JpRkbsz+oBfA9ltyn9wW/A6qJh58FypdBplEI61iXki0KqVUcgZPMbCXhf6mgU0yPeufKE4/LWbHLvtFGs+GUgItdHg4IdQkTZYj/NETUmEBHNc5XPMTuutOW2xzPTyeDjx6fxUoUQGEpPj8TYTuILdt1Bev4j3ygpEcHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TjjIUwdL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTDsHfa029475;
	Sun, 29 Dec 2024 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rh5r1TfKRrlG8XBxDs6GrkDbHWlIxYqrLg/
	ny11J7Cw=; b=TjjIUwdLFSu8Ay0jEGZim/enVxl1FxH/V/3dxM4JCBVSvSYQTNb
	sZb6hO29LpJmQCm+pR4CXRvjVvxGiYJS3hiSbGqfVqXRp1DNKYhmsfpqE8zI1nb8
	1aXtyOqJZ+XSh1EYzztiSOpHLotV647FKZEx+2p4Mk4b7Gn+647jj47mWJFTsUfi
	W26Mq5/By4aA/OQ2ldVQLWRdIbfxhHzj7BnXQU8nSx3hhrbsahIIzC0tI8ksMvgT
	ILjW+HOqkpVWSDUUhDoAg92emtTz/L98qIhJsz1XsM1GraRhVmKgksL4ZpHisZwt
	J8atJjQFr/yCwZUZZ8dYpvxQPeBUN+JYQTA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43t89qh4v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 15:23:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTFNaXW004492;
	Sun, 29 Dec 2024 15:23:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43tadkk58c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 15:23:36 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BTFNalv004464;
	Sun, 29 Dec 2024 15:23:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BTFNaSE004461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 15:23:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 15FCD59C; Sun, 29 Dec 2024 20:53:35 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v5 0/6] arm64: qcom: Add support for QCS9075 boards
Date: Sun, 29 Dec 2024 20:53:26 +0530
Message-ID: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _ArfkUcs_tNVflW9gZNWBovh4pbofMS6
X-Proofpoint-GUID: _ArfkUcs_tNVflW9gZNWBovh4pbofMS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=995 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412290137

This series:

Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC.
Unlike QCS9100, it doesn't have safety monitoring feature of
Safety-Island(SAIL) subsystem, which affects thermal management.

In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
does corrective action for each subsystem based on sensor violation
to comply safety standards. But as QCS9075 is non-safe SoC it requires
conventional thermal mitigation for thermal management.

Difference between Ride & ride-r3 boards is ethernet phy,
ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.

This series depends on [1] for thermal functionality to work.

[1]: https://lore.kernel.org/all/20241112-sa8775p_cpuidle-v1-1-66ff3ba72464@quicinc.com/

---
Changelog:

v5:
  - Remove defconfig patch as the config is product specific.
  - v4: https://lore.kernel.org/all/20241217064856.2772305-1-quic_wasimn@quicinc.com/

v4:
  - Replace dts to dtsi in Ride/Ride-r3 platform files.
  - Add thermal patch to differentiate between 9100 vs 9075.
  - Add proper abbreviation and update commit for 9100 vs 9075.
  - v3: https://lore.kernel.org/all/20241119174954.1219002-1-quic_wasimn@quicinc.com/

v3:
  - Fix RB8 board compatible string.
  - v2: https://lore.kernel.org/all/20241115225152.3264396-1-quic_wasimn@quicinc.com/

v2:
  - Remove unused dp nodes & update commit for ride vs ride-r3.
  - v1: https://lore.kernel.org/all/20241110145339.3635437-1-quic_wasimn@quicinc.com/

Manaf Meethalavalappu Pallikunhi (1):
  arm64: dts: qcom: Enable cpu cooling devices for QCS9075 platforms

Wasim Nazir (5):
  dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
  soc: qcom: socinfo: add QCS9075 SoC ID
  dt-bindings: arm: qcom: Document rb8/ride/ride-r3 on QCS9075
  arm64: dts: qcom: Add support for QCS9075 RB8
  arm64: dts: qcom: Add support for QCS9075 Ride & Ride-r3

 .../devicetree/bindings/arm/qcom.yaml         |   9 +
 arch/arm64/boot/dts/qcom/Makefile             |   3 +
 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      | 282 +++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |  47 +++
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |  47 +++
 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi | 287 ++++++++++++++++++
 drivers/soc/qcom/socinfo.c                    |   1 +
 include/dt-bindings/arm/qcom,ids.h            |   1 +
 8 files changed, 677 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi


base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
--
2.47.0


