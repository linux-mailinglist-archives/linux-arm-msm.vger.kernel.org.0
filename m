Return-Path: <linux-arm-msm+bounces-57568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E080AAB2D48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 03:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48EB91895B54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3589A1D9A5D;
	Mon, 12 May 2025 01:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VqYFZt9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1587819F42D;
	Mon, 12 May 2025 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747014221; cv=fail; b=f7W1AUdMOviG5rxJ3csUCeGZgN4PTZwfsvV5aaXpS+37hn/MMutrts2cu2TkrTKigkn/KmovIJRqBQZM/0xRtpKZbN/88/ET58ohSbKqwZVJtSAeES7RCEQcU7bkGdOwFx4/r+/GLPHBqy0bElNVOCEyc41E7KhxFHmt9kxy55U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747014221; c=relaxed/simple;
	bh=2149T4GEHH0V45rlc4l3W6V0AACg+SMbXMud2OUJaQo=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mywWK9bvRmTN+ftLgWiSTa9cfb1GB22gOsLFN8eTQKDQkEZ/TFaZthJ6EVf8ZmDO8RYtKIz5vm4tgvbIV3s7dWX3Q9zTQkr+IUmw/zKri1G5oDdPKRa1+Uy3w8ZD0uOGjTY9nF4z1+LAZZC2o2l4fEKmdZVE6Z07dvDyY47XWX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VqYFZt9i; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2rR84oBuAgJYydv5nJ7VcNzjZMJqzfdggwdmQUvAyvxFisiucOJoOUDmXKnOTbGGSJTZalYNXYj13i5wOaRCEynHkI2QcF/KtqmS0aVii+e4CIDYQzPgwIJ/DjiZAgce3DPn1+lqDFb/8+zeNg0RsdDcokvnvgkjys7Qu0T5UYtQkyvctNo6+1nFbMNpdLuk19yNgk+8dgF5g+2Q/j8j+R2gN273GukyA6Hd0STPH77i/7zhE0boysXUDEydBHhXdp2QmHdCI6J9XI+lA8hzbvtX/jPORRWbdkBwFvhpuQIHUgbUTe+sEXuFDqalX9XcERPcqAeb94VrVhn2iDrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdE/3ESDd8mGNaV3akhUHKowWuI8ktWXeK+Oj+x3hxw=;
 b=mqheVKIcPuKjjxd5ZqV9B/3ORKZVhr4CReZQTn7Q9eLNx77Sb8NFYy4Lu9pe3rUGnr4PNb2HQcVIrWJUDnh5AAwNX9SRAuAEkgPvlgJDcdR++m1LkaDgnDIMlJAfwU47WaV5OyhOWBPwYiIUabuehiHM54U9NzZ9np+tV2dJL9cxxj+qkacGWsW2fRAwlponOytxYRKI/Py/P4sRq0FL6pn8tZSTusbkAJrU16rdVSyL89abXd4YfBX7GVd9tGZnGf3dleCydOa7Y08itKsHubCEzb61085psfpIRxcQkkwT4f5fzEE/P0rLeMVAhgdmZ7RaJSgCfEuzM1jxr2j7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdE/3ESDd8mGNaV3akhUHKowWuI8ktWXeK+Oj+x3hxw=;
 b=VqYFZt9iu+Asw/e9iu+eiil8GJ6vBz2CFWrXW/6c7oGvMTSPa2sG+LN3e26cbO9LwF5mTgxfCDKe66QoxnxQfSwyt3H77qD5EhK3/LKNL2T7DIIv6If+5iE06ypAM/KGpPPF9ojrpnyLrKntS5GnaXR7OCFU2ZFV+qlA2u/DFmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6824.jpnprd01.prod.outlook.com
 (2603:1096:604:117::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 01:43:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 01:43:37 +0000
Message-ID: <87o6vyy56f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/3] ASoC: soc-core: save ID if param was set in fmt_single_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87r00uy57x.wl-kuninori.morimoto.gx@renesas.com>
References: <87r00uy57x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 May 2025 01:43:37 +0000
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e74bda6-f759-4d5f-f46b-08dd90f669f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WRn2xUjU/1inKFPUI6Fl6H92mJTdLjPTmw8/P4cjfwKefwPigE4KfKS4xIC2?=
 =?us-ascii?Q?Gt+GBKhy9wFcj5fs9gnpuXV+S+0RwLTIVVMj9gG0mtBRTDid/uPIAbLL+QX2?=
 =?us-ascii?Q?G/ksbl6JCUr46BOyVKESxIyA4CJsB8y74tenwkdOtx+JbUH2EpCcuFuBK1Ld?=
 =?us-ascii?Q?cIidnv6qcapio/Od3S2yGO46jK4OiHr6vG1mjBY0jUFPiMU6ucMuKpw0lQYb?=
 =?us-ascii?Q?aX1c0UFmWq2440+6ps3v3ooiK7hmQ9hk5eZYpBlOFnj2VlFvczPzzZ8lxu9L?=
 =?us-ascii?Q?bX7Jxzes6PeNESyDHzxTrPnilajW2oSKGLcg9dx2Yz52oW395+p1ndLibj9b?=
 =?us-ascii?Q?J30KeuM5+KePFi7BVS2zGOjUoelS8Xz+wpqL4B6SZHpy73lcn2oz8MWNATX4?=
 =?us-ascii?Q?Klhs+lBfjMRGJLyByagdu+JoIsl2tkR5zFjy2VlpCd9QAPspt5qD9pLmU6mF?=
 =?us-ascii?Q?RQdCesz49BHZLaUdLVvcUvzon02cgyRaGPi7iLxXDsY+8dc6wJv84Rmj+RmP?=
 =?us-ascii?Q?Z9oQeMzlfMAUbo9XAVe1wEHUk794/DP+KshkRZmKfj/BYapoUIJlkeNtgj0H?=
 =?us-ascii?Q?gh1blCCamtassd/mpM/R7lJK7H9rbcwme/cjAxSfcs6QijbnwvtOrom3f9xL?=
 =?us-ascii?Q?64B8MHcEeQothWT1U6icpbpUb16N8SX6hD1MVWqMeNjvPkbKouuJShGoDcdo?=
 =?us-ascii?Q?qhzUkFNYpD+bf7YPSDovV16FxLsrmcmc7L/tqoWqph1745q1ovCJYQNVw4ii?=
 =?us-ascii?Q?f1rmuL2YnmY0Vkef36caF0YGTxN1WgyJYOIy3sRLHpr9cDqCctDo+p/VqXj+?=
 =?us-ascii?Q?Mkug3gCAWBQoJswBYXnqQHaAPfHqWEokBrY+NB8DJASqd69UfL1kyVov0Ztv?=
 =?us-ascii?Q?sb7Ex/3xLIJkIqYK0KE9wyjP0YxWxP7+RCzchYF14XGTdaKuBOBXQXLxM4Av?=
 =?us-ascii?Q?W9KM3QLBxFWsLbal7EvTDGgLNQERdu8z8TQpN+018NJYBZ4n3agIYnV3bWEe?=
 =?us-ascii?Q?ea9ACcmUz1nXTVu1XNg8meBEQnI5LrLN1l/61C0HNae+iJzaOkDBiFnnNQn/?=
 =?us-ascii?Q?Arrj2rJKbqk5Ghx0gzx+I+fuD1LdXTwBX4BswfQEU8uMjdG2WnD8p5Tft+dp?=
 =?us-ascii?Q?yuZ57ERIXXDswkWraTrtIMzmMT53ZLv40/s6iOAa0gx7x+Yo/ea8Vq98C3fh?=
 =?us-ascii?Q?m6RMriB56rghEtTC9nZGWYx4N6Uwh3tyTUbw+9jpUowQRs9KY9zcgQj/PF3z?=
 =?us-ascii?Q?SJmpjp07+r+pevA5AkD9gjXGB+T1H8r0fHoid7VDalq3E5+ejj0tpkgU7eOa?=
 =?us-ascii?Q?eXnPSVT4/TzfXE7tCpNMvZQFuCPN36MdDGFimzSsTSdW7Wc2cyt0YsD3Xz3+?=
 =?us-ascii?Q?iOTsvH8Ej6NPeZip1xDk+z5b6yJFWID4CeN+vlmArtj5W+8GV+Yfm5XcrAvV?=
 =?us-ascii?Q?H/TUVP8JPx63y+dOviX5jRAV8+tJs0BT1SWcqLw7oiVaLheVnZ4P2A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SunmYfFXZLeTa/Y6IkFPZWHSdt6DZL5pDV+UqFuOJTLOrZFrsb+3M9+/cZne?=
 =?us-ascii?Q?MS+ZTyECIG8ZNuFMZwBrNH9RRxho3lLpIWA+sgbHaT/SFcIdtyRCtfXGoQ2Y?=
 =?us-ascii?Q?c6vHhww356JWIfeoq0JPvKyguBJMkBQ534f4J2KRvfsi+6c+7ICVOp2eUEke?=
 =?us-ascii?Q?3vqNGr0lxivLtDCKCvu0VEZXB0fvWZkW9JV/PkgZZWvNfEQIhnKuNbN9gAp6?=
 =?us-ascii?Q?csoxp2VQybYRYmdmY/3BI6ODN0WZH8t0nVbqsWmDJ0bwSPzdZ+L6Olz+LXMX?=
 =?us-ascii?Q?BzVozab3iTcP3dhLM6ulAXa8tz6vmr1UopEpGaEKiJlZYPTuWPikdKOlXEtq?=
 =?us-ascii?Q?rqmwElcw/Mb7DNc0hJXKiAqM9zTdp1tuP4Qw+RDvqyTAUlXS4iKjFZdn1M8S?=
 =?us-ascii?Q?COQEf5VscPWx5TgSAW3JOlWiZ8F1MXrACK24wtOYAM4K4hjCY7TYq3TXLp4o?=
 =?us-ascii?Q?6due3BMBWZiqtqv+lYUYg3lOTiteC1blK1Dksb3Jhems+K5lir573jBCX/NY?=
 =?us-ascii?Q?AA8ppp8lHQE4PQEm6V58lVB0v1fVv2nMwMfrocoSsJUBX7kcSQ17qwNrr56I?=
 =?us-ascii?Q?tO8QhCU1uKCqNY6KyNqxN5F0bhcCcayPdDM8pxX19EVLS8b3B7Riyn+JAVLJ?=
 =?us-ascii?Q?kjlz6d3vmEJGTEcznGO9mGbbPbUHgKTZ9E2yKzNCXCRvdXVsKwDDo+TEMRfB?=
 =?us-ascii?Q?Njp4EhoSCfD4p6cgrI5zo5SXX2sKaJ/Uh9pdmgABLQUeFQmxwqtQb8n2mfei?=
 =?us-ascii?Q?RvOuWFpcTqGO+VTWGWHJUk/85R4viE9oS25h0fiA1Jx/H9SslcwfU3W0BPk+?=
 =?us-ascii?Q?ada5ifonOVztEN0ODxW1ZhfyhKQAhv6+YYUwDXGtuaAqx800MRQUdK/KORGr?=
 =?us-ascii?Q?KkQvOGFipLROgxFoXlh5VNJjqLJGXTPVLMCYx8FpuTjfLrlG/dXaB5bwb3i+?=
 =?us-ascii?Q?4JBOAfWElER5Ueoyvn5FMnqJN03aCw+FCntOOQcYbdv7BgwymYJzC+T4iHOF?=
 =?us-ascii?Q?WflBRrcCaOqkJaf//4DvE3JrByjoxVzDRWlBxBdaCT4hiQqgEZGrlDKyBEpY?=
 =?us-ascii?Q?G1NM1M8HFkCylKmpzTs30Su87MBdyqj45ImvRBgXoxX/Z4W+IRQuO6fS1AbW?=
 =?us-ascii?Q?kqu18fcD3utVgJSXWpAWyLhBhy2WNamWlsLXnRizOjCbpSqn/a7ksOBuMGLa?=
 =?us-ascii?Q?tWV3UDUACCtuRK6RDVKUkdyw5oKk8PRazAEIoWQSKp8o/ikNl5L2XnSixlCp?=
 =?us-ascii?Q?kODsgIcW9guVeeZnTRmALfcaPrdnanN4bfMtQwGPuS07m1lN/amytOcZ23va?=
 =?us-ascii?Q?OeLosIU9WpsGJDUsV9m1R8r4yApMguD6UHeWXRSING7w13i/+mx2tzyfdCUl?=
 =?us-ascii?Q?RgkudZ61VJ9XehK5IHUv0HqA6TXZqxwW4UZYj0JAS48Q//36GatLGNRDzH4X?=
 =?us-ascii?Q?j+9D/gfL3norXyDsF/ZoDZsbmd88BgA29bNiZGsn19E3W1EOKpsYD8KMR7KC?=
 =?us-ascii?Q?6Wc69dZvcxaljUJ5mFCtKediOHjffn/JY4Fx/GNOLs5c2WjozqIkELuO8QJC?=
 =?us-ascii?Q?wXcOd/wgYBzsgZ1kdQBe8n2KGepEOSaS1cOjwWeUpze4l2Ka/29lrU+UKskk?=
 =?us-ascii?Q?IWx0WDDXZ/ILH5RxeexEEQE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e74bda6-f759-4d5f-f46b-08dd90f669f7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 01:43:37.1622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QR1C7tQD7oRcR2LWB7LhaWSbfQf3g7UTesgEHLXGtxI/55LnHkJXlQSDVvFzmo7Cl6H59fJTNQ2PmFvR17Y19RDEiOlflBPAZqnY6MgzEpk903Z4i4lT7iDP3Ja/1obR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6824

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


