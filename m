Return-Path: <linux-arm-msm+bounces-117823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9XSUE20JT2r0ZQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 04:37:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC1C72C032
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 04:37:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vivo.com header.s=selector2 header.b="jNkr/OuZ";
	dmarc=pass (policy=quarantine) header.from=vivo.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117823-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117823-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25DE430CC8FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 02:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8F937F727;
	Thu,  9 Jul 2026 02:32:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012017.outbound.protection.outlook.com [40.107.75.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1BF37CD3A;
	Thu,  9 Jul 2026 02:32:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783564338; cv=fail; b=a5gCfaMqtsiPtr2pG/+WBf/139Gf8KNNFUdgir7iecCdLw+ue63o43fpsxuy2FD+GIxrBckJNzln/iyBkFTx5I9mcjtnH17ONCC7AuSMVVOxZQ2QfFCQ9ARXPXXxunbB3dnOTsiEjmi7VmDWgo/yAVx+zGfBd5lLkKqyLZCEX+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783564338; c=relaxed/simple;
	bh=tfSQUfa8rLKVbZ4r5DAH5JbRjCoUvVI9QLA2hCYHXrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sNNvVM0tk/9JkyaapdGQeNo0ZQP6vzfWpvzQiBFAbClzRvjV/+K/DcfHzu7MkSP5u8DjecEjvb7w3Tp4kFL15jnzNtcd4i9+M0rZMd59MvoEaS+wIOEsgFiNgrMZn12gIejaB8N8m0Jr6NxTgUM0GlVwHuTlXXTKP9OXqtbttaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=jNkr/OuZ; arc=fail smtp.client-ip=40.107.75.17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3ejUy6e7+8jlbjPhPgGoARPGxhIk2XkvubvY7lAAIFksNwueFYxZoZlD52VUmc10XBOohygtu9Ooo28etiAwM5d+SA7Ksxli3IVP3C5eBRJaPVgxSjUbe/MFDlY9Uq4tUpuiKnxBcBIquxXbqXJlwU76AvMOSreMIObJf8ycFm0nYm2YB9EkX+iBZUXvmB0kZdTSEPtl48j7/TZhy1EvPuD3TE/pMaG8gJZB6Pv1l63xbR9BtRjqfTf1owZObCs+APCOoslEEUQ0Ubcbju6/zhPvrDyGofOVnveiY07C4v7nUzGdLucNcMOUFjK3NcK7xXwD1hfdgKNzDeHs6AZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfN4zg8/yGWyRcSKtiFAAjmcTz8bYHreA362VO5FVUk=;
 b=kkYpu1RocTDeei6ps4x2+2OoSREItpNN9llh8xY+y9AQQEldr0cTMg7hW4OBpN4SyMp2bsyr1j9p4ofpSMLgflHHX4TvcEbDp+9oiNlMTlP7SlH7bbmN7gwxuVYzlCmpeU6gtFEsXKkQQIMm1nkeIRdLc7WJD3RlavErS4LKTszBNT56/nE5mH96sOIzw5iXBBO7JtKKGtSkTJ4z6X2zCeY/6rvIUxGgcA1AJArPdGA3d0IcgavYiWl3uXoApn74IdawSeRsaqbpMq+39+2Q05YiRLrySY8R2qfnxBFjsGohsR3LeeSvHekbdn6zdBiXUG9CIQB4KL5JW2x2zb1quw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfN4zg8/yGWyRcSKtiFAAjmcTz8bYHreA362VO5FVUk=;
 b=jNkr/OuZFc0JbPa3LxnSm+uCnx97xJNC8u7JkwwRD9eQiPBVeAJlP1Z8i6M/F0PGKbJVgkirAjfAR5OY4D/e8p20h2lphWodJaBq8S6dxUuvFPu7Jpw89NETJN36W6MD0VckakeztharIRociB3juhG0mf7Nk1AbNvUZ0d/42lyTKbR3AfHx9zMcgjr48KH1rzJpLPZahvFCPvHouGQdG1oZV8mp41J5oK2DAwh5xf28qNdNPT4Lb+Y5sUpjB4oOwD5SueY5nXj+GQ8d35BxKBdAvzmQM5ISwvpPKgdWaF9tUUq3Twyh4IxVrfn8JEKsULp7hzUIIjF9QdhP+cP/OQ==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 02:32:13 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:32:12 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-pm@vger.kernel.org (open list:QUALCOMM TSENS THERMAL DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 13/18] thermal/drivers/qcom: Remove redundant dev_err()
Date: Thu,  9 Jul 2026 10:30:16 +0800
Message-Id: <20260709023048.599150-14-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709023048.599150-1-panchuang@vivo.com>
References: <20260709023048.599150-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: d15aa487-6b9b-47d7-9419-08dedd624895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|18002099003|22082099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	PGLEoSjDqsMvIR0ytA+kyf5vu1IUKQxXVZr47kToA2X7YbQaw3NRlkwOCMZrqwZN2zZhvWUZTNvYlPNwu5eSE2qeulOwUonowFh5MT3kiRkKSI97rUOJeuyE3Hee1E6GJBM7I2Z2SdM7QxehLssLf76gbNQdldNYiir8+eIGtLlv/8HgwrQ2xMcWsAemmXyCuuh4iAkA/JnJDbGafijwIspm0Q3TkBv0aFoZx1aW6pdQnEgKR9P9meD0f9uEGkT2kd/nivU9/NHDKYMPexOWjAZEJW8gg6o1KTDqvspJJOoYxQP3SGojn4RZLK8F3I60tHpvEU6FfKpAjGBWacwqB28t3bykREN2lmA9b35OR5e3NsxEvsmo4+IVyhHIJl07WKXR+Hr8Ie+tvwdNDS66idg7kQYxIroW/S3Z48hdYOcSIkYqZie7BsQYca2vC5urrMNUW/MAGR0COHfdKBDNQgXJnlqhdzYK6H3cHrheLS5VHu/Nv19g6zpRms2VkyIeUD7igu82zk7cM3r/17odrq7zKAoNlVLFTXXgKV2db2vzdgIXfQUQeN1NXzhEHhsIWWqcVF2rDG/DaidwFDqSIB3AadDiUNuQAJbyy8j5h5kx45i7uuzIVcn4TxSpB+1hPPQBsNAoRXkYN99+zzQMSeEo/jdXQ+VnB6d0V9GH2L/j3ieeFWcEUMVytJ/nJm0aYaF3Ea7R40DLRvp+qFy7CmpUplxSwL43QN0RdNL/ktQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mj9Zi/Wwm/d7wnZniADIjUghRuSr9ClkzidrTewh1HYxryw37Hz541/UWwTV?=
 =?us-ascii?Q?0LZO+fgrPvM05ttVGypFD6J50vTRnnHvK2mFU7lyapmJgHAL44g0svfLvnSV?=
 =?us-ascii?Q?db81U860jOl0/qiKtJ8yG2jDLtwp+wAD3HSfs502RR8pZZ5pOMyi7bDxqUYd?=
 =?us-ascii?Q?N0q7taKd56sSXCzd5J+Lv40EN0Y9LtBaYPFsDT1ZtOWMaymd6HWtXBv13JCf?=
 =?us-ascii?Q?voEBwjtpuoRoz7GwMmI7UBTtm5F4W1j86n14uoA3gCP/fZ+uWrQ5DBR4K2rI?=
 =?us-ascii?Q?gprGamqbADpFZyDUwWbi10HcBh9M3oRB7jZiqYjhbXbxXi4XnkyWNZKHS1pP?=
 =?us-ascii?Q?9uDvIn3WIGzjrkGYrkcL5j/KdXPsA7ddV/f+ytIfHkQieBz73STrOYwdk1Mh?=
 =?us-ascii?Q?ryrV5EzYFqJLMQwHR0bnHt9M4Lb8Ge5v6LHqS/A2HRg/NVApQfojJO01k+0f?=
 =?us-ascii?Q?RO5tUG8pLo+H2G/6BJDfecHK1Llce6I7U/T7Mk8d0dNDzMYuG/lGOn9UzEhq?=
 =?us-ascii?Q?lyYmMplnYATQk6+A8/CVHqhvyThdiGXWjihJ7MemygAm4HyMDWQqSPR8emzo?=
 =?us-ascii?Q?cPNlDQ4DL2FSUlWGk2p1P4oCVPE3UpL0D4hywZIlqXSayGxTyBW8/Krx+VnT?=
 =?us-ascii?Q?MGevQWeg0DDsGssrWTxl11BNq0R2JND+AHT5JDrUQPaMdJ7bheDU6g8d5zdE?=
 =?us-ascii?Q?1i5bwbU5DloKgiUvfTpY57Jc8mamiONd9pmIIhogpgBGfLki1cAJvBmNvHP5?=
 =?us-ascii?Q?BUqYgUIImB9FezEue7ujR6883aXTXOB8lKoQyqW9A66oe6mTkHbrIB37TGzU?=
 =?us-ascii?Q?zuR5gMCMT10PkwDmLvpyDKeAgQ0ENmVzBHBT5LcJ4tf/lgpb3PzF39DFEeJw?=
 =?us-ascii?Q?PoqDLjoTm1/XdRDyhsmr83kl0duX31QydMT2SHr+oXIVimo36csH0cQTYZNa?=
 =?us-ascii?Q?t5jpns2nHS8wI3kZChdipIy0hLSaqyCyghqS8zS3j/WV46DTrz31z0Kkfnhy?=
 =?us-ascii?Q?POcDTJK5c8g5GMEjlXxp08HHJQpg0R9Y1h3caN/aB/j8vwUYRFBrLGQPqSIE?=
 =?us-ascii?Q?RC0Ff3W5acgEoCDAhup5aF9N1MAKTi6Jzth0VPzJ6d0fEF//3J0wtC9cdlSf?=
 =?us-ascii?Q?xgZtTiG0vHclwhwvSuDLuf9ESP4fVWhN0SoId10lY5DNjo0/61rIpbaxPB+y?=
 =?us-ascii?Q?MZXguBTGy+rpyxw9i365mVIJwQaT1t1MZ+TgK2kY8aJAzyiwp86v6+TZwGc5?=
 =?us-ascii?Q?apiT4dNqXg0DM+qKuDhOAzaZ5hiVl5EDJqOlDaL9Dzo/yqpA+RNwBWr4W1vf?=
 =?us-ascii?Q?jOiLAhim7gQdTqvKC5H+gaLygc1xLBoyA/7xjwT5Of7e875uo3Dg+em32zy4?=
 =?us-ascii?Q?Jzek4EE/Ny7RYzqQ8yTNqFXWNTmMYF6irz5qieLdSnDhL7IbGToUwt39kixO?=
 =?us-ascii?Q?en4RZdao4Qcc/vXS/Gg3uxq4WAaWVFSpDB+yqmrbcRTjF0UK6HEHH4Fo/TrQ?=
 =?us-ascii?Q?QWi3qTDbHuGOuEa1hQJrod5me291QI4iWE/hNhGMMcuBXwEHdCwUs1cns+Me?=
 =?us-ascii?Q?8lQpeRnbszOXekQPyeKXOAvM7hPuh66KQ+2Y/8LlBhogYiHYIxSBaG1aSziS?=
 =?us-ascii?Q?NQ/xcwqWaFnDNtxoT59v0UNP8MA/WeCnXMtZftk6sGi5B19zXybPy8hrZNj0?=
 =?us-ascii?Q?33BZmv3y8pMhhpy3kI6I6LZbh0AsPrzvRZlKD3ekBmz5BMfVpX6gWJesABfP?=
 =?us-ascii?Q?gWMRquaS4g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15aa487-6b9b-47d7-9419-08dedd624895
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:32:12.8807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqmVM7fm/JxoQHBMoJ42jljUJbq6JxkMbecR7BQKdOAJlkOQxvAyobdPxYSmcntQcLyUdqZT+OKplJ5hdAwzfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6278
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117823-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:panchuang@vivo.com,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:from_mime,vivo.com:email,vivo.com:mid,vivo.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAC1C72C032

The devm_request_threaded_irq() and devm_request_irq() now automatically
log detailed error messages on failure. This eliminates the need for
driver-specific dev_err() calls that previously printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/thermal/qcom/lmh.c   | 1 -
 drivers/thermal/qcom/tsens.c | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 3d072b7a4a6d..99396b93eff5 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -223,7 +223,6 @@ static int lmh_probe(struct platform_device *pdev)
 			       IRQF_NO_THREAD | IRQF_NO_SUSPEND,
 			       "lmh-irq", lmh_data);
 	if (ret) {
-		dev_err(dev, "Error %d registering irq %x\n", ret, lmh_data->irq);
 		irq_domain_remove(lmh_data->domain);
 		return ret;
 	}
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 6e3714ecab1d..b5ec70201e2f 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1258,10 +1258,7 @@ static int tsens_register_irq(struct tsens_priv *priv, char *irqname,
 							dev_name(&pdev->dev),
 							priv);
 
-		if (ret)
-			dev_err(&pdev->dev, "%s: failed to get irq\n",
-				__func__);
-		else
+		if (!ret)
 			*irq_num = irq;
 	}
 
-- 
2.34.1


