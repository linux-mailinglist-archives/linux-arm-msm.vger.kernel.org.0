Return-Path: <linux-arm-msm+bounces-26203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558B9317F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 17:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E980283BA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5C710A24;
	Mon, 15 Jul 2024 15:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iB4wS/sz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9336E1171C;
	Mon, 15 Jul 2024 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721059042; cv=none; b=VqsR3k1SFAODrul+bhCjVaEtOIVYAglm8uL3SGDi4xtflBKxGxcBBaq/ktHdrGFnCx/ERsS0Ch282g+7fbf/E3rnH9JB+BBcQSHSH8mjhblA+WaH8lmcZwptbTyTiEj07rzBnsYZ2BI81lHwFCpz1a6z7E8E1+zmqwlAfpO0nr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721059042; c=relaxed/simple;
	bh=ccuuPWS/kHndTJIROlan9HdA8UeYyOHGtUAvlJbG/iQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BkTdMs8a0l20nQbt7abltS5/TViXpyy733xxScy9bavp9tp6fEv2X8V5EBwxsiNHz8MRY3WjG4PTUFlp6h+LMzMiP+mAkY/0gsJpVwEaC0QjZq5e1eTsVZPdpNuUohOsRHl+E+MjfeDiDl0f1XA5ZNVNAnXk49Gcs3O3KZB3lxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iB4wS/sz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FAQlhN003863;
	Mon, 15 Jul 2024 15:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gCiFNnIZr3eKo25BFHugoK
	CzKuqWtkarMsaqT4Ce42U=; b=iB4wS/szosA7HlubTRbQLC7ivjO1HK/aBiUd1n
	ABDywGoWwA4IW3mXGy5IFj81fDmHFg+1M6XDgijhsh80WqwAeqnKyiu4yGg3E2Cf
	3Memq506gAKiXR8C3+52r8HoqWcFywja1fjnY9i6afXBcadIH+boxQaMovVnQISp
	zyaYQfwilaqlyb14oZ6AwI2gru84kzGv0y8+KFRs+b6Uzrcpf0EZUS/kRvsVU2uq
	MzCwbQk/OqUVvqZl1GEEPAMBkk9Ve9KjJM58jyoMU7zewhn3/Ym0VqXLGiH/yfzK
	E7K5Z+OoOJeItMbfXv1atcsm24oPhjrIra3sFsEMWq4T/RZQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bf9ecveg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 15:57:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FFvFoV019912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 15:57:16 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Jul 2024 08:57:13 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Mukesh
 Ojha" <quic_mojha@quicinc.com>
Subject: [PATCH v8 1/2] Firmware: qcom_scm: Refactor code to support multiple dload mode
Date: Mon, 15 Jul 2024 21:26:54 +0530
Message-ID: <20240715155655.1811178-1-quic_mojha@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R3Myj2LezusXOa1AWCXS4XsT1hUeXVLa
X-Proofpoint-GUID: R3Myj2LezusXOa1AWCXS4XsT1hUeXVLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_10,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407150126

Currently on Qualcomm SoC, download_mode is enabled if
CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is selected or
passed a boolean value from command line.

Refactor the code such that it supports multiple download
modes and drop CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT config
instead, give interface to set the download mode from
module parameter while being backword compatible at the
same time.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
Change in v8: https://lore.kernel.org/lkml/20240109153200.12848-12-quic_mojha@quicinc.com/
 - Rebased it on top of https://lore.kernel.org/lkml/20240708155332.4056479-1-quic_mojha@quicinc.com/
 - Sending them separately as they are not dependent on
   kernel minidump driver as minidump as a download mode
   exists even without kernel driver and it can be enabled
   via SCM driver to collect firmware minidump.
   

 drivers/firmware/qcom/Kconfig    | 11 ------
 drivers/firmware/qcom/qcom_scm.c | 60 +++++++++++++++++++++++++++-----
 2 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 7f6eb4174734..33b282aaec01 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -40,17 +40,6 @@ config QCOM_TZMEM_MODE_SHMBRIDGE
 
 endchoice
 
-config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
-	bool "Qualcomm download mode enabled by default"
-	depends on QCOM_SCM
-	help
-	  A device with "download mode" enabled will upon an unexpected
-	  warm-restart enter a special debug mode that allows the user to
-	  "download" memory content over USB for offline postmortem analysis.
-	  The feature can be enabled/disabled on the kernel command line.
-
-	  Say Y here to enable "download mode" by default.
-
 config QCOM_QSEECOM
 	bool "Qualcomm QSEECOM interface driver"
 	depends on QCOM_SCM=y
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 0f5ac346bda4..55955f675cd0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -32,8 +33,7 @@
 #include "qcom_scm.h"
 #include "qcom_tzmem.h"
 
-static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
-module_param(download_mode, bool, 0);
+static u32 download_mode;
 
 struct qcom_scm {
 	struct device *dev;
@@ -134,6 +134,11 @@ static const char * const qcom_scm_convention_names[] = {
 	[SMC_CONVENTION_LEGACY] = "smc legacy",
 };
 
+static const char * const download_mode_name[] = {
+	[QCOM_DLOAD_NODUMP]	= "off",
+	[QCOM_DLOAD_FULLDUMP]	= "full",
+};
+
 static struct qcom_scm *__scm;
 
 static int qcom_scm_clk_enable(void)
@@ -526,17 +531,16 @@ static int qcom_scm_io_rmw(phys_addr_t addr, unsigned int mask, unsigned int val
 	return qcom_scm_io_writel(addr, new);
 }
 
-static void qcom_scm_set_download_mode(bool enable)
+static void qcom_scm_set_download_mode(u32 dload_mode)
 {
-	u32 val = enable ? QCOM_DLOAD_FULLDUMP : QCOM_DLOAD_NODUMP;
 	int ret = 0;
 
 	if (__scm->dload_mode_addr) {
 		ret = qcom_scm_io_rmw(__scm->dload_mode_addr, QCOM_DLOAD_MASK,
-				      FIELD_PREP(QCOM_DLOAD_MASK, val));
+				      FIELD_PREP(QCOM_DLOAD_MASK, dload_mode));
 	} else if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_BOOT,
 						QCOM_SCM_BOOT_SET_DLOAD_MODE)) {
-		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
+		ret = __qcom_scm_set_dload_mode(__scm->dev, !!dload_mode);
 	} else {
 		dev_err(__scm->dev,
 			"No available mechanism for setting download mode\n");
@@ -1886,6 +1890,46 @@ static irqreturn_t qcom_scm_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int get_download_mode(char *buffer, const struct kernel_param *kp)
+{
+	if (download_mode >= ARRAY_SIZE(download_mode_name))
+		return sysfs_emit(buffer, "unknown mode\n");
+
+	return sysfs_emit(buffer, "%s\n", download_mode_name[download_mode]);
+}
+
+static int set_download_mode(const char *val, const struct kernel_param *kp)
+{
+	bool tmp;
+	int ret;
+
+	ret = sysfs_match_string(download_mode_name, val);
+	if (ret < 0) {
+		ret = kstrtobool(val, &tmp);
+		if (ret < 0) {
+			pr_err("qcom_scm: err: %d\n", ret);
+			return ret;
+		}
+
+		ret = tmp ? 1 : 0;
+	}
+
+	download_mode = ret;
+	if (__scm)
+		qcom_scm_set_download_mode(download_mode);
+
+	return 0;
+}
+
+static const struct kernel_param_ops download_mode_param_ops = {
+	.get = get_download_mode,
+	.set = set_download_mode,
+};
+
+module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
+MODULE_PARM_DESC(download_mode,
+		"download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode");
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_tzmem_pool_config pool_config;
@@ -1950,7 +1994,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	__get_convention();
 
 	/*
-	 * If requested enable "download mode", from this point on warmboot
+	 * If "download mode" is requested, from this point on warmboot
 	 * will cause the boot stages to enter download mode, unless
 	 * disabled below by a clean shutdown/reboot.
 	 */
@@ -2001,7 +2045,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 static void qcom_scm_shutdown(struct platform_device *pdev)
 {
 	/* Clean shutdown, disable download mode to allow normal restart */
-	qcom_scm_set_download_mode(false);
+	qcom_scm_set_download_mode(QCOM_DLOAD_NODUMP);
 }
 
 static const struct of_device_id qcom_scm_dt_match[] = {
-- 
2.34.1


