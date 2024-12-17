Return-Path: <linux-arm-msm+bounces-42498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D779F4841
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA0816B7EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 10:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADA51DEFF3;
	Tue, 17 Dec 2024 10:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HBSLkXcq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00AC1DDA34;
	Tue, 17 Dec 2024 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734429783; cv=none; b=S3g+e0VPEbG3eoWFFXZTz2Z+njGIW3s2MnOtCVha25ENFKa0ecyFyIgz4pfBmpwSd1o3ZB22Ey3sdr3BVF7dNlZ3zyWLq94Ip3DNqCny9B7O9vhFdGUDO+Y6Rk4MkrC0ioqYD+IBwaTHOv5Bq1HN6ybRHVT+usLQz1EAYuogSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734429783; c=relaxed/simple;
	bh=Zrbkb6NNLQ7s+NbNJgaFUjJGlRBmF8MiPJ8+pxSz+wU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OTAFDdHaRMZHPrQP1n6sDAuUiC3esh26l/vK36CEAseM+87f7dpWsay+YzV8sVYe6atDSx1HKGalJsuVYowGo2RBq8oBeSRWEpucly1g2WmxZPsLZwotXOQjCdkjgES+xMt7bp17GCOGqITG4iyGspk242g5zAesg+ZsZOJ921Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HBSLkXcq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH7sYZg002145;
	Tue, 17 Dec 2024 10:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xjff7VUjTHEpPBcaH98HyqYn4ARocaGEIqd
	cX6rOx/E=; b=HBSLkXcqB/q3sVZXoxhT4Zq+XcG3KfmxISfkz7D6hNISsB3elBw
	SC4/CNJL39ndwjv0rloZ9nYR0c4hSlAgqqI5x1YxxANsXzNWOqAYNjnXK+AVIejq
	9C+CCGpuZKK9UvkJuva9bBlNeO9iqHVjQtaTtpU4AB/qhJ1FaLleSNPozfAT2cDK
	1KN+pG5oybB5OSACTZHxcmBhuIafij3Lqv8CBqi4SNrNTF4oBEMKpZut1NGf9Gjq
	tmxzq1inmh9ilvKn6VfjRgpMk+T2/eMed6Eza3zSCmnvWxZIOEJyp3h4mNzae2mU
	6scTNhNegpCJcOnbUL/qanHivEpFNAYlKPA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k5aw8b57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:02:58 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHA2uO8032218;
	Tue, 17 Dec 2024 10:02:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33key0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:02:56 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BHA2umD032213;
	Tue, 17 Dec 2024 10:02:56 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BHA2tY1032211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:02:56 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 8BD091BD4; Tue, 17 Dec 2024 18:02:54 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: [PATCH 0/2] Enable SDHC1 and SDHC2 on QCS615
Date: Tue, 17 Dec 2024 18:02:35 +0800
Message-Id: <20241217100237.2932895-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-ORIG-GUID: bA1i1yrKOUQiQonXGr8C8MGY-u0gaezs
X-Proofpoint-GUID: bA1i1yrKOUQiQonXGr8C8MGY-u0gaezs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170082

Add SDHC1 and SDHC2 support to the QCS615 Ride platform. The
SDHC1 and SDHC2 of QCS615 are derived from SM6115. Include
the configuration of SDHC1-related and SDHC2-related opp,
power, and interconnect settings in the device tree.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>

---
This patch series depends on below patch series:
- gcc: https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/

Changes in v5:
- Modify SDHC1 and SDHC2 interconnects, for the cpu path, use
QCOM_ICC_TAG_ACTIVE_ONLY to replace QCOM_ICC_TAG_ALWAYS
- For SDHC1 and SDHC2, Add a newline before status
- Rebase Change on tag: next-20241217
- Modify dependency changes
- Link to v4: https://lore.kernel.org/all/20241206023711.2541716-1-quic_yuanjiey@quicinc.com/

Changes in v4:
- Move properties which are not properties of the SoC to board DTS
- Add ice region to SDHC1 Node reg
- Add 50Mhz 200Mhz to SDHC1 opp table, add 50Mhz to SDHC2 opp table 
- fix SDHC2 Node compatible space
- Link to v3: https://lore.kernel.org/all/20241122065101.1918470-1-quic_yuanjiey@quicinc.com/

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
  arm64: dts: qcom: qcs615-ride: enable SDHC1 and SDHC2

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  37 ++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 211 +++++++++++++++++++++++
 2 files changed, 248 insertions(+)

-- 
2.34.1


