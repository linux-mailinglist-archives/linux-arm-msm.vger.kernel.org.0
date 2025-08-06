Return-Path: <linux-arm-msm+bounces-67884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5686B1C43D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A601893BFF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 10:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D98028AAFE;
	Wed,  6 Aug 2025 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jM2LmUUR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F73E207A22;
	Wed,  6 Aug 2025 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754476044; cv=none; b=kMV/hGMwEeL3UKKxGIBRjd8Wy/HMem4MHwIYChYb16wxj0LrdOFTJ+Xbz0hY1MCtV4zZIlFIg0HBQztxYWEWS5mNwgN7fewfsR6b73rJB0RbZ7wSCWhdqFholJjpohnnlSugbIhQ6UnkIs+YNY42NqUsNZZFjdqKNNJh9bYFDwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754476044; c=relaxed/simple;
	bh=KXEnvsIQlch7RC78IC1IuKVaEmZv7AKY/z7oswIZZcA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1PldUvu9o13ZlWnG7ExLmwGxIz19pBdMvywvRrXrm09oaTJAGJfuoHXO+0cDvhohU4QMvbFiT7vBGtlsfw9e5np1vC7tAmtH33ZcI8jmoyK+ylkDsRpvJoTlXlmEeynpvJflsa8xslZ1zknUCtzSVmTdGZZmsjx7+MreLdZKVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jM2LmUUR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5769ekJH032246;
	Wed, 6 Aug 2025 10:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DW4b37uIH7FvakOuSRW4Gj04OfaHZK+d6mA+RJ87dAA=; b=jM2LmUURWYXHXyI9
	Hh5fdgs3w6erBv4tUtgg4inQ9APJzXJk/wBGo0oC9Ll76ntBNsDrFZaNFzBmRvA0
	gHWGZYhfeOOwJS4K+F/230g9EVjHgOMRWRjdGQwv1I1N3Dz37oh+J3vwz11kgVQB
	KDL46gURQBTJZzqjHeetke+YjjLA7Qk0cyPKy0QopqtIiCcLgW5iS9y0P1W8xthn
	ZWVVdsj/csGe5DnRgg2QW/73v1AJN5/FCEhv8Z8mu4j6WZkc4Ot0py5KAJoOlXDc
	533YYxOdptOLnWCSHl1ddFe/3QY4ouTeCGF+8FV8YQ0N9VBJDhsfVa2gehCzDEPB
	Y8wEtQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2tf5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 10:27:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 576ARCnY008346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 10:27:12 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 6 Aug 2025 03:27:11 -0700
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
Subject: [PATCH v10 2/2] coresight: Add label sysfs node support
Date: Wed, 6 Aug 2025 03:26:58 -0700
Message-ID: <20250806102658.536683-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806102658.536683-1-quic_jinlmao@quicinc.com>
References: <20250806102658.536683-1-quic_jinlmao@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=68932e01 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=7CQSdrXTAAAA:8 a=TYLdrY_46NNtcs5PGGUA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: pyjaQ6l-TGUmGu5MGwA5swW56i376AO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXwssf7RSmzttW
 nXyTgf7/mq1Kqw+j70ZeEBnBq6c20B1WfXVvL5oJjXiOIKAuD0Z+DGRhvz0FUhcOkALo6GQsU/C
 fsLE5nM0JQnrN31JDx3zqlHsS9+2LUFq6yMkkE3rNvH/MmX9EbXlQ9dGQM1Tnl1cQ2igHdsE5RL
 /Ir8gLfEKWs2vRaTx1mcVo0e7vAsTHuVqtxYJvRaYQrhRwZIXg4w0CP0UE41sf4qKeI1+vxfWOn
 4OVxGkPdRJLfkNJPLA8s3gtDFMdDfD37Vg3VMj3Emwwo1uAGw1ASHlonAxn14Zc66G75CZJD2EZ
 ZeTR0sqXmycpUP4T/hEZfFz8CzCe3zI9XX3Ru+hjZHi+ZgpGLIsaC59AsoNMSVzvMjLdVfw62kP
 5Wvfcl4T
X-Proofpoint-GUID: pyjaQ6l-TGUmGu5MGwA5swW56i376AO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

For some coresight components like CTI and TPDM, there could be
numerous of them. From the node name, we can only get the type and
register address of the component. We can't identify the HW or the
system the component belongs to. Add label sysfs node support for
showing the intuitive name of the device.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 .../testing/sysfs-bus-coresight-devices-cti   |  6 ++
 .../sysfs-bus-coresight-devices-dummy-source  |  6 ++
 .../testing/sysfs-bus-coresight-devices-etb10 |  6 ++
 .../testing/sysfs-bus-coresight-devices-etm3x |  6 ++
 .../testing/sysfs-bus-coresight-devices-etm4x |  6 ++
 .../sysfs-bus-coresight-devices-funnel        |  6 ++
 .../testing/sysfs-bus-coresight-devices-stm   |  6 ++
 .../testing/sysfs-bus-coresight-devices-tmc   |  6 ++
 .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++
 .../testing/sysfs-bus-coresight-devices-trbe  |  6 ++
 drivers/hwtracing/coresight/coresight-sysfs.c | 71 ++++++++++++++++++-
 11 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
index a97b70f588da..5f609c0f50c6 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -239,3 +239,9 @@ Date:		March 2020
 KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Clear all channel / trigger programming.
+
+What:           /sys/bus/coresight/devices/<cti-name>/label
+Date:           Aug 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
index 0830661ef656..46c091f5951b 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
@@ -13,3 +13,9 @@ KernelVersion:	6.14
 Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
 Description:	(R) Show the trace ID that will appear in the trace stream
 		coming from this trace entity.
+
+What:           /sys/bus/coresight/devices/dummy_source<N>/label
+Date:           Aug 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10 b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10
index 9a383f6a74eb..ff2143558044 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10
@@ -19,6 +19,12 @@ Description:	(RW) Disables write access to the Trace RAM by stopping the
 		into the Trace RAM following the trigger event is equal to the
 		value stored in this register+1 (from ARM ETB-TRM).
 
+What:           /sys/bus/coresight/devices/<memory_map>.etb/label
+Date:           Aug 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
+
 What:		/sys/bus/coresight/devices/<memory_map>.etb/mgmt/rdp
 Date:		March 2016
 KernelVersion:	4.7
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
index 271b57c571aa..bcd804085306 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
@@ -251,6 +251,12 @@ KernelVersion:	4.4
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RO) Holds the cpu number this tracer is affined to.
 
+What:           /sys/bus/coresight/devices/<memory_map>.[etm|ptm]/label
+Date:           Aug 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
+
 What:		/sys/bus/coresight/devices/<memory_map>.[etm|ptm]/mgmt/etmccr
 Date:		September 2015
 KernelVersion:	4.4
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
index a0425d70d009..4af7d5e1754e 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
@@ -329,6 +329,12 @@ Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Access the selected single show PE comparator control
 		register.
 
+What:           /sys/bus/coresight/devices/etm<N>/label
+Date:           Aug 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
+
 What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcoslsr
 Date:		April 2015
 KernelVersion:	4.01
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
index d75acda5e1b3..e77c1fb9e795 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
@@ -10,3 +10,9 @@ Date:		November 2014
 KernelVersion:	3.19
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Defines input port priority order.
+
+What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
+Date:           Aug 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
index 53e1f4815d64..10e9410cfe38 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
@@ -51,3 +51,9 @@ KernelVersion:	4.7
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Holds the trace ID that will appear in the trace stream
 		coming from this trace entity.
+
+What:           /sys/bus/coresight/devices/<memory_map>.stm/label
+Date:           Aug 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc
index 339cec3b2f1a..d270174d9bb2 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc
@@ -107,3 +107,9 @@ Contact:	Anshuman Khandual <anshuman.khandual@arm.com>
 Description:	(RW) Current Coresight TMC-ETR buffer mode selected. But user could
 		only provide a mode which is supported for a given ETR device. This
 		file is available only for TMC ETR devices.
+
+What:           /sys/bus/coresight/devices/<memory_map>.tmc/label
+Date:           Aug 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index a341b08ae70b..b0eae1fcff7d 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -272,3 +272,9 @@ KernelVersion	6.15
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the enablement of the individual lane.
+
+What:           /sys/bus/coresight/devices/<tpdm-name>/label
+Date:           Aug 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe b/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
index ad3bbc6fa751..3c0bc754576f 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
@@ -12,3 +12,9 @@ Contact:	Anshuman Khandual <anshuman.khandual@arm.com>
 Description:	(Read) Shows if TRBE updates in the memory are with access
 		and dirty flag updates as well. This value is fetched from
 		the TRBIDR register.
+
+What:           /sys/bus/coresight/devices/trbe<cpu>/label
+Date:           Aug 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index feadaf065b53..5e52324aa9ac 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 
 #include "coresight-priv.h"
 #include "coresight-trace-id.h"
@@ -371,17 +372,81 @@ static ssize_t enable_source_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_source);
 
+static ssize_t label_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+
+	const char *str;
+	int ret;
+
+	ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
+	if (ret == 0)
+		return sysfs_emit(buf, "%s\n", str);
+	else
+		return ret;
+}
+static DEVICE_ATTR_RO(label);
+
+static umode_t label_is_visible(struct kobject *kobj,
+				   struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+
+	if (attr == &dev_attr_label.attr) {
+		if (fwnode_property_present(dev_fwnode(dev), "label"))
+			return attr->mode;
+		else
+			return 0;
+	}
+
+	return attr->mode;
+}
+
 static struct attribute *coresight_sink_attrs[] = {
 	&dev_attr_enable_sink.attr,
+	&dev_attr_label.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(coresight_sink);
+
+static struct attribute_group coresight_sink_group = {
+	.attrs = coresight_sink_attrs,
+	.is_visible = label_is_visible,
+};
+__ATTRIBUTE_GROUPS(coresight_sink);
 
 static struct attribute *coresight_source_attrs[] = {
 	&dev_attr_enable_source.attr,
+	&dev_attr_label.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(coresight_source);
+
+static struct attribute_group coresight_source_group = {
+	.attrs = coresight_source_attrs,
+	.is_visible = label_is_visible,
+};
+__ATTRIBUTE_GROUPS(coresight_source);
+
+static struct attribute *coresight_link_attrs[] = {
+	&dev_attr_label.attr,
+	NULL,
+};
+
+static struct attribute_group coresight_link_group = {
+	.attrs = coresight_link_attrs,
+	.is_visible = label_is_visible,
+};
+__ATTRIBUTE_GROUPS(coresight_link);
+
+static struct attribute *coresight_helper_attrs[] = {
+	&dev_attr_label.attr,
+	NULL,
+};
+
+static struct attribute_group coresight_helper_group = {
+	.attrs = coresight_helper_attrs,
+	.is_visible = label_is_visible,
+};
+__ATTRIBUTE_GROUPS(coresight_helper);
 
 const struct device_type coresight_dev_type[] = {
 	[CORESIGHT_DEV_TYPE_SINK] = {
@@ -390,6 +455,7 @@ const struct device_type coresight_dev_type[] = {
 	},
 	[CORESIGHT_DEV_TYPE_LINK] = {
 		.name = "link",
+		.groups = coresight_link_groups,
 	},
 	[CORESIGHT_DEV_TYPE_LINKSINK] = {
 		.name = "linksink",
@@ -401,6 +467,7 @@ const struct device_type coresight_dev_type[] = {
 	},
 	[CORESIGHT_DEV_TYPE_HELPER] = {
 		.name = "helper",
+		.groups = coresight_helper_groups,
 	}
 };
 /* Ensure the enum matches the names and groups */
-- 
2.25.1


