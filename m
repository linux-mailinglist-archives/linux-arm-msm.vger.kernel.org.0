Return-Path: <linux-arm-msm+bounces-20302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569308CD1B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 14:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8803B1C2143F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 12:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A5B13CABE;
	Thu, 23 May 2024 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BD8bsm01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E913A894;
	Thu, 23 May 2024 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716465856; cv=none; b=Bm3FC5/0YxgDS3o46pFLHuXivYLNobRuB7lbliaXDZWNXxrNSZoZW2OOpPClLcCAX1/5DB23OAZAfuC4ou3c0s51v/QKcQi9tFek3dnOJ9ii2J/hsnfgZpuFkHCgi7ZPbFRNPP0DAflxh50PkON+CfhjhH/gN1O82Fyjlln27Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716465856; c=relaxed/simple;
	bh=rkFIzfcFn7JMshSPbwF9SH6pPfZQITovqpeJtWcC874=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A5xWkDgkRgz3KHpWUmMUFnMDUDGPntmV6Ob8kf0WzKpAqOq264H6Hz+H8aNE8cvG85bfIUc14wmTSAuNf3S5dcr4lFnm3HB0j40HLtYmjnfedxgeG87VOboSPInbmKVoQ+H5/8F3UBtd9D61FmIRS2XaSFLqDCFyJ7TZAJt3Njg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BD8bsm01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N4jbZ6011589;
	Thu, 23 May 2024 12:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=WwEoB7Yj8TSC2b0v3kHnwaI7LTcbPICYwNI8yeI+6xM=; b=BD
	8bsm018khPJiej2l2WGtpW0jaU8EcSplBih1MFSJioikGq/d5XyE/0gYwC1Q6aXF
	Olvbd+O41RyFPDfa89ckoWUCOZ9htaW8+Yd+7rROUdX8GQNWWcOpJDrsCRLuE0Pz
	3/MnalIsue66lJoh255TG9b3fFINK5MbMEG1OKeu6A4Y9D869IipeN/218aENSfy
	9XeMQ2wb00BwNEkLEjRIPk25oEVGiuGisJt1t46TR5lUYptL3EmsKNJ3iZ1xMrLA
	DG75d0nRSaD3z+yWGFh5DtjYw52RuGdVuddehREoT+C4VL3MTF5R+Lu7RJfHdc5d
	g6ggZvmVEFMZegxt1JQw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9y29s0m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 12:04:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44NC45ib010075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 12:04:05 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 05:04:01 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v2 0/3] Add SDHCI support for SDX75 SoC
Date: Thu, 23 May 2024 17:33:34 +0530
Message-ID: <20240523120337.9530-1-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tU2RqLmbzQWocynQIGMYJLbsWgk-gITF
X-Proofpoint-GUID: tU2RqLmbzQWocynQIGMYJLbsWgk-gITF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_07,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=930
 mlxscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405230082

Add SDHC instance for supporting SD card on SDX75 SoC.

Changes in v2:
 - Renamed the regulators as per the current format for fixed-regulator.
 - Collected reviewed-by tag.
 - Link to v1: https://lore.kernel.org/linux-arm-msm/20240515120958.32032-1-quic_nainmeht@quicinc.com/

Naina Mehta (3):
  dt-bindings: mmc: sdhci-msm: Document the SDX75 compatible
  arm64: dts: qcom: sdx75: Add SDHCI node
  arm64: dts: qcom: sdx75-idp: add SDHCI for SD Card

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |  1 +
 arch/arm64/boot/dts/qcom/sdx75-idp.dts        | 45 ++++++++++
 arch/arm64/boot/dts/qcom/sdx75.dtsi           | 86 +++++++++++++++++++
 3 files changed, 132 insertions(+)

-- 
2.17.1


