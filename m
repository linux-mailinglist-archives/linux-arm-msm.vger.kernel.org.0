Return-Path: <linux-arm-msm+bounces-62789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A26AEB850
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2D5156840C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166902D8DDD;
	Fri, 27 Jun 2025 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WIpr1jcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BBF2BD5A2;
	Fri, 27 Jun 2025 12:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029168; cv=fail; b=VxHYmg9BCorovEib/hRK55jQak9iMS+Xv2z1GI0NmrPWwFiIJUSTCqT4F5Q8m/SM0sjInvwGx2X9pYRJdeadmCKWNXzF8HHLMD9T7eVYep/ZZriLZA+lcaeqFSHZjUoxpTebQXvQRyjrzvzGMztNrBGRvn8uMKe6/ekUC8cRPM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029168; c=relaxed/simple;
	bh=4L0QQKPjbv+8UyX/UP1w5Ekq9yKOdXgCN4kWU3XyG2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XCtdaG1dC1V5XxiZSR6cWAP+ncwV2zjrXN1NQthJi/ZPBtty8GantECkjGbsskzC+YTl0T7paZ7E7Y3q/N4B2O/o18oCi/h2cHxAEoOw9MTbC9Unqo345LOqZEQdY+MropbZI5yqzqb3n8hiNjZPy9F6mMDNaU7YNUNcdnC7bdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WIpr1jcB; arc=fail smtp.client-ip=40.107.220.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbUb0u+FJH97hi7VS5SfPpxxDiorxHQXXazn1RR7oakmrhBswBwjUEaaNTV4/duDfqPgvpoPsF27mKzVlfPQroxFylkcIeYIWgT9BO9DvI/bMmDmmOUAciIOtb+SMJp92tpKVyqXClhCqXXdZMqDnb5sLJkIe2uOnMwJKzZTzEvs23kfvpgOHfa8aaM1pdJmx9anqUajSa+L1/bcpud/xTj2gUMiAY9y/xpLqBFYfMlR0FKbBQdujYdCIrmn9EU5rlEeYf6FVTuKPKoZuTmh8bAA+kyqThN8eBwtRUWsU5uCS9ALkinByJyK51nBbGP4rGcKz0yrgMX5IsGHAEYuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEiHc3+VZ1RnbpvVuwZTc2NF/A6cvx11jxuij/Mbaq4=;
 b=uVdvYISrsjz6/+ISh7ny+nPSzSXTzPHj6nmKufqKd4tzT2JdduDDUZO18a9t1X/HVKhzDtApHrwQZBLF5zRMuo3X+UscEXN+q+J3ZVgNvP+zLiDWtcqAsyiEsbur695Pu8RhuxaTtzPma8BDi9USiVwoWMTWhjI88imBEAB8088j/9zB41s1ndKozXMHau++FxidhzbHip32MaEcLdL9CRd0xrNKdOQFbRMTElJksHT11LehXKCk1nJeyDCpGfbjv0VConNFoA5UJJ46bH3TuYxS3q0ozLhZ36B1Xbz0TrjRwIF8CCLrTu17Ypi+HQmIgdyu7SaPibltNuPBLSG9/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEiHc3+VZ1RnbpvVuwZTc2NF/A6cvx11jxuij/Mbaq4=;
 b=WIpr1jcBz/YWO4eyDzalfj2A5N6vybPlVTTRi7Hxrxr8Vg1lJv0S7RPIE/p0z5sbn7FxoducnqkG8PqBEN8lxz4v/Dvpx9qI1Cd07OcNnzjoKoo1ol2bWgYzrQK4824XNP62HpYJJ/1STsM31Htp7jo/8rq2gQx5a4sahkEraL+DxPQ+sPTO2ldud8RUKmvU5zRO5N20KHEx1PLLQNkSSGj342c5oGteqdAM6aFjgK1Psmsr1/G5P/pG58Bwdpm8tdv6w31Nym5RInODJ+QZQGt7Gu5+jq3peAFpgXgYwlCg86x4XeGrjrEjNShJ1Uza/kOlVhhN62cmG72KMNl3Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 12:59:23 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 12:59:23 +0000
Date: Fri, 27 Jun 2025 09:59:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joerg Roedel <joro@8bytes.org>
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
Subject: Re: [PATCH v2 7/7] iommu: Remove ops->pgsize_bitmap
Message-ID: <20250627125921.GP167785@nvidia.com>
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <7-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <r55jzziwjtb37qufil4zgj22zqbmu7gpjs7gciib66ix564baz@juuhk6bqoj2j>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r55jzziwjtb37qufil4zgj22zqbmu7gpjs7gciib66ix564baz@juuhk6bqoj2j>
X-ClientProxiedBy: BL1PR13CA0262.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e663b90-f052-4bec-7ba3-08ddb57a7030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s+xDcooquslvQCNDqyWgLaIdrQhCelnqLaQH7NhGegJUhyrV5/s+IHcCeTHF?=
 =?us-ascii?Q?eLwkrppNtpGIX/D5Jw/oQUutVqEmq20m/iBc4Ny5kGh5oslJxG5Apw3G0H6D?=
 =?us-ascii?Q?E8w7u/jWDw8sjT5q3TMp3lIltIvVZIn9NC7YfIqgPZ51DfjyZwm1fzLrUMiY?=
 =?us-ascii?Q?8dw2Ef+LAy474CLqfGeLFnSAUV4XWnVBc9nE961zdZXKe/GwR9fFiq1vQfAv?=
 =?us-ascii?Q?Hotnd4LB/r3AkIhAJFPNHjPLY4Z3hHPnFpOAmCVXEHhM2nnm8vIpvOBwcEeB?=
 =?us-ascii?Q?s/mCl65WtrztNj8nxdQT0Y4H/8R2GCjs5aEUYDDIKis8KL1K2L7eEwRlMPir?=
 =?us-ascii?Q?bqFAdEOSM9Vs34gw3EE2xtbJnZI4RLXdb0gvS4T7XvwS/brIeaN5pmR+Cjgi?=
 =?us-ascii?Q?bJ8FWZijGXCZRKHvnR+UlP5vgHP5uRp87Xh4U0fzC9cAzxOkUc7Fhjx66XSj?=
 =?us-ascii?Q?wvXemE9JGDnoZ1RZ592XNOXqkd5d7zJg/we3UzaZZ/UmxpM5sCNdDIJ0/P1h?=
 =?us-ascii?Q?GNRlSPOgcDjm2EYkKnNyyjDVQXcSpvuD5vi/QrEUfIagkQGww+sAlzxjRyB0?=
 =?us-ascii?Q?lc0AciGjd7kjTmABDNWw2Aq2uaVYZe07f7Lx4ZmqcLuN2YPxZEydIJHj/EbC?=
 =?us-ascii?Q?/CVjky7ypX4zsAC0TSbNwbfIwpsRlX6xoc4oBCumR7QPukXOnQ6FhrX/XX4W?=
 =?us-ascii?Q?sK2Ek2lgRzcIwV8HWx/rIGLpnYI+zsaT7oqVcIxg/85DkS1I440ttdWAafAK?=
 =?us-ascii?Q?LBmPz4PHdTnsLgUSGw426YnwhqPc8zhVqRHMIXTqcXu4+REgrBrjoSFMFr5D?=
 =?us-ascii?Q?g/PIAbuTZ0fP6gpb7Y25d9p6jrF7OEa/i1iwlaNcwLsv0+wMeCJ0wDkZH8eT?=
 =?us-ascii?Q?hkPF9uLlYfhXHW95f0v9bqw+cbl4nKEvYN2OmQM6b76P8jZbSu927gemS/Wb?=
 =?us-ascii?Q?4GQ2TF2K+g0PgFQpotbHrfyTSKIyaqR5nsWGpYz1f+0sp4Lou3sAz+Od5CA7?=
 =?us-ascii?Q?C5zrvGQ+r9ZC9ilX+CwsP2RMh0GpN8AbfabuaT/tGzdJIV8InOkh899CC4nF?=
 =?us-ascii?Q?Oj2o2CZotSvCTr0chn3WBOWgzqdse7J7Pxn8DHLNL5IQ7zczfzdCza/6xgh/?=
 =?us-ascii?Q?NeBTd6se/AFIGqn/yiFNzQACkS2bOPE6ZrA4R0HrsVY1m6vZMSs6RGplXClo?=
 =?us-ascii?Q?9aXF037OIz5ADCfh7ZhYWm1SxNamWPKe+ou1pBdTru+R+BaFx8yxuA/n3q4y?=
 =?us-ascii?Q?oQxlCp2DeVX8G6OfusGQ0hp2yubCGNTPDCVhQUZX79GX819vSi7THADpybwv?=
 =?us-ascii?Q?QBmN3lCinQxfaaXkAHkf5QHAHGNr8JA3uZhpmx0uHz2QpQXYo6pva7/0hs/E?=
 =?us-ascii?Q?98fl2r5ufmHz3YtnaXw9Nqdd1gGzc2t9caTKnemlgubt4LUAKKOCdFJPeRig?=
 =?us-ascii?Q?KBwCsY62gE0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BZgLO/MGUPpMaPcj3ojiWhee6X4Km103RFqfXRxJpT8BrAdsVgMKRyzw7HCJ?=
 =?us-ascii?Q?lijUhSKJYZ+TdoSpduJhcCtHBWf7Y5XocRjKcPbJwmWkVjr4P5tjyU/v0UNP?=
 =?us-ascii?Q?z0GVKbIPW+AYohQTc2N/Waqdx8iI3Ce43OMCbkcAythLlZvEy2zz8XPS86p5?=
 =?us-ascii?Q?qzw+nosU2TfFV/JK9WVoMnzFu9bbV5KVjnyfg7cNYdGqcGIsT+iND1+BrEHS?=
 =?us-ascii?Q?mHN1LpuPV47bmZpy5ZGgzu0WREuF1DXU0pTKMCa8x6E1MC0Df7HdZyRXbMPJ?=
 =?us-ascii?Q?5CqywxEAT9wuEbkQYUYCJ7vSUhPLTwkwgAp8sXALpfgbNldSCIQGLAq9Jvc8?=
 =?us-ascii?Q?yTOL10fb7tH5edjwCyzq0FaSTCNyGauAkKutFipK8BBqXBj3al/ieX03mgFA?=
 =?us-ascii?Q?dkJdU5yPgbJntHpwbJNqRHHDt+aqPSZbwofkICXq9jqOIoRnXbZoRoimwsCQ?=
 =?us-ascii?Q?SNaBTP+DYnqOEOU9vOQTH1wg/E91kiA8Ebv19xRVk/Mo7FA/MiRTPMseWawI?=
 =?us-ascii?Q?gBOS7UkLh5ssNLUdli3jLAWPjLPPMN/YR6gJDUL5r8IpaBIrWh9FLTXHv2Qh?=
 =?us-ascii?Q?oM2lK4Uxgkrqp8WWC9rPerY0/OEu9CCMfghhf9Wck/+cmlUoNhV8h6jjrDD8?=
 =?us-ascii?Q?HoFE/gdiRxNYghyiK1AhsnfT2fGAVluNDPsf/Pqo0CmyHIqiZJeRdw6qJ1lE?=
 =?us-ascii?Q?ArCK/FvNXYTbdtflVRrfynLne71lFI45wjw8xLBJeoObn3xkRorGA4cjF4iE?=
 =?us-ascii?Q?3gu9ovbqbtzROQR4jcQuUwbPscgpZWKpKa3FtIXaEvNq90g9yG8w3eEhBFRq?=
 =?us-ascii?Q?aNGewLyZ5N/o7XBIPKu9OnCTK2gsts/yQFMXe8H8tWLX2V0W0mhvFxDxPTgF?=
 =?us-ascii?Q?bR+Bt7RFP85SWJQYp26s1lUILr0032rzF2Y3Q/8FF9wS+gx/Ih20VPLXhV6u?=
 =?us-ascii?Q?WnZxxEPq7g1sH7FA2x9ibl+za13BzBw84YcvXIs7nzL3fb5vDOgOYQt0A3Gj?=
 =?us-ascii?Q?3x/ub3fHqJJhsmtp+B9kLLf7Kj0ZTdCa+HccWEmO82bhWOI6QhnhrJkYSzdY?=
 =?us-ascii?Q?6+3e4UXbT0LLa7caauvjgTq90lZIskeMhHUiKZVajMEDu0DWJn+vOqZA5PDj?=
 =?us-ascii?Q?r2S39aj6FGjbeZnGPwZ4+pndumoOsyfgpcBFRVL1wEWskoD3UWymJXQqQryE?=
 =?us-ascii?Q?BKSJ2ssBCzXegVCZW7IZ8NXRtdCk1wTvt7l4ZkusyPxMLuku2o0xZtuP09fI?=
 =?us-ascii?Q?HtXsF5kE0gGBSaI1cpHKuQgmO9j2CEMv2hE8wammLKWvaNe6bv3Ljb6bi8VF?=
 =?us-ascii?Q?QqDSrLLzX4rgJCbkGgtX4hahO65O7lreL6avi93ySU+qwEdRJMevFSy/pBOg?=
 =?us-ascii?Q?tHYdj97PtYBqh+gMGtrVae17QwXzC4rdrnuhamFOdPMvo4JaNvDpUXZtkZeu?=
 =?us-ascii?Q?gZo1e4Mo5UCG7KJc93fQrJeL+1YPRDjnNhVMxWighGOOiLOXQ99tchHsfNoh?=
 =?us-ascii?Q?33soNT45eMuWyNrHAWtLqqrP+rLeLJ13YUBUU5BMaiR/kSqtestgb4qtVFuV?=
 =?us-ascii?Q?0pB/vlAxWa4Xf+vGchiz1CbTavnKRBYleY28AoEw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e663b90-f052-4bec-7ba3-08ddb57a7030
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:59:23.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBm74RvudluDkjHnhyFIsq6Ty58kKS2nw0WJv7/bwI4Z/f6pOELr1yulZay6wk4H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359

On Fri, Jun 27, 2025 at 10:28:28AM +0200, Joerg Roedel wrote:
> Hi Jason,
> 
> On Mon, Jun 09, 2025 at 05:41:31PM -0300, Jason Gunthorpe wrote:
> > No driver uses it now, remove the core code.
> 
> That is actually not true, the MSM driver still uses it, and this patch breaks
> my arm32 compile tests. Please send a fix for this driver so that I can put it
> on-top.

I'm really surprised the build bot didn't catch this, I'm sure it ran
on this series. I notice msm is not in the arm32 defconfig, maybe that
is why.

Jason

