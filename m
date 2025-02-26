Return-Path: <linux-arm-msm+bounces-49423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F0AA455D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 07:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 084673AAF17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 06:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B17926D5C2;
	Wed, 26 Feb 2025 06:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OjPv2X+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6900D26E162;
	Wed, 26 Feb 2025 06:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740552046; cv=none; b=KwRwLRnH1CLEO/qBPFlX7DRe7d5ITC63+Ahj3kNw+DhzKwSpT9VVs1C7cI5mgQkhjsq0T8+AoOic/3z9ieABOY5zCstmpHvkaOUCcs4isF2NUbJVAJbbK1aRW0AJA0BNsb49UCxg1iSsyYOSIqyQz1KN2EKtYkjPgYX7O/a9hWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740552046; c=relaxed/simple;
	bh=RDZiSeJ75w1ZBpkwdFGJfnMn5ABQ4j/6L/fBxjOvyGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=efEf671ETNHAchQxYX7YlZR2O5uFAyYgP74lqGDHFgenleAeGsXTG/5tMzUquxC51EHPlNdnJyaoRH2YnWo0zTucOqj88fU9/+yky0mc1Ymgo/ZJZP+yGSAnQxtQck+vsK1FkH4QmnRxmXDSCrSX2Orsn6KBRj+c8V7PCSWWE5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OjPv2X+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMWt6C023836;
	Wed, 26 Feb 2025 06:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fS18XA1i83ik8AMNsEw0GD5/kuFLTG8IstEszd/1g/A=; b=OjPv2X+TKzPXx5UQ
	YDPaQt5i5TRlNH2swsCWP6wpOepaqYaeH/OXAZderGHTDpSP5epn+H8O20EnMGob
	6nzuDpnOE32PF059gDed1q6TyO7omU9uYm0r/jn/kfAIEzqvjSeWxdDBu7Lr9o7+
	7Duifr1lgJssFuovdbcBWs8pUQ6ETnqe/G6cSAkV+MWJ6VUQaDWMtLInIAhPQCPX
	uQjwdkYlHjoTuIsUtWwPAgyJJjK2UGbwJU3pWAjHLFu6SFRYgjIgMjtn5fPXmZBP
	fWuDTIT7aOoNNextD+Zi4Eo/xIVhsy6pePmrdl87cTbS+71ZXvkEATmWQq2sIpor
	V2oQ1w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmh0na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 06:40:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q6eRWd025972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 06:40:27 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 22:40:27 -0800
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
Subject: [PATCH v4 3/3] coresight-tpdm: Add support to enable the lane for MCMB TPDM
Date: Tue, 25 Feb 2025 22:40:08 -0800
Message-ID: <20250226064008.2531037-4-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226064008.2531037-1-quic_jinlmao@quicinc.com>
References: <20250226064008.2531037-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iSna2BYvH3vvdQWHYyObej5KYFLi7-TE
X-Proofpoint-ORIG-GUID: iSna2BYvH3vvdQWHYyObej5KYFLi7-TE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260051

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
index 547540e330c6..a47ea46c6f9b 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -265,3 +265,10 @@ Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
 Description:
 		(RW) Set/Get which lane participates in the output pattern
 		match cross trigger mechanism for the MCMB subunit TPDM.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_lanes_select
+Date:		Feb 2025
+KernelVersion	6.15
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(RW) Set/Get the enablement of the individual lane.
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index c57f8da2962e..c9691b5dbca4 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1060,6 +1060,34 @@ static ssize_t mcmb_trig_lane_store(struct device *dev,
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
@@ -1224,6 +1252,7 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
 
 static struct attribute *tpdm_mcmb_attrs[] = {
 	&dev_attr_mcmb_trig_lane.attr,
+	&dev_attr_mcmb_lanes_select.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 932c5dfc89b1..b11754389734 100644
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


