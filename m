Return-Path: <linux-arm-msm+bounces-27045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42993C0E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 13:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC9951C2109F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542861991D0;
	Thu, 25 Jul 2024 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="myfo6C2H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81641974F4;
	Thu, 25 Jul 2024 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721907220; cv=none; b=tFi1JSpxzUynKTdsZH+DkRw+HktQkxyXksSDEkJo8nLitYChVlhqP7Q9A1ZWJuUSMu83WOUq54Gjg/0BPXlP0BW3pgzZ/fXBQIeI3wTCZuUj94ti9R3iSFZS9bEy1mUyKZYb3QPzi37OogVfqq4yvoIRPkDEUtaF85CtwhM7oaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721907220; c=relaxed/simple;
	bh=v+0n1SQeQBQ+M2c9LvK1TPd4HyMbqbWqZyQWICRBldU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=P9L5LzxKgIAT1w0wbCmut/fQNE8NSkIu5HoyfcTgtewyQogBksXkXhPaScXy3YzraJDlZ4jyETCsI8IlTLoXbcaunDAMfPX/tb4F2JowgdLWqTkynBXwgfNKDdD0jF8B1LAnMf5H5thLBk+63DONED+8npmpFyvrkIwpdAzbwpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=myfo6C2H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P8a16p000319;
	Thu, 25 Jul 2024 11:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/W5U3p16ICax35+NOWdgRM
	jBmcJeZafjbkwDngPHQrI=; b=myfo6C2HHWKcW+sxTGXioYGZXuXehNtCgk2UAk
	sBJQfKOX9jqnmoC/K4i12vvDhPSIwYKFlIHanz0N8P8DmRH7P8/pLQ6Dk39ZbJtd
	RvXP3iCNDhDibjBvqtITeP/7x9x4A4GqheTqKgFiZlvz4+E7ZhwfE8lJbxpJXRvt
	+rRPf8Zaw9vexs+/JHIpd24JXcd681elCpA3Gxk4oqHrovNMx+igRUobDgZnVGxK
	UYEo8PJtmMJtRlux7cDW4+gtwjnJNA6pibAWnaa1EPfNXIyK64u7bxQkeFnrc1cn
	1n3Pc3hGmzpPYU4tnLUbSyBlC79ft4UsMH3KgffuNBFl6wEg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2xen64t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 11:33:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PBXXP8031861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 11:33:33 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 04:33:28 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH 0/4] clk: qcom: gcc-sc8180x: Add DFS support and few fixes
Date: Thu, 25 Jul 2024 17:03:10 +0530
Message-ID: <20240725-gcc-sc8180x-fixes-v1-0-576a55fe4780@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPY3omYC/x3LMQqAMAxA0atIZgNtabF6FXHQGDVLlQZEKN7d4
 vj4/ALKWVhhaApkvkXlTBW2bYCOOe2MslaDM86bzgXciVAp2mge3ORhRdpC7E203i0B6ndl/kP
 dxul9P5cQp0NjAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CN3SIKVzJWvlYooNXvYa-v5Y5HQDgAJY
X-Proofpoint-ORIG-GUID: CN3SIKVzJWvlYooNXvYa-v5Y5HQDgAJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_11,2024-07-25_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=755 mlxscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250078

This series adds the DFS support for GCC QUPv3 RCGS and also adds the
missing GPLL9 support and fixes the sdcc clocks frequency tables.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Satya Priya Kakitapalli (4):
      clk: qcom: gcc-sc8180x: Register QUPv3 RCGs for DFS on sc8180x
      dt-bindings: clock: qcom: Add GPLL9 support on gcc-sc8180x
      clk: qcom: gcc-sc8180x: Add GPLL9 support
      clk: qcom: gcc-sc8180x: Fix the sdcc2 and sdcc4 clocks freq table

 drivers/clk/qcom/gcc-sc8180x.c               | 375 +++++++++++++++++----------
 include/dt-bindings/clock/qcom,gcc-sc8180x.h |   1 +
 2 files changed, 232 insertions(+), 144 deletions(-)
---
base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
change-id: 20240725-gcc-sc8180x-fixes-cf58908142b5

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


