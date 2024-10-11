Return-Path: <linux-arm-msm+bounces-34029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB53999CF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1D671F218BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2020209F26;
	Fri, 11 Oct 2024 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rf1adQyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF473208997;
	Fri, 11 Oct 2024 06:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629279; cv=none; b=RcaT42CFzwvNl5eO0/sPFopo+zPrLVxQBjhX8lwwZJTB5UpkvKFbtnSbaybWjD1C0kbVgRhTZWGZxRBzmEB9J29FdCeino3ICnAsShnlLHIMr5ii8wtMpwZBCFnJPUrjZubtEBTkTpY3vDmlBDVS8g/ClLDpGm4GHnbtmaOWSYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629279; c=relaxed/simple;
	bh=0wq7ZU+PUh0E0zVdDtKNXamD7JyKOk/JGCPhcStSdWs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wfce1uxFJ8xQc825FYGKMqSFyijmRpycELsVsD7f9vz0mBfm7zrZKwjTnG0D9kIjDtdq36STyJ7g03CsSOXyya8kLsbsFbgmMb+TF+l3iYf+yS8l3OvW3HnJV5y4W/yl/h2N6J3VrLX9hktOTwd+tU+Z907tJ7mEh0CNdKSkXyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rf1adQyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B3JoqO011352;
	Fri, 11 Oct 2024 06:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TlLJT0aOjCyQbbyefVohUCwblhFNnCFFaK8rxu24jII=; b=Rf1adQyGBIfjK0q8
	UxBcyOm5mdv6xHnWOKnTq+Z9fK4BX4quDxboirdwRMu3qBUo2a3dnrWt1ldz+mih
	PjlHU9W7rTKbJXM0Dtv26q58U4OA34MrTtU+9FEUg3C6oUktL4fpN83cMwGl9l/j
	f6u8cm7WPntfpKXv1CikpZiKFjyahFyXFxZG+tYOOXzqWS6O0LYP6oVDuidabPXy
	CpaUzd0DfTlGFTZrbgI33/SrY9g91djmM4bgPL1VQ1YZ/XyaAl84j4rTZPaAkXKb
	azjvXNSxOoXmNwbc/jnsAy8ljamT8Gk0N5X6eB4gNB2KpFI0wHfjwQkv0Q8sIf8f
	RiA4qA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xthvu1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:47:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B6ljoW023474
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
Subject: [PATCH v1 RESEND 3/3] coresight-tpdm: Add support to enable the lane for MCMB TPDM
Date: Thu, 10 Oct 2024 23:47:30 -0700
Message-ID: <20241011064732.8480-4-quic_jinlmao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: MBHmvCeGc_JyWE5iCgFV_b691G0lOgnK
X-Proofpoint-GUID: MBHmvCeGc_JyWE5iCgFV_b691G0lOgnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410110043

From: Tao Zhang <quic_taozha@quicinc.com>

Add the sysfs file to set/get the enablement of the lane. For MCMB
configurations, the field "E_LN" in CMB_CR register is the
individual lane enables. MCMB lane N is enabled for trace
generation when M_CMB_CR.E=1 and M_CMB_CR.E_LN[N]=1. For lanes
that are not implemented on a given MCMB configuration, the
corresponding bits of this field read as 0 and ignore writes.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tpdm  |  7 +++++
 drivers/hwtracing/coresight/coresight-tpdm.c  | 29 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
 3 files changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index b3292fa2a022..214f681a68ec 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -265,3 +265,10 @@ Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get which lane participates in the output pattern
 		match cross trigger mechanism for the MCMB subunit TPDM.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_lanes_select
+Date:		June 2024
+KernelVersion	6.9
+Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(RW) Set/Get the enablement of the individual lane.
\ No newline at end of file
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index f32c119e1b67..f8e22f4c3b52 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1055,6 +1055,34 @@ static ssize_t mcmb_trig_lane_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(mcmb_trig_lane);
 
+static ssize_t mcmb_lanes_select_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n",
+			  (unsigned int)drvdata->cmb->mcmb->mcmb_lane_select);
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
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	drvdata->cmb->mcmb->mcmb_lane_select = val & TPDM_MCMB_E_LN_MASK;
+
+	return size;
+}
+static DEVICE_ATTR_RW(mcmb_lanes_select);
+
 static struct attribute *tpdm_dsb_edge_attrs[] = {
 	&dev_attr_ctrl_idx.attr,
 	&dev_attr_ctrl_val.attr,
@@ -1219,6 +1247,7 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
 
 static struct attribute *tpdm_mcmb_attrs[] = {
 	&dev_attr_mcmb_trig_lane.attr,
+	&dev_attr_mcmb_lanes_select.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index e72dc19da310..e740039cd650 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -48,6 +48,9 @@
 /* MAX lanes in the output pattern for MCMB configurations*/
 #define TPDM_MCMB_MAX_LANES 8
 
+/* High performance mode */
+#define TPDM_MCMB_E_LN_MASK		GENMASK(7, 0)
+
 /* DSB Subunit Registers */
 #define TPDM_DSB_CR		(0x780)
 #define TPDM_DSB_TIER		(0x784)
-- 
2.46.0


