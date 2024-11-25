Return-Path: <linux-arm-msm+bounces-39096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C99D85EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 14:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C261028571C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 13:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15E61AE863;
	Mon, 25 Nov 2024 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nDCehOv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E49D1ADFF8;
	Mon, 25 Nov 2024 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732540012; cv=none; b=sIy6VtvkgJhmEcbicLUiqDf8U4S1nx6NkqQ5R0k0GKs5Slae6EROKSudiCsKCXCYhU1LzsrkanxVZysaMoLnVnfucfS1prjwJ6Hxza0lakgnWvMlABRn7JYEh3sBlla92W/w2V8/38g0HtnxcCnFH55B3xE3YUrx/kIMdqiT0Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732540012; c=relaxed/simple;
	bh=xBc+1L6Q/IonCQYUkezY5NPL3xHHBdmVBzv3MRLIHnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C87I2byJs8o3j+eMc71uIdIsKgV98kGW2LU2RUBa5Z3CC0W6SSZxkWN/D9gJWXQ3CDjsi7BNuG9o0exq2Zx4tqNk7beC+Rf+HUD38Hz9FYVthwVombMxtZ6YNr8tthsvsFvEUH5f2HmoxQ+zisPUdKL2agfGgmMDqhx/DnHyv9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nDCehOv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APBTHu1002921;
	Mon, 25 Nov 2024 13:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w3QGRmNgjXIiFwwmNaUFfizy
	UclQYS0Fh9BYwMiMwvs=; b=nDCehOv4ut7rVuuxq/anl3bEiKpAKN5rxrPZ3MSJ
	oBk3X8K4ksz6mcJ8DwmUmfIXHeP4heF4aZyI5lcZAxIeIyHHQAQcNXBFgXlIc65y
	jkFwwnKn800TNUBuPA5UBj3ceG0ywJ/TO1UHefbf3N/CEXuDaN6H91xgfOMHPQQD
	CoIu4Qvzznzj0qhu/fAOesPx1A8F6YDbBtFNspUbI69jepdSsYrC0gCHqP41KrSW
	u9SwaAS5x/js4zP4eTiYO58RZFdtAmd2G62pd8UnVHlc8WyjChpBc7J8Eurr+adX
	dL2OZZNZd3jkwmB+zSIVKfR9Scq2g15YRH9yzN74xnN5eQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336cfmwhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 13:06:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APD6ckj005692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 13:06:38 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 05:06:34 -0800
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v6 4/4] coresight-tpda: Optimize the function of reading element size
Date: Mon, 25 Nov 2024 21:05:55 +0800
Message-ID: <20241125130555.19924-5-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241125130555.19924-1-quic_taozha@quicinc.com>
References: <20241125130555.19924-1-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p-on--zCHmCFOg5CTA0H-X4Lqoss5ev9
X-Proofpoint-ORIG-GUID: p-on--zCHmCFOg5CTA0H-X4Lqoss5ev9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250112

Since the new funnel device supports multi-port output scenarios,
there may be more than one TPDM connected to one TPDA. In this
way, when reading the element size of the TPDM, TPDA driver needs
to find the expected TPDM corresponding to the filter source.
When TPDA finds a TPDM or a filter source from a input connection,
it will read the Devicetree to get the expected TPDM's element
size.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index ad023a2a99d1..413828f19d60 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -110,6 +110,16 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
 		    csdev->pdata->in_conns[i]->dest_port != inport)
 			continue;
 
+		/*
+		 * If this port has a hardcoded filter, use the source
+		 * device directly.
+		 */
+		if (csdev->pdata->in_conns[i]->filter_src_fwnode) {
+			in = csdev->pdata->in_conns[i]->filter_src_dev;
+			if (!in)
+				continue;
+		}
+
 		if (coresight_device_is_tpdm(in)) {
 			if (drvdata->dsb_esize || drvdata->cmb_esize)
 				return -EEXIST;
@@ -124,7 +134,6 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
 		}
 	}
 
-
 	return rc;
 }
 
-- 
2.17.1


