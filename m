Return-Path: <linux-arm-msm+bounces-57566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D0BAB2D46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 03:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D0311891C05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0A11CBEB9;
	Mon, 12 May 2025 01:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SFAGDDYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49571195;
	Mon, 12 May 2025 01:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747014169; cv=fail; b=PzYl4a//TNHcqhemJF2uWa2DDfra5pOCffC8J8X2Cqsb4VEK/4iAuPdMvRGSjBgCm61RvcLpG4toV5nenLMGS8/lnJm8Yk8/6Jv7cXouQrpzlRuuCVcqN4pX1OucpVpJAIVWSI4G3mUT1Caq9sv/D5UXqWAKkEMSTGQol2P/OcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747014169; c=relaxed/simple;
	bh=6X9WOvI7nYDSsmFpZH4eWNEpM2+VeEbWKuEjZxNRdlQ=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=QtNLShzrsot2OQwMXJoZoOVzIt38x9aRsgwk9R1KIwMdi1BvweodMi8N/mUmKN8Tt0D3Ez33nv8JEAufESUj9xCQFMl/cy3Gpug5gFF5Yv6c7moQvEI9tew/xrvfREq6DjoqrdlI17G2N1Ebm47u/duqW29queBc/6xmPr54k1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SFAGDDYX; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpaFtcw+MjP6L9VOFYE4UxGgrnrHgjvge9TA+sECDE/pN/I0DAQGT0pJ6x1TI5CMCKzlFxHJn4BltQkq64GE2Yk5d24qyajDsfXexjSwWK7iMwvh5b+PDivEVAlPZqeteQM1WCI7d3EdZrj2r8KNz9+lQ19I72sZZrDDrIrvWR01fYFVea9iwTEI6IDwzxT533TNNa9aLgJu1tGLwVa59m9GR7//AnFu9N/xWxBpTt/RnpffwC0vWG4FPLS3jJr59qlrxg8l3Wn8aWUgo5UsxZu7mRLfVkgQhZBnq3HKbRoPkpLawNJJ1rrVzzgnL95fEdlPfm1nAIAEezqs+C+e5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7sB5PVCl+UnsBE1Ifvai4xYcwtKOZHlX4lOmiwt5R8=;
 b=VUhE39BV9R1AH/1fZ5L0XN9ulj75cLo39Uwm11aA3yJ3+XzgUZkyvyHFU6S85FH+hlsF2P3IJGyi06eiHZ/WDyggexSxXsaL7NPle1g94tHajWa/XCHdFC5LlvPusuSS/mPka5Wz8x+SVegqyjL8i9fu1P7dH/Fj98RcwEM6lZItkLFH6yr5bHYu353mKljshM/Huxea9VMcBR2yJ7AwhRYorE5QXbJVgGZFE9TKUD661yoX37k3BbaHRZF+Dg7KH98y9nc6VMEIVQcYzVesl27LyWNlF7FF/ehSjIRYv3hsaHU/qYW1Pqr3+tAwA8Jg/3hLVsJckGFV6evQgOY9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7sB5PVCl+UnsBE1Ifvai4xYcwtKOZHlX4lOmiwt5R8=;
 b=SFAGDDYXS9U1RaW+kEM02MZTUPpPwb+zyIgN78KBd/1QF3nPykKwwc1mt8dwZHp3yXO1Hpt1g7UUFU0stFjhYmvlbm0DomPcfKKsM3UoqJeEsETdBzIiSkZBqtvkmHW0vGVNBrpVyXWWkCWhwydgLvKCcomoykF+SA4jhP8o6Kk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6824.jpnprd01.prod.outlook.com
 (2603:1096:604:117::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 01:42:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 01:42:43 +0000
Message-ID: <87r00uy57x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: remove component->id
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 May 2025 01:42:42 +0000
X-ClientProxiedBy: TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 0179bbdf-2484-48df-6aee-08dd90f649c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TJ5HrmsX44u65q5WrizvdHu8ypw0vTs+eVyZlb90ZoA4E7Dg1xCrNc7bknZq?=
 =?us-ascii?Q?r0ygPnoGht1xPGnar/zGNgj/ZZKDN9VsBbMmFmmVcGkdRUgOKqZ0W1UVX4dI?=
 =?us-ascii?Q?XW540vrycwADgQE1Be7oFAT+4qQRrV7C/1GsMRTfcjWZnzA+4arT+wdjJsTo?=
 =?us-ascii?Q?Rezl4i1OjhMtKmiH1LSgUANmoYkIRGJ5V2F3VAJhQ5xWWAhq1G4KLfKKHWoi?=
 =?us-ascii?Q?Mnl4U/XzU0I1ARAPVo4jn3PnnZboW+SWX4+lQLbKnWMvPGAlVS+eFbDwbZjY?=
 =?us-ascii?Q?8/EMaRZpuv3z6S2J4iFMbhT28WXaceTuauY+QDvplTsIvXe7OcRGXZeTl47d?=
 =?us-ascii?Q?yuDVFLisRg8iIgBjBwXgJXDuqd87dn5aYI8PmFEhq0xHtDqFNBerygyKy6Be?=
 =?us-ascii?Q?AgIu/368jCt6piGR1DuQs5VefbDEm5tjXZJL28GgfOxr7BhAGqARsDjiSW1W?=
 =?us-ascii?Q?26Hj3e2RlP1i2Um8pWrv07Ni+3NXhD6w6Wz/NMXlcg7ZzcNPBPLXrP6Eg3rt?=
 =?us-ascii?Q?kxhAMTN3LRMCBqcFnU6HUtu4HQR02sbRStXQsiG7PQGme36hQ1FsRGnCBTdy?=
 =?us-ascii?Q?XOrOsJrX6Axy4/Se7KTnTJEMBHbicN+79HE0gsYKxZEwk24KxLPkqUYTAn5b?=
 =?us-ascii?Q?XPRLeSG1uoPU1XGoJ2uW8Ohro/G/eOlmWntLR68QeUpy0Bz+DeN7hf4z7uIJ?=
 =?us-ascii?Q?ePvvNUuHC3V4vdfZNvXLN0XafwbOlSrS37XqHoRt5O6mzwH5hBVDbCEboOpk?=
 =?us-ascii?Q?++k5nE1ZQQ3+4/7TKnyJZBuM1SldhmhIhy8xZJ3oMGprINU6so90mxAVdVBy?=
 =?us-ascii?Q?cGob/PMuK8sMX/aiM5IPBjodkV2JNY0yc1TcHUbbQDBOonCe+lF888NI0vsw?=
 =?us-ascii?Q?X0/FhWUJWT6PP7xvAZoqB9tpBlKrb7ZG+OHcZMs2kC5V2XFr8hJvZ4roZPr1?=
 =?us-ascii?Q?RGMjKH9ewrhR2rBvOElaVLhEPVhZ0aZ3P3s1lFiX1fDkOwg3KkOLy/SllTSA?=
 =?us-ascii?Q?CEzzOkGeLudh4JtZAqu+Q+8Ed/ZvbvDsYDhEZDZCaw2h4qPPMqAxq/Z9oRW2?=
 =?us-ascii?Q?Ly4IP6diXh5L9YSG4+gT7PLIlrzZgrw53fA2q5164eGkalUqqwDv22lOUd5g?=
 =?us-ascii?Q?Z2aaRRBDmxrP/Fw+q9sonPA4j47tXTWld5OoZIQF4UlQ8DFcXQXUfQBCl8wj?=
 =?us-ascii?Q?2+QPV8mXF+r1dh+BfbUseh+02Tq/yH1ggpnLFGR0E+COYE44i4zOeUBED4HM?=
 =?us-ascii?Q?edd+85pxQrcZ+WiJyHWBGmcJrDoiiJJeIjKSsM8tlCn2TWbwq9ibpNuqYklB?=
 =?us-ascii?Q?LeKObZ7CPtOpV7I7mJx3ALl69awymQbPxTpPXB3KdnYYIosNddPJAZCnzCSt?=
 =?us-ascii?Q?xay/oQwA46zjcfPDXf57c8Hekopbv71T9EHuK6TNNOHPX3z7gaYkewjWOkbU?=
 =?us-ascii?Q?+OW1uS6WfYSW9NInLe5c+HOycUOU7tijfuLLzEfYktkA8d8dCR5PZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zkcrMUUyANrSDSK0Smoz8Uw65uCO1Jd5VOeBdlAz9mke/3qeK47Rc43qBFH0?=
 =?us-ascii?Q?ID0Z38OC6ifKlLSUK8sQNbxWIZo9GYj7XKy3V22rYiBsD02f9QOEdpMEOPyZ?=
 =?us-ascii?Q?TTq0KiYrcphzx23w0XXM4gRC4xg4IVT5v0Du6K2PdCYmxFkUgZH13rHkbmrN?=
 =?us-ascii?Q?txGkc5yOrnbYuOjEeoEIfDAfgzhKANMfcHogUOlqDkSJiZKGr/3RQB6/cX80?=
 =?us-ascii?Q?5EPflvewXdwUzsUgupcWlTXNJ5V513gBBCwYep4Y4Aw+aDM6zzuacrK7UfHl?=
 =?us-ascii?Q?MlwKuGa2FqT37Vtj/CWl546QHlTdjULj7phiqZC7miEmX7Iq2XbJ1gLqDxFl?=
 =?us-ascii?Q?tma4X/vCn4XMFtjE4fae8EtcW94+nJpJzJLP6iTOBgPSKr8WUU3/v1FDc9E9?=
 =?us-ascii?Q?Z9tCZ8PUBIg2pwxkmNHo82/QXwIaDfGBPlf8vl9syjac/jTGIcdDPK58hDzU?=
 =?us-ascii?Q?2xlM7KodQf6Ooc329NZRWUgfBAkWw16NFEc2nK8F/j5unuIZ+TOAkSVyCngm?=
 =?us-ascii?Q?RxFvhODGbXnfw3MU8pkP2W5Y7wV2vFjp79/iTifL2VE+/vgQtSCOfN3ACf2R?=
 =?us-ascii?Q?wGJZQ2jH2WCmbBhaymyxup9lxq5btRPysjEonBCkANNt3ENZ5rzNYt2VnRv0?=
 =?us-ascii?Q?BLPqVKSDia3Y9nPmhJHyEPu2XRKEAuoHFROACG5RnNeFCe7mf1uOXD0r8lT2?=
 =?us-ascii?Q?bv+jSTJRJp2O8jxlhm0/BflUMYbtxUtbIonwfM9GwcImeZI7WABPjI3TuWgq?=
 =?us-ascii?Q?05B+4wADf3KliAS51pgzwv2BrBOFsOCTaFqO3XesRAM1FHDuPuQw+9Yk24B9?=
 =?us-ascii?Q?NrD+VNMZNSubCOtm8ANhPWphgAz2IN7UFeHVJBIjM2+Hm8gxOyldxmdGgDsD?=
 =?us-ascii?Q?ShjI2rHgU03rDnNI0SCJrwN/iciywPTy110nx4jOZ5SmQCJKrrv9P6W2Cjrq?=
 =?us-ascii?Q?3tPA4n7uQJIMZdRHbDkwkOle3OYWmwMptcYOUdy4QEXy98jrv4vuAAhu362Q?=
 =?us-ascii?Q?gA3SJqXtSMXVFNr4ScQ1Cm5emM4FRJcvdV1uab1znkC9jwo8A4qjm/Zln7mE?=
 =?us-ascii?Q?4eyIdZOBanFsX4gRbLYbiwHUSGjysJdJfamziXwYi/BmvOu88T+DRQPecsgc?=
 =?us-ascii?Q?CgcliBZi8Zzn7TdAHeKADQs60FpSaY79z5HX+ROYKlqkRyPpr/XwMOuwWmlF?=
 =?us-ascii?Q?VIem+9CFjCFBK8SKOgMehmtucTivRPhyVGXVVpNdLy9miXZCeJb4MsvWQ/+F?=
 =?us-ascii?Q?4fog3AsfcnUPcaiAPoauEogEbI+0sUic4mR5a5VqYg5BnLjBa3UYkjEoFEiF?=
 =?us-ascii?Q?SwdlnD0R2mEHS87fzn7QeSzPhcOdH6ib1z0tc2nO5Lgu6Fg3huMf9o1YEGHf?=
 =?us-ascii?Q?3F9fVJiccFTXlAnkEyl0AS3sbhqu4w7yb58FA66+uJi5HOscphBNJoR50JBw?=
 =?us-ascii?Q?AxIqYBD1kzkNMlGQIpomgtnwqahw48qEfpnhT6rMxbVKmelUcnO8UchYb4ao?=
 =?us-ascii?Q?kANvdaKnGkl1tY+kQYfEf4qMqQmhSFtw1TwUPR60XyKKCt7nDDln5Pd7zP2u?=
 =?us-ascii?Q?UOtYtHKy44ni00jLkrShXvo86B5LwR+guVD7hQilSHEo29OhKb7YZhoX4Qzq?=
 =?us-ascii?Q?osgk3MK/UXz/xxdAgpC87/g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0179bbdf-2484-48df-6aee-08dd90f649c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 01:42:43.1579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d855tiuhN9yx3oWGTDNSkuIsSm6liJ6aFog1Y/cvypdRROWLv/o5eNNyhJO9bt3w8Bs4e8LbF4oP+RmGr35laPML4gvyhvM1QPbfhtVOQ+Tg4fGm12goCSkS+1lWkDhD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6824


Hi Mark, Srinivas, Qcom members

snd_soc_component has "id", but no one is using it except Qcom. It is
initialized at snd_soc_component_initialize(), but Qcom overwrites it.

According to Srinivas, unfortunately, current Qcom lpass is broken.
But we can update it and then, avoid to use component->id.
Let's do it, and remove it.

Kuninori Morimoto (2):
  ASoC: soc-core: save ID if param was set in fmt_single_name()
  ASoC: remove component->id

Srinivas Kandagatla (1):
  ASoC: qcom: use drvdata instead of component to keep id

 include/sound/soc-component.h   |  1 -
 sound/soc/qcom/lpass-platform.c | 27 +++++++++++++++++----------
 sound/soc/soc-core.c            | 14 +++++++++-----
 3 files changed, 26 insertions(+), 16 deletions(-)

-- 
2.43.0


