Return-Path: <linux-arm-msm+bounces-49117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D772A41574
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 07:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6C407A3A28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 06:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE131D63C3;
	Mon, 24 Feb 2025 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ny71eU6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285871B21BF;
	Mon, 24 Feb 2025 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740378950; cv=none; b=osoLGpKcm8fqMCbiboP2lDj/wO9VlcWB3mPJozp6loiTVikoWaxzkDj5ZwD7Ya539rPOtF6Max16rXhie+wtXCgIkzjOFiubiKe+GEevfpc5u/MtWaBwBkWP/ddKcKilkeQJoTEumRjGqZL0Xj8BzE3rOujsNuRpCQNbLG1nGHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740378950; c=relaxed/simple;
	bh=PR4ryLxXqD0evbS8mHEcMn7P5V/gco+863Pgr8tL69A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R/1nWmC07KsfzhfkBjVWjXCIjEGNMA431+2dq1KyVZ7pd8KqLc8nJ/RrXTNI1h2JsD3dHSo9weSW9K7uJFQojb6AWMaEBo0usx1BP93FuKZnR4Xi5SQQwu8bUXzd8xTVZHPrApkUTIN/FDuyx/J9XMO5rcxtEYh+oQofWcnkTZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ny71eU6r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NNSSSD010077;
	Mon, 24 Feb 2025 06:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GFivpKgkJa/nu+McYWRXvJ
	qlVQ8LzLFGJGDjVmvhTrc=; b=ny71eU6rvZfBqkC+ERCKll18bK2iJy7GRmpiNo
	VMUoWTL6U5BlUsMBialz27ATdRAjB/da0U5w86oWvRAdiqz23rfcXlJ3fjaitckA
	s1T2I+AJIcD8ntpAZxSdWVYzljlTmYju8ZklFzvknG876Eu2mBdT2ZerbT7+VnLx
	DSDe0UP5jS7iuRypRgLOvb33PMIQ9P6e/UR9hu40rEeCwxLYhuuWsZCM4Pd84tGm
	uMhSdLV8AjPhPrJBSiZZhmJjuQiHv1YXIkGMlOE5/RYGl3m/irCIjAT3NGD6tzwD
	NraDwG8Eww8U+7U8ZT3RK21ooeufE6b8zupKPEWrLLC6AhmA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xnc326-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:35:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O6ZiNZ015423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:35:44 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Feb 2025 22:35:40 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v12 0/4] Add TSENS support for IPQ5332, IPQ5424
Date: Mon, 24 Feb 2025 12:05:27 +0530
Message-ID: <20250224063531.2691961-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: gTo2kDcDJXAv_sSbpqsf_CzdILULoXAj
X-Proofpoint-GUID: gTo2kDcDJXAv_sSbpqsf_CzdILULoXAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=477 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240046

IPQ5332 uses tsens v2.3.3 IP with combined interrupt for
upper/lower and critical. IPQ5332 does not have RPM and
kernel has to take care of TSENS enablement and calibration.

IPQ5424 also uses same tsens v2.3.3 IP and it's similar to IPQ5332
(no RPM) hence add IPQ5424 support in this series itself.

This patch series adds the temperature sensor enablement in the
IPQ5332 and IPQ5424 dts files.

Changes in V12:
	- Dropped patch #1 and #2 because these are merged.
	- ipq5424 dts
		- Removed 'thermal_zones' from the node name.

V11 can be found at:
https://lore.kernel.org/linux-arm-msm/20250210120436.821684-1-quic_mmanikan@quicinc.com/

V10 can be found at:
https://lore.kernel.org/linux-arm-msm/20241219062839.747986-1-quic_mmanikan@quicinc.com/

V9 can be found at:
https://lore.kernel.org/linux-arm-msm/20241125050728.3699241-1-quic_mmanikan@quicinc.com/

V8 can be found at:
https://lore.kernel.org/linux-arm-msm/20241115103957.1157495-1-quic_mmanikan@quicinc.com/

V7 can be found at:
https://lore.kernel.org/linux-arm-msm/20241107140550.3260859-1-quic_mmanikan@quicinc.com/

V6 can be found at:
https://lore.kernel.org/linux-arm-msm/20241104124413.2012794-1-quic_mmanikan@quicinc.com/

V5 can be found at:
https://lore.kernel.org/linux-arm-msm/20230721054619.2366510-1-quic_ipkumar@quicinc.com/

V4 can be found at:
https://lore.kernel.org/linux-arm-msm/20230719104041.126718-1-quic_ipkumar@quicinc.com/

V3 can be found at:
https://lore.kernel.org/linux-arm-msm/20230713052732.787853-1-quic_ipkumar@quicinc.com/

V2 can be found at:
https://lore.kernel.org/linux-arm-msm/20230712113539.4029941-1-quic_ipkumar@quicinc.com/

Manikanta Mylavarapu (2):
  arm64: dts: qcom: ipq5424: Add tsens node
  arm64: dts: qcom: ipq5424: Add thermal zone nodes

Praveenkumar I (2):
  arm64: dts: qcom: ipq5332: Add tsens node
  arm64: dts: qcom: ipq5332: Add thermal zone nodes

 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 135 +++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 201 ++++++++++++++++++++++++++
 2 files changed, 336 insertions(+)


base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
-- 
2.34.1


