Return-Path: <linux-arm-msm+bounces-22378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0D904BDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6FF51F24F37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 06:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E771716B743;
	Wed, 12 Jun 2024 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H+RbCvbo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A718167D8C;
	Wed, 12 Jun 2024 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718174866; cv=none; b=ENviNn3ckQPxGho5Mvt0d4A1pt6KvuZTg74nDyTfdhyVuWXnnNhu5kz4ms35nbsZgUS8dR4mJL3MgScHZoPB4v4HFmk+ltYrA7x8+EJjjuJo2L9+ueRsCXIUARJrwKCPjScHXJRxRA/qx+kx69uQxE7rLpYpuCpQFiIVHlwutqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718174866; c=relaxed/simple;
	bh=kzxxVSwFKxLKMMkOIMjBzfM+XUiXIiKs8BwQuN/1pKo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XzShhPtPbGiNFWcMugWmwCtBMPf+ekKeYrCARst3WJ3Kd3uV05/PRyGZV4iH5pv6lFKWL+6xD6QPJj3Z6TGm7Yc2AR99hnMAP92+J485lXXdE24Bf613AoL3f0/hkYbsHdB2vBUoVBwSuquYuVPm+I9PMMFi2h6DhS8zoOXXbnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H+RbCvbo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BJXoAB013675;
	Wed, 12 Jun 2024 06:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kQPkCx6zZzocxE5Ej7JrPQ
	Ihhv++WEwncAng2ajhsuY=; b=H+RbCvboshVScpM/o1H5B2Tjm4zWhi+GGWMEFn
	lqvUppLFkxExQiI0vUiHXp4y33NWyB99OCrm6SlLeSO7eDYz9htLls9Qj/mIGKuy
	uiu9FK46RIrSPIfqbJqeSV7biutgh7Z1QgwaIB5fFqYNhMEdz+AsS0AL8SBmdmoK
	WzzjmNCfcYE+9USbl8WJhjwUMOMgH3dDpg2TyQfHID7SB36ZC2ovUh5fIq4GNP7D
	+DHPCQefGp4PSL6AO8cRmNSIao+VJoAfh14n1lYjrseW2xySFc3B+sr/GdoW2+WQ
	dr8MQY3NIRrhMrkjxD3V3ZaNV8ycm5D5EvZ1qr6TR/smIWJw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm45ancx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 06:47:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C6lfjb011480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 06:47:41 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 23:47:39 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Date: Wed, 12 Jun 2024 12:17:28 +0530
Message-ID: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7LObVwv0Nb5GUSb9HP5C1bdON3wj-YHt
X-Proofpoint-ORIG-GUID: 7LObVwv0Nb5GUSb9HP5C1bdON3wj-YHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_03,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=646 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120047

Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
to be added for PD notifications and other missing features. Adding
and maintaining new files from within fastrpc directory would be easy.

Example of feature that is being planned to be introduced in a new C
file:
https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
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
index d6c90161c7bf..e9c79e9063f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18501,7 +18501,7 @@ M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
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
index 000000000000..3243dc56b2a0
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
+	  Provides a communication mechanism that allows for clients to
+	  make remote method invocations across processor boundary to
+	  applications DSP processor. Say M if you want to enable this
+	  module.
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
2.43.0


