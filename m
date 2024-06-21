Return-Path: <linux-arm-msm+bounces-23571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E2E912459
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 13:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D9B1F213E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 11:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6910F174ECF;
	Fri, 21 Jun 2024 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BXzEOAQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0DA17335C;
	Fri, 21 Jun 2024 11:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970483; cv=none; b=lsgxB9AL+d777rB2OkzgO9uaC0Qj+U3+xzdrWt+pvzdZOJ2+aKejhA9IHA0PYRlAEmZzoiP1dCLa8xIoXNSAotPwGuTJgnLW2xVLb3sr+N+vDKvu5nZpP1qUvCU5XpNd8Yf7XlqKJspAEXhrqn8bfFVcLrNGMtL04MJVNnpJDMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970483; c=relaxed/simple;
	bh=7Z+8FcX1N2P4XzCec6u30kS5YpcYPjQl4yJIYffpZ3g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aIqIhnPeBF4OyFoaNNJj8tBk+V9Yo1P92W2Qu7I8pkVUgB3rUHLaJryZeqs3esBsn7/HOfLdbqE7EL3wbDhqPV6U//L7pf3JB+ekMPRTV6JX2alHIphzTW+UytlDvhCydgUmEe0LJbDrD2ryc4s13Oo6kndmZofPQa8EG0Bx9TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BXzEOAQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L8i1wd021385;
	Fri, 21 Jun 2024 11:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+ouvelZxylIYzDsDNrPHND
	Hg91pcIf3hHhEAdWgue/M=; b=BXzEOAQ9lWcUvXPJ9SodSPcjT1R/OiGUJFL3Ho
	PHP8RMiMRyc7hLKC19ZbgpkGTO7ZWSrcXJqPDkXmnCOH/VBwK4OOcFXlwzyOm44z
	+IIORfVjK+kZwMaNATwsMnbefw0gpFhXriwTE7ctRSlxfWFQ1Saa46NMVzc2kmm2
	mfcVCpYLyVxrLAxe63XWj/bSzuW1LevMc7tLMwwGUOiGxV3OhGLaZR4O5wq6ZLtH
	JOTSX7uhWQDC2OeEN/Ig+/DGaoGRhff4kRT20ZQVWEGAQ1/E99NEYQZYQPtu3NrJ
	j2mr1+6fYvecw+Fzh8rI0MA0Ojndf87BpNFeCnIPVFM1vHSQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw6920dw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 11:47:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LBlL8l023071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 11:47:21 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Jun 2024 04:47:16 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <sboyd@kernel.org>, <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>
CC: <gokulsri@codeaurora.org>
Subject: [PATCH v9 0/8] remoteproc: qcom: q6v5-wcss: Add support for secure pil
Date: Fri, 21 Jun 2024 17:16:51 +0530
Message-ID: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ltZ0Ud7emP-AmLq_72k7T8yRPOTSW_rQ
X-Proofpoint-GUID: ltZ0Ud7emP-AmLq_72k7T8yRPOTSW_rQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210087

IPQ8074 needs support for secure pil as well.
Also, currently only unified firmware is supported.
IPQ8074 supports split firmware for q6 and m3, so
adding support for that.

changes since v8:
 - Rebased on top of Linux 6.10-rc4

Gokul Sriram Palanisamy (8):
  remoteproc: qcom: Add PRNG proxy clock
  remoteproc: qcom: Add secure PIL support
  remoteproc: qcom: Add support for split q6 + m3 wlan firmware
  remoteproc: qcom: Add ssr subdevice identifier
  remoteproc: qcom: Update regmap offsets for halt register
  dt-bindings: clock: qcom: Add reset for WCSSAON
  clk: qcom: Add WCSSAON reset
  arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC

 arch/arm64/boot/dts/qcom/ipq8074.dtsi        |  80 +++++++++
 drivers/clk/qcom/gcc-ipq8074.c               |   1 +
 drivers/remoteproc/qcom_q6v5_wcss.c          | 162 +++++++++++++++----
 include/dt-bindings/clock/qcom,gcc-ipq8074.h |   1 +
 4 files changed, 212 insertions(+), 32 deletions(-)

-- 
2.34.1


