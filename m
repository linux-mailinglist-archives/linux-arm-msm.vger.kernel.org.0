Return-Path: <linux-arm-msm+bounces-29167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61384959337
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 05:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 841A91C22484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 03:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFE1153BF9;
	Wed, 21 Aug 2024 03:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TbCe7RYH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F274E225DA;
	Wed, 21 Aug 2024 03:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724210089; cv=none; b=FSbPTdVlXbQZlQI+OVDgOSHNBCGpYnHZqXGiCVF531NbVqMikBq3mSFyRcZDBrLUw5AE1Nb30OVdFU9shFB5XbbBk/EQZJ6qbFktQsIRJ6ozwrfEKXh5NNceDMbE+qGxNOk0PCiZSnBQ38VZHdVV6HnXp/5+N13RtuQVG41FU3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724210089; c=relaxed/simple;
	bh=Eiibw1Wc+LJewJts4fwSY7xdWi+BMK4eNdJrKSSzi2k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XtxTK9ig83vbGVXQmMnfSsVtRjuuszHbH127nrund/oowFeELjkFxDK0wgihOtIxMarljOFTFkE90LToBYyC3uY7nEgRy+SxFje8B8+/hFWP1jQyyvSxa2EKKLs/lu9Q7B+Iduy0ygCKC3cP+4qKRKgVYU/SsLZzaBr09eacQAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TbCe7RYH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KLwmSP002309;
	Wed, 21 Aug 2024 03:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P4KZLPoVJvTp5nSTYhgYrhmr
	j4L5CnRViwcYrdtYTkY=; b=TbCe7RYHgX0d4SiiqcVXM3ojINadkYLpCT5lM54C
	QHhjkV/NSwsFq27wAKkG6Go4/Q4tnEcAt+e6Ysy5dyAqaQ9wjMMkIg2j4ICBUaiL
	KdrP5d02jf8Xo7iD8etJ4UWWSWzcdliS4cvjCWJ3JVQHEBHzfkDaPH1btgcT+7tH
	jvDZHe722wdoemLJc2u+TAkTHqAvAjMe+bqViBGFsvUBeE718RVyxAbLt9kbSGIQ
	XxrImZHT6AqpQbA1fkXDDkWzU27x/iDEeeyMb5/CVtDFb0kMo7kNtDEiPNI6nJKC
	KYlSvIEQZuXIOdl3NMRxWr4DBO+KlbgRRZZfoV2A3WkfOQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4145ywday7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 03:14:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47L3EXJr017527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 03:14:33 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 20:14:29 -0700
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
Subject: [PATCH v3 3/3] coresight-tpda: Optimize the function of reading element size
Date: Wed, 21 Aug 2024 11:13:48 +0800
Message-ID: <20240821031348.6837-4-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240821031348.6837-1-quic_taozha@quicinc.com>
References: <20240821031348.6837-1-quic_taozha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: bSksrzskez6UAUZJlcUw9WSFXMpcrgu3
X-Proofpoint-GUID: bSksrzskez6UAUZJlcUw9WSFXMpcrgu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408210022

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
index bfca103f9f84..750323c35c5b 100644
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


