Return-Path: <linux-arm-msm+bounces-78056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD58BF2FF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 20:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B14AB462AD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357E21FECCD;
	Mon, 20 Oct 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="inmow2tk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010034.outbound.protection.outlook.com [40.93.198.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7166225394B;
	Mon, 20 Oct 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986014; cv=fail; b=a9I86/e6mwNdSLFVhgKUn3D6REiwqZkGdYTdNe7aRrWlzh87Fo+rH8fs2Uw06BscXHxgoIFSbAJN6WFRbeDlC3RyeOHK1zs+7D/fzhepuoO+Qa09OFb8CS6neIDTXOX7k4nkusi5R8QIpF/IDDdj3AbE8lQ0CAcoWzg/dr4JcJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986014; c=relaxed/simple;
	bh=3XUguanTtWujQiNPj1jGZdDxzJSPNB3CqCqXGqjoiBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FhCatGYjxizr++1f0HSHQaBrxsgV6fI5jS7TZE1xvcI0dVKoCU2f1GsHwGflGai4CH5/AM0m/Q2M2MO3O4l3mDEVA4z5ujXZA/lRB9p4lP2XKN5o+qX2ZQHSi9ESzzZTL/XrpwygQ0X3vVVNUiPkcmhUkygDxp/ZHl83R9AomfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=inmow2tk; arc=fail smtp.client-ip=40.93.198.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjdVAnAXIgFtO+llGDhI4uL92TbPJoqA5ZYjvPWJNeoenwOKFZEHgdszideVCpcCVJhnL2K6u9FhD/GtblG1vC/GjAPkaqILWWtLasFW0UMgQ69Ag30Oo9CE6otvi5YMiei1JtpyJ980VeSyO22KFIz0RUNLj0vI2zPBnSNiApHInYx4ObA8i+GXWLTofZtWNVjFrqttrgV/F0HHeceSS2gSebRJSYWAyJa7EyyIctlZ7htgyxCmskePYxK6twLxYK8icyhe6PoF/91xqrsgaojZT75vnyy+kHp4jDMW7G3y6Ntke4zETwqC9cWpyQNwOFhlumNbS29gFfVhn3cyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BmfKu1skaurNJv6v/yuPgDqUssPiZi+++Vt5pVNQWo=;
 b=HbbbNKGUAzpq3CJUvRtN1sEuGx5KoR31rByJ3AfTobZ01eEF8O1tvjBnVoYnht2h9m824Re8MxppLgkQfNVXm3pr+Rnx3FERJWj+pVLzRZf/wu9Vxu+WdTiHMF53NYIJs/lgHwJUujjXhQeophg9FLL5nHKaQFaEeZeZ6s7qiIUGrdjVpAOtsqPqfg/mPlxzXOzj2DnUJbS92LGI9bn2mAISu+iZ9A0HRu+z5zPazpC2GqKWCSGYcSaSNXrgrg8cG+QSqmQi38XV0nwv5u9FBS6BO1Kx9F9N2MHlrkA4y3qn8B9qQmaeK0F8JH/uuWfepROAqJL2MNCLVKiWhoS05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BmfKu1skaurNJv6v/yuPgDqUssPiZi+++Vt5pVNQWo=;
 b=inmow2tkbcPmtpkPe+Kc5J9SZQM/Fhvda4uG8PelloHEeGLu0QXZPcjCGqffwowFuerILE4vraUMhD8Q2djGhDqy25W3qu+jEppkpwFrQsonvny1AVFPTUP2ZeVW/vqT8PfmvHdEkbeh2s6yeGhw9skTwS4bT1TwqWeJTGuBuA4nY11qf0OXf+nvswloeK3gdMp8+xOLIR/GKcEpiALdroU8fhJBUca4mdM/8D+Dt18EhvA2a6gbiiUP6Edzg79meOa+x6ZsNeNowCCwzA78lrjUoTRI3s37lkOR4pB0LBFRKJ3uJBd8dHtBuupqXwdQ+zuTOfqOxsALOMx2RfkqhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Mon, 20 Oct
 2025 18:46:50 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:46:50 +0000
Date: Mon, 20 Oct 2025 15:46:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, kevin.tian@intel.com, suravee.suthikulpanit@amd.com,
	will@kernel.org, robin.murphy@arm.com, sven@kernel.org,
	j@jannau.net, robin.clark@oss.qualcomm.com,
	m.szyprowski@samsung.com, krzk@kernel.org, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, yong.wu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	tjeznach@rivosinc.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, heiko@sntech.de, schnelle@linux.ibm.com,
	mjrosato@linux.ibm.com, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	jean-philippe@linaro.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v1 4/6] iommu/amd: Set release_domain to blocked_domain
Message-ID: <20251020184647.GD316284@nvidia.com>
References: <cover.1760312540.git.nicolinc@nvidia.com>
 <cfa34723a0727c9f7ca3964419b26c02200388c0.1760312540.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfa34723a0727c9f7ca3964419b26c02200388c0.1760312540.git.nicolinc@nvidia.com>
X-ClientProxiedBy: PH8PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::19) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 831f8d02-8735-402d-0dcf-08de1009073d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DrzS7JrDAj92gnQr/zDx2oyMzPgiEI80hn6WPn0hDNgXO9wbITC1RKemmuU8?=
 =?us-ascii?Q?E9RT0Fct8lxkXxguSdVJbbMqj4pJ9MGKUapO0Ajfln2Foe9SHiCeq5MQLZ73?=
 =?us-ascii?Q?6Gk1N57dVOsAZZ8sE0MIjHQj3bjPa0ZDb1IvdBEAPF2OWnPuyz/3Cukuz+j5?=
 =?us-ascii?Q?7Fwf7rkQUwUTNAgVAgBJtiNbNi0NBikNMvXvdQGMT8+ghd1/fKV7utH1vAbF?=
 =?us-ascii?Q?sSAEvQInnofzzBqSoTVd+YgUbW0tuNtdPdbZKPkmXjJP+i7R1cDVuMSzT4GD?=
 =?us-ascii?Q?a2ApmcjdWJ3BQynXuAuf1u5F3u+eyWmZOK3c20tbeWtzsB+RrGsObCV2/VaN?=
 =?us-ascii?Q?/PEG41ZrWc/R97qX+H+qVTVMz3seOANwYyR5xGdKH+uGs3OKZz9C5/Iehlpw?=
 =?us-ascii?Q?Cz1eqSrDc8Fn9lx67mt89rWynv8wYQUMxN7Nr9CetvtkjbQzB+6T/zmhcLd7?=
 =?us-ascii?Q?pTr6TBd+3oMgZJQsKX26ZNzKW1zxjQDhd68Fj42F3qipxkYBt3DLo9Y0xKlr?=
 =?us-ascii?Q?jKsC/gj9O7419GtlRjLv60oMooPnMWBAV+2sfTqOpW5sFt53rpToZ4dxyCli?=
 =?us-ascii?Q?juBjsj/TQKvjhYznf49nHkI4OTTnqfdkdvIuPRdMBMlrrNjimnFUGA9xCFt0?=
 =?us-ascii?Q?uSCIH2i/73luPlgPh34DD/LZVQd5cwd64VN2TxR65yixuXE/vmIgnWziRqB3?=
 =?us-ascii?Q?BuZ4d+P9gaJAyshswkIT+P7wFhDlw/jEk/vqW7RpcKwX6CDpwJuA7whwYll2?=
 =?us-ascii?Q?5K8wiJdt4J0zB0ceyW1LLDs/pQoDpz3zm6X845IVS6zR6lb0pCPoEGNCRmLo?=
 =?us-ascii?Q?u6HNr/QsHoEch/KZpjkXatuoK69uhBYEg4Xv3f3hFDkNCUbxQ7wgNIt83VgS?=
 =?us-ascii?Q?M2D2MnkB5u8DZCca9RSfYgmjIAyFmKovsEk6S+ZS64mx9YeLF3z14JDHaPlA?=
 =?us-ascii?Q?OGZQ1bXqIjieU2X5bcfl3Z5VA1oFE7vpPV7HWp8naT1CXsjWFm8pnJhpadEh?=
 =?us-ascii?Q?XsCtXadEK/2T9ENFL43Fh1qnfn2bK34lZtcyUPVSWEBBfaux7VTqwL/7SoMY?=
 =?us-ascii?Q?T2wn7jb3dYMT4XvrKXA9KtUhbA91FU5cRerdaHyQsMoTcnSc7npX1gTMa2Cp?=
 =?us-ascii?Q?TvF5R2ozkDV87rBgvCqiq9gnvEdvOF+1QqdJrYTgBkGsg9FRDClbIhsL1Xz8?=
 =?us-ascii?Q?AnaBK6J2Dl6WYO74iHMy/75Ma1aLLJ54WHddOC+GmRCelbJnoJspQaJa9p+j?=
 =?us-ascii?Q?0Rns0siX1sp/nZ9qSnTEQ38z2PFW6Z1vx2qfx7z+zqKADdIzn/8CtRIC32uI?=
 =?us-ascii?Q?dZGUE2yOw5cJi2cCLczRrCcmPy8u6jjlFalGkejLMk3lgEawsKXPfISXmcwY?=
 =?us-ascii?Q?0QTuo5gNsgfm7E2BCT6X0eqkvbJ4YKyzCNUu75JN80IslGhK05pk8oBMSlHX?=
 =?us-ascii?Q?uaYRrbZbmM0upX1+jSx9ZRNcbs6ptqE0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wFCzZSvSGhXui7/KYTzQwVNbO5A5EfSXBJuxlmXap0c6KmTSOLzK/8oi0HxX?=
 =?us-ascii?Q?VKW0q+2Y+ah+Zv+KheTaUHzDXmGA3ZMBlaA9d3t7U2l9xSIG9w/ADd2+uAQg?=
 =?us-ascii?Q?ukeJattdd6CZLPe8seEceImcO0V9auSTYnPvP2NhLU9/tkIJjaoCa5jPcinO?=
 =?us-ascii?Q?xSy5aZOa0UPQZgP17w0ju9X0xHEiRZdROI5AKgvuZDJbgrqRMNBLFQb1i+lC?=
 =?us-ascii?Q?SsgH+6EmEdumrdrP4VYuIF0NjwzKRovu4kRhDwdiQ4mDcNM/vkFa78IrcZu1?=
 =?us-ascii?Q?+C67+b+RgHkVWdRs1TdNXNRJhlN5PJxKQ+2fypxUtSj2DoN2Q9i1fioMrRBT?=
 =?us-ascii?Q?k4Zit3rkBXo/XVy75cGeLcEDXH+cVt4Bc4TKrrcaqn5Wr54fnna2I1H22X+M?=
 =?us-ascii?Q?l45uSIDkSdNLLG0WHdrb2NG9CCFKvX0d2MLOecxfB4IZo9uhI0i9Spxl3k5z?=
 =?us-ascii?Q?ByOAGWRjjGGlMV0qpTQlNFYBIbTypSsIOkxmyvAFWIU9Wm/eViFdsUkOUrzL?=
 =?us-ascii?Q?M4cY/UXDbmjFPeVjTWCsh9qKrxb8P0bTfiaP5Dic+memJiFJZhlm3+K/ylzL?=
 =?us-ascii?Q?EUW8qFO3ZL+MZPTRv1DMh1o1PadmXfytd8f5Tb7EAUhgEWwQ14zCn/fv5jR0?=
 =?us-ascii?Q?9g6nW4vjYvhumj2rZ+4Aoa/j9HGi+VEkK9imDzaidlcPcblHCIgI4rNjB8Gb?=
 =?us-ascii?Q?TKwYLzkzn+gn9Z7obBYCQvKcDdIFcYkDiidn1WHf3Zahu7lrhERXd1ifzt58?=
 =?us-ascii?Q?rIFCbWA/azcr7xm3IXpT0EJb1rO8xfrvRz1WzPn9kGAhOVI/mUyBJ8uK60oS?=
 =?us-ascii?Q?Pyh5wlYgolfQO0NK3h9xWXOq+uLSaQzzUC7a9a5BOfXcVymvbPIo6ARb0khT?=
 =?us-ascii?Q?eP15tLTh6QFRFiBUoD9CjPv8fU6zSyOjfBdOmMHiPsAnm9QyFsiN0aHo/M2T?=
 =?us-ascii?Q?gXkSNzWChv0ooUYGA/8EFk1mwd3QG3biZhgOr4MWssogkVHo72QaX/0WiL0Y?=
 =?us-ascii?Q?lVO9rauLbIMrWWnsJ8QqF4CoDHoFFt3DLnHiHSDpp4dQNI20byhwgTh+RDc8?=
 =?us-ascii?Q?k25FmRfGlcLHiPrqgFzKqSs83bn9KG9i0blH0iDYiKFZ3M9gVrxJYAT1cmsz?=
 =?us-ascii?Q?WT4Kqlfhi/g9ae+b92yZ48U136XITIygApcE0zvKKJKRWj7MhT5ijM467c9f?=
 =?us-ascii?Q?c3hDOKrqHW7iN0HdRR9p1FhMB88YMw0J7obmkjLZYc+meoMYHKLGaK63g+q9?=
 =?us-ascii?Q?nKp8a1uDuPmSQqJw6RO+Y+FzG94qEKQVCYuv7xKuHs/tQicxoUHvpEr7TXMK?=
 =?us-ascii?Q?qgrgqPuGhkn4NwO6PrOhkYZoLbifNUeqLUQLgrFKZ3tEm2d3vmhrYSTQex7D?=
 =?us-ascii?Q?EAsVtdRjXUmd0u6H5YdGv7skTKxIB2D5wJd2GD16qdvY9UNp6859oDNMyD6a?=
 =?us-ascii?Q?+wmM+JH57XMMihsR7gtswBGbfWlzMLvqcFo5fdm39a1EXJmvWOHod0GRd8Ut?=
 =?us-ascii?Q?LqKy4eyIgeujkM0EX7OavwLqGSDhP8cFRHkCax/zevxRN7zjCHJNNzSUabaG?=
 =?us-ascii?Q?ZFQCAl+mo6bYiEtD8FD5ajBpPusfsJkYsjOmqWHK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831f8d02-8735-402d-0dcf-08de1009073d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:46:50.0874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNPqwVTjPX8cCsOoD7SsspxtlEWSZzU8ONRdQBhWbsJ+958CEvmOYcEGBPARwnDI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650

On Sun, Oct 12, 2025 at 04:57:40PM -0700, Nicolin Chen wrote:
> The set_dev_pasid for a release domain never gets called anyhow. So, there
> is no point in defining a separate release_domain from the blocked_domain.
> 
> Simply reuse the blocked_domain.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/amd/iommu.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

