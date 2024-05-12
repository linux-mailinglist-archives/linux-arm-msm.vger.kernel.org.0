Return-Path: <linux-arm-msm+bounces-19759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4478C3588
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 10:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E36BD2818EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 08:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7AB17722;
	Sun, 12 May 2024 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UR0cbRyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FDDEEB3;
	Sun, 12 May 2024 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715502367; cv=none; b=V5uqX1B/552bmXvUDiXZ/CXNfJdKIUtkUlvFmhQubxy5Ab3gVifB1qyPDFd4D0+3M7QE3D1nHz+9yOZPxp7zXqTyA7aEpplRgEHSZm1UKkIRN49enZvMTTgQc7ErfE1LjvebHq/FphVftCKzXMrb60OwdeBV9AxlJQEoVPKWG3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715502367; c=relaxed/simple;
	bh=aHYIcQgRBEYtprmx6meR3etQZm/Z03qPUZ92mabg+Bg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r+smuFypxH+9biskm8ay2V/kfqLH5+iPdQ8t8wYtTdHF0b7AMVyxwcjFcRFNTmGrE3iC5AUW2sgYc/4BQY44UWbwAdBJNCl93OQqj9C07tpPfrCnRbmLOHSwzMHLqFgdaeGTMQjsYLRKNwPMWeTjodl/pqEbos0qrO3IlOdiH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UR0cbRyX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44C7Pu5Q000483;
	Sun, 12 May 2024 08:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=KQBwbQ6FHPb9QLsOTZqr
	JS/yEKzH5E6J0bAhscUnszQ=; b=UR0cbRyXiEMTZQxCSKjEDK5ytu5nuidwSJ0n
	TPgxmCpymV0Nm2x6eJaosM2G34ucx61B/YUhK+c7abt9/2F5qx0SK7I0Sh0xv3yb
	FOOCGwhCW4W79ePzcI3MXmRzcX93Nriys1CO+eU8cZpgRoS0drpcO0k78m07fyjP
	bAp05vXLg26sQgLRcBtw0/1X43l6us4pnx2P0ZYq5KHL+j9XJXEEqPfTaMOzI9ND
	/1hj/fh3fmZ8WQGlrwWDyeVyyhywr7eKNswnKUxGkSZA20kCT68XAB0u8k7B52Ul
	UoR6SEdklR4F+tACN44rWrfd3suF2W7UQv4+zIyv++CuGmmbuA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21y7sej5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 May 2024 08:25:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44C8Pgpe005088;
	Sun, 12 May 2024 08:25:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3y21rkn9uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 May 2024 08:25:42 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44C8Pgbe005072;
	Sun, 12 May 2024 08:25:42 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-devipriy-blr.qualcomm.com [10.131.37.37])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44C8PgmY005068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 May 2024 08:25:42 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4059087)
	id 5650740FAB; Sun, 12 May 2024 13:55:41 +0530 (+0530)
From: devi priya <quic_devipriy@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, quic_msarkar@quicinc.com,
        quic_qianyu@quicinc.com, abel.vesa@linaro.org, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_devipriy@quicinc.com
Subject: [PATCH V3 0/2] Add support for PCIe PHY in IPQ9574
Date: Sun, 12 May 2024 13:55:39 +0530
Message-Id: <20240512082541.1805335-1-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: kgD1dCnPPJFxMCUv4mWc6HppYf7OQ4Gi
X-Proofpoint-GUID: kgD1dCnPPJFxMCUv4mWc6HppYf7OQ4Gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-12_05,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=884 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405120063

This series adds support for a single-lane and two-lane PCIe PHYs
found on Qualcomm IPQ9574 platform.

[V3]
	Change logs are added to the respective patches.
[V2]
	https://lore.kernel.org/linux-arm-msm/20230519085723.15601-1-quic_devipriy@quicinc.com/
[V1]
	https://lore.kernel.org/linux-arm-msm/20230421124150.21190-1-quic_devipriy@quicinc.com/

devi priya (2):
  dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the IPQ9574 QMP PCIe
    PHYs
  phy: qcom-qmp-pcie: Add support for IPQ9574 g3x1 and g3x2 PCIEs

 .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 309 ++++++++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h   |  14 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-pll.h   |   3 +
 4 files changed, 328 insertions(+)


base-commit: e7b4ef8fffaca247809337bb78daceb406659f2d
prerequisite-patch-id: 513cb089a74b49996b46345595d1aacf60dcda64
prerequisite-patch-id: ce7a8e9bac53fd5f02921bff6bc54149fb92f996
prerequisite-patch-id: c26478e61e583eb879385598f26b42b8271036f5
prerequisite-patch-id: a5c15da6a968e673737dc5aa962f31576903f8aa
prerequisite-patch-id: 353eb53cd192489d5b0c4654a0b922f23e1f7217
prerequisite-patch-id: d282ba7948460ae4d2f541c8c25ff5089ff6507e
prerequisite-patch-id: 5141131d46f7789b50ac806f10b63869d15d709f
-- 
2.34.1


