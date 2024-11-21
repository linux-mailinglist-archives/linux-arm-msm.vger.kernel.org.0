Return-Path: <linux-arm-msm+bounces-38598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BD19D4728
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9F61F2136B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 05:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1479D13B787;
	Thu, 21 Nov 2024 05:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lFsjBXpo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A5132117;
	Thu, 21 Nov 2024 05:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732166404; cv=none; b=ba/d4bQ2cHYTRDhs4QUJjqxdLA9fmxeqCI512cEH7+nqeiMOdeF5472Oa17EVyOiLY0V9fH24WmUHMK91r/RIRGjaWbja/K+iIS+27dCs4G0E1ZTrMxRNzpzcO79VW06tjZJ6t1OB8AAfoTY5bwO9u2j7KyW5x2LCKgvi77M5vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732166404; c=relaxed/simple;
	bh=iS6v7gehXwQW+5AcPhULVCkt+OL4J/T7kr4KAa/Zs/8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f4ofDQ0Vwg5IoB2JA6wjjo7pe2gXkTzUbmk4hQ5MFzWIpMJ9JEcfdiR3pfessURAUovA/Z3SNe0pDlZkJhisiRFplXUcPwUDI9MNRilqfbtkYBYo7NagrDLE8xPxib1TzeUc1pRo/S39zf3sTspYZZ7ZGqHOgiyFuxKqp+kNJXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lFsjBXpo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL0qwtL027170;
	Thu, 21 Nov 2024 05:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3j4dHkpeAyDCiR2pjsj/dT
	28CDgXcEoNd9gW0TzwXm0=; b=lFsjBXpoxCAzOjR5Ppn/MjYW3ztrdRkG9thcKY
	5JxlMGS6jwu1OoOqm6Ah2TGS8KZtwm+LDQ6E/zAi008DuP4YnGc+h9cYIM2k5FM2
	30noQ6Etcr1yucnmwbf48xZisHSFEa6Y8FR/e8mc4oR6tl5BClvQg92RGdN8acjz
	KDOb4a2EnvSLkPBBKy4Wi2GLcEsF3lIQiD6CAxldiunkI1akgullgcNj1OzajAb5
	9VtgAb1LkgQ05GiOXvDRPxlv/lz02jXOGMpmjxeZh6Okl+lMZVCZ/fA1dgNWmjLX
	sdJr75bwscH377nUij+bT/SwUVsH56oLVKratTaSIlzHf/Nw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ebyaf07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:19:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL5JxIe001488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:19:59 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 21:19:55 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v4 0/3] qcom: ipq5424: Add LLCC/system-cache-controller
Date: Thu, 21 Nov 2024 10:49:32 +0530
Message-ID: <20241121051935.1055222-1-quic_varada@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iwLvmfWbbAgb3YLT5z8M8mL8QgLwmOo6
X-Proofpoint-ORIG-GUID: iwLvmfWbbAgb3YLT5z8M8mL8QgLwmOo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210039

Unlike other Qcom SoCs, IPQ5424 doesn't have multiple instances
of LLCC IP and hence doesn't have a LLCC_BROADCAST register
space, and the LLCC & LLCC_BROADCAST point to the same register
space.

Alter the driver accordingly and add the relevant entries for
enabling LLCC/system-cache-controller on the Qcom IPQ5424 SoC.

Depends On:
https://lore.kernel.org/linux-arm-msm/20241028060506.246606-1-quic_srichara@quicinc.com/

---
v4:	Fix ipq5424 placement per the sorted order

v3:	Rebase to ToT
	Remove 'need_llcc_config = true'

v2:	Add reviewed-by for dt-bindings and dts patches
	Add 'no_broadcast_register' to identify SoC without LLCC_BROADCAST register space

v1:	https://lore.kernel.org/linux-arm-msm/20241104073840.3686674-1-quic_varada@quicinc.com/

Varadarajan Narayanan (3):
  dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
  soc: qcom: llcc: Update configuration data for IPQ5424
  arm64: dts: qcom: ipq5424: Add LLCC/system-cache-controller

 .../devicetree/bindings/cache/qcom,llcc.yaml  | 20 ++++++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  7 +++
 drivers/soc/qcom/llcc-qcom.c                  | 57 ++++++++++++++++++-
 3 files changed, 80 insertions(+), 4 deletions(-)


base-commit: ac24e26aa08fe026804f678599f805eb13374a5d
-- 
2.34.1


