Return-Path: <linux-arm-msm+bounces-34027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CD8999CF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EAFE285CEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA915635;
	Fri, 11 Oct 2024 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KIEnnC2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B29208994;
	Fri, 11 Oct 2024 06:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629278; cv=none; b=g41g97lvoj6TGXW61qv5/pKeByyqyBbUYh0IghoOmR7sUaO07oyQBfWfbzyvy5X9hpTR6r5uscyDgFGTqdq3uQ5EhcTtNAHD8rjVNJuWDaweUq0Evu71DLLW52MpFWS4LlwuP7RavAs5BnlwXmNfPy1SiymKk5SyV/fQlRIhtfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629278; c=relaxed/simple;
	bh=cJGN9kASnLW4eEhdhlKC5qjExlzZgBAablS0Cd9MqSo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YxpfK0KbaOR76f9NCxEN+Ccb4r5pBctH+a3H5Sc0TuSpl+AlKnay/B3Otp0eWEPo//pcVnDlFcIptWZqKvzCP9eD/MVFPqYMQQcTX4EaO6PO1wbEdO2qfflBoposVQtApBnjBTz+ejwPQz6YGvgxG7d516juf8VBnbgTiQ7+dw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KIEnnC2q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B29TI2026923;
	Fri, 11 Oct 2024 06:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CckiId11iWOgN91dC9ijn51GGK+g+oHcvrse/y4VbTw=; b=KIEnnC2qpNVZj7oa
	zWxtdVoRzZEgGoSz6zT+pcWRkE5idbVl7uhuKrGAt2FfK2sN8MqlAhAuVY4nLa4z
	0YaZAcPe9mH4osXaCfjMIZLHRLJ4zD56Md2kQ0ehKftxKLrVmhfc5DSAoN1NeRwt
	HoW9PjNPLUNUmL3ddk5Vzm43rCXa25TC78j3jMwD/YgnJTzZWO7BsYq4cY4c30WI
	foRDBmKR4ZLT1wRn2dbhMQpHGrww3ViqKG5MEsklnT0I+RbXGlfFjMGaXAZstk+i
	hHnZ/Mg0HXW5FzX0KCenr8OEy6tqFBqbobz26dxY2Sl34MrXfvCk3BhRTtAttb6O
	CPFBiQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8r076y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:47:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B6ljE3029362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:47:45 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 23:47:45 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v1 RESEND 2/3] coresight-tpdm: Add support to select lane
Date: Thu, 10 Oct 2024 23:47:29 -0700
Message-ID: <20241011064732.8480-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
References: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pcZgowA42bgYLeo7ruN0o9QycoAHBO4b
X-Proofpoint-ORIG-GUID: pcZgowA42bgYLeo7ruN0o9QycoAHBO4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410110044

From: Tao Zhang <quic_taozha@quicinc.com>

TPDM MCMB subunits supports up to 8 lanes CMB. For MCMB
configurations, the field "XTRIG_LNSEL" in CMB_CR register selects
which lane participates in the output pattern mach cross trigger
mechanism goverened by the M_CMB_DXPR and M_CMB_XPMR regisers.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tpdm  |  8 +++
 drivers/hwtracing/coresight/coresight-tpdm.c  | 51 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
 3 files changed, 62 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index bf710ea6e0ef..b3292fa2a022 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -257,3 +257,11 @@ Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
 Description:
 		(RW) Set/Get the MSR(mux select register) for the CMB subunit
 		TPDM.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_trig_lane
+Date:		June 2024
+KernelVersion	6.9
+Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(RW) Set/Get which lane participates in the output pattern
+		match cross trigger mechanism for the MCMB subunit TPDM.
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 58f8c3e804c1..f32c119e1b67 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -238,6 +238,18 @@ static umode_t tpdm_cmb_msr_is_visible(struct kobject *kobj,
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
@@ -1015,6 +1027,34 @@ static ssize_t cmb_trig_ts_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(cmb_trig_ts);
 
+static ssize_t mcmb_trig_lane_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n",
+			  (unsigned int)drvdata->cmb->mcmb->mcmb_trig_lane);
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
+	drvdata->cmb->mcmb->mcmb_trig_lane = val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(mcmb_trig_lane);
+
 static struct attribute *tpdm_dsb_edge_attrs[] = {
 	&dev_attr_ctrl_idx.attr,
 	&dev_attr_ctrl_val.attr,
@@ -1177,6 +1217,11 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
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
@@ -1243,6 +1288,11 @@ static struct attribute_group tpdm_cmb_msr_grp = {
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
@@ -1254,6 +1304,7 @@ static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_cmb_trig_patt_grp,
 	&tpdm_cmb_patt_grp,
 	&tpdm_cmb_msr_grp,
+	&tpdm_mcmb_attr_grp,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 2e84daad1a58..e72dc19da310 100644
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
2.46.0


