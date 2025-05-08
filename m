Return-Path: <linux-arm-msm+bounces-57204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B05B1AAF008
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 02:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16BAD4C122A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 00:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B4C1805E;
	Thu,  8 May 2025 00:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ef7stdaT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0673B5CB8;
	Thu,  8 May 2025 00:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746665170; cv=fail; b=lOeIL78k/euPT4KioDs7b3hCwKKoHdrUKxlqj4wUslwUr+dNY4XuSZjDMR+m6uoDkv0V+ezeMuiVa0Ep/dTdHnT6+w8NfnLB42HYClgfk6faMzI7N97I2xA2c5wM30wrrx1E0NRQR5WOWqPRfAJme5WO4WAiAW2oRHuxI7OqXlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746665170; c=relaxed/simple;
	bh=EOorossFiqq5KXtjd1r0m5DgB9PdcLzpmb7RxrUBsrM=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NEJigUoKGg0KDIq9jbwG2v8xzchh1ni5/ryPgSTOV/X2GtyIbyM1gbc0003K32IHx3b1DzIdfcvUDfesOxMNnF1TKozu8WZ6/FSJO0JgSPoCJHoZPO3VWKA/lHJHd5A86O8qudWY7sNnx0vP/b1FKnwftIRr28fiSsME7aZqfmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ef7stdaT; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYwK3yyGJFDdY8Ft9vmTvJo7vDMUvilNFTJNb4ZSbsGDRYAhmZm4CHKTBXXwGcIyL5lwPi7XXfVJmV1D1t+oyTrsg35qxJM8s8HgQoodABJuAawiOmq8EfpjtjNyeDwz8BaP+t6UQFGl9D4u0XhUbDFC5k7ZpENt7HVzHmP7K1kZDlhcxXUSxRFWVGV4Ld8fpdXd8IzWKWWA+ptMOMVSnnGw633Mh03AttlQCCkMGMNExmETgCSjGqCvQRivc7VV1hxXcnqURrPY165mvNNc+7zXMAf1cUProGjTuH1GdydkT0kxr4iTwEz9MZuTA7+Yj/vN8Dbkf2UqW/MdeR1r6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5LxFvPvuRw8t3mVwmCCtES6bBZDg9Lj/A77MOhnaNk=;
 b=QM0CIndQRuN2aYXAmNlG6OK0ik6KavUr9mED4kAQbkKEhJwXnRcRaJthc8I9/S6781trGpmsPGMh3FQfugmnJCqmwwLLVh3H42degzzeJzib5G5PBo+ohGwS9JF5hyPQjiO3iCrVqjZ7SDPBLY02VuRrfKzRyswtPDssCH5Srrw7WlCoQV1e5GWhcWVuJiq/1lo5asS8n2WLeZSMTUb+D7qQATubxCF/MqSDkpt9CsIOx1SuulJLSA465zXxZlNaFUNnn/8HW3iW15CPKtp52y+LZ2MZxMWaNK5IfUuBvrnx1twTqHnQsF7uPwbl2AvX+WCBP/fYj3y5aONp11SLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5LxFvPvuRw8t3mVwmCCtES6bBZDg9Lj/A77MOhnaNk=;
 b=Ef7stdaTxdXO0O8Vdx1DAg6KVhD47r2jfdzlK+pJV770qkJY/IVkIaGYx03tSzq61h/05R4EmEUJK3XJN1UmFXggCCiaR165i7qEoqlli1Mvq5FSGtnuKFW4IUdIwSaC57jtQr+F6jZtezH3ac2n+u6HnvSz3pibLyy5vN7zhXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10008.jpnprd01.prod.outlook.com
 (2603:1096:604:1df::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 00:46:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 00:46:05 +0000
Message-ID: <878qn82alv.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: qcom: use drvdata instead of component to keep id
In-Reply-To: <87a57o2amc.wl-kuninori.morimoto.gx@renesas.com>
References: <87a57o2amc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 May 2025 00:46:04 +0000
X-ClientProxiedBy: TYAPR01CA0236.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10008:EE_
X-MS-Office365-Filtering-Correlation-Id: ea46cb35-84f8-42bc-3528-08dd8dc9b6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+01hLc3NyUGGwtHLo89GeLxWxn3XlXNzIgLJI1OXKvWd4OLERcFwSFlC9AfQ?=
 =?us-ascii?Q?38Uovs4hQX4Sqr3fnH04+4sEZkM3jUdJyoIcIQejkNTpj97rvhufWGeYTVS2?=
 =?us-ascii?Q?mqgwkRYdgthTJvlNdOeCVZ49sd0PhY/xOXxvmWCGfJYABytYPLJzjdNqXReM?=
 =?us-ascii?Q?amtAKECuG8aQdlDFcARZx68YxByoTy3dtWdOhYUFz234bW33BEHKgsd9ksaz?=
 =?us-ascii?Q?196ttW7qjCpThga8W0lZMo+g20rVDjF9PbQ7z5jXWXEsyPO5WaQkXxVcPfOb?=
 =?us-ascii?Q?ICVNflkAz6zR1NvMnax7NFmWoAC2E1Rqt37RuakdN7wmUHA0FJyLTsBZRJ6v?=
 =?us-ascii?Q?fbD5ijxINziMIl5GF4XYyUISxUBJ59cpVoh8p6O5phA8jfR+vst58yCnl+k+?=
 =?us-ascii?Q?E2dzrXiIkwsuMKlUia9xUjoBaf9G8VtPhhmirSZSxXr9ZoLG6t8nVLJqMbqd?=
 =?us-ascii?Q?RjwxmZL635pnjEc4RT+dz454e++aTOv9eVM9nUoCeLc0JlVqbQbOCsro6m9y?=
 =?us-ascii?Q?DoNG4bgt7OaxYJSNkgT7im8uJqW1D31PdJYyHXJgZfpBbQflTYjHD+9Cx4yH?=
 =?us-ascii?Q?9A2ITO4j6SwAhRiQ49Lj78tci/FanHzfeNwKiSgc7wngR/nLRfs0uSImN5qT?=
 =?us-ascii?Q?SUBAIxuOMJmhe6pIlFoPAYnmEmXXrYKcbVlgpSN5d37DfeDDcqwUfw84+82E?=
 =?us-ascii?Q?9xTSFUTKfb3nBrCnaGEUCdAjeg7hOwjjBDEHLlbplc1tOmRQgxV5BNCCmoip?=
 =?us-ascii?Q?knlrlvbeEwqx8I3l6M7NTO+IMQcR8gIkrjGTTeHkHE5P9UdyUxQSHTHNolgj?=
 =?us-ascii?Q?Mwomi4e5YTacYocJbM5qCWV/5eGuJhFgBxD6qkXS5w3ClenhIOn/8VZG0nft?=
 =?us-ascii?Q?Lu36GNkhEQrAPyKC2vHLYQP84r7K2cNps0/uZnTNYHsImqQPcEshSz4vy6+y?=
 =?us-ascii?Q?fm7EPiPvdptqG9jo4pQP0ynNvo4gGSnMmGhCE41fuqp/N9J+7OfCPfbs8UoW?=
 =?us-ascii?Q?ZNS/wYPUidY1epl/BD3WsN0XuwtrCGwXaG645eJ9E5ES/PikmSJKPMdh7De9?=
 =?us-ascii?Q?64IQBCqtgd0rsdCaAHGKyxkPWNU2qopfUsaHqAZU9vCImB6vMSt8ihV/bKNv?=
 =?us-ascii?Q?Lo8od+NOh4FSx+5ksX9AQu4jbDB2St13byHFyz9OAXt3GiuCxQ/h+kVKZ2Cd?=
 =?us-ascii?Q?gdpaDfkz5sKlOKN41M+9CJ3erJgwptEYClsN9bx27ZHwmbFSyFHxIq+r8FId?=
 =?us-ascii?Q?v8h5+GuxINYZCUgVQL/Hi5uvisqNmwPr4MdbFJnLYeo50IS18b2nJQwN2j0j?=
 =?us-ascii?Q?Z1yp+0SGiHfVWG8pIjUISGPS26pJ9H8IqNSq3PWQCHi374nP6o5aEtc9ewi5?=
 =?us-ascii?Q?j/wbPGHULUNndmmJUWMzwmE8xOdIydeedSU7Hod9rKHBIAzMChIln5BmQK4e?=
 =?us-ascii?Q?yEagxkqDkxZRBWZNgIVgyGl4nhwiH70IyR/Flyi3wwMlMROMRi5cKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s28a9tMExgKwQ7wTJuCen0nnF9Hzr/0RpMS6wnF0WWABb3ZD7OY0F69JT8Ft?=
 =?us-ascii?Q?iGdc2GcONRcXyd2VNQQThvb9zLAfSgjhX/6FZHDDdRWen8ygix3cbLGNjZ/X?=
 =?us-ascii?Q?DlECJUiLprlpotIjBm+lMKPprRbUm4XOBOJ9GXSmHFFQ24mxTki3B7gDzeKq?=
 =?us-ascii?Q?6FUTfGxLYvn6p48CGkPRdriPAtjnNO5qKP4WAPZRff/cmIRDQO39cHQTcDns?=
 =?us-ascii?Q?2COWwZ8CAiakY6eGzx4n//SSnQak+CwP8urm7beMPEQELa4A50MisOxE3e+F?=
 =?us-ascii?Q?CP2RCvD2NfurQMACupeSopgluCSRBT4hmsXtHxXEzy40SFffXizMhtsvUW1i?=
 =?us-ascii?Q?D+XxAJW1jTABBlL9vbKpZ5GZjsyU6APelXncnaB5w1q4uq3q4VjFRtJaTsb2?=
 =?us-ascii?Q?rQrMVfTgBbWnIWbH3/GG62AMSNxmvRE1NDbBkv/izEGwVGGEbUt1J8U/OakM?=
 =?us-ascii?Q?J7rjQW3dNglBbEq6UtZYCBl+zQHPmTPmxEa6rLd6WsnaUysTHbOC4RQCHe/y?=
 =?us-ascii?Q?FELVlRWaSokL3M/OUKHnbjTDlp5EFsxfGjaNWf2VckXLukd9w0nMA+107pqv?=
 =?us-ascii?Q?Lyr5VqUrMapUfV5FwYIYkxTTcBtZx+r/kbK/cA37adXWS6BtUOB7BTzAOQsJ?=
 =?us-ascii?Q?M+nGvaS+HXSa6VDranKT5jZNVh0/8yEkRe7fuFpGo6Z56J3lHy2KfHXYy0vJ?=
 =?us-ascii?Q?x+eBBPctYu+QYBHwdMQQxzsGhncdH45FYvZf2A6d8kNYIj6akhlwRtncK15J?=
 =?us-ascii?Q?/Mo9wPtxRomwXpXE6bXFd3bXFMRkdJYyxcSC/DWSvQrGj/+kywqSKPc3tX7L?=
 =?us-ascii?Q?oet6iD8k/6HmW2YX8nhFNFiA7+SKdT1iJRIDkWNf2oVLKKfgTOPe29LDZoIu?=
 =?us-ascii?Q?Hv0gUP3dVAs2kQHD7jkTOR2kKVSGYQHxZcw72lU1opqYG6ofD8L7sIQhNhED?=
 =?us-ascii?Q?XTG+/wPwzAKCLTJMDnH/Mg3ku5UgxOOVpUTMxGRF/VoKljEUmA7ZQIqjAtdK?=
 =?us-ascii?Q?CCDmYXVn0pf+OctK0HDmvPn9/7qsyHD1xgsOnOIjuectaXag3DeMJ5voBxY6?=
 =?us-ascii?Q?ZT0fmEWgNn9RN9rBlzflbcap/GgEuzLuEH0jFUfcJKF0l4oBPUT3m/EQJP5C?=
 =?us-ascii?Q?22YnsglkKOWkH2wIO2Uq0Bxk1QD1nrQl8DZ7cDoBr0XFEmTFLWEbpZSoDmCF?=
 =?us-ascii?Q?C782SNbAdsuawbLPKbdLXYPS9A4G4P6ZsEJjWzvkIWCVL9efzReZUMcF2b0R?=
 =?us-ascii?Q?KCxXV/wTGvEo8YO11T0N+YvRhuYDpIXh9+nZf554LvnDBzhgmX3XB2qpzW2u?=
 =?us-ascii?Q?+tdlS3fJa3S92EGbJBMzaOpamBBJlUslwbzg6wBqvTPEr7PqOLHt39GYaJB5?=
 =?us-ascii?Q?1rKcWqEnivKlZz6HTR+nwd8/UnmSM1exx/JsoyNdvjkPuRld46uQXX33nusp?=
 =?us-ascii?Q?kMit83cQo6uLDSnxW92PIK44q4Ro35WeXuwJMoIkfeZJCe/BHThQHsv1PZI7?=
 =?us-ascii?Q?+NNAWtG4zFkoc68DPNlvUcSqBB9CT7MKMzqCDCZt8kHlnRH2loAaRwKVL+b5?=
 =?us-ascii?Q?KDrnFJXb6Bfzvc8tb9ush2eGB8Kc4QFTsQFBj7Lt1EqUJvEGOhItegpSxrmK?=
 =?us-ascii?Q?Z0aa1EBcDvRmSCnHt4tfWgE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea46cb35-84f8-42bc-3528-08dd8dc9b6b7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 00:46:05.1060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOiA31l3wzWp+kW+5Pc/rTCEoBP8aX8QlZqbmdb6zA16PQ7vYfRqS8VipZRUVzePSxeTAvORFt1QLdi5Mvx6zC0IKGw+ZNl+98ZygiK43oDnXXD/zzAG86yQVYihaOu4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10008

qcom lpass is using component->id to keep DAI ID (A).

(S)	static int lpass_platform_pcmops_open(
				sruct snd_soc_component *component,
				struct snd_pcm_substream *substream)
	{			                          ^^^^^^^^^(B0)
		...
(B1)		struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
(B2)		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
		...
(B3)		unsigned int dai_id = cpu_dai->driver->id;

(A)		component->id = dai_id;
		...
	}

This driver can get dai_id from substream (B0 - B3).
In this driver, below functions get dai_id from component->id (A).

(X)	lpass_platform_pcmops_suspend()
(Y)	lpass_platform_pcmops_resume()
(Z)	lpass_platform_copy()

Here, (Z) can get it from substream (B0 - B3), don't need to use
component->id (A). On suspend/resume (X)(Y), dai_id can only be obtained
from component->id (A), because there is no substream (B0) in function
parameter.

But, component->id (A) itself should not be used for such purpose.
It is intilialized at snd_soc_component_initialize(), and parsed its ID
(= component->id) from device name (a).

	int snd_soc_component_initialize(...)
	{
		...
		if (!component->name) {
(a)			component->name = fmt_single_name(dev, &component->id);
			...                                     ^^^^^^^^^^^^^
		}
		...
	}

On this driver, drvdata : component = 1 : 1 relatationship (b)

(b)	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);

drvdata can be used on lpass_platform_pcmops_open() (S),
lpass_platform_pcmops_suspend()/lpass_platform_pcmops_resume() (X)(Y).

We can keep dai_id on drvdata->id instead of component->id (A). Let's do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/lpass-platform.c | 10 ++++++----
 sound/soc/qcom/lpass.h          |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 9946f12254b3..676018b8134a 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -202,7 +202,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	struct regmap *map;
 	unsigned int dai_id = cpu_dai->driver->id;
 
-	component->id = dai_id;
+	drvdata->id = dai_id;
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
@@ -1190,7 +1190,7 @@ static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
 {
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct regmap *map;
-	unsigned int dai_id = component->id;
+	unsigned int dai_id = drvdata->id;
 
 	if (dai_id == LPASS_DP_RX)
 		map = drvdata->hdmiif_map;
@@ -1207,7 +1207,7 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
 {
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct regmap *map;
-	unsigned int dai_id = component->id;
+	unsigned int dai_id = drvdata->id;
 
 	if (dai_id == LPASS_DP_RX)
 		map = drvdata->hdmiif_map;
@@ -1224,7 +1224,9 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 			       unsigned long bytes)
 {
 	struct snd_pcm_runtime *rt = substream->runtime;
-	unsigned int dai_id = component->id;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	unsigned int dai_id = cpu_dai->driver->id;
 	int ret = 0;
 
 	void __iomem *dma_buf = (void __iomem *) (rt->dma_area + pos +
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index de3ec6f594c1..7663dafef18a 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -93,6 +93,7 @@ struct lpaif_dmactl {
 
 /* Both the CPU DAI and platform drivers will access this data */
 struct lpass_data {
+	int id;
 
 	/* AHB-I/X bus clocks inside the low-power audio subsystem (LPASS) */
 	struct clk *ahbix_clk;
-- 
2.43.0


