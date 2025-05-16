Return-Path: <linux-arm-msm+bounces-58155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A41C4AB9347
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 02:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 569D33B2D45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 00:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C994B1E73;
	Fri, 16 May 2025 00:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Qzodtcch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B636FC5;
	Fri, 16 May 2025 00:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747356363; cv=fail; b=uETrtXxEgffQY//nxY8xUXXcdapDK9p+5qmMGjn+oGU6z1oYa2EknaEnwuYKUd7OoPTOnjPDGiZ6yIeqQgT51mljUfdMBVdNpn7ZSkegyxFSSGyu+H5jFaoPbx4AaouKyycngvHk2lCNcW00Lpl/tqISTjx6soSfDOKjCdYubLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747356363; c=relaxed/simple;
	bh=pDkYC4NMRwxuLUlQjWcJzCnBav48h1Q70Zllx+e95Fc=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=uFfu1IhtplWy/i1p3MEmPvk3HDz7YgmSIoC70Vjnp2AHDw9mITRvfNTg4iopVlGio5A9VgU2RW+/nZHVaycwVlh6mjumsDkSuxhbu5U2/dSVEPEHRsaSn7WvFabl+itxHzgIkY5U9wvBkjHyyTOeenhQMFJm1djtkR+TVTaLGkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Qzodtcch; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGSBUrEEkNJ7Xa9ZADm7DzTwv7f9Ie9L1h9QkfgPeTL0HuiselM1igtBkW2N7Ts4jk3HXHjQJ1VgSrONOBuc14armWLXfYhNLaNOkwhlVMIBtGShhMLCLaishxbxFFHEZjRysO/XX5nvi392dAgh1EeQKzOT/kFGl8CoKdtxwWE7cglkf1IXtJpGGGg7MhVmFyj6MPUAQzQ81zVLrsAUtDdcjkadcz9XjcBVhj3p9M1i2Oa+u+Vwh5QYk+OPnAjAQImqtPKk7B7Lc1JfNYhNthergc87wMbhcR0l9Nwv0yF2e646F5GQBSQg2WljM/ezEhDIL5EhufcSxl6jXjR28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAhqNto/hRDn0GMdvZDoL9g8+YbuUhgQ6K9PVFQIgv8=;
 b=X+BDmaT8tRhrkTDg6UDG2GlGicbKW2rZ9OobnbB8JnNJ14LKk1OwW7boXsq+MsHUX5W83l4QdUdSbIHxlXko4gnFKJ/H5DNZwJMCIenR0gN/gBYBmZsKrmuvn7WCRUBZQ287z1/VZG0khcIvESWMb+ODfighpm0838fEDm0t4JfC785q7RNO8V1vQamfGbR2CTNcGReNKpNIe/xEFiNdqbQAo0Rv2YRetp/RnMC/WtHNPRbV4fEFW2cjaAGYuuBBcKpE8hXoR4XvwNQX0mF81FhEIwtf/rK9fcWxOUSS21Ks3NwdzYb7sgbA1514Q+qqpE5aQXCNno3TuQk0H4xexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAhqNto/hRDn0GMdvZDoL9g8+YbuUhgQ6K9PVFQIgv8=;
 b=Qzodtcchc4UMK5Km0jAAAA///tKdl5rMSiN63aLJ6jVeFrq7MsaU1cl/Xe+ailyEJ20vYsqrePpdq/RUp+3EuiTybxtALL76xAD/32Bzi9ol6BlI5hwv7aNDQpDrmLvMG1YmxlYt/dEMVxCbCPfgzY/agM8UBsQt/y9EckTiUTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10044.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 00:45:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 00:45:58 +0000
Message-ID: <87bjrttmbe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v3 0/3] ASoC: remove component->id
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 16 May 2025 00:45:58 +0000
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10044:EE_
X-MS-Office365-Filtering-Correlation-Id: b2863945-8a23-461b-fd43-08dd941305f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hx7d0syFz42U4bS6Zaki1RS1baE5PkfD9bO27idsvDkI54i3pV3U3XgIVJme?=
 =?us-ascii?Q?02uorZkWIXu2f7ensNDUcJ/drTwPgqnracLSI2L5gTXEVYlNLF7gUppHsUzI?=
 =?us-ascii?Q?nRJWLYULdSdvhzd6TrVX9829LNablJgHT62433ziB/aou0xb8PAT+JGp+FWK?=
 =?us-ascii?Q?LRkmHCbGKOO7DOwZI7icGqj66S2/4sOee3IP2UXhDfayGWuau/s7nkD4Yo+Z?=
 =?us-ascii?Q?KQILs2Q66PjxY7W6KJ8qe9AB4eXn5EWXsEvDKdUfQ42bip9DNLeB7Vg6RlQ4?=
 =?us-ascii?Q?lUEUkOe/EQbLGIio6H9+0YGqsfpjYnBr0jCBtpDYJ/m23rC/XUwhD5YAghce?=
 =?us-ascii?Q?92PhHOYxJtvY7WFypLyG3imCprtsrpkbfMBHpH1URt3gduASVzP9sQVW+YtN?=
 =?us-ascii?Q?et9JM1T18t+wr8WuC0Ia/i6xv5qOBH+V7dGO9VpmZIJTIGyI2+JlyCVhOhYl?=
 =?us-ascii?Q?kIWlC5buHqFitxHMq2Ka4+SsX48IkVYw2NY5uLwZeOQquJysAbq8ZjeWgOXy?=
 =?us-ascii?Q?HzMV4rL3QCrnjhoWDg4jXSuJeoLA200g48sGMPrFf6o6b8oIfH0kh46/evQn?=
 =?us-ascii?Q?4WssMNwjAaeZ20VuUEWYijeqGVz0zl8CEJ8Bp3Xzbs0psaYl5yu60PO6TO27?=
 =?us-ascii?Q?pCAFd9KBVPYXe/SV7UsPA4CtYlxRMjTGiP5YogxuUnNyCdwtd5iXuELM9BVO?=
 =?us-ascii?Q?OXAEQah2KWx1FM67/XWSEM6ldXxBaFYNh2/vNY/SFZaogdKOYmMEIhiZg9e7?=
 =?us-ascii?Q?2JVS/a7RjZwT7uR9glxbc76Wj6ZM97cI2ywGlfAOeAYinNxTgsoFZO9C/E2b?=
 =?us-ascii?Q?BzFjOTwSkywPp78DR2JfqWtE4S3yeZKsMYIEgVQix1SCQu00W/jDUH6bXq7J?=
 =?us-ascii?Q?f5uIDAQ01Qzc9MHrcwAzuEYddDpEnT3DYzq8P7T86Nldwpv2FVR5gyv6lKnw?=
 =?us-ascii?Q?3mP6CT5LKyerjX8ZVzF2qjwFeiEzcTLGzRPcJZW2lNQ8mpHDyaH5JCDviUCf?=
 =?us-ascii?Q?p/jCQteitGTKrRS97ETM0BSIeloiRSzfDH68L9kMQ8NiK8XRRqrs4+XbEhhQ?=
 =?us-ascii?Q?i3X658h481fgAc9hBofMQg3PR7YfrW8hHR61L7PhMlmmBya+ebwQ87ntfGs9?=
 =?us-ascii?Q?eCmyO8ZaqceqnOGm9FqZxveBVGRHKV7UrJ6hnXPu2Pk4F/mJKu19Qtm6DpUy?=
 =?us-ascii?Q?6CBOr8QKAb9BhT9eQ5EZc7GO4nFq6JQCV0akDmDWlZLIQTMX+P2X1MzACHEt?=
 =?us-ascii?Q?jNxA8s6IP528kb5vxWFu3xl/hI7Q0jv5ktAt3x2aI5+y77m6YxsG8QjfJDlz?=
 =?us-ascii?Q?nPivYl9Mc0v1ubQT5AclmDoJVDMxYQoBqViL7opXJTIjWhnXaxniWgispKlL?=
 =?us-ascii?Q?8fJJrAWGZtvudBCVR4BC/G+5WmiTeQqlu5rNTvznDwFYUt7mVHDIBN5HjKMY?=
 =?us-ascii?Q?7FfSV9MqLLEyIcCuikwNtL/uzh1HU/ajLSikpYV6oC0Y3CL7JnJ6uQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xHoSoZtkNb+8h4tNq+KzwvqEJIZG4XhRZ0AC1OS56dxu1R1T1/XDBzv77vKQ?=
 =?us-ascii?Q?ByhaED/8hSTqTxwHwtFJ+dNQ5OH1GhsixH5Q6B/fA2jzZ8KeGDJsNTSPRlMg?=
 =?us-ascii?Q?ETtMmEBWeivvr/okGlt4omkq/kzmsWb+1r4sbNGsn9GAoLtkvMwg05PQgjK0?=
 =?us-ascii?Q?mgSw/a0xRiWd7C6Cby4qPG/sr5y8u2irdHqehbclM3MiFL/G1SzdkqlL59IM?=
 =?us-ascii?Q?GRiLlReBEoFFoK689D7H2YUzNPwFL3bDRnAXJ8hs798aVuW5L9pyTx5QYNe9?=
 =?us-ascii?Q?bU2TE/TmGGltVXKbbL3TGySNwmiEOSn2qE8dfZOgMRaebI60nHNDUIlnDP9W?=
 =?us-ascii?Q?ZHPsOjvssLD/pN0uPfEwf7VEU/CuBXGS1IRn0L36TLE+V1aNepKK42Ees7YS?=
 =?us-ascii?Q?delbguZcRXj/gtkUKK7L9zAtbkY4yHkIL/2DfPdTVZmW7kxZ/u/wRSmNQ0/q?=
 =?us-ascii?Q?3NNy+Yyu4qmZtArGDqni9tLDkoAFfHTvvtTqDvyNgfd4Y10BckO8/ptNCblE?=
 =?us-ascii?Q?ubB8JkCOHiOs0s6Aoo+UdG0SDlrwoBJzkwEsH5ne3ahya4/4eRF4lAnAgY9J?=
 =?us-ascii?Q?6ay8wRIthcfWSG+6baf4sFpOHWNQ0tIdccCSv1YmYp5lxTiarA3J2glLlfyf?=
 =?us-ascii?Q?NISkEmYebs9g4Rmdm966e9xmy9/aJm61ICGZ2MkBjkH5DjamBfi3D0faUC0N?=
 =?us-ascii?Q?55ztcz6huwjpuFuoKjW6mwiHm4Rs2k+1A7M7LirFXWm1Uq0fetx2TqupC/JI?=
 =?us-ascii?Q?J2O1UcMTVaLxNPvq0xP2+u+6ZX+Sc4RXpoSqvmXp44z9Xo7Z5ITFNo1jEJUb?=
 =?us-ascii?Q?EVPfBJi+vTIivIP71ohi3IQNQXMq97NDjlSeqBf42REtlozIMhFmjoxPCAYB?=
 =?us-ascii?Q?gxg5Tr2J8sj8V3N5UUpfDaZZsLUcHEa9KXEA7HLIBypUMaQB5a33J7mfT3aQ?=
 =?us-ascii?Q?VS3x1CGq8dju4u+CI2pKVmccqwPcAyB9u2VphH3HpQbXrFyDE5S8wiVTxVJB?=
 =?us-ascii?Q?hbQ3u9NIVBYxxPt7VsrCsaQUVH7NsAM8P3ps3NGQsuxO8Qwb73pNR6N+NgVr?=
 =?us-ascii?Q?s4ziik6dRyAYx+VoJyFnJZWDc8K4NsaF5KdQ6eFRhyN0d3Wa/dOCsA80v2UH?=
 =?us-ascii?Q?hBYyW8J6fISvyLXuFFCdceDntehHirSWCU09bZpTtQUt7x3MYQQ07b9ci6Sf?=
 =?us-ascii?Q?lTVp1zKFu1dTpenx3t80edc7m4F3tEz9rDZKe9Tt721rD9398KHiwG6NeeXW?=
 =?us-ascii?Q?8gM+4C66/jpwy+m9I4jf5N/6rIvF4IE0V/BNTAaBIVetQaIQxsBcWO1EuMeO?=
 =?us-ascii?Q?Opwj10QgUSMqKp844gioYGwuHNzBg4opPwQK6sQjg5Pg63W6t/JSeD+T0Scj?=
 =?us-ascii?Q?TcsmnXU+jMB19TZKH/0ichQ5M5Bcy2EAi0SOOHmKA9mRNvDrnWz0v9AAstnS?=
 =?us-ascii?Q?i8jAYbBLq81Ig4vIb545XEZAdueIJmMsObq5w05upo1I1csELBcewrpD5Jfy?=
 =?us-ascii?Q?/z1MBCvU/VMHEdzxm/zI9BQHG/Yhh5emyNXyXwb/fCLbR/TY730Rk1rL1shE?=
 =?us-ascii?Q?kZW92JqgybdPQLnAFqQsG8PXgzX83f0WGyMpR2TaaHC6o/5wn9e/8UusLqVB?=
 =?us-ascii?Q?/h5QrBY0tUZzOXgi0T2bMrU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2863945-8a23-461b-fd43-08dd941305f2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 00:45:58.3322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qC4Dv+QxADgo2prFZIFfHIMSTKJm4IcKSceIGHgwYWBWmT/FgM+f7UUzQfb5dBQ9ox3sYjJBFBXGkj3fSUEwUg5ToesqSMftinCiJRPg117sxh6jUlO+llro8odussJ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10044


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

