Return-Path: <linux-arm-msm+bounces-37058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506F39BCCE8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 13:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CCE1B22C12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 12:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF82F1D6DB9;
	Tue,  5 Nov 2024 12:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WzpcucBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3454D1D63EA;
	Tue,  5 Nov 2024 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730810418; cv=none; b=rCpeskqgFdsDuPcUAlQXLSmwYvpb/OnSjZkGFi35UtNlCA+NC+buXb6pZKl8uFR7qY0atPKEyRpPQLyKlM5pDyjMNtsMB+sfRkb2Zcs2FhLeZGsO1TOS5qQZR3WvQMnHChBNzecnVpVLaNYMw4Y9kxk+0FqjWqiYZ/15vbLPywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730810418; c=relaxed/simple;
	bh=EX2TxRDwO3f2Tm0qSOGaeCugTskVNLT6wP+qrzO5gy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVHhfwbpr8GtCU1Ij8ewKfGWbQLtsUjFWDLVY/5kqswKhssY/uTYLAKt/jqxR8Qmwv39GtTqzoDGaX3N7tSmblDduc19cXvRfwzbs0IDozDHEDJy/iCC8dpo1ux0w96K7Wu/iUZVI1vq9RagxpW76aD9S2sGIEpRyOWXNwtw84s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WzpcucBr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5A6cP8021461;
	Tue, 5 Nov 2024 12:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p/Kj6Rf50/Cac0anpob3ONk6
	4MfLU3vCqh2fh0Omueo=; b=WzpcucBrVvFNKKZ2MOB3X6VKOb/l+/PmvleNstZ1
	0qUgwM87+/s0mny3nKzB2/qTBJgVsCsYVkqw/U901pwT4FeaG/GxGqLG3TIfPPtM
	NtkA3ASybLg2EIvSk7TBrjUb/Ip/LdMHSwhu7GwJvDtrr4fF0YeEGYURYmqtWJqd
	Q3cK2FJL0pEtF5cuZ6/WPhuiPj7XHC86V9LRUJ3wnal+BMdscMCtgdlifoqSWan+
	YrqHsFBHKIUhrDPjDEIMtMg0PKrwzyYQWfqxEoXfQV5GLy5SE1ZKO3e0qOAM+hSa
	ziufmJl1Ry1pl0Hau7gJ6xl7YDsrNxoIB6OvgeGIccAOjA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxykcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 12:40:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5Ce8NB028394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 12:40:08 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 04:40:05 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: [PATCH v2 3/3] coresight-tpdm: Add support to enable the lane for MCMB TPDM
Date: Tue, 5 Nov 2024 20:39:40 +0800
Message-ID: <20241105123940.39602-4-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
References: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XCCImNJbR_0os3Ug7-Zs0l-TP6mx89n1
X-Proofpoint-GUID: XCCImNJbR_0os3Ug7-Zs0l-TP6mx89n1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050097

From: Tao Zhang <quic_taozha@quicinc.com>

Add the sysfs file to set/get the enablement of the lane. For MCMB
configurations, the field "E_LN" in CMB_CR register is the
individual lane enables. MCMB lane N is enabled for trace
generation when M_CMB_CR.E=1 and M_CMB_CR.E_LN[N]=1. For lanes
that are not implemented on a given MCMB configuration, the
corresponding bits of this field read as 0 and ignore writes.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tpdm  |  7 +++++
 drivers/hwtracing/coresight/coresight-tpdm.c  | 29 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
 3 files changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index e833edfec79e..fcc2a8f1f17f 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -265,3 +265,10 @@ Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get which lane participates in the output pattern
 		match cross trigger mechanism for the MCMB subunit TPDM.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_lanes_select
+Date:		Nov 2024
+KernelVersion	6.13
+Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(RW) Set/Get the enablement of the individual lane.
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 2e4dc86b03ea..bb0d6505ec9f 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1063,6 +1063,34 @@ static ssize_t mcmb_trig_lane_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(mcmb_trig_lane);
 
+static ssize_t mcmb_lanes_select_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n",
+			  (unsigned int)drvdata->cmb->mcmb.lane_select);
+}
+
+static ssize_t mcmb_lanes_select_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf,
+				       size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val) || (val & ~TPDM_MCMB_E_LN_MASK))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	drvdata->cmb->mcmb.lane_select = val & TPDM_MCMB_E_LN_MASK;
+
+	return size;
+}
+static DEVICE_ATTR_RW(mcmb_lanes_select);
+
 static struct attribute *tpdm_dsb_edge_attrs[] = {
 	&dev_attr_ctrl_idx.attr,
 	&dev_attr_ctrl_val.attr,
@@ -1227,6 +1255,7 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
 
 static struct attribute *tpdm_mcmb_attrs[] = {
 	&dev_attr_mcmb_trig_lane.attr,
+	&dev_attr_mcmb_lanes_select.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index aa9746b2e77f..a80f3d680995 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -48,6 +48,9 @@
 /* MAX lanes in the output pattern for MCMB configurations*/
 #define TPDM_MCMB_MAX_LANES 8
 
+/* Filter bit 0~7 from the value for CR_E_LN */
+#define TPDM_MCMB_E_LN_MASK		GENMASK(7, 0)
+
 /* DSB Subunit Registers */
 #define TPDM_DSB_CR		(0x780)
 #define TPDM_DSB_TIER		(0x784)
-- 
2.17.1


