Return-Path: <linux-arm-msm+bounces-57569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C22DCAB2D49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 03:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 396143A93A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BA21E2307;
	Mon, 12 May 2025 01:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RHYdr0Ra"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289EB19F42D;
	Mon, 12 May 2025 01:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747014225; cv=fail; b=Ae//54VhLM30GCw98xw5C0AWpesnbVbh9KF5RzGx8DIuo20iwEWH0/ZiUKlu/64JIds7UKlrpZsdOznfK2+eRWeSBWH03uPyLYQGNKWJSxFl1AZDW5hWL9tanh9bHjpKSboJikeFk2pv6CDMpYP2yXFYNv7wb87K/KqegUgt8G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747014225; c=relaxed/simple;
	bh=ZORfbgtL28zWAsWqPJ8CayE7dMYJtSqaVhfHY+ulevk=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=A4RYeFQF8CqhxGriHwnXtHD4uroWXqaoNJslZpZ0M5y7xLl/Li16rk7ZDZiDPEeYX+GETidzqNpdl0NYNDQ0QSIbT7L32h5udyZVPkZsCa+6xE1Od3iYKXj0AB0Gd4zOGTdrXlJeIMOUfzPzAOnqMzkIPt+sFj8O6O02hjmyT6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RHYdr0Ra; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvDIxQhpGfV63zEHluH4Tsx9tySi6lmllK+O9jqNOdNczoN4QvR8S8bIIJYSJL/9RY5S4qwHYsD3e8SEdz4QAsD39YiMjMDpAKF4bwlwpocY4yyNkI0q9zjY2KWWnh8JLf4WXTK9l9Sgyjz51znkVexWteCC63ABE87GRMncP9nADfywrpB+FFn6+aGLKVMe1BBCmPafbFdLZ7jW6090p4RxnG4KVFPwSbOsgRzhDb+C9r11RGGICAs21vrUKa3+gqzju2c+xpLpqPiNh0OiAK4LeG9/3KSIgoOV5HJ8B9Xjxi41N8pXNqz9za5jYwmB0agRfdr1rHKGYaTxu/wjgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+rhdbHwlBSNavPGZWUkZlACZbK8meu9lWj+oCBPckI=;
 b=ZxxoXBpw4CXB3iXxVAQ8rRIsPu1X36R1QuckaIyfNzS5U+WuXeVLDRJe5sOqsxvTQYlHcTZOv+hFMtL0zMDF/aP0rAwSSgHSpyScyol4LokH6lp/ldiaitybbtM6s275AYpnJS9aCZz0o4Kazhw0xRW2m4wpJPFtkN9dL+qYk33+bwv8lB0GMTctvNWhPtOH7PnBgphUZBa6hcDxO2RSYRH9ebO0lU5bkh8zY6t4GwY86TSBZvxMPV0GEC9bbdVnNi50y6iL1NVid2kSPxNOhye7vbr46pvTPJobnWGj5o1rxMIBJEYyl+9SgzaMaphsNHjZX7XNiujWLL5c2AA9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+rhdbHwlBSNavPGZWUkZlACZbK8meu9lWj+oCBPckI=;
 b=RHYdr0Ra6VJ1Z2OXRvg7mFE0MgRRkZirH9stIAdRaMg6ojn5PGPYOekojxknR7b1d4NcyQaQTxdgEcoS8M3pP1dKHtlBW7hTN7BqxtzQSynx8TtymBemcH+pzQAFxs9zqlQlNXdM0KCQyX5qgWr+0lzzHs0Ny1Yvi8Q9vpNcxMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6824.jpnprd01.prod.outlook.com
 (2603:1096:604:117::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 01:43:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 01:43:42 +0000
Message-ID: <87msbiy56a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/3] ASoC: remove component->id
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
Date: Mon, 12 May 2025 01:43:41 +0000
X-ClientProxiedBy: TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 0398b599-1f99-4448-983f-08dd90f66ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?edmgllEM54LeoX2wumtjrfPkCP+pDN0x8H88V9YYNPVNESrzQWSF9JF8HzZT?=
 =?us-ascii?Q?A7n7Xf841QhfMQ5xBQLAaSFG9MTAPlRsndhS4a0V8BOtYzGMjRT4HAO85Dli?=
 =?us-ascii?Q?qHSl+BLKXoLN4pq764hvo2+uD5LZnPv/AOTCqdA7/Y2/5C6+gS7dQmLJSjHv?=
 =?us-ascii?Q?ChUwZF/zw7lLz8ik7qky52dmfqt/9RHnxBJi473BaPZWgztpqrTGIUmeN5Ni?=
 =?us-ascii?Q?Z7LI8bJKXzbbm4r9aLiXy8KrZCDWk0zOIOsquz5tFCa/i/Dh+LRXIdX2fw84?=
 =?us-ascii?Q?prAbSmPealSOZEIKmjB2qvfkhpgcm9AvMvu3FaOQu+CmLxSHh1mmlfx852gN?=
 =?us-ascii?Q?nTt6qAEGwTOnzoxRBpb6D58UhBNazGKC6DyeeUTYF1lZqgjsgk0QzR51rWzQ?=
 =?us-ascii?Q?i2uvh77tJ16yjxQ8RdLe/lBltAWpCEt2dm6SJujpErJ4oUioFUG4Bs1MDnzR?=
 =?us-ascii?Q?D4nIoFDSk0ZkkgkUjLIKGwTfwNlT5Jizih3V2U5pY5bBylZ2pRfaWQQT677C?=
 =?us-ascii?Q?+viHV8B7jCZnZZmrCHdRbCbASdIzhJo2vtHRllJRuvRIG50w1gktEbryXE1p?=
 =?us-ascii?Q?n4ikAbaJJrm6UNj0RvYRuTu7qAugdhYidPP953p23bpvBE56bTujLE79PKDG?=
 =?us-ascii?Q?OaifVdnVG3jtyTpt4WXDff/tRHEPZBY15tKqGySqukTbcHn+k25Qn9o29YDj?=
 =?us-ascii?Q?As3z6r2biOJSmNphuKaskQ9PPvJsHVTW4motLLnwDjNB3nL9zAXV2mRU0w1/?=
 =?us-ascii?Q?yxtbFhyLUhr9Ur6wgsrsUw0l93+1yvdP1Cuk/rjiZJrRq4D3NnWCfiqT6SCn?=
 =?us-ascii?Q?l14iKblRBC8v+7EwyTdO7ykXXw57d6TAMFG5AR27ZvjbUiyYWW7Ia1jHCAHL?=
 =?us-ascii?Q?6VAyslvA8f+/ThOgtVkfZ9nQT6yDPXO78zeygBfPQSsgaVXQ6swr+Qf+DLb+?=
 =?us-ascii?Q?1O/6cgNwD/r5fjIMZ731bjopJ1npaI3TEIGZG7brRibay2JKqUhffvXjExXu?=
 =?us-ascii?Q?6oppPg8y5979++vu0vohALxfOzSJ0oCB/yScm2C9hsXWi8f9MAeIW9VhCp/M?=
 =?us-ascii?Q?lHdBG52sXemlD1YRZIB5wsPUZgx9NILoDkPjsog3iRlTRhcLHZhBsGxewUAK?=
 =?us-ascii?Q?hVJw0MTUZUqy1fYxuUCtd87+qKnLoUfZoOJrZdgMuMdKfBVUNIMWg4/Rm4Dd?=
 =?us-ascii?Q?OBD4GBDLacnNCfDWFAsqXwC0hRkuWpkmnotP/gmDC84mmNLLBtSPFe1S1jEN?=
 =?us-ascii?Q?9y5aVdcx/M6d0OXLn3Ix17dCHmPH+U3NfUAS+CHic/S32y7cxryXv1TpyKAl?=
 =?us-ascii?Q?xIzeKWYUDJobgg2ouPxWogZTjBbXuEbzVTbzRtdQZ5mTCmKiyJ1rXj21dt1I?=
 =?us-ascii?Q?0zruAoOGaQT6WmdOrosNtWz9/1jp4taGcgVhkhpCEzO4lAofk33MnQXNlrNh?=
 =?us-ascii?Q?l14VSuTXYck0kSprrW3dT3q7sv0JRBeDr9FJRoNSebp0YLSrBdo6Bw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nN2+uIeJZwatwv50R4pmwAHz83N6Iapwvo+6cEaPxBQ6eiA89G/MZotYryh2?=
 =?us-ascii?Q?Q0Na4mMcicHXFS2XaFk5/7iTIAgPvDmhZ+t1rzQdE51Or2g4UTyW6Qn0GuVw?=
 =?us-ascii?Q?7PiwpBhI56zbpGNWm+DjMpPkMg7Z/K52rqz2DibLqVrS/cO7RfU/z3orj3od?=
 =?us-ascii?Q?eXn7a4SSkeaNHmmeoynGwwJEBq82USxhEN/beJl5TVk1WZH2/rpRvY4z2Q0s?=
 =?us-ascii?Q?DItZlqViIZ6aojBCgDrgSJeK4FYrrsq8ege8wW60RNE9RaVhkOgwLc/jK0Ah?=
 =?us-ascii?Q?0z/rtasXsEcRzidz4TejyKzg47R2MNroj84UaBAXrjQoVANwiN+uOkDMbbW3?=
 =?us-ascii?Q?tP6l6xy3IZ/UuzBtvaVTX2DVWlqMjEhzg8F9rqa/n4rHbrhscJqk8yAz8FlB?=
 =?us-ascii?Q?FX0QrBeX5R0BnTe6jw9lMrlmG0/p2+GvcHf1DYMcKVjjdpxKXZQAObPc3gK5?=
 =?us-ascii?Q?eZBzTiTRWaKj5opEOoqB9JiJ42iXTwt5dW0dAAe9yQxItLHi1rAnm0li+wZz?=
 =?us-ascii?Q?5NZJa4uZHJE5ZA8zj3nszhjMiHFm8z3HhrvB+zroZ/NuFuF5P4SwUhi8sxvE?=
 =?us-ascii?Q?mBIowIf4mCciVt1o6PJ87so25m0FJzEYivpk5agMVWazD1sN7u/ZcYS/hWSY?=
 =?us-ascii?Q?u5JHjCZccTtHqfs3B0HweRg2n5RdhCSgceQNXCCH2mh3yQyx3zCSBo5AXxeM?=
 =?us-ascii?Q?BPJDI2JMPVDD3nhwdlhyQw55xqDVC7CW4v32aVdAiQJ+ae91nesecSxjySY+?=
 =?us-ascii?Q?izLMbyi9bP9FgKdEYbPFQfNG6KM/1qZ+oRXFUm0cICXuUsD34AhYqoVkPP4G?=
 =?us-ascii?Q?EC3QLXRD2dG/RTkvI8Wr+4gUtptBAqL2vPCG+/S+MUxtsOD4+kW7aOFU9rIe?=
 =?us-ascii?Q?u2DFhiaz3/Lq0erv7w+yA3CAChMYY2uVP6trgPOeWgxh94gRFNrpa85N4l8L?=
 =?us-ascii?Q?Kt1KIkCpeI3XCswqKVw28SJ5qPe/G4AfdFV8+0Q45B6njo2gx9AjBlU0CMWS?=
 =?us-ascii?Q?EOacPIJz3k57WLkKCejZdnkistJ/YyGb05l5f9cea/YdYijlr3B0HiPCkLwE?=
 =?us-ascii?Q?vTaSuvAz6A1Xvkvo3HS23fMb2MAtbTfU0veAExoUGUnU1vhWMQewQP0ZYgJO?=
 =?us-ascii?Q?wRg0Y0ds/CERVsqO+7THRujov5C82rystuxWeha3psbTzFMlukgQLNw8huSl?=
 =?us-ascii?Q?gchZrUSNvgIxYSMuisQWGZ7gLe+Iqme1FmddFH2+CFSkIY421HyZ04vf/f6E?=
 =?us-ascii?Q?e7IdFs5wu1HZTWWkH0cbLa1L7iMNzm68eKF6PoxA2dfv/aE/Hm/2maN2a/9T?=
 =?us-ascii?Q?95N6TVBUd/hFCXjOjLXUdjG0q/5rQj5bHnmzJGxlqVaNSENSn8A4g5bmDZSn?=
 =?us-ascii?Q?NDVUsOuJ15nWXgMISs1juAUYW1Q2mRoUvaDli+uwVDZluwicmAxSFF8i+ZDF?=
 =?us-ascii?Q?Qx2uI68CK4imFGBR+yuiQdy7Tm19Fg1EjDDPwGbHRmjmeLlGQgN4aK8Qa2io?=
 =?us-ascii?Q?KH80IS3JmCh4oGzn0USqEj7uBeTlQ5Lgs1PxEtcyMqyqzR4q28EXvMVvXziJ?=
 =?us-ascii?Q?IxWJElLdMYJHikd5DpvHI1Ds6neuFCI7ODUvSqdKOK2kusVhx22MYcxGDMl0?=
 =?us-ascii?Q?yJunNpzmFefaelm+lLNIhi8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0398b599-1f99-4448-983f-08dd90f66ce7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 01:43:42.1198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNn6+QiqSQIbdaiREP791oi/MI7XWUMQAkc5WTXeOJSGktPwLOwZyT8a8wRVgVMuL8Hk2W/3VEgLv+zpxkt2bClhZ2Glpic1hX5RIvtZs9cGheabW0MA5hBMu68TzhVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6824

No one is using component->id.
One idea is we can re-use it as serial number for component.
But we have no usage, so far. Let's just remove it for now.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 1 -
 sound/soc/soc-core.c          | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 61534ac0edd1d..2caa807c6249c 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -206,7 +206,6 @@ struct snd_soc_component_driver {
 
 struct snd_soc_component {
 	const char *name;
-	int id;
 	const char *name_prefix;
 	struct device *dev;
 	struct snd_soc_card *card;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 80569209ce051..39ecf0123a444 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2835,7 +2835,7 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	mutex_init(&component->io_mutex);
 
 	if (!component->name) {
-		component->name = fmt_single_name(dev, &component->id);
+		component->name = fmt_single_name(dev, NULL);
 		if (!component->name) {
 			dev_err(dev, "ASoC: Failed to allocate name\n");
 			return -ENOMEM;
-- 
2.43.0


