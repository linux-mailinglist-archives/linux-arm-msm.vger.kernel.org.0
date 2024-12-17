Return-Path: <linux-arm-msm+bounces-42471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1CD9F447E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 07:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DC457A84C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 06:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136D81E231E;
	Tue, 17 Dec 2024 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O0phCf4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D74189B84;
	Tue, 17 Dec 2024 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734418157; cv=none; b=agzl/Bd+9BDw2TJtsOrmDZ3217ma6TpAMgiXXd7pL60J3f+3RY1mSD6b8VN83DdPfidwi4Xiw+1ZcYTVNXRNGeE/gwNZPakYz/ua2ZCMOS33OGcNgkDRdi6SxqpA6W9q52OS75SIUy54aBT6elHQLqmJBHnryN7dNe3SKyH1gU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734418157; c=relaxed/simple;
	bh=gWLqxnv9qvuBc0dYKUD7aLJxI6IDmoG+pm6o47Rutao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kPbBLudX7osQf6ge8xRg27AULcr1oDiWz7+MEUHtPnQtz5cY0UPtFsKBAQYiXF2drQ/yvTGAtxNgFpNnTLxe1b7Fjp36q16Z2y2JDo4rKMNgW4KukcDeYzgefvbacpfp50Tet+dFThq31dUo3sNRDn8uQaudrdaE6sUnFa8EnbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O0phCf4Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH58C0Y016688;
	Tue, 17 Dec 2024 06:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VWw+5QmJu0GdfrNZ8LAHP76xLaoV9zwK4kr
	vOTUJ0XE=; b=O0phCf4ZS7oOgaruGr5O52SlqcVDCD8bGenF8q4IkRfkMJnzTPV
	GbijsmlcrBEpnmXs/1/G7f/E3Bbzi7K4pc6EMuI/TdZi5Oi8FDlKlMsRVxlBtdqZ
	lv2VgRv5jU5QsatXWi7/FlBybuDtXH+J3Ji6fglqCo9g1AWmoDEf76/v2TJCqwgB
	pSLWsdmT6MxFp2ow0hOcOea3be2p6Iq+xQ77LTtpGzj6XB7UaI4EcaqRAWCB+bHU
	Sggi9+SS5aFCvmRjbXbZURqlZJa9EbyGRoRpWoSe48NawxfeCAKQMJVKtsOTa/Ci
	hwzQMjn+JE+Iy0311kcIXuOvv6mljLvV7RA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2vng7s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6n0CX014905;
	Tue, 17 Dec 2024 06:49:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33kx8y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:00 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BH6n0bJ014876;
	Tue, 17 Dec 2024 06:49:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BH6mxRv014865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:00 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id EB8265A5; Tue, 17 Dec 2024 12:18:58 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v4 0/7] arm64: qcom: Add support for QCS9075 boards
Date: Tue, 17 Dec 2024 12:18:49 +0530
Message-ID: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-GUID: Em0ZAJvPaLWiIEqFpgW5cfcexGGIU7r2
X-Proofpoint-ORIG-GUID: Em0ZAJvPaLWiIEqFpgW5cfcexGGIU7r2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=935 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170053

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

v4:
  - Replace dts to dtsi in Ride/Ride-r3 platform files
  - Add thermal patch to differentiate between 9100 vs 9075
  - Add proper abbreviation and update commit for 9100 vs 9075
  - v3: https://lore.kernel.org/all/20241119174954.1219002-1-quic_wasimn@quicinc.com/

v3:
  - Fix RB8 board compatible string
  - v2: https://lore.kernel.org/all/20241115225152.3264396-1-quic_wasimn@quicinc.com/

v2:
  - Remove unused dp nodes & update commit for ride vs ride-r3.
  - v1: https://lore.kernel.org/all/20241110145339.3635437-1-quic_wasimn@quicinc.com/

Manaf Meethalavalappu Pallikunhi (2):
  arm64: defconfig: enable cpu idle injection and cpu idle cooling
    device
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
 arch/arm64/configs/defconfig                  |   3 +
 drivers/soc/qcom/socinfo.c                    |   1 +
 include/dt-bindings/arm/qcom,ids.h            |   1 +
 9 files changed, 680 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi


base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
--
2.47.0


