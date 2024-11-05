Return-Path: <linux-arm-msm+bounces-37057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F239BCCE5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 13:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E7421F2161F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 12:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555561D5CFF;
	Tue,  5 Nov 2024 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dScqzy0V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0131D3197;
	Tue,  5 Nov 2024 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730810415; cv=none; b=VfzzMro3yJ8UPBJyC1NfhYpz3LXG2HSxh6UTDwUrjVovfBCerLy3U68xpF3HRFIQS2c0FoXeJOkPco2yx2YqlRCXQLKOv7Fdcnw/z5k0+YsvCiGDlIX1YBrlzunjrT7vNAGrnZ7HdrDim4rqzpTOPHOx5NcreR6OyF8MXOejUlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730810415; c=relaxed/simple;
	bh=erITNAgnaUE75kW9BXPhVUjZw5WBr0A7YDJQMZLAdoY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2hk4LMSbpcOhWsngW4YeeW4J59kl6xxq3rWQ/8uA3m997sOAYJCzi/GVO0EgMIHPorfbMahuuWWjX7kjJPQimqx8Q1eOMDSUUl/7rj2gJdEp7Dyfj8FH3IEBI8OIj4lHvy2ZchesSJE/IbqqD83j94TpcPhGAu40cGWKeX81uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dScqzy0V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59fndq028852;
	Tue, 5 Nov 2024 12:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lsI0ygaqx/gU9jS67Hj7wuGY
	Zqj5g8WTYr/Rffy4kuU=; b=dScqzy0VmdiVj0zZqQdhOS9egBfM0UJW/pjgLZ7d
	gsHNtcFlMpvPwNKqwt5qK39fXWx+pbKBNSLtC1alVlhjuxGkjkqUqH17QUq+Vkju
	Ul2Crq3BS4EY2lALmPP5FnMRD3QfDiSevU2oLLG99Kqx6nCwLpo23d5f38X8oAkR
	2pf8uQTD7WF4euiqxz3bRCatzivUEsVLIyo4fk7E8z4Q5jtGNdFNONxt/QX1ODNf
	2Ia9nBLhQ670RbUjvzmc2pS02jJWHH5WE7VyvGVocrpWhkdewAzkhvkHk6bYbz1E
	8PfVhFTJRGTglBsjrgQajzvAK4Ve0Nun66Ll+OjT3MyptQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd287qdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 12:40:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5Ce5or026242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 12:40:05 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 04:40:02 -0800
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
Subject: [PATCH v2 2/3] coresight-tpdm: Add support to select lane
Date: Tue, 5 Nov 2024 20:39:39 +0800
Message-ID: <20241105123940.39602-3-quic_jinlmao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: thr1woX4G1-wysdjKgUg_9hPbwKjSDU5
X-Proofpoint-GUID: thr1woX4G1-wysdjKgUg_9hPbwKjSDU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050097

From: Tao Zhang <quic_taozha@quicinc.com>

TPDM MCMB subunits supports up to 8 lanes CMB. For MCMB
configurations, the field "XTRIG_LNSEL" in CMB_CR register selects
which lane participates in the output pattern mach cross trigger
mechanism governed by the M_CMB_DXPR and M_CMB_XPMR regisers.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tpdm  |  8 +++
 drivers/hwtracing/coresight/coresight-tpdm.c  | 51 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
 3 files changed, 62 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index bf710ea6e0ef..e833edfec79e 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -257,3 +257,11 @@ Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
 Description:
 		(RW) Set/Get the MSR(mux select register) for the CMB subunit
 		TPDM.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_trig_lane
+Date:		Nov 2024
+KernelVersion	6.13
+Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(RW) Set/Get which lane participates in the output pattern
+		match cross trigger mechanism for the MCMB subunit TPDM.
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 0529858586c1..2e4dc86b03ea 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -252,6 +252,18 @@ static umode_t tpdm_cmb_msr_is_visible(struct kobject *kobj,
 	return 0;
 }
 
+static umode_t tpdm_mcmb_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (drvdata && tpdm_has_mcmb_dataset(drvdata))
+		return attr->mode;
+
+	return 0;
+}
+
 static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
 {
 	if (tpdm_has_dsb_dataset(drvdata)) {
@@ -1023,6 +1035,34 @@ static ssize_t cmb_trig_ts_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(cmb_trig_ts);
 
+static ssize_t mcmb_trig_lane_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n",
+			  (unsigned int)drvdata->cmb->mcmb.trig_lane);
+}
+
+static ssize_t mcmb_trig_lane_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if ((kstrtoul(buf, 0, &val)) || (val >= TPDM_MCMB_MAX_LANES))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	drvdata->cmb->mcmb.trig_lane = val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(mcmb_trig_lane);
+
 static struct attribute *tpdm_dsb_edge_attrs[] = {
 	&dev_attr_ctrl_idx.attr,
 	&dev_attr_ctrl_val.attr,
@@ -1185,6 +1225,11 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
 	NULL,
 };
 
+static struct attribute *tpdm_mcmb_attrs[] = {
+	&dev_attr_mcmb_trig_lane.attr,
+	NULL,
+};
+
 static struct attribute *tpdm_dsb_attrs[] = {
 	&dev_attr_dsb_mode.attr,
 	&dev_attr_dsb_trig_ts.attr,
@@ -1251,6 +1296,11 @@ static struct attribute_group tpdm_cmb_msr_grp = {
 	.name = "cmb_msr",
 };
 
+static struct attribute_group tpdm_mcmb_attr_grp = {
+	.attrs = tpdm_mcmb_attrs,
+	.is_visible = tpdm_mcmb_is_visible,
+};
+
 static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_attr_grp,
 	&tpdm_dsb_attr_grp,
@@ -1262,6 +1312,7 @@ static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_cmb_trig_patt_grp,
 	&tpdm_cmb_patt_grp,
 	&tpdm_cmb_msr_grp,
+	&tpdm_mcmb_attr_grp,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index fd9153b92335..aa9746b2e77f 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -45,6 +45,9 @@
 /* MAX number of DSB MSR */
 #define TPDM_CMB_MAX_MSR 32
 
+/* MAX lanes in the output pattern for MCMB configurations*/
+#define TPDM_MCMB_MAX_LANES 8
+
 /* DSB Subunit Registers */
 #define TPDM_DSB_CR		(0x780)
 #define TPDM_DSB_TIER		(0x784)
-- 
2.17.1


