Return-Path: <linux-arm-msm+bounces-29694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D712A961BB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 04:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7452C1F24828
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 02:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9C644C86;
	Wed, 28 Aug 2024 02:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nst62ftw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074EB946C;
	Wed, 28 Aug 2024 02:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810572; cv=none; b=Y4rv82h1yf1VcnXWXlurgdhylT9CbqXSSUxUA6ICHZSc0syUHnktw1Ajiuj5eRPVmPmzJuDzKtOYJ9VJ9R26+xGBONEMfBcjegGBKQZI0ERSuR3mq2MYoULLtyLdzh05UMKkv0fdF+oh6l9ICA1AZvJ+8TKZyWfBN3aRUCRrvqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810572; c=relaxed/simple;
	bh=DtBiu3d1Tve5RceK4TCqLFVvl2TE6BcpMpXK6gxItA0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=GYIHPXfzNRC3+joBdr6/+8Am9NMmMiaTsvYceK/YERb6eAej6I2jS/l9QssvyJqEuN0YwmXeV+Nm75V0Wr8dWSl4vI366xbSI56fe0+jSz1ber+W1o4eJjtWVBGVNXa6iZH46+HE/WAtkujxU21NOrhvLcrtFna53N2vo5RCJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nst62ftw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLaNfN021184;
	Wed, 28 Aug 2024 02:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k0z/kXZkFkFG7mWmEt5MY1
	Bwvzbm7aQXLkmaxB6ZLyM=; b=nst62ftwqsQ+yk30/iYyYPkbbSw29TDSU7CmYK
	bcOIWg8FDFZk7Pl797holZiQLfBztTKn6NARaXYCHKoOG5UFW31LTq2nX/9gcLlm
	L3+KHM2bJ7PiHT4xoaEW894XM/w6w81HyccjRWtl48MierVC7wlqJxgna25xiFWH
	8p8ex76h9HOGD644PojiJgcu7V5X8EbVH2WYzfFgkrWtRliFKmicgsE1nscB5sZ2
	+vbdoz0zh57KaLNHRGrur790FOkdn0/0WR9twLzsoPhAm9JeUenomUQGzetyRiip
	sWKcKiqnihBIH7y9OHrOjmj5RLeHASp3TFWMtx6mGi7n6CVQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0gdb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S22ZYE011241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:35 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 19:02:30 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH 0/6] Add initial support for QCS615
Date: Wed, 28 Aug 2024 10:02:10 +0800
Message-ID: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOFzmYC/x3NQQrDIBBA0auEWVeI2qTSq5QiomMyUNTOpKUQc
 vdKlm/z/w6CTChwH3Zg/JJQLR36MkBcQ1lQUeoGM5rr6MxNhZQ8FdoovLx8Wqu8+VzZv6PMelI
 2W2dstHHSDnqkMWb6nYPH8zj+Xx3Zg3AAAAA=
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724810550; l=1298;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=DtBiu3d1Tve5RceK4TCqLFVvl2TE6BcpMpXK6gxItA0=;
 b=MrdFKekZ9pSal/pzn+cJzwCydcTtvk8hkdrZQTQcnmBdTjTW5TmJXbnOfbIAxGyw9JUyFphqg
 iQcwfeib6xED9unEjUHVwkdfYPT0SWYXus2k6SNVWQVltiLqCpPoCWS
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BCiVW4T8qC-q9i6Rf5vOMJuQZzN1drop
X-Proofpoint-ORIG-GUID: BCiVW4T8qC-q9i6Rf5vOMJuQZzN1drop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=764 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280013

Add initial support for QCS615 SoC and QCS615 RIDE board with basic
description of CPUs, interrupt-controller and cpu idle, which enable
the board boot to shell with dcc console.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Lijuan Gao (6):
      dt-bindings: qcom,pdc: document QCS615 Power Domain Controller
      dt-bindings: arm: qcom: document QCS615 and the reference board
      dt-bindings: arm: qcom,ids: add SoC ID for QCS615
      soc: qcom: socinfo: Add QCS615 SoC ID table entry
      arm64: dts: qcom: add initial support for QCS615 DTSI
      arm64: dts: qcom: add base QCS615 RIDE dts

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  15 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 449 +++++++++++++++++++++
 drivers/soc/qcom/socinfo.c                         |   1 +
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 7 files changed, 474 insertions(+)
---
base-commit: 0dec408547d2a9e21ea44eab538a1ca852f0be0d
change-id: 20240827-add_initial_support_for_qcs615-3f3823c3c518

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


