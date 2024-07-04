Return-Path: <linux-arm-msm+bounces-25228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D94926DA8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 04:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1017A1C211C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 02:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC62C101D5;
	Thu,  4 Jul 2024 02:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="c1JgrdnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB4017557;
	Thu,  4 Jul 2024 02:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720061622; cv=fail; b=d2BvIfg1QWcd2SJSqLsi8yOlEYb6KGmVjCHkCC3fbvQnqZoCNLh0FyHKpHS6N2XCNafQ4IwJxna3z6jVSDgA05rNJEZ5VkgNiSzXxQJqTSi7z9xKYOEq522vFrPxCpgCJBYVXmgC/v7BO+K7z1+Irm2VIvj/kXF2pTNwkkIZjyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720061622; c=relaxed/simple;
	bh=ufL6kCXZCdk8Y3TmV/V+PXF0Ce9zWP8I29IatRy7riw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=H6Qnpy+VWuMqb6JwMIioOPnS0guhlaPSWjbzsG10c0iSO+twBk9hq3gGf0jugiRxbmZlA1etgk3dT1H25Ux22eSWINw6OiFfCUEofcGZlVNAh4At6ot3iL/BXOcVpXdJ9MYIgbMbR9n/Pu2Rv9DT60fi6gXXPTeZSbhgWfOrE+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=c1JgrdnQ; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=de0CC2JNnJ6hjFbr3VD5Rr3fr9nYVoGPzvQDY3jN4S7tb0CRJej88gHuIILvEl+5VS5l8KZdlcs/p+XhGv8LHIl9ir9+fsYqGYXHv3JL3TIqTO72Ea+5AQ39IafddjDSpJx4M1GSLphvCseswqvLaIITVantcX4SaDpKzHHK7mgO2Fmvg9KwaaL3ylhdR4a1/+OU7cQ6qnRkTNx5zL59La0OnQya0CF+bi+QXQPtXpDV8lA+PAoRdIYeBH97b5a/5u606MOBoEF6stMF75lQuqRJjZzu/cf5An3XA7w2HeiJa107Mw6VZS0cBN46FDodyKK9ONgluvjTNibDZHmIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuZ5mN7Tss2dvg2jYHf6L4NzvBAB0l2ORkl1UaE0iiY=;
 b=mSPRNcRcPg9g9SK8nI6/R0yHTwJmpx93TfnTNBLGYApe2jQNbheqDG77LOaXhpAx6S0kQrKGMwBCwK0uG8QURn5gPDvsOl4+h3oUvBFFQ2FW772ErJY1yYC1nK5vElBZhRdDpScRD1sHFA4Y2/6ZjOp5GYBh2r6sQLosj7bkcxPocaf8bBJslNIsNVm9dRzhxZUkBOpTAVEO7+EewwliOhZqMWUuRpvsbRUounvP5IwmodJdibLwSOYYdbHwHZV3jiH9IXd+uLC4E/co8kopt2TUmYOGTh8NsdIU5jS+u0ju1RBhHvA9lFCIgcIx039Yc6usgLi8IjQxg3Usrf9Syw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuZ5mN7Tss2dvg2jYHf6L4NzvBAB0l2ORkl1UaE0iiY=;
 b=c1JgrdnQFVVXnMztzDorxzfIGTO7efruckOA0jpMWh5EB91yi3QpoT+5oMNDYXo5XPIcgfslSaSeeQT0EECVu4SQJAJ4nIaeYdnJw1Vy0qmYUtgCoRewECsFi9yJ2j/di6V4Sj+k3/mZL1Lvbys2eSRYjfgTupobtt1tF1VAHDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9652.jpnprd01.prod.outlook.com
 (2603:1096:400:220::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 02:53:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 02:53:38 +0000
Message-ID: <87sewpoojy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 07/11] ASoC: audio-graph-card2: Use cleanup.h instead of devm_kfree()
In-Reply-To: <20240703-asoc-cleanup-h-v1-7-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
	<20240703-asoc-cleanup-h-v1-7-71219dfd0aef@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Jul 2024 02:53:37 +0000
X-ClientProxiedBy: TYAPR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:404:14::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: a27dac14-9293-4692-5672-08dc9bd48108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gdF1XSAGYs7qc4vECz1bwDIujbveRqPmvI2s1YGADROauFEnrWH49EPGEGV4?=
 =?us-ascii?Q?RnwBIG7Gu3stdD6+khQEvQGMsR/dc/hcsn6J8ShFRo+RjVBpuIQ58gBreSnq?=
 =?us-ascii?Q?n2iygmtULjehWgG9mfa0weWjIaWLCPSzyvIkARBujfGHDm3PqsZYee2YaW+K?=
 =?us-ascii?Q?sxGW3skcji/4Mc2nVWyiqyhPAxiY6dMOQXO/miz31usKj0vZHdQmMt/aH1Al?=
 =?us-ascii?Q?2aa/nJH0CT4fbVwJEXu2wtFb8gMpdnw0CjFBbd39nxZTRN36d9b6p3U9ZK5N?=
 =?us-ascii?Q?OQ79p5TeYX7YhR9SpwfF3yJb6iiDtVdaY+TfxYMEE9L7vhjqvkOOUhMJEnei?=
 =?us-ascii?Q?k0sxwKzzATxJOwBPGMf0MY9gPXTO5q5H8428HwhE1pXc9Jj26NJCrfonnzPI?=
 =?us-ascii?Q?p/VxZIh6wWVSFU/hcffCkW5TPCwN+aQAlTz6fcrDZmPrx3ObDOe/0OXzBchs?=
 =?us-ascii?Q?tEiEu3S44WPNlTNGQyA7/rxvfp1jTS7T71UQ4B+2zSRNcxp/l6s5ir/NRWEe?=
 =?us-ascii?Q?PL366w7bcedcviEhICDCgURETxc9bnevId07TNN4x2/teII+Bot1nE3qBDfK?=
 =?us-ascii?Q?dx7/IT3QN47YMU6W2hKCVV7cS/zNuP2SdYerwGFX3sXp0/q02FRrZ/2RZ/jz?=
 =?us-ascii?Q?84zMf99JfYVLu31R1xR4T9V5xWJYVfG/tb2jp7I0wkj03BXVlQVnBMiVzofD?=
 =?us-ascii?Q?c2Cj4th5Bbd9AkmtEVwKCmwMO5GdqfTELIT3FA+WtAmXfDlr1ILK503TglyV?=
 =?us-ascii?Q?jrZHnKRqhKmJBHqKKqS/SCqw8ky6WxYwaOk42Is4l+qygUCxlG4pPgsxRCRi?=
 =?us-ascii?Q?Pjncy3Cz9llVgP11sEmzwsG+URP21UkvX3SoKI2pkvQpH+eoWxTvJeeTTbSe?=
 =?us-ascii?Q?3AjmF2sZAaQsE7bJNuHf5H4K7TJojUaFwS1KQhFF7E+IIdCEnGPLHezZ7etX?=
 =?us-ascii?Q?cA3wT9ny1EaurFjp+ZxiJPzJopQ5Xr9o6E77dIW74QQgYXfb82Z9SUZZAYff?=
 =?us-ascii?Q?2J41xH0LNlfFuJk+2vwxo2U5NPkfPF/2IohO27ujTBe1fC3LgEuw9lLMY4nv?=
 =?us-ascii?Q?eJ5jcj1SmMuC1t73/ntilTvlzt//6s4Y+ntKg/aB9OELwvn4plb4+vU6iLLo?=
 =?us-ascii?Q?hgkSELUV+h552NZdvrPydkpUeFIO6KKBagUfcV+CbWmfBICtZuEO1MnMogsp?=
 =?us-ascii?Q?ozVw9pbq/4KOIIyTYpRwfSjhqJ9q7aLxDLxLJK5owOmxhHb9pM6FTnFpgUlH?=
 =?us-ascii?Q?TbO7f0+a0bkKLWFQLR17og6wpyflXxvxO26dB7FDfVM/sKohnxul/xZBYfjr?=
 =?us-ascii?Q?b2WO7AbQyJX7xEnD3orSv9i4oJE6in3K/lTQ5F+iWxhZ8hnCwM+8x156onGc?=
 =?us-ascii?Q?LbtPpRWdpHMaJ/aNAKjgmOtyMisAWpL2cVuB6EEmRZ9FybBbhw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fv54lnjhzWTZZcWVrbYUEDTMY6rs45fo7j6anQJOf+17uidtmVncuxY020TK?=
 =?us-ascii?Q?eROJOdRC4R8wBi1hod2Nh3bWi2NeF0HftOEPLdsZfEYZMU7yX9TYV/iG8020?=
 =?us-ascii?Q?k+REssYLrIsDnhA8y8XFHFMrw6S6tHWoC4XFdUZ2EDmvkzPE6DS1lHuyuVQg?=
 =?us-ascii?Q?ENuZ/5d98vHSp6WRMAC3GnmyM44O60YTLWJrRCmfZT02XasTjFrOjOBfe6E7?=
 =?us-ascii?Q?cynMl6lqhsW0EM5Due42qCkJSAbbTRM969t7ZiJnVWLUl8cVFd8LpEKSvoJI?=
 =?us-ascii?Q?LtDIj3KOCGv+kVFP0HBPvHWBYoTDwSK8GY8zrR0BIT4YN2GV6YFGKpIhu8lh?=
 =?us-ascii?Q?Rngw/XX2XFaaUOXcCSCKoE/hcfmrH5EnNPmDyAbAy5D16ic01feNn6EegoL6?=
 =?us-ascii?Q?ovSzfIENPqNHkpWcsrUfrirIDfiHdEJQQrMtKo5pB00ng3VDkfZl1A/KRy43?=
 =?us-ascii?Q?57qAl7Sfc+qMn6sgtoyRAjnRj7LerZSvFxgy/Ctv+3wXHMd2Hkeou+jiKu/D?=
 =?us-ascii?Q?/kQgBfy8GMaW/X5WJ1Tou2FHLZQlmRFLoBMSpVlZAGmtdzO6n9cv0h4qy8Nt?=
 =?us-ascii?Q?a1+tDDqhkvi2YvpreLN0HyrJmAWU/eVJdnRAGsjn3BNtc/Q2yGErrV/oY+lk?=
 =?us-ascii?Q?djoehRds5W0PwmSaDz/bZscaBfpj/6ZtWhHRES1r4blMKkg+VBtqrcmUz93b?=
 =?us-ascii?Q?cYkVGOL3pAwJMwa7uYnQmG+iVMzkg5Wgq7MGd490azm5kd1S1DikuaBZzEEk?=
 =?us-ascii?Q?Kc78HR2wf2wyHpfpNhljTnOxRXRGE7nTKyEMJvY1FKCLDlaDjjK5LFwlMRlk?=
 =?us-ascii?Q?hWauqoeXKa1fSRVRMMqQdYo4oEnJSuaRZNy1qKFJPZQU7U9JcFmjYjVFfTo6?=
 =?us-ascii?Q?LnctCLrGY4gf8zdRocefTzNALjiTt5/gkXGrsSSILmoP1U9PvRvUA/jZZFmC?=
 =?us-ascii?Q?ayAW3Rdbf9L9/ENfB8+vPJTABsQsXO2ncDS1S0YnwtnqXKTFd5Wyi9RSA3I6?=
 =?us-ascii?Q?qN1OvsjZVjniOFwAkMMAJFlOOXpLErdJYSiCDOXEr/TQ/ChUOLs/FQyxzxuA?=
 =?us-ascii?Q?x9RuEYZvJVMy2zZ1GNJY2hT+SEdl1G2Pq6y1IHPeo3QIG0w0wcW4qTebxk3Z?=
 =?us-ascii?Q?KVmYI2YNDV9IfO5IOf/t65c4RNIAUkSgncCQDUETEeYfM5JilOCAUK/UtUL+?=
 =?us-ascii?Q?9VbdbRcO+AKFr6QN3XUNFavHwViXSxBh888dqiXpC6hK1cTfNsFAFO0StuPe?=
 =?us-ascii?Q?rLIbZcdgSHmu+rnBg//DMrzaqwbhjkndA+ly6kjxQCjau+vIPoaSttaShE3q?=
 =?us-ascii?Q?C3YIrlPBrJVOU8fiP+h9sdHO+gzkB3O/Z/oK2zuI522SCjSnIc+9Nu81QqKC?=
 =?us-ascii?Q?926VnnvzXZ9JpCtZF2BjTV5sppQhaBDfliACr6cuX0dJWG+Bg/E7b9GvRovr?=
 =?us-ascii?Q?iDXYbUQw8H3gdAXtSJFHT9zOZtOQxgol6jJDgIAYW4HJgElIzc5XAtsY9P20?=
 =?us-ascii?Q?oX/oX5AuJVBWqtZ/lWmpBybrTZK95f31W8q9gnVFwWg8Z2mqudOjYXq7sl13?=
 =?us-ascii?Q?CJzARWwjgWbq8Bcg2UDGJITwocGeGB5BnpTP6/cp6agD3F1pMSEq+3yKYd8M?=
 =?us-ascii?Q?2SDwLtpB8gTZf9jhLoOFfZY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27dac14-9293-4692-5672-08dc9bd48108
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:53:38.1234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZ4d//g/wWsdoRJG6OcIBWpfUPcO7nLitnyN8Dd60xmepnr1Ff/qeEUvoIYYDMtkV5RBGBxUIpknXKysAJ7rwUm+4kRPvJxa0ydi0HgaAM1n8U4wnh5Cxu43/RdP/IJJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9652


Hi

> Allocate the memory with scoped/cleanup.h, instead of devm interface, to
> make the code more obvious that memory is not used outside this scope.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto

