Return-Path: <linux-arm-msm+bounces-20184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFAD8CBCC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAA7B282936
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 08:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1B87E575;
	Wed, 22 May 2024 08:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y+hQXb1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E5A78B60;
	Wed, 22 May 2024 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716365758; cv=none; b=Y9NRKUCyZ8FK16W5nRHDh86AECGplsR8nvYG6KqL6osEfXFp4gujPs+PNcHAhfCXBLWsZdjBEo8flKikMLu4wPoxsxAUF+4sK8j3LSIQsuY6vHVGYqNvZSYigumEDtGR1HdNsMmmvEj8Vs0lzM63HFN+zP022YqesdvyFHejMzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716365758; c=relaxed/simple;
	bh=fH7xXo1+MHM/r58rYZpziBSK86WxvzhRBTee5q32V5Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G9LIIJotaK3aR61oE+Y1/CyJtfvHn1tea1shpDUzihNsCkU8rgt5R+JP1Jo45dLEX9/4hxOuSYdkguDwOK+I77NTYayZW4Kzp8EEgzP24AEw0aplopMT/1iczE0nFe0mqfhb/zzN5meqrqtlmfEVUXQH6gdKMVPKujr5JZ34VnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y+hQXb1l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LL14Xp004387;
	Wed, 22 May 2024 08:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=ZlatArn
	dD/w3m0ASBgnYuEQDvCZaAKMkCkz6SJP3IQM=; b=Y+hQXb1lnfmvh3NUgF+XiS1
	8XrZoAQUBwPizGIwoZHpaMWb5sZkx094jlc96qfZjaP5mvnMoJnkh0sqHMbGw72x
	u4wA8sSq6Rb/yfJff00hyPa2xeD1rIeJWTfAUHKiqE12NzMxfyUTe/6tcf5vwlYu
	jMDFGoz4aoJEPlLd9Brp9hcgUtdG9hQNuraTMTp7uJkSK6pa26o7Th66BOLZjVi9
	zoLisBET2oDqXQ9HQF0FqRxtljI9uT1FOmzc6oKmDe8cHOfJW1wHUrgXvxWtHOf5
	rn45EGxKX02nXR5S5TXQp/bkFmiyfpO4UaeHoluHJuyzGF+h4dt9U2DYSLrF8Qw=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqar7x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 08:15:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44M8FqgY006119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 08:15:52 GMT
Received: from hu-kshivnan-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 01:15:49 -0700
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: [PATCH] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
Date: Wed, 22 May 2024 13:45:08 +0530
Message-ID: <20240522081508.1488592-1-quic_kshivnan@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7pH9gsMdYiCUc9qws-LetrJ15fRe15DK
X-Proofpoint-ORIG-GUID: 7pH9gsMdYiCUc9qws-LetrJ15fRe15DK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_03,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=806 clxscore=1011
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405220059

Update zone1_thres_count to 3 from 16 so that
driver can reduce bus vote in 3 sample windows instead
of waiting for 16 windows. This is in line with downstream
implementation.

Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
---
 drivers/soc/qcom/icc-bwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 656706259353..f1065427bb80 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -815,7 +815,7 @@ static const struct icc_bwmon_data msm8998_bwmon_data = {
 static const struct icc_bwmon_data sdm845_cpu_bwmon_data = {
 	.sample_ms = 4,
 	.count_unit_kb = 64,
-	.zone1_thres_count = 16,
+	.zone1_thres_count = 3,
 	.zone3_thres_count = 1,
 	.quirks = BWMON_HAS_GLOBAL_IRQ,
 	.regmap_fields = sdm845_cpu_bwmon_reg_fields,
@@ -834,7 +834,7 @@ static const struct icc_bwmon_data sdm845_llcc_bwmon_data = {
 static const struct icc_bwmon_data sc7280_llcc_bwmon_data = {
 	.sample_ms = 4,
 	.count_unit_kb = 64,
-	.zone1_thres_count = 16,
+	.zone1_thres_count = 3,
 	.zone3_thres_count = 1,
 	.quirks = BWMON_NEEDS_FORCE_CLEAR,
 	.regmap_fields = sdm845_llcc_bwmon_reg_fields,
--
2.25.1


