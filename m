Return-Path: <linux-arm-msm+bounces-9735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C7848B34
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 06:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 728131C2172A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 05:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCD87465;
	Sun,  4 Feb 2024 05:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oJ4AgmBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849986FC5;
	Sun,  4 Feb 2024 05:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707024691; cv=none; b=VAe65deYvzDYq6jtGGYmZnG3Ymm//kQN7DpiIWlx411XDeN3vhcADFiJAt48IIH20P5MbbznySJ8wE/Y5kwkvVuyw3rjk5eLyd1lrxaXPoflORvXgmdjQDfKYB9Oq1PyPsEnlRJ33PzG13f7mlZbzc+hyKCXpQbeopmprXQLiVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707024691; c=relaxed/simple;
	bh=Uewh1FnrdtUjaw3IbQp5/cVxlxfhVTRPnk+3maWKx+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HOHHvK7UgqsdcTBV5TNfx5ENGMg6AaoyTGzTJpzDgdgQyUFfE32NlOgxFLDW33Ce5KXKxK5ERkljJ78cc/Q+1PBfS35WwPrYT4ojLjHyn34+W2+tD045Abnb9qi0cTEEVfmbfRxYnNsQ+z7MCiqYKYFnN/HZWtVGyHIaLjhpFVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oJ4AgmBA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4145VIK7032088;
	Sun, 4 Feb 2024 05:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=eG0cw3V2V7bP1GdeOMsX
	cfVKOjDgrWaClaMQX8x+Rcc=; b=oJ4AgmBA9lgV09dBFQ0apBSTE0Je1wE+oPrH
	De7yS/PRrwxRRrAMJ2RV/ZeH2iwkDmZis6tBeorl2XJrbSEp26l8QDCSNQA7xqyO
	tLOiiw59HWe4JLr8rr1w9FKbkiARg9dTCaqxKLAHM17ywquXMZc2Pfp/xj1p8+lO
	vOaZNueEnpRzystww1VThDhQMKAd5lCCGNy4Iwj0brpqYv23mnck6lId9ZLeZ+YL
	3UYaq4dzp3U+HvCY1e8vjnM8VEsr6AHsD877jCqYYtm4XJxV3vU2Jtd/NVjp6+j+
	ySq9kLtKbuTry2GpJMeWujhPl7uPjE8BJtRd7GYArt/h/9+lUA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w1f1rsaut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Feb 2024 05:31:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4145VH1E014350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 4 Feb 2024 05:31:17 GMT
Received: from taozha-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 3 Feb 2024 21:31:12 -0800
From: Tao Zhang <quic_taozha@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Tao Zhang <quic_taozha@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <andersson@kernel.org>
Subject: [PATCH v7 01/10] coresight-tpdm: Optimize the store function of tpdm simple dataset
Date: Sun, 4 Feb 2024 13:30:32 +0800
Message-ID: <1707024641-22460-2-git-send-email-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1707024641-22460-1-git-send-email-quic_taozha@quicinc.com>
References: <1707024641-22460-1-git-send-email-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CpjwQG2-GdPYI8055xbhE4qe9JhpzKwl
X-Proofpoint-ORIG-GUID: CpjwQG2-GdPYI8055xbhE4qe9JhpzKwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-04_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=882 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402040039

Replace spin lock/unlock to avoid forgetting to unlock when the
function exits. And refine methods for handling various conditions.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 39 ++++++++++----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index bd13a548375c..0427c0fc0bf3 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -77,51 +77,50 @@ static ssize_t tpdm_simple_dataset_store(struct device *dev,
 					 size_t size)
 {
 	unsigned long val;
-	ssize_t ret = size;
+	ssize_t ret = -EINVAL;
 
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct tpdm_dataset_attribute *tpdm_attr =
 		container_of(attr, struct tpdm_dataset_attribute, attr);
 
 	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
+		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	guard(spinlock)(&drvdata->spinlock);
 	switch (tpdm_attr->mem) {
 	case DSB_TRIG_PATT:
-		if (tpdm_attr->idx < TPDM_DSB_MAX_PATT)
+		if (tpdm_attr->idx < TPDM_DSB_MAX_PATT) {
 			drvdata->dsb->trig_patt[tpdm_attr->idx] = val;
-		else
-			ret = -EINVAL;
+			ret = size;
+		}
 		break;
 	case DSB_TRIG_PATT_MASK:
-		if (tpdm_attr->idx < TPDM_DSB_MAX_PATT)
+		if (tpdm_attr->idx < TPDM_DSB_MAX_PATT) {
 			drvdata->dsb->trig_patt_mask[tpdm_attr->idx] = val;
-		else
-			ret = -EINVAL;
+			ret = size;
+		}
 		break;
 	case DSB_PATT:
-		if (tpdm_attr->idx < TPDM_DSB_MAX_PATT)
+		if (tpdm_attr->idx < TPDM_DSB_MAX_PATT) {
 			drvdata->dsb->patt_val[tpdm_attr->idx] = val;
-		else
-			ret = -EINVAL;
+			ret = size;
+		}
 		break;
 	case DSB_PATT_MASK:
-		if (tpdm_attr->idx < TPDM_DSB_MAX_PATT)
+		if (tpdm_attr->idx < TPDM_DSB_MAX_PATT) {
 			drvdata->dsb->patt_mask[tpdm_attr->idx] = val;
-		else
-			ret = -EINVAL;
+			ret = size;
+		}
 		break;
 	case DSB_MSR:
-		if (tpdm_attr->idx < drvdata->dsb_msr_num)
+		if (tpdm_attr->idx < drvdata->dsb_msr_num) {
 			drvdata->dsb->msr[tpdm_attr->idx] = val;
-		else
-			ret = -EINVAL;
+			ret = size;
+		}
 		break;
 	default:
-		ret = -EINVAL;
+		break;
 	}
-	spin_unlock(&drvdata->spinlock);
 
 	return ret;
 }
-- 
2.17.1


