Return-Path: <linux-arm-msm+bounces-57565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7254AB2CAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 02:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 376413B7826
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 00:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AD14D8CE;
	Mon, 12 May 2025 00:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UcBFDYAc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B01CEEBB;
	Mon, 12 May 2025 00:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747010681; cv=fail; b=HRZAnMwfZh6oFmnjHCzhCEZDb6dATHoFcahB0+CLNF3ZbAeDn0k03nGHB7hajfCQns/HoAqwv/lfUZlgktVwvT9CP7pid9opMBmOPD9Y+nZOFG6yqy0PeEnZrnG0PSk7QUEX25hr8bafk9QkLHEGC31DJ7kYqWm8OfMo+n4nNQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747010681; c=relaxed/simple;
	bh=MXJraJ3tMHXEvHhAtbqGblcxQJFe/oscLW5icOB5GR0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=P+JgRFMSW2o5Ad5w6OUhG+o3GhMyQml4f9nsN/ZLUOdkovzt3c1kM/RXudRZN4X66X9NKQ2dKGCTgQ1Wr5OcHWgofcOTsjEaQ1DxK+BqpAVjReWZ1u9RmswhIVr7wTSLZoGXltfcRczozGCvR7pfhM9tkkH5kYRssalruN+eGX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UcBFDYAc; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TemDetipXrcTg5E9zc5HYFR1yCq5PqqtOU46zEIMmNf2m/CtskKJ+2jRkMkswQphSRq142r4zDY32IvHmop0gLqdrGr4guafBAYKpqLByJFyTRYtfQvuUB2OgoX2YFIO1yhN5WCw7E2Q5nfm9oQ4LdQ7S2rvAL+2feYihH/TaV9GFJE8SzDm7jcTb3zPBIBBIgWRvwFynSLfJXZ/T1ipBfxIKA3dvLq0/tljwXJfta5OVa0UMI8iUlEuWbv6BSIMzNun09IwqL7EnTXPi4nAcrxlspR6ZxoKij8nlqtiJwKaKDT029SAuLmg7Pu8wFHKc9xzl/9vK2QPGc59rt7/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU3RpUWSAFUqGOHbr1YZJcjyvBW6H2Z9Cp/W+ZoMI5M=;
 b=Ly48Ki1iNCoG6QogMSSu80wSEsLyVc2PkHAhZWmQzg5SKWgFKkTd7Ay9x8i2revWeCjz0ii/rf2bQCmNZTEquI0ugyThOoDEhjnubD4Gvky5P0FUjhTKKohb182EaRE4SWbY43/bd3wbLpFs6o8EoMHRaTTCkSp7maO/a92bJFhy5mTVrj3oi9ot4ynSU9NzLIPP2n1kgoCmq+JMGTnHYfTzVa5Jzw2H5vDn50HL/IpkVnjHCpoevFsonLZLRZ+9AKaoZcHZRYJOBgBOvVC8fjpayfV2C3/TeOmlFBpRDuRxenKFynuPdx9Veg2ugUffdDG0c85plcXk7huAgC8xpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU3RpUWSAFUqGOHbr1YZJcjyvBW6H2Z9Cp/W+ZoMI5M=;
 b=UcBFDYAcBGj6oNoC34zFFq6nbdVq+BRyftfY0nbcSPIABmTKGWu45WZHXzdltPSNICqyH3QVVga4JQgnGDZfDAxtmV+hhJJzL6pICICiG2Hq3/ajGnOGC/6rh0t0E8MB5I/L0SqLw8ZH1sr/hEZ+EKfdabaS96HUfAPHvotcHLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5571.jpnprd01.prod.outlook.com
 (2603:1096:604:be::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 00:44:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 00:44:35 +0000
Message-ID: <87tt5qy7ws.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: qcom: use drvdata instead of component to keep id
In-Reply-To: <c797e8b2-9d9b-4fc2-a8bd-f88cadcc94b6@kernel.org>
References: <87a57o2amc.wl-kuninori.morimoto.gx@renesas.com>
	<878qn82alv.wl-kuninori.morimoto.gx@renesas.com>
	<c797e8b2-9d9b-4fc2-a8bd-f88cadcc94b6@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 May 2025 00:44:35 +0000
X-ClientProxiedBy: TYWP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: 277ebeb0-42fe-4756-ffee-08dd90ee2b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?joTH8IcACLp0Yrj0pROYzJYAwIsdCsRziF5NkSJPF9LKfeoAKOE1WRYSNM8o?=
 =?us-ascii?Q?tA8IkXFH0koAbCYiApPfzaFEJakRynylylmCZ1Q+xPwDk0YzDW7YOFqxTaEz?=
 =?us-ascii?Q?Pum61/lkHnMLtdtx8NoEP5ICQu3xJrPUUs+KWuxHO7B+AhGbbdS51zne6rTn?=
 =?us-ascii?Q?IWYFyvy/1mGyOlB0MDnk7/KVcPIhd4cZ0QNmPhTUGYiiktiQ4WnHk42Rt5TX?=
 =?us-ascii?Q?r4EadhPS/EpEUcjoENQM4B8VGXkOFbyz/irVcl8FfIvN+9Ngv/fILXBAxTbr?=
 =?us-ascii?Q?havdYlADkUluy2Quv8iIf5UNW3WYOvyCXg5yUEV+kjTcEmf31XTE6tCkmaMR?=
 =?us-ascii?Q?uTfkM0jyZ7Dlk+odogf0Nz9CHBxvETh7S1hVG0PAG1tyIW4d/qTn987lJNhN?=
 =?us-ascii?Q?DToTK8eFHhJP/FVN4vhs5X1tJ7qITlXw71p5d8dBtRt/rcYpI6wR6DiJY70Z?=
 =?us-ascii?Q?w1LMRclJsw/8B4CqzzvOSRNhHf/Rn3l5NFQ0flawJ6/TkK0/pXBpBRPjfq89?=
 =?us-ascii?Q?eYo9BUkn9BNqlauOQNy02lZakz8jFm7radFZV3hnr1K5kT7IaGnkZzE5X6gm?=
 =?us-ascii?Q?nz/QrGY/ov8qG5dBtmDqyCImUOPUUYqHAoqlwIQueeEk+vGKglV4H5o7Q7ag?=
 =?us-ascii?Q?yAyZkVunYk6IneK8zCN37xbZhBdp72GGyf6t4CZA7/XpO9MQ3F1WLJbiXPrV?=
 =?us-ascii?Q?iwnrROe7IbIdziWFhMe6RmtKySjzNrN1yegHWzisHTu9qGnjhd5PKd6cbxTg?=
 =?us-ascii?Q?q6D/b/a2jLuB9/m5vxQkKUeIZhmk6y61TySSYJvWhc6P/Z34VPeBm00ZWGN4?=
 =?us-ascii?Q?jDlEhJaJR0I3oV2XorMsL6n0j23JBL+ObDgjNYAsFxnm73cTf6ErigZyJkok?=
 =?us-ascii?Q?J6ngItdW9v1oIerxFbt7swiWlAjIOumyBdhk4czci7lFhKnzbZ3UifTdnFQp?=
 =?us-ascii?Q?8iKXEikfmIVxd7ORTTJW9Hcc99pEBlfXi/DDBDEv/nAw/9NRChWSsyNynX60?=
 =?us-ascii?Q?pnxIsGeZ/VMIjagwWiPcHzuIHrHvmHhcWBhkB3kZyvGA6Exgd8nI4Ol9Vhjr?=
 =?us-ascii?Q?/0xrXtGLWLbX1edPdjt3fQ4NnycWgSR9wL904/OA87iQ0STvIEdWeTHxUkIX?=
 =?us-ascii?Q?4vLlFaD+x7NsDpJHjEz3XXpQd6+wVihkR+w1O4t2qe1g0JGjCdBLTzexOq8s?=
 =?us-ascii?Q?4xcpv5x7KcymCvc7vMSUpbEqrYnfZ55JGItHk3jNz8I/u0dfl7YsCfGNrFi3?=
 =?us-ascii?Q?Ppoa+vN9VD8iwVwsgkt9o7caPwyHSi5EP/ddilgDQfG2mzxsXPItGhy7CA99?=
 =?us-ascii?Q?HHokvPlalypKDhgDuSoM5f6ggTrmsPwjGeLAI1YQyQOKs2qIdPw/EyZcHh11?=
 =?us-ascii?Q?m8iplCY8cF565MLqDL2D1QErcSwthHCmNQu+CF8osROupwxInb9cBabSTroL?=
 =?us-ascii?Q?EEjqzbub9ZxGVBiFObdmdnrEAoEpcnvADj0f1Z7U5Aoc/l8Fdi1Txg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8/SmXDxzZ+AViNbvZPE5dBB3nQgrABKtuZ2BiM55HvwMM2LRJdND2p5zd+KW?=
 =?us-ascii?Q?wSERtRskFGRtKTb9JOQuqn+P6ZDRXcF/ivbow8c9x+LqJdL5Ig1zQTbSR3r7?=
 =?us-ascii?Q?dESCaxf1d67M2rSBY9mzxJ/5JgvQ1jtPmwfulRDK+zyPpS/2YHgoaPJx8sDa?=
 =?us-ascii?Q?wPgwfsSmKdIXUjc7qM7ag1hNJGi/uVp1cJnyUH5oIVDp2qZ9JXLgKo9NcR5F?=
 =?us-ascii?Q?nrerJ8eU4pnag6zOQ43j+2QB5SHmzgzYH7lHdrH+ON4xGphL+2loNnrrWgiU?=
 =?us-ascii?Q?3Q03Y9OFAqjJTC2hSKMEptX6Pp8j9k15jE8j1K1imb1QsKEaI3zs/edRcYYK?=
 =?us-ascii?Q?hD3udfl0zLMmgftdvcN3ZKrt3B0cUJwsvrIarYS2FjixXG7C30hOd1CO/yLr?=
 =?us-ascii?Q?1iOj0JUM3xEfR+Hhc0wrMTcBsFujT7Czfk1f9SvqB0hdS7BICkpsu2dkmrw8?=
 =?us-ascii?Q?EGZIgUMSyCGRcEjWY8mAh+40pTPuZQ1GcB4C3R0oR+1ba5atQrBJ1STUCv6U?=
 =?us-ascii?Q?mj/eJeE07rPxh1Zb70NE2wfLg7xwEdWpX2VoYyAztDbEpF1/WuQRs4KBNTdg?=
 =?us-ascii?Q?Nf8GwwEWgPW1z9BCs0ivjJomJym9/tr/BGfa8CKD7gt2blOOgPJ1e+Aegzd2?=
 =?us-ascii?Q?BQ1Nj0wYy4sXT1oqNfIjoEY6DZANBBOKrr0mbxtrv7/fA4TsyZjc/tJGzrLH?=
 =?us-ascii?Q?U6Kxlfw4Bt4x0fW4Ydg+DAcYQQCYpCYL0rJIF55UVHBmB5rfVr3nKd77o1Wj?=
 =?us-ascii?Q?BE91hg/7HJ7YBlCWQjd9Ad5+PIOPWbu8Gx5RKd8YCMPZDaMjZtlyYmXSupl4?=
 =?us-ascii?Q?dmJ6QoLrrQJmbZblXwrmdPf6SVKLvllj5V999jB0lWpaZXrt5lkU4iaaffJ2?=
 =?us-ascii?Q?IY3OONQ9cMxwDcOlNCIpFXWYXMPxKBZ+nw2BxbNBO5xOmgh1oy3gZl4iHMoM?=
 =?us-ascii?Q?nwh/SEDauefjiUgXPNBAYPCm7LVcokRX4PYwECyNnrVbAa7k5uPPCnw5BAFD?=
 =?us-ascii?Q?uQHE2vmClhG0/3SIoQDvdgxN49J2Zu+2C4ie2Jn7w9YBYkKyDrtwhBSTL+p/?=
 =?us-ascii?Q?HY2Huh1CKtiWoQqYfcKlsasVVFr2TcG1Q4lQdozP8Ec0c0YqsSZXcUaRtgXp?=
 =?us-ascii?Q?LNrcbK7dHk239WBRR2aL8Czw1W7PteGFR+stgwBOiEJAZSstF5MX7KZyX2Ei?=
 =?us-ascii?Q?YNdHDefcoRMOQCVJeo7JJ6zqGeurV7qYm+F2hOvrK8iw6Lx0Mzse0lBzsYmw?=
 =?us-ascii?Q?JDOA0qOWJFMEJz9XGmfrNq8F+s1nlY8QYFVWCiFxc2+hdOrrnOM7i0k6YVxt?=
 =?us-ascii?Q?jw9A8Pi9VNhpI8cofPls/zuzuo6+Tt1vOGv3KZxOFbMLZNrjNWh60TDA6fHq?=
 =?us-ascii?Q?wxYvLqYn85g+5BEdOmV7zA90esizgwvnfBOKO7ZK4/byq6IhMnAueOacypQW?=
 =?us-ascii?Q?ql8E2GcnYtAvvG6QL2g4SfmQS0yQ26GDd4lW3h5UjEquL67fnsdpVnVoVkC1?=
 =?us-ascii?Q?5Ud+ngfbFRBMUnT8n32j2VFDmfNrzsCLZg1WI9s9Mrt7/0Lw00hOsKAEYYRz?=
 =?us-ascii?Q?8h0GF/ywArY1Xo2tlQGlX0bUf5gz7Q8FXJKG2m0GGkrJPPFWchnFr+bgskwx?=
 =?us-ascii?Q?2sYw4+xCyyZtKRjci8gDbjA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277ebeb0-42fe-4756-ffee-08dd90ee2b0a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 00:44:35.6617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XALfgkzUNgzsQIe+jKsW+XOPHfM2ms4TTPqCG3bJ4iypVzyQBPWl2mUj1nk5raIM/g0DqZ5IbOqoZ0CcHs1btB7OSj8HLqASUoWDvC+bBzL29RIZw7ZFqqWCSOcNGE+h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5571


Hi Srinivas

Thank you for the feedback

> > qcom lpass is using component->id to keep DAI ID (A).
> > 
> > (S)	static int lpass_platform_pcmops_open(
> > 				sruct snd_soc_component *component,
> > 				struct snd_pcm_substream *substream)
> > 	{			                          ^^^^^^^^^(B0)
> > 		...
> > (B1)		struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> > (B2)		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> > 		...
> > (B3)		unsigned int dai_id = cpu_dai->driver->id;
> > 
> > (A)		component->id = dai_id;
> > 		...
> > 	}
> > 
> > This driver can get dai_id from substream (B0 - B3).
> > In this driver, below functions get dai_id from component->id (A).
> > 
> > (X)	lpass_platform_pcmops_suspend()
> > (Y)	lpass_platform_pcmops_resume()
> > (Z)	lpass_platform_copy()
> > 
> > Here, (Z) can get it from substream (B0 - B3), don't need to use
> > component->id (A). On suspend/resume (X)(Y), dai_id can only be obtained
> > from component->id (A), because there is no substream (B0) in function
> > parameter.
> > 
> > But, component->id (A) itself should not be used for such purpose.
> > It is intilialized at snd_soc_component_initialize(), and parsed its ID
> > (= component->id) from device name (a).
> > 
> > 	int snd_soc_component_initialize(...)
> > 	{
> > 		...
> > 		if (!component->name) {
> > (a)			component->name = fmt_single_name(dev, &component->id);
> > 			...                                     ^^^^^^^^^^^^^
> > 		}
> > 		...
> > 	}
> > 
> > On this driver, drvdata : component = 1 : 1 relatationship (b)
> > 
> > (b)	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> > 
> > drvdata can be used on lpass_platform_pcmops_open() (S),
> > lpass_platform_pcmops_suspend()/lpass_platform_pcmops_resume() (X)(Y).
> > 
> > We can keep dai_id on drvdata->id instead of component->id (A). Let's do it.
> > 
> Current code seems to be broken to start with.
> May be we can fix that and also get rid of usage of component->id together.
> 
> From what I see that there are many regmaps that the driver cares about
> however its only managing one(either dp or i2s) in component suspend
> resume-path.
> 
> i2s regmap is mandatory however other regmaps are setup based on flags
> like hdmi_port_enable and codec_dma_enable.
> 
> correct thing for suspend resume path to handle is by checking these
> flags, instead of using component->id.

Thanks. I have merged your code.
I will post it as v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto

