Return-Path: <linux-arm-msm+bounces-29687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA889961B6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 03:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CF111C22F4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 01:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F43225D6;
	Wed, 28 Aug 2024 01:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kcBapxzb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7B1DFED;
	Wed, 28 Aug 2024 01:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724808478; cv=none; b=rHr5/OfCZdLGMb10dTaFiIj13NHSO08Qvx6BNaFzEE/313Bz+QTppne+jgi66N/NQEGbrLKGgz8HLccpUOoBfbei+4IJEppWpOCnldf/tONTjs4soIWka6iNhDkdNfGJ7qoJzwnW/OMVQqt/JcbLVrgMkjXd+ciPaeOC6bhPtXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724808478; c=relaxed/simple;
	bh=aHA0iUWPEFT3IbFR1TA1T8dPf/5fafb10xlp4mn+2Ck=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cPcEReNivjsSvnUaxShuN/rx1Bm2PdhzXJ+PLSI8jnwVH9INMoVUViH1UK3IHKUJSKwqLX40SX9y8DyezaxR8gGJRXZXfp8H4s00b2y8IX1t0xDTT5T5dJ0eMQsT+rUa7LUK6oVvO3uaCgU76aEYgDBMiLIwUfF/3qp63N7uvzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kcBapxzb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLekwK009007;
	Wed, 28 Aug 2024 01:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vz5/kcDxtEOju7Z676DeiXJmEA1JXEODXPhijTBJr1U=; b=kcBapxzbr69u+saG
	ef5APxUNvQOjjxHSX18SQuRwVeYSW76+a7pWMoMUHPeR9N/te6tEZjov+UDY0BbL
	ip1tbMDx/LI5lSF6ra1SFfIU9sK8QeU894Y1KpwanLOJ27xm+4iX9JYLdjPgZnpN
	nq9YDmw66YvguSQhEtLqFw5p1vi5md0D6oJffKHukLGm2jOu6+2LmO1prZvzyBMe
	0oZGB/R924ujF3UMbUSJX1lQDgy0d5mq5vBidSzvV3Rk6AbEcmtxCSbONkZKW95J
	eBt2j8yQssnJh8H4gO8Z8LqG7Lo/AUmip4MyptGVpgikjF0jDKZuDLBHG8XYQYKk
	82n49A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419px5gb6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 01:27:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S1RaoM003342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 01:27:36 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 18:27:30 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v4 1/5] Coresight: Add support for new APB clock name
Date: Wed, 28 Aug 2024 09:27:02 +0800
Message-ID: <20240828012706.543605-2-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828012706.543605-1-quic_jiegan@quicinc.com>
References: <20240828012706.543605-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: tDELiSqPc2CoUYvt5MX9COBhuDwzmvL5
X-Proofpoint-GUID: tDELiSqPc2CoUYvt5MX9COBhuDwzmvL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_12,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=937 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408280009

Add support for new APB clock-name. If the function fails
to obtain the clock with the name "apb_pclk", it will
attempt to acquire the clock with the name "apb".

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 include/linux/coresight.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c13342594278..497d2206419d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -454,8 +454,11 @@ static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
 	int ret;
 
 	pclk = clk_get(dev, "apb_pclk");
-	if (IS_ERR(pclk))
-		return NULL;
+	if (IS_ERR(pclk)) {
+		pclk = clk_get(dev, "apb");
+		if (IS_ERR(pclk))
+			return NULL;
+	}
 
 	ret = clk_prepare_enable(pclk);
 	if (ret) {
-- 
2.34.1


