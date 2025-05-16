Return-Path: <linux-arm-msm+bounces-58157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5DAB934B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 02:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66D1F4E735B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 00:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880298F5E;
	Fri, 16 May 2025 00:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AYaS2jCw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6BC4C91;
	Fri, 16 May 2025 00:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747356411; cv=fail; b=QmvxKobuqrGDTDlmixHb9IM3tp2eXHj+kByVGNjdhgHcxcwHrNcWDag/qfyzZDbi8DjMasXfrwLKo0AVcfkU/A8pc88dcP7BqYf/6qQLXdNFrEjrcKahKzokbZbtQYqBgbVqrpxp7rdA6IUJBQOd4cU1XPsZbB/X3gNPGnQ3zWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747356411; c=relaxed/simple;
	bh=2149T4GEHH0V45rlc4l3W6V0AACg+SMbXMud2OUJaQo=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=h1uovK8Blod8ArZTaZpZ45DXlgI/VJBNxFskcsy0oDWsvV0g7wxVP974Aa6gqcVk6VtfDj5S3BqPh71RP0aT+jdGv65mA+Sa5+2bejf5y5MFctewxByT9a0jXi2FdSTngom4eM/kJbcPEu0O8JFjb+XNn+wMuHbXojCNL1c1zfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AYaS2jCw; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYiFssfasn9bi4bHt2/t8cMu30bQDLLf5NHMB46U8F59OLnmM+aX0ojMA3mhsjHwkLHwvaYZ0Nqm5F+Y1ya/+VEKpZhYRUT3bLKQqd/FVc++43nBBOq5iY3/byjeheaAbzhjR2+kPsuE2Q9oHftWw2mr92qM9XvRAHkpaee9WA7nyid7teAOZcGrqdyGg+sho2B5SOk+qmgbQDeTa0hB9ot0/NCenfcwW6J/1gaXYpwQpSkIwheSdk0a3+XhxhE5MHPbpFilgjbxP3BzWe0hBS71EbQ2E2vqnVrV9oE4rNOKqgUqaSb+vER2o8JrPwRoRgrggoC/N7eB8EC9vkpADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdE/3ESDd8mGNaV3akhUHKowWuI8ktWXeK+Oj+x3hxw=;
 b=PYLHR800zoGMj7DlNsGl8u9RSSFCXKWVSbpswlBnLbliuJFg59NpyW8fCuzOhLKGZs8bNYMrUdogdSSnnBTbpLyZp9H3BopiP5dIcyZEt7mF7IG7lID4t1aG9894dzvybZYE6xp8GsdemkV+EBtWSa7jSHTbTTsvCNFSd3n1RWeQxvVCRYO9LvlAYPwIASQQ4ZCRpxZuLL8SosgzGUhkAS3lsyQSlW6Iufk9niN4e4Q/wnOGf+Ed1kJHEQt+qb922QGZwpsagrqA9GhrYp+Ap/O/sUjV8dcKZzDw/KwwRyvqLU8U3rdl8T2ttE11q8Nk69ccS9Bkf7UKa6FyhkKN8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdE/3ESDd8mGNaV3akhUHKowWuI8ktWXeK+Oj+x3hxw=;
 b=AYaS2jCwDSxk5kKT5f4G6vbhWihDkGAM26RRBis5vFiYA71m6f+8Z/bNr/ArIYzgpSOYR9jNDwX1dgJ/k2kSiQsknDnx9seMvbZhwpNcKPVVggYVzv2lKrGTNiz3+dcr3xuclLHu3Z560GCM0lHdbdTgvTpiLNao+bLLdjf+228=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10044.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 00:46:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 00:46:47 +0000
Message-ID: <878qmxtma1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/3] ASoC: soc-core: save ID if param was set in fmt_single_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87bjrttmbe.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjrttmbe.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 16 May 2025 00:46:46 +0000
X-ClientProxiedBy: TYAPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10044:EE_
X-MS-Office365-Filtering-Correlation-Id: 294076b1-0a40-4f12-d8ba-08dd94132314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OywSSxcktWP3Psz50P7/EL+JGZqZNZMDg4Fy5wgFJsDHQJ4qSR7vq7/ZiA21?=
 =?us-ascii?Q?/AWFdOSAV0RT6kPFGcb8omdZnDrsrzLgOlSpuNRLetN2IU9VlvKOgH/8zQhY?=
 =?us-ascii?Q?TZozGybbMsW3CS71RgylqGd64z2t1kP6XKlG0X5UXK1Qe3fhgJutCODkJMKy?=
 =?us-ascii?Q?jvZYwB2OCSHTbn32yA5PfC/VC09pFRZvUn41rPDIizM6j0Urgu1jMjg8U9HQ?=
 =?us-ascii?Q?ifef+ggGCqwbgLJSELQWtDQ0sHf+m/Irii5t3f9+TI3BNs91E/o4VhEBXruQ?=
 =?us-ascii?Q?fYhF5f/7cijJibLLupIrWNmh43i0R1wgMPh2/OF4JBPXDBIYDxtbYYeox3/4?=
 =?us-ascii?Q?nFoxIVk+a3CSbHUj8T9PUaHHLnx3NUcPaVw02JKO8ChCyophQ2GdExUv6BZa?=
 =?us-ascii?Q?HVkMbgGqkTjQZREwjAfsFy8WJ4GmVs5PgxPOtfeDzr2MaHWt0QIO10ER7eeF?=
 =?us-ascii?Q?zIQR4qESt97adM2dAvZlL/R94dWFhUpoeOcc+eZLK0lIhBP1d2UCDCddv+gO?=
 =?us-ascii?Q?sY4AhT4qXV5kM1jXm05JjCGUhdfzk+am1xNUADkwVFmvc2NP8ggzQ3ZACwTB?=
 =?us-ascii?Q?+W9KVAyBc2Eo47F2oJD0wNOkUyJfY4fcJ4DW7KkHubvbl0Jf+p/Em0GoPjlp?=
 =?us-ascii?Q?QwKMQ19gJizUist+xDmRKUikSuXAh2TyC1ZFP+NvmwamOWqoASKfrAydECD/?=
 =?us-ascii?Q?UBLhR5Stq7Gbcu2PikksvJx72Egh+wx6bikPVpvLXzaZnRP2ljXKfSmKSwHX?=
 =?us-ascii?Q?0QY7dR+wMiDa5H8FvXIVwgnlx8+A5jZlucChbCfEYZaoQ40RaRix4cfkXFGZ?=
 =?us-ascii?Q?RTT5k4DvplAuj0oGpvNPRV1LWhYgY1U1o4ZdBaR26sSvjQNgQBabqhGhuKTZ?=
 =?us-ascii?Q?nCmim4mAutVQEuzfoGIQ1iKHo+LeYsBovR8lodEojOfr7JFAufW3bVn/0B05?=
 =?us-ascii?Q?uDjrT+T/EpHzctF0NDSyASVc0v9zyFegKh1/UcB9trzyQGhyWj6yQ5oaWjqB?=
 =?us-ascii?Q?W/4dUTrHcJQAyBPeuPEKNZY4ZemqlHtVAK5sVim3pGq7MhBiwCAbuZUxjWa0?=
 =?us-ascii?Q?PhwiUMZMybDVutWnn4BV3TpI1XQaFdcH97C9uUvFRErP0CA6I5RkmnPP3J4c?=
 =?us-ascii?Q?ZeImVLCVsySXnhT3mkbiTEH2rjDMuuEyygomrL7f0Nz5wNmeN1894L6zZlSn?=
 =?us-ascii?Q?nXPhv4JB3ri+scNqgngfzuu2THKAG1bHJR6GSRpgFvHHoh053K66qAh1ag8R?=
 =?us-ascii?Q?AkmlWw720X5TIscpBc+hvigKrnqIVFcir311yldTzp7id9wyXwbaCbCPAbw8?=
 =?us-ascii?Q?3dBJUgUQRFnaGcqPoN6HXKrCyUNead7SwXABoOZjeaynfy6ucxzxMYu+P663?=
 =?us-ascii?Q?lmRl42Lzf+1BrZOxdbA0S5EjvprlDUp1sySHzp/0Y6pLBV6ZmJrTr6p5k02o?=
 =?us-ascii?Q?AkBqPG+IEF2Haer9Faej3Q5cyIXg1j3OBZXWDRlwG93fsGSlBZyxAA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RGxCjaiutOTqhTPkvu7cJikNmyA6M/U9LqbrAZztpbcDJKoMBrtb6YiSR8DQ?=
 =?us-ascii?Q?20Fz2MwYzVDbDsIkH83GqoOrdhh+UG8Da4wq32zI5b53egmjA240uYjO5gCu?=
 =?us-ascii?Q?goYcNJENEdabt5ANTvCVL+zrQvX/8JRN2EBileYtuktGwdu7zF02YfHh8S2W?=
 =?us-ascii?Q?/PG1rZEhkp0OzPCeuOfmsVGG3HP3PtIY7wr0hHNVR7uFdKppSioPNa8h4o3Z?=
 =?us-ascii?Q?oQb6FaLYemt0g/VAtuCLqEgv3u2E3HqKYCdLrYJpRlAN8W1gWDuxdnBrBhhp?=
 =?us-ascii?Q?4pwO7hGgLww6lAV/tcY1uymHJRWH7gvfIXC5W/xfKyyCHCKGF8miT54zgI6M?=
 =?us-ascii?Q?ABo+q15HfM3g37C8TggOoHHBynSdxtorHi91s0EjDpodAq26UBV6to4EVrzm?=
 =?us-ascii?Q?cLvqq48EmW1UXpl5WyJNIVNMIymqe+ZLlxBm6gNWvBFJmztOIrqMBeS2ZVkc?=
 =?us-ascii?Q?oaZfjqhQqciWDiUgBiSb3O/fV44aTRSjOM9Cpa+nAI6BPkZTrNY0X1fazY2m?=
 =?us-ascii?Q?NrwKQSCQNDTuWt9zR6osInw2MN4saMIWWbL2DaAhAXVr0EAYiUCVvGha6TkF?=
 =?us-ascii?Q?2NaisXxeDs4tvpCJO9fyQ12v5z/IPCjxkReXap+MA7wtpCow66YZDaxdXT5o?=
 =?us-ascii?Q?dMD8Z7zrEE8p765BdPHG+sj04y3o6BTXjdZ4F+eQv0uywh9vWUiYrX85mbhy?=
 =?us-ascii?Q?wqe8H6flg1Xhzhf15A2azLgUq3ax4+Z/qvY5T0EZV3M9r5HrFY8YOvXFHomG?=
 =?us-ascii?Q?3VUQ4yevpsEP0okHGgQEIwSgU4ichQCvF7//BoqTtn0ctgwaX3/BjDgT2NU1?=
 =?us-ascii?Q?tXaZR/XvZiIJBN9nbD/YZhrkwMr4wUJbkbLvgoluxZp4ztBUEaBNoxwXwINO?=
 =?us-ascii?Q?NEjEJfRK3MKs30Lwm2jf+i0k3pNEgOtVoKDJ8WA5ysyHKBBXeuhjwupeOwYC?=
 =?us-ascii?Q?NpWrLnJaSfAWrtL41w4pdryjo1KM1vJs0F2Lex889OMwzOpS8EsxfcLGHLkf?=
 =?us-ascii?Q?n199k0DCnnsJs21qTG3nb+Gdxduzm90A1Jr0Mljnf8Og2j8DbdF3FfH8xlp6?=
 =?us-ascii?Q?Ff/HaM02cARKwcAVNWOFTWGLmCsWTjckhNrJPKS4jiJR7HNFXc4HILLtBeK0?=
 =?us-ascii?Q?buYgIPZkC4yrMGMx407P3R6JxBxkjq+reSePRj8udzO+SDI2w0VCoZrgh4H8?=
 =?us-ascii?Q?by7i9lcAW7fNgzizhwJ1Xv46NcvB6eMC1qw6LSINURQXZmibw4JJCZa4xB1m?=
 =?us-ascii?Q?GYsaXgtdETa0okUg/QEi49iA3lDbdyvwBo9I5nfH1Wy/O0kxrTl5/40wCTOo?=
 =?us-ascii?Q?FTnw5Cj/VTV4qhDwqPfqNlobxoNze/IwQGwWDaBkeaHK8eStKEUgJom0Y2qV?=
 =?us-ascii?Q?sFlWJ1SsjP4RRIFDCqcBHM3/rtphWsUMrdV2n0rtKmHSywuAB/CDbfIK1fo4?=
 =?us-ascii?Q?DzmFGZx0PtceiobExwR6L5hbcK7J/C7dfsDE9exNyWZqHbtt8rNz6nuw2J7n?=
 =?us-ascii?Q?y4jNys/kWFoDnCoD7Fx26mj6g4vJN4imYWY+z11wam9yG/C+Jp61GcuS7iAz?=
 =?us-ascii?Q?OySnfJTJS9hmLa0g7NFs8d1HIPfmAAzcKmf2fKUN3xY1QpLd+Iemqp6OyblL?=
 =?us-ascii?Q?WbWJ9UutF9g4waACQJI0pR8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294076b1-0a40-4f12-d8ba-08dd94132314
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 00:46:47.1757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOcotITKPm5ZpVOiUwyuYSqa9lh56tUd0jYtRj673KixapNhssG8/gexE6xN+bY6AKzruINrw5VtSGDoxNEdGuGiUQ9DB4t+N0fcM+N8wYRCh8LDHQmSuhrwba0KbYxC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10044

fmt_single_name() requests "ind *id" and not allow NULL for it.
But sometimes we don't need it. Allow NULL.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ab615ec113d22..80569209ce051 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2604,6 +2604,7 @@ static char *fmt_single_name(struct device *dev, int *id)
 	const char *devname = dev_name(dev);
 	char *found, *name;
 	unsigned int id1, id2;
+	int __id;
 
 	if (devname == NULL)
 		return NULL;
@@ -2616,10 +2617,10 @@ static char *fmt_single_name(struct device *dev, int *id)
 	found = strstr(name, dev->driver->name);
 	if (found) {
 		/* get ID */
-		if (sscanf(&found[strlen(dev->driver->name)], ".%d", id) == 1) {
+		if (sscanf(&found[strlen(dev->driver->name)], ".%d", &__id) == 1) {
 
 			/* discard ID from name if ID == -1 */
-			if (*id == -1)
+			if (__id == -1)
 				found[strlen(dev->driver->name)] = '\0';
 		}
 
@@ -2627,16 +2628,19 @@ static char *fmt_single_name(struct device *dev, int *id)
 	} else if (sscanf(name, "%x-%x", &id1, &id2) == 2) {
 
 		/* create unique ID number from I2C addr and bus */
-		*id = ((id1 & 0xffff) << 16) + id2;
+		__id = ((id1 & 0xffff) << 16) + id2;
 
 		devm_kfree(dev, name);
 
 		/* sanitize component name for DAI link creation */
 		name = devm_kasprintf(dev, GFP_KERNEL, "%s.%s", dev->driver->name, devname);
 	} else {
-		*id = 0;
+		__id = 0;
 	}
 
+	if (id)
+		*id = __id;
+
 	return name;
 }
 
-- 
2.43.0


