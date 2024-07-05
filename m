Return-Path: <linux-arm-msm+bounces-25334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC59F928438
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 10:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC8461C22DA6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 08:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BFC146D6A;
	Fri,  5 Jul 2024 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VYWtVMDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB03146A9D;
	Fri,  5 Jul 2024 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720169573; cv=none; b=t/u/YIPti44xEoRRpvcrqNeWrsNqum2F47nYn1SVuS21LuIMgPeplhcI32nIlShWFqxdRLpvxHkNMgWLmoxQi9CcMNDBq5Qe0nH/w5UOopH89am+zLsxBz434hht+mvwG0r2n5VpsU6x4KCQ9ft2z5T+nsXX2yENqBYzQoTzI4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720169573; c=relaxed/simple;
	bh=1EDXJsRapLfRsQyZ9e6wT9u++sCHv++Wzgq/ubLI0uY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G1NMFlwKc7K3HhK6vkgfHm8msbtjWSXF+35JRmJ6CmK6tK7vInC+X+ZriZF1OO6kS88VRfS5eugpNrF0NQ9YSMQjC5oBNozsIiMwJoAZ0bDbw6hr59yt/BMaC1yOY84/73rYYAKLtjbhWlCnuXRKW8mZ4sjZyxsshSv88Zlm5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VYWtVMDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4657xhTY020994;
	Fri, 5 Jul 2024 08:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qb1XPLFu+Q4nDgDk4YaRZrbQ
	xukeJ6QWiQb1Jo1xbS4=; b=VYWtVMDEPNkxgAcT7Zzjv3jP5ZtIPUQ9YH8GGwlj
	OU619eZdJyDjEYNVxLWcvzGXlgG9Vnq5RLJIMsxxIComcnsFGg6oLUMW6Th8TnUm
	J0ysxf6rtz9+X0QX6tJ2uwWZqytkVsNc1jY2pLT3i1fp/Sn6Ea0eaMY1KmYLmx/D
	jK7dAMGEAvjS1Qw+I1i7N5LejoGaPZSlPrW7XhTFn9EOCE/Sd1fustB1nMAhVQjb
	H33iFtrzmjeNsr0Dv9vYuYnNSjr41Mt7SE/qiSSM/lbllPujD0AGlo+Y60qKKkpu
	2q3L4BWsXczn9koi+NY7pfezXyj9Xoz2eklwHl5p+viUMw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406cww84p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 08:52:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4658qd5X020074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 08:52:39 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 01:52:35 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        James Clark <james.clark@arm.com>
CC: Tao Zhang <quic_taozha@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v1 3/3] coresight-tpda: Optimize the function of reading element size
Date: Fri, 5 Jul 2024 16:51:52 +0800
Message-ID: <20240705085152.9063-4-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240705085152.9063-1-quic_taozha@quicinc.com>
References: <20240705085152.9063-1-quic_taozha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: IWBEDZdVDVJhSUPY8anBbxp0wzffX-Av
X-Proofpoint-GUID: IWBEDZdVDVJhSUPY8anBbxp0wzffX-Av
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_05,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050066

Since the new funnel device supports multi-port output scenarios,
there may be more than one TPDM connected to one TPDA. In this
way, when reading the element size of the TPDM, TPDA driver needs
to find the expected TPDM corresponding to the filter source.
When TPDA finds a TPDM or a filter source from a input connection,
it will read the Devicetree to get the expected TPDM's element
size.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 52b0201090fb..fc5a4e46cf5d 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -110,9 +110,12 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
 		    csdev->pdata->in_conns[i]->dest_port != inport)
 			continue;
 
-		if (coresight_device_is_tpdm(in)) {
+		if (coresight_device_is_tpdm(in)
+		    || csdev->pdata->in_conns[i]->filter_src_dev) {
 			if (drvdata->dsb_esize || drvdata->cmb_esize)
 				return -EEXIST;
+			if (csdev->pdata->in_conns[i]->filter_src_dev)
+				in = csdev->pdata->in_conns[i]->filter_src_dev;
 			rc = tpdm_read_element_size(drvdata, in);
 			if (rc)
 				return rc;
@@ -124,7 +127,6 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
 		}
 	}
 
-
 	return rc;
 }
 
-- 
2.17.1


