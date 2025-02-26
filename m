Return-Path: <linux-arm-msm+bounces-49493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CCDA45E9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240A0163855
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5230E2192FD;
	Wed, 26 Feb 2025 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V+D34Lwt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109121517E;
	Wed, 26 Feb 2025 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740572409; cv=none; b=c7ftzbkyw1grGEqUDB9VLrkCwRsUsagj6zQyi1BMr/nveiM0xk3WmTpzQul4HbnwX+3+GKspR9+EZp+FmbOK6RpaZahjKj/dlB+RvDKLgX0C2N3sKIzSr8LMi4x1FuPNd4Lr/b7EIeZtMyMgbgDvnE4KG7IjA3XfdvLA6WN0HA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740572409; c=relaxed/simple;
	bh=PsDdoFKTpvlL5YcQuna9IoE39Yn9nVxctxYhbwsxtjQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmOf0dLjewTE9muG6fblyrsrwb6tzLViNOGAedMl2yrNgmFAISDsewpsGgn1ylfft2zJBVmvXcVlnw6YARmCeDVkN54hC+iwhzr41IcFtlEtShQhyYVQuJpScLqVi1zKbd6QXdTdzww5+TL2NhpYm3T4X9Ni07uMZ5umK3NtW9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V+D34Lwt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QAG5iZ012250;
	Wed, 26 Feb 2025 12:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdN/1FsWeKzUdqV7u49kAczFb768U+bA9rFPVfmIYR8=; b=V+D34LwtoaYEUhr1
	xQb+uKBoCszxz+hjJYRT7qFX6MVWCR9NPplIJ3Jhyy7KLtLLwGoZAiuqR7O4bmLx
	+wUk1f4Ft+KH6FLX8lr1zeikiuHAZXOGsaWYXjcTMBCphrglBSAJy3vHXr1I5zn2
	/2YH0rlxq72BcY9+6dy/V9ewaCvhIqjU8NsDuT+DjmazamUmjaYqNWNA5KSRB7ti
	dz3WyOf1/yBEfRAilTjOYkTSek65QCrC6DxLIA9pGSsc5y0xgBSF9c1sdSbA7DIG
	PT0INidiafj6sS5UG3wMohhF30aPxRLZXBWj+Y3ravZjWE9dDJ6Il3Cn4mtEMtoK
	mgBYWQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk1x3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 12:19:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QCJtJm005923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 12:19:55 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 04:19:55 -0800
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
Subject: [PATCH v7 2/2] coresight: Add label sysfs node support
Date: Wed, 26 Feb 2025 04:19:26 -0800
Message-ID: <20250226121926.2687497-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226121926.2687497-1-quic_jinlmao@quicinc.com>
References: <20250226121926.2687497-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Llgtmf3cW_HXoXOECvImX9ecxVPbCj5x
X-Proofpoint-ORIG-GUID: Llgtmf3cW_HXoXOECvImX9ecxVPbCj5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260098

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
index bf2869c413e7..e6c879ceac18 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -239,3 +239,9 @@ Date:		March 2020
 KernelVersion	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Clear all channel / trigger programming.
+
+What:           /sys/bus/coresight/devices/<cti-name>/label
+Date:           Feb 2025
+KernelVersion   6.15
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
index d75acda5e1b3..d9780489aa12 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
@@ -10,3 +10,9 @@ Date:		November 2014
 KernelVersion:	3.19
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Defines input port priority order.
+
+What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
+Date:           Feb 2025
+KernelVersion   6.15
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index bf710ea6e0ef..31c6de92434a 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -257,3 +257,9 @@ Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
 Description:
 		(RW) Set/Get the MSR(mux select register) for the CMB subunit
 		TPDM.
+
+What:           /sys/bus/coresight/devices/<tpdm-name>/label
+Date:           Feb 2025
+KernelVersion   6.15
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index a01c9e54e2ed..4af40cd7d75a 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 
 #include "coresight-priv.h"
 #include "coresight-trace-id.h"
@@ -366,18 +367,47 @@ static ssize_t enable_source_store(struct device *dev,
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
@@ -385,6 +415,7 @@ const struct device_type coresight_dev_type[] = {
 	},
 	[CORESIGHT_DEV_TYPE_LINK] = {
 		.name = "link",
+		.groups = coresight_link_groups,
 	},
 	[CORESIGHT_DEV_TYPE_LINKSINK] = {
 		.name = "linksink",
@@ -396,6 +427,7 @@ const struct device_type coresight_dev_type[] = {
 	},
 	[CORESIGHT_DEV_TYPE_HELPER] = {
 		.name = "helper",
+		.groups = coresight_helper_groups,
 	}
 };
 /* Ensure the enum matches the names and groups */
-- 
2.25.1


