Return-Path: <linux-arm-msm+bounces-57203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E8AAF007
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 02:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F156F1C013F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 00:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2F61805E;
	Thu,  8 May 2025 00:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bZcbmqX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549C45CB8;
	Thu,  8 May 2025 00:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746665155; cv=fail; b=TcbIuyQPc1rE1uGykAv4ULAaDDnEyl6Lb8SisLkJYz2Qc5D2xPtfXWdOqD8Zo3D/heyz0GfkamqZTiUXdhB8zNrlfRzOTcG/4xbC80AiTAxULb4ksX0CdwdO5bMpE5/7PerGtsx9bPPzEM33EXu6VUuQwZBX43OeUPWrBwJzy9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746665155; c=relaxed/simple;
	bh=47Rpd+euApSwA8YXrn3QzazPgfYKjMO+zDRTz0i7unE=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=pMZ/KrYbpsWrOwOfts26F2LZZhFZ6NzM+5g6SD6jczDC5evo6jYf1vXk6Q8KkeqfVjkWTZPsF1Zpb9TbVJ/HIq6P9ta+gdN6FHVdptgVb/caeMBaQsgZssILjI/0li8sU5vggyR6RWxW1lMc1HA9DBsJ6rXjea7UkX/z9Q2USyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bZcbmqX0; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HImfUOYxbQagAKm3+KXRCByPNnEER1/0BRjSDdGXZ6gax6X61I1qkDD7PhE93SPD94e2A4HJrtF5eR77DzkDgBXTAbOj4tILXLQsl9nJZBWlEwj8QA1mVWWPfo3lieKXDxgYKD9snB5oQHIH7LMnpg2ePlUtoszYK5bFPDUQoISVkaXSHFgr0+nXqr7w0jKOCOm75U1lF9neLjTztKD72IuD3XcubZfLE0ojNXGXkfT82FWtJZTcZxSX9FMFLi0dFzY8ZxQItvhxLxsz7ip6b/1z+UCt5EJjugF47o62STB8onfK9GqbSkkjNPSU0q1xNv4Wf8Dm4e/nMq318qKcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yNClK1/xZS1F0muPTGPfMjzSSuwkVJ2+tht4EuzKfY=;
 b=kzms2OaqEczjfH1DrGP6sIDgINkGdJ5TWpqMsP+VjrW2lv47r2YlYHO2Btj3/L12IX/B1E/onkpDd9yO9K3/ocyAkGOB0xP77e3aNktiWGvRLK0ooi3OESxvTMQa2P2nxqt/jHH0ngmTlhs64cD7wOspHsU8SvYEUi0B35allAIAoyJsckRGhbzLoQX5aH/atDlmj661mHZTSOVPAtouvHRrZmeI0O/zxMFxWjDmjLMr6H2H7Na1uq2gp5OFJSYbEzacBTpZnmxNXak4lGBL5lsfOvDBvV1/4/ZUS86tvunCDK6wC2ciTOaMYf+b1KEO03GlPKRwUyNYEFHkJJecjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yNClK1/xZS1F0muPTGPfMjzSSuwkVJ2+tht4EuzKfY=;
 b=bZcbmqX0pJ2e6G8H3xgz2TOebiM52d11GKa2iasxMXTllgMg/XOPrSHnywAmdqQDVdih8PKyBHGtjfqfrdtC/iNJQ/zq2lxc4kNcF0O91HYAcfYRKgYIT3RDF/8wEbKJ5JN0WyCViw6+S8pOHIwMZq0eMhD5ebjIaI3OW2WTUe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10008.jpnprd01.prod.outlook.com
 (2603:1096:604:1df::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 00:45:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 00:45:48 +0000
Message-ID: <87a57o2amc.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: remove component->id
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 May 2025 00:45:48 +0000
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10008:EE_
X-MS-Office365-Filtering-Correlation-Id: ff925e3f-4be3-447a-0a59-08dd8dc9accf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F4JSPHzzhtSTPSkrkhtg7f5HGhmqU/NH87DgMJZHyTPCskrjU1yEx1m8EbtR?=
 =?us-ascii?Q?jqU8+IGp+BaYr9hYVROEPwcs4Hs1todBasYSpS62/TqvTE2auKmrUxIViy8N?=
 =?us-ascii?Q?P5o7+dyPigcGpY4PMYq9DGKAqdlhn3DM7sLT2PWygSze49Ncj7r2V9WSbPv7?=
 =?us-ascii?Q?oTy+wfmLvA48Q2WhxKFmyw4Gky+0jS2oIqhmdluQDQ3Jemb/o00yQnVGs9at?=
 =?us-ascii?Q?RxmTsiSv8jy9dLLwqivtjvKTpzfi/OHjePKJdfiN3HuJo0aBcw3qvQ04WrF8?=
 =?us-ascii?Q?0xJ1OmVhBxd92QcRDM50+tehcz81FDjh8hSmrhHn3f2JGGanz8iaiGUVKJAf?=
 =?us-ascii?Q?CSFDjCGFLclzrfdx17IMW1Mtkgn/p3i+pUc+NEzfwd6RqR5s+GJscse2IgPt?=
 =?us-ascii?Q?T9IhrzM9XDyNjpb+qufO31nryyJtrRkLyUCXZdF+Jn2oPu4mAm875tgytVh9?=
 =?us-ascii?Q?w0ylwi2W1YBEZPuNCWnvw+6aPiN/mMkiFxc07n24I/gV6357gc0JsCuCyC7N?=
 =?us-ascii?Q?bJ7NONeKU0q1SMYhxY+Mu/mdLAEftpKv8KP8gbBibVezAiJy7pcgIvDryevZ?=
 =?us-ascii?Q?9dRobp3U+0vno6ZjgK8FT0D9iIfFk5cG9qnN0JEwoO+4tD9tA1sxS/CsgZ9i?=
 =?us-ascii?Q?SdAvm+tz2cyVvtqvcXe7oHSYwAPl5E3rrfprVhfAe/sdb5yHS1D4mapsO5Yv?=
 =?us-ascii?Q?rpagF1HQlSDPrcdIncyhdBHrYnSm5mdvD8CGgoEOYB4Xs/KfsdSVlXXVnqU/?=
 =?us-ascii?Q?cy6DqkkPSF5liDLjWToaTBCUDa8VtwpNQbX98cxAB03K7hyftaJRGdGQSX3F?=
 =?us-ascii?Q?seLy3CgARMejSS6i9SuYAP/KDc2c42jNWrsr72CiUr5cUnxyZObWa1MTiZc6?=
 =?us-ascii?Q?LdEJM1VRFJGSrCCHxt+w28yjl8OqqwSXm94uuG8VNgYjBXMebPGy+sSWVwcx?=
 =?us-ascii?Q?fxmp/oFa5R8U8+TNaQG/fzPK3Z/R5laH9iUHKtAfYrDylsPJmSC0HdCEl/pd?=
 =?us-ascii?Q?jA4diJeX6Q0x6xVgI+sbgJYocFcoTJEkLdkcwTO9S1mJjPOq/4qjSq/1kuMO?=
 =?us-ascii?Q?aGNn6M5TOXa8RKRV9hQUYZphUxbhCdh8O56s6y44tihfCAlufZzwd3ihc+mF?=
 =?us-ascii?Q?qRQCvs/++3kgA6L+wRunX29I6C5tNjIZYlAAtX9mixl/DkE/l7Wy0qbz+Ak2?=
 =?us-ascii?Q?If+6JjGbZUcP2dk0Zs0LIsCLDsBMacBnu6rnq1QVtDvDSxxRbnZG5vsDREG9?=
 =?us-ascii?Q?bykifpqNpmwC7Woakb0W+lZyIflm2N4UUSLlfto5vvjW7SisKXQGWLSnKASs?=
 =?us-ascii?Q?SNAnV9bs7/i2P2jOfqz08pdVInGojgTLQhVWnq+MGO63/Gfm7O3mc9XOzIrR?=
 =?us-ascii?Q?2c15h36bx6YTGDdBxEniQ92mYz3lmqaXqeG0V8rq7KyRk2MeVS6OPCcDJQTy?=
 =?us-ascii?Q?/8M2jXn2CC4ZCJERJNhip1OorcFas2jZoPk4b2ITyFwrzIb4qGJ3Iw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WcNy3BHoSMTRGO4XJfC9qzyTA9SRM8Kx0Y4xGcXNw5Fjy2CAW2tFAUUvUwDA?=
 =?us-ascii?Q?+gOKkCOGGMOqg2fx3Mnxb30gNnSOHT6IGIFOhD23OI1G2VVtYOWbXXZ1nQ3k?=
 =?us-ascii?Q?WnHXGrQ/9X/hAQ7WsS0zc/gDXWJ5iqelw0iUpERgdqr4vcvEk304MoGF4IVo?=
 =?us-ascii?Q?xyMeSuocCBuYcgE+0H1bR9++e7nz/spdxGKI4YEMZWBv277iVzDUrNMcBXLY?=
 =?us-ascii?Q?nqb8dfquLgeMemujCaTYQEbOuFNgFg2aGgq4V7G9Pch0BcRddOCWQCAsuYUo?=
 =?us-ascii?Q?MBxhfTZAVU/CZsXfb3hXtMmVhMYN2x5DS5VIuUF7CJz54n7IOyuZj3YbUCKe?=
 =?us-ascii?Q?4fqQz7HyCJ7CD0aDBGn8JVf8vlvERmnXGMHSmO4goJGvP/yYINuYaWRThYgn?=
 =?us-ascii?Q?fOw4OYKTLNU6QeclOeutFu/U2p/Us3Y146tibSCIrJQWPlLM+IhSF+KfFiPq?=
 =?us-ascii?Q?MJp4aJowy3ziSAPa3ZMAWjrL9wpKIgyeYVShguuI3ga6opihC+3nYYfA5vDK?=
 =?us-ascii?Q?L6c8/Nj1eBe1oplUQXQ1ff9EhhF7QWZmCFKAqgN/3SwUiQ6xN7y89LogVoEE?=
 =?us-ascii?Q?zBrL7shRlRDx8sPJdMIyuRaGLN1TWvwecc+3h389ThNF81HDPAlFS27J8Izm?=
 =?us-ascii?Q?+nbaqZ4xnGMjkjsZFB0BmhAlI7ccsjBCc5RfFteJEb7JG54zuvK7RGbcv7CZ?=
 =?us-ascii?Q?D/WNmk13Jc9MAZQCT9g88C45025Drgqe8k0C3M740prEx6/YFMc6xDhAfBjX?=
 =?us-ascii?Q?8sVPiWlnQWbkoW/GjsfekqJDO8l2xhQM0j9ana9Mrrw9YlwrgKGSwf0eiVUL?=
 =?us-ascii?Q?2zxa8KMCFiMZVNXKWEFkP4caqiBihorzMTiWKsypy0j8gYfLfY3kgsMDuo8T?=
 =?us-ascii?Q?98TtMcq3EtU5JMzIELdTHH8H7kinuvqv9nH6yA/AoVUQripTjftkUVTt/HKY?=
 =?us-ascii?Q?P8m4F93MKRV0gh6lxbQxu/JHv1MHuGzMRZ3FYopuZAEbZpIFS+zEMQXci/E0?=
 =?us-ascii?Q?xMxGCLxunQlvhes2Sbj8jVWAkCUp7JMLbJs8soeg2//mG/D5hioh5b8b+i04?=
 =?us-ascii?Q?b1Knkj+Akc7rzMA9sKfVBCrQVk9p6NxhQ75fgCpdHmD1bnapzW+EX8bYZalL?=
 =?us-ascii?Q?NJQuLhupvVPHoyq1aHnK6kopHMK2Qv684J5nW3xHhyFqpp6RfA841X3my7ns?=
 =?us-ascii?Q?qM/+v5yp3oIc+ZkBNKAOfdnr3javrqtkXZ/21+LH93sB895XUF6v0i66uOlr?=
 =?us-ascii?Q?e6+qSZ30n6kQoH61javXwoiLbg/F3BzFDzw5RWLc6TY+u3ePFm8k76a5arep?=
 =?us-ascii?Q?JpO+BTSq6tmBFdREswkgf69OGcyxWbzjgqQw/P7hHJ+9oI1bGlKc4UkekKDL?=
 =?us-ascii?Q?m1jizRyFFpweaHbyq3eu6p74U8F6a9cag4NX6uSMdnbXXW8kb3cZQv8YRFl3?=
 =?us-ascii?Q?kfaxeGFfTbFYSzHxToR7SBp/742SdD9PLAiQZc/nnTd6eIkjX9dEPpMWr+Rf?=
 =?us-ascii?Q?ocVslT09kY2Jv/ioPi9fLB6YTBp5QHwCOhuumTVE3+lCP0Ncpf+l98vrFs9f?=
 =?us-ascii?Q?fUu4uew82f8Z49Q8HvkY8qItWJjGzkXL9RBIqH9dfotXrg/lgUp6uKbbmtqo?=
 =?us-ascii?Q?qaC7LQpmEIv6ctPol0IbyH8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff925e3f-4be3-447a-0a59-08dd8dc9accf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 00:45:48.8986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rT3uGseeQNhNEpKAS4XTsGB/HLOhTHRcMHtb5vtBX/qCI9xoRHjOdlvpKHmS37vJELrdX4AXAA2dORaHaua4qllpCiQZsh8fVxQVpwfL11Vh17rb5V5fjvOeDzmiHWKI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10008

Hi Mark, Qcom member

snd_soc_component has "id", but no one is using it except Qcom. It is
initialized at snd_soc_component_initialize(), but Qcom overwrites it.
Qcom can use own private data for it. So, we don't need to have
component->id anymore. Let's remove it.

Kuninori Morimoto (3):
  ASoC: qcom: use drvdata instead of component to keep id
  ASoC: soc-core: save ID if param was set in fmt_single_name()
  ASoC: remove component->id

 include/sound/soc-component.h   |  1 -
 sound/soc/qcom/lpass-platform.c | 10 ++++++----
 sound/soc/qcom/lpass.h          |  1 +
 sound/soc/soc-core.c            | 14 +++++++++-----
 4 files changed, 16 insertions(+), 10 deletions(-)

-- 
2.43.0


