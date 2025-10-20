Return-Path: <linux-arm-msm+bounces-78044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA5BBF2665
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCD664F9733
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640F3296BBE;
	Mon, 20 Oct 2025 16:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UCANsZOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751022882B6;
	Mon, 20 Oct 2025 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760977462; cv=fail; b=ZJCgXk7ZTf+ZNeQmUfeHWbi86FMROaeP/8erRrxTYTCGLe+dlsrqVL2PXrkpPEQ8MmD5grcACvBfB/TxL8FlSpz7hQzy3YYU6aHksHQxz6RHN33GwL/PKnoTwaX9uOD38W3BJxRh384+BCyesxD56EvSr32lMe6P63CMh4PeW88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760977462; c=relaxed/simple;
	bh=oGmvgESliwaYsYQ5tewnlDx8rOw6aN/2myMk7/0Lajc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V59dFpGDl1CcAZ9oiXgCRl1fd3dk+JszZTiuj7erJxAjT/vHtOkQ6npaNE99EeEc0GWku7hu4YTvLR0NvSb4bPEsZS37gPajtjaWNZoErJPWv+p5ls7URzjtLnX0bCA++WB9L+ajTWxKnBJKKKS7Y2lqamO1QtkbX61x5F7FJYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UCANsZOu; arc=fail smtp.client-ip=52.101.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPYBS07ddWC2eITtePmUf3bGa074fT4zY0EYTTx8FJIGTqKO20E+OTFcBj9sjlOgX2E5Owyqbi0MR4VWhdNCRNJ4Z0wiW5nhxd62YwLvtv+ndNWZ1Un0HlnPkAdxp5DNxgZVZcXQtnG6TIXzhBtSrQAdcAF2//5m3Kkqxjo09zf1D9ZCWoLjrQrGEAWSimxA8RStFEyCUt3zw8rVfqaOAqkmD9QwL/o3Yr+eI/pQ99OZcnM/Q/lXcthnMe6D9m69QWxKQFSdsppHTO1JQZdzYsv83x//DH1oTwRhKiVE6oYy8sYbPYcf5tt+dpjuGdMsytHCfrwD1rLxp0exqYMQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyUc5iuG831VbfI5SzDmKm4lT6vli4Yl86xP/5srhLM=;
 b=J1xmrqt06wYz9srLyK57ng5FXN1Vuww7+n8mvZviD10JWJ9BZrXBJ3wSIs3In8ZeRcnYRWkxEprJGe9AqJq8o5+/ynhYuS50iNOYIxGrtKD4ax8Q5AqQh5qmb/s3u3X9BmfUEYBuKtWgFHPgov9nx7FxVvJohDTfTxbf6+bZ5wmK4CEf1ICBuwDhE0JtI5vsiY9LZWZodKne6QY2CtgEk85flPs41bukPTaUzm3LrlqaLcvx1HgnJKBwyOMZ2q0W4fuVwG4QBWCEF8FSXM86j0EZgcHkKj8hLz/Bin+1X8nMKdYVY4+d8nfxK4VVGtTS5f8+9eOv4yc/hkQN1t8wMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyUc5iuG831VbfI5SzDmKm4lT6vli4Yl86xP/5srhLM=;
 b=UCANsZOuDseSbvkw6ijKMFj+bCulmCcHdW7mjFH9l23UPXzQeMwo004SQHziVRZWS20HTU5AW+0bAprQwM2eDzuJqTA6HhBBfV4Zri0CFyptXYgc9dXOdRTjvf/m2EIR1q3ycqPqDnyADUuoUQ+NixMbzCczo67/H1jSSeTlHatxpbiqZo/D8WPF1ghHZBQc2GDFvlZpP5j5A7YI0PNqjD6l9oq7klAuzvhELETi8xLyIyKz1y7d6j/i1uluMB3hKIPMPk0ae8P6+oCvla2D3tY0tNR+zYuOh0ih1TWBqnKfSwtDoS8Plr5jPSiPH2TQDZVRVdz34K+fe7t6pvJpjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Mon, 20 Oct
 2025 16:24:15 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 16:24:15 +0000
Date: Mon, 20 Oct 2025 13:24:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, kevin.tian@intel.com, suravee.suthikulpanit@amd.com,
	will@kernel.org, robin.murphy@arm.com, sven@kernel.org,
	j@jannau.net, jean-philippe@linaro.org,
	robin.clark@oss.qualcomm.com, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, yong.wu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	tjeznach@rivosinc.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, heiko@sntech.de, schnelle@linux.ibm.com,
	mjrosato@linux.ibm.com, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH v1 00/20] iommu: Introduce and roll out test_dev domain op
Message-ID: <20251020162413.GV316284@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1760312725.git.nicolinc@nvidia.com>
X-ClientProxiedBy: MN0PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:208:530::19) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc9faa6-6734-417c-1841-08de0ff51c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LtCyy/i1pi895cOAcfvxnnl+cs69FVyT/2IISez8W3JkuE0dUfU9jnIB+e73?=
 =?us-ascii?Q?n2xO5lwYeBJukA5Fk7FiYj7+Xvn4UrygYIE+N69H3hbEcnDNN/OxybPDf3B9?=
 =?us-ascii?Q?1GBdqCG4FcQ4eQF0kz1qpzaVMXDOQcN4wI+Cn/uhEk2v6MOcAEI3N/k4H9Gb?=
 =?us-ascii?Q?HQokBRvkXPK5Dj9YnoPWYwaepVMsp5b/uuLkATBsEosOqMPfWtBUulaZN+a3?=
 =?us-ascii?Q?Ob6ZPxAdnyFl/RwR8B0UYbeuYcYVB91aFkHHGomsGm987f2v+iPmWA5lOOM0?=
 =?us-ascii?Q?Z8Qx31+V+ck4EAGt2HsJTz2UcHD/F/hWzUWpMSkvysM/Bz8xfpsQO5aa5Iph?=
 =?us-ascii?Q?AiN951Un2hqk9Vl/YYl9WMVsoIkWeUen7wLot/CLMKAGEpsDn4XvgAkFUS7C?=
 =?us-ascii?Q?jmwL5+G7DrhUpipIPWktWegsUiseoT6xcWIvRbyzDbNEWhoAbdTPo2M1j2Yl?=
 =?us-ascii?Q?xS2PxPK8IJAY9l2CLDnH04GpwGjC3gCMhJHQXD24bFFmqUSnlzPBzLwp7WB8?=
 =?us-ascii?Q?3jbDckz2eCFZPPydQ7KPSa9iUQVbcxPcNHJzufpgxKuVf9UVRImqAWZTGYy7?=
 =?us-ascii?Q?WoijI63/9WJoros1qxOc/YeQa8I/SLwXXZZiil3cuvOMTFBiyrYY8lC8MuxE?=
 =?us-ascii?Q?zDmUusgEaOdnGjsZ58grq255LpG3XwJFXQU2jBirwJ7+O5+HOJO81385eet2?=
 =?us-ascii?Q?FtnB/PvM1SSKyiFfetQP75j124NA9v5w73J8fyPj9o+7FjXIhNLOYsNZtcTw?=
 =?us-ascii?Q?4CG5u7DYQR2FZpyHvYJbWGneJk8anP28lfi+vCdi/P+VFHlM3INA3mIO4hVp?=
 =?us-ascii?Q?f/tHYaZgvH8z8rAAO6TfMrQdAfKpKUTxGFR/VkNpSz7V3dEB1hf+iEw1Z1qo?=
 =?us-ascii?Q?NyCkyYfflC/ypSe65vsdEPsMy0YbZxZOynaGECCbaDDiIJCdyjg4+5EXG9/j?=
 =?us-ascii?Q?dLaEBn8cAiOM82eUbDSYVYj4LqmFG043vj/y+aerRqzlTECjUabs1ttgn5IV?=
 =?us-ascii?Q?yywpCfxVMBfks2RtrJ5CDwPn3WLo4UCjjIppSj6CePL3T2WwmGBprlyfNWKA?=
 =?us-ascii?Q?IBlJaJq2u7BsCOqNMfJJiQpw7aYZxdBXgd4ncAVmsyaQfI5tJ+ufNtvzm/d9?=
 =?us-ascii?Q?u8zaiZT+SOFYcam6GkDfJeNz/UbYbcRlVYMnZQg/HMdSPmFw694VCQIlLZYS?=
 =?us-ascii?Q?jCygP07KAu3QXo6B+ZzrwpHrBY/XA6PiXBCL+1W4u22FQaPU5XWG/icOeTF8?=
 =?us-ascii?Q?YfgTcPL3NvlsbjRl/ljJ2virtYxCZXbvTvBRZ/ERUO9rtscZO2tVsHZm31Au?=
 =?us-ascii?Q?DKa2ngz8yOsrqqyipwFKCEi0RkXNN+Gc2aGg9Ey1U8izs8GYloM4Fa6y1LNM?=
 =?us-ascii?Q?TqipZ3kCp+qtoz1feeFZbv2nsPqW2kxaCKLQHEwjq6SEY4I8jbUuIC9ONAhe?=
 =?us-ascii?Q?VYMPZUDoNJHT5ZaK4bMwWJlee4Ic6kZJyeJqUlkQkLybhZ1PWDaJfw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?decPrwCF+RX/ht+phySzMsnzldOrq/5d3LHvbAK9eyOIxghCtnEowZhsOhuo?=
 =?us-ascii?Q?3QyvpGUBoMKHuCRaIUk+v4eFlzDOKhv0G/YH5Xmn+385Y6KkDZU3ssfk6wSJ?=
 =?us-ascii?Q?VMZvgdQob434HsIUk90Us0+g4NiKboy5x/hN2gYNQl7kU4uLBfVheU5QdNM3?=
 =?us-ascii?Q?+DwuF38BcKkx1JLEFMqblkAJot4FjnCTmdLjgXXCZtTd/m/Xx3bE0pp+17Tz?=
 =?us-ascii?Q?unTk0mXqM0VWeEfhK+fZ9AWcjcgaxqwQEBmXLjE9STpfL34CkbgAcScaMn+2?=
 =?us-ascii?Q?geaiTvzYgSPDUlB41bJAW5GHYmrX+5H6EJ40wAN2izQZVMhan8eY7XBHP2QG?=
 =?us-ascii?Q?YpmZRJAfYgwBCYNN3jXoOb8gXYqohovgWZ8zAV/ajKTrNJT/PjPjHjsdQUKY?=
 =?us-ascii?Q?GqonjWgX0NGZCh8wFgAknrSy74iqyKghI54lFWUMSjBq/hNS7Q2rVwrd17Sj?=
 =?us-ascii?Q?IKtljmSle7u/DNbUfISDB5mm/wb/tjG6Ke0e7ykDqPJnS5B2lUjmR7Q1rA6F?=
 =?us-ascii?Q?6WjgstlwOW/HwgQ/4D0LWRI1pLgbyvNdirqLGr4RvNN6C+CPuv/0CIhOF6x2?=
 =?us-ascii?Q?eYd38EgoXSkz0TVn8UBBxJBNTy1qoazH8pqsUWDYqz5OQzqUjNPn+lapsDug?=
 =?us-ascii?Q?MPLx3SrMBLre7i9nLsjv8L3uqwNDRwt92UHq0bdjH59KuKr+Fhlwdoh399JS?=
 =?us-ascii?Q?YksvKyytsbOnTm0tdVg7bfiSPoy26G6sdplfYqn66rmWVW0+TYS7UZb0ANDG?=
 =?us-ascii?Q?IV6/8sqzsPB2tAefV2J40lEZnIBNXZTt+Om5cwRcg/ADZz+Un5/UU3a8VJ7p?=
 =?us-ascii?Q?UKVD46JDz1ZK/Pod7u+oZkulKcS6qzfPX5+4Mw+wOXx8dsnptd/3ljBT2X25?=
 =?us-ascii?Q?4fFTkbMcZS/6carPYS/eaIm91PWExu/8ghjnSHcI1CP52XuP+xXZpRredfS7?=
 =?us-ascii?Q?IVZSsfefOTuXQR6iO8ByjpL8wm0pBmXpT4AB70MMg3p+4VZDhwBwKT+OjDOC?=
 =?us-ascii?Q?aj7G7InbyeTaBIZhXPd3pbo8MGS+bs8lASJslcn1BbIZWe1QNdZitabISuR7?=
 =?us-ascii?Q?SMxvj/D6hAfaVa3LrHn8Jxwxt5Gp8+gnuvKcr5edZs3iY8HXoy3XCiWzwyO5?=
 =?us-ascii?Q?LQ4fsrP2pbyZW3Pv2hifXsqODvRc504Ud57xqWwh7KoqS/d2vyfESC5f9A09?=
 =?us-ascii?Q?W5x0Rmglqrz1gMfjcw6n0VXUdmeTuJYQNP2vXwb44aaShIj9sJbS3iAK/mga?=
 =?us-ascii?Q?SeJiIUTLzs12zGRcJLqiHQtZm4Evre4bUAnV+EL57vUF5alafX2lRj/JZEof?=
 =?us-ascii?Q?BuWKS1iNAkcc2KSGX0Vf3QZgQG/Hq35j7Lyam1Q5Wg3EqiK0katnq9/gjtJP?=
 =?us-ascii?Q?tEeLKlruh6ND7TLtPGhZSIniDZv+hkB5Fdnb1uePMX/yFAJ54ekoLjVz0cTc?=
 =?us-ascii?Q?vUh4m+cZ7MHVDdYmIe2qg9V3Evwl4bbpnPjMxMWcjgyg0fJAMxb6q6AdIOdD?=
 =?us-ascii?Q?nTql4Wd5D8oHGCDwKVs5cve06zfVl6g+PPN4lpMrZhYcBzlLbCMzqtw8sj/f?=
 =?us-ascii?Q?tMOrJQfA5afR9ZYNnbOOEAXaDjXZlX3klz2JvKBX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc9faa6-6734-417c-1841-08de0ff51c2f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:24:15.5986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KK5U07vkHeSB3ho9wVznOCZd29qpN7dI24pod0DiJYtdKdKRFVWKlfHoi+CTax/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381

On Sun, Oct 12, 2025 at 05:04:57PM -0700, Nicolin Chen wrote:
> Add a new test_dev domain op for drivers to run a compatibility test prior
> to the actual attachment at the driver level. Any incompatible attachment
> will be rejected early, allowing the iommu core to postpone any concurrent
> attachment during a device reset state.

I had to go back and find the original email from kevin to understand
this..

 
This is a preparatory series for new iommu_dev_reset APIs:
https://lore.kernel.org/all/cover.1756682135.git.nicolinc@nvidia.com/

That series parks the domain attachment at BLOCKED during a device
reset. To keep the uAPI this also required that any change in domain
during this reset sequence is just recorded and kept in the background
until the reset is finished.

This creates a weird hole where userspace could propose to attach to a
domain that is incompatible with the device during FLR, have that
attach queued and then ultimately have the domain attach fail when the
FLR concludes.

This can be mitigated by splitting out the compatability test from the
attach and having the core code check the compatability before
accepting a queued domain attach.

It was felt that the subtle uAPI change warrants this rework.

Jason

