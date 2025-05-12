Return-Path: <linux-arm-msm+bounces-57567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A8EAB2D47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 03:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF4003A672A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C144D1D9A5D;
	Mon, 12 May 2025 01:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WUERbsHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD51AAA2C;
	Mon, 12 May 2025 01:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747014205; cv=fail; b=PYw++cJtM8Ewb8Ug5c3oLqXK+BuJHA1hcntLbDFqA5KexulBLgM6PGY6yGv1kKG6hN6Rjx3lkLU5U3frTSqJzMptf8KJqMO56uHBS9Mw74cSocEIvE3Oy3+us95pJbUEc2dAawFgcHu1tDeSkAV/CbC39TeoBbHhXGMhuYbI8Dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747014205; c=relaxed/simple;
	bh=G5NkigIiAJsmcR6uKMZUxJuqkERpAYkfE8HvbouCzuQ=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WqqxLVN8nCkqPUEEpBUBtxH5qlqdGV9QriT44mGQx6DxI+UqTCk6ODKtbycMXh/gw2XzyEH3LcBsJr15lBqOF+QMH7YO9KTNR7KQWsiih3UmMzxNFv1vHJWdp/pOB6yMMcpKtTQGAlx1kgQ7YilF25I4USwCLj/ebM3DFYS67/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WUERbsHI; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tymDWNAZJyub+fnKaC+6rf0FjIGHkraNSWyvM34uRq2Wk54IGAJFJfz1bcrLWRTviUF7figEwcqK42VJ22x5TqTH1Lyk2QuH5lUikgCfAxNRI/Ow+BIe0P+FHpKNE5cQvwpQmDMejqNYDGeRqQ3tUVRa/VkH2pLly73uycDfLWf1Vxhuuqlu29OE9CWqVG5syM87D48ihQvOD9tYaq0biBAa7NP9Ra6nPqvQ+peYUsDmXDIhFwd5lUez3Rq4sITwZcrGa10/bV1rL6m9zHih1EgdxPv9Fft/HHtl/OKc18pYE4YtrOP9pMuPTrAMoKcdjcanNXuiQIuAJQ3jq6cizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2A+3f6brrXENM1pzIHMnPOfauHrEdoEumgecM4pJ0A=;
 b=svfRwIVp2civYzXen0xhhXId7RZq7GC1llPmBxfAVkxxF0u7MVAdmkiMJFW2gTAEKbgZos/Zp3g0XSMy+4zNNy9FuR3KNr4MraQCCczOSJLUIs7BMar/xdvNJ7vZyxGJLsLrHoioyaUq/qOW8fUaBnk1q28bjHYxLFupAPIxFCYhHO0LyzIGJnQZCA4r71VJgJqshgjcfWV6u4fNo3O2zEoyHf1obMBLGloTX/nuTeIkQxXyS5DpShfQYbndbun0jSU/8ZFzfNenxvkj+HqnH6BKrDAdv2+V92sW/980Ledm63FFJYCRIxZSlB/SANrHIWBOKoywN+X4mqsddGml7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2A+3f6brrXENM1pzIHMnPOfauHrEdoEumgecM4pJ0A=;
 b=WUERbsHIMd/WMpcUumfHlO96OEjYA3HhG8ZR16g/a4s/+959svmAhdBRIfrqGJbQrEF4K1y10vtDBTfV3nQ89SPhP3x88//biEBcMKPC1o6t9FATI1HSDBttU/tPB8z4p2vP5wUhIJlDR1IlQHNAz/EUskmFlNZBbP5ueFpVZX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6824.jpnprd01.prod.outlook.com
 (2603:1096:604:117::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 01:43:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 01:43:21 +0000
Message-ID: <87plgey56v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/3] ASoC: qcom: use drvdata instead of component to keep id
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
Date: Mon, 12 May 2025 01:43:21 +0000
X-ClientProxiedBy: TYCP301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 77497bd4-7221-47a0-954d-08dd90f6606e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SyaeYwsU8JhSQATKi0FDqvEnVLV7SeL0P1UEsGi4/C2A+CoAywmV/6ZTz/DP?=
 =?us-ascii?Q?1YlmtcwsEHaWYpxvCKFIeEKFQ2ir1neys3TsuAP43iJZLkUvFcstZ2JiBl5v?=
 =?us-ascii?Q?egQ1E8PVzqkTpFiBCM6ThxMNyTzMLErEkIIXWaDzB5EwJHd6Iy1aCZ506J+m?=
 =?us-ascii?Q?AnRD0JZAobcZivLWMF7sFqYEI+cDtkG76vfk0iWjJ2nD1Az2KlQnIcLc36v1?=
 =?us-ascii?Q?ogkp5ijXqZpR5HT5yNFS+qm/nyAED4GEFOooJ636vnLd4bdyNEenQ99rFi62?=
 =?us-ascii?Q?Q3gXjhgAJGLTC/hRB3X0BiGxAyFhINn+lOsDFqzPEbjuPSEVhpVw0/faPHjK?=
 =?us-ascii?Q?R9C/rFl74yBgN28j3Q40530VeJpc5c/aINIPndIC+sJJ64Z2iIdO4/yYA3F4?=
 =?us-ascii?Q?cICJfjkegjC+apdSO7q0zOxJRnVf4WjqjuaVFOvrZCzjP1b+An1OXRuuB54k?=
 =?us-ascii?Q?1OjjVjHbISH2lSwC+0n4653GXPKL7NddUU5eaDXaVJAisOIO2FH5Z5CNWJq9?=
 =?us-ascii?Q?ptj28w+/qsbp364StshpziI3Fx4z/TDfUqwTF7HNx9mnQubdNR1HxT7OzPOs?=
 =?us-ascii?Q?UwmsyYMY3vb9ypHprcoCjMZDJzbjRTyUXluuNzIG6+mYnkLIGC+W45TcuPD3?=
 =?us-ascii?Q?JRgzamzMubXSQYGzj43TL1mvfSP3YHvcbjPZ0eQVowluLhpc06XlT7RvUScR?=
 =?us-ascii?Q?nNHnxB84o/Hzv87zethaFfNIg9L/BN6Su6u76LeayYKh/VDx5MORRF7Kw0qE?=
 =?us-ascii?Q?A56zoyiKENhDX3fvFeiAB7FrQrDSlE5zsXQRgJ94gikEu87K4iRbI+47ZO1b?=
 =?us-ascii?Q?sNbeJznU4JV/Lb10bSPOd3UJoN2ZOK+BW5YdaAo6KM4mB6gdF1RXQZ0CtRoJ?=
 =?us-ascii?Q?hexXE+36tRBwgPnU4oazxWRngLIvuXns6NAoJYMJX5N9vVhVcBIEz7HmsnCD?=
 =?us-ascii?Q?nreBvjPUhUeH+XcAErAdaSvPhDPXQDI7xXPyJ+njT7P0LM3KvKhvXy1szoTu?=
 =?us-ascii?Q?3pFwW5giBCDdE/jJ/q73KAaDihlyMSvcFZyHxF3Ol2GSeUvrqHbe/7uVGILD?=
 =?us-ascii?Q?Oki0e845ogHP1QVZQSd5BBKXtiYOGkR2C7kKYXLe0Uvr1lARWHFuMmpf71Zc?=
 =?us-ascii?Q?uK+iqYxqZ+Dfky4lGxcdbyVasOaYFHtEXzubNrHLFp7+N3aSsvPfX+6MV62f?=
 =?us-ascii?Q?c1okruahicD0DZUKncguTjD/umIRp/ELCv3OuSZApwj38kd/MC3Qh511WzdX?=
 =?us-ascii?Q?G2fbHWwt+OZ/VOoGlreAOar0TJoBIonKzjZqWefi8196OEkpzb3qOaQCGU6W?=
 =?us-ascii?Q?JUR0dwf4Dkeut+B4lKyWo0mr8d5Q/iF5tP37PTurR6asy5q3CNWGPwHK5pkC?=
 =?us-ascii?Q?Uk76BZTt5RHLaGpnf9SKXgheoR2F2O1PmPkxuU0IJYNZ7c5k36XPsWvX0Tsz?=
 =?us-ascii?Q?UVwOMg3qDbai5nhvRXLNQEYTPs1tDP8mJ0UCfagdZL6qSTEOyx3otQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K439LjN19A31qsaSs18ZsIrWgLLFx5F6waS1wOGhGF/sOz/hmdUlRzzSvBbI?=
 =?us-ascii?Q?bdTsQPVkgEBb33IBoAV1pnTJiL09JPxAjoBdLKvusvJikPlKA1zYft5V5EnE?=
 =?us-ascii?Q?NKXRxfsdqyMXmAom0LPB32SL/tEidjEtL7HUoqMEbzd4iNtW9gHAYQ830TFi?=
 =?us-ascii?Q?jeXN7nhJLzYuuJoKIWrqQqAoPGvSQHltNJBFGgU8nHGPBb8qt37PGqcXIjOE?=
 =?us-ascii?Q?tcsopHhtLDL4bzCkkUEZYl3sIo4S45YRDdt9wqdY5wA1xOZE8TWOzTcFSuz1?=
 =?us-ascii?Q?yHvWhQdbSMqngnQfEjESD+ODvtUOxbdQv1G2j5IMiRS02pitbLUUqx95bDsC?=
 =?us-ascii?Q?k754QRDn6LNVO/T5po5lnRjbKZdnaOmXZvXmIMp0ATvh/skko26XasZSMBXD?=
 =?us-ascii?Q?hK1fyymiv+HImsrk997PuYvGSKNl8CiRlHgknj8pHryGzMDUIQKLYhjOkO+y?=
 =?us-ascii?Q?xLDOogJMz32Qj8aAedcxBmQzZy6ls0LXUtFwOH6I+eKlZ9UNN/VJuPMVxtIi?=
 =?us-ascii?Q?1zHfjFQhHrDANYFgWqksxHgDeM6b2h3TQrIcGCdPTKSvIexL8PA2fSaHS1Ra?=
 =?us-ascii?Q?9OUEYLSRln8CL6+9u0LS5lCQvyaJpREPmoHaFBf9gG1g6uTFZZIRN92+b3Yj?=
 =?us-ascii?Q?jVhBu/n2GbLjv6Ck9a8ChqypJQuSVAC7WnFBWmyR5YXAjzjo9uQi2wtaFeGL?=
 =?us-ascii?Q?+giSm5n1IIWhMnlFdF1h4HPO4AbyQZ4aO3OGGqwPqJPvqce3Y/130mkVQ5Xn?=
 =?us-ascii?Q?6Lk5tn2tHgSVym8DSTDAEc2YNUm8puHPER6D4uCzbGNkF4QjGgC2fP0AlFXb?=
 =?us-ascii?Q?RXVmQkLhP8h6ZhNkCZHYNSj7YJX8kU60dR+8zmHBbvXUq97YO16tRR2Le91P?=
 =?us-ascii?Q?+qNuPCtEtabrOC0WgMeE2EyKi8URfVNdOnvNcCrV3qwEy6EVZh31HLg4K5Tp?=
 =?us-ascii?Q?Gd4o06LQrPZbLey3LkyhkFc4vZHY9FyS/jaSMDF0P4FjBMsxVspGFpyO2UDf?=
 =?us-ascii?Q?WCf/SI8bMXKgvuxcWCq6Fw0Fte9NQRHoYg7ZHFaUAfTtWKh30FkNLH+xBA15?=
 =?us-ascii?Q?72WLiJwOAsiawd5yZIjptImXQq0pi6c4Z0r8JjK6Ze5029m1p7zh2qYUnMQJ?=
 =?us-ascii?Q?0SsqSq4ggyMcYbBCA3E/m4vOOqnMaksuJ24E0Q8YR4JSVBJtER/aM/2v+zKA?=
 =?us-ascii?Q?hXmGCrOuFQUEDvvw/mSS1M+XNTXbMrNBIglNvSCSSEiI8gydANeGggnX0QaU?=
 =?us-ascii?Q?7Chu9RGRrlKhPY8zp5/uep0zfds1RvAbWtasCe3S3jQkSK4iE1M1Km0Tuc2p?=
 =?us-ascii?Q?Q6smj/rafYK3CEt54Bdl1ZQ5Fxxf71kqIjUVUTnlV6szggUx/eh344CS5pNF?=
 =?us-ascii?Q?fA/fYBSDbSwlajB6loOpn6KL/OfBmKniKyoX+03AZbAJM3TalNOxXQy39AR1?=
 =?us-ascii?Q?18ZiJgv0Rv+b2NWEB0/LD/hu6n/qTHk9+8o9XfnaYa64vlqWIifm8QOBkUnt?=
 =?us-ascii?Q?dyUND2FEU1OH/Lyke5AEyqYqKzbWIHswMmg1wuaVnutxjzyx9+Pi+dp98z0H?=
 =?us-ascii?Q?EK9T8N3beECKudZo1+uTnSKXNycZQNNo3eIdX5Cv4RRgqqmtAcgzwZRtcwg1?=
 =?us-ascii?Q?te9Tr1/4YMgkkUW8AK1FHOc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77497bd4-7221-47a0-954d-08dd90f6606e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 01:43:21.2970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNAIJiKaoOChXCA/smNyWbxH9B9LMCtANnztBhPPL9I37WlXTYObMoc0Jr6kLPlbSezigkiyT47GEWhMnLQa/m9Unz+vOtlg6C4b+U1sIFFaSk8plljM5F20r7CtoaIF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6824

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


