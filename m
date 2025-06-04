Return-Path: <linux-arm-msm+bounces-60170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085DACD533
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 04:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 407471775C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 02:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E4623DE;
	Wed,  4 Jun 2025 02:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eAkmCrhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8B1862A;
	Wed,  4 Jun 2025 02:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749002816; cv=fail; b=DZoqTh54lJLCm5ii8vEjsQIOS0J+ltfFak0ESAK16DyfvyVzXp1phV6Zh6MkKadBRhmJ/h/DHnJ5oqkF1xzUYTMOa4JSOgzQnyQ9Nxd9hman3T+jxCmEbsvKQimBMTNkshGXeDRQoinYCY3DVWPqYrQ0B/PALcztzaRJuf4zs9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749002816; c=relaxed/simple;
	bh=afC8pRLh5ZHy/igJ4cgYdE5wj6l7HB4CV325qG5RmG0=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=miwJI6jRpa0obasF9MYb/yl3bPaBt8iTQAklmS8KOa4RJ3mnOa44SbgfDIpBygpu2fKtKOKxAVVJXNSkTBvXMsroPRpfP8uZdqXQXCyUYKmoqF8d/+A+nvJNzaVnd/nZ4Oh27hDv3c038rUwitVYm+773vuLBpHqvY5M8QXucPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eAkmCrhw; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQqoqRvewknPvfvRMjfxc2JyKCMoDCl2dvov6J9glfx3fL1IxcEXV0EgFj1tNUH4HfrGHooSirsOFp+PT+bGqDLvnxnSh+z7gVQq2/jqjKpB4CgHHOhA7oTmMZA5haUjs5CHe3LqWOO4NCfxS0tCoOCKTn+o64mzX2v7lXyV1lb4nmOquEbLooHrJWQjR+YsSrk+tlgBvBW5Or/57BkMNVT9NmE4x4gEZA0U8ecd4cp8BNosnJDLgl/ER9a5vOtxrL848SBKSb9ZOSua29U37OxuN1WkNTrXtkxJBTYjzZ8vr1Y8bwO2kDFgN4HMaYjGwCmTEEKet/rM978LkD+diA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p56enTjBHJI0GDi+KgUPkgaxB5WRAtXC//u8h6eF9J4=;
 b=gznBSJ6ny4fuxzkFnSxcJwMH4JNm1jZZZFDrVsG5A81CKYsdD4tiM/LF/aQuDWhjOEj9fX406nDQVavYSPwtiTyx+/C3Dn3XKYjWFmHA3TfrXf3lgl4E9tMk42NG8ATIuUpPUb9BckLXiSMc7p2xH8IGXLdgndUcR7qnTgzwQGXBkxUiW9lxPcyqumPK/7sAojLefcVZz1nBYn6kdL+B0ZiggwPg2+OLMH2aRLCvqtjr+Z85oMy5Xra+N3lv/G8Cz8cvFPlvANeQHHDdhFokm4HA51hZB9Aqj7Xi9ZVq2mAod7IelxOTtr417cCRY6sVgvHnU2wp67DK58mwvBllEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p56enTjBHJI0GDi+KgUPkgaxB5WRAtXC//u8h6eF9J4=;
 b=eAkmCrhwMxRZoAuAf3Et/LjsGiQBztDIs/QqdGm5v10XbJUzXojWuVT3wpYIfaDITfO/RGyv1gI4XzXUQZ5ys3S1c6B7siNy8yzkgAuCdjgYIY7kNTWyHx2HsCVm/WKOaQN1i4zckygkhKNsnba8z7ydn2gDFarmRGZPNp9XF9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB11277.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 02:06:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 02:06:50 +0000
Message-ID: <87a56ouuob.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 1/3] ASoC: qcom: use drvdata instead of component to keep id
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87bjr4uup4.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjr4uup4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Jun 2025 02:06:48 +0000
X-ClientProxiedBy: ME0PR01CA0030.ausprd01.prod.outlook.com
 (2603:10c6:220:210::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB11277:EE_
X-MS-Office365-Filtering-Correlation-Id: 3804ebca-2e5a-401a-5d8e-08dda30c7807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Pi4uHBz83qpY6eri/354sqtTfE7OsDwTaKtpTWq7JOIb2YmNDi8ReKh8cyG?=
 =?us-ascii?Q?xlnHwhNiRF42yvmJS8rw7+BFdRnjS/VlDaaOmyd3lRbIraVbwEUX8D15DRbC?=
 =?us-ascii?Q?8hcJfzcfRye27OMxq18+SCmm6vmzgqKrhkfGNZRlaCrevngacSW7LB9KhjfO?=
 =?us-ascii?Q?4y5+NHbqHfI1ASrLL9Z11jkIGjNCPoyHakd6F4bD+yNWY+25fhaLaSkbQmam?=
 =?us-ascii?Q?z/CnI06XNHf+oBMAC8mmU+ID1mzjzpnAqvgBmVzqdCfA/ZLBvCGaVT5yJ2gt?=
 =?us-ascii?Q?PsWQt8+DjVTI/xB5hYqA4YiC8w8tt1GHTD4wqSz8GDs8gNlvw/liMAog8jJG?=
 =?us-ascii?Q?IVG8Fgm2PlPwIbA2G95L/oLcqf1+Jfsr4INJKboG++i7IIgGugHIVdmnRMnc?=
 =?us-ascii?Q?Q5KKulu+V0DpnG/T3sa0ae0WFIU+z35sjDIgd8dgqptHCVRdRHrHYLP53y4D?=
 =?us-ascii?Q?YMBV5M4oFY5/nc9W1Rav4KEeekV6mJmyEGfTM0VmqpZCf/eirrsvKNUjUGIk?=
 =?us-ascii?Q?76z4V5CT/c/CU8hxpJhxivfQT8/p9szwJ4E/aDWCe5LPmLwqmoHUrj7dHQjV?=
 =?us-ascii?Q?URRNq6qC8gx/rbKIrwoO/z6Vyv8pH5EmSNRjbC3QHgPSTejIbtiUmklqmsAL?=
 =?us-ascii?Q?nXRbaFIkCZW4uSKVbdsmsMoSKLMVBhbXmNWM4PlX+HANsFZsItxY5IbwQlOL?=
 =?us-ascii?Q?epnkvtoZH8s/40WdOx45/ubHTNm2gRsYL9HU57b3Jm+jZrF7DivpkGV0dPds?=
 =?us-ascii?Q?EceMI/GOfsWXRlGb32Xf4914NxeQ3MRKyV+SqM8bgI94gHK337fdjzn/DPV7?=
 =?us-ascii?Q?wOD3lJb0iMD833aG9hAsPhAhmAPNhur70MJFPkX/vJ2AQTtRDyZAEP8ldjqY?=
 =?us-ascii?Q?zFUiyFE9w3+5L0vRFDnwswscYKBiDF1nJJ4/DqUXmq2gU6z4LxO57Ya2zxAG?=
 =?us-ascii?Q?rRpBbP3e37B/cS+PdHj2+NOn5LQWA4fMLUupDyeBqPKIshnjLshcxweoR0Zd?=
 =?us-ascii?Q?uj2nibj1hW/Tqk177mnoJfJsz/36MXugw/fe8Q4pafRv684bfOQ4OYcQ2TKy?=
 =?us-ascii?Q?m84Leo3TsOea8XXw5s3dUjUUUvUXu8EW3loe1toS1hd2PpWbwhBQeUB2N3Ob?=
 =?us-ascii?Q?ESr1EfvCkXb52n65JRrcWurulrRxS4kKA7ztj8Cz1RuLV5WeoTtVjSnaSoSY?=
 =?us-ascii?Q?YBYFd4nroUUZ4G5s8Osa7N7W45zG3zzW+35OrXiF00XRrdOBczMDflhOZRLo?=
 =?us-ascii?Q?Lma+LT0V4v5mVRNyUoQvhXuQb2MQKu6d7YSCbYTWpHKVdn+y8LCZPtUhxcXw?=
 =?us-ascii?Q?frycYnb6S0AjD9fbiat/P2elvF82M1tj5ynlCye6anZZvPNBHZJdHLAJopzj?=
 =?us-ascii?Q?IUN7ukUVu8rBCNcJ0XffWBVlnBSqOdIxakgRzib1jp7cnjdwksqL7jBYgRCw?=
 =?us-ascii?Q?eiF0uRM7b2KOgIHGzt5t+Eo8NEyBZE4RLtOPl4/r7cVelxRgGh2ehwIhxEuh?=
 =?us-ascii?Q?bEzon7N+AaOXAhc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7QDQ6NBJo1ycQk3XinyHXhPN+yWjjBTR4zcMZ5u9Sz/Wc/0HovDP2cNHeVaA?=
 =?us-ascii?Q?pdIljb5nu58YNwx81vSYJoWUU6WYTcdXDf/bmcd2dE+ojVSfxTAiO6y6qU0o?=
 =?us-ascii?Q?M4tLv9rcSNn55Y0aprBmbs6tryMi9oVUtoJdyMCqLggQlShPQPS2NbUFIYi3?=
 =?us-ascii?Q?h22dqwr/vQdOuX7cShByJkRaGAn5YJmzr6+15cDtkdjoQ+V6QxPKRR1k63tj?=
 =?us-ascii?Q?iLddyILzv8qf+IEEQspzkHXOuSZ1CYV8Ia89ezXhpbT1spsHkZT/ioNPs7UP?=
 =?us-ascii?Q?C4vzPn5h7kRSv5EZmM1roC1nSuuihiujDruzWQG7uwHSSkCbApEzI/VAxNN+?=
 =?us-ascii?Q?/sN9hoYEvX1V84kr8gOWPzOlfKAlRAXi3SuAgAuzAiHFosiOkO4R+6ImTDEH?=
 =?us-ascii?Q?jPboM89CEMcrnNEc0VdcV4Qg9bys0cS0Ns7h6zCSf9A2Dep9WUL3KYmvguTM?=
 =?us-ascii?Q?QJDtnwz8I99MnK+Zpx1G27Mv1PAaVxdtu3kQJSD9qg8MZ2meNOOTxa8eowbU?=
 =?us-ascii?Q?RwtlzYTycycLTuzxnpWKXipQAcbjz1FZ/Spf2KRAtUS0MCWjrxJjHrqXS9fI?=
 =?us-ascii?Q?zPPMtbKzY6rNRdxa1IrR8UmPxRNCGSAO4e6mMTKJzg5j09U+iOZDYQmHV+Qw?=
 =?us-ascii?Q?mSNneH8VFGP50rl6m/t5HDXUNPApgPJ6oBM0Jtg1MnsdzA3X8hiRymO2PkVO?=
 =?us-ascii?Q?RTHaeyQNITSk3F8TWhQggNgpRwEHAKibh/6nAzn4KS+tU+plSG5Bvd6SVbub?=
 =?us-ascii?Q?MoDHkJfSqR/vYr1Leb9IAu3cyRMWlsdFX0miQCyCt76MErANnWXpMT45VFTN?=
 =?us-ascii?Q?yUcONB7cz5jnqnnoPT5o/urDMVxYB98rEAuRZI0/+zb8l5T4Y/HEJ3NnE6Ds?=
 =?us-ascii?Q?Dfz3aB6iiOAIQZgpiPABgvWRi6+r4qxmRGf7FFMbju+l0uxn4h5TneNMivMS?=
 =?us-ascii?Q?PG0SE6V1i0drUECuHsMNlVh9N7uCo/pH95HfKHaMSHjeCaASBZEmHJvzpB0Y?=
 =?us-ascii?Q?Aqo9e5T8T+VXGl1fHrKzlQduaL8+lCabdSL++BGsC6sY+fJVucy34kjqZXUA?=
 =?us-ascii?Q?8nsuxvlYi01j3Gc2tgPo4sbmqTG92AeTuq22JQG/DqaRNE5BlK2pLrzW/LcE?=
 =?us-ascii?Q?ni7aYEFYuFErFVtErJgD6Y+tVcfxb2UzFDYEtRQz4PmaSRuoGy+wG2/q1Ldd?=
 =?us-ascii?Q?3uo9deuH6CK0fu7QrpceotVaYy6wesImYgvsbMEAVkA4zBbzarw3AvLChT1B?=
 =?us-ascii?Q?thnE2jeXB48BoAsU0lUysNwt/yuqethM8IOKHoeQjMqxUO3Ab4oG5saW8sBG?=
 =?us-ascii?Q?HiX5RGUxfBxxCifdjSRmIEVDLuRDCkANv9uNO4RBL3Bf7AqgIQ2vlKSQtUEt?=
 =?us-ascii?Q?GsQQbfJptsW9c0C8UwVb674ZvNg1dSrA5n1QX4G8ao50F5auqk54XjpBJzOq?=
 =?us-ascii?Q?sPDcdNrXBRjhvAKQXSOtddHQfHXD6zrDjJz6ON8lTeyTOcTVhhXhk50SrxEr?=
 =?us-ascii?Q?Mf5aiwLNyd52o00UHiS+D3iBXTTxGcqd8M5vKjDWcIyiFXppwR38DaIP0cI9?=
 =?us-ascii?Q?4oD8Mr/GxzaeO47wBOwxOJ6ndLVVGG1sqaTiJZfA6A7APrQlB1W3HXLB/upn?=
 =?us-ascii?Q?NvxnWqU2P958f9KqztsWIK8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3804ebca-2e5a-401a-5d8e-08dda30c7807
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:06:50.6587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gK6ITLIzXXo/etEnSbmgKqfVBmB7OrgNkqyrCre2IOOUMmaCV/4BunPiHC5E6SCFK7+BKDcEWufI+avF71p/4V2s3Exc40Ei4mGiQBhxSS9IwQuW5wi6AL6oukB3fxXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11277

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

Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/lpass-platform.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 9946f12254b3..b456e096f138 100644
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


