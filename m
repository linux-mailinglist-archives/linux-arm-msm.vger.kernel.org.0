Return-Path: <linux-arm-msm+bounces-2360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1277FCF8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 07:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C19981C2091A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 06:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F86E10781;
	Wed, 29 Nov 2023 06:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OsEUTNsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83681735;
	Tue, 28 Nov 2023 22:58:24 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT4q8BM009098;
	Wed, 29 Nov 2023 06:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=edLm9Ox96tmdmTQ7v//ClBc2NVL4CfyEXE85fW+2XjY=;
 b=OsEUTNsQ1X/aVlIBxYwqEGtREKpnXucZDcQ2nnu5fXRIpnihFc0Zbv53cieZAcxNiKY1
 ch6wFRgbiFYq1wOICB7QQo6VNtQeI/B0mnBwYE1geHYkNDrn3xSzIwooINUGyE756x22
 pUrXGL8gG//w9ZfJP8DqjtDrFlaylMgygcaki50JpXkF/gQE2mO9TbGxMS/AWo8RJQKp
 5PBPFd04KLj3rZgIgVyLzPyJB1MN9icMbt3gdpvDWEBkVszNDMhFZY1w7dNQPMq3VjMw
 LBxEZbwhRM744Pkqy1q0mSf+vPQS5C+QyzX7ddf+CD8oVuJFOzn4fNEAueW1v28+T0eZ lw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unje1a2h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 06:58:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT6wDaa020862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 06:58:13 GMT
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 22:58:10 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mdtipton@quicinc.com>, <linux-arm-kernel@lists.infradead.org>,
        <quic_asartor@quicinc.com>, <quic_lingutla@quicinc.com>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH 1/3] firmware: arm_scmi: Fix null pointer dereference during fastchannel init
Date: Wed, 29 Nov 2023 12:27:46 +0530
Message-ID: <20231129065748.19871-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231129065748.19871-1-quic_sibis@quicinc.com>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jSzMxAy31XFdUcrRMgglGV8GLxPqBZFx
X-Proofpoint-ORIG-GUID: jSzMxAy31XFdUcrRMgglGV8GLxPqBZFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_03,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290049

The scmi_perf_domain_lookup requires the protocol handle to have the
private data set, which is yet to happen during the fastchannel init
scenario. This results in a null pointer dereference. Fix this by using
the pre-populated perf_dom_info to pass on the required information
instead.

Call trace:
scmi_perf_protocol_init+0x434/0x678
scmi_get_protocol_instance+0x168/0x29c
scmi_devres_protocol_instance_get+0x50/0xa0
scmi_devm_protocol_get+0x20/0x50
scmi_cpufreq_probe+0x34/0xd4
scmi_dev_probe+0x28/0x3c
really_probe+0x148/0x2ac
__driver_probe_device+0x78/0x12c
driver_probe_device+0x40/0x160
__device_attach_driver+0xb8/0x134
bus_for_each_drv+0x80/0xdc
__device_attach+0xa8/0x1b0
device_initial_probe+0x14/0x20
bus_probe_device+0xa8/0xac
device_add+0x5cc/0x778
device_register+0x20/0x30
__scmi_device_create.part.0+0xec/0x1cc
scmi_device_create+0x180/0x1c4
scmi_create_protocol_devices+0x4c/0xb0
scmi_probe+0x660/0x738
platform_probe+0x68/0xdc
really_probe+0x148/0x2ac
__driver_probe_device+0x78/0x12c
driver_probe_device+0x40/0x160
__device_attach_driver+0xb8/0x134
bus_for_each_drv+0x80/0xdc
__device_attach+0xa8/0x1b0
device_initial_probe+0x14/0x20
bus_probe_device+0xa8/0xac
deferred_probe_work_func+0x88/0xc0
process_one_work+0x13c/0x264
worker_thread+0x32c/0x438
kthread+0x118/0x11c
ret_from_fork+0x10/0x20

Fixes: 619bc6e034f3 ("firmware: arm_scmi: Populate fastchannel info only if set operations are allowed")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/arm_scmi/perf.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index d1323c5d9c27..a648521e04a3 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -759,40 +759,35 @@ static int scmi_perf_level_limits_notify(const struct scmi_protocol_handle *ph,
 }
 
 static void scmi_perf_domain_init_fc(const struct scmi_protocol_handle *ph,
-				     u32 domain, struct scmi_fc_info **p_fc)
+				     struct perf_dom_info *dom)
 {
 	struct scmi_fc_info *fc;
-	struct perf_dom_info *dom;
-
-	dom = scmi_perf_domain_lookup(ph, domain);
-	if (IS_ERR(dom))
-		return;
 
 	fc = devm_kcalloc(ph->dev, PERF_FC_MAX, sizeof(*fc), GFP_KERNEL);
 	if (!fc)
 		return;
 
 	ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
-				   PERF_LEVEL_GET, 4, domain,
+				   PERF_LEVEL_GET, 4, dom->id,
 				   &fc[PERF_FC_LEVEL].get_addr, NULL);
 
 	ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
-				   PERF_LIMITS_GET, 8, domain,
+				   PERF_LIMITS_GET, 8, dom->id,
 				   &fc[PERF_FC_LIMIT].get_addr, NULL);
 
 	if (dom->info.set_perf)
 		ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
-					   PERF_LEVEL_SET, 4, domain,
+					   PERF_LEVEL_SET, 4, dom->id,
 					   &fc[PERF_FC_LEVEL].set_addr,
 					   &fc[PERF_FC_LEVEL].set_db);
 
 	if (dom->set_limits)
 		ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
-					   PERF_LIMITS_SET, 8, domain,
+					   PERF_LIMITS_SET, 8, dom->id,
 					   &fc[PERF_FC_LIMIT].set_addr,
 					   &fc[PERF_FC_LIMIT].set_db);
 
-	*p_fc = fc;
+	dom->fc_info = fc;
 }
 
 static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
@@ -1102,7 +1097,7 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
 		scmi_perf_describe_levels_get(ph, dom, version);
 
 		if (dom->perf_fastchannels)
-			scmi_perf_domain_init_fc(ph, dom->id, &dom->fc_info);
+			scmi_perf_domain_init_fc(ph, dom);
 	}
 
 	ret = devm_add_action_or_reset(ph->dev, scmi_perf_xa_destroy, pinfo);
-- 
2.17.1


