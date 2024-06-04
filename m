Return-Path: <linux-arm-msm+bounces-21546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAB8FA862
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 04:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7F991F25742
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 02:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BAA13C3DD;
	Tue,  4 Jun 2024 02:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ok7MP8qy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211513DB88;
	Tue,  4 Jun 2024 02:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717469316; cv=none; b=QXIjXjMMJj3Z6VPsW+zRggh6fpfdQQt5zmxzOtxwILsae2bP4U4UzARuSfxGofpSonHFK+X+X+L2l24DtftReJHXGq1mpxI9q505t+jv3HzdQX1d81y2mGiDIh3kSR5Og2C1FPtcRmVh6JnephUlZI479h4utgg7s9s1g+hSD1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717469316; c=relaxed/simple;
	bh=I6HO+iN5oHa3u7G3pIQijVLAi5kvEPqG6yZE64gH+Ds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vEzW0+JUp0u9h7Xnhz5jx8AAoogK9VsH9edmzREBIoFf9JcEuWdspAoxuHVpoD4H+Vn8KSPS0eZdYnzYpTHurzI/ETE/ExFqn2CKzUDGXCgUudD/u3+BgGGXsZAeq5LXNtUw6TEprSJTANKlHtiZcf19jxvF9Qk0q0qhIpfJklw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ok7MP8qy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453Bb2og019159;
	Tue, 4 Jun 2024 02:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XaYq1aYH4nNWWBT/7wjZT3Qx
	Rt/V07ev+wUr09f7m3g=; b=Ok7MP8qyi3TQuEyJOTmxLryYSgX1w99kH3aUnQqu
	w7mc9d/BxL4kJqL9rbfHSw9TQvjpgSyUp0GzPshNg21SZniuxYgTqfhn0iEP6vWV
	Rf7LPi1BQZgf/qmg5yPLyAZOh2tYF3VEx0wjIQFS3frDMkTJKbnt6quwyAE1NRgI
	FZZPP+dlwlNADMbe522MIG94GJFPgtRyU+hlP0R+AjY1Ud/yngRQ/TwT0JCx64W9
	UVcdYsF8U6ZCMpXPOekGpaTdltByBcI3YeW2ef1nOiQI9WwptSPONiJVoz004Ld4
	qzLjVHTC/OBHpBLSTmCHp1VX+NxBD2jOm/obdYklvbZHiQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5t5a87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 02:48:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4542mRHd006227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 02:48:27 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 19:48:23 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>
CC: Tao Zhang <quic_taozha@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Jie Gan
	<quic_jiegan@quicinc.com>
Subject: [PATCH 3/3] coresight-tpdm: Add support to enable the lane for MCMB TPDM
Date: Tue, 4 Jun 2024 10:47:41 +0800
Message-ID: <20240604024741.3550-4-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240604024741.3550-1-quic_taozha@quicinc.com>
References: <20240604024741.3550-1-quic_taozha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 34oZPadvD7SC-jcY8DrvIsGbOIXahpim
X-Proofpoint-GUID: 34oZPadvD7SC-jcY8DrvIsGbOIXahpim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040021

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
index 3bae880cddb6..e5d26a5478f2 100644
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
index fba4f8877e96..16d0f01cf0fa 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1053,6 +1053,34 @@ static ssize_t mcmb_trig_lane_store(struct device *dev,
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
@@ -1217,6 +1245,7 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
 
 static struct attribute *tpdm_mcmb_attrs[] = {
 	&dev_attr_mcmb_trig_lane.attr,
+	&dev_attr_mcmb_lanes_select.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 887d4464b076..56bd20aa98ae 100644
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
2.17.1


