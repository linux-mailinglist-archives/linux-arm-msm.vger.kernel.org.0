Return-Path: <linux-arm-msm+bounces-9509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFE8846C1C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 10:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE3D11C22856
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 09:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007587C0AB;
	Fri,  2 Feb 2024 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iqH0Wz8E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8BC7C0A3;
	Fri,  2 Feb 2024 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706866438; cv=none; b=crhas/hrEj4PDWzv6OIADchBo1siKJvCNfbchlYKs+BpmS+5zJvF3ubYlgA4TMH1iZzEjBr6pT9bgkg5kOzGQhy0LcKY3nWtXuXmc40J3tFsVwaMaVduGpwv+atX/hq1cErre7At1kbgQEZymckc1HvVECLmYC3PTEefTGj4Ajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706866438; c=relaxed/simple;
	bh=l6SWrnmJBCKZK2g+cz1qaCm0KvH7dyJqQS0LQHPwvhY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tht3Ym3whrzFfadIUr/Zg8V7HeUsW44+F7UV4Au1oJIUbTED7oOT5zVe+AtSEd5pKY7z3DIpsHGQrxOKsrk8xGYXB50QRlcI1m+It9ii7J7NJN81yWaTJ4sGrIdLweXIdokdkBK2MNybO2QvkahUUh6qX7zLimOfdl9EIz43Acs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iqH0Wz8E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4126I4ND017426;
	Fri, 2 Feb 2024 09:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=8LJ8v6LYKH5g/FH6GwhS
	eXfKrMk6CYVKS7BNDXsPO68=; b=iqH0Wz8E3gI/iTjhVpiQvTRSMS635thc4yjq
	xvOIFXZa9PuqajYWK0aroLUEqDPKhPKzgCeIrg+NBgy+JixCnwxFJSwYUVHM9E6U
	qCry6RqPvlHPICQlGbkoy3Pgoz/uSaqcnJPpZ6R/8GC/3GFOfPNEHE5BzjXKI9Do
	nrxrWuIR7T80vMuZSnUb2d+VbmFnKC384b+hfA3110Rl5K3MHx+L1avDKfvABRtS
	aw1BlGl7sFxybDoUoJrqjST3EJ55KuqWDeGum6wvK+z8xOeHLD/HzFN4AD19b4GD
	mzZ8VqAop5UvOe0IbmFMHBmIKXtR6rLRg7Jcgttaa+WhZzTy7A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pu1s0g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 09:33:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4129XiUn010278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Feb 2024 09:33:44 GMT
Received: from taozha-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 2 Feb 2024 01:33:39 -0800
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
Subject: [PATCH v6 06/10] coresight-tpdm: Add support to configure CMB
Date: Fri, 2 Feb 2024 17:32:40 +0800
Message-ID: <1706866364-19861-7-git-send-email-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1706866364-19861-1-git-send-email-quic_taozha@quicinc.com>
References: <1706866364-19861-1-git-send-email-quic_taozha@quicinc.com>
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
X-Proofpoint-GUID: KDcv89-qX_o_9fcQ7x8vvqz8UWuQ9JuK
X-Proofpoint-ORIG-GUID: KDcv89-qX_o_9fcQ7x8vvqz8UWuQ9JuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=846 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020068

TPDM CMB subunits support two forms of CMB data set element creation:
continuous and trace-on-change collection mode. Continuous change
creates CMB data set elements on every CMBCLK edge. Trace-on-change
creates CMB data set elements only when a new data set element differs
in value from the previous element in a CMB data set. Set CMB_CR.MODE
to 0 for continuous CMB collection mode. Set CMB_CR.MODE to 1 for
trace-on-change CMB collection mode.

Reviewed-by: James Clark <james.clark@arm.com>
Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Jinlong Mao <quic_jinlmao@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tpdm  | 14 +++++
 drivers/hwtracing/coresight/coresight-tpdm.c  | 60 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h  | 12 ++++
 3 files changed, 86 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index 4dd49b159543..6dfb18d6d64a 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -170,3 +170,17 @@ Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
 Description:
 		(RW) Set/Get the MSR(mux select register) for the DSB subunit
 		TPDM.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_mode
+Date:		January 2024
+KernelVersion	6.9
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:	(Write) Set the data collection mode of CMB tpdm. Continuous
+		change creates CMB data set elements on every CMBCLK edge.
+		Trace-on-change creates CMB data set elements only when a new
+		data set element differs in value from the previous element
+		in a CMB data set.
+
+		Accepts only one of the 2 values -  0 or 1.
+		0 : Continuous CMB collection mode.
+		1 : Trace-on-change CMB collection mode.
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 1bb1d8e83501..b20071460375 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -137,6 +137,18 @@ static umode_t tpdm_dsb_is_visible(struct kobject *kobj,
 	return 0;
 }
 
+static umode_t tpdm_cmb_is_visible(struct kobject *kobj,
+				   struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (drvdata && tpdm_has_cmb_dataset(drvdata))
+		return attr->mode;
+
+	return 0;
+}
+
 static umode_t tpdm_dsb_msr_is_visible(struct kobject *kobj,
 				       struct attribute *attr, int n)
 {
@@ -161,6 +173,9 @@ static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
 		drvdata->dsb->trig_ts = true;
 		drvdata->dsb->trig_type = false;
 	}
+
+	if (drvdata->cmb)
+		memset(drvdata->cmb, 0, sizeof(struct cmb_dataset));
 }
 
 static void set_dsb_mode(struct tpdm_drvdata *drvdata, u32 *val)
@@ -391,6 +406,12 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
 		if (!drvdata->dsb)
 			return -ENOMEM;
 	}
+	if (tpdm_has_cmb_dataset(drvdata) && (!drvdata->cmb)) {
+		drvdata->cmb = devm_kzalloc(drvdata->dev,
+						sizeof(*drvdata->cmb), GFP_KERNEL);
+		if (!drvdata->cmb)
+			return -ENOMEM;
+	}
 	tpdm_reset_datasets(drvdata);
 
 	return 0;
@@ -729,6 +750,34 @@ static ssize_t dsb_trig_ts_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(dsb_trig_ts);
 
+static ssize_t cmb_mode_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%x\n", drvdata->cmb->trace_mode);
+
+}
+
+static ssize_t cmb_mode_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf,
+			      size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long trace_mode;
+
+	if (kstrtoul(buf, 0, &trace_mode) || (trace_mode & ~1UL))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	drvdata->cmb->trace_mode = trace_mode;
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(cmb_mode);
+
 static struct attribute *tpdm_dsb_edge_attrs[] = {
 	&dev_attr_ctrl_idx.attr,
 	&dev_attr_ctrl_val.attr,
@@ -845,6 +894,11 @@ static struct attribute *tpdm_dsb_attrs[] = {
 	NULL,
 };
 
+static struct attribute *tpdm_cmb_attrs[] = {
+	&dev_attr_cmb_mode.attr,
+	NULL,
+};
+
 static struct attribute_group tpdm_dsb_attr_grp = {
 	.attrs = tpdm_dsb_attrs,
 	.is_visible = tpdm_dsb_is_visible,
@@ -874,6 +928,11 @@ static struct attribute_group tpdm_dsb_msr_grp = {
 	.name = "dsb_msr",
 };
 
+static struct attribute_group tpdm_cmb_attr_grp = {
+	.attrs = tpdm_cmb_attrs,
+	.is_visible = tpdm_cmb_is_visible,
+};
+
 static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_attr_grp,
 	&tpdm_dsb_attr_grp,
@@ -881,6 +940,7 @@ static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_dsb_trig_patt_grp,
 	&tpdm_dsb_patt_grp,
 	&tpdm_dsb_msr_grp,
+	&tpdm_cmb_attr_grp,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index a442d9c6e4ac..2af92c270ed1 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -14,6 +14,8 @@
 
 /* Enable bit for CMB subunit */
 #define TPDM_CMB_CR_ENA		BIT(0)
+/* Trace collection mode for CMB subunit */
+#define TPDM_CMB_CR_MODE	BIT(1)
 
 /* DSB Subunit Registers */
 #define TPDM_DSB_CR		(0x780)
@@ -181,6 +183,14 @@ struct dsb_dataset {
 	bool			trig_type;
 };
 
+/**
+ * struct cmb_dataset
+ * @trace_mode:       Dataset collection mode
+ */
+struct cmb_dataset {
+	u32			trace_mode;
+};
+
 /**
  * struct tpdm_drvdata - specifics associated to an TPDM component
  * @base:       memory mapped base address for this component.
@@ -190,6 +200,7 @@ struct dsb_dataset {
  * @enable:     enable status of the component.
  * @datasets:   The datasets types present of the TPDM.
  * @dsb         Specifics associated to TPDM DSB.
+ * @cmb         Specifics associated to TPDM CMB.
  * @dsb_msr_num Number of MSR supported by DSB TPDM
  */
 
@@ -201,6 +212,7 @@ struct tpdm_drvdata {
 	bool			enable;
 	unsigned long		datasets;
 	struct dsb_dataset	*dsb;
+	struct cmb_dataset	*cmb;
 	u32			dsb_msr_num;
 };
 
-- 
2.17.1


