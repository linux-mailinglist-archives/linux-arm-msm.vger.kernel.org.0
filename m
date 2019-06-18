Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92E9D4ACF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 23:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730713AbfFRVHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 17:07:49 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34500 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730788AbfFRVFx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 17:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gS3/DzaoumQZOjtOHaSKbCrZyzMjw8uVpsbpAiA1YFU=; b=VRprJ4KmyRzNRK2xaUlJD0U/hN
        v0IXy267w71vCrz1vwDWIs2iYSy81yCPYXVnmpS/cIktMHHh9w48jPMU6n978rNS6hKmQ9gWPtL1z
        hcfupTjo6PXpy8lQeX3VPwyNb/giW5D4FVjPjXXlk/v/c8p2qCd5744oFFChkMR/jIOprVQ4X25j6
        sYPp4H9Rv+Iefxt9iXDE7VyQnEJRBUd1I+U/+G+LW3SchNBoZOrhwmVmEKLN3wBCX2akVwJhUMxV7
        J91eXfMSGsSuVrzbGw/qA3eqBjxjH2GEBkYijbYhQetJtL30mYqaX9xAjXtydrZzrxCPSctq3IH/J
        omDpQXZQ==;
Received: from 177.133.86.196.dynamic.adsl.gvt.net.br ([177.133.86.196] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hdLIc-0006yd-0m; Tue, 18 Jun 2019 21:05:50 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hdLIZ-0002C8-QY; Tue, 18 Jun 2019 18:05:47 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 07/22] docs: perf: convert to ReST
Date:   Tue, 18 Jun 2019 18:05:31 -0300
Message-Id: <5a05fd0db12dc6c71d0a8f11990fb648daac5901.1560891322.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560891322.git.mchehab+samsung@kernel.org>
References: <cover.1560891322.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename the perf documentation files to ReST, add an
index for them and adjust in order to produce a nice html
output via the Sphinx build system.

At its new index.rst, let's add a :orphan: while this is not linked to
the main index.rst file, in order to avoid build warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 .../perf/{arm-ccn.txt => arm-ccn.rst}         | 18 +++++-----
 .../perf/{arm_dsu_pmu.txt => arm_dsu_pmu.rst} |  5 +--
 .../perf/{hisi-pmu.txt => hisi-pmu.rst}       | 35 +++++++++++--------
 Documentation/perf/index.rst                  | 16 +++++++++
 .../perf/{qcom_l2_pmu.txt => qcom_l2_pmu.rst} |  3 +-
 .../perf/{qcom_l3_pmu.txt => qcom_l3_pmu.rst} |  3 +-
 .../{thunderx2-pmu.txt => thunderx2-pmu.rst}  | 25 ++++++-------
 .../perf/{xgene-pmu.txt => xgene-pmu.rst}     |  3 +-
 MAINTAINERS                                   |  4 +--
 drivers/perf/qcom_l3_pmu.c                    |  2 +-
 10 files changed, 72 insertions(+), 42 deletions(-)
 rename Documentation/perf/{arm-ccn.txt => arm-ccn.rst} (86%)
 rename Documentation/perf/{arm_dsu_pmu.txt => arm_dsu_pmu.rst} (92%)
 rename Documentation/perf/{hisi-pmu.txt => hisi-pmu.rst} (73%)
 create mode 100644 Documentation/perf/index.rst
 rename Documentation/perf/{qcom_l2_pmu.txt => qcom_l2_pmu.rst} (94%)
 rename Documentation/perf/{qcom_l3_pmu.txt => qcom_l3_pmu.rst} (93%)
 rename Documentation/perf/{thunderx2-pmu.txt => thunderx2-pmu.rst} (73%)
 rename Documentation/perf/{xgene-pmu.txt => xgene-pmu.rst} (96%)

diff --git a/Documentation/perf/arm-ccn.txt b/Documentation/perf/arm-ccn.rst
similarity index 86%
rename from Documentation/perf/arm-ccn.txt
rename to Documentation/perf/arm-ccn.rst
index 15cdb7bc57c3..832b0c64023a 100644
--- a/Documentation/perf/arm-ccn.txt
+++ b/Documentation/perf/arm-ccn.rst
@@ -1,3 +1,4 @@
+==========================
 ARM Cache Coherent Network
 ==========================
 
@@ -29,6 +30,7 @@ Crosspoint watchpoint-based events (special "event" value 0xfe)
 require "xp" and "vc" as as above plus "port" (device port index),
 "dir" (transmit/receive direction), comparator values ("cmp_l"
 and "cmp_h") and "mask", being index of the comparator mask.
+
 Masks are defined separately from the event description
 (due to limited number of the config values) in the "cmp_mask"
 directory, with first 8 configurable by user and additional
@@ -44,16 +46,16 @@ request the events on this processor (if not, the perf_event->cpu value
 will be overwritten anyway). In case of this processor being offlined,
 the events are migrated to another one and the attribute is updated.
 
-Example of perf tool use:
+Example of perf tool use::
 
-/ # perf list | grep ccn
-  ccn/cycles/                                        [Kernel PMU event]
-<...>
-  ccn/xp_valid_flit,xp=?,port=?,vc=?,dir=?/          [Kernel PMU event]
-<...>
+  / # perf list | grep ccn
+    ccn/cycles/                                        [Kernel PMU event]
+  <...>
+    ccn/xp_valid_flit,xp=?,port=?,vc=?,dir=?/          [Kernel PMU event]
+  <...>
 
-/ # perf stat -a -e ccn/cycles/,ccn/xp_valid_flit,xp=1,port=0,vc=1,dir=1/ \
-                                                                       sleep 1
+  / # perf stat -a -e ccn/cycles/,ccn/xp_valid_flit,xp=1,port=0,vc=1,dir=1/ \
+                                                                         sleep 1
 
 The driver does not support sampling, therefore "perf record" will
 not work. Per-task (without "-a") perf sessions are not supported.
diff --git a/Documentation/perf/arm_dsu_pmu.txt b/Documentation/perf/arm_dsu_pmu.rst
similarity index 92%
rename from Documentation/perf/arm_dsu_pmu.txt
rename to Documentation/perf/arm_dsu_pmu.rst
index d611e15f5add..7fd34db75d13 100644
--- a/Documentation/perf/arm_dsu_pmu.txt
+++ b/Documentation/perf/arm_dsu_pmu.rst
@@ -1,3 +1,4 @@
+==================================
 ARM DynamIQ Shared Unit (DSU) PMU
 ==================================
 
@@ -13,7 +14,7 @@ PMU doesn't support process specific events and cannot be used in sampling mode.
 The DSU provides a bitmap for a subset of implemented events via hardware
 registers. There is no way for the driver to determine if the other events
 are available or not. Hence the driver exposes only those events advertised
-by the DSU, in "events" directory under :
+by the DSU, in "events" directory under::
 
   /sys/bus/event_sources/devices/arm_dsu_<N>/
 
@@ -23,6 +24,6 @@ and use the raw event code for the unlisted events.
 The driver also exposes the CPUs connected to the DSU instance in "associated_cpus".
 
 
-e.g usage :
+e.g usage::
 
 	perf stat -a -e arm_dsu_0/cycles/
diff --git a/Documentation/perf/hisi-pmu.txt b/Documentation/perf/hisi-pmu.rst
similarity index 73%
rename from Documentation/perf/hisi-pmu.txt
rename to Documentation/perf/hisi-pmu.rst
index 267a028b2741..404a5c3d9d00 100644
--- a/Documentation/perf/hisi-pmu.txt
+++ b/Documentation/perf/hisi-pmu.rst
@@ -1,5 +1,7 @@
+======================================================
 HiSilicon SoC uncore Performance Monitoring Unit (PMU)
 ======================================================
+
 The HiSilicon SoC chip includes various independent system device PMUs
 such as L3 cache (L3C), Hydra Home Agent (HHA) and DDRC. These PMUs are
 independent and have hardware logic to gather statistics and performance
@@ -11,11 +13,13 @@ called Super CPU cluster (SCCL) and is made up of 6 CCLs. Each SCCL has
 two HHAs (0 - 1) and four DDRCs (0 - 3), respectively.
 
 HiSilicon SoC uncore PMU driver
----------------------------------------
+-------------------------------
+
 Each device PMU has separate registers for event counting, control and
 interrupt, and the PMU driver shall register perf PMU drivers like L3C,
 HHA and DDRC etc. The available events and configuration options shall
-be described in the sysfs, see :
+be described in the sysfs, see:
+
 /sys/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>/, or
 /sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>.
 The "perf list" command shall list the available events from sysfs.
@@ -24,27 +28,30 @@ Each L3C, HHA and DDRC is registered as a separate PMU with perf. The PMU
 name will appear in event listing as hisi_sccl<sccl-id>_module<index-id>.
 where "sccl-id" is the identifier of the SCCL and "index-id" is the index of
 module.
+
 e.g. hisi_sccl3_l3c0/rd_hit_cpipe is READ_HIT_CPIPE event of L3C index #0 in
 SCCL ID #3.
+
 e.g. hisi_sccl1_hha0/rx_operations is RX_OPERATIONS event of HHA index #0 in
 SCCL ID #1.
 
 The driver also provides a "cpumask" sysfs attribute, which shows the CPU core
 ID used to count the uncore PMU event.
 
-Example usage of perf:
-$# perf list
-hisi_sccl3_l3c0/rd_hit_cpipe/ [kernel PMU event]
-------------------------------------------
-hisi_sccl3_l3c0/wr_hit_cpipe/ [kernel PMU event]
-------------------------------------------
-hisi_sccl1_l3c0/rd_hit_cpipe/ [kernel PMU event]
-------------------------------------------
-hisi_sccl1_l3c0/wr_hit_cpipe/ [kernel PMU event]
-------------------------------------------
+Example usage of perf::
 
-$# perf stat -a -e hisi_sccl3_l3c0/rd_hit_cpipe/ sleep 5
-$# perf stat -a -e hisi_sccl3_l3c0/config=0x02/ sleep 5
+  $# perf list
+  hisi_sccl3_l3c0/rd_hit_cpipe/ [kernel PMU event]
+  ------------------------------------------
+  hisi_sccl3_l3c0/wr_hit_cpipe/ [kernel PMU event]
+  ------------------------------------------
+  hisi_sccl1_l3c0/rd_hit_cpipe/ [kernel PMU event]
+  ------------------------------------------
+  hisi_sccl1_l3c0/wr_hit_cpipe/ [kernel PMU event]
+  ------------------------------------------
+
+  $# perf stat -a -e hisi_sccl3_l3c0/rd_hit_cpipe/ sleep 5
+  $# perf stat -a -e hisi_sccl3_l3c0/config=0x02/ sleep 5
 
 The current driver does not support sampling. So "perf record" is unsupported.
 Also attach to a task is unsupported as the events are all uncore.
diff --git a/Documentation/perf/index.rst b/Documentation/perf/index.rst
new file mode 100644
index 000000000000..4bf848e27f26
--- /dev/null
+++ b/Documentation/perf/index.rst
@@ -0,0 +1,16 @@
+:orphan:
+
+===========================
+Performance monitor support
+===========================
+
+.. toctree::
+   :maxdepth: 1
+
+   hisi-pmu
+   qcom_l2_pmu
+   qcom_l3_pmu
+   arm-ccn
+   xgene-pmu
+   arm_dsu_pmu
+   thunderx2-pmu
diff --git a/Documentation/perf/qcom_l2_pmu.txt b/Documentation/perf/qcom_l2_pmu.rst
similarity index 94%
rename from Documentation/perf/qcom_l2_pmu.txt
rename to Documentation/perf/qcom_l2_pmu.rst
index b25b97659ab9..c130178a4a55 100644
--- a/Documentation/perf/qcom_l2_pmu.txt
+++ b/Documentation/perf/qcom_l2_pmu.rst
@@ -1,3 +1,4 @@
+=====================================================================
 Qualcomm Technologies Level-2 Cache Performance Monitoring Unit (PMU)
 =====================================================================
 
@@ -28,7 +29,7 @@ The driver provides a "cpumask" sysfs attribute which contains a mask
 consisting of one CPU per cluster which will be used to handle all the PMU
 events on that cluster.
 
-Examples for use with perf:
+Examples for use with perf::
 
   perf stat -e l2cache_0/config=0x001/,l2cache_0/config=0x042/ -a sleep 1
 
diff --git a/Documentation/perf/qcom_l3_pmu.txt b/Documentation/perf/qcom_l3_pmu.rst
similarity index 93%
rename from Documentation/perf/qcom_l3_pmu.txt
rename to Documentation/perf/qcom_l3_pmu.rst
index 96b3a9444a0d..a3d014a46bfd 100644
--- a/Documentation/perf/qcom_l3_pmu.txt
+++ b/Documentation/perf/qcom_l3_pmu.rst
@@ -1,3 +1,4 @@
+===========================================================================
 Qualcomm Datacenter Technologies L3 Cache Performance Monitoring Unit (PMU)
 ===========================================================================
 
@@ -17,7 +18,7 @@ The hardware implements 32bit event counters and has a flat 8bit event space
 exposed via the "event" format attribute. In addition to the 32bit physical
 counters the driver supports virtual 64bit hardware counters by using hardware
 counter chaining. This feature is exposed via the "lc" (long counter) format
-flag. E.g.:
+flag. E.g.::
 
   perf stat -e l3cache_0_0/read-miss,lc/
 
diff --git a/Documentation/perf/thunderx2-pmu.txt b/Documentation/perf/thunderx2-pmu.rst
similarity index 73%
rename from Documentation/perf/thunderx2-pmu.txt
rename to Documentation/perf/thunderx2-pmu.rst
index dffc57143736..08e33675853a 100644
--- a/Documentation/perf/thunderx2-pmu.txt
+++ b/Documentation/perf/thunderx2-pmu.rst
@@ -1,3 +1,4 @@
+=============================================================
 Cavium ThunderX2 SoC Performance Monitoring Unit (PMU UNCORE)
 =============================================================
 
@@ -24,18 +25,18 @@ and configuration options under sysfs, see
 The driver does not support sampling, therefore "perf record" will not
 work. Per-task perf sessions are also not supported.
 
-Examples:
+Examples::
 
-# perf stat -a -e uncore_dmc_0/cnt_cycles/ sleep 1
+  # perf stat -a -e uncore_dmc_0/cnt_cycles/ sleep 1
 
-# perf stat -a -e \
-uncore_dmc_0/cnt_cycles/,\
-uncore_dmc_0/data_transfers/,\
-uncore_dmc_0/read_txns/,\
-uncore_dmc_0/write_txns/ sleep 1
+  # perf stat -a -e \
+  uncore_dmc_0/cnt_cycles/,\
+  uncore_dmc_0/data_transfers/,\
+  uncore_dmc_0/read_txns/,\
+  uncore_dmc_0/write_txns/ sleep 1
 
-# perf stat -a -e \
-uncore_l3c_0/read_request/,\
-uncore_l3c_0/read_hit/,\
-uncore_l3c_0/inv_request/,\
-uncore_l3c_0/inv_hit/ sleep 1
+  # perf stat -a -e \
+  uncore_l3c_0/read_request/,\
+  uncore_l3c_0/read_hit/,\
+  uncore_l3c_0/inv_request/,\
+  uncore_l3c_0/inv_hit/ sleep 1
diff --git a/Documentation/perf/xgene-pmu.txt b/Documentation/perf/xgene-pmu.rst
similarity index 96%
rename from Documentation/perf/xgene-pmu.txt
rename to Documentation/perf/xgene-pmu.rst
index d7cff4454e5b..644f8ed89152 100644
--- a/Documentation/perf/xgene-pmu.txt
+++ b/Documentation/perf/xgene-pmu.rst
@@ -1,3 +1,4 @@
+================================================
 APM X-Gene SoC Performance Monitoring Unit (PMU)
 ================================================
 
@@ -33,7 +34,7 @@ each PMU, please refer to APM X-Gene User Manual.
 Each perf driver also provides a "cpumask" sysfs attribute, which contains a
 single CPU ID of the processor which will be used to handle all the PMU events.
 
-Example for perf tool use:
+Example for perf tool use::
 
  / # perf list | grep -e l3c -e iob -e mcb -e mc
    l3c0/ackq-full/                                    [Kernel PMU event]
diff --git a/MAINTAINERS b/MAINTAINERS
index 163327d6a856..2f8e1543caff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1139,7 +1139,7 @@ APPLIED MICRO (APM) X-GENE SOC PMU
 M:	Khuong Dinh <khuong@os.amperecomputing.com>
 S:	Supported
 F:	drivers/perf/xgene_pmu.c
-F:	Documentation/perf/xgene-pmu.txt
+F:	Documentation/perf/xgene-pmu.rst
 F:	Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
 
 APTINA CAMERA SENSOR PLL
@@ -7180,7 +7180,7 @@ M:	Shaokun Zhang <zhangshaokun@hisilicon.com>
 W:	http://www.hisilicon.com
 S:	Supported
 F:	drivers/perf/hisilicon
-F:	Documentation/perf/hisi-pmu.txt
+F:	Documentation/perf/hisi-pmu.rst
 
 HISILICON ROCE DRIVER
 M:	Lijun Ou <oulijun@huawei.com>
diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index 15b8c10c2b2b..90f88ce5192b 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -8,7 +8,7 @@
  * the slices. User space needs to aggregate to individual counts to provide
  * a global picture.
  *
- * See Documentation/perf/qcom_l3_pmu.txt for more details.
+ * See Documentation/perf/qcom_l3_pmu.rst for more details.
  *
  * Copyright (c) 2015-2017, The Linux Foundation. All rights reserved.
  */
-- 
2.21.0

