Return-Path: <linux-arm-msm+bounces-38763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 053AA9D599B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FE2C1F217BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 06:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25AF91714D7;
	Fri, 22 Nov 2024 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XjXk2smV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1EC165F17;
	Fri, 22 Nov 2024 06:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732258305; cv=none; b=Fae/iNupRt1XsN6YfHRUGV/qCqUGMUwJ3mSiZ41Zikl583N7rEq5SnP1qgBKnvU9Wz+yDNztos3kHgNLqU7UnjfOmf1zczi6ajCCC4um9hFVgFa10fd2AFuFkhZGwPfqHstgbR7WaaD2e+davzdUuCuwiZ6HHlAP9dMH1FVpP54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732258305; c=relaxed/simple;
	bh=ZHh3YYStw0BuVc/s922nCKrzECMMHh4rYZ9dGDOWuzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uRpd0DiuDW7lLoh6AGnlBVUHQ1bv2NrkWrqu5nwL26Ea9chi4bemvu+xuUj5KWmvqOVMTXARDqG+E5vGgWIRTLw/dla0OtH9+OzplrPJ1oCp/DTSpRQtmWiAQuPQ6EGECOEna+VArm1HutLmkvZmCA8TkXH+PEbqaY9phfdWiB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XjXk2smV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALHKOFJ021158;
	Fri, 22 Nov 2024 06:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t8L3m1zarbOf5qH8qdlyfkmFmN3IAIQELzo
	aiOlxsrs=; b=XjXk2smVx4NMDDl3ZdQFv/1idskPsPd7REiJ5GrtUzNFdX1onjg
	ABDgJt0ve9M4JamhXjuO5rN4K4Cpdx1t5Ya+2pX9MA2bntuEqcfptLqGmm2bQxP3
	6sfhPk4BeAD+JlN0eV018ORkRguyc5CtZ5rsFMV+c0HvQ1HniQ5NAytQSHs+y2vG
	yAy5C0muA48Skn4R9+u/3JMNtBuXDOcp3XVMr2MZBKVOXZhFVPZa5TTC3nghcrON
	fXYdP4ZXv20JJlHU8l+lVlI5c6WOMiMgSjkxGGq52kZfsJi3aWVLdJYM1gdXzflP
	l9/2iO3sHulgWpQfGDGhVinm4pmwJeZzPkQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320wk3b5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 06:51:39 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM6pau7009933;
	Fri, 22 Nov 2024 06:51:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 42xmfm4qhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 06:51:36 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AM6pZxG009921;
	Fri, 22 Nov 2024 06:51:35 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AM6pZWn009917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 06:51:35 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 47CEB1806; Fri, 22 Nov 2024 14:51:34 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: [PATCH v3 0/2] Enable SDHC1 and SDHC2 on QCS615
Date: Fri, 22 Nov 2024 14:50:59 +0800
Message-Id: <20241122065101.1918470-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gXWtAHSwX75n1T0W1qfPxyRCoYcOkeyc
X-Proofpoint-GUID: gXWtAHSwX75n1T0W1qfPxyRCoYcOkeyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=951
 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220056

Add SDHC1 and SDHC2 support to the QCS615 Ride platform. The
SDHC1 and SDHC2 of QCS615 are derived from SM6115. Include
the configuration of SDHC1-related and SDHC2-related opp,
power, and interconnect settings in the device tree.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
https://lore.kernel.org/all/20241105032107.9552-1-quic_qqzhou@quicinc.com/

Changes in v3:
- Improve the commit messages and cover letter
- Link to v2: https://lore.kernel.org/all/20241106072343.2070933-1-quic_yuanjiey@quicinc.com/

Changes in v2:
- Improve the commit messages and cover letter
- Remove applied patches 1
- Pad sdhc_1 node and sdhc_2 node register addresses to 8 hex digits
- Adjust sdhc_1 node and sdhc_2 node register addresses to hexadecimal
- Modify sdhc_2 vqmmc-supply incorrect power configuration
- Link to v1: https://lore.kernel.org/all/20241023092708.604195-1-quic_yuanjiey@quicinc.com/

---
Yuanjie Yang (2):
  arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
  arm64: dts: qcom: qcs615-ride: Enable SDHC1 and SDHC2

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  31 ++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 198 +++++++++++++++++++++++
 2 files changed, 229 insertions(+)

-- 
2.34.1


