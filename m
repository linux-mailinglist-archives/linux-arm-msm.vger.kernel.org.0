Return-Path: <linux-arm-msm+bounces-32717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0CA9893EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 11:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69A4E1C20D6E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 09:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6B313AD29;
	Sun, 29 Sep 2024 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="c2CDmIZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072.outbound.protection.outlook.com [40.107.255.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CC6219EB;
	Sun, 29 Sep 2024 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727600630; cv=fail; b=Iaik/HCbP3jgQkff/B2DT6wWkR0b8S9hLVsn4z7iar/8BpOWvPyXHikGL2aY0dbI9ak19Wx68EWzLTsjCxc5Sm9O9WD9eLCpDNdP/r2wdyOwuEZ1Rq7UurN5+dvb0EViVkNlA4EcakJNC+hcQezIMtWnj4ciNzq/GZN+DtTuVJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727600630; c=relaxed/simple;
	bh=qi2hPVnD815s5rSNSOSg2+ubhe06gK8wPhlz94A7mcY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LXa1dT62/Fo/G20ef9jNzegZccgaB+jKPauvvg/cYMRjLMSGYCSZf3to7w6lU0g6eYrXKtyzxb5NulaoyLalIevxgOlF7CZaTfvbBY4feuLT5oKN+QXN2iEn7tfct+EO9ZpSvzB0lE/cJM3j7AeYOWgohOZ7thh5gltLVs66GSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=c2CDmIZC; arc=fail smtp.client-ip=40.107.255.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuArK1D+N66ws7jgrJrrf5Pj3daSEKNVh+K+hd4UpPeV9yvxumEaYs80LygWFY5rG8DuobJb3OE/6N46mSgBwPO/jBLua4+dQeAtv+q8DEgJbWc6ZvVAOpnQENZdNjVkA0ZQ3Q0kiYXUT6MWKKfz2Xy0VJtYTVYH7jdXiTaYXP3TFmmXpyzN7XUeMq671yWLoYjLMWfrRQoNplatx0ggPWDLXkCFN1m65aYftgQk/lIcRPSxiQ0fp+oUAjYFv23qYVsFfhrBEIeNFcjnzsBcFBFxF8lmJXz18IbbKlBNAJra5K8SKevr9OeqkE22wposbmMIkYhDAejB2Edv9mJ0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+x02s53iaSINIdnIRj9anIPUf6txTWKDbrWOsppY074=;
 b=MCpx6lgcbG6+mcbJ9hqj4KUGiizrlVZdKX7a0Z9J5huNq03G0O5TG6UMC439QyU2lm8qd0bYxT0C2F5hMbBfJRT5Ye5cFWPqjNjBKZl262AGetllpbIYJLhnLrBGTY2aW/rT8DZESyqMnMzLmnO6cKfR0mHHcOk+Lbnso6ONPLTgUjWh+rSf1FG8ZZAuGuytRknni5ole8uEfYwJpJ56FS754TytNI5kWec5R4ysJNM6Iv1uE+nfsWjKgaO1lIVTXTcigOquiR+JPDAjZWKcTu7s6XsMuw3JM2UE8xYE63WJEVARDpi8zPg2UmrjMnY4tgH3jgt2YIs6xk9DpvvjdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x02s53iaSINIdnIRj9anIPUf6txTWKDbrWOsppY074=;
 b=c2CDmIZCvToRpwweSJwcXb3k6ql9bo9v2QTvyxD9APCRJuG0Ka3WC8hHJyzWfJTGkteOT2/IN0cnXv6CNxcbNZVM8nhMYY3+4j0jV0ctAwCh+xmQgaFg0YPjwCQSxbNuRfIvTD2Kdk9sA3lE7G3bEqi+DBqnDqOcaZ7EPAnST2SWpxL7qKEvwHwPVbHS3AX8HsXNUUJvE7YrdvdTltQss+x9xCsEcn/UhKlBvDsQHvZ9vO/IPY/uf59Bcr5605X4fmlasJbI9dNpzwG+VYtHLus/uIvHQojZove0kfEY2O6oliYvQo6u4ImSj9bkgZX9hV1XB4KhN4p2wDcOjH/E0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by SG2PR06MB5213.apcprd06.prod.outlook.com (2603:1096:4:1d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 09:03:45 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 09:03:45 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] bus: mhi: host: Fix typos in the comments
Date: Sun, 29 Sep 2024 17:03:34 +0800
Message-Id: <20240929090334.524543-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0121.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::8) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|SG2PR06MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 303d7b47-8ffc-47d7-a427-08dce0659f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gqWXWi6s1XZOkA/tv01V3raAFMYqICR+lw8l59sVRC/IsrIBQEUyMxIUu0lY?=
 =?us-ascii?Q?C+e6b2PBR27EVyE1jpxfdH/ciEwPQHA1o9ElkD+S5w0ibeMpIhB50v5p7S5b?=
 =?us-ascii?Q?ECWn41imH/jEzOmVKe/W0lH2SW8AvppDM29c8UAEi9DGaZYX20Jys36ucuDV?=
 =?us-ascii?Q?NNjba/NGVz+zIgGcWLmAlBUX8fQWGLbfIdNhnj9NApuru/a7uZumUga3HlDX?=
 =?us-ascii?Q?5CQrhhZMklizVwlMS8d3X3ZV+dtQOpZDxWJjS7wRZKPzdQIdOPx+0ghqxrjf?=
 =?us-ascii?Q?ukC16nEgTFKai4eiouquPwwXH/dU02hulc+qKyL0ifTBmqJWG/84Bt2GUNFg?=
 =?us-ascii?Q?blVqzIU5d5/8ugNw0VH7j9WTm1kJTTc56i7COzz8FPi2C4FqQx/Z8xtBfgYW?=
 =?us-ascii?Q?uAphGf06ZWIKF87I1ucPlUi4vDkstA5matgzJd1bt5kMcJXmwgFRgj30CnqG?=
 =?us-ascii?Q?fs4ib41SVp1Ky2uhA+qfVhIILKbivbQWQHhi8KLYL9ZwCq7XiutG614LRReM?=
 =?us-ascii?Q?pG7ao402x/Tw7W6Wg24vkA28yZ94gmxaNzGQypdFykTyq1xEg1X2t1+JClmo?=
 =?us-ascii?Q?4y0DexF7IEwlJa8VA/wbIwfX7XVpR007tNP1wcsRa0VaTlByXAmC0/vYZHZ8?=
 =?us-ascii?Q?L2ft9YBmBiupr86snnkPlxRovaNe2fIvQqSlOHG3MuDAXeMb27JA7Yoae/Bs?=
 =?us-ascii?Q?Zx79FBBcDM+EEwOhXnjvS//iTbWQHRFbXRwBmMeftBZN0yFXw3rTLbhXP5KL?=
 =?us-ascii?Q?gyoIOt9SsUT4PNvQgK3cExHeypum9ILugOJ+aCa9IY6vmQRHWmXQerm/kWsf?=
 =?us-ascii?Q?Rt9Kk5BjxQ48XlOSrKVQ1Be2bP4SZmCEvMYjaL3DfCZAbidCPB5NXcHsvx0V?=
 =?us-ascii?Q?c6JAbMBmmXFyKxk8okU8aQ0iFsnt60UFS89KU7uc5StebF4MBitR4/M2NryP?=
 =?us-ascii?Q?btWbdewoYtYigbV2ioKSwBKN1y7buCy4XrPNL7iJ6aqej1Yya5U+B2HFVevH?=
 =?us-ascii?Q?S5xWIEldybr5dM13hPnEP0t8PmcorYD9UrrbfEJwqknLL7DMM6WEXE9myZG/?=
 =?us-ascii?Q?lHAmmMYyxdsAgbdbC0cL2xtCZd4Jk4JrD/oc8nZf8tAuDDvZXFEuHzAyZdUE?=
 =?us-ascii?Q?AHYOQzk0y9839+iGIY+6CfGKQAejho2y4uLcTS4BPvoWtXBT621flfNYXm0S?=
 =?us-ascii?Q?8oz0OwUyqjLPa1po+G0LMr+jtmgqJszqPwVmsgSaqXu1RtBOBzD4Ju4RItx/?=
 =?us-ascii?Q?o/nqwLxrvavW/Hdz/PIwO7N3TbmpRmSod0D/lX+VxBcjm94/qGF2ie0QAvKK?=
 =?us-ascii?Q?g9UJRFakIgJ4nDKMl23rgQO0uRR0rtY+HjixompUA5XWyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zZ2FoFuhZ2O4hyrTCCnjkEZv7x+FxzDXPSbh6DybdEZJ8VXzAGsiYiPfhw1x?=
 =?us-ascii?Q?8oqxqmnyJzbT794nGhaZgTUG/cOukuppMkqEDCKTNS0HpXOqWwPPdpsu0bzv?=
 =?us-ascii?Q?Bd+OwbiPmSVVxjN2M6Omm6TyPY6DSPr9YmnOjrblviXrVgNqEAw9N5HQUiTm?=
 =?us-ascii?Q?XqUBd18z/6YrUHTCORSSeCYDPmmS4NHZKAueEmvLlEjQ5QbJ4oTqPTzoF8R5?=
 =?us-ascii?Q?PTNjE2QGrPAQQ5cvbN+GTi/q7LhYx1UBrg+UyVtqn4caL+9/fgYhP4eXIp/+?=
 =?us-ascii?Q?FKCdeGiVNlCKIs6RIMSAVNX14JU/JbwJ2gr9ihj6dbOq/SSvp1z8s8oWrHzr?=
 =?us-ascii?Q?aLVMiTZD1qXXh6rMBXril9FgWifEpOKJYPkkmLOfslwyrUKAHiBO88CUT/4o?=
 =?us-ascii?Q?dr0qSIqV/3plEjpYW62LwJhKAA7fFAE03j/9Ip0NgNJJh/gkmtyFHsEQNENc?=
 =?us-ascii?Q?uFpxYhTKxWHS4MZ/Fb8GTK5ALSwcadtMyD3rRjKqG1FaY1ospEFLuesIYtBf?=
 =?us-ascii?Q?IL0ALo+RGymJ4D7XVEqEAAnqq9QhNYNLT+gV6JRTE1iDHQYX9JAd6IRjBEKT?=
 =?us-ascii?Q?LlDccDgNLIMiyfI+tQfDAwYvue+fud4OIsVRAogdrL4ZJp7tkvZ6FJMGkYrU?=
 =?us-ascii?Q?mi+AIYVGqcxibFAZ+j4KYRiA66MocqqvCw3haJh8VAUv64m+laJIWdM5lcL9?=
 =?us-ascii?Q?YjVQd9GjySX8eKxKCKAyv1TQydygUATEGZZekbGBm+VlvCAXo+ctGly5nmwm?=
 =?us-ascii?Q?njWra+dmMK0eFU3aArzPWAexlruSDwUk8H+8VJ8238mJuDwME+xrpzrVrwPC?=
 =?us-ascii?Q?wfHPj5Z4DyXFsRAUN6Pvn57IkUrUrpMyMRqIhXflZn1hSZOZUe6KxkwuXGLF?=
 =?us-ascii?Q?MrjphMzrnB76HDdLTNtxSFPnGMQV2Vgi5E8h6guwbZyhC6KPht+RxHAzrQOF?=
 =?us-ascii?Q?OrpOVq33VLj7tLo0/wNZKyZ8CKbdwoFgA+gPOBPv1v+Y6n7dYNL728xq3TTu?=
 =?us-ascii?Q?U2eaF0kI5bNb4hE1VUVAyRDuX1GOc/GALck5rgLjnnHTX9nupG7faBuUtjQ0?=
 =?us-ascii?Q?CozfMfTF7O6C7AtkLduKhPbPoBDlmEcJ6cD7H05NOCsSDfLj2bP4QpvX6uk6?=
 =?us-ascii?Q?Ivt65iyix+Fm82eMjxHaORuhS/MxmpqrSKCkWGHx5oM+iYRoCpRppWXyxeLb?=
 =?us-ascii?Q?AmJeEw6ozd/7ZPaKPQachIoAysvFkRTPoOay78PepzWZLoOBtx/Xb4BsxPEE?=
 =?us-ascii?Q?gEAg6rXUdsmvkkG9iNohA5chg68iXFlYQ3TaRtO4bSdBp5Sbu/uAm3mhXSEB?=
 =?us-ascii?Q?9gzEyRTzpNpx30TDm8azrxFW4N0KlT/mCDkw29yr2IF9NVpGYyEWNYCER8Rk?=
 =?us-ascii?Q?zhzDmTcuHWJLnWgIw4nAn+iD5KxdlVpADyB2BCFB+TB3fbn3TIplYDGk/9W9?=
 =?us-ascii?Q?B6PefUBHEkTuFefc5AZpXRbnNa/gelzPOkFLr/NZx5slUUpYNXVZmpDiawC2?=
 =?us-ascii?Q?IT4p1XSRaD7z90+sGPzN2Ihir/4jbOy2+H5JIyNUSSOR8wSmi1RDEDk/by9e?=
 =?us-ascii?Q?lvO9zNaMRYBQhCOEuBAl1ahHVPLIUlc/EZcvnoK7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303d7b47-8ffc-47d7-a427-08dce0659f71
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 09:03:45.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MZMBZmY0oTxz25zfX0UExj0RgBIHq4zoQYO47wlQFgjlA8EZi7Pqz26LRApuyzTeokX/GPqW72RFplGimDpuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5213

Correctly spelled comments make it easier for the reader to understand
the code.

Fix typos:
'Normaly' ==> 'Normally',
'gurantee' ==> 'guarantee',
'guranteed' ==> 'guaranteed'.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/bus/mhi/host/boot.c     | 4 ++--
 drivers/bus/mhi/host/internal.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index dedd29ca8db3..e8c92972f9df 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -82,9 +82,9 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 	 * other cores to shutdown while we're collecting RDDM buffer. After
 	 * returning from this function, we expect the device to reset.
 	 *
-	 * Normaly, we read/write pm_state only after grabbing the
+	 * Normally, we read/write pm_state only after grabbing the
 	 * pm_lock, since we're in a panic, skipping it. Also there is no
-	 * gurantee that this state change would take effect since
+	 * guarantee that this state change would take effect since
 	 * we're setting it w/o grabbing pm_lock
 	 */
 	mhi_cntrl->pm_state = MHI_PM_LD_ERR_FATAL_DETECT;
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index d057e877932e..3134f111be35 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -255,7 +255,7 @@ struct mhi_chan {
 	/*
 	 * Important: When consuming, increment tre_ring first and when
 	 * releasing, decrement buf_ring first. If tre_ring has space, buf_ring
-	 * is guranteed to have space so we do not need to check both rings.
+	 * is guaranteed to have space so we do not need to check both rings.
 	 */
 	struct mhi_ring buf_ring;
 	struct mhi_ring tre_ring;
-- 
2.34.1


