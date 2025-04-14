Return-Path: <linux-arm-msm+bounces-54190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8AA87B42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF4DB1724CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6137C259CA4;
	Mon, 14 Apr 2025 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iLg09JyN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079325D21B;
	Mon, 14 Apr 2025 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621269; cv=none; b=BPrC4Ojyy6+FT1mskCwbgSRBcyjAwXS1GuCjUVk3F0P7ZKqGDE9oxr1sTdRk7gUDyAlj3NiLSRYn7yuNuq8Z8x7Xc6kpDEtrcx8R/ux44oazpyvNyaBKySa7VKjfMiPKLBoPiAH4NU4uykmyFj7KTsXs4WQsIPoWsEsQiPk2VmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621269; c=relaxed/simple;
	bh=XpKjoyc/maM/AI83DG72PQblLDb10bwW6BBo5l4BUbk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uy4yhiN4U8mBQPVZu6P5StCImB0sIPiy5zdu1j0mQMuLKyFH8SgxPBdsxRzl54PnfAjWwl1IrrM+/QbmCJ5DRDN+MrBLuz0xdGC8yTucbqd/c4rj6ZyuHMYT5JaK7RBTUjtcMPyvaY13Tq3g4ROIpRUhD3raYJ2DBmVOEQtoJNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iLg09JyN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DLdLrX021822;
	Mon, 14 Apr 2025 09:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lmwobYWlAXVy0Fy8/ab2+M
	UkFHFk7p0ntZF3p/2g2XE=; b=iLg09JyN9rH8YMVqXeiR5LpTzyu142dB4UNxJQ
	PClMGAYrKH+746QGsTgPYOJwbs4q+qy+oxYyNqWBqFSy/Giqzt8rHOH1GDRbl8o/
	BCUwxnWWTB29R8fPVmQ+zgf3Mo/LBhiT8SlIzU9A+sct4Fjv4hQlpHEgHSU49NQw
	JJF/vASTB88fjki16TBTdgzHQ8ejGpzIy1DZ0CCUNwLE6teSThj7c6mI3/qPtR5m
	xQ9rcC0WUYoppKLrtE+EZYofYK+yUb99rakMsaL6sg2yCrroGHV1a0Rlzfwfc5kr
	w41d2DmlSfxLhlnM0N/Ef7o9OjOLqy/2ch2G5EN1dckrSrkg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjbxph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 09:01:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E90x4C021496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 09:00:59 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Apr 2025 02:00:56 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 0/2] clk: qcom: gcc: Update the force_mem_core for UFS ICE
Date: Mon, 14 Apr 2025 14:30:39 +0530
Message-ID: <20250414-gcc_ufs_mem_core-v1-0-67b5529b9b5d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALfO/GcC/x3MQQqAIBBA0avIrBPKDKOrREhNU83CDKUIxLsnL
 d/i/wSRAlOEQSQI9HBkfxY0lQA85nMnyWsxqFp1tW603BHtvUXryFn0gaRZFtXPbacMIZTsCrT
 x+y/HKecPPDP5QmIAAAA=
X-Change-ID: 20250414-gcc_ufs_mem_core-7bb28a3527ec
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SXp6c7EGbrymVrEx3pwBIbjwd3aSra1T
X-Proofpoint-ORIG-GUID: SXp6c7EGbrymVrEx3pwBIbjwd3aSra1T
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fccecc cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=M75u7Tp2MPcvN9VRiHUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=647 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140064

The MCQ feature of UFS requires the both UFS ice and UFS phy axi clocks
to have the force_mem_core bit set to allow retention after power
collapse.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (2):
      clk: qcom: gcc: Set FORCE_MEM_CORE_ON for gcc_ufs_axi_clk for 8650/8750
      clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks

 drivers/clk/qcom/gcc-sm8650.c   | 2 ++
 drivers/clk/qcom/gcc-sm8750.c   | 3 ++-
 drivers/clk/qcom/gcc-x1e80100.c | 4 ++++
 3 files changed, 8 insertions(+), 1 deletion(-)
---
base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
change-id: 20250414-gcc_ufs_mem_core-7bb28a3527ec

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


