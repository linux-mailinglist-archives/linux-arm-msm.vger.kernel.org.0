Return-Path: <linux-arm-msm+bounces-47354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22168A2E424
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F711885D79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 06:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C821A23A0;
	Mon, 10 Feb 2025 06:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ga8WHZL7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979481990CD;
	Mon, 10 Feb 2025 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739168979; cv=none; b=ELsKbVr/c853TBWI9YBVbGk6CCsE/OWdUu5kJ5PpXnwVjH8qbBKSBOkJ93+xK5b+cEDjNbsiPy7YbUhOICyUyPnYQGPRNOd5TeTWhsWxzvHsNCHesstR7dqW+ImZIF0EoOiDO7jZOCHFyXCxNuOEqEINRlJQh39jVpToigDcyPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739168979; c=relaxed/simple;
	bh=kJ9RFHC4xMMzcANEv+KjexwvxFeafur81VeCS4TWXQI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YrJmgQiBlNUHSBI5jczd6oat5d86FZofcA/Eu1g6mAOHHBmK7e2/m5feNscpH70SyPFXuPjtObKXG5dm0iypa8ltW0rIZ+1fqvPfmmSwVqysmz5/+MnO7PJTbMH1CsksdeLKHRR80ntjmYz1tjUBkbz2BwFefO+lAx6n9B3QvbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ga8WHZL7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519Lmcwq005019;
	Mon, 10 Feb 2025 06:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nNiieKVzCxK9vBrKPLffe3
	LdMeRmhK8cBN1XHm5oCuw=; b=Ga8WHZL725z+uNftLt6WSuO/ayZocekWYd1xHj
	m0gfNxNPfqnIOICYWHzbIkpDMG9aYhteCwrvmT88GFeA4XRwcXT97Ya8FljZT2TO
	9wfyPB5ZPSDZH+xHM1WCqT4KhWj3jR+CsYslbd/Qltv9DU5r1GYDsHecd0yHMGMX
	/ZzPyVvcqNBJj+on3cok4px6S/eeiCQ5Y0SOYevCygEnFddrpy601/J8XZzcoZAT
	fmyCOX7S0waQeLYM7GxejU8WSjEjVDnPnyMqvn5uGnvwVFy9HY9ldRVH+yDYT4sb
	YlODIHPegFincKSBy65k9vhmaqagVIGs+hnU9J98umThncFw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyk7mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 06:29:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51A6TX5t022295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 06:29:33 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Feb 2025 22:29:30 -0800
From: Stone Zhang <quic_stonez@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_miaoqing@quicinc.com>,
        <quic_zhichen@quicinc.com>, <quic_yuzha@quicinc.com>,
        Stone Zhang
	<quic_stonez@quicinc.com>
Subject: [PATCH 0/2] Enable WLAN for qcs8300-ride
Date: Mon, 10 Feb 2025 14:29:08 +0800
Message-ID: <20250210062910.3618336-1-quic_stonez@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xR8dSNKz06QPowEYTnuFQBqkhLJcxLQH
X-Proofpoint-GUID: xR8dSNKz06QPowEYTnuFQBqkhLJcxLQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 mlxlogscore=624
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100052

Enable the WLAN subsystem of the qcs8300 ride board. The WCN6855 wireless
chip is attached to PCIe interface 0.

This patch series depends on:
- pmic
https://lore.kernel.org/all/20250108-adds-spmi-pmic-peripherals-for-qcs8300-v3-0-ee94642279ff@quicinc.com/
- pcie
https://lore.kernel.org/all/20241220055239.2744024-1-quic_ziyuzhan@quicinc.com/

Stone Zhang (2):
  arm64: dts: qcom: qcs8300: add a PCIe port for WLAN
  arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 96 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     |  9 +++
 2 files changed, 105 insertions(+)


base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
prerequisite-patch-id: 7777ec69b5f2389a2efdb0bda561b067da72abfb
prerequisite-patch-id: e6140f9abf38172e77875f126da90bde6e1829cb
prerequisite-patch-id: c4e0283b4bce4c4e0566d7783f8ccd7fcaaebd3f
prerequisite-patch-id: 7678941813d86157f57b11c3596089ba86080fd6
prerequisite-patch-id: c87e5f1cb29568c24566e8a960d6c8dd0be5969d
prerequisite-patch-id: f80a486c6e34dfb62f09faf0eb3fae586cda85ec
prerequisite-patch-id: 0e2cb7a4d8779539a58261111deea6bd6b750f6f
prerequisite-patch-id: abc8aa5792945decdcba9d5c1e43072402f5a65f
prerequisite-patch-id: edd904882daa9ed31340710e36905c82c4552c8e
prerequisite-patch-id: e68c6ea627fb6d61af3518720dfb765f6285bb22
prerequisite-patch-id: 564513b0c808e8166d57f0537a9a057fe9cafa77
-- 
2.45.2


