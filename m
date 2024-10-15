Return-Path: <linux-arm-msm+bounces-34413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F999E479
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7EB4283932
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 10:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D6C1E2825;
	Tue, 15 Oct 2024 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KEzfBTxG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFEB16A92D;
	Tue, 15 Oct 2024 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989344; cv=none; b=ZgoCz9GKaKw8w5pa1oUhTkUbqTQKkgdfk8tUETzBhjpTndQFUUXancWzgFLkxUrOo1JBnTxuVYM7roKFadKa+u/AiwZy5KwvSC/2TID3orxm6HB6fWNkdsfT9YzLxvsmfDBNnthpnn5MDe9hsHDpuP83YRUcy/vKmWYtPIfKuUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989344; c=relaxed/simple;
	bh=h7NDHpBdYdU643tF3YorSGPzxxfZAdS1qbY5EL6UD6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=KOsf2oPjH4KXosFnFM6yMWHpv2gIZ0aeVNOPKXTEbHgz80AStdTo2Cioo4AS7lT9vrfdAdVBnxtFdQYfzAcY6JmFEG57i0pCBu56i7fNgtMCQLEUw0U2565lSBb0fSmzI/bd/EgwsRcKdY7KIh6kDRsPZ4hdKrSGvBL6McV6LF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KEzfBTxG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F9G9kv019996;
	Tue, 15 Oct 2024 10:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7/7R27TdpyywjeZI4CpLKA
	Xus/59McKW1JXTs9g8F+E=; b=KEzfBTxGsPqczgBO1XQyckTH4JZR0zT7kIvnsw
	L9nE291IMsPCxTqqVYbDzYFOE7LCRThDVsfnw29NRTgYUDWbJkhMATSmsqiRhBW/
	69xC7lIrE/RMNOMO7QL22WHzxupHaTIK5qUHpU2z5y/GBoXlbqv14GaZz4ffaLGL
	4FNFCWhkbHe05AFSAuypA4XRVkD3WSoNJZmqu7xx+94Hs/2tJv9BHqWnQifoDKlw
	vgLMfFtxHbnxe5PR+QzLOJR1r8vTTbHNogvMKvAcWtnIz/BwwnInHygGyU/RMgSX
	af5ewMLuZb7O+BFwqHZ/tLgqR71Kg07ite62uTebM/KUca/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429nm3g7cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 10:48:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FAmrkD002559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 10:48:53 GMT
Received: from xinqzhan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 03:48:51 -0700
From: Xinqi Zhang <quic_xinqzhan@quicinc.com>
Date: Tue, 15 Oct 2024 18:48:25 +0800
Subject: [PATCH] firmware: arm_scmi: fix slab-use-after-free in
 scmi_bus_notifier
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241015-fix-arm-scmi-slab-use-after-free-v1-1-b006eba9c8df@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHhIDmcC/x2NSwrCQBAFrxJ67YOZfPBzFXExGd9og4nSHUUIu
 buDy1pU1SpOU7qcmlWMH3V9zhXirpF8T/ON0GtlaUPbxxAHFP0i2QTPk8IfacTbiVQWGoqR2Pf
 shsPY5WPIUjMvY3X+i/Nl235PlO7UcgAAAA==
X-Change-ID: 20241015-fix-arm-scmi-slab-use-after-free-74e358b3c90c
To: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi
	<cristian.marussi@arm.com>
CC: <linux-arm-msm@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Xinqi Zhang" <quic_xinqzhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728989331; l=4437;
 i=quic_xinqzhan@quicinc.com; s=20241015; h=from:subject:message-id;
 bh=h7NDHpBdYdU643tF3YorSGPzxxfZAdS1qbY5EL6UD6c=;
 b=4c0hZqxYb27wVvv9WZRJlosG7GOGsTdciDeNGvEnkHL9S/QLHWbqYfUtHCWQvGf2JCPVQdOXg
 Y/QZYtoVt0VCG0CUNpPcqEMgOv//DcojoyvYTnh2GP7MWIlLQ2zLVbv
X-Developer-Key: i=quic_xinqzhan@quicinc.com; a=ed25519;
 pk=e+mEOolV1It3rv+K/zKK83GBcQFoVe2iQO+mmOoesHg=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 46_0Gx9cYIxIfW4Fp_JiqI-HFqGsXtRP
X-Proofpoint-ORIG-GUID: 46_0Gx9cYIxIfW4Fp_JiqI-HFqGsXtRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=889 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150073

Move release of scmi_dev->name into scmi_device_release to
avoid slab-use-after-free.

==================================================================
BUG: KASAN: slab-use-after-free in strncmp+0xe4/0xec
Read of size 1 at addr ffffff80a482bcc0 by task swapper/0/1

CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.6.38-debug #1
Hardware name: Qualcomm Technologies, Inc. SA8775P Ride (DT)
Call trace:
 dump_backtrace+0x94/0x114
 show_stack+0x18/0x24
 dump_stack_lvl+0x48/0x60
 print_report+0xf4/0x5b0
 kasan_report+0xa4/0xec
 __asan_report_load1_noabort+0x20/0x2c
 strncmp+0xe4/0xec
 scmi_bus_notifier+0x5c/0x54c
 notifier_call_chain+0xb4/0x31c
 blocking_notifier_call_chain+0x68/0x9c
 bus_notify+0x54/0x78
 device_del+0x1bc/0x840
 device_unregister+0x20/0xb4
 __scmi_device_destroy+0xac/0x280
 scmi_device_destroy+0x94/0xd0
 scmi_chan_setup+0x524/0x750
 scmi_probe+0x7fc/0x1508
 platform_probe+0xc4/0x19c
 really_probe+0x32c/0x99c
 __driver_probe_device+0x15c/0x3c4
 driver_probe_device+0x5c/0x170
 __driver_attach+0x1c8/0x440
 bus_for_each_dev+0xf4/0x178
 driver_attach+0x3c/0x58
 bus_add_driver+0x234/0x4d4
 driver_register+0xf4/0x3c0
 __platform_driver_register+0x60/0x88
 scmi_driver_init+0xb0/0x104
 do_one_initcall+0xb4/0x664
 kernel_init_freeable+0x3c8/0x894
 kernel_init+0x24/0x1e8
 ret_from_fork+0x10/0x20

Allocated by task 1:
 kasan_save_stack+0x2c/0x54
 kasan_set_track+0x2c/0x40
 kasan_save_alloc_info+0x24/0x34
 __kasan_kmalloc+0xa0/0xb8
 __kmalloc_node_track_caller+0x6c/0x104
 kstrdup+0x48/0x84
 kstrdup_const+0x34/0x40
 __scmi_device_create.part.0+0x8c/0x408
 scmi_device_create+0x104/0x370
 scmi_chan_setup+0x2a0/0x750
 scmi_probe+0x7fc/0x1508
 platform_probe+0xc4/0x19c
 really_probe+0x32c/0x99c
 __driver_probe_device+0x15c/0x3c4
 driver_probe_device+0x5c/0x170
 __driver_attach+0x1c8/0x440
 bus_for_each_dev+0xf4/0x178
 driver_attach+0x3c/0x58
 bus_add_driver+0x234/0x4d4
 driver_register+0xf4/0x3c0
 __platform_driver_register+0x60/0x88
 scmi_driver_init+0xb0/0x104
 do_one_initcall+0xb4/0x664
 kernel_init_freeable+0x3c8/0x894
 kernel_init+0x24/0x1e8
 ret_from_fork+0x10/0x20

Freed by task 1:
 kasan_save_stack+0x2c/0x54
 kasan_set_track+0x2c/0x40
 kasan_save_free_info+0x38/0x5c
 __kasan_slab_free+0xe8/0x164
 __kmem_cache_free+0x11c/0x230
 kfree+0x70/0x130
 kfree_const+0x20/0x40
 __scmi_device_destroy+0x70/0x280
 scmi_device_destroy+0x94/0xd0
 scmi_chan_setup+0x524/0x750
 scmi_probe+0x7fc/0x1508
 platform_probe+0xc4/0x19c
 really_probe+0x32c/0x99c
 __driver_probe_device+0x15c/0x3c4
 driver_probe_device+0x5c/0x170
 __driver_attach+0x1c8/0x440
 bus_for_each_dev+0xf4/0x178
 driver_attach+0x3c/0x58
 bus_add_driver+0x234/0x4d4
 driver_register+0xf4/0x3c0
 __platform_driver_register+0x60/0x88
 scmi_driver_init+0xb0/0x104
 do_one_initcall+0xb4/0x664
 kernel_init_freeable+0x3c8/0x894
 kernel_init+0x24/0x1e8
 ret_from_fork+0x10/0x20

Signed-off-by: Xinqi Zhang <quic_xinqzhan@quicinc.com>
---
 drivers/firmware/arm_scmi/bus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 96b2e5f9a8ef0386525f9d91d2925e7e6d48ac28..157172a5f2b577ce4f04425f967f548230c1ebed 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -325,7 +325,10 @@ EXPORT_SYMBOL_GPL(scmi_driver_unregister);
 
 static void scmi_device_release(struct device *dev)
 {
-	kfree(to_scmi_dev(dev));
+	struct scmi_device *scmi_dev = to_scmi_dev(dev);
+
+	kfree_const(scmi_dev->name);
+	kfree(scmi_dev);
 }
 
 static void __scmi_device_destroy(struct scmi_device *scmi_dev)
@@ -338,7 +341,6 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
 		atomic_set(&scmi_syspower_registered, 0);
 
-	kfree_const(scmi_dev->name);
 	ida_free(&scmi_bus_id, scmi_dev->id);
 	device_unregister(&scmi_dev->dev);
 }
@@ -410,7 +412,6 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 
 	return scmi_dev;
 put_dev:
-	kfree_const(scmi_dev->name);
 	put_device(&scmi_dev->dev);
 	ida_free(&scmi_bus_id, id);
 	return NULL;

---
base-commit: eca631b8fe808748d7585059c4307005ca5c5820
change-id: 20241015-fix-arm-scmi-slab-use-after-free-74e358b3c90c

Best regards,
-- 
Xinqi Zhang <quic_xinqzhan@quicinc.com>


