Return-Path: <linux-arm-msm+bounces-58156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DA0AB9348
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 02:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 278051894EBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 00:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C264B8836;
	Fri, 16 May 2025 00:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ag2LJA9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825A64B1E73;
	Fri, 16 May 2025 00:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747356404; cv=fail; b=HwbjuLGf5puzJ58P9uHTu13PcoIDbo5YJF3FjPx9O3O1LJ1Q9Vm33GYAFgFQJcWgCTYDfiQi6WpV86dMLVf+HcjnNRJhADkg5yCYJ2TSukwriXimRGi+EBzPc888ulPrS6+x3/2VT0N8MTKlQci/sULedjLvzfqMrkxbwD70DTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747356404; c=relaxed/simple;
	bh=3cBAlNfqENpLq+8w4IR/Ua9DsF2ahnwm6O6mVUZXBbk=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BfInvZHZO+amBxKO56hu2U6kenHVqh58Ev5cJh5Azw7WmEMKfqv3Qy6N1Iz3rv3yvLeQjwZWpTJxHwD8tP5MRuAK98SkBk6uPU8SRNZEdAw7btIN8j1I6A8q3SRx+NGujs7+QMsaIYZ22LcUq3EvmzSdZ35ybjND++zGzL5FQX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ag2LJA9L; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tp0Ra3GwMQm8QK9aiqW0l2DJ3mOX7hWIKHIqls238kGkAUBNqx7ccbI0CarSQNZebmL0+gOrPEiojYRoAhWaMQrJoHW4hLPclw7hL+XMdvM1pdrT8pbdHsE/N8w20RCTMyQ5+jDPLYTQl+Qman0CmsBu1SjfJ6zX4OMO+yvyksHxD6eyegfKMZQtFsIHujWARiZDFwnLPkZdDRi7SJN+cDA4yioDiL8ULm4h2fdslONm4Rzfa1GQpWRQRgVgf6jlRDrDIxnVbrZF8x/RrBemYplwGnbGdxYiP+OajFhFIourlIM49cCrAY5ap5CZUJyNAOHI5E+BxenE1lmQKk51HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wgVmDKVw92084jMG8hlns9ABpS1gOIMQzw5e4Mqhew=;
 b=HRsjLTYdMsV2TLfWhav/6I3MTorbv//GkNkoysyvLgxuEkidzu2gBvfk+LSeArvkXVL5i+2ku2qJrM6r1qBYRexHi8XEltSaS32SCl+j6u/5SzNeA5bE5P98nJHnksOBiNJhOqEkumtqx/1DlUU8cEU7153OA2/Hur7ZPDf0Q2myOJE/ngE1aI4B/ebDD9wgFwHs0pnVGyNL256Xq4Wj3J6BkUDGyY7NIqRhlLgLHqb0n7M+nzrbJ89Bl+65TucN0fO1qZahf3bg7Jeq9FguAHhoV+nYs/+9VMK4EUqABul3YIwDfvrk0scy1IDiOz1O5LyRbap4PECdjozzh4KB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wgVmDKVw92084jMG8hlns9ABpS1gOIMQzw5e4Mqhew=;
 b=Ag2LJA9LFDAvY3hFir2JdyxH9B1N+k7Ur4kub4ECQtVN6oWdz1eYGliBrN4wlgLIDi6UxfZMBwLJsy9jBiCrkAhbAeHMA1POrCrS22asQNvgJeZBG7YLDF7o/C45aCdZ6XV4ItFXuhWNKxk8FSjQ1qIbF2UpNbg+riVUCPSTm84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10044.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 00:46:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 00:46:39 +0000
Message-ID: <87a57dtma8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/3] ASoC: qcom: use drvdata instead of component to keep id
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
Date: Fri, 16 May 2025 00:46:39 +0000
X-ClientProxiedBy: TYCP286CA0158.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10044:EE_
X-MS-Office365-Filtering-Correlation-Id: 7330c7bf-c974-4b38-c68c-08dd94131eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EvCvwDLfnvKFJnNfUH5Iv3MKhsKGAkZFKKqoSR75kOHAWv4TNlUFMhR7TLkm?=
 =?us-ascii?Q?n0Y+Gi8jjp2GH6vq7VjwrfOALP3NJoF+RQ1KevT48EI62WVP+ap/FT8HrbMM?=
 =?us-ascii?Q?Qc7klPDKVuY2xs7WMX+PRueX8WRWT+1RJC7oiq2p7MgPXAAhWI6h5theOMl+?=
 =?us-ascii?Q?MqvCt5CmzmvC5bR19jkEGixa/4R+5isKIY8H8sFROKXdSj3s0U6kSwR4yoky?=
 =?us-ascii?Q?3gkRj07FWVZMDmddGrWPtosIgvG5wGBPrCK94p/WGDF1IbhkQJNRkVGmbgOn?=
 =?us-ascii?Q?UJAiSCSmqjI7bd4BZZ32D800rYfMvPcEE7lJWAwxwXlRw7rvAR4BkeILCtMX?=
 =?us-ascii?Q?LYYS3xG4EaXXw8dPLR6hEFDz2UExCdq0yVrlVeX/HodhTVveOoNMHioq5l05?=
 =?us-ascii?Q?Vc3UFjJj4ow2Zztwd+AtQit2L9+TKT3f41mq90ZVU/aiSCDTUxKaesyFsglx?=
 =?us-ascii?Q?dZottDb1oNgw1AiuAZ8pBXzqcVlEZo2P1Pf8+UTGnf1+rXZNIurTCmXzo4E8?=
 =?us-ascii?Q?VJBEZTWxUrbr61ZBdB8Uv5lxuetiBSUYVPF3FMrCIiHbkULfV0Z/pM3iTrnF?=
 =?us-ascii?Q?6e0DaBYV2tMqCH2nfSl3GzTfMDl6v0BH2lAbyk0qTGWpumPBqOzA7Nx8Wga5?=
 =?us-ascii?Q?laqc6bPIjeFlAeMzwxAoKzrSM9mtXZ2uvdchkVN6nvpTf7UVn8rXkXmy7tK9?=
 =?us-ascii?Q?0XqBXCXrikTBZPazeBQJJtplcFjuAEcudodDVM7oHBpV0X1T7OagGBV4I0gn?=
 =?us-ascii?Q?u2UwCbp8+Rfr4/g36lkhBMC1BFjhreEuvo6BGr7osNoqO6/wGfA6hxF2ayGQ?=
 =?us-ascii?Q?Jh0qefDJQLOurLf2JzT/b9JuEGwgicmvo3GlnjqrAfb1/w7pFshTRNdYzFMu?=
 =?us-ascii?Q?2Hr431qUM3eeRy+3+QMKQ/IaoNbjRB/734lbe6013+2ml/vrCmC5pmgd/mwU?=
 =?us-ascii?Q?cx5iwgoFNUNMF9LBGgTjV5LLNEstkBg0jreBjur3OFNzFcp5JaVKuNjiz/ie?=
 =?us-ascii?Q?ATp0c8MRP1BYzmaUbbzsybMYNX2tqJaNy4cMiZb+DArip4ONYVEgcgVB2LPY?=
 =?us-ascii?Q?Xo9kMDG7mJf5iOFnoyCXPgqPeU21h2vKfQhtUndQIZIjogtVfTi9W4FIYi83?=
 =?us-ascii?Q?aOAibBQec+EXfR5Q+pBMDv023v/6i2GgURh+Nb+zjeTySo04bz1RQqpyffdu?=
 =?us-ascii?Q?r6mjmEu79PqTW5a16d0dMMAamqN7vFlkzCRmTHH3lNSYTP+CDcftWnNPbvOL?=
 =?us-ascii?Q?JJzWCoVTzvWC4qkznJDarsKKvl9DTRoUwUmoEGAmHfkMCUqokh//OSOYW1hi?=
 =?us-ascii?Q?F45+0Pia24/ar+Rllbx3OW3bXldQ3CNmW7tVXPlmZSuE8Pxs1aDgwWL8P/xP?=
 =?us-ascii?Q?IRuW3ijhQE8WHtiol/XOYWQUv9sJEWzUkhtqOrfLhLpCvYdpXu+IDfuZXB1E?=
 =?us-ascii?Q?vnbAlIkk0/zK3mNeUKnW5ysIZg752H0QxQKkNwbzucPuhPI3OQVWqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFt2q4T+bY6Puv2Dyyz6IPMJd8AKG4RPkKgeNxtVoDDX0HKE23XVz32fqfk7?=
 =?us-ascii?Q?LsymTGO7W2fOXOLRXkjavMWH7dgQe/ZUzhS0bT/gf2I28+TA511oXVddGP+U?=
 =?us-ascii?Q?Y4PVHoY/glqLrtbpFI2zlupxN6rHw1lcyxwFvRsN6g19+ALb2NB9d5W/JeQI?=
 =?us-ascii?Q?rMHIdlm5II7uf7BlxmEEdZynTUOJB57GPZpUxXlPDjmrlpawmRFzZ0PpHC1p?=
 =?us-ascii?Q?gDf+lHY1+snwy1pXp6720ThZ4+O7O+nTKPzUv53qQu0dbvrGxSNqaDODnihl?=
 =?us-ascii?Q?dKTngw43qmAzWJBybBBnrtFLvuzZ974UmCR1/vJ/HOPcO935je4s/B5xF+4d?=
 =?us-ascii?Q?Oqg2yNhCk1d9oO2OJkmfZJ34zh+vU4vGjohluSiD78kjpy4z0DgMmTBe19Kc?=
 =?us-ascii?Q?Jvw7TVNLkP/qfuWsGW8q/XzJOVppVmz5sVqto1ncr0XB35twTWpihg3uq5l/?=
 =?us-ascii?Q?oIkgo7QwllOAXb0FnwRBgZYqcxjLl5QtN/DW7SplRJL7j4QaBdfy768qLL5E?=
 =?us-ascii?Q?I0uQsK7xiVfT7jPWF8ILsAoxPQOo7GFks2oHT9wkhweBk2Y6rXlwWJnhLGC+?=
 =?us-ascii?Q?SldvQPV10L+9xLH+l/NIO6t0Skj9jZW84L7AMLCY/pY2fOmQ2HDS1UXc1D+A?=
 =?us-ascii?Q?4Ak6zJDIiSr5CGr8zjSg7pbf4sT7zd+m6+yrOejYYW4LHUe5HNQnaiZJZo+N?=
 =?us-ascii?Q?J0P4J89XFSoKny/Uct1soOhy6+Hzp8rvOtAHViihCUd5M8finn0EdC9O6Jfy?=
 =?us-ascii?Q?VKdX8ZZesgk6C5k0ajyYFgJEQ5nJnKn3dvGvUzHxTnrfyOLP8SHox39+xvwo?=
 =?us-ascii?Q?TsmVmsQ/CL+sVj3SQYIWOsvUvIerGwBR2vclsnjDNMblRcS1UDPUi4Aiaq9p?=
 =?us-ascii?Q?CjnsLfORi13ldilM8RiZ3TkPlYzs1M5W58vyeuLylh5nLn/VBC0728IuzWcH?=
 =?us-ascii?Q?PQ1s1PgKXCOXhr4S24P5XM5pQ8f+X0YbNQlMeEaxVLgx4IgL2qtvDoxI7LAg?=
 =?us-ascii?Q?E9LjhDkWRF+v6XJguN5tvgk+OhvJ0Yp+unUMdfBZ7dRJ3xt83i3WenAl0fAs?=
 =?us-ascii?Q?H6fP1ZFktb1BAK96SuLv2v1QriPUWw0vBM6igNrGe454uGnZWz4RiyvS3dmn?=
 =?us-ascii?Q?LCGlLkaxxOgP/5kd8GkRtfsvEemE8CbbDg1GSVs4UMb9R+j7f0DRQBVIruen?=
 =?us-ascii?Q?STNHSSF7TgdtcOWoa4Emol1Ot+afNC1CkfvvYInnhTpEa5Ug1+sfgH/H1bFr?=
 =?us-ascii?Q?ZI+ErfdFeYyGNrnZaBKgnWTrPogo6OCmS5SjvyV1DzohB9V+ScMXphK9aQiZ?=
 =?us-ascii?Q?sii9c/+vapnS0jEyw4BDAbIIvLfd4ISwB9jqoeaSvisz/+Gg5kFp1PrKAb3i?=
 =?us-ascii?Q?pGvIvFktl49SGaqvOuze4vTyu0Cn38RP1E4GSZf8gpmcUELIAjDipr+5NaCN?=
 =?us-ascii?Q?f2lyvvhRf0h4t5qTypQGAuazb0KdGkHCcGCbuNJJk6etNe6eik2+T8cJlbfG?=
 =?us-ascii?Q?js2tLMdNHrqPVEbeBk+27n/VHJY6dTX+geeFCre1QoU87n2zE7KnnPhe6MrO?=
 =?us-ascii?Q?yWfalI0n3iJLbTg3iOqBwkYFYII8aAlT0xQuWtsHu8PdrLI2Mz/qAcAM4tQ5?=
 =?us-ascii?Q?dILM2Nnql6dy2sn9MrnIngI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7330c7bf-c974-4b38-c68c-08dd94131eb3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 00:46:39.8000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWDnoALog+aT+gLItabyzHXvvByJwK+Y/iLUAOxYRW0/gKVnlljIuKOUw66w0GR8i83U5kJ1ds2pP8O+dhnZ/H6NjnXMFf8w1rBjxbN2wwHZ92NQc2eWmYBAeFEO/vuv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10044

From: Srinivas Kandagatla <srini@kernel.org>

Qcom lpass is using component->id to keep DAI ID (A).

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

Unfortunately, current code is broken to start with.

There are many regmaps that the driver cares about, however its only
managing one (either dp or i2s) in component suspend/resume path.

I2S regmap is mandatory however other regmaps are setup based on flags
like "hdmi_port_enable" and "codec_dma_enable".

Correct thing for suspend/resume path to handle is by checking these
flags, instead of using component->id.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/lpass-platform.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 9946f12254b39..b456e096f138f 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -202,7 +202,6 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	struct regmap *map;
 	unsigned int dai_id = cpu_dai->driver->id;
 
-	component->id = dai_id;
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
@@ -1190,13 +1189,14 @@ static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
 {
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct regmap *map;
-	unsigned int dai_id = component->id;
 
-	if (dai_id == LPASS_DP_RX)
+	if (drvdata->hdmi_port_enable) {
 		map = drvdata->hdmiif_map;
-	else
-		map = drvdata->lpaif_map;
+		regcache_cache_only(map, true);
+		regcache_mark_dirty(map);
+	}
 
+	map = drvdata->lpaif_map;
 	regcache_cache_only(map, true);
 	regcache_mark_dirty(map);
 
@@ -1207,14 +1207,19 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
 {
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct regmap *map;
-	unsigned int dai_id = component->id;
+	int ret;
 
-	if (dai_id == LPASS_DP_RX)
+	if (drvdata->hdmi_port_enable) {
 		map = drvdata->hdmiif_map;
-	else
-		map = drvdata->lpaif_map;
+		regcache_cache_only(map, false);
+		ret = regcache_sync(map);
+		if (ret)
+			return ret;
+	}
 
+	map = drvdata->lpaif_map;
 	regcache_cache_only(map, false);
+
 	return regcache_sync(map);
 }
 
@@ -1224,7 +1229,9 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 			       unsigned long bytes)
 {
 	struct snd_pcm_runtime *rt = substream->runtime;
-	unsigned int dai_id = component->id;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	unsigned int dai_id = cpu_dai->driver->id;
 	int ret = 0;
 
 	void __iomem *dma_buf = (void __iomem *) (rt->dma_area + pos +
-- 
2.43.0


