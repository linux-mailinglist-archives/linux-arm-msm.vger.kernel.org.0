Return-Path: <linux-arm-msm+bounces-23197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED590E8CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 12:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 183BF1C211F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 10:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C7C81722;
	Wed, 19 Jun 2024 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Om7QNbqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E512FF64;
	Wed, 19 Jun 2024 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718794637; cv=none; b=b3Nwnh7oA9AJVKL+3bZmLl9W1NNNDdSpto68QZppJr/N5CK1egeaRFa3vYbGCrJeeIbZXx1Fj2/eFOMcH7fZXwxkwQzrwFl9NZUHWiKqUJtdKEO+nREyhFyF/ZvfYBGrk96b/mhE68WRJKzJeEl4IZro8Qqnoi3hyYgXlM69/X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718794637; c=relaxed/simple;
	bh=uj/2NtDFN60KENg4dlqpkC5POtuB01x5rjPuBdEDghE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q9IM77Zv2d4cF2XLZNLlHsMcodl23zHR8gAEdYTF6Li7o7EGL9lvxbjyijSRy8AGIe8yPpcbi6cuJSEReLAhC1Ok4/Lpyd9AOTR+QLYWRXQqJTJrtP36XGrm6ZdkV+MPoMCPB0p8t/BBPUKvHSU8Dol0ln5lg2VfKT9Qp1TK9Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Om7QNbqx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9ABbE001115;
	Wed, 19 Jun 2024 10:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uj/2NtDFN60KENg4dlqpkC
	5POtuB01x5rjPuBdEDghE=; b=Om7QNbqxGNI8GyQNvHU3SaaMabHE7e/pBbaXbb
	cmqk0PAsWJMjgab00UjYay/WYuMPbn/rm8atKiyVrE8f/q59o5k6YoGHKunm7m0D
	iGb0rLzeeJe8khEa4+4Z4Q0BAdcnX3LEg0fwkgTq5msujXn7ZK8ggFWZMRX/U6pC
	xh1Y7tG/Fjk+kx60Rvt6jyan+noJ6KLIE1g9k5g+dKlvJ2ah8qK+Vhro6yEGePvr
	WQmaBuj0dTIjxXlbTjutoSvnUvp+kBrXQJHkiSWJ0ErX8YFV9KxVVagh4V9xFHdD
	HGggHLmNJy8vv31sGXPMHPcdMUaQL5uqrwRCuNJ7pkcIS7lA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja29egr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 10:57:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JAv28l022589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 10:57:02 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 03:56:58 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_mojha@quicinc.com>,
        Komal Bajaj
	<quic_kbajaj@quicinc.com>
Subject: [PATCH] arm64: defconfig: Enable secure QFPROM driver
Date: Wed, 19 Jun 2024 16:26:42 +0530
Message-ID: <20240619105642.18947-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AXcVSa1Ya3kZpHPg8HUzSRFr5L5g8Ogv
X-Proofpoint-ORIG-GUID: AXcVSa1Ya3kZpHPg8HUzSRFr5L5g8Ogv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=700 suspectscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190081

Enable the secure QFPROM driver which is used by QDU1000
platform for reading the secure qfprom region to get the
DDR channel configuration.

Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 838b4466d6f6..c940437ae1b3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1575,6 +1575,7 @@ CONFIG_NVMEM_LAYERSCAPE_SFP=m
 CONFIG_NVMEM_MESON_EFUSE=m
 CONFIG_NVMEM_MTK_EFUSE=y
 CONFIG_NVMEM_QCOM_QFPROM=y
+CONFIG_NVMEM_QCOM_SEC_QFPROM=y
 CONFIG_NVMEM_RMEM=m
 CONFIG_NVMEM_ROCKCHIP_EFUSE=y
 CONFIG_NVMEM_ROCKCHIP_OTP=y
--
2.42.0


