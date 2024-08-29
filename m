Return-Path: <linux-arm-msm+bounces-30036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8CD9646F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 15:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 408C51C22A1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770881A76BE;
	Thu, 29 Aug 2024 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j5uY8mNU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839761A707F;
	Thu, 29 Aug 2024 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724938849; cv=none; b=FWyH/eAsUzsZJOAPyyVqh4qCRFjf5Q9QuFM/Zly/DCJGefKiXib524DL9NW/SdU7IDUBtc1XQfR4GJJlklET+jdT+GHVUp+WotR1nhUmah+nRjmseGdpBheE8zNWkurIdpZNL2dCujk1TUovR9BL/bqjHKLPktQfRb4ex6R1QkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724938849; c=relaxed/simple;
	bh=TZX246zT6gQOaJ4+SS0AG+6vRqVsq+2MpIwuMM1Le30=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gb/R/w10cBy5eEqf4HuVZCm5Qq/iTND7nd/a6ckaqVOVWl7+PUHgojZb0X7a/kpFrxgNhiv6SLbgB7cRxVmyWLkg/jAis0MK3i3MVtk88QKkhUsOM4BfdDHUdAqT1pyt/S9GLGva+XZISTcDa7x0hcONlDV/fdO7R6tNsd4bP0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j5uY8mNU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8TqVp001073;
	Thu, 29 Aug 2024 13:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F8N1RrRjxwf5TgZ2pHhEI/
	ywY+uRyWfuHMwGAA4KM8c=; b=j5uY8mNUfVmJuMLhTy7bbWtbrFD4IlSkkcypb0
	+ogL92WfQL1SszMDZJLTUSEZaKwONJIhVgbIh3TRLitGzqaH8Gcj1a2D3m/NZej5
	s3nbqGA3ILKj7L1L/LP/HRYX/HAsPQS+q/haK1FY31TZVT2qMiHCZHhEa9HzAjg4
	ur1XpdsytfT/SSgz4DvRSiIWS9qXmnGdeeBbz7YirPVqnd39789NptJYDSKHU977
	hCKtYS03kASvT5xfIgiQcf7IsdDdBpSffEIrx6+g4E0XPmfxfefCSJwVaxRqrP0r
	cUOsubSpF2S6kQA4nR4BHXknjiKj0mGwA2GV0kAoRsOnzPwA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puw5dxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 13:40:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TDegMZ014528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 13:40:42 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 06:40:38 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_gokulsri@quiconc.com>
Subject: [PATCH V2 0/4] Add new driver for WCSS secure PIL loading
Date: Thu, 29 Aug 2024 19:10:17 +0530
Message-ID: <20240829134021.1452711-1-quic_gokulsri@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fAgGmk-UDqX3Fl24mc1t33id-PG7OWYe
X-Proofpoint-GUID: fAgGmk-UDqX3Fl24mc1t33id-PG7OWYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=525 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290094

- Secure PIL is signed, split firmware images which only TrustZone (TZ) can
  authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver [2], instead post a new driver for secure PIL alone.
  This series adds a new secure PIL driver for the same. 

[1] https://patchwork.kernel.org/project/linux-arm-msm/cover/20240820055618.267554-1-quic_gokulsri@quicinc.com/

[2] https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

changes since v1:
	- Removed dependency of this series to q6 clock removal series
	as recommended by Krzysztof

Manikanta Mylavarapu (3):
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bringup q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,wcss-sec-pil.yaml         | 125 +++++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  62 +++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  58 +++
 drivers/remoteproc/Kconfig                    |  22 ++
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 354 ++++++++++++++++++
 6 files changed, 622 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c

-- 
2.34.1


