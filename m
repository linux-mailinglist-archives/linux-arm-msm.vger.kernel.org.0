Return-Path: <linux-arm-msm+bounces-60682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F60AD27D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A08E81883430
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FDB221D8B;
	Mon,  9 Jun 2025 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CT7815zL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD30F1DE2A7;
	Mon,  9 Jun 2025 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501698; cv=fail; b=d7yr9/2WhYAfgVfqRE95eo1AZ0BvQ8PSDIn/lG9TJ3ECwhPlXr4Sp3e6ZSgAq04fCQEfm//K/ACtxq0N/+BX4hBbjYJ8V+umld2MXB0Pex4zbxUYXe9YnaTzFOUIq7LVYtE7Of5neITTsnygIsCcPh+EzZo1beYmK6eGfk4rObo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501698; c=relaxed/simple;
	bh=qMBRQh5Ge90BtSK2nIoWLDpJh2XYyE5qfwOmiBXmcLc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=l0ay/y2Kyfu7aj7F0aMAa9zAbk2etv5UpN3Q0JZxJ/iLnWrXy7LMuVJALRTDp1oBQyzRd7FKXxEMKxlUnmYOcPKeN8nmkb7wSQ8q9Y0PiPDbZmc1aUshLTFeGQjVcEE/ujPB+a39ppeK3pL/7BqLItJ2JobtqzOyBHY7S0xt/As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CT7815zL; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHefazfi6o2uIRu8O67EGePpn+jdqVKutcaebZ7fCKXZb+Dm/asCvQ8Ac8129IUDuLf6kDRnNXTqEYwUWCvPyLQPPJutEf1kdYwGByFWk18EYyy7u8hZRuzMiF3G6IjDgaHOwGp2uMWz4NzTZN+CkD+o9viYxdZohyo8kr06piCcGpOSaUagQyUi1xxLQjeA1gD7A5joB/seidH5ztrORrbGm0p97vjAtyXQMqKhfB99PIqwHS6GDxdEetACOc8aIMTInw3suvF5nZKZ6TdQVmZdM1twc+dKEF0cqfaowpDRi9QMFCn2syY6A/9cfhVIigHwt2fBqv2I69GjVQth8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx5LS+jbtF0xO0NSo2irfJcLQxwTYzkKaI+WMnOwz4M=;
 b=bx/yfVq+fZGzz2x1zhEBBFm7azsd1NX9xBo7MWwP/xEQS4H/2eDeMO81y3XTU9k0JI+brqEBzkHmzgs4KDexqOLwQ7/OkO3wH79ZO8g+5QlQYBEqHYQwscbv1eBG01eE38SL439dS7I3RgScI3JgdjSI+fRbKTa6Ueg+yrZbMF9oYqQ2+5MVB0tcJ0Uy5QVPNTE7Jqz/TIn3PAoEiUKbkbcUSi9sk+Rf6GmZzOs0goj1RPMu0VHpmm2q7LTks7su6OzbBt5GUygpkmEFoLvA3OVaHTrcCO/oQAabbjrRN/bAHfW0udYf1KS18oogqn+QqK7c6p7AIqtcWK3f4ybWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kx5LS+jbtF0xO0NSo2irfJcLQxwTYzkKaI+WMnOwz4M=;
 b=CT7815zL0oAmxstAnmhCRFE+CpYliIPcParIHRCOBFjW7QAvbUO/3oflDSJroA+mjcF97I0UMpz8nhsx+RW4ktd83aNh7RZ5NpzM6PIMvS2GpIzuBHVGlBYifYmaO1Tdwd7e/yMsTZZy/YgndK8fGb7gaDKDB4BR8sCW9GJrIjk0BX/HSKjeS+VCVep8gmxSaI80XVbG8B2a+iC0LaB2VPzIicw2IMqZ09Uj1yQL3DBHM1HimdxSZ6VdjaaQ8L7lkC+aSDXvslMB64H9Jlb6rJSa8Z8GRVvdZgsGv2sXvWc67obMpNd+TfEDkm4LcR+ieE5TlvN+T8lXo5PifoOP0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH1PPF73CDB1C12.namprd12.prod.outlook.com (2603:10b6:61f:fc00::615) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 9 Jun
 2025 20:41:32 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 20:41:32 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>,
	Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Sven Peter <sven@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	patches@lists.linux.dev,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: [PATCH v2 0/7] Remove ops.pgsize_bitmap
Date: Mon,  9 Jun 2025 17:41:24 -0300
Message-ID: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0494.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::25) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH1PPF73CDB1C12:EE_
X-MS-Office365-Filtering-Correlation-Id: 19bbee59-7bc9-4443-0af5-08dda79604b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aiKWimER35T9rrbeuvo5NkIhpuqU2lmL6d4yBzsPHln7WsB8f6jkc+z8WwBx?=
 =?us-ascii?Q?b/u5WrIuhOMhoBTL9A0XYbafs0DcvshHNlV0ZhGy76FOvUy52rIMbLYz+H1z?=
 =?us-ascii?Q?uZmhaqoPf5DJW+mv6nBvbXdUiYSSHLwqH3jjIZtvUhYKti/wbCXYSqX4qsAY?=
 =?us-ascii?Q?fpK+koZDHFMaWc98WPp4v6Rni3RCPIOoYck2ZQgjAhnMms/cVGyqu6J7VRLa?=
 =?us-ascii?Q?4DZiuL3LabZXZDApswk8x2uA/c0uqE6iy+7SEuaizjAUxiGLRlFQ5wairtV/?=
 =?us-ascii?Q?3657PpQz7RmzQ7eMIc+j8MwXx0UI10B4wK7UrFnZuyaYlGnerFA9omwMnYLt?=
 =?us-ascii?Q?Mi26vmnlywTr493HZPN1Wcj5rjwhLIitt62+lsRXg7V08RWI5/PMyYdOB/LC?=
 =?us-ascii?Q?8LRlnT+NuasL9eDdMNnB4t8ZU14K0BzS0HZeml6q3SpwuC7DaMCiYuXYNnGO?=
 =?us-ascii?Q?Ak9Gxl0+pVJm9j9z7+JDyRuEztUFXvkQsf/qHNPYERNVqbekey1JmeynYP7f?=
 =?us-ascii?Q?y6LgSx2b4AaVC1czH1R+mhpnZT3QOAy0jVx41O4s5pE+T2re+vDwQnTC/Uma?=
 =?us-ascii?Q?0zXop2kuPkLlg1GxCNxdElZzZa6KbTR8Q4QRo++LHwuIXLmuf6sADWNgUmRX?=
 =?us-ascii?Q?0GjRpUJ1o648dJJGIbpAPfBeC1f+8dOMCmcqXwhRPlRxzyj5Q2p4KyW5KqR1?=
 =?us-ascii?Q?aqivQOKzSm7gVQngIN7J/iTSNKAyqJXguJ5t4doGqV4K2JCbvEbg4OgkpqFp?=
 =?us-ascii?Q?DYyjw31FRJkisilPfnu1CZiYJ3TrOIlCfKlHFRyQbnUBHVtryjwDivvt/7Ng?=
 =?us-ascii?Q?+kpwc1e8uo86RbPI5EWYCRueN/wS/PjJZU/AKUIGSHyIPDWZfoDP2dtRgEaZ?=
 =?us-ascii?Q?W5ZH65V8tCjmB7O5E+qqr4yAiry214XHTF3uo7aMNHPuIte7/hZpgUH5SN2E?=
 =?us-ascii?Q?uZru1ERGq5qm0uXmgFYeQ+JtubwoG+UcPS/60g2phrsAJvWeB3bals6IYnhC?=
 =?us-ascii?Q?G8xpJroAgifLRGUXOz+1IEEmPBdoJP1B6DunLxSIZyZp2CsSlClNLvfmopLL?=
 =?us-ascii?Q?sPE5Gw8IJIPmqZlv+9sA1QaK9isAG8qLmLqC8942BVljxF4e/uworjwLcxqm?=
 =?us-ascii?Q?9WvRAZCpqzM8Np1xSr4uUUzkEzMiAdvLmaS0PBag/LOity9e96EizWZI+CR0?=
 =?us-ascii?Q?a8erm/898MbQREKyRYAvsmBR7+d4VjLMcGcNDeqD41xwDcn/1/MqCRrHo7aB?=
 =?us-ascii?Q?FzndgGl3tnXqLsWl+IHdx+CdwYTcDPuuDOAw/TGBZpXVAyrNolVZm8MCxM43?=
 =?us-ascii?Q?uaCRjbN3+GUU0brs51tmrKu6kRe7j8zXG03Tm6EM+shSWulwix2NnvFLxILC?=
 =?us-ascii?Q?pRuIRjELy32sL3kniGVdgCstgKXf75OHNfXM+bDNuh/Ye1alDo3Vpn9rt+Az?=
 =?us-ascii?Q?aa7Yod7x1uyUmQMSMFo9HcKEtPTTcqJBm/xIsfBxdzkkInihhXXqbw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B31tcBH2Qbpn8c6ZGBpWRlIZtbj/7CeVKbnW6O2EDT2jrxqp/Ct7+HTlJVmS?=
 =?us-ascii?Q?owFtM3N4GqGSSEWKc3hJIvFzqCw3HSAFRuW/I5ume8v4yEZViLTmdaNNn9WM?=
 =?us-ascii?Q?JsSKNoR8h49zUZMVsVMPvKSRCdk3WVq4GRhj5PWpp+z/wqpnqMh5lH59g6Br?=
 =?us-ascii?Q?s7WLgGeJhv9GuhkP/0ilxD/pKsXDj9yAwlPyaTB3Ogsvv9/MG+Cha60MMF3D?=
 =?us-ascii?Q?Ty5eDV3hJ/7i8G6P7F4T87L9ub3xEM4hsTmt/pnpvuaw55hTh/j+oNA86JIU?=
 =?us-ascii?Q?y4bcYEbMm+OFk7gMj6quaGB2wvO4V4CLNDui5I5kcBo6GfWvHRbMpfoR4shS?=
 =?us-ascii?Q?VHETOHTQYjwMOXwOHMnB75WTrmxNMKistkCucA/xydZaboJJSpwm254hxsJY?=
 =?us-ascii?Q?1u3G4HzgXM0e8IAM0e46v4Zxpf2F+h6JU/tb14WoonY93BuAAKBG33B9+nPU?=
 =?us-ascii?Q?m5Lo6JGmScFjJQdjJ1wDTZZdT7ldiv3hrh1JoxgR9dLri4ePLzcy390dCj8P?=
 =?us-ascii?Q?QysglRvtce9EZrlIlIyYq3zmZynDgBiZjMZeYhNQ01uIYVKDEBKizIe8lgng?=
 =?us-ascii?Q?Q3z4MXmCAWWDhO11wc+XGqK9WnydW/7sbS7CyNxiHpXkU/3sRq1oo62gh1jn?=
 =?us-ascii?Q?FZoRzGDgL6Z85bokX5WIKFQcEbV288j/KvHaTeO62m4fPJry73fmuKKihgjF?=
 =?us-ascii?Q?5M/AeJerhRY0pQP7RkWdFrGp6YV68gDEn16UI++5Vc72W9uoVOK4KM87AIxR?=
 =?us-ascii?Q?54aVBbH/tdHbHKT3ouIt7LG73cLz8LB3z+sTz9UdrOCpGm62gbS/zOxf/aSp?=
 =?us-ascii?Q?HA5VPN+RP/jMLQqKKq+ixBi17oOqS63eRtLvJfKPYx6iYFDlYjQBj3nFYTue?=
 =?us-ascii?Q?CX+hS+vUkwFtL7oVk4hI6AkT4eBeDaJkw3nNk2Q+vJSud8KjKC4r0hlnbc7+?=
 =?us-ascii?Q?jJ4TWqhWogEe1SopBGI2lVtT59nnqhXz2DBEBBeFEHlFAbJQlCrfK2scIWh4?=
 =?us-ascii?Q?rVIunn1wLORQxL77bb9Nudu8ybuP2XBLvBIHqjfG3j3Ri/dhO3tJb5JeRJla?=
 =?us-ascii?Q?muH+ehyvwfDTvwMRjKPz3rrve3FQMKuYafQjPe23TFgyk30EAp8KwENGW3I9?=
 =?us-ascii?Q?ewxW9ECiNrVNm9QvAF+56ohOYbJlc9JxlctDdxIMHs18TkIZZeFHgiOnE6dl?=
 =?us-ascii?Q?wxfYjJU8z8QF5EVuhS+GGtj3JQ22Akytp8mkXrq0BEuIvO+zWsMneAEvG101?=
 =?us-ascii?Q?HQmBbrqfdB3QM4ADWPMhtoKOWzzPSu/xUOi1r5N3FJ8mkQobyYDmf0F6h0+l?=
 =?us-ascii?Q?8ieGSuZFpUeYlq/XiRWE2pAiT7THB2J94jfw1gHactgYzedHcDwc7esqNX8C?=
 =?us-ascii?Q?Me2HXr+E6DbmVguYhw2GQvEQGKtPY/DG4nY4fSFL70sKK9mxJTcN/o4yi72c?=
 =?us-ascii?Q?CC+WhEZWaQsG0DEnMSf83GbdxCx9/ZcJgx87YGiPKzTfO++ywimezDMu5unK?=
 =?us-ascii?Q?LgMBDwB+N6oASZQYRNsykuBZTNVdywFmAim+wEA+DvsMwLTM9fzutIDm9MJE?=
 =?us-ascii?Q?AaIkGXhDeM1imvFxz7Yu/BBa3+aOUjIV8YCC7pZ0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19bbee59-7bc9-4443-0af5-08dda79604b5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 20:41:32.5134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CA0Ma1JkBavvbpoxTy6SnJfoWIy6EMZeOO1pvM2z/kPgh23t87Dj7pps5jIWFiF7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF73CDB1C12

Now that all drivers are using domain_alloc_paging() and dev is never
NULL, we can have all drivers correctly set domain.pgsize_bitmap during
their allocation function.

There are a few oddities that have accumulated here over past changes:

 - Some drivers always set domain.pgsize_bitmap during their
   domain_alloc_paging() call but still provide a value in ops. This is dead
   code, delete it.

 - Some drivers calculate a system global pgsize_bitmap in the ops, but
   it is now trivial to use the per-instance value instead. In several
   cases this is dead code, delete it. This also allows
   constifying the ops in these drivers as a hardening measure

 - Some drivers have a fixed pgsize_bitmap, put it next to setting up the
   geometry in their domain_alloc_paging() functions.

 - Finally a few drivers still use ops because they have a delayed
   finalize operation. Set the constant pgsize_bitmap in the
   domain_alloc_paging().

Then remove ops.pgsize_bitmap.

This is based on iommu next, and must go after the virtio
domain_alloc_paging() conversion.

v2:
 - Rebase on v6.16-rc1
v1: https://patch.msgid.link/r/0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com

Jason Gunthorpe (7):
  qiommu/arm-smmu-v3: Remove iommu_ops pgsize_bitmap
  iommu/arm-smmu: Remove iommu_ops pgsize_bitmap
  iommu: Remove ops.pgsize_bitmap from drivers that don't use it
  iommu: Remove iommu_ops pgsize_bitmap from simple drivers
  iommu/mtk: Remove iommu_ops pgsize_bitmap
  iommu/qcom: Remove iommu_ops pgsize_bitmap
  iommu: Remove ops->pgsize_bitmap

 drivers/iommu/apple-dart.c                  |  1 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++--------
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 12 +++++-------
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     |  6 ++----
 drivers/iommu/exynos-iommu.c                |  3 ++-
 drivers/iommu/intel/iommu.c                 |  1 -
 drivers/iommu/iommu.c                       |  7 -------
 drivers/iommu/iommufd/selftest.c            |  1 -
 drivers/iommu/ipmmu-vmsa.c                  |  4 ++--
 drivers/iommu/mtk_iommu.c                   |  9 +++------
 drivers/iommu/mtk_iommu_v1.c                |  3 ++-
 drivers/iommu/omap-iommu.c                  |  3 ++-
 drivers/iommu/riscv/iommu.c                 |  1 -
 drivers/iommu/rockchip-iommu.c              |  3 ++-
 drivers/iommu/s390-iommu.c                  |  2 +-
 drivers/iommu/sprd-iommu.c                  |  3 ++-
 drivers/iommu/sun50i-iommu.c                |  3 ++-
 drivers/iommu/tegra-smmu.c                  |  3 ++-
 drivers/iommu/virtio-iommu.c                |  6 ++----
 include/linux/iommu.h                       |  2 --
 20 files changed, 31 insertions(+), 52 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.43.0


