Return-Path: <linux-arm-msm+bounces-63535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 904EDAF74F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85A811C82EF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 13:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661982E62BE;
	Thu,  3 Jul 2025 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iJYARejf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D10B67A;
	Thu,  3 Jul 2025 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547932; cv=none; b=s6kaqVmzjxvyWmlseN/Rf967446b24HfPgBP/LDStc4lVqhfQytuGbDZj3VyMDTTsi0q11k+NJ7TPnc81VZT62TWXXegJpBHviYyRC5yav71N5Gulf6R/9IMahpMQVVAZ+CyJKddcWV+k6LxGy4A3UTmrFiQGM+Qgz8haVCDg70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547932; c=relaxed/simple;
	bh=KWQWe/2rOMqjWmggideruA2h1ff7EC5EYkhc2XTmOi0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=htkw7Bl6yG6nuuIvoJBC7LRd4khAFDKxWP2p75J2WaQsON9M1mcqs8VlX87wXWI8s8zatfYKLMWlVFrAOIWg1alWNm9LyhtT4LG4i3Bv9cStl/MOGWgDHVzmExoIEmF95CzH9+Hk1Y8vt4bdOi95oU5F8SUY0lqfjZ625Icj2f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iJYARejf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637ZEWF028430;
	Thu, 3 Jul 2025 13:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OQLVnRvv+YGw1jFayOnumqym
	NCBejpVtWN727o3J2xc=; b=iJYARejfuOe+aaFoELolVcKyldstFRMkVnQLOaQF
	STCqg7cpv7NHR+h/oB+djgTm42M+7e9yVsH0dTanevfE3DuyAz2lrwuBm3bRLI6w
	+jskPcmPjwlqYWSC3yUc/BJ/+RkSRx8Exn7LDIMPgwVeeCcMcoax8lODXQYSPL+Y
	r5fYz7tRKyQ6x/Uuv3+NzQy70y50dqUxP5CSdWDwtR8CTi4Q5zdC/Mt//9nDe7XY
	RjU7nVMH3Uo/NPn7roYROiAphEJ9QXzbSZBbwVJnyWltaUj0v73lRHVlumdBoPuk
	LrBh/pSUngKfvHZ1fkEdn4EI+LRNPMs6QWtOcCXwqtaE4w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw0nnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 13:05:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563D5KHe000970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 13:05:20 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 06:05:16 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v8 2/2] coresight: Add label sysfs node support
Date: Thu, 3 Jul 2025 21:04:53 +0800
Message-ID: <20250703130453.4265-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
References: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yKGtCAjpT3fr4cKy89wmWtXVnIoNdt3N
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68668011 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=3OtES_ux56hhsM0WwqAA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yKGtCAjpT3fr4cKy89wmWtXVnIoNdt3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDExMCBTYWx0ZWRfXyZ+a5XOXdK1X
 ywTR60Xx8YDbpSqXbEnpP57s2OFkZV3RVcOP+EMW37e+xlVxrYfcmizK/TaOlNO6ta2yj/Atubh
 jxs5M9HCV9gso1W91FA82WzfngW4drALkbGpmWA9NBHeVkam5ew9qdHgEwPNdT4YzmDZ9Cmn/9s
 lfKOgcPdMGuE4Sze4gOgoHj5iFAyDZmVUSFKF3a5/H+50HHjAQteHp32jckXhZhlkhrsZN6QE+v
 ig7MjplqeMdwrt6mE28K2jRFxVz+OUStgTrBuU2eG3sit7y1n7BDm2pkBS0SiKV3NWwNGmBFj/M
 0oY5WUMAKA0SLDQ9VbKtaUJUVdM4xDeuhH/N7WlI7MG6NYdza9o6L0eg+f0Mo+GsW+5NbqcJZen
 y7+c1kWYYFn/0n7GcBTUK8te+q/m/vzap1iQs7WR41iQv96OMyr//I44Xay+T7sa5c4B/073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030110

For some coresight components like CTI and TPDM, there could be
numerous of them. From the node name, we can only get the type and
register address of the component. We can't identify the HW or the
system the component belongs to. Add label sysfs node support for
showing the intuitive name of the device.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
 .../sysfs-bus-coresight-devices-funnel        |  6 ++++
 .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
 drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++++++++++++++++++
 4 files changed, 50 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
index a97b70f588da..55367bbc696f 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -239,3 +239,9 @@ Date:		March 2020
 KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Clear all channel / trigger programming.
+
+What:           /sys/bus/coresight/devices/<cti-name>/label
+Date:           Jul 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
index d75acda5e1b3..5578fa5f6f02 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
@@ -10,3 +10,9 @@ Date:		November 2014
 KernelVersion:	3.19
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Defines input port priority order.
+
+What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
+Date:           Jul 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index a341b08ae70b..e6d935e83042 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -272,3 +272,9 @@ KernelVersion	6.15
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the enablement of the individual lane.
+
+What:           /sys/bus/coresight/devices/<tpdm-name>/label
+Date:           Jul 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index feadaf065b53..e3d21c49814d 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 
 #include "coresight-priv.h"
 #include "coresight-trace-id.h"
@@ -371,18 +372,47 @@ static ssize_t enable_source_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_source);
 
+static ssize_t label_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+
+	const char *str;
+	int ret = 0;
+
+	ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
+	if (ret == 0)
+		return scnprintf(buf, PAGE_SIZE, "%s\n", str);
+	else
+		return ret;
+}
+static DEVICE_ATTR_RO(label);
+
 static struct attribute *coresight_sink_attrs[] = {
 	&dev_attr_enable_sink.attr,
+	&dev_attr_label.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(coresight_sink);
 
 static struct attribute *coresight_source_attrs[] = {
 	&dev_attr_enable_source.attr,
+	&dev_attr_label.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(coresight_source);
 
+static struct attribute *coresight_link_attrs[] = {
+	&dev_attr_label.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(coresight_link);
+
+static struct attribute *coresight_helper_attrs[] = {
+	&dev_attr_label.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(coresight_helper);
+
 const struct device_type coresight_dev_type[] = {
 	[CORESIGHT_DEV_TYPE_SINK] = {
 		.name = "sink",
@@ -390,6 +420,7 @@ const struct device_type coresight_dev_type[] = {
 	},
 	[CORESIGHT_DEV_TYPE_LINK] = {
 		.name = "link",
+		.groups = coresight_link_groups,
 	},
 	[CORESIGHT_DEV_TYPE_LINKSINK] = {
 		.name = "linksink",
@@ -401,6 +432,7 @@ const struct device_type coresight_dev_type[] = {
 	},
 	[CORESIGHT_DEV_TYPE_HELPER] = {
 		.name = "helper",
+		.groups = coresight_helper_groups,
 	}
 };
 /* Ensure the enum matches the names and groups */
-- 
2.17.1


