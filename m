Return-Path: <linux-arm-msm+bounces-116369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EreaCNzgR2rogwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 18:18:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F4270431C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 18:18:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=faxf8YQE;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116369-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116369-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98864302B0B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 16:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4170220F2A;
	Fri,  3 Jul 2026 16:12:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1242E173D;
	Fri,  3 Jul 2026 16:12:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095155; cv=fail; b=dfHpFnYg/qK9ss6wZISeoJNuXM1v9nJdOYJmbOBgnDGryXHEgzi0ZhBS54+yAWq3uETcaOdOex8on/UJnnPpMuQ23DgZ0lQsS76q092XB+okTFlqv+C643oKEeiV3Q6Mtf2BHKi4UNCLQPCi4JvKnGYKIF0r701KK9ENdFzgvQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095155; c=relaxed/simple;
	bh=h4pRzgRt101wCBviMXG/2yGZNf7Tphrm1fqaEXis9DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hknmO7yP1eImuchVGhPN8FOZE6Xdr7HK3VVrTBW91Y2RsOQlxKreADHbb6STNQMuQgVSZpfJz0idSZ2SjzSP7H0Lxn/CETAV3bijkRMpiMPIoeakyfw+CnlK8gNIzi76vnNZy5zI4heR1bazaLCwHmQqW7B/QegzDes4gnWfxiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=faxf8YQE; arc=fail smtp.client-ip=52.101.48.18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yy5iR+z8MNAg8jQJnqKQU3z1yPKIezUu3bwVxjz6+TdO0cQ3BmPFbL1DCV+kf222kyZFPe6KbZsLsEPrnqaa6AqyA0q4FcUVXEB0o2UDFHKOpQferRTgbRI+uPF424YIJJvu/+1qnrjOGlyu5d4zLZtxE9ebvSwFeSQcK1excVbpcGan9TO1ZvgsgY4QDXe76tsnsk4V4ujLKuLx5lx7h7wGhaCVUxeuIvc27G3ILH/EaSsV9vEofyvlk7N/j1XDemIfdeQHwQTsaBKIrnKLOP8kESMPP4J/ug/C9a9XDuewDl/5Z6+0gPyHEEYLo+MiskwP1Gb5RPMKJ2YwSxEGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXLTW8jhOKEBrmS8Q7G1prGT8hpi1UKO/oFzodwPFYQ=;
 b=JI+RwfeuwzRJ4p4ZHoSdmKTmFJxAvjGlHOxPtnM92sRgzJt5ie6SIuxi1yNBMxxbn0SwlihJSiJXpP3CfCkOIl3jo+3M51jUOVJNzqUOkdWu1L7QXc7IEKnRVZLzUu4RQLqVo2/xbDXsxsavfVcoVN68PrOxIbFYb47Tepjb94zA4W7DP2NKB3n8lppNUlq0zw8BMmh7mqt2gwCOUaJbLd34yHtnxFgfoJJskpU76SEfNv6nxprDMU08tUQf+DBnvJZD5HZLQllZXfORyLcmwgBSPgfCgXO9mqKw+D9OUO/qAUBgnbtK1iHMQNyQXXDeJNMJu6+PAxapd9MlxOe4eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXLTW8jhOKEBrmS8Q7G1prGT8hpi1UKO/oFzodwPFYQ=;
 b=faxf8YQEEgwwFkou2vKHXnx/V5RrBc57NyDJNNPSd/2h/3eWdTKWHZ4R+PnFMePNCB4TWk3fplvhQNdIqmr+3MEpksC3cGZHdJlv7jvviz1vic8w9SfwPIOg0x3oHGGvP/Djvk5h+OMgole8Xuqx07XqnKasZUme3abefA2cyIW51IrdAGwveMYYlqMii4m32H6Ng1YO00yGVxzB+7cZvQduPip3DJfTXXnoX/AZoqxZ/GlNL7CiUjCUVi8A0HgKhFg15R3f/boZSfL3nZU3ZLVe93vBFeoZhhw50jjVAO12COkl0j8/1AtG5oEhIGid73+Vrr4FM3b2LP74qNp6Ug==
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 16:12:30 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 16:12:30 +0000
Date: Fri, 3 Jul 2026 13:12:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Message-ID: <20260703161228.GA1948451@nvidia.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
X-ClientProxiedBy: BL1P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::35) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN2PR12MB4126:EE_
X-MS-Office365-Filtering-Correlation-Id: ef208dc2-7d4c-44ae-14af-08ded91de1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|3122999027|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	62YwuFVZsu4LoT/qCRs6h3JJuB1eTBsIhJkUVYQ235JISbrh4+y6KbuOdDh/pvDu/ONYOi66o3KbgSJYHD5wvL9llt8a8vjJDvVahZTEidaz30ffkT6XjlYcHUcxB+3sdT/jjfadGw62FQSBgABGkv3GXAA5X+A6tJjOH4Xopu0PKoGlJ+ijX2fLHDhnBlapQ6OBxtIcCTVWwncqM39dFH2w5DZXMFvsRrHdD2HvNzRwv8tykqEYbmADZgquBvlqU72a6RWlAR707boZVsRDplMZuHk0miBfJtCXacpNsP1PksCvfE0gRdi1mdZQBr08OpJcImtlWuEn3+0DMoIp9dRMtRZH3WhwWW12ShTEFVdmUs490YyYwJhGTDhWN6IHVHbPfsTQ9k+nFNdF52vcwpJ7sNXTrJp/e+Huw9ZBsbVoUrpZOhe+h1x8lCZDbYWE9aiEjTcQ3kZ0avFntmSejNHNp4Jsq2lf3jWGCYiNxY/0EqCT1/7R9s/WForyP0/0TVxKjC/n7xqjPfSq/JqkZUhqtOIHTzbhryUCLrxhhR7+7HMqv56J8XwObJepmDf8SlXExrzeiFgGeND2/Fp4oX3SUXGzQowjNyRUwZ1wcVukZvkgD56VOE4aCEj+tu5LpjhXzMuQjv6QJE6EbnHCQsVqt1nGW0Zy5fkzRwql300=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(3122999027)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M8AAp3SneTMOTkWb9w8Kvoold81xtE5Hg4nIQonhHc8FNXlDgd6dN122J53L?=
 =?us-ascii?Q?8DcuooPE0hHzCobuUBG74iBit9Q4mLMdPzhAS/M88Kbts5ejILjjXvBLxw4z?=
 =?us-ascii?Q?UfCNJQxO67fRCnpzJ7V4RydomZU+QUuHlnUGnEzqSk2gqDzUChWtG1yRj4A6?=
 =?us-ascii?Q?HhN290sZXQ5/Mgj41ZKUd1WuV8rZ3Jr9Jros4Qt0xBst1mdy/EIZ9OQaOLcq?=
 =?us-ascii?Q?OQZkVSQM0yG893olezWUZM/eCaAYuWK64AycPDqwioxcDWeialWBYRRhFz3J?=
 =?us-ascii?Q?w1sSrCtf6E1tbu6FRN0DTO6X1qwXdTh774BnJutTRHPLIgzl+BXyrsnotecT?=
 =?us-ascii?Q?fKdlzdcA1yKxwzZdvkdqDvOA7QTYgXgXZ09af+Hgiyn4ikvpfhnbJanvkQ3r?=
 =?us-ascii?Q?I5VHo75lvDH2vGwXPgRfDpiVSKH/Tbs5zkWd4/JgriwkEUopyHEVk8bDPJJf?=
 =?us-ascii?Q?XVPpgMV59AoqdTmMK9KobPtA6WMehhdx+mOESSOfBiKQPSDImX58mX4IA0K9?=
 =?us-ascii?Q?+aQnBQoGDN/yuqQR3oOCmfH7pgP91uuTSEuRTyJ2h0VcNkYuB0oMJRBM7qrW?=
 =?us-ascii?Q?FwvYVjVoD+1drxR7HWQcxpG54fnXjPjAdyXJmGXCn05y8YHZkF1OwvhG3JNE?=
 =?us-ascii?Q?Eow9q4bRU0JRW7I1Ko4sioSZN84XgamGJ8sxb88ESSMiL7mbWlWjY4d19ZLg?=
 =?us-ascii?Q?yBOmXc8j/0pEUhHA8eVi1KFr65i2D2nMzKs5ZGELvhYm8fRXzUbBCnHJXQ+j?=
 =?us-ascii?Q?fhVwU1+7HbX1aa07JVel4rSbg5LfsC1v8u2ViImpBW60PO459VYPwjLdZU64?=
 =?us-ascii?Q?lO8bQltPzlqvQreIW6XbUFylsBZM4MdodHgnc7TeC9XhrYG0UThTy9mhIiXn?=
 =?us-ascii?Q?mox3eIZz9JUgrpjWYP5gFmRgLjzZBHz8Eu5TEzLLNHzs5uCA35kwrklkPexn?=
 =?us-ascii?Q?vEkkZpP3oTwPHoGcsi4SDCupJjWgJOjmb6Y6TNEXav35ki+2mlFxzufAq7ZB?=
 =?us-ascii?Q?cVceNgFGybBTEejDo5i8rSvFhZr+eiJezWi4hs4Oaol3Fu1FpTK7OoT08LYB?=
 =?us-ascii?Q?6byl7z5cpwOMQ/IBumdJbkTbD5MyJugw5/i14/eAkmaBwauSW2Jx7AUoHE7b?=
 =?us-ascii?Q?2bpQAPm8XNZi6GN6WL4ogyMMj67yNbRK+CqA6WL7br8KrST/unDtDZlmz67b?=
 =?us-ascii?Q?ZJsy3bt0UuJ1rnSJaNziEieNSJOeCNMS+asc9ufl5tNtpSFrzLsNLGBSJwRd?=
 =?us-ascii?Q?rpXtWjwevgXOs5HhvsBxyckJRxr0IQSl3v69H+7V5ZITF6UsXQ1iMfgkfVzx?=
 =?us-ascii?Q?OnlIhrKG+AIT3cS87utriUID2jaAc7n9chsKYebzyEV/KIp3HXBKGoZJT7tZ?=
 =?us-ascii?Q?rDkDztKq8b5TC/exXY/2OFEXseAtS1/fUrvdDlhBF13gen9VoVF1c4F8rWmA?=
 =?us-ascii?Q?aTeVwt/VJCbUFFIsWX9hm33lNtySecD0PETkLsjYAxUQ7u7GcYw7l7vDj/qI?=
 =?us-ascii?Q?vEpqk4ZkLsB0CDGe4hQEa0YupH2hgMvzr/aKq9kYPFL8g9oWPwvG1qdyAF3e?=
 =?us-ascii?Q?xm6zjkIfcPf/LoPEcxquqsOWf//1A4dR7Auyaq3NPMCq7Aox1Hato30f5l7y?=
 =?us-ascii?Q?C3mljyfT/wcyYBUfm6nMMdwKvw6YboFmw6FcGJnzhX5NxKCdYzfjQZJJDBqe?=
 =?us-ascii?Q?CpXSJHwq+qtUvp22GGFhCRHUop5lVMgZZNCu+zPxdHSGF/A0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef208dc2-7d4c-44ae-14af-08ded91de1d4
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 16:12:30.1096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiHttKE89YYNw02nbZaQPXNb3XIm3Z/rumY1x/KYo5wm/3+LaO+U4RLSsOpFzuzx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116369-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vijayanand.jitta@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,vger.kernel.org:from_smtp,nvidia.com:mid,nvidia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69F4270431C

On Thu, Jun 18, 2026 at 02:32:09PM +0530, Vijayanand Jitta wrote:
> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> 
> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> When a set of consecutive PTEs map a naturally-aligned contiguous block
> of memory, the CONT bit can be set on all entries in the group to allow
> the hardware to combine them into a single TLB entry, improving TLB
> utilization.
> 
> The contiguous hint sizes per granule are:
> 
>   Page Size | CONT PTE |  PMD  | CONT PMD
>   ----------+----------+-------+---------
>       4K    |   64K    |   2M  |   32M
>      16K    |    2M    |  32M  |    1G
>      64K    |    2M    | 512M  |   16G

My series to convert smmuv3 to the iommupt takes care of this and
supports all the orders too. I'd rather we move forward with that then
try to patch up this.

> Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
> provides a compile-time opt-out for hardware affected by SMMU errata
> related to the contiguous bit.

I reviewed the errata and didn't find any related to contig that
required disabling contig, the driver was OK with the ones I
found.. Did you find something specific?

> On the unmapping side, the CONT bit is cleared from all PTEs in the
> affected contiguous group before any individual entry is invalidated,
> following the Break-Before-Make requirement of the architecture.

BBM means you make it non-present and flush, it doesn't mean you clear
CONT, this is wrong..

Jason

