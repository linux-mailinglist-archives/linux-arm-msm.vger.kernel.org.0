Return-Path: <linux-arm-msm+bounces-71078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A87ECB39601
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 09:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6390C5E5113
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 07:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1F42D838B;
	Thu, 28 Aug 2025 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="M9iY5eWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012048.outbound.protection.outlook.com [52.101.126.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC332D7D2A;
	Thu, 28 Aug 2025 07:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756367677; cv=fail; b=Z/75Pq+R4I0I5ksb0Tl/oT76dhtOOB2QB96jJOGB52jN5S1scFoawTt8xVY1DBctWPLzRGcyS9gnTXV9j6DC241knXifYzUyV6XvpiGUJAF6XI0ufnRM8kWpTogoMDqOk8PwvU0N77QoSUM0dCTK+hpgfgJbIyIjjYTdd4vUooY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756367677; c=relaxed/simple;
	bh=6Z9gTnMQFVKSiUjys6UZxcO3oh61l8t9zs/LHDoSofQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pn9qtljL6J6kbrqPbiyqY8TuYYfxKCuCZEb51gUywcOnz/kQ+uWhasdD1Fv13hY4NptcyEwiQa4XxZs44iFBYO2NoYsu6rwfzu6xCgKf2rirL4FfOwkS15pDR/YLrEV9gFxD/EFzdjw2ll4Wn6+iW15YF+qbxPZvACs5ka3rZlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=M9iY5eWB; arc=fail smtp.client-ip=52.101.126.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLPkexem840dfSYZs7ZrRYsWsOF5+ZA8ke7XD+P0Hx9kLh0A5rV1vvUv9TPnVYV2kwi7gtLlF7d+eorjVsyvoVKhXibwmkW/IGREQcP3X4BlI/SPg+3H3GZz2uNyEUpnSx7vnGGrayfXJT9zjcRcftg1ynQ/MO/w2DN2icZhwQukuDgPDzbBs9RNk7nVmeztBHUK2ebAgyjYc8yavn62AmHtM9y0L3GFolPO0OV8lmO4YCCSs70G2O2eiBcwyzv2o4VZo8390w73Ms79GHcnYPoT6E2HGKKpVIEgF1fuigvo8qG4ihR1Xxb4yjlRiJWViyBIxCNWA6rPdghAJfibwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+exmfFy50U66Vpx636GetyUys/+/8Ndzm5Raf+BPJGs=;
 b=CFNo6cCnTmBqaWdODc3j0PC8CZ44iAsNHB+aEWGVzkbNM5BjZDgyvmGWE7GIfFJYJMC4aQIZr738dc7E3LVkyPJumYm+BldhFavU9UjVY6S6q8KCQIA+zMrbn6cCl+VpETbn57bRzHsHnYGG3qND3KWJ3YcUnEVUoyw2oczlW1dpArxVVVzun60kLDvgwUvlJMcBsfLjZ9wp5jqazLEljRPztAbr6rjgrCgmBazoHUZna/YM+/nw6+G+ZKH75o/r1+joTspuGE/a6ym4vgXvsmDUhP4A83R07nAqN6lB0uUK1HDAyYaGsTXM51hnivlnud7khpH2+XtoviykZooR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+exmfFy50U66Vpx636GetyUys/+/8Ndzm5Raf+BPJGs=;
 b=M9iY5eWB6Q958JIOYDfzMcVXp8qto88Joo/wLvLzEIGUhAn5gdGAjgpNdZBHEEP71+ySdotpYIUi7EZBo4Rl2Sdhu16oftRpwN0af/wSMFj663IQ/KWyUl6tFFlhbrC3hrl5sPI6wyd3nHn+eZyzgjkCqgAW7/DW/GWHO8mKoGNXDKeHpagtTmE98MoQiBZix0a/bbDhSLjQQbzudfzbZ9HlBiHPvxf1bjQL4K5uHYLWBcTbdWhr+8X9AuUd2YypliVA9Ar/7PurQoRQoDc3a1X6uOVMoEwS8i3eRcBowwnVoJsjs8ga9eHqeZKXrdQh8egn0m1zNc1S+exidOvV/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB7035.apcprd06.prod.outlook.com (2603:1096:820:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 07:54:34 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 07:54:34 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 3/3] ASoC: qcom: use int type to store negative error codes
Date: Thu, 28 Aug 2025 15:53:59 +0800
Message-Id: <20250828075406.386208-4-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828075406.386208-1-rongqianfeng@vivo.com>
References: <20250828075406.386208-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::13) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1d5d7f-4ae9-4dd0-cde0-08dde60820ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wrjNAP3hIRz/GeA5P7aR22qnlGTXzQgNbz1/ZjYnH0w2PUx7SRdW0VtV2Hy+?=
 =?us-ascii?Q?tfjQnhftjGbZzwubOQfUl5hxcWF6SLjxE/M1CcihvZmzzFugMyJnBjlYb2Ko?=
 =?us-ascii?Q?KHbKzFOuyOREsb4kmmzajdRgG1NJKhnD+A0pdjnCi2mN+c44/TXNVtyC26hX?=
 =?us-ascii?Q?6Tg4MG/J+GdYXO8GCunwFlzzU5385qmYlRLFm8hy4aFYhxHrkJN7CmsjHp44?=
 =?us-ascii?Q?U/h1lkuJ/Bdx8Lh1wjbCm2z4qndkZIX2D68Ac5HlDTn55K6hzjj4uQUD/6LJ?=
 =?us-ascii?Q?aBjKx7i7XZEpRECyjxOaDqg9WIc2EM8GwoTQroq9bx3+3gla3zt0Y1BlDk75?=
 =?us-ascii?Q?ZTdgMYDFMAa7fjVexlopZqcemovOayPuKTFExZmsuFOjLSDH8vp/7LvW6Eks?=
 =?us-ascii?Q?qEqmvdJYhEaVbSoKbFRPbiVB8tUT1bjOHVr9eDTcSMrUCTNokl9RLl63kWS0?=
 =?us-ascii?Q?U3soSYKe5jm0oWrwqkCLwdiv4+u1RotOpkTJxwxfNcLmE0idTaFDb1MrQ78d?=
 =?us-ascii?Q?7uoVEPMop34ym9/OgQp9hSDWZJpvWPWn93EGnvK1ShGrqLONif2VJGovbsPL?=
 =?us-ascii?Q?UyQx23/VR5Cwyne9Rh/D2MCpfd2jdBm2Vft+LtXmwcrfnjDBFkq+w253y8A0?=
 =?us-ascii?Q?fnlveF8ky9RPwlv6/a7MiclEbVJbc+oZNda/RA6BDmokb7fyVgaz4Iny+D6t?=
 =?us-ascii?Q?+83u187+BXPALCbb8dyWozKjXrsr0uAy8obhYb4rZ6WhWeboHmtpuU8vLX4k?=
 =?us-ascii?Q?Okzxcj6VmMmBWaGh44mDbV2yywKidZxPlg0fbR9M0MOvNeneTOWQKM8XRqEV?=
 =?us-ascii?Q?FqY+mvzv/Yps/pTZU/0E14FxkfLGHVgSPuejZWZDHtJXsNJDCKhe/+i5AqIi?=
 =?us-ascii?Q?6zMczgO9jbXrbImJNKGcCCx7cmENZL+mBt3UazOtUfqiJv+wA4JTechxgqk6?=
 =?us-ascii?Q?pTc8WQCXSmjLVH9lIA7I3jlyE81LrDKv4mWzrTX0/7pWHsvC2kS7SSPfzAja?=
 =?us-ascii?Q?3pXDqLv7+DPQ4z0bDLawcM3H8TIxDy+3128ifDj/7j8ylcZzByEhFx3QJr3I?=
 =?us-ascii?Q?Ee8Lhz1ddjxVGZ45m7ZojC1j6W0FZ8ctyQBXonSoSvptO6Pd5NwwqkWa98lk?=
 =?us-ascii?Q?/J/D8Y+BiOEGuXN7DatTqvnhUaQA3RZhsWNH3tpoaJISDjMeuCiVS98v0WnF?=
 =?us-ascii?Q?HEppU0bW6BeXIEaEf/0kMTHs9U/FQRFRMeQ0Z1QAqbezgrQw8H49TTRRAs0J?=
 =?us-ascii?Q?wXqGrh1P0quoph85jI/wxpNcVjHYPCaoDEq1D1aYtYyR3R5o/rTZQaOE/yOk?=
 =?us-ascii?Q?CPdrChw7Ppa+OvpUaXTkfzMrxNa9MRwGErPFvb2lZEOw+Fh75uAR0hiuS7H8?=
 =?us-ascii?Q?qTX23G9RQ5MuHsEwijPSAGZJFGURVxqaY454CynvLHOpc2MgXZctwB6houmj?=
 =?us-ascii?Q?tFf9XeNWmz8CnqXhHj+uWHmvYOswse1lprXXeDTktaB0+Nxi6JgYaw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g+7if/bpymBk9EYVcZEIlXcI3yLZuCx9aXPOWRcrx13lI+7nyvIiijXokjlm?=
 =?us-ascii?Q?OdX8Wot8lHbIpcifRwPx7UNHRGBRJNspCXjPmcTf9mjIvMOFgShThjKK0c/h?=
 =?us-ascii?Q?vuRI2YIxoM2yngGtX39R2AwZi+fW3I9/OljfKuDx/6K0FPsNGbFGSbvdM8ji?=
 =?us-ascii?Q?EvS/qvqnd3Pw/aBfQyY1xtBLOZMFWkzNK15B97SvLfzoOG5Jja5I2ePAeb3j?=
 =?us-ascii?Q?S+V/wpIiS0JnayE1JmuwnMA/vIEM5pLtQromZhvPQ2YdGEcnJZFC22PHAxeP?=
 =?us-ascii?Q?KE4Tzj5NbmyosNYPeBHlatYo6MND3Q+oFBqfdpBX+uRDQRIo3myunp+3OfLC?=
 =?us-ascii?Q?XWf05eoExt7t33wZKqxnQQ8QWwkxerqiixULWaM4EQkpbk/AnOFPwVoF3xni?=
 =?us-ascii?Q?Oh7mjAwRDAI13eKb+CpDvFQ+Fk6BK51X8Ef5jumicQdIWorm16uFZtxpcfv/?=
 =?us-ascii?Q?vvVnB18Gy0f/hgkYGLUifh49rI45o7yzWoRnCLFvlNt34YhsvDRJhelfEsND?=
 =?us-ascii?Q?FEjyidI4jbmnr7NH2S0T4Pxce22mIcl4OP0GHRyLH8lWtPtQc99MBbtAtN0I?=
 =?us-ascii?Q?GE/9X04W1Mvm6dlFLKYAvsKVmQLR43rPpLD3IYq2jAbyci9izakbBPSky6Zz?=
 =?us-ascii?Q?uWt+SqcSmG5hKnObQ4iYpS6J+UjAq1PlxYAzqByWCDgplhSkVuM/IQWAGI4v?=
 =?us-ascii?Q?j17Tg4WhInuTERv8W+ysCXYLYvBokubCabIRpHaO+iUd2EAntBLkl/MEX2me?=
 =?us-ascii?Q?f0dg0pQDqw+npAyJZ+hFpG5UQmYlyroo+ngoT31VJTGn5rf9xTMPbYQYHE3t?=
 =?us-ascii?Q?xobuei9LrJIeMHLucOAd2kzVSJO6Eh0Xxwaqcd5O9Klf/15mf+uD5oOddnKp?=
 =?us-ascii?Q?wfTJpbfz1lCGGAmA684mZfC/GALQUaVs1DceoiBYS15D/WLNMEqmOJiRIjZk?=
 =?us-ascii?Q?cvuEfJw1nBZTs4gnFcgdOOSQMpx1Tc+2OQ0lgToigzvYKZCh3q0dG5kK2r2h?=
 =?us-ascii?Q?jI82DTsmIrDNZm+dGpNSokeUi3FFRrEnToVF9q4xbm//Iz1MOsFx34rhY+zm?=
 =?us-ascii?Q?+j9ltC86LsjJgmmoX0UKd2XnvFZNk8L+myGkNDV/s0B/7mf233g3aa0iWXYB?=
 =?us-ascii?Q?FvekTo4o5YHjXictHtLwgcsTTfRTtUUqPWtMJdbjUtknbCXJwcHtMgWVm6Mb?=
 =?us-ascii?Q?gh0+fWzIuXmutcqf+rt/kdYIXBJuy4INzSPTwuPQDBF9N2Gn5IeZg73UgnG+?=
 =?us-ascii?Q?5ziJjB5FZORfQyKaFAlMFZIRggbcjORRG9cwpS4AWwXMo0+fFJfRIWUkMkRj?=
 =?us-ascii?Q?d9m2Mb8QdAAy/ARABVY2u+kDMvaygFIBwR7kZuBzZyEEfjX8bKUB9/IO5eUd?=
 =?us-ascii?Q?vK6rSbZLkSgTmQszML20m3MjkNGI0AUPFy9R9saUFbyqmWq5TqIOm8q1u/Hj?=
 =?us-ascii?Q?w2FVPPJ2IVdhrSp7dFVzgwV5d3VPSjxlJFylRgRMxABqjXv8QJ0kzfNULEQJ?=
 =?us-ascii?Q?6X/Dpxx3rYwpUZUmd5ix+Ad/WStYjlOQuFw/d5xU+9TsFwUQ7RWWMy5TONF1?=
 =?us-ascii?Q?OdF83wXHtvVRwNwNTm7aQTMpQH+/rcGN/MLgVBJS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1d5d7f-4ae9-4dd0-cde0-08dde60820ec
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:54:34.5124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5b0j3LsV5np7gMQqfpbNTCYvIqSkxESqCX+Pko6HJH5T0iGgp4lMZZDwsWUwIakem/a97VGQFrb9TjIF91sRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7035

Change the 'ret' variable from unsigned int to int to store negative error
codes or zero returned by regmap_field_write().

Storing the negative error codes in unsigned type, doesn't cause an issue
at runtime but it's ugly as pants. Additionally, assigning negative error
codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
flag is enabled.

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 sound/soc/qcom/lpass-cdc-dma.c | 3 ++-
 sound/soc/qcom/lpass-hdmi.c    | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 8106c586f68a..2dc8c75c4bf0 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -217,8 +217,9 @@ static int lpass_cdc_dma_daiops_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct lpaif_dmactl *dmactl = NULL;
-	unsigned int ret, regval;
+	unsigned int regval;
 	unsigned int channels = params_channels(params);
+	int ret;
 	int id;
 
 	switch (channels) {
diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
index ce753ebc0894..6d9795306cfa 100644
--- a/sound/soc/qcom/lpass-hdmi.c
+++ b/sound/soc/qcom/lpass-hdmi.c
@@ -23,7 +23,6 @@ static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_format_t format = params_format(params);
 	unsigned int rate = params_rate(params);
 	unsigned int channels = params_channels(params);
-	unsigned int ret;
 	int bitwidth;
 	unsigned int word_length;
 	unsigned int ch_sts_buf0;
@@ -33,6 +32,7 @@ static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substream,
 	unsigned int ch = 0;
 	struct lpass_dp_metadata_ctl *meta_ctl = drvdata->meta_ctl;
 	struct lpass_sstream_ctl *sstream_ctl = drvdata->sstream_ctl;
+	int ret;
 
 	bitwidth = snd_pcm_format_width(format);
 	if (bitwidth < 0) {
-- 
2.34.1


