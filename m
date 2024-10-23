Return-Path: <linux-arm-msm+bounces-35575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 449239AC66D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 11:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E45B91F228E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D56219CC28;
	Wed, 23 Oct 2024 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hfRsGYbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4695C155393;
	Wed, 23 Oct 2024 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675692; cv=none; b=KB0L9oM9qOxafurleuVq3MWe2e6OYEUcu6BUWlg+sWSz7xc8ANUspG1p8cosoXDPXQE5PAMdYdXT4d4I7ShOLZD4P/Xki9CaooZLSv5Q/DUoRPw2I5ZcbA5eil8+UgU4shRjcQS353gIBYveCKVMsKmCsRC80qNrIEVfEA85Gko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675692; c=relaxed/simple;
	bh=VY5NdMaZIvLA7s0Cdx20aTCw4d+xsTj4YBfSP6qLQao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U2BWL8C8lYmxyU1s4CVARBHqwjyBrFGA+cKPvjzKlDCpI5KrGRp3844K3QedRccYDMZZANCwluHRTOhxYnNSDPVwpQzuODlkFYbqS5XzZjDKSUCsHqpHrhaboplUpvFG7clgoWzSWneTElibhIorKd0H6xb1bEhK99aDikyqv6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hfRsGYbm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLa4x1025445;
	Wed, 23 Oct 2024 09:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AlpIcVGnnvJ+HBshW88ZibZDP4K+4ikzz1p
	uxILa3wI=; b=hfRsGYbmUIjcGc4sWIrXNpELUYZI+BshfMvu8iaFxVct9+BrR55
	iUVXpBmCNBHUuRI9G085XicPH2ug/rstJDK/ha9aOehoeISJ+pRd5Lbw9Ac97rPK
	2vHKf7wkXa584QNIfJIyBrfjhzGeJzDOJ1Gy91VS5xsbUV5llvtCT83rDbFm0LU2
	XrmNqE05UIq76XbOLO+OMkLQXX3k6RJR8uqZc5Iie2Zb0CNaVIuDLgbNd2lBJiAo
	jg6MTZAAR1V3rhKcMb8bSkdoa49bTxSStaFrRdJh6o0fYk1L1Tjs6cDposVaylTj
	ANv/K43wBUnxfyJ6xj1ZqDm6Ld/YAtVeVZA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em409nwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 09:28:05 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9S3tF016260;
	Wed, 23 Oct 2024 09:28:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 42cpckqq25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 09:28:03 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49N9S3Bb016238;
	Wed, 23 Oct 2024 09:28:03 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49N9S2Cx016230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 09:28:03 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 7A7E6137B; Wed, 23 Oct 2024 17:28:01 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com, Yuanjie Yang <quic_yuanjiey@quicinc.com>
Subject: [PATCH v1 0/3] Enable emmc and SD on QCS615
Date: Wed, 23 Oct 2024 17:27:05 +0800
Message-Id: <20241023092708.604195-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-ORIG-GUID: T-tugc3eDUQJyZEF7YWgYe-RzSegNURI
X-Proofpoint-GUID: T-tugc3eDUQJyZEF7YWgYe-RzSegNURI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=991
 lowpriorityscore=0 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230058

Add SD and emmc support to the QCS615 Ride platform. The SD controller
and emmc controller of QCS615 are derived from SM6115. Include the
relevant binding documents accordingly. Additionally, configure emmc-related
and SD-related opp, power, and interconnect settings in the device tree.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
https://lore.kernel.org/all/20241011063112.19087-1-quic_qqzhou@quicinc.com/

Yuanjie Yang (3):
  dt-bindings: mmc: Add sdhci compatible for QCS615
  arm64: dts: qcom: qcs615: add SD and emmc node
  arm64: dts: qcom: qcs615-ride: Enable SD and emmc node

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      |  31 +++
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 198 ++++++++++++++++++
 3 files changed, 230 insertions(+)

-- 
2.34.1

Thanks,
Yuanjie

