Return-Path: <linux-arm-msm+bounces-38175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E29C9D0A15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 08:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE9C41F21993
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7A513D297;
	Mon, 18 Nov 2024 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fneD20gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64287C2FD;
	Mon, 18 Nov 2024 07:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731914346; cv=none; b=LrIKGif17diWrUwN/pUP90axv8likdjTG72NrQ9AYzgMVBBbGzdMwqQd+eArl3e252V8KdVlIXKcsNkwTyqddWNvrdqd6YyXmE7Kccv/OTGHe9OG98zpZRyRiX8UDjpjn2eq7sn+zNLX/aI3B+OLZiZ2rcdbS49SR6G0YpuQc6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731914346; c=relaxed/simple;
	bh=BKcxMf8dbDw7H0N+ePTc0M738tqOIGOACUgmlNFcxuM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GNhmmJB3CpHkS+Xzz9c7D3DKluH+BaI+J2eXXMDcve5zYtXl+6w2SMM0d24zpup+QE/yuBzwQQttmmpM3fQZuyEGrfSzJS16lAVBm/KcDDaBWrRjenJao75PlyeNyGKDynhAldLkeso+1EpQzx3c9SUgCA97JGpyK269b6qHSic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fneD20gg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5RfbC009619;
	Mon, 18 Nov 2024 07:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gGWtprDPIj8CYgHX0HKLd9
	H6F8U8b1an/ZE8Ye76hDI=; b=fneD20ggzzKx9B9UOaROMyCL9ezJCOhOnqAhqB
	wBpLkTnwrPup31rCqaU8uzP29FTIOo5bJ0AjCkYFv8uxsYAsQrKBOL1uceu4O6k/
	e3Rr9VLeE0ta9qlyiFIs1y+6jwMOQ36kIeJEh4qucGFz4rlyRwMlsm+qDyCmzSN1
	QHBasuOiMwUewdy7O8rvGMpUqLR5o5VbA8ximTB39hxBJijQfdOxBpWIyINcF2qd
	wsk5YLWb1Vg1cBjxc0AoS9SDNZFmZDMZ5TXC7Uekj9dV/X9FHbjiiU9IjouGI52R
	OtzyNLBtwsDfZfQ8m03ub2dORDWWB+EgoVrmxteAn+m4boEQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkrm3pqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 07:19:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI7IxIx031333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 07:18:59 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 23:18:56 -0800
From: YijieYang <quic_yijiyang@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_yijiyang@quicinc.com>
Subject: [PATCH v3 0/5] Enable ethernet for qcs8300
Date: Mon, 18 Nov 2024 15:18:41 +0800
Message-ID: <20241118071846.2964333-1-quic_yijiyang@quicinc.com>
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
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CCmy1JdDVgpqxe6OjVE7_c_x2Z6rTzXz
X-Proofpoint-ORIG-GUID: CCmy1JdDVgpqxe6OjVE7_c_x2Z6rTzXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=911 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411180060

From: Yijie Yang <quic_yijiyang@quicinc.com>

Add dts nodes to enable ethernet interface on qcs8300-ride and
Rev 2 platforms.
The EMAC, SerDes and EPHY version are the same as those in sa8775p.

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: Yijie Yang <quic_yijiyang@quicinc.com>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
https://lore.kernel.org/all/20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com/

Changes in v3:
- Remove unnecessary space and line in qcs8300-ride.dtsi.
- Link to v2: https://lore.kernel.org/all/20241017102728.2844274-1-quic_yijiyang@quicinc.com/


Yijie Yang (5):
  dt-bindings: arm: qcom: add qcs8300-ride Rev 2
  arm64: dts: qcom: qcs8300: add the first 1Gb ethernet
  arm64: dts: qcom: qcs8300-ride: enable ethernet0
  arm64: dts: qcom: move common parts for qcs8300-ride variants into a
    .dtsi
  arm64: dts: qcom: qcs8300-ride-r2: add new board file

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride-r2.dts  |  33 ++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     | 299 ++----------------
 .../{qcs8300-ride.dts => qcs8300-ride.dtsi}   | 107 ++++++-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         |  43 +++
 6 files changed, 211 insertions(+), 273 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300-ride-r2.dts
 rewrite arch/arm64/boot/dts/qcom/qcs8300-ride.dts (95%)
 copy arch/arm64/boot/dts/qcom/{qcs8300-ride.dts => qcs8300-ride.dtsi} (78%)


base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
-- 
2.34.1


