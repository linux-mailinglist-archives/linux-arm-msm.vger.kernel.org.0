Return-Path: <linux-arm-msm+bounces-60701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422AAD2A52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 01:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE7DB170DF6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 23:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9F6227E82;
	Mon,  9 Jun 2025 23:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TZARcgCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C944021E0AA;
	Mon,  9 Jun 2025 23:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510674; cv=fail; b=CdRqfj+YS9wRrD6JpnjYbQO8te8J0LLnyIU232MqilcXweuB6FRftpesYkTxpZM3NqEnh5teUINFvBj21w68CmkvFpK5+BgC7kofJYOvpyvFfqHT+6g2NSpx9OzYZjpuRwzxPIhUxQ5g4gIZmXwe1T0LI2rSiBCvCweouOezzu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510674; c=relaxed/simple;
	bh=JWwy53uYeTNXpd68S0qfua5hrzdadZb5ayrJ/TN6lRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p+LQ1WHfqNI7utWbapXYQPBn4GLMmZXXe2WhyA49iwjqkLJ/28MIvxRKbjWDdrLQCc3gVj3kFM6XQfj86KKtG+yJizUyjtyteuvBbfzabmQQWNOrFzZqFVy/Ym3VjkenF8ryXncmXw1ujLWoY9pEhQmxe9YAX2gaEO1g3LSueeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TZARcgCH; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r84z3vNOsF/t67AK+wnfj0+9wdGZqdnYNTvZfnIp7xsTK5CQyJJxWZzd5yU/mN25ol1j/9yro1ZfC674Qax6mRd0aC0FCJdRT3//s1s0SJGPBAR4W5qj4f2X5DW5A1W01ZvzmJw/c++F9gJz/9f1havN5Kl8sx6wAyLjE4ImaKRK4ahnbGcKWsp0e1XVj/3amH8sAmUlQrg7RFefQI0weEOn2qutvCrwxZDQiAI6CcAJ54Z6f2FEvFproYrlLwQ/kAX4Vw9KKg6gvYpsxzm9kE465JgzyXgriNyuCVJwtSHBXXEr+hhNWzyle2HK8NL20QTqmGg+4IJVZ8X1PSMtsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsBPkx8jSrmC12XFb8zFQrHo6PRiEQL/cBnz9+SB5KQ=;
 b=VAWw+6JIlpUpipArDn+Q0rbdPTVNRB8xfDkUhkxdvFcdH/kut19ZgCUp4kQWQkTydnpy5alLNXEmeN8hvYG4cVbdtLkgSyJ8XYQqqw3Lk2lBVW/GNTuHu4uHy1D7C3kw3Gcq6uKez+D3vw8WUc0AXKuNuMzYdkweVwiPfug487dfOUabt4LDAtdjdSoSnAZrX+rqxoVYk4JRpLQmcGS40NsqNzyANz1oMr4h0maYa1eRIYKAntpVxB+ZQaAA7lslDPCmRSG99XYMQA8382c8dp8qL+DnzvITUD2E8ss6u0rJaSuPocugqPBSfG6tK1a6m/Ug/uzYZrMKAQF4qgP4fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsBPkx8jSrmC12XFb8zFQrHo6PRiEQL/cBnz9+SB5KQ=;
 b=TZARcgCHBC4DJAmHD2uAUiEHmuTYb65hj9fWdCRmlEQqQA/cLDRqkvxQ2ID6cT4GuzYJ25M7uVSOSeTD/+bwGtL21wcOP6jI1j57lfMSRO6b+UfNvWnSzA2WUkGp4HqczlU9+pKDQqBHpO+KEjNuKEpDvlQCe51KmYObY1keKWedaAFJ+Mf7UIjl0OoAar9g7q0g+Jdwm0hH/EERxQdIzhqdbTQp3PHC4CnCneG09ZcZV8JyffmCGha3ctYm/hDFycCqdiKIcJ+LmK8khA7BCO/CvBnnOlcA04FIXv7J23jwuKzum8QGeBb5wGnjy1WyKgA1c9tLLqUjupDAzFSZ2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH1PR12MB9669.namprd12.prod.outlook.com (2603:10b6:610:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.41; Mon, 9 Jun
 2025 23:11:10 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 23:11:10 +0000
Date: Mon, 9 Jun 2025 20:11:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 1/7] qiommu/arm-smmu-v3: Remove iommu_ops pgsize_bitmap
Message-ID: <20250609231102.GA712299@nvidia.com>
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <1-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <aEddE8bupuaVJTEP@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEddE8bupuaVJTEP@nvidia.com>
X-ClientProxiedBy: YT4P288CA0003.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::11) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH1PR12MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: f29d7091-f279-4c7d-f2c8-08dda7aaebc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tf7KLx6hR73xfO+lfzttAzUQ3J9RvPiXn0kMZWA/1MRTP0IlkKN7nv35L+Ta?=
 =?us-ascii?Q?7B3tTPu0yvTmR7xgMSx2T8s2K0BGKLpw2z8uVllyY4/9ySI0T3P9NSaHu60s?=
 =?us-ascii?Q?oWRv2VDr6k/Lg9BFIxbVkWuW6RTLJmqVl/MeV72v5b59jVbNt0MZCpVkpPs0?=
 =?us-ascii?Q?t8Pb2Z4A5xSa82aB8CgNdAnpZg2k1RWM/p4bHKbOVY4SNFXdzZqSKI3TMrPX?=
 =?us-ascii?Q?7tSmv6T+0Yq7bcpzvKXancOVbrjvxHvN++fyzMTwyDuPpsICJymL9i2/21Th?=
 =?us-ascii?Q?vmQjKv/8WcqMBGYTxC806dIpHBeqXJ+3MYTMyaOrkaOfKP/ZycvwE8B5tlpb?=
 =?us-ascii?Q?cKxpACefIIt2LrbMqbh/FM7Nq3cSyWkEZrJFjyD4Qz3pLJwB85WaiH1LlkaR?=
 =?us-ascii?Q?ldRApIZrZcbn/gOe28dI+xXoCxWzLjE2cb4BrTjoQl9izaoH0mPYfEbDFilO?=
 =?us-ascii?Q?sIzO5cILhOhuePK8DZWl25tkIR2t0fphOi+w4SsEjwTMfncxavbfwXCvAWgZ?=
 =?us-ascii?Q?Yzuowv1EzUcz8hFnQ3ytehCY7+NgfE1wAkrGbn2MXI97SMl+BnQAEXbYjdKT?=
 =?us-ascii?Q?0weDqTWE9zKI2IcIzF6QpnmB7DhM1qBH7REFR1cF8QdeiMjGrcHXwMdIYv9D?=
 =?us-ascii?Q?Ek73X5mkfE40aeuSr1g3SxnP7ufiGZKtrZ7VGbOYfxcZGVAlfBBK9tZVmzXh?=
 =?us-ascii?Q?0JbJbhTVboWEUpdVxWftmfsSZFbAn66+zxASFUGVUAe19MwHL9OKHHQfpDF5?=
 =?us-ascii?Q?kwHa5Zttf7hQJ2KVZ5UTTH5V1/tSH3DlC7yDOyVu/f9VCX4sP0dYDHRR0R93?=
 =?us-ascii?Q?VIjwPccLHaBf7h7+eW0+AtM8o2ISx9OnuIzV8Kng312cINGDOLPSvNayUIlt?=
 =?us-ascii?Q?7rWOWw8TwgjGIuF/ll1suybO+CQgWihS92NzfREUZgnw4NT1SCynvpYSqtd8?=
 =?us-ascii?Q?5I07mAOdF0YLIcKizgTRAztdN6Vfto3DsItzHuw+hN0uDCZFOfUgRRb7RoKK?=
 =?us-ascii?Q?AIY3PMFSoX9z+mPm0DycFNDvSGwDZhEw+QxhUZT8aBVDPIAG2uLWjBlDp80M?=
 =?us-ascii?Q?WeZofjSjy8/2a/5qSc5kDfUPgHxwipb/C3qZevCWdgoraFlUpwGTPQeR/lSs?=
 =?us-ascii?Q?9+0awkJe7cMDmMAO1sWQorIMDq8+C/Hxo0BUgVXhJo+Z6dI26Afz6nfsJfnv?=
 =?us-ascii?Q?jQJJWTfwWCgBmfWx+u6L5tyQwSq8yP4VYE4S1pbJvx+UNrO6nUqTpg7NNHMW?=
 =?us-ascii?Q?3d8ZPYo9visQO5svrvYL8Qqf+In4Fmyel9fy1Umo/kmORNeLaR2Nno5OvaXH?=
 =?us-ascii?Q?myIOOIjDIgujoD/mNLR1YOjk+OkLZL/mYaV+R1a9PqgodBdJjZukNRW2IUMe?=
 =?us-ascii?Q?+U9ajm4IA/ZhEaTqMY+iZeKYsxyQlDFVUSyCwLVATRV2hkP2lBFGPMsm2A0U?=
 =?us-ascii?Q?rx5jePp5y1Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yOTK22FZzQguLdgbsV2gobYwMhuRz0VaXnvdCce3R1mAc4m6lpB3QVz3GP+o?=
 =?us-ascii?Q?72rF8eYffVZ/JB36f32px/UExvv+AEUa0IipJSZiZ+J2j/g/otGSSeZO7d3S?=
 =?us-ascii?Q?uv7TsYSHPbzp/f3YU8lP/opAjYLiCQR4CQMi0PwmRmIj707POwPbzgADwmsS?=
 =?us-ascii?Q?TO3R29DEfJ0UQQWqhnX5+h1Q3qqFhtJQMS7CeaQdz2FXlxc8WIDy3mjSpV+F?=
 =?us-ascii?Q?2PnfOpSyqWe+5Ffof1lcQIbIBzF+JaEXwneID23jVjkL2qDlxYV9KwreE28p?=
 =?us-ascii?Q?7mwvmdA6zE221l64vxksLp3BK2v3xgLnx2+eWnxZ7i3aryQ3w6MP6Gss63zs?=
 =?us-ascii?Q?DIMe4MDC2h6wjr/cH7L8U+CYj5oQERVgRqb9IVgL239dB/Q84As4Bjkbugn6?=
 =?us-ascii?Q?7Tdimyl4TqtN8Qysxp6uVOsCZ0KdBa/dCWoiRTHOh2RRy651+Aqct6HjmOu5?=
 =?us-ascii?Q?9QNyRIIQmW9fmPjNXQyTo7itOw66lc8havJLU0QSpeh6H/qkAEmx+xQTNR8N?=
 =?us-ascii?Q?/BY95p1hUxxP3mgyEiMCgPiHfryPq3hO2yBT58TO0HBINF7s7njbO09z9gw0?=
 =?us-ascii?Q?dHLnH6xlvpVPjX0zyfClHziZn2e66nRwgD6CYr+3ontxlFKa9Ab4sc55kdT4?=
 =?us-ascii?Q?WdVEoOs3VPTcu0g6GAwnrMPDGGa7EW+H3jh88BC+2oQ2606ot2AajlqF4JiD?=
 =?us-ascii?Q?p5Y/Tsrs2djiv78h1rOi0cihV/BRJwPpPRhaxmxB1iDyo2Xs8HOpRgfwrNXL?=
 =?us-ascii?Q?DSRlQXd9sbuXhKycfUTfX/4qk4nznslBcVUtZdoLrOPWiRJtkNo5AEfhkTUm?=
 =?us-ascii?Q?dOvxi5mx1ah6Pb3ZvfE8fp6CuNaxLdINRvf8KxLek3fvJhYoIbGdScigWoFe?=
 =?us-ascii?Q?o+cajOEaeSKcnT40xk2kgzcBbMbPoOyY0n1zfFE/e3DlQ8hpBht+Ba8lDrsl?=
 =?us-ascii?Q?Q+wPL28IzaJgMe3u+Ey364yDCIRMz037OM/TaDm7lXBYQu3KSe6t/Hgi7VHq?=
 =?us-ascii?Q?wwef6O4XS21QTciWOwHol4xmbFznx5YV9FnGlHAMgCnJZour66Hs/KVeT/Ed?=
 =?us-ascii?Q?C12pTYzpbvwmoI0xGBBSIalzYjfAaNZJTPMBp7pNmM6sQLCnHiU+opuCkrYu?=
 =?us-ascii?Q?g8kMrrDkl03fsHSX0+jvlSP0LnZlYFimKPyUeO+tJWE15tR+wt1uCSjwDv5U?=
 =?us-ascii?Q?NJl74EjRJw6tklUsHsVVtW1mD8zPKrd1kXLpClwkMIFGYJU0ryTfSFnhB7Pu?=
 =?us-ascii?Q?nhiSX2OV6094Z8GVPUeVyM5mxGnjjIlbcOtBEfShR3rCELqeMlpLdMOe/xsl?=
 =?us-ascii?Q?oN6IgVmTJvvXbCNwRQkmMu7n5/734VBBedTDJtkkF4VuRO8kgQ3k1TOrcfqv?=
 =?us-ascii?Q?+/mTSh/ndssSlcOCM4jqRbF1c5KPf3qYpdJwz1XVlgz1QSLfc1raSdqfVzX/?=
 =?us-ascii?Q?cRqiWDrQnME0kE7dmxGKO0Lo3WlkbIINQEl0BcRBNdQJj0CDb1QkqKZ81Lly?=
 =?us-ascii?Q?wWKXc37vchmrB3yG6cacR8eaYydoh1W6fFu/ow318TE9ZnMpli9q7KVONSPy?=
 =?us-ascii?Q?Rn6c7v+fb9ooidITHxhMIfjPDGWybmJqErj0/hWx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29d7091-f279-4c7d-f2c8-08dda7aaebc0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 23:11:09.9933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dt8OVgN4RZ2aNaxJALcMghPOg8ZfqaySvuI/gOUNMPl/idpcIDAi17xDgO64MdaU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9669

On Mon, Jun 09, 2025 at 03:15:47PM -0700, Nicolin Chen wrote:
> On Mon, Jun 09, 2025 at 05:41:25PM -0300, Jason Gunthorpe wrote:
> > The driver never reads this value, arm_smmu_domain_finalise() always sets
> > domain.pgsize_bitmap to pgtbl_cfg, which comes from the per-smmu
> > calculated value.
> > 
> > Remove the ops version entirely, the related dead code and make
> > arm_smmu_ops const.
> > 
> > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > Acked-by: Will Deacon <will@kernel.org>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> Is "qiommu" a typo in the subject?

Yeah

Thanks,
Jason

