Return-Path: <linux-arm-msm+bounces-119247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /0otLWuDV2ofUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:56:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6959875E626
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:56:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=uDudbL9z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119247-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119247-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14133306528B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E435648C40E;
	Wed, 15 Jul 2026 12:50:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CDD478E50;
	Wed, 15 Jul 2026 12:50:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119849; cv=fail; b=JQPDxQEiEqNpUCzVYIWokFQ4sM1XdP+et5w//VPicKLG0ZNupBHPImuqf2lM+F6xnnzhVr3vRD87vo4WFvhhy5eO1iTFmYYulZP3KMUo/FamoQ4l6AT77OoapWEQJ5zhijy2yGvER/z8c2e7/blQGk92DU0uEyKtH5R+HHZd0l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119849; c=relaxed/simple;
	bh=p7zXwdZVr5XJ9+x5SPu4UnXRvwIpI/96e2en4+jGn50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GuW6JATxEa3VKkwoKuwXA+jRylJCvxxukfQUdbIf5Q8MMXv7OvesE+5WB8/W6Oa2yj4nipqWk+IIyP6EGybeDqYB9Ly3VPK0Pf5mlqCtRH+l7T0RdcRwtTq4M0wQTkBre6heE0wbfWgl9U8MpJoJ+lZjdHY+OXf5nkrXo195E74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uDudbL9z; arc=fail smtp.client-ip=52.101.201.27
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ds/XYPmHcvqCaJhlSXZDHpevaglnHt8gajyI7QjMwtvQ3jEJOnJRw/JQ/WFvlJ0Ajai7M1ce59/bqtfNUomM4n16SKv6yEmFYkqvOUQFRu1I59yOZM4fmkeBJrh7i+uWWS/feIJ1VCGIsMdJ71kfTxHIqw2ipwAF5Q22vY8jmx1Ibntex57mjVoJb1PJRHn2nI2W4chAdvJ3Plxi9b5Iln/WDbJYaEDXWaCVG2YcUGrA+Tp5g7NGfvGsGnP/cKaQBVRGQaT+VX2tCsxEXm6hcakoNPyqit6MA/YQpWWfpgIJYYpRXwYDoBgfczpL3hc4vKpmRGUJT66v7HJHaWkGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7zXwdZVr5XJ9+x5SPu4UnXRvwIpI/96e2en4+jGn50=;
 b=d5408WFUtCFWthCjPBfmH/43JVTLESQ2KygkS7rltKK04/Jpa1LYxWzxXchSSL5pfQ20Qsz4MxWk4sCbXQt1B8IsBGQSHG8CPUvirTTPVmmJlzzqwZpg9p3xqqlZfZkQgJCMyttw4KzYELb/dqbDguDTKjIwX+BYhyqAoWuDAN7E3g6I3DD1072BTUBUpfxCd38FgWAHtwL/VpIvdbQAqwflSlQoUCGlrAVIA31DDKayw2kmCDcu/NKhVxz2y6+wuWDNL/LLAT4FA9V0tuLW+LrwvDKvg7Ed2bBZN50PV8vM/AtqVzD+8PiyXKs9e2jAy+1ZmUaYlbkXYdbA4N349w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7zXwdZVr5XJ9+x5SPu4UnXRvwIpI/96e2en4+jGn50=;
 b=uDudbL9zylSqlddE+ru/C2h7ntEwngkNffDlsuoE9hWEeJDxij1FoHZ+UwJ/tvADWg648ZP5ueBwO+q3V4PTjGOGN2l4Uy9qH9QyEXx+efv9ddJdWjVsvppiExJ4W97smIJFgm4JU0z7Cz6Q3BREWfqiWs1Wh+veMLIlvf4KJTmh+Vdah4wIaDnQrncrFz6dbiv4x45Pv9Q09P93EGu5LGl2QRx896aH3MUyDQuq7iIgvI07kEqoe/YTjOEQITde/jEpJpPZ1AT1aBWFAiwCTGQxTkSxwcfqirWXvx9pLoZjRfTxETBmCxSbnyn4JOujGOLqCR/4059wEgRcfV6V1A==
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:50:40 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 12:50:40 +0000
Date: Wed, 15 Jul 2026 09:50:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Message-ID: <20260715125039.GA50536@nvidia.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com>
 <ald3CuddY6I7gml1@willie-the-truck>
 <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
X-ClientProxiedBy: YT4PR01CA0390.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc6f593-40b3-4185-87dc-08dee26facf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|6133799003|11063799006|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IfIdXQ30Fnr/WaZPuJJV40z6BJ10c15MFqt22XxCRqG1xd+jQMd29RPr1Ro6JTeRVvgk6CFP+cVnukiBv/Ahn58EvGGabmpr0XDkZXq5KmeugmntTv1O5Z6cfRWUmaMYVvPxjtjxfKnCkjZLoiLXRwflhiXAZTOOItnOrRnA4xtdJkbvIsnUojeyQSLQ6jquJfIirgbHwkiNgu1qh77y0dynHSLZtXnGSCnsGVWcFfdv5YKEx9wRZ3ZRdVyNzAR+CE08FbtFVqhONEzwffnqEAuG1qZ2XoNLA+2bx297EqAN6jN6KXY1CjzBPRZR/2KnFy8Xb+oH79gdjqcm5Ag98I9sjU3KUHywsRm3LzCyJdwlBuA1SqEHCRKhkJooQ7fecXfbAxhi7YCoUt46oFgeKmPVIFlVBKBpLqz5y39mMnHFEesV/5Jnsirk+3o57cSHi9qLGGHd+zVdQPKCK1eU0g7uLCXmmmT3RpCtFrVXXQKpVKQvhq9tFu8PNu7F27nP6T8YTvKQottOrj8uxTVEwex0JJC9insbR0/kyh21a3LHE89DjFijcoKRjdTX7l9fNDzGPszOgo16DDo9dIZtbnaUEAZTFjUaCwY8D0wBvHs0Vlc923BDlYanZUCIIu4h7BjWwlgW3qV85zpmX/+la050/aKgFIRhGQrBxdhBGdQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v4WqcS9lXepzMAcSPRvdJeBlhiukA420IZptWezy4pnhN0qihAr1x/kMG38P?=
 =?us-ascii?Q?0jq13RvxmlFwnB22Ihi1WHhcAT+xdiaG4rvG3h9ZExfXne0u/ipTX9fFOpqe?=
 =?us-ascii?Q?OpnpW0fJbkM8fxXwDKmNQUTIhJg5T4VOs2JaRJp1L0KN1YiF0a32jd7sScjZ?=
 =?us-ascii?Q?Dyf+RrkZlbbbxHvpjlpTquDfjiMTQJpzPpSevfP9oP3df43imgbM454PMlBC?=
 =?us-ascii?Q?Tqf2AhUEVAfXKGJazhnQH7LmhndSDXJ7dGhyL6cfzxR4sM4q8RN8f1kplsQP?=
 =?us-ascii?Q?+fiBr8kkgBYFEBvG3ZLs2OJ/fFJvoG+Ry5HPFjGC8uOw1aX/B59a12pxqx9Y?=
 =?us-ascii?Q?LeNNKEWMbmTnazCvDWUXwU+eoFOIfz2EdM/wEQ1bCtMtrhQoSZwFGD/R0a2y?=
 =?us-ascii?Q?UyzQS5KStVmAbwdw6oUUGzWVnuETWrJF+eo7KzR/9Ab2r2gRWzcBeylU3+fe?=
 =?us-ascii?Q?DhnO5x5ui5ke5oY79Hao+TXx7hawVNbkiT7txjxYMBYGOF2yKdfuCvoewv1a?=
 =?us-ascii?Q?m7Xjo+Q9gUo6rfr19CahuZ4ac++mrpeCPj5hq+2c6Ew2rLsQeHM/6paND4fz?=
 =?us-ascii?Q?1j6FkbZipU/Jw9xlGjE8D207CEXwSGG2kspr5vvQtoGyOd9Bm4fzQOaqc6EM?=
 =?us-ascii?Q?j2GLmi67h5pnZi166JuX2Twi77fXX0bI1rOvgddaZUpUSyGIvUMaIurUijlU?=
 =?us-ascii?Q?t45DR45gx2fmwKLC4nGi5dk7p10TSrt81Z6eAuXXDlq9FtGFq1CeEcu+wbZ6?=
 =?us-ascii?Q?pQQmdnw0aK/W2pRa5x/yCjxxRnhBJflr5GLRJAueEy4/xWDOUqYhPSghtXGD?=
 =?us-ascii?Q?m0xI52cbTxxjOs6PZelqmZAp3IWIejUIKFrzb7WO7WFG+LQUSs2DIX0zXnC1?=
 =?us-ascii?Q?fXdatjJrt9YYc9V78zGCTA34S56tfRnqImFU9LNCTTS5VtERpzNP18Mf81ih?=
 =?us-ascii?Q?cj14nu/sklcblLFyustzUcYUODEyi3BNIjZD1/MrmoWrJKutGBSU1jLyGu0I?=
 =?us-ascii?Q?ESR53ypvQw+EOHWZYh2kUEZa8acN6rsZLlMMxPDkAhRIR7ljoc7olP/WEK9B?=
 =?us-ascii?Q?JePi5Ug7i0sZCNmo5pcChI5vorB7QuD8Tel53XXl8IkZ1QD9QoGl6HdYbc78?=
 =?us-ascii?Q?yz2UyRbIbRDrdCz5Mo4LvNYPF10ZKcpnsp/HUA7x08zsmkknGtZhVkZAyaYO?=
 =?us-ascii?Q?+T626Cu1kNylwrNylh8FGrVVQYN4gpxawCUF2N47joPMyC4uwwb5NbK/6mhD?=
 =?us-ascii?Q?nBuiXbAwqPz2wTwFlscS3wLwT5ciqU1Pw0oaBuPuraxwJ72xg/kuT2e9H08w?=
 =?us-ascii?Q?vw/8/80FD4gkiOL8yzRMF73C46zdWnJxrlNVPdjHW/3UOPSBJ7ATEs8rpwGE?=
 =?us-ascii?Q?649QoOTbBruPUBzUxy9S68oRKW++O8/V2oxgdbtmFKQr3yeWaTF/5B8PU8Ji?=
 =?us-ascii?Q?ZSP0Lz+LbMxS4pW/PLp535JkBIrKqghDfQYYdkBSlrT1sN6V62vA5jQc96oz?=
 =?us-ascii?Q?Qz3+0LvbT1Rx7AGZhTj/U9v599al0Ltd253GW4CNlejGdagQiyOIMkqElPjZ?=
 =?us-ascii?Q?/cD3Yx25bMh9vq1qaGXT/p18Hf6Cup/8r3xx/pUu7bCOxoMqM4ouOZUaei2N?=
 =?us-ascii?Q?QXOTCcdpxMrSoAlyXr88AQjKf8KR4/agfJqKXtIVDXmkn5mMYYJKbkLXUYTq?=
 =?us-ascii?Q?9yCbfi/UBm1eSJMqJAjnTEoDbQCpcIZ+OaEHqacejN3p/b93?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc6f593-40b3-4185-87dc-08dee26facf0
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:50:40.5310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exGqfnNIiZVxAbHhOop5SVsP2jq+MeDHKAkhAQlqkIL3pDPfs1akx11Oiv4HSV9R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119247-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.murphy@arm.com,m:will@kernel.org,m:vijayanand.jitta@oss.qualcomm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,Nvidia.com:dkim,vger.kernel.org:from_smtp,nvidia.com:from_mime,nvidia.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6959875E626
X-Rspamd-Action: no action

On Wed, Jul 15, 2026 at 01:14:18PM +0100, Robin Murphy wrote:

> Conversely though, I really wouldn't want to have to maintain arm-smmu
> supporting two completely different pagetable APIs simultaneously either :/

Does arm-smmu era HW even support CONT?

AFAICR the biggest issue with arm-smmu was it using IO_PGTABLE_ARMV7S
as well. I think it would be fine to implement all the unique LPAE
features it needs in iommupt, I did most of them already.

I do have an ARMV7S implementation for iommupt, but I did not solve
the sub page problem. So while it is functionally working it is not
usable since it wastes so much memory. That's a tricky problem to
solve since the algorithms depend on the gather->freelist.

I didn't spend any time trying to do anything about this as I was not
intending to touch arm-smmu

Jason

