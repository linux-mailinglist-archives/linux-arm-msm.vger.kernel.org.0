Return-Path: <linux-arm-msm+bounces-56144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE67AA0F06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3ADF17BECB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D17216605;
	Tue, 29 Apr 2025 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tjk2dM0p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B471215F4B;
	Tue, 29 Apr 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937274; cv=fail; b=P7rf/O2wTPshHmxTsqN+nGJvJuK2KbkNffyVCjpvtQtmYDqfX32TB5d1FHmvGqxMC5CazRADsQ8PUUFl1V0CO9Lh1p9JjEtsonffAp5wPTsYa68JthfZHNe15GP2L/gChmSt23K5S37cUVj9ANBtcbd4ejZQuQGBBYEi1YJCOdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937274; c=relaxed/simple;
	bh=6wH6ga7bShSCLcBJ2Cy859OTRSD/Vdn4EugknxXdVl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l01FBolLZTP5isB1PLPPqwrrd9RgLQ0n2Ef90dOxv8BOyhvC7uKJF/v0r70ifd3JCs84B9jrH5C9WCPeRJ/diVEBaQYKPIVA9gkNoo4S2cI6muOelW8slP8u3OaYZ5bWgp4SmoC8zeH0Y/siCkYOlxJ51cR6ZP4XOGdKmG1qM8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tjk2dM0p; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5FLsgdwOEGK3NQkFojjtee5beoIMNeI4+SbaHMMewYJyz3soXYg5Pg8hsktKfviBvnO+ZccgokJ2mDB05M2Crcs7FC75HZ5+1Aj4Wz6JQdhkbgLWQXqzV9HpZBsDqIe485mipsGIeQXRKHAl3WdpRU0NtvGvQBUOX1iA4CrR+pKusek+6UeRyafAKFfH2gGwtch0xpIHlpzqhFObRGinoPTuAkxCnUfZfdIpblY3HFBvfd8mLUNhxlPPSdYGcZ95qYNuRGrfwRgnYwl02z6gkotfNqzggxwnkq5a4SRW1Di2dGVayIRU/h1SJk1b32G0ioxkCeeLOyIJdo+gkY1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1gHbcXpNxF4Ud/31BJDWm4k39OZ4Ys3KJTKKBonORE=;
 b=L6PRbtcAo57hFOPMLTaRyhYRdayWQFRB+l1nssool/6SAWz3xT79O0fzuUe0kc6WPNH1Yxd0vWhJYCT2NHdbDyPjjR3+fOjBbOtygGErr6TauJxihkukrI1Dc7s9KeXJEScxOiJ/urYWOeXfUFz1xv98o/V/Cr1eemOeUWr7cfD54Z0P5qpihXB1Ne7FOpXjRUp2+ycllzATH87tft+b7t7PUVZB5l+Jwe883yGGzwWWVdfO5TxFgkLBsFHU9N2IO5eY2ZrlFEsU7VONE8oYy6ooPmNUYWWkDJpGSdrVfRFD1TSFQmOx2IvM1mA/4KGlVSF9TkI6ypsBoJ2tvyMqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1gHbcXpNxF4Ud/31BJDWm4k39OZ4Ys3KJTKKBonORE=;
 b=tjk2dM0pKIheWS7vu6lVfmH8Kw4+NK5Gdr8wx1YKeeGrbiHNXqiyj7zgpsk4Wxuq5pDvq9QXZQ8N68U28AjZeukXqBK7Mre62RrhFNu7DBzJOoun9rDjq5y37fPcc4CB/CVXFO7EVUjWIzykb+bk/eYO5LTeyEKjDAnGrRoRa8uHYDsKBDhiwtn2owQL9PEYPTocsEjykjodw2Yyw7Ll+Y8iFlW6PGGsePvPozMOAQbDhfAeGG73DpBUC54TYML3xw1CQOAq70uJ53xDrTBqPL6DmspUPAyxKR3Z0Rqzx53WZR3qX02c16RhyYtttFKURkOlLFkCVf8vQFFhoXjI7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 14:34:24 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 14:34:24 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
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
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 5/7] iommu/mtk: Remove iommu_ops pgsize_bitmap
Date: Tue, 29 Apr 2025 11:34:15 -0300
Message-ID: <5-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0022.namprd14.prod.outlook.com
 (2603:10b6:208:23e::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS7PR12MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8dab95-1c0f-45f0-63cc-08dd872aee0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oQMSDeaZJZhkflrJHNTwg5WTpnhrPrvMtTFZy9WTrnOtaBJW5Ra4fCaE/Z6N?=
 =?us-ascii?Q?StiIRD4jcRmsVncdjCwMABw6Fuai3zO5xI4SYUNKjdCIHP9xoz305lm+WCgQ?=
 =?us-ascii?Q?mmipKi47QiI4/iqLIB9BTNa/Ub+IzRL5fOnLeQB020WB/vUVzd21bCGmND67?=
 =?us-ascii?Q?kChpT+vQBW82544wgTas1H5KFIiRFpJ6CuVJhHsHMuVo/HEDVeWtiPkTHx43?=
 =?us-ascii?Q?/qi5YEaj7XaYluzyf1TnGs814+H4Wg5Y+6KLFanxh21/IMzwSmqlc1l1yilc?=
 =?us-ascii?Q?YqasUZkXB77buoexQ+bet5gr8g1U/mdzMJShdi54jVuaSKoCHFkmiDh8v8sc?=
 =?us-ascii?Q?oFfCh8grPp7pdc75qF47b8jbhcU+aF8TLYLSsZbSSboimj5i9MeESUeRvWlU?=
 =?us-ascii?Q?C1fjBoYQU52PjEcVJIfs4jGcZXQitod4kmYhtu4rzuO/kvNOElwJ+zKCypu6?=
 =?us-ascii?Q?Iou5gkNSftXkDtwITxZfLqdxOD3JUNv3PFtXED93aDZ9PiHYRaIJ05vGgvZp?=
 =?us-ascii?Q?2qiUVmJaQCH9sYSDfmOblMyh7U+uu2h+CpmJdxrTBo8PKWPywytBbLiG6gVL?=
 =?us-ascii?Q?db2ayo8eJbWbvOq0Dw8ePC1AMkUf7x6oYreeJw1hmSyypftnoS6n2Uf9Ma50?=
 =?us-ascii?Q?44sq1gbhpryqQnByr5zW7DpNn4hhDc256uPFm1nx8Cpb1X2tQLQzm/XwA3Ps?=
 =?us-ascii?Q?1hKF3FilyjuF+N6Bw6ao/grb4K/PA5L51DRd5u5rYSu0NE7ggcbEZ81NBkIQ?=
 =?us-ascii?Q?SDAFxBbJGHe15wp2vR0/MtLugngXDuy4ZdVFaBjMbmnsbPm8UQQvcdCR3noB?=
 =?us-ascii?Q?xmiEjtTRJ+Kqt+AcSAu0l0tGToJJ8AZldZfYW5QP+P32qEbS5783ZBX98F82?=
 =?us-ascii?Q?E5Umg+EUYe8o8G1xLxvS+DSjwjcnyq8OFJriofE2dGldK7OFFivL6nsZ7cBv?=
 =?us-ascii?Q?Lzzy0gDNqVjani4BBQOV5CsG0zpcN9Ynly4VQ4j6p4eyPQ7nh9XNtD5NIcqU?=
 =?us-ascii?Q?lwvsDSLPYgtBCbvM6hwhRqVhweKPWsZQJJJZu+6P83xOeJ0fIkRX4xptcqSg?=
 =?us-ascii?Q?W0DYauncwDYVLukCsaCIcQ0VZlyd/3XMrKW5IFtGGe0WLBagvalI7+V0s9Oa?=
 =?us-ascii?Q?GEXPKKxkQKPt53TLtgh+fvyF7cD5fkXKxdNONNNhMkwwY1/sg7IasJuG3/x5?=
 =?us-ascii?Q?0L+0lK/KDYz+tfZC4cRNlAFQKc1n5c/CzEjzeEVOfRA2deMANHnlpdBp+ZiH?=
 =?us-ascii?Q?5NSspf9lH8iz1fpD0mbpZnR6ZGjTJZD9PyDQVTe4TeTCtd9Kp0zSzAM8+MAi?=
 =?us-ascii?Q?QaPo3QaRmSy270BkYiv3BGJ1rUcs+mK8tR9fn537NB4f3HDmEuK1LRqLAl99?=
 =?us-ascii?Q?RIVtU0z0BWio4jpTk9LWD0C6hcp6I6+ODPZ2QarnuAOKfLec7ZVR3/wJSN1n?=
 =?us-ascii?Q?vVLznA9w6AI8LmAf8zCC2GvHRfU7kSDlYyDMxT6/PaTDb7J2qCltcw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yGTkR96Z0vrHW/U2YIWRxMfKb20V+3bQJ5joj8FCpYMK4L3n5NlnjoF2TS7K?=
 =?us-ascii?Q?ix7Iw+RlABHMIUaqLc7c13QoBJWQs9QEuqEMGWDNxMpw/lMJKHs1+9UmwFAX?=
 =?us-ascii?Q?FPfLXXOydV3mXHwlmux1pgVfr+NawE1o0OtSSlccODlm7fcW1sokHuEfARn8?=
 =?us-ascii?Q?M12eE5gXz6Y7Mxukl0SjDxvAT55DODOd4Bh905a66hyIplc6ziS/ibCRSjA1?=
 =?us-ascii?Q?xTa1D8Gzxom8pio1XrEblsh7jXiED5H2mc/BjQj7YvVvqp5XLu/p/0EGef57?=
 =?us-ascii?Q?1DnhbImZ4k+n3zW1El+ECwc/LqT7/YdE6Mwn0+YPMQxxIYCJ/f1uWmxKS8Lp?=
 =?us-ascii?Q?IaAZcWpY6n35XYzABgUnSjJEKWgA6HiuQZEndxpOpPxuuwasgdSzOEK8aIaD?=
 =?us-ascii?Q?9/w5R9Ti1me61hwXqEH/F+IwQJHqitohdmCQghNCc00BfShBN+RU/YnWC9pW?=
 =?us-ascii?Q?0YpEEB6OG3vfb/eOHLTdJNHCY3lnT9jAZ1aTfs5Dn55ID9wPmYj8GoKEGOXQ?=
 =?us-ascii?Q?RToazyFlQfrgNBDX4/XYMgiKFOo1YTZFY2R9EL6qWNfyLCTK0gkuok2bKWYO?=
 =?us-ascii?Q?dA5VN8y4IaNh9eTuJSoyZnIuh3ZUnqJjQ5ydISbbmi404RgbmF9VCCp3NVJ1?=
 =?us-ascii?Q?RSvvh15V+KI0lHtdKaFj0FvupIEVT92gZqCFXuSqhTc3eE7YBMIpYpSFUw4g?=
 =?us-ascii?Q?IOu5YRpIFpwhs5HFxuadEBCoX2C5jRhA/cJCIvryO+S+hfHMndrGUqW9Y1zU?=
 =?us-ascii?Q?mUqV9GNowEtidelOIxv0kgh24dUs/VcUdWfWaVsU5/gD9FdBi7L6VmzqWW2Q?=
 =?us-ascii?Q?cuziypKCxNyYwJi5T3sEAVbgxnB81wx83unUMBrtUYsLWTVQLavgQFNulMzz?=
 =?us-ascii?Q?7nCiyj0IGUoJw+x1STHITsdXAbXxr/V7bwM11gZ8mK3Ptkn5sPJ3KPZp52uB?=
 =?us-ascii?Q?0hpJzOEXofjfF+c/+k3sx1rGgIGzBVbnH0jO6s2hpkGoXjI7tqHUc+NgErEk?=
 =?us-ascii?Q?563uwbYv0W96e5kYnAdfphEckXkChxyWt5XylK37t0HQ6WCpGI5FJwBZMg01?=
 =?us-ascii?Q?HJMCKchWvBDPYngGp9QiREdjrh6Tz4Na6ZIa21E6gWCOUPW0UBAPjbqmscU0?=
 =?us-ascii?Q?9gU44M2UQr38BTenHpaAPuGsFW+Dd4koZnxtrN6pJxIm4EkgXW3885jsv6Uw?=
 =?us-ascii?Q?rYYR4sXyqFkLKd+7gV6gquXzGjPNdxDBy8D0Dm123WYfmMj0xHokRNon5D2X?=
 =?us-ascii?Q?WGxPZ+SaUKwuJ2Lgfo4fNMxD41q7ZHP4o8aDp3AcT5aietLyezzLd6cgC/eG?=
 =?us-ascii?Q?C3KomX/aiRLFLXU7NCrRlPvh3z6rJYTK35nGAaTFB5oFkA0wDVm/ABdxOnDd?=
 =?us-ascii?Q?KUE4lQNFv8kiWn8AJnk/R8y53wZxINGN1j+xwOnsw6vonMsYghzXUTJejN8I?=
 =?us-ascii?Q?1EzNh71n8SeM7scBbpr9JFrYcsIuHvNw5wP6EEwRFa3eMqjMGMWat62nEF1o?=
 =?us-ascii?Q?/2X8bSgjFeuSeEAsKL6qmQqSa0mvEpxaFeClwmIOSxddYJKJqLw0gkrqor07?=
 =?us-ascii?Q?X0iA+NiHdUyBqIgA398W3Bv1+Ffl93y+SL3ncNuW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8dab95-1c0f-45f0-63cc-08dd872aee0b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:34:22.7504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzFEBH7r5FNnE97RWVe3pB9xZ1JAHjrfdnIOT5UCVUULl0j3ofQjsqUQ78dFkFXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982

This driver just uses a constant, put it in domain_alloc_paging
and use the domain's value instead of ops during finalise.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/mtk_iommu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0a54c6521bf50a..1bc91b72120e88 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -648,7 +648,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 	if (share_dom) {
 		dom->iop = share_dom->iop;
 		dom->cfg = share_dom->cfg;
-		dom->domain.pgsize_bitmap = share_dom->cfg.pgsize_bitmap;
+		dom->domain.pgsize_bitmap = share_dom->domain.pgsize_bitmap;
 		goto update_iova_region;
 	}
 
@@ -656,7 +656,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
 			IO_PGTABLE_QUIRK_NO_PERMS |
 			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
-		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
+		.pgsize_bitmap = dom->domain.pgsize_bitmap,
 		.ias = MTK_IOMMU_HAS_FLAG(data->plat_data, IOVA_34_EN) ? 34 : 32,
 		.iommu_dev = data->dev,
 	};
@@ -675,9 +675,6 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 		return -ENOMEM;
 	}
 
-	/* Update our support page sizes bitmap */
-	dom->domain.pgsize_bitmap = dom->cfg.pgsize_bitmap;
-
 	data->share_dom = dom;
 
 update_iova_region:
@@ -697,6 +694,7 @@ static struct iommu_domain *mtk_iommu_domain_alloc_paging(struct device *dev)
 	if (!dom)
 		return NULL;
 	mutex_init(&dom->mutex);
+	dom->domain.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M;
 
 	return &dom->domain;
 }
@@ -1019,7 +1017,6 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.device_group	= mtk_iommu_device_group,
 	.of_xlate	= mtk_iommu_of_xlate,
 	.get_resv_regions = mtk_iommu_get_resv_regions,
-	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 	.owner		= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= mtk_iommu_attach_device,
-- 
2.43.0


