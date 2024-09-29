Return-Path: <linux-arm-msm+bounces-32716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D4A9893A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 10:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC56D282FD6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 08:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E7D2AEEC;
	Sun, 29 Sep 2024 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="LeM4D0FB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2089.outbound.protection.outlook.com [40.107.117.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0619317580;
	Sun, 29 Sep 2024 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727596880; cv=fail; b=pbC41mSQKe1jZVSqZususF9CYCAmAM1ev09imbt5iroJF6X9q5pT09oGQCS2v3+m25Zjz06LHyemIyZ84ZtHGrvStkZxQ2G6Xrasc/fyl3NC4QpVwvzRJ46QUEsneGW5bhl8xcePdmzlXWdwyU0oEVomF57V+ZC2ip9s0Y+z5iQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727596880; c=relaxed/simple;
	bh=ksDf6zOTvGrxUKpZrO3uMSWuoJ/IA34gsS+lqgYimbU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aLK0lUCHZgYPhDv/jVbyKdBycaKuTP707PYuvlufRfYSr0wBWwDirb+bpDUgZcG4C2l3Gz50UQUD68ueaafUZg0JqWYsM+zzNIpQilbaGzuj03lEwkmJYYo5Sy2mqs5zrLxzDJ6PEQWUR1XumlzP4aEEstCjpIbIYZoYgV6lnlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=LeM4D0FB; arc=fail smtp.client-ip=40.107.117.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZspRdrRJPT7UCN/gQn4brCOsV56FpjIGLYASvN1TrqG4TqY8xyoArA6NBlY4IaATluk8SCCgvasuT/xpo6aK4mcbSSpg2gbdH3oRADKo44ajU6FREj1ZfZmFLosjZR0nihNDR9i6z62Z9mgVLkrVbQFSUMobfJ8GZbV/TEDsJfxtbMyZyLoGkVT0vyUEvH+x7dR+hb75UMf+TtoO/DRDjFiXZW2VXNwfDdKcqNfygmxs9aIrsyYS6g3fBr1sUdpfNDrl3bReKrIJoT4V565BJgwjJ6ayF6Q+dRFV7b8SgSTvVOXhAbSheZ7rvCX9dEtAJWng7HTw5P31P3FR+TXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOCTxb9N3XDMI11XagQP3pM9v5a/uChM3T5TDQf05Lk=;
 b=WkUOceoJyelPL90mFIek1UsgcCHdLxEto5YtPByQXXhVc/sI3rL+eHS0oBc3DfADpRKTekDHOFPwzRRVfXSjO9NU4SLa7d3UEKu9cNcsMyb1jPNluc8c3mj+s87DyQFwWN9D9CbIca19/qL4ewPu6CcS5jdE4B6DQX5XTBO5y+ArFC+q2kXR36y7Xc5yofzSRYmZI31bOHBPG4Pr2QOdmeK1DZgIHuH9FDdhvRUXanJ8hKDbeE33yeMlXHqUZmbfxSqAj1YiA6IxyprTah1iXxzJEQAWqG/gUE3gX/5VnbCj3cW00yeFmFPOgciPUYAZHbw1fuoz+d+WQo/49EOTcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOCTxb9N3XDMI11XagQP3pM9v5a/uChM3T5TDQf05Lk=;
 b=LeM4D0FBxIH+0lEXynVEp3X7qMkmySlhaJpB+PkptAYuiOqlQr+owVhsoe7UwZANsWyobN7lgaax3NaaChD3mLWF0bu0mYY0KNv/lfAKLZHM2Y/+K6NYxK0OOcHu4ZXWnI49qbmp44IL75G/6ufy0nCCg1Veu4GIuMtl7RVoDROqin04GqN+xg3WR1M7xmNsNKHTAWxIcYHVejBUvIkdx/GRrzVTE4jvZBoC3TNx0XZ23ETGY2IBdkC1/10LpRHj09E7mBTIiaKA62/ZNTOeBmm+pUy2oEVjUGakCcam5Eso36vxM//EQNSNT7h2AQXQvlqgJFph7+btKYgMFfPkpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by SEZPR06MB5764.apcprd06.prod.outlook.com (2603:1096:101:aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 08:01:16 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%6]) with mapi id 15.20.8005.020; Sun, 29 Sep 2024
 08:01:15 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: srinivas.kandagatla@linaro.org
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] slimbus: Correct some typos in comments
Date: Sun, 29 Sep 2024 16:01:05 +0800
Message-Id: <20240929080105.11604-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0233.apcprd06.prod.outlook.com
 (2603:1096:4:ac::17) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|SEZPR06MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd793fe-25b7-4caa-e740-08dce05ce48a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iaYQEKrR/xQYibraBqhUUqPiJqG/KIa0z69qawPeYBu/g6nWe0F21htDpwyq?=
 =?us-ascii?Q?ij/MZcleeiyxYvKDLCYsanMsAS5ASOhX+fLLw5ez/IDByPvzyVr08cNElUj4?=
 =?us-ascii?Q?oKzMHAHnmGaGGat/zt2Or8oeb9YgnxOv3YmUwZcME8oSzH3utNyb49T0AtLF?=
 =?us-ascii?Q?0RBHjek5lPaIOM9g1QqUXU01CckRBRnpnjSDajR91Rx/4v01CeTbCgBgEw+y?=
 =?us-ascii?Q?lxYu/0k2S3qtWcq9R2kVAzQFavYwIgW6v5pFbEgJPeFHDZMyr4jFvXc1fxhm?=
 =?us-ascii?Q?vD9b73QMUdhzxzlHxjqrkz3Kk81/tzctfpLnqBD45nZmoUqmV3DKPCgoaE28?=
 =?us-ascii?Q?cFjqscrBngyvG3Q4/SCZVJrDEnQ98+3TpOSauCs1sHvyRsb/lFPXYJHl4DDn?=
 =?us-ascii?Q?h/XDjX/b5RGdGAVZKEGAzdLYxCJpdWMs60rtz/qyjTqIsQLeoOdps9hsMpO8?=
 =?us-ascii?Q?zf+9+a1aHfci0JxiIuvX2xoo9DlO5WuRqsdZeaHp6Rx0FwKAzzqBnjtgLZEB?=
 =?us-ascii?Q?seDV6ZYa3ncy5Zu6AcnupSzWMFY863KA2ue+Szgr1KmdFA7lN8V7h9mQ63zF?=
 =?us-ascii?Q?6irs3klB5U8u63FEKTG8Qy9VM30cO8cf6piyVa6bPt5PTGTRhkRvvIH7oUKw?=
 =?us-ascii?Q?ApzIvGZlb+SCXMlNB22YQkFT+FCsrGME2BjJbGh0gniOKAec8OVCt2hU/R6L?=
 =?us-ascii?Q?FB4mNEVPziyhNtMwDYhFamQGf2jQOZ3YRKJHvu/DFPQDVZE0wySdDiUOVPHJ?=
 =?us-ascii?Q?1I46nsuVVVJ+kpfGL9Y+ETa5SgBISaBL6feUy2wI0V+57BqwctTuWWJMn8zf?=
 =?us-ascii?Q?Tzq/Hg74RqMZwHoWOAgCn+FmscQI6BIT6Ao0lVvWB43BbbRTk8kBd48tWX6q?=
 =?us-ascii?Q?7nuc85QSf9h87EiemOFRANqySTLzniX3F72iVRpYaJ5Q3ysihB3z4BGQoYhR?=
 =?us-ascii?Q?QRPyQ5YFO301NXEAnbc0XoqqjDsynjCQhfK0hC/ybcrRDMMrRAD49LMnJwZg?=
 =?us-ascii?Q?+DRhcKYkOqJ9/gcytYWiBmRZoaMkCCqFokh1PLUiDhesdN25+awxepGohMg3?=
 =?us-ascii?Q?LThi4R2I/4pgPI81D1PUhi6ic+f8OPIxTHVKWoTxY78DK7++lRB1gO9DmphB?=
 =?us-ascii?Q?Z7cpP1Bm7mAhed4CvpGqiR0VApWAkrxsyZ5IkQjVyIuXztwOB11eYjWqHXTn?=
 =?us-ascii?Q?4Mf5H+jbyXPv8y5N/rDmcxbHdTsY4nTTmCPm4BR8GRgp5Vy8Dr1HqGrIOUSr?=
 =?us-ascii?Q?1SNoYEdfeK5KUYlYAvKEhQO+ewGC5FniEhoqd5Ai9/rXRkgpFVIvjUZpIEaB?=
 =?us-ascii?Q?5Y/nzI6PnkYOIY2FCIa/P5LuCYaoTDm7gqYec/mGJnvROCFHPKR1e+2IrLvU?=
 =?us-ascii?Q?Hu3BtmmdiN836ONvQalbDHSx4dMxK9SN4ei2s8mYhbz2LtFmTg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?onOIaMnQlesotztWvOPCLcAH/1NniRYF/iNvZSVR6DGA8tyOCCDEaSQgCrdn?=
 =?us-ascii?Q?xihEVxEdchHs8h59TRLmrTLHB8CdpnhtrDZ27B5/0p2cXM4JC4Rgvq0fDJB3?=
 =?us-ascii?Q?jP6x79g0ZwtKfoxsGNromAxCOsbyjBrYphDQqqupHTxbQwDuthWZS4TQa8nf?=
 =?us-ascii?Q?lLC3yL7cN20xOCUdkAQqRcE/syzfS9lDn8R15LQn9jWqVvSKhqpCzHkNPL9u?=
 =?us-ascii?Q?MaxEHqKeRNmODiBztkpnq90EylrCq4yD4FVCObjnJG7ZlkyI652Fm1xAdQTg?=
 =?us-ascii?Q?r5RnqCaJChjLkI08g7nPbszwtm+SDGQIqjTVjPgpxkJbZZx0ylV/QDZSh/4a?=
 =?us-ascii?Q?q53OZtSn7WCRpq/U96wy1rx1s1YWzQ9UEteybi5EBKzDSNeREhUGhVA38lM5?=
 =?us-ascii?Q?xzQUvwAZAojGDeDa5NGb/e42xY2RRMDfinUq4gVDr2bANyFw5E+pawAzMnyb?=
 =?us-ascii?Q?uTn9z+4OjLT+9icZScdVlFTsPtsogOlhomt5SykQFc6zB/AGKHGD6Y7/M69H?=
 =?us-ascii?Q?ogQrsOopekvnBWcm2dXFhICcjxJz2cJoOBhxHkYqg+lekKu2iWOqparqVhEX?=
 =?us-ascii?Q?+1rlY8Tdp8hhRfCIVK+cNVwEqGFVRFfft2bjc45X48uYC5VPtqXCErBfVLxL?=
 =?us-ascii?Q?THRctkhPoov+pwlSQqbi0HcutyUlWv7gIRgSWgltAR2oJMLtokhyRgcV9HZB?=
 =?us-ascii?Q?qaX9A4BnmzV87EJOmB2cYuS0IDT9qWT7qoAqGg+WmenCsHxPlHwyWjR7bEAa?=
 =?us-ascii?Q?h3WchfgzqK9q/A92XD7PQnmSTUuyRtGYc7DAm30rf5nlqZWs07885YSK7Fmk?=
 =?us-ascii?Q?suAuv/rH5BoBs7DU9ncSG4R8yI33KrEAitYGQo5dn1/CjnpNHiCaGW7HKIkm?=
 =?us-ascii?Q?8MQ9lhU4H+jieRcUdAtTw8OVHu0nFctDYq9kDiA8NOc65sVfMHJZp3Wqy+Zk?=
 =?us-ascii?Q?HIsdxnULk9CFKTf7UrX9JhImGRGG11yZhlC/q3iZ/NHcZxHOUD+x71fsGKUE?=
 =?us-ascii?Q?IMmioce3Dq3zY/pn+TJqvgGlHHbtjPDvcaMaqTmC1oUM+F8TQa+4kDBr1D74?=
 =?us-ascii?Q?CWF5gh6nzm/eTneEHWoyOEg1SE6RiBRnXYMJtft3P6gQtWyD80uqwqeapSiI?=
 =?us-ascii?Q?2VcOTwRAIAU12uLuWdYmz5pHCxNP5pXkcPnSfBiYgGk5hgiNoOOSm46F/spg?=
 =?us-ascii?Q?BOsUGgIwq7Cme5zjzxwTpwGIvzZKXGua+Vhw6XHycBj3qYFg3QVVeefnF9sL?=
 =?us-ascii?Q?6g7tCCT1+V/FykV5cILhkf7qhjXG9Pzth9uvKkADSo7Gj/XckvhpJI/loxXB?=
 =?us-ascii?Q?LTYIY/ZT8eHvdERBO1V99OoB0M7uuinEYHASf1SJCVl2bOk9op5g7tofm5Kv?=
 =?us-ascii?Q?VNnxGvsjGMWTBad/LlXzpnY/te/Az2vFNeW8PeMBd3CZHasuBtfMYoCv5FXR?=
 =?us-ascii?Q?kIRq6QWYZFgR0xPiZC5k2gpKkjpMYe+eoA0CflYCdDIJkpxwlANkx9LCmQj1?=
 =?us-ascii?Q?Wm9K+xoz6YLdZwr8XK39MW4GqJ1CWT0H3VhQXX86xzewhOzpvXOKyJRxzz/w?=
 =?us-ascii?Q?2jZdYtFQPfEFIzyp/Qx3kJgZAK8W9A5HY6waHXBy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd793fe-25b7-4caa-e740-08dce05ce48a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 08:01:15.7411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WC7lFCOo2cGaXVSEQiLyr7glbHfShJMg7pYuG/fVVlRZCM53AWHVpNOJL1Wtp7476Km3bMPmqiG5co1GHJ2aAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5764

Fixed some confusing typos that were currently identified with codespell,
the details are as follows:

-in the code comments:
drivers/slimbus/messaging.c:226: transfered ==> transferred
drivers/slimbus/messaging.c:230: vlaue ==> value
drivers/slimbus/qcom-ctrl.c:127: Oder ==> Order
drivers/slimbus/slimbus.h:263: Presense ==> Presence
drivers/slimbus/slimbus.h:371: resposible ==> responsible

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/slimbus/messaging.c | 4 ++--
 drivers/slimbus/qcom-ctrl.c | 2 +-
 drivers/slimbus/slimbus.h   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index 242570a5e565..b7dd2badc9d1 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -223,11 +223,11 @@ static u16 slim_slicesize(int code)
 /**
  * slim_xfer_msg() - Transfer a value info message on slim device
  *
- * @sbdev: slim device to which this msg has to be transfered
+ * @sbdev: slim device to which this msg has to be transferred
  * @msg: value info message pointer
  * @mc: message code of the message
  *
- * Called by drivers which want to transfer a vlaue or info elements.
+ * Called by drivers which want to transfer a value or info elements.
  *
  * Return: -ETIMEDOUT: If transmission of this message timed out
  */
diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index e25f9bdd9b23..039384d85e7b 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -124,7 +124,7 @@ static void qcom_slim_queue_tx(struct qcom_slim_ctrl *ctrl, void *buf,
 
 	__iowrite32_copy(ctrl->base + tx_reg, buf, count);
 
-	/* Ensure Oder of subsequent writes */
+	/* Ensure Order of subsequent writes */
 	mb();
 }
 
diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 00a7f112574b..2067d47541f2 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -260,7 +260,7 @@ enum slim_ch_aux_bit_fmt {
  * struct slim_channel  - SLIMbus channel, used for state machine
  *
  * @id: ID of channel
- * @prrate: Presense rate of channel from Table 66 of SLIMbus 2.0 Specs
+ * @prrate: Presence rate of channel from Table 66 of SLIMbus 2.0 Specs
  * @seg_dist: segment distribution code from Table 20 of SLIMbus 2.0 Specs
  * @data_fmt: Data format of channel.
  * @aux_fmt: Aux format for this channel.
@@ -368,7 +368,7 @@ struct slim_stream_runtime {
  * @get_laddr: It is possible that controller needs to set fixed logical
  *	address table and get_laddr can be used in that case so that controller
  *	can do this assignment. Use case is when the master is on the remote
- *	processor side, who is resposible for allocating laddr.
+ *	processor side, who is responsible for allocating laddr.
  * @wakeup: This function pointer implements controller-specific procedure
  *	to wake it up from clock-pause. Framework will call this to bring
  *	the controller out of clock pause.
-- 
2.17.1


