Return-Path: <linux-arm-msm+bounces-58158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E05AB934C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 02:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEF76A0054E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 00:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65047DDBC;
	Fri, 16 May 2025 00:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hStKVzGF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45CE55B;
	Fri, 16 May 2025 00:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747356418; cv=fail; b=OoZ78fsULvuP+iMaxrvK+fVl8T8XOLiDYU6bc9iLa3WEsFqps78/pPpohpUM8EwIQ4i/iRKuxffgNSi217E+wU5DPjZ3k/rnB1repK9x3IoCk+RxbulgIb+LtYtTXHwNA8dVQwW8Mc4XrUvHsTnMZWoUSWBAu/+8g5Ew34Fb6AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747356418; c=relaxed/simple;
	bh=ZORfbgtL28zWAsWqPJ8CayE7dMYJtSqaVhfHY+ulevk=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XtuKgq1KYONaB8zwBIhLyGAxP5iiMNMyNDgoKLv7L1p/FkPjvZmp8edhyo5t5UOEcf0/92nEA/VAke3N0G/U9IPIKIVrHTMAaRM5DQ+GMSVi/ht6EvriPKejhSEtbRyYbCgJixj68xaybRPJpB1Mak/0HIFhlL6qOtDfoNY0bWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hStKVzGF; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckXI9m3NTze2HmMLCcRo3up+CszpbCuLL0wD6XqsckRi+aAKGUHkOICC7CNaCYWOqGH9fzkGQBXlmHwwdasx0jbhxSQl+tGli46eMpFHYNN4E6jAxzdcVTt14NNSANYsQwSzmUiPsERMLqwOu9eYobjypzBk+ufQnMzqEqTBqEa+diSZs0pDzgjBLpQdaBlC0VCBQctENvA2U5L3KOrx0YkwdS65NE8P4KaB/53p2oYaQk+XvtuG4AtyLz2B8LoGEXiQM0ClWn++d45pJRTsWzc32C5Yh6IRQVGhh3PzQRdj52R2HAc/SqhSbd5w0BgIfYM3Py0zIdFgR7IlliyWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+rhdbHwlBSNavPGZWUkZlACZbK8meu9lWj+oCBPckI=;
 b=f2oA0bGRUoaZTwcI4LqKEKcjt0omvkuUB8eAAAuFMxBT6PPzZB++4TrplKJTK8mp/8yCN+T/aS+bbk/fdu5ac3+GkpGO2a6crSRPDx+7CUsdxho/0i9gf35PemXxc3WJvjTKFdq2ER4h8Fb8yarqedBmF1lxNDvFUk9XVmjtCIsmpb4jQFzDHWlF5+5Gu1ybF15emYRl9h62Ib2ns2x4JsTVUqTdKlDyzKypmUpwIEwisW/nXXLqXMjFfAg0D2VOGyXH2IfH/LfwxWxTdszarnvnRERiZpoLRjbABR7oEGQz7snBPMZW69qYx0G57qo96oM3w1GyuxKHa7ihtdOx4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+rhdbHwlBSNavPGZWUkZlACZbK8meu9lWj+oCBPckI=;
 b=hStKVzGFrYriKHXLbDdm1otelrK3fkToIls0E+LOV2FUZ3pxJKTB2NxPGpbhpBIZzbJE4rkpS2gB00BXrhtpf5jdXyB8ZqfNxTR0wbiZGyCl4V5lKaMmtAZcD4A9C2xXsLywcsMJJjUb4oFk1QU7AZB65rkLnt2f+14G+L+ygis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10044.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 00:46:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 00:46:54 +0000
Message-ID: <877c2htm9u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/3] ASoC: remove component->id
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
Date: Fri, 16 May 2025 00:46:54 +0000
X-ClientProxiedBy: TYAPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10044:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c71601-4ee3-4934-4c91-08dd94132750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X9kd11UO2EFEyK54S34jOBeP5+Z4PXCqyRF0fNqdWGJhayHfgxT24ph4XSmW?=
 =?us-ascii?Q?q4Q/bssplb0WAHG7JbdyLg50uQphv15yxLyxhgttNvh5iu4nPIc2/q7ixxFD?=
 =?us-ascii?Q?CWFTUCIQ3Uq0psTWCnKsX1w2IFX7BRzFm1BFLfg+KI/Jsq3Cyw+2kbRt8n/3?=
 =?us-ascii?Q?gmtCRHTaauT09XpOQqqib3D7h/hGS+IGZdQcap4G7vM9DMSVj4sLMEy6upmd?=
 =?us-ascii?Q?/crEdcju7U1If4yMIXJZAkLWYcV+kYA1XioFc1RxXZBb3rWIGLqLQvpSnHOz?=
 =?us-ascii?Q?77vC22Y92/Znuaj/Ntiyk8dKHE5olmyv/xzm2rDCnbK4UCHQNjT0lfKVu3p3?=
 =?us-ascii?Q?mU7g6EAXCpYU2txlVYC0Yn0mhxcjJT7JSfoCO+paCRpBpJeELfwSTeLIxutG?=
 =?us-ascii?Q?Ndn4xfAprlRwnAmOfQ4gLMcdTSZzJ+xWoB6TBVerz2QCS94CVNpj4DFmMLud?=
 =?us-ascii?Q?2pdRxOepJ5b+uz3fjufwNiRQ5ZfmVDxP1unZUw5oJfCaAmPzZcql2vk2+ljY?=
 =?us-ascii?Q?eLo5Xn2DGzHsXPAqpARmA6ezF70lAXkloWmbZKNNB7Z4qfB2F69yepV5WkI1?=
 =?us-ascii?Q?vX/hlB9JiCH2E0zqDM0NjBJx6Hoq8H226K+2AsZKgh3TvHe1nN63NzZea8Gb?=
 =?us-ascii?Q?C9fDpQ9YKr+GoDwlpDQmbgkUCcgjDrYhTmbr8eheAUBHZiHP56tm/bMtKF/l?=
 =?us-ascii?Q?tQO0TygNcfUKtOBmLXrpi7XH+NezeZa46gEfndGb9ZLeGFHStmlkyujoUFAg?=
 =?us-ascii?Q?DOxm8ypNseCJ2XPLh66LVsQo3aVeoJSeO0z/BVTXAJCOhw56/7ZlcAtW7gjk?=
 =?us-ascii?Q?vHrTXlcyVvdDU7u7Vz1PgkxlWV2ZHlW8UNTJxn09ab4hJy+1MFvVn2cS62EL?=
 =?us-ascii?Q?G5sLVdyxBpWawEE48z3bZpF2tERD9/+XQD9DVbLXx4ckwcEaLe6EGZnbnf2Y?=
 =?us-ascii?Q?GgCv07EWaGjhl0byguFdB2iiaC4WA49WSdWOoUsgtViPZe4Jj8sealJ7Eb2t?=
 =?us-ascii?Q?vHeO9fTMTEALJPbfqkveb6JvDSd6fyxNMjB972c/RYZKQ37AcfVXwGmkBEj/?=
 =?us-ascii?Q?tatsvhkqTHCyPVeLMTUCwmwetIjLzl/rOvwNhWgyZzqUnENX2Y099mEJcMxM?=
 =?us-ascii?Q?fUbWidN/P4dUuZ9V9Y1pwUqo2E5yl1xvVsBLf1uOZ9BywcJlF6YQxw16+nOY?=
 =?us-ascii?Q?8RUwvfbBu28tw6hu+VcAGdVFWFJ34R3EWBZ0vbElSE2d0c9z2/nLGSPVOMfz?=
 =?us-ascii?Q?FXUnEbx4oV4xCdETKlhGF2HSo8XcnSiPtU5lkcgXtpKyv8T4Ws4/M8RgFUrD?=
 =?us-ascii?Q?PicIqvcOU1L9YzkFJMUVsBtZAnMB3y6x6j2XXtjzDcOQ2E0iEkFG0oYfOvzj?=
 =?us-ascii?Q?iIc1Rs7SBUjs6PzVEYZ/PzRexiqkjfiB0FkLCpAx3luRofBWg8Bsp7G9fBpd?=
 =?us-ascii?Q?cZ2XMvqz2lIS3WDvKMoaz8aknvzPFQXR4UgAC533Bejws5IfLTlylA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LnsWZ/1i6TmBaki26K7VllGe8G/RiabKwSy0+DBTXcKZXOd2KGcKndvdQ0Ka?=
 =?us-ascii?Q?1D6Tw8tB97aRdtk4qNTeSuDZo8uPaj+IoZbtxc/F539DDUUoe9R2uCs/9Y6w?=
 =?us-ascii?Q?40XEcRUy+Qs0xZLCfpqLcj8HHXA77mpriLSKt25M3ka6h08EY7Ll9UCIgnqA?=
 =?us-ascii?Q?N29eDwSO8neV9X0jBhfFwNzuVH8uPFKp7Y19+c2ggQi0aK2yFxbNjDGwIjrT?=
 =?us-ascii?Q?iUgJCriaYkzl8qVRgukyNNr0LH76ro6W6txNgnG1NNypYF4cszeNglkOm0p5?=
 =?us-ascii?Q?rymZ33MgfvykfhiEEtFQKCb69oBYelpQAm7NygRZsA8tldrPpG6Xc9LZlO27?=
 =?us-ascii?Q?MJVZIMdDUuJiS1bP8OBQzPRaj8xAV8rnoSGuUsmz0fFH6l11qDhcSaxuN4H/?=
 =?us-ascii?Q?A7Nix733rVT0aBwIDd40D/4nX6FoI0TzPjzZ+sIk4msMU7+fLgoJEtQUAYfJ?=
 =?us-ascii?Q?c4vu8+R+T9d9HwIKS59ZewWuzkJ/xQc5uX6XH+yJuRB++zHH7rSG5DtaI8++?=
 =?us-ascii?Q?n2xEcf/NmF1eXyrKPV7dR01orvWf1TrrUyY+gd7esBUAsiLxjah/LB53mHdF?=
 =?us-ascii?Q?jg40jAsn/AJK/aQKB8+FPMVCFs22SboRxp4MFYH/nBxaiKomxYuY3XMv9HJv?=
 =?us-ascii?Q?XOkFr/Fi5KTVkdaNgEILvs6ATWoIXaNyHH4dOQ0k0FzbUEIxnURh6A3BJJuY?=
 =?us-ascii?Q?wLTry0GIMS+4vRRQV8z+28yWok7wOxAaQxlXh+ENpUPcPn5oN5VpTVMi8pQY?=
 =?us-ascii?Q?wXa8GoSfYwJjbjIrKe17BI15lS/LwJB9ymmlBf5Qa2V+KBTkTfpz7plICGYC?=
 =?us-ascii?Q?yfeX59Oo7KVKBS1wvSSvNlqjzEUm64TMDQ/VVO6MlSrxYHX3LDRl2U2A8S7i?=
 =?us-ascii?Q?G/sAKbiLatRGeYbDbFT4boV6RJ/dMyPbXG2sp4fHohwipY9XQpYlhKFf7meu?=
 =?us-ascii?Q?kO6QljncYkIxBHsc+IkNXPyRbX7iGnsSkCEZ7HggIKXJEo8K9qn4zDo4vkhl?=
 =?us-ascii?Q?7Nt056vFPocBNh878MAiTB+L5n3sI6ouK03sT8HglIvrgsj0Dw1sjIuteVbw?=
 =?us-ascii?Q?ZWiETEZ9tCAh8t06y5GZiX/Zyj/+WiFV9VMkXEH2ERnZXKER6EefbM8NrFbr?=
 =?us-ascii?Q?eeBpmccUP26eOAUQn0IgSBpLTgFvyEVnj516wwL9pjQjyvE3L3XuHXDnVE4z?=
 =?us-ascii?Q?Sei79fNx7Lt5cMOZDBM4QIAvbN1T1YQtayOEVluTMLlJiQE8nBJzlyG47AKs?=
 =?us-ascii?Q?dQCTCgsrJXHb5jgGPtIl0DgVRqNeOApvPYfjLyCOtXhn/T8fb2zH2p8kErsN?=
 =?us-ascii?Q?kEAmhrXgQkeFqmEt1UIZuKvNE3mL4CCIUmX+C46N+ojsOiN2HoLOLDvKBUmE?=
 =?us-ascii?Q?NEgT54WOddQE8F8TDEhJ35OYWaXMafQtFLfJXDSFA8h1Y/4gYge08oQ0HbjN?=
 =?us-ascii?Q?UGgHxEn85p02goMFBcEl0bCvNVCTUQFxMncSvl4GlV+KGIDXdmCPXGlcUxaj?=
 =?us-ascii?Q?zWWpcr1tKUpkq8kGPuXsdOOJTjXvDQS6Hmg1+STpWptamsLzGd9X1a3SdOiF?=
 =?us-ascii?Q?dcmaqAmedSHrucMMW/KFWjnDLfuycRbiOogPRqkrXNkD13dd9sQ73XZuWcMW?=
 =?us-ascii?Q?XR3YgBiaS5by/EAS/5X+KcM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c71601-4ee3-4934-4c91-08dd94132750
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 00:46:54.2752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amXPmR2zS+0W3ksbm/lxJ0NJzmld5ZmHI1bzWgk+Xfa6U5S8vdknX2+ORf6uFs3l6UPpUGlZe8AVFNifRLLcyGZXbNhudOf9/jWtP3IJPw7buTQx14YMGKOivkY89W4B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10044

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


