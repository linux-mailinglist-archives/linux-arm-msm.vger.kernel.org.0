Return-Path: <linux-arm-msm+bounces-33689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B19968BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 13:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF75828266F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 11:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B273191F74;
	Wed,  9 Oct 2024 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K56EzOcy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF2D58222;
	Wed,  9 Oct 2024 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473155; cv=none; b=ZBuGLzucc+5lThj3GEuR/8ntS/V3gnJIZj55vppCBrnZeDJbyWhypKoDJRPtW9GCpREvWXXzlHqEXbmOGdf1xrLDplnSN0q8FraIMcdOICy+/TZFxBgwf2lwxHvHwkPOS7z1mrI5zX7Z/CITuIl756dF4g9gCfyyabBkiHYDBms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473155; c=relaxed/simple;
	bh=aHA0iUWPEFT3IbFR1TA1T8dPf/5fafb10xlp4mn+2Ck=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gdLuwkMjprcw4hHZjQF3GoDa/uxIsB7pEFg9kWIe5vadOjpAlzkZkb+N8fMXtbcvT2oH2dPjpmoTC+VyyPhXmRDBSs38mjoNPQhkDG4Xs1Kd1Knmu9g7fN8iOIbM9jpT5qH+Z5YkppIBRvgwSlJ4ptHYRpfEtfJ5LuL8zVCezpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K56EzOcy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499A9lUR007007;
	Wed, 9 Oct 2024 11:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vz5/kcDxtEOju7Z676DeiXJmEA1JXEODXPhijTBJr1U=; b=K56EzOcyEMvTsJuB
	8aDE7k7ZwyygvTQ9ELXh5eT3J6+BwCkahiMvIGXtRJSKRiDZzI5LAGvANZCMkIn2
	H6cpaY4odnR+KPvZ2VxKu18ycj1vSTFygkBNZVG6rTicB+WzQTp+YADHbegGxO2u
	xVcdE8fjEqbe9Pk3yr5h4MBgbnR4f8hLc1oIkWn6m9ceDPtDUmCDPUNow+OkUkE2
	RFvqu/DSE6QXXiQcLtJBQJt+840bmnXAySXkks10NURmu+eAaBZcG/JMgQfxosAE
	/oGMrDLqGsNDEC0+xUqqAxLAbGwxmAmUfQBdWjNfieZT8lgxZKmmY68fbatnMDRL
	kWL/HQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy7f3y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 11:25:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499BPX5V012080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 11:25:33 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 04:25:27 -0700
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
        Bjorn Andersson <andersson@kernel.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v6 1/5] Coresight: Add support for new APB clock name
Date: Wed, 9 Oct 2024 19:24:59 +0800
Message-ID: <20241009112503.1851585-2-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009112503.1851585-1-quic_jiegan@quicinc.com>
References: <20241009112503.1851585-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 0CyL-C0peonIm9OsCwQPoS2QlHFuQ9Fq
X-Proofpoint-GUID: 0CyL-C0peonIm9OsCwQPoS2QlHFuQ9Fq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=930 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090074

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


