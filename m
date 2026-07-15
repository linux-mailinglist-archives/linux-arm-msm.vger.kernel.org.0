Return-Path: <linux-arm-msm+bounces-119223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8B63CspxV2qCOAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:40:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EB775DA11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:40:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=SY2ZEaJv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119223-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119223-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A6D7302BF75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BC041DE05;
	Wed, 15 Jul 2026 11:39:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012049.outbound.protection.outlook.com [52.101.43.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD4D353A7F;
	Wed, 15 Jul 2026 11:39:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115560; cv=fail; b=ozmZkkEfW9VSwoKbXZJHyBHGPj+bm7vPBmu6axNCWn6fT0qwpAXKLCO2UzCfR+BpaLy+6IzWB6ao6rgf4vfkB81gHDw9ScD4IGKeUEUAzqvE8r2WMePMm94xamon9yKUEPdWLS+MpUfDaZJZZ4O76jsKODJDSuj4pUdkaaWpOjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115560; c=relaxed/simple;
	bh=FXJLopjFYhKsYF/vTAEx0lZVr37zQZvMer99V+Zvf70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tKP+QyDduoD/CabxY2zMmTJR7OoWrpzydlvDsRDYAXp36sZ95VqjFDy9CCm43s1adfxkPtHMejbFoeN0jSUKW/Ndqp/qjwZK1OLjx7rs92vASKRhRCwTOzizWlfZ4jD/weK6GPFkbrg4ub/KfT18LEg8csl7OUj2/WvwQQtBUls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SY2ZEaJv; arc=fail smtp.client-ip=52.101.43.49
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoeCL8yXpIPdd8cYNGYjUFOSJeMdvYwjW01/KlF0+wdRFizBcS2cskvwTCeQhGEP9TJcGB2lPftFVtQpq3lgnFMh+2mT+8H7CeYXjzm9hl7PefskvOqqmYSnuHZyVjbBo9s4pyNHq6ZmM+CPTeCF9ub71x6amqzXM1TUNyq9lPwdvQuOR+ogBbDgXjucOg00qWc32d0kpOaTfAwB0PmBJqWPJ4kjWlebM3w0MO9ZnLswvq8pXgcMQpgfpeNMPw50UeclBN9ftbPLNZP/5Ur2tYDjqSqpYHMVmEOzXMKb8IHay4b9xDcoGGxVHjAmNjNvI6DaqsaEuWwg0lNg0VoC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ImEeyGX/03IdqhPpHyL8+qMOdo9yyi9xzZSn0X5s1I=;
 b=osif8BnTKYzKFdwI9poNvJk/m/JVxqEPZjy0DP5C0xmS8XhHR2ZGZXiS7evbhxWy0Cc2xytve957oKEQljF1ceSUx1MJrygtUrzrooyKT8HCsKUqF7TKfL6pb7RBuDSEmCnqbIpUdP8ayQd6DW+eWDppZunsX1aPahtzvE5PxXNGPtdkmhkNKROxlJEjVHCX6OgeOBtrdfLuZszEsvq3tNgHHinNR9VRxdnjl/LP9ib0TqZP2Wx/+5FS2fMqItxGgaTyxPmzG95Tw3pYgWX+bSdp3uiJoy8cuhjRMx3YcEr6MLsQQMcx43ovl26Nfgm2xM+HeGAbmXH1rtfNZ0SerQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ImEeyGX/03IdqhPpHyL8+qMOdo9yyi9xzZSn0X5s1I=;
 b=SY2ZEaJvPhSgKxQibAlVib3lu9DKCl5fG3rMW2vZk3Xd2iFu9gb7c98xSd9Xc7UOd5dD7jc2Iareb33vnk6QGvxQ6f3Py35MOsBoYLecwV7UFL1dyp+yvXL8/R4LML/ocjsNDvhS8gncGI65q4eOdXrbA6Ap52ZyRkKqA1ohE3lCr8bWjEJhdxnktkO7HdwSAmSVoS1q34jZZhdZ10rni7Lq57MUfyDXhgPZFk0fGpR1HJ4h4voA5DeIwWqdZbymfKLhzl0Psj7J21zDKVwqg7+H1QeMjz2SP0fknhouxo5CARSY+f3uouDk9ldIZix8iuDOEO+mxLA/xhrR6gTO5A==
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB9491.namprd12.prod.outlook.com (2603:10b6:806:458::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Wed, 15 Jul
 2026 11:39:14 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 11:39:14 +0000
Date: Wed, 15 Jul 2026 08:39:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Message-ID: <20260715113913.GA3775915@nvidia.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
X-ClientProxiedBy: YT4PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdaa356-0718-4aff-abd4-08dee265b202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|22082099003|11063799006|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	HNCUewJ/W165KX6QYklsYgxdIlVhMTDhRgDhVKnXotk7yXXknE4k508jmI+XK388brmmkFG/Gt49M3CFpzirOYhGlBrWSdNKfF/keRe2tqdcoMQ3PoGd+LZeCJ0MnVwF2agLGujuUCqNb44YhYKNiLRuDktokymOSrSqIcby4m+v3lMFC1m7MBtV8gZl5DfWoNCQpnClukitD0FI/J6j83vzgRW1wyNOKhsxgVqwXyGP2nYt6mj1XuP3BeeBP0nV2NF3Y2C2z/jJmUdSzJlz1L4z81nZeiHZNdLHTlfAohFHUJJ4YkWkkPxKW12iGLHiMyWBACf6PTJPyPlFv7MOiPfq3RzmcY8/jv3b8ONlPQmdJb0sIU2bLaSWS4EaZ9aXHqyi+8+/YCaijV44BuWt5USvBy9n43xdgoxUPStlM0Y1S9gRe0oAqH7v3aLKQL/Wn4E4KvVVfx6aukiUzarrMLUl0TDBCnI/Px7+ZlRo8I/hW73kOfNdYPTliUEkCCZuLAxviZ3K/0jLg5m5xZq3wXmklFEyU4KqqbKKbhJtU7/ThFG9WsDa/iCQvjgM7sSd2Lo39pqScMWgHPU91bUaBE+nMQFsUm74tQPcOCV3+Q6WusHRULlDUa0Rh0rq/3tOPbEgzxSTJ9HA3zKdVVx5AOxqHSVl1zS7RufuL5KOUYI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(22082099003)(11063799006)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qX3zipOg9oZ1p2rupVAoiWGV0V15u/9AIQ8tsNnA2q6oIFLL+XrJJ1keEyoq?=
 =?us-ascii?Q?mSnmIE0Vn5FaXpN/7Mg362x2m9A7aWP2expgnFIO3yr2yBDB5dupY6xuF0Qu?=
 =?us-ascii?Q?bPm8C+Y+mgVyiQuPd4GZlJ/P7cDm6DEpZS6whILpb0gOIYlQ0+ekCP2Dq17P?=
 =?us-ascii?Q?fMnE9YwgcUjjFExj3ZL5UTfcJGcwNQaR6/aADtU0gT2Kexo8BegNSB54b8PT?=
 =?us-ascii?Q?y9kbgV5hjclB+O95w4HuddVTVOqd+zGuFj0aIdIPeeYhrwIQsYp3SBfU5Ks5?=
 =?us-ascii?Q?6IVbCt/QsopEoJ784blPpRNJDAvOejHE7E4fskR8k6Rxxl5XpMLFU76Q6pmk?=
 =?us-ascii?Q?7JmQRh9jZOrC6WYJ8ExJGywRUMKkH+sMnANYKUGACUEpKt5Y1n1c3LOaJYzG?=
 =?us-ascii?Q?vUR7rC/m5p2cghbWtuji8EU5JejRyvaOUVblEOGXTOw1JUkMpFw869KYwTJD?=
 =?us-ascii?Q?qbuJ6gB6y0W+97mxovm19j0Jq6fEt1rk7t/mULJy5azF4n91g5RBqMxMY6GB?=
 =?us-ascii?Q?h83WHqcPd/s3LK+n5hupU6q9Ike69vMOtFhrcpsr51JHCciBIB1ktmCrkONB?=
 =?us-ascii?Q?2EaFV68p2gsbNrSAYyQE86jslVK97r7NDRgZEVGZWuIDxOZFEc5EIe28YlLp?=
 =?us-ascii?Q?18U3kjbahB7gzEDcfonSUcb8i8EowvRhBTUkI6mhHYNFkfxb0OP/vJsU4gkh?=
 =?us-ascii?Q?HIVlR5d/CCWL0d29fYx+7TumJYhSlygOiEw2xZAPBDHYCVbCpiPj2JxdOSlr?=
 =?us-ascii?Q?td1Zx/ReteNa2CS6jb4nzfzQ6rdtcRZdtdyF3GrhLE4D3qzG92p53iJSYwat?=
 =?us-ascii?Q?BBwzg+9E/Fc3Abm6c/gWOpYsf+ZIiK8GoSz6/lbu6dtZpSkAkQW3u8WDSwl0?=
 =?us-ascii?Q?WHwQgIsSL8hRfQWu6fgQoGxbuhhGJDuEFIppqCb5Lhy2NWLw2PEPC8RvT6jX?=
 =?us-ascii?Q?SFg6duQvZ9OFmpWVR1zniInwHfdmX/4/5B7gIOiuzmES2AI2UO1USKMO2Vz0?=
 =?us-ascii?Q?Z5nt88z7exZIYa5va6vAEsMRxdQvbCIemftc2hWl42Ftcks1e5cwUENoBUfv?=
 =?us-ascii?Q?R3uCVNc5Casuk+k4Gr2Nv+kyAqjA7ZIu1qDs+KvEmm/OfWdia/ipM4moWBbm?=
 =?us-ascii?Q?Caz6SJtFqGetaLIT8jUGFRn+xPToKZx1oUl5eXBlsy2WGi9io3N/MtJRViWL?=
 =?us-ascii?Q?0drfB5RJ9eFHDPqDheJMSh3qYlI+96hsC9xVXA0zW64KSi+A8Jztq2piyEz1?=
 =?us-ascii?Q?31GYc18jukhRFKYyjsbEBCl87AxoH39keQJh7GylrkRG3ciz9lP1XmRhh6o8?=
 =?us-ascii?Q?8f+b1R4agE22dDmc5oZSV/vtJXnMa9h2kCkeRg+T+Av6Aec1KHKZhjur9r76?=
 =?us-ascii?Q?+KkPsSPYV8x85/+Q1CFDwLtNt7rCQju6hNo5DL9JakpFccp3cApDOhD8DRXe?=
 =?us-ascii?Q?Y0Qm09y3TkYoOGBji0cxf/ZoyoO0+pTMif3QAJzS+4XFY/G0i15MsJlfy3Aq?=
 =?us-ascii?Q?7XKNL8s7yKuyOoiM1SR/J8lxL1qnHtGr5KN4EtZIKteubH3/pJqSLiw9P6nC?=
 =?us-ascii?Q?v5TRyKwrVNJ60gJaEwjfkhtCdWnvmLkxPrfuX59mU3+Fq0GoevkAscV2itfc?=
 =?us-ascii?Q?rmN07Bhv71MFiHphjc0k49EKUSKoSyFuLTxOEk4r3zYthI/AvjCow6SpmeSi?=
 =?us-ascii?Q?Q2+IUfQC01p4gE9bY6Ja0uu8C2E0UJikEMSV12hze4/xVe4A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdaa356-0718-4aff-abd4-08dee265b202
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 11:39:14.1144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvgbelmPUjP9jIOD6xUFFq5xnWYP7FKWNVptyeDJDqecNychgey2N3IHgU2a6c5h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9491
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
	TAGGED_FROM(0.00)[bounces-119223-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,nvidia.com:from_mime,nvidia.com:mid,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65EB775DA11

On Wed, Jul 15, 2026 at 11:25:42AM +0530, Vijayanand Jitta wrote:
> On 7/3/2026 9:42 PM, Jason Gunthorpe wrote:
> > On Thu, Jun 18, 2026 at 02:32:09PM +0530, Vijayanand Jitta wrote:
> >> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> >>
> >> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> >> When a set of consecutive PTEs map a naturally-aligned contiguous block
> >> of memory, the CONT bit can be set on all entries in the group to allow
> >> the hardware to combine them into a single TLB entry, improving TLB
> >> utilization.
> >>
> >> The contiguous hint sizes per granule are:
> >>
> >>   Page Size | CONT PTE |  PMD  | CONT PMD
> >>   ----------+----------+-------+---------
> >>       4K    |   64K    |   2M  |   32M
> >>      16K    |    2M    |  32M  |    1G
> >>      64K    |    2M    | 512M  |   16G
> > 
> > My series to convert smmuv3 to the iommupt takes care of this and
> > supports all the orders too. I'd rather we move forward with that then
> > try to patch up this.
> 
> Thanks for details, I have gone through your series. As this patch
> targets io-pgtable-arm.c directly and would benefit all its users (SMMUv2,
> Apple DART, etc.), not just SMMUv3. I think there will still be value in
> this patch for the other users.

If other users care they should also be converted to iommupt, there
are many benefits to this besides just cont support.

Jason

