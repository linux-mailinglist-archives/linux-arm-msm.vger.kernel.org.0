Return-Path: <linux-arm-msm+bounces-24414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FE691A1D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 10:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70A65282103
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 08:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D40945BFD;
	Thu, 27 Jun 2024 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fsTxdUX8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78357819;
	Thu, 27 Jun 2024 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719478008; cv=none; b=nGrjLu54Aog0goMAdpqMq9SY0Df3oqqbZrDnoQHX09iMA1gtOWd8NO/OOfFqI149rrocr9GYELfYci7IJW7gpJdXr/YR9bsU0tjar2oxLbfb/Z6vzwTN+NbqlBB1nvCk7hYEJggCw1URZQAOIdg/G6JdKUi/1aTKFsBLe4pjvHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719478008; c=relaxed/simple;
	bh=krffSPsuJTzyCsE7MlQu3tlfRdY9pz08XpNiEAf9U5M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eC63wvCXgMyl5Xu5VuyRB0qJK+dZu8bDEgNSRiUAKNRhkR3m3rR12vzvDs95WqJ13XfcBwSz2EM71wCcRHJRLZU4ofaUDZ5xwiZ+gmmmUFte06HAkNVQ0NwQEqPa71/w+awz62ojXZiCHDbAtUZkPCvKlZv1sLdrhKfMrTxPPcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fsTxdUX8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R00hng015138;
	Thu, 27 Jun 2024 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1CHdrRgxQ8EbF78wEnmcOg
	ydX6IQyLwcMzedVIKQeaI=; b=fsTxdUX8o6TAx+nmrQ1phKp+CWCI0EMH0Jolki
	lXSywBv6YR8WqiJRDrLwvwBP3dUs0EaRC0HJZ7Qou+vShGu0lJO3ygs/1Q48WSRy
	WcJS+YxvuP6/2MkvGdX/6z/Q2/bUmbCZkCJhFHXZ2oFCMYVzrq/zeawolmFs2oRH
	Z53YQPQR0VL1UNvTdXim8lw+bMRqV1+lZT8bA++Hz+7YjCZmyv/BNyvg5MCTWBCe
	HXrJW7Ia/rZg/M0FEbvVeahaNlGhAqjsi5692e8VIgMhLgQ9VJTovvoXrTdwr4xD
	nVLg4maw0Jmu0Jq560kZO1dywFolios17nr83dp3LBQ3HAsg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqshuxxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 08:46:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45R8kdlM020177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 08:46:39 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Jun 2024 01:46:36 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v2] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Date: Thu, 27 Jun 2024 14:16:27 +0530
Message-ID: <20240627084628.1590453-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uNkPQgQrF1g7Yy2LFR7ddug67yYNkttm
X-Proofpoint-GUID: uNkPQgQrF1g7Yy2LFR7ddug67yYNkttm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_04,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=751 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270066

Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
to be added for PD notifications and other missing features. Adding
and maintaining new files from within fastrpc directory would be easy.

Example of feature that is being planned to be introduced in a new C
file:
https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
Changes in v2:
  - Updated Kconfig.

 MAINTAINERS                          |  2 +-
 drivers/misc/Kconfig                 | 13 +------------
 drivers/misc/Makefile                |  2 +-
 drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
 drivers/misc/fastrpc/Makefile        |  2 ++
 drivers/misc/{ => fastrpc}/fastrpc.c |  0
 6 files changed, 21 insertions(+), 14 deletions(-)
 create mode 100644 drivers/misc/fastrpc/Kconfig
 create mode 100644 drivers/misc/fastrpc/Makefile
 rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b99543d9c6e..55d0fecd1a74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18502,7 +18502,7 @@ L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
-F:	drivers/misc/fastrpc.c
+F:	drivers/misc/fastrpc/
 F:	include/uapi/misc/fastrpc.h
 
 QUALCOMM HEXAGON ARCHITECTURE
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index faf983680040..630e8ccd8669 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -276,18 +276,6 @@ config QCOM_COINCELL
 	  to maintain PMIC register and RTC state in the absence of
 	  external power.
 
-config QCOM_FASTRPC
-	tristate "Qualcomm FastRPC"
-	depends on ARCH_QCOM || COMPILE_TEST
-	depends on RPMSG
-	select DMA_SHARED_BUFFER
-	select QCOM_SCM
-	help
-	  Provides a communication mechanism that allows for clients to
-	  make remote method invocations across processor boundary to
-	  applications DSP processor. Say M if you want to enable this
-	  module.
-
 config SGI_GRU
 	tristate "SGI GRU driver"
 	depends on X86_UV && SMP
@@ -602,4 +590,5 @@ source "drivers/misc/cardreader/Kconfig"
 source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
 source "drivers/misc/mchp_pci1xxxx/Kconfig"
+source "drivers/misc/fastrpc/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 153a3f4837e8..f83d73844ea5 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -16,7 +16,6 @@ obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
 obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
 obj-$(CONFIG_PHANTOM)		+= phantom.o
 obj-$(CONFIG_QCOM_COINCELL)	+= qcom-coincell.o
-obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
 obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
 obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
 obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
@@ -69,3 +68,4 @@ obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
 obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
 obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
+obj-y				+= fastrpc/
diff --git a/drivers/misc/fastrpc/Kconfig b/drivers/misc/fastrpc/Kconfig
new file mode 100644
index 000000000000..7179a44eda84
--- /dev/null
+++ b/drivers/misc/fastrpc/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Qualcomm FastRPC devices
+#
+
+config QCOM_FASTRPC
+	tristate "Qualcomm FastRPC"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on RPMSG
+	select DMA_SHARED_BUFFER
+	select QCOM_SCM
+	help
+	  Provides a communication mechanism that facilitate high-speed
+	  Remote Procedure Call (RPC) mechanisms between the host CPU and
+	  offload processors Qualcomm Digital Signal Processors (DSPs).
+	  Say M if you want to enable this module.
\ No newline at end of file
diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
new file mode 100644
index 000000000000..77fd2b763b6b
--- /dev/null
+++ b/drivers/misc/fastrpc/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc/fastrpc.c
similarity index 100%
rename from drivers/misc/fastrpc.c
rename to drivers/misc/fastrpc/fastrpc.c
-- 
2.34.1


