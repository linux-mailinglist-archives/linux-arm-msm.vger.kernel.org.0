Return-Path: <linux-arm-msm+bounces-43828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5DCA00473
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 07:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F06553A363E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F131BBBC6;
	Fri,  3 Jan 2025 06:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oVhCeJf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9D31B81B2;
	Fri,  3 Jan 2025 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735886256; cv=none; b=HlX4TZ3dRxWJxlJQZIioUx1uEmR0ZqHD/sNGdv7FYD53cg4kGFpPPE56PKgrmYI0cSU2CeChuRooZLo4YAFHoug7xWfGimpkgWrD7Ivn9l4CW7sSJ+A/SPnhgIqd4u0RW4UxmO+hBuRXNsZsJgFU6Eq5jl9F2wtB0LPGagF0L6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735886256; c=relaxed/simple;
	bh=XPPpltQ1x0uDGhoNwhPiskdr80sI8Gz9GBKvpqovPoQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HH0XBw2PKlefduQf1Tod5Kiqag0eka4dThTn10SizLjHgSdimKc0ctp3RvCbgnvtdS161yCsjxE6NAT/HPFRbz1zho3IHZR6xLgaWG/OveKaDtCM+89ChJQ8jrgH4+4LrcVWtl3Ftoz5mh5LKongSG1T/Bbk1j2f/yqaa46afjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oVhCeJf9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502GvpmM006988;
	Fri, 3 Jan 2025 06:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zuxP+s4ZQtD0+N4OjyH7mo
	nwGT/d8fxm3HdnxvPrf68=; b=oVhCeJf9G/LpqC90YlC/9DJDuaIGGWphJYhhfr
	PvaKpSnHp4ROYzfnu6Qi8GLRo4ViGGARSuVit63062V9+zUL4G3vVovTCO5Rp6jp
	4fSIpSktHMmftiUlES5hE/HvW5FTK7uwkyTbLjqm6GDi3g3UXiY8Zh5/rA4mzAtX
	zSi2fPbuA3ly7AD5YdVIY5z0YW3N3HGiQ5hFrbWr0ST5n13z3Dql5xrZ6iELebah
	N8ne/HpUt1RFhzV0xX20g8ZxR2djKX9iBfS+fGu+Uyni03ZGf7jsV4A5y6dVxQnL
	rVQXMIT4/cXx6k5F/hHlchni2U0NTnMDeGHlXytfA0LWhc1A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wxse9enn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 06:37:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5036bNom028309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 06:37:23 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 22:37:20 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v4 0/2] Add SPI support for IPQ5424
Date: Fri, 3 Jan 2025 12:07:06 +0530
Message-ID: <20250103063708.3256467-1-quic_mmanikan@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TMUDNLGbGzE6TLVB-cfRxyQAHL8NOrB6
X-Proofpoint-GUID: TMUDNLGbGzE6TLVB-cfRxyQAHL8NOrB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=601 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030055

Add SPI nodes to the IPQ5424 device tree and update the
GPIO pin mappings accordingly.

Changes in V4:
	- Drop patches #1 to #4 of V3 due to the reversion of the
	  'renaming of spi0 to spi4' and adhere to the existing
	  naming convention such as spi0 and spi1.
	- Add spi1 node.
	- Detailed change logs are added to the respective patches.

V3 can be found at:
https://lore.kernel.org/linux-arm-msm/20241227072446.2545148-1-quic_mmanikan@quicinc.com/

V2 can be found at:
https://lore.kernel.org/linux-arm-msm/20241217091308.3253897-1-quic_mmanikan@quicinc.com/

V1 can be found at:
https://lore.kernel.org/linux-arm-msm/20241122124505.1688436-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (2):
  arm64: dts: qcom: ipq5424: add spi nodes
  arm64: dts: qcom: ipq5424: configure spi0 node for rdp466

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 43 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 22 +++++++++++
 2 files changed, 65 insertions(+)


base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
-- 
2.34.1


