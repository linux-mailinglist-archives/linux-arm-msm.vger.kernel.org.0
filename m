Return-Path: <linux-arm-msm+bounces-117436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VGM9GJOSTWpu2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:58:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B9720854
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:58:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=aV1LlGzr;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117436-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117436-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 633563017458
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 23:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF5A385D7A;
	Tue,  7 Jul 2026 23:58:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C9368974;
	Tue,  7 Jul 2026 23:58:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783468689; cv=fail; b=QdPvXCONBU1KgzVxnPhC480sr4aZhC+31wukHo6kKFSXOBU/eqb0yyWt40DdKwlwrQY2fKd/tGotISG3c6R6XTXMPCVVN/hLfebwZGCQyDenEU2uno4zqiF4MwGPpyKzOS3DAwuXtsfWidbpaSmlwvm+zaBRIDJI6K03zwoK3r8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783468689; c=relaxed/simple;
	bh=whhyj9/4ziY6+PSRecc193r4pOFfgubtYxZuCFtLmnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N1l43RzZZGqcOF3DErcMrL4gyKLYfwe3/3yCvrcWuyTGMlJ4IAZp+v62IYAcL2n79BWZ3czCDsvqwZgWqdiiB2NhIATDO4DBsek7MxiSFe8+/wq5+YmdQ3538OQDJstVk3wsM3xEC22rmQUI1G9LQURyidISoQ7NKManpp969+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aV1LlGzr; arc=fail smtp.client-ip=40.107.201.52
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGe3p2NihnKqLNEfl0O/cYK6gDduYGnF5Lm2l9eSKtyX30u1moCgZ2n6cgUGzskoGz//1lEWSsXbjw0GMrx5Nqexelnbg2mvslmEvqjxGGtsAZ1mOaDmWMhO1CFln7EP/A85okZf18mHVIZUb2ACeouAP5rDt3CtJlvB554NSGlW7iowGc3qIwZ/xnw+YG+InZY9yUR6/gL71HxETnPeO62/H4LyTzKl5ueubRyTxrFG/51bus4/hLvTDr/lzsR5VzLQjT6nmkKcefQn3RB9nZRPOo1RBoL68p6wUU86Z1RR1L5gvFr701CmvoXYruxxigg7eSGvUNlxQcMF41CmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xj9JRkmvgJ0xLNhmYP+iTuru8yuqqGYQrluUKwrd9HI=;
 b=tz9WWdq4vleAslHRGkDd2Oa8RVmRNr78tUnLer7MEqIzncdCAkptGajj2q9kc0Mf7Fuzw+sr1jQ0yKdGJheRBhL3qLDQE+Cve7eZOWTN8EQmRCVtXTqw++nJx+nEo7lmALq7741/tpEsjKbDOHAKK0uNXnWSzlYYhDr5HKHQWtvO2jp4GKdcGGBqjHe344QWfrh1mi7UHfyy0ag0OqH5q72FZ3EnTlgaBanDU2+ooQm45MvktT57e62nA0ViRElo/gdh+0DmJoa6KMv7nCNqR7TwCLGEdnfVONLXpqiM5Doukqi45X0p9EBNLbnflaKN6xBeCqsgCClqqHtLEq4VMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj9JRkmvgJ0xLNhmYP+iTuru8yuqqGYQrluUKwrd9HI=;
 b=aV1LlGzrmpZeTt/1sFbbDfkdiaP1g646INmfKaQ1+DYOIE8BhmiETgS4uaHSNXdgWmIT9EemG2jpzYemgqnhMMvddhAAaPx2qLlrFvcLdLK2cXR4Mbw2Xz4r8EBrQrLYoaMq3mJCeNOraNX3VOnfJDnyrDGLE4A3q4Ec9yrfWI7UP3k1i3NOgDSw5UKu9iS/e/LTkRgbnmm2H/eJKSay5/FyHKmSCTtiYfDFnl9gvtDrOTuL+gQCFjoI5B7gwn6tG0blkWlJ/SpDiGSkiKjheWlX4tE3jjHWH92GnHil4EjY/NODgTKZSNu2ydWBeZ9LoFvlmIpD0JTHOhfPOsWwTw==
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB8450.namprd12.prod.outlook.com (2603:10b6:8:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 23:58:02 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 23:58:02 +0000
Date: Tue, 7 Jul 2026 20:58:01 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Message-ID: <20260707235801.GM220801@nvidia.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <CAE2F3rDR3PaiHo8KW26jTqWYD0EfG2mqbfEHhupEzHYENxz=Vg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE2F3rDR3PaiHo8KW26jTqWYD0EfG2mqbfEHhupEzHYENxz=Vg@mail.gmail.com>
X-ClientProxiedBy: YT4PR01CA0479.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: d6513d60-4ef0-4932-292d-08dedc83945f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|4143699003|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	SFji9QVPxNLSrcrG+AHhQyw4lrmNH+mdBHhXvxU7rMSMEWI5AJbenhQ5uAtZFpdKDcxMFXmIwl2+elJAnvcpwSyEhZX3aFA6AYdpIIcVHr0p3jDnLDrnfPUPIpq11yIHPzlDn0UGpTazj9r/UVQixS3MiV/L/iP+uPHnnuu7lNA9mRX2FkWCzKxmsAG1bhCgR+GaPcTmkfatfhd569EOfVmrtxTNg9CWg37qk3PuY7C73/OyN8BQxYI2TmKMT8fzN4S5zZb7llqW+CxnSFn3/UBhUtPjItbovSvciL20lMKCl9qoqtsBTOEzDpsFiv1hntMoQkfiUnLy4X+0Ut2TxtvMUXnuPQtaSUhCx1if8jJQncX21IZ9wB7WT/f4g2ILf7qH1JQgD2LYLB1v8SpePW66O4zSfHgTbvpzSwt+LVNS7IoocBBoJWenKAR/JH99ThNkI1DXDiY4c+kVenmc/tgoZOXC1oOsFWzWijxSlpIsJ26Lh1lACExJuWAlZw5oi5ylemBTl5Qxo8p7wtFbSS5UsvE4pRq5ypVnN/n6/AnAayzLsbdL/I3I10/PdtPG0X8h4+9ClN3iUmntBfJy0FimENZOe328qdHafTmVaw+hRY5SHKWzm0V2zDT3VMQWGT5Ru5WxNLrpETASP0LgUMzGDVYqHFDN96PAgWZ0I4k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(4143699003)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/HGF4LBqjcYEmPkDeOOYATWJmIHAKtviogPKTQYlGwVr/rr75Mp7DzB4xeS/?=
 =?us-ascii?Q?fk6MYiVJdhXLCsVjjjm3P3zp7BzvFygW0EezQ1iyAFDUdf24jBxpKCXdlE00?=
 =?us-ascii?Q?Kr493f/N7Fg2GVc+6O4eJnEnk8vqNK8tGhDXJbtDNSdGch9wQLJbjMcxYsj+?=
 =?us-ascii?Q?Jat5pMzL5ZGCW7OVf6zCotSIuMP1U4nzI3AV8ZJ1L/KJzCVOg520CerO7lDq?=
 =?us-ascii?Q?8BqR6nMVy1EZnVizkK/vWV+aXuacg5+WR+zRFK5JJPapoPKcCWbdZoXw1yp6?=
 =?us-ascii?Q?udfTQxLwSjhZeNGvH0DmsxzXueh4fKWm20fMlmMs40xA3Ewyj5/O5XR7cI0S?=
 =?us-ascii?Q?s/wSuRJSJ+ekGW5QyWxm3vDHgtlVbgI/qWAnra4ULsDVWFYVeN3Ct8AlfQTJ?=
 =?us-ascii?Q?tE1KpseLSAPuFyohp7Ct27WdHg6xI1bcSi+tY49XVp8Jp6GhAb3C+QPClSyd?=
 =?us-ascii?Q?OtL9EhsmF+DIMXUGkpS2xqOzUGaWzIugBAVgto7K6a9L1W3/6fye3Q3lOMFx?=
 =?us-ascii?Q?BXW3QUoMZaWRH7bJbZ1aAGLz6SMBi3upWjy4wohIlCxP9Ek+TYjuafwcHpzo?=
 =?us-ascii?Q?sBQVp7jPiQlsot8cn4VEevic66rNgMAndMbDuRcNN42ujntwE8JiG5hrBHBQ?=
 =?us-ascii?Q?bjdbRb7jZCd1ohNBFQDGI2yWb+sb79QoQx9oj3uLg8SNHSMkZExnqrbDT0Ta?=
 =?us-ascii?Q?D7kSDq8LB+m1wctXnNwGYsi9LAGUSfjrj8ROAMhl7ed2mT0ObRod1a1mbj6r?=
 =?us-ascii?Q?rb7w7+o25erp6xqQhs7UFhJ+OFD5zHNG8sj2IWAb1gtRNOi92NLpBAXT24On?=
 =?us-ascii?Q?MzgBPolTWK0YFtxbb1ACpSd+JXPo3fep9gn03PlKk5TnF9Qk9wFOdg0tLWaK?=
 =?us-ascii?Q?EuTmmlYDBo/8V+mrDnNOobmxlYr8Z7pGcWyrq3hvCKFPKbG+EJ4P8J/s2KuX?=
 =?us-ascii?Q?lyoolsoTPr1X2gVGFiduTWFzdpO3rVcFR2MpcaZt2HrDSNm2SA2l/Ji673Ok?=
 =?us-ascii?Q?BxFSRJ4F33fCGVdUrkxQVhOLlFYrDimfQjURVEARe7dIGo4ksPTUqjdz4xEo?=
 =?us-ascii?Q?8UxG7GW68965t9i652gqpbYLdOLdm2xxZDGb7oFzdry4pdjRh/iPRaxV4IVi?=
 =?us-ascii?Q?L2+5Ps9t00v7Hy/x9bxEyulIBXbhKK75FYzGBfsbbtXzprPEf+EoGMR73SAn?=
 =?us-ascii?Q?kWOfuvZegpnQs2t4pmTnRWUPLM+uhhm/9NtHx37fHxrfy4N6+yN3wocZeukq?=
 =?us-ascii?Q?LhphzAAHOdmOm/L50mhUwLi9iNKdFlRpqNHghFPm5S8tVsQG5kpDREAQZBUf?=
 =?us-ascii?Q?9EQ+/pT3H1OAY+DkftXXrMy4tq6cPOr+ndCICm8v4M4IfyMjGI+TMEVL21gm?=
 =?us-ascii?Q?5NcVMXfgvigRYHbYy0ohwFj6M61bRnp5GpuSqJTI2LQl1Gc2hPaCELuc8jb3?=
 =?us-ascii?Q?+cHu/QYHALK7gZ8QV38+h8z8etAyYL4o6dN869kQaYCI/qm/ZLa/FbgNAtvK?=
 =?us-ascii?Q?w5l75Qe7Xknu/a0vt6tKA+h6KAZvQPQQYoat6FvAGtT78ktq0xnPCH6irE8S?=
 =?us-ascii?Q?8br8xK+yF2g2g5wvhJuGZs78sfmMrJSd/1zJNxOZUBqzUMGvL/EW6autT19r?=
 =?us-ascii?Q?bwa9VGkCPMLV/ieJbR872Tcl0C7fuhesfvSJI7fb++BPZzZeVCBkma7WTpoI?=
 =?us-ascii?Q?lDcU2j3F+8FOde+ZwIus9HWrHhkkF5Woyrtj1z8F5MyPuLBa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6513d60-4ef0-4932-292d-08dedc83945f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 23:58:02.2778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fS4R+KaINPSfIAKjn/R7qTvYfYnc+lAgr/Q/XRN4bDRjVvyH/zZJtHl8ofyh3whu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8450
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-117436-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:danielmentz@google.com,m:vijayanand.jitta@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:mid,nvidia.com:from_mime,Nvidia.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F19B9720854

On Tue, Jul 07, 2026 at 04:04:31PM -0700, Daniel Mentz wrote:
> > > Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
> > > provides a compile-time opt-out for hardware affected by SMMU errata
> > > related to the contiguous bit.
> >
> > I reviewed the errata and didn't find any related to contig that
> > required disabling contig, the driver was OK with the ones I
> > found.. Did you find something specific?
> 
> Arm MMU-700 is affected by erratum 3777127 ("Under invalidation in TBU
> possible when using contiguous page table entries").

That looks like the same as the one I found 3673557 for Neoverse MMU S3

> However, if we disallow partial unmaps of groups of adjacent
> translation table entries, we implicitly apply the workaround
> ("Ensure that contiguous page tables are removed using a single
> range invalidation. Arm recommends using range invalidations to
> remove contiguous entries anyway for performance reasons.")

Right, that was my conclusion as well. SMMUs with this errata should
not enable BBM level 3 support which is the only thing that can
trigger a partial unmap of a contig block. My assumption was RIL is
supported in all affected SMMUs since that is the recommended
workaround..

Jason

