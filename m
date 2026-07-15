Return-Path: <linux-arm-msm+bounces-119243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 93yDHf98V2rSKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:28:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAE075E1D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:28:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=AnYDMpKw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119243-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119243-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB0C33010603
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F014945BD7F;
	Wed, 15 Jul 2026 12:28:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C289448CEE;
	Wed, 15 Jul 2026 12:28:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118517; cv=fail; b=CRLQsB+ncW/q7QzJ7qrTnSkqwZK/IIxRjVINAJZGIEwC+o4MUoHCIQSQj3I8oJUx3hbIlu+ApSHByHTg4lkXhXLsHKa0ncWCJ37NvVmSKJULpDnr8CG9GJi6pJw7Wbl6xnUt4m0ngj3K5JVt1veUuDhQdl639M5xYrrX0Up6mig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118517; c=relaxed/simple;
	bh=jc03ho4zpTeiZIgkmXzmDdigVbSwdPFXwIv5PN+rEj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CBpjNsqB2MHzkMOCuf6tIXsS/5nFUOKgWN62xYp5fW6UzB/wHxRuihY8cCruOJhozSwQY+ImOP6KX9qQFePfczf1C6i+Uhn1uyef2I/1dMrkLdso+YzVPTktlZsL/QOwPlSe+iv6X60hq3zAPbes01yBGZTmPYEBmwYVQqnrhAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AnYDMpKw; arc=fail smtp.client-ip=52.101.52.21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWD/8JbH3A7wLsCX4CTQ+bfRbn28WbRjk33D0KE9ZJs0LPnptHZToV+GkjTzE3nLjdDDUhZAD++qgfNQDYnC5l0qjZfuiad9WxpHSv8RLErvAh8sCH8JX8jXbELdxll5DsTm4iTKwWdCJwoypeKvb+gOUnHinSzHYZksGReUVFgEjJWJYaa9dlo6DvDn5Y/GqPMiVjwxvGxx5c3MxPBfV/zJ3FmfJ+5jalxrkPvD/gNtnxgHgVH6Oj6/PZl6cQOyU5mj8R9Sa4J/3lUwCwig9p7LeYk6pXYpFSabD5L4m3vtDj0TWosyVZo31xzXecIMQ0RKJUXPtomjER+QnQ2zYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqlFfh1vcigZYeBrbeHJVURj7mAIuSTt1J48yfaOaIM=;
 b=x6EREodjo41IFyNsn6bwxgdfRqKhiFYlaRC7Tnx1wqCdm+1rvNSJZZGTb4FwmcGgTcTIHzkcTOyuAAyj9RzAE+hgik8mk/4GB/jECQwfZKJIHSSfw08p9Idl4f0pQbkZ/CscGsAt3TGFt+nyvH+z5xCs+VrIz4MmY3R67gkSNA3zxMJVlIU30N0LuIE7sSQ3FmdRaFBueNHoE2F954mpuyg2AGjkq+wIDv1JA2f1mU+iWqAt2ihoRpiwn0lK3zbd69LxCRy5RD9vyq1tbr71X8Qa8y/By7Ni4OjX6r4g2ubliW5FyHZAS7NZIf8SGMLEBk0UzY2GReYJJp5XNnKJWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqlFfh1vcigZYeBrbeHJVURj7mAIuSTt1J48yfaOaIM=;
 b=AnYDMpKwhXmG7Q1gyjDq9KKToDowyLbQdZ78vvPNYLLM2IBuEpgEA//VYAj/HSORxW+FkO0/nU0zKRV1+5Mht2LT4CaYeQU3umXm9AyHXPn8y9+kkcFWxDHx4cgxEVebsuzMKl8/tZkbYuBplDEAtmSCkeIKIkDqXGY+D0SD6Ml3ZdaUHsXhdFilpoorYI/GFiojxV4a0qcpSVIH4Nm99UeYTqRn0NuJjvro8/7BhiCkDu05syrzGsVOB+y9LSSECV7t5ViC/gSyEt7SXb6JbScaI+2j5d6r5JMZciFNyEQ8/6VmsOhqB4rk4ZWn51WcEB4E3/kOk1+vTrt4Dm/r7g==
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:28:31 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 12:28:31 +0000
Date: Wed, 15 Jul 2026 09:28:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Message-ID: <20260715122830.GB3775915@nvidia.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com>
 <ald3CuddY6I7gml1@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ald3CuddY6I7gml1@willie-the-truck>
X-ClientProxiedBy: MN2PR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:208:23d::30) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 59cf8531-af0e-44b6-e8f1-08dee26c94a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	1PHnyWYD4zoC7R4+ytze2fwZ5xtnoFb++C1Diqm0zd23X10AEOXvlAn+paizOuoBvIbjDe1g1sysCDtobYWgVY1j5rSJoAYtJJZyyyP3zXZIGmtswVePOZ6ay6hpFQZjHitCTZdONDo24bmgl8jfhoPFfXiUjpcTDEDZblfP2OUwKE3VEf7akRYxnX+yxuR66at+DpZaXV9fHsZ2TjFYAnpsoIXUk23UxeVVbgmlDXw/T6AkxE7F1YA/kbXD88YSxaPL45SAzKHIi2vRfCUU15yPpTENLnlWo4GUn6iMx3zBR4nHslQquJ6SoY0ExBdLF7m0Yoh0xnh9Czq25xoobMYjMOX2Y6x0v/7H7KpmqbGm5GQ2y62UKlLp1SFjWfHBapYqtjMrdu7k4+aNMMv0B6RLMXP2a/6oWIKUle83TOOMPdlU9CVolnQTOo06hx7ePThvKnohgP91svSb3VHz/o+eylCkHl0sNsrDwoL2qMdiSreHQJRVgi7VXckQjdNYVeKURj/ZHRvh3Obnz9msxhInpgBvptGu1KwQYZVQH2cYsRBDA7eodH8KFbI14Bsm4VXhkLrHsrYKTLNTI+KUREnznUQahhu2ItI8OWGFXmyhG7mAqVv4pHu5qp9fnf3arjChb1l4px/sJBWWnjXVBRWZPXG0PCeyhq8gkeAy+ew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nW4lhVJL6VvF/ZQoBZBP+vUW+zwHaRggfGyRIy9IEE8dS2JPLE0l9hpnZMhS?=
 =?us-ascii?Q?IZJ0rBMqsqd1ZuHhYIW18/dYJTqkVo1DwOkzLW1bgDg8Yg3UWikk3+QMTRuz?=
 =?us-ascii?Q?gn8sl1lWbafEORLJhCMjILZy2zmIQajVHlEUVpn9YIJk6YlQFaYK0jbXWR5I?=
 =?us-ascii?Q?p/alXF/vV/iBN8Gyc8st+QRlJQztk0peSGmVtTnUf+S7vkMK9gFsp4lzl59E?=
 =?us-ascii?Q?RJQTntjGsTCMBP9+dp/JOik9gTdsunqIsuS7M/V1M550XRERtcbF7rmdrDMl?=
 =?us-ascii?Q?nlGLQkvpMhIUOhv9Zg8WczkX5Ew7Lm6F4rzbW7LHquaVu5eB3T16oBsjso/A?=
 =?us-ascii?Q?/feGVa28Igw9dfh4OI+DA+Dwvsm5hE/Ncc2nL7gd9tJwOtQ/djhcPS6CDLJg?=
 =?us-ascii?Q?52LSZgByyhcSI/zAUxSLUh4/aCG0WKDKuiHgGZ82rlf+1kmxeHW7fwOg5A0S?=
 =?us-ascii?Q?wqcVE1+81AcVx1ez6qu3CErEwDOr67OMv2d2DYLPbzImWCmIXKpq77kAu8uW?=
 =?us-ascii?Q?6blPEX1By5fiFUGYa3s0TXjdgKuJFBNVJ1MhuAPIJoSUHMaR1afKaS+x/Y6i?=
 =?us-ascii?Q?F8a0XrHAoogHUlPwQX74U3Fo+hI1S4XwrQxLxR8dqH2o+aEsTqDk5YwY99rC?=
 =?us-ascii?Q?WDdvOp5jfvWd+mwLsn7dZmNvKkAxFcKBGPJH3VYC7uBA6wYgmsmjS/c+rKXu?=
 =?us-ascii?Q?5Q5Vrq1fjPGzWA6AitbKvE9AT9zbXGPYrjfB8ry8jR+YAo802qc+5UGZ0w60?=
 =?us-ascii?Q?6ESctdQ0MrJ6rbEns16N0Q6RvnRyDB76a1e+Kv+pfE+CKEVxyJujPmdCnYl7?=
 =?us-ascii?Q?NlYNH6AOk54tvDUHJzc8OmSP3hiFrWZlmxaALBqZNe1yecuylJNKJRUhv1Wy?=
 =?us-ascii?Q?vpo1V9ApuXeZ1DTM/pFW99Y8gaHO8wDpKm+joEz86+QaUK5KzppmfcjcB+af?=
 =?us-ascii?Q?XVtInpJgjXjAQABpyqpd7UZG0Uf61ceWhUMNZNgR1gO1I8PERrHeobybTUJS?=
 =?us-ascii?Q?c/vndO+1HWpUSEYGLmRJrbxZxM7a3S2ZHA5MbcslgPrzbyIM+lZWdk7SNWAu?=
 =?us-ascii?Q?5wEHpO4eTMvZhlGY88VTeqGp90tTC8+W/vIgqr0ytYbhcx+7g4bKqAtqyu8B?=
 =?us-ascii?Q?Zzpv+1sxDYHKJ+rH3X5DooQtJyEbwzgQSSXGU86rn3NKAQWOOeZv3DjN2adg?=
 =?us-ascii?Q?zMCUsYTTW5UeQAK9ZRwMLsAGJcT4h+cpDS3iPY3aRZg3P5n9vHgLOZGDuiUI?=
 =?us-ascii?Q?bCmXzhT0OkRc0yW1DtVQpOLhug7PZxQnxCdpFJT3mBIfM1A+xcwnzPE/teL3?=
 =?us-ascii?Q?DV8NVF+ZIjJPrUg5H2bhn7ioo8h+LJkNS17MNs4g5bfx8PewZdN0CBDW+o/B?=
 =?us-ascii?Q?LNJzCE745qpQwuVyZ/ncG79+/9Cbek2AV60URc8DMrxo0PbaDJHROkQCP48h?=
 =?us-ascii?Q?3y6arV/+aIOZXcD/6D8zOAL5wk5eLUZ2q94CBMfV/YfudcljLBjrS9JbFhH7?=
 =?us-ascii?Q?uP+dYKlYMxqZZu1s9lD939n1mVdCILwvRWKa+Y5CDWzxVsNkIkMVnPuhd1l7?=
 =?us-ascii?Q?qAOx41tYZzHCbYJUsB+EazWqpkxxCGpG3nyWHjO+sTPZlj6awP1eU9w2WDNL?=
 =?us-ascii?Q?gnDuUKqDBY6vcP49P06Lximw43YilWE4+a7tHAB2/7e+i7Jeni6kQXVIPP/k?=
 =?us-ascii?Q?fNftWFzyU5AJAZeEtT7VhHlj+JnQTdDzECjfy2GdQhZ1lmyk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cf8531-af0e-44b6-e8f1-08dee26c94a7
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:28:31.3162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQD9aDI+DbkVHgtUSBQA18xhWNfslw8VV0L9we2Htu/id3HQMFlLpqjS4O3myAZ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240
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
	TAGGED_FROM(0.00)[bounces-119243-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:vijayanand.jitta@oss.qualcomm.com,m:joro@8bytes.org,m:robin.murphy@arm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.232.135.74:from];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2603:10b6:408:2a1::19:received,100.90.174.1:received,172.232.135.74:from,52.101.52.21:received];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,52.101.52.21:received];
	DWL_DNSWL_BLOCKED(0.00)[Nvidia.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:from_mime,nvidia.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BAE075E1D9
X-Rspamd-Action: no action

On Wed, Jul 15, 2026 at 01:03:22PM +0100, Will Deacon wrote:

> From what I can tell, the fiddly parts for iommupt will be:
> 
>   1. Hardware bugs / quirks. Some of the simpler ones could probably be
>      handled but for the more invasive stuff like the Mali format
>      format, io-pgtable will probably need to hang around. Perhaps
>      it becomes io-pgtable-mali.c?

I briefly looked at Mali a while back and it didn't seem so bad, but
that was for a GPU driver not the iommu so a bit different
issue. Exactly what the GPU drivers should be doing is less clear to
me, they don't really fit well with the iommu focused interface (eg
the memory preload issues/etc).

>   2. The pKVM work from Mostafa. We'll probably end up with something
>      separate at EL2 for this (ideally, just reusing the CPU page-table
>      code when it learns about BBML3).

Yeah, I'm not sure here, it isn't great that is adding another user
and open coding some of the logic (eg smmu_pgsize_idmap). It would be
much better if it could just use all the existing flow more directly
somehow.

>   3. Non-coherent walkers, although I think this might actually be fine
>      because x86 needs it anyway?

This is done already, the smmuv3 conversion I've posted supports it.

> So, for now, I wouldn't require new drivers to use iommupt but I'm

The recently posted broadcom driver used iommupt and I thought it
turned out very clean, it actually seems like less work to do it this
way than try to write your own page table like that rockchip driver
did which required several review rounds.

Jason

