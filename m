Return-Path: <linux-arm-msm+bounces-117827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sp7GOiAXT2p5aQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 05:36:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F272C543
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 05:36:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vivo.com header.s=selector2 header.b=NutE10Fz;
	dmarc=pass (policy=quarantine) header.from=vivo.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117827-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117827-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D41D3052652
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 03:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700B038F643;
	Thu,  9 Jul 2026 03:35:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012001.outbound.protection.outlook.com [52.101.126.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D52238D3EF;
	Thu,  9 Jul 2026 03:34:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783568100; cv=fail; b=pyj+ULpvb3FFMcFR66Bt58Ro2UQqe1pb0wWQ6sbQK8KFSH/2fJBJ/f1u2dSJbBIoSJJlM2d6S1f7Q/D6hnUiwCSdTNhwVpLru0u28Y3uMO/vYKSG+nzsCvq/zSMljNHjn91LEyvKZs4Q5ggNJliEokpSKh9ZEOpgG74RQF+moYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783568100; c=relaxed/simple;
	bh=+3J/eDnCSZCZBu6Nd4AH6Y1kNjQle7pe+8I3hPRCuTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=R8AWwzr6zeoK6EVqU62JsS5qUhC6oRJtDN4qvdQfaGcg1ndIeDkuvgCiy6xs0dW4zWJ9SmsUvzk3oN3+89QPjp3FnbYnvylijnun11bf33ijDa1FNE1Qmr33XnZ0GYaVPYA9dYhFwGxHorwRQ2nbjPiJ6MnlHJFxCLlVjaNLYKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=NutE10Fz; arc=fail smtp.client-ip=52.101.126.1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z54+tPnbz0UYYpSHMNHndnOS2Glq9YQIJrz4SOJ5vJHuRdQRv0KuhKocSJSXeLij7m6khOs8yUG0y9HE+RwOrXfpyA0XZJH7Dh62cCZcBaVQFy3jGGJtuYDuHl+uK1lah0Ea6pICJBk5ByOj9SM6EzC90TDxNueiVFHNYbFIZYVW72+IKXs/soPoipQ5lmZD8GWQEppa/wwxQwUZDmiR9sorAVA0KYx6qCqLlZpeISWuZlUstJ4zewZt4cGAmkkYsZYF0B4VbWoL9pcB2ZPEIFeagfBRYExn7hlX08d+XcBFxxQO/44ZlDRcqGs7OYqSnhphZ4VPCstq6S4vtwLwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7JAm6c5QpWscHDUz2WKVnHugJ6te115xZNRdOcGfts=;
 b=c/DHEjK/sqWW3eQVC7t31SEohMwEzqRV31SCpo10mb97+fy7LoJBzCMR5bO2NeC4R5xF9LXD8WsvUO93mx+FF3CPN67NEE6a0me3Y+7rRwjuTVt7dzJbiG7wntAdWITtdgFb6Gnv5wnr3fkc363DowNwd/jKS8MELsuxTD2FVnDAlB22KCm6TrjCgGwnxNP01kDeofjlYk+wAJg4+GE5c2sZJmUwE2KYQ4JVyWH/SzvUfbQGxA3T20o33Ma2rPu60JQMpDx7Wy46MB3r3Bnt2cwHc7SRq/VkhbqTDaAJMC2s727sjWqfTw4R/afRtkbZg8cLWym7gYnkW4bQ6Ejmvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7JAm6c5QpWscHDUz2WKVnHugJ6te115xZNRdOcGfts=;
 b=NutE10FzDHfNJpMrKlBLPBYaVA75/dwliVb7gjlaVv/8DIOLvUSkR5gXgabMpII98TH1rC+MqYsUy9q1SnLqAc55uXA/moe7k0G3MSqwJ57SOO9TImRKL229Q2W5PECxxKjqWuqUlKJB+RP4Jbu8SF9xpJM0+Nzkt42i3a0ENDzU6RyRmnxasWftG5UHptrgSeermQNPLJv0vdsqd8jk61nRuXvUH5ht2HZ7HoThNrELMmLDoDvIWKWb1o9euYSWcAKo6AQ7p3Md9BakAX+y7Qe+CzDC00r+/j7tk2a9sWihaK32VSJ/ewCXHNvqbSvIvAqxoOHy+735jvVRla4TLw==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB6360.apcprd06.prod.outlook.com (2603:1096:101:13f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 03:34:50 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 03:34:50 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	imx@lists.linux.dev (open list:NXP PF1550 PMIC MFD DRIVER),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 00/43] power: Remove redundant error messages on IRQ request failure
Date: Thu,  9 Jul 2026 11:33:39 +0800
Message-Id: <20260709033428.362970-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: a2303c2f-d8ba-435a-dc1d-08dedd6b07cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|11063799006|56012099006|18002099003|6133799003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	P0c5wX6Zdb0agOCKZa0qbc0jN69beP1K8FHaERdiu6e56Gf/yLNpXvxXHoMPlOKLVSGeYQf7cQ6wAmReAARiy1MQLI8HUVsd38saL77lgr6j2WjTup3u6fHv4zHPYk5Bvq3pV3vnir1QdSQZeeA1DhvPwJZDIq8iAiGLj8g2fh4/eN8KtTMme1IWN6Po9gyadHLjWQhX6wfczS8fK9wocZps2X7eGonBJ5WKeMuKadv190JODDoB1SSHi7X71O8anqq0dUKxVgRam4mq+wgA/YXLeZMj9T333paFWryw/c9XeLiXYdEV9rnf9HLH3OucCOoCiKJpKGc8ve+xC476uDt8q62smpg3X/VPXb7QBJ0tSl913krygohiupVImHSia2jNAq2VAIrS1OmTPL6OJsSvMxa7bNE0oZA4975Qd8Omka0XQkhCQ3UftYqgiElFVIfK/h48UajCBN2seAX7A0dHz65x2Ogpn2cX696v5NYuP6UTPaWshNDi7Mr9XbF2Tom6G5O6TqTT4w9XkAs+/RcjVmUvDNjAbcDzQ0ukG3M/8ey/+U+jYP68GMQm3fKjCjd307LMZxDV1IsHtPoKbjLOGe/grg279u96NhqWgv3cJPGcjmp3nEVlQ99LIsJ1UQUSbDTQuZhFqduUqtsFergZWluDQmoyZlF6l1atL14wcGr7A6qWR1vWwND4RXQm06uin61hKcJ2roevFYDXMTTlD0r2aMYb2UAf5TvTMMt1h2wklPCunOYtnhneEzNy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(11063799006)(56012099006)(18002099003)(6133799003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gm++FXjTYhidG/YOq9mDMeP/GsaWmq78sj8PLiBG+pGVYK7CultcMM31rXRU?=
 =?us-ascii?Q?oDgPZizZyPPqjbJxlqJdj6/mnLPmnQuiv4guPL9dnToe8ufRQbGqO02GwODR?=
 =?us-ascii?Q?+vuWO1JxmvbtXhM9afGoyVZKMuZQ1NnThwanWKYb9lDQsgOuJrgwa42DK47P?=
 =?us-ascii?Q?0pXmqTnAgn+t6QS9jBk9qa/q4CZpQ/3xxjy7uqSgYN3jlbf3hMZ76CwcX04Y?=
 =?us-ascii?Q?tWKZ6HVyPHYSbD1kf3I8rJbxzigWZJBpKt2D1auoMX/wmesFGcZLRliKp93n?=
 =?us-ascii?Q?ga9R5LG3KdWvW9vy45mV2sAuQczZpAH0oSX/CtlwZb/bDV3hBtLEUPLB0y1g?=
 =?us-ascii?Q?34HMlcMxL7ZcGtfkllzohooyTWVi924oWN2vYOn6n0+cJYXtdvlIppNbjOiP?=
 =?us-ascii?Q?73Yid07/KF9pBt1n0chkOYmuBHcx70AEaojcjf/AVGGjbUHUhggOrwzxBw8B?=
 =?us-ascii?Q?4SJeLDjgUT8joF5hzUKC/ddwdvf7iaTy4l7bVE7PwvZznbbYiBwVoASkKZlH?=
 =?us-ascii?Q?xrhwbJIzsGjbHLCWa6OsXtFs3Kv3TDNFNHkcQ2Vh6BWpAPOVAEJj1MgW+029?=
 =?us-ascii?Q?+naz+RgoJG9DLFC8K59PePvZ92DfinPGTWS2weVXrzjCqocn3He+o2qaBebE?=
 =?us-ascii?Q?wvhrq9UL5nxl79HAfMJDhzq068gZ6DJNXOqpp7HvS4NHtgNKm9LR6OnFDgbp?=
 =?us-ascii?Q?AS+40G4curgPbMRh/kSacHPIoJamN5AYVXdzCkFJ74QFaQ6Hh4WAMQrQ+rUc?=
 =?us-ascii?Q?r6gpDsRvqH/BH+xZS29GCoACMap7M5dcxSQYhrUCuPIAXDEaPVhbNsE9+AUu?=
 =?us-ascii?Q?pb8TSxwh4vqR1QnYNpiS/3Hd7OALUHTnniZTdqT9q6h9YPhd6B4bR/+gZhKa?=
 =?us-ascii?Q?JDocYS7NUfc/D6NSCfmVcnyY0MXOIlTFsINwBDfMNL8ejX7Pk6XtUPzQfIqi?=
 =?us-ascii?Q?J4mx3PZBKWcQBZjVQm/Yp5vmOhv0jJdA+SNKPf/eMSOTLuc0b+/jvlKZQCX+?=
 =?us-ascii?Q?TTyCA6DYdz76bJvm3oNdCkbLV5IMT7W2f+m+xoJvtZubERY+mU65bm5n1WLH?=
 =?us-ascii?Q?OrHvZCCvgMDIToqcl7L1JC4W5b3kTPyHloMFJT0b7T976BQkocPnMh7y+W+6?=
 =?us-ascii?Q?KpE6/0qzigzp6fJTTdLPVcbYB59PFV3B0FCBJ2vlj01RBG9PWb8SryktFY+T?=
 =?us-ascii?Q?1V5D5jAY2WT4aq360BnXOv3npX9RPoJtDqiLxKBUNklW1gvtFq8kDOml+92a?=
 =?us-ascii?Q?BBKcRtTmEx88CxRuI9x57Lx5+kNrWJsUmXKCIYX8h8QmiyXsmPV1Fn0mkWuA?=
 =?us-ascii?Q?ou3UQDB+DqGTY21esEO7P25EsJygET9mKnkJ9d6C+kYvd2peh9vMsAPkONDf?=
 =?us-ascii?Q?w66X33gl5nvcP2Cr07U0y50jmXBmKIoWWRm2fLe07qyjbwTTO7bDHowt4lPQ?=
 =?us-ascii?Q?XfPhDYNTZUhGQ+yblQ5b4mWfxjliLb7H6Ht7Fc+7lpJ2qYIWOitOZpSlbr5f?=
 =?us-ascii?Q?etXpt0iSzph70OqooPEhNKsTzcEt3+lZrxrTd6hQlayRy0yBmNqvE4nyJpZs?=
 =?us-ascii?Q?UnmmxLNNXnFU8Tq1i8bzFawN8gRNwZu0TDiYTkcUDj8oAve93HvRFmatG/+9?=
 =?us-ascii?Q?PHcpYMz19CkVmoYTcOVl/D+ynAT+9ArcKJ673iBnV0n4d4Ph2xvpliaHBolG?=
 =?us-ascii?Q?+w2S23Mmi+9oj1uRyvY8Yi5H+fS7oVP2T/fM7xTLB6x22FlqeXfbCDrNHC8W?=
 =?us-ascii?Q?0L4sN5FX1w=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2303c2f-d8ba-435a-dc1d-08dedd6b07cc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:34:49.7346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhJoL70c7Z48w8Et6VIKeRc3R+ZzNUJdv2Ale4Ygp3C6mEr87vMLZ9leLvs2/2LlHbvQxSqDyChlw2xakVfeqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6360
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117827-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[kernel.org,diasemi.com,google.com,gmail.com,collabora.com,linaro.org,linux.alibaba.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:linusw@kernel.org,m:wens@kernel.org,m:hansg@kernel.org,m:support.opensource@diasemi.com,m:amitsd@google.com,m:sravanhome@gmail.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:samkay014@gmail.com,m:casey.connolly@linaro.org,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:panchuang@vivo.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vivo.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vivo.com:from_mime,vivo.com:dkim,vivo.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 401F272C543

Commit 55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10 ("genirq/devres: Add
error handling in devm_request_*_irq()") added automatic error logging
to devm_request_threaded_irq() and devm_request_any_context_irq() via
the new devm_request_result() helper. The helper prints device name,
IRQ number, handler functions, and error code on failure.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this automatic
logging.

This series removes the now-redundant dev_err() and dev_err_probe() calls
in power drivers that follow these devm_request_*_irq() functions, as the
core now provides more detailed diagnostic information on failure.

Pan Chuang (43):
  power: reset: pwr-mlxbf: Remove redundant dev_err()/dev_err_probe()
  power: supply: 88pm860x_battery: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: 88pm860x_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: ab8500_btemp: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: ab8500_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: ab8500_fg: Remove redundant dev_err()/dev_err_probe()
  power: supply: act8945a_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: axp20x_ac_power: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: axp20x_usb_power: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: axp288_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: axp288_fuel_gauge: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: bq24190_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: bq24257_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: bq24735-charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: bq256xx_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: bq257xx_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: cpcap-battery: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: cpcap-charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: da9150-fg: Remove redundant dev_err()/dev_err_probe()
  power: supply: generic-adc-battery: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: max14656_charger_detector: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: max77759_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: max8903_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: max8971_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: mp2629_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: mt6360_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: mt6370-charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: pf1550-charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: qcom_smbb: Remove redundant dev_err()/dev_err_probe()
  power: supply: qcom_smbx: Remove redundant dev_err()/dev_err_probe()
  power: supply: rk817_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: rn5t618_power: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: rt9455_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: rt9467-charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: rt9471: Remove redundant dev_err()/dev_err_probe()
  power: supply: sbs-charger: Remove redundant dev_err()/dev_err_probe()
  power: supply: sc27xx_fuel_gauge: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: surface-rt-ec: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: tps65090-charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: tps65217_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: twl4030_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: twl6030_charger: Remove redundant
    dev_err()/dev_err_probe()
  power: supply: ucs1002_power: Remove redundant
    dev_err()/dev_err_probe()

 drivers/power/reset/pwr-mlxbf.c                  |  2 --
 drivers/power/supply/88pm860x_battery.c          | 10 ++--------
 drivers/power/supply/88pm860x_charger.c          |  5 +----
 drivers/power/supply/ab8500_btemp.c              |  5 +----
 drivers/power/supply/ab8500_charger.c            |  5 +----
 drivers/power/supply/ab8500_fg.c                 |  2 --
 drivers/power/supply/act8945a_charger.c          |  4 +---
 drivers/power/supply/axp20x_ac_power.c           |  5 +----
 drivers/power/supply/axp20x_usb_power.c          |  5 +----
 drivers/power/supply/axp288_charger.c            |  3 +--
 drivers/power/supply/axp288_fuel_gauge.c         |  2 +-
 drivers/power/supply/bq24190_charger.c           |  4 +---
 drivers/power/supply/bq24257_charger.c           |  4 +---
 drivers/power/supply/bq24735-charger.c           |  6 +-----
 drivers/power/supply/bq256xx_charger.c           |  4 +---
 drivers/power/supply/bq257xx_charger.c           |  2 --
 drivers/power/supply/cpcap-battery.c             |  6 +-----
 drivers/power/supply/cpcap-charger.c             |  6 +-----
 drivers/power/supply/da9150-fg.c                 |  4 +---
 drivers/power/supply/generic-adc-battery.c       |  2 +-
 drivers/power/supply/max14656_charger_detector.c |  4 +---
 drivers/power/supply/max77759_charger.c          |  4 +---
 drivers/power/supply/max8903_charger.c           | 15 +++------------
 drivers/power/supply/max8971_charger.c           |  2 +-
 drivers/power/supply/mp2629_charger.c            |  4 +---
 drivers/power/supply/mt6360_charger.c            |  3 +--
 drivers/power/supply/mt6370-charger.c            |  4 +---
 drivers/power/supply/pf1550-charger.c            |  3 +--
 drivers/power/supply/qcom_smbb.c                 |  5 +----
 drivers/power/supply/qcom_smbx.c                 |  3 +--
 drivers/power/supply/rk817_charger.c             | 12 ++++--------
 drivers/power/supply/rn5t618_power.c             |  5 +----
 drivers/power/supply/rt9455_charger.c            |  4 +---
 drivers/power/supply/rt9467-charger.c            |  3 +--
 drivers/power/supply/rt9471.c                    |  3 +--
 drivers/power/supply/sbs-charger.c               |  2 +-
 drivers/power/supply/sc27xx_fuel_gauge.c         |  8 ++------
 drivers/power/supply/surface-rt-ec.c             |  2 +-
 drivers/power/supply/tps65090-charger.c          |  6 +-----
 drivers/power/supply/tps65217_charger.c          |  6 +-----
 drivers/power/supply/twl4030_charger.c           | 10 ++--------
 drivers/power/supply/twl6030_charger.c           |  4 +---
 drivers/power/supply/ucs1002_power.c             | 10 ++--------
 43 files changed, 49 insertions(+), 159 deletions(-)

-- 
2.34.1


