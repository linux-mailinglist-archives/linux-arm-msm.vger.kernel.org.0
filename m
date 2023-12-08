Return-Path: <linux-arm-msm+bounces-4029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B246080A9EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 18:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF1DD1C20446
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF2035268;
	Fri,  8 Dec 2023 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hZYGQYHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8E910F1
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 09:00:20 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8D9Ghw005015;
	Fri, 8 Dec 2023 17:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=wHJ+4ZUnbHZlPY4RM1Li/BP4hbUdWSaXqBp7Npt4yes=;
 b=hZYGQYHhGAy638EkUy8KDDXe8hvbKjqdM3MY4UHxw8pfw3ISXGUSl/H9a8ZNeafnifD0
 UMoJ3/82QDT0i1uiLwDgx1R94kB1sb30F97mTuXt0C/41Wh9Dcw6AnxD1eyf/X/6/AZK
 cNU5ioEl6qtEnfKGC3BdZC88qvHDiDQfgbfMKfNBAdiojOQXah+/GC8B/AWOgmWmBaiT
 d9nQGoK3RwiW75WXozgp9J+eDaoK176k2cwdiLaG5c+jVjINC9eDvg6fp+uvA3Sn9nJb
 AnNoWWSuj5PRDU6snOFUrG5v0e7UHIAJQOlF4wDnHjFD4WMWjaLYgogaXZwkF6raHyLl aA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuj96jqsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 17:00:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8H06LB012441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 17:00:06 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 09:00:05 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <mani@kernel.org>, <quic_pkanojiy@quicinc.com>, <quic_carlv@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH] bus: mhi: host: Read PK HASH dynamically
Date: Fri, 8 Dec 2023 09:59:38 -0700
Message-ID: <20231208165938.1340587-1-quic_jhugo@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OH5HS67o7qN5epo1t6d4_XwPrgn3Cm9L
X-Proofpoint-ORIG-GUID: OH5HS67o7qN5epo1t6d4_XwPrgn3Cm9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080140

The OEM PK HASH registers in the BHI region are read once during firmware
load (boot), cached, and displayed on demand via sysfs. This has a few
problems - if firmware load is skipped, the registers will not be read and
if the register values change over the life of the device the local cache
will be out of sync.

Qualcomm Cloud AI 100 can expose both these problems. It is possible for
mhi_async_power_up() to be invoked while the device is in AMSS EE, which
would bypass firmware loading. Also, Qualcomm Cloud AI 100 has 5 PK HASH
slots which can be dynamically provisioned while the device is active,
which would result in the values changing and users may want to know what
keys are active.

Address these concerns by reading the PK HASH registers on-demand during
the sysfs read. This will result in showing the most current information.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/bus/mhi/host/boot.c | 11 +----------
 drivers/bus/mhi/host/init.c | 16 ++++++++++++----
 include/linux/mhi.h         |  2 --
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index edc0ec5a0933..dedd29ca8db3 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -395,7 +395,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	void *buf;
 	dma_addr_t dma_addr;
 	size_t size, fw_sz;
-	int i, ret;
+	int ret;
 
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev, "Device MHI is not in valid state\n");
@@ -408,15 +408,6 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	if (ret)
 		dev_err(dev, "Could not capture serial number via BHI\n");
 
-	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++) {
-		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_OEMPKHASH(i),
-				   &mhi_cntrl->oem_pk_hash[i]);
-		if (ret) {
-			dev_err(dev, "Could not capture OEM PK HASH via BHI\n");
-			break;
-		}
-	}
-
 	/* wait for ready on pass through or any other execution environment */
 	if (!MHI_FW_LOAD_CAPABLE(mhi_cntrl->ee))
 		goto fw_load_ready_state;
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 65ceac1837f9..e2c2f510b04f 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -97,11 +97,19 @@ static ssize_t oem_pk_hash_show(struct device *dev,
 {
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
-	int i, cnt = 0;
+	u32 hash_segment[MHI_MAX_OEM_PK_HASH_SEGMENTS];
+	int i, cnt = 0, ret;
 
-	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++)
-		cnt += sysfs_emit_at(buf, cnt, "OEMPKHASH[%d]: 0x%x\n",
-				i, mhi_cntrl->oem_pk_hash[i]);
+	for (i = 0; i < MHI_MAX_OEM_PK_HASH_SEGMENTS; i++) {
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_OEMPKHASH(i), &hash_segment[i]);
+		if (ret) {
+			dev_err(dev, "Could not capture OEM PK HASH\n");
+			return cnt;
+		}
+	}
+
+	for (i = 0; i < MHI_MAX_OEM_PK_HASH_SEGMENTS; i++)
+		cnt += sysfs_emit_at(buf, cnt, "OEMPKHASH[%d]: 0x%x\n", i, hash_segment[i]);
 
 	return cnt;
 }
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index d0f9b522f328..474d32cb0520 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -325,7 +325,6 @@ struct mhi_controller_config {
  * @major_version: MHI controller major revision number
  * @minor_version: MHI controller minor revision number
  * @serial_number: MHI controller serial number obtained from BHI
- * @oem_pk_hash: MHI controller OEM PK Hash obtained from BHI
  * @mhi_event: MHI event ring configurations table
  * @mhi_cmd: MHI command ring configurations table
  * @mhi_ctxt: MHI device context, shared memory between host and device
@@ -413,7 +412,6 @@ struct mhi_controller {
 	u32 major_version;
 	u32 minor_version;
 	u32 serial_number;
-	u32 oem_pk_hash[MHI_MAX_OEM_PK_HASH_SEGMENTS];
 
 	struct mhi_event *mhi_event;
 	struct mhi_cmd *mhi_cmd;
-- 
2.34.1


