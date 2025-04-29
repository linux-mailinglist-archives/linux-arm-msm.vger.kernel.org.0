Return-Path: <linux-arm-msm+bounces-56143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B879AA0EEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A83717A95D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529F3218EA8;
	Tue, 29 Apr 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d3EHE4UB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0887E217654;
	Tue, 29 Apr 2025 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937273; cv=fail; b=QzoYGgKLwfbD9YOMxoTZwFcK+b599kUcWXbC4UedQ/1tlr2pnyd63328Tlei8E6CpXIhbuv+civfmuLhtbE656lwS4i95EutmV7h1Vd86dXRNRj+z2xAbixqH3KMQpwzs0IdtKd6j9++gWR+8Ksjqtpun1jMXIo5Q48LxasObfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937273; c=relaxed/simple;
	bh=ycFRAoijOGbbUC88RdeJPsxp9MTFGEZC+VkGegaj878=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PVqHRorDJjbYZq8WmDjYCPOtbsVWGwQ+C+zbaVKTVweEwPcRZ2NmBEBgz0PzVMxA39e5zoC3QDR8ywz7x+CW+7979ptufHaIXOTWaYLkfhap/BuKFzJFZgSXVrvru3hqblpllVl6RA/Z4PQOgF/+APAraCXfUM3hZQpjTTbDtFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d3EHE4UB; arc=fail smtp.client-ip=40.107.100.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x34W23GZlOsamyxf4jP4NDCgwrkELaJQAxZDRSUFBKAoMZ9arkHkObXR5cAzBTqavpX4J0mGAAD7BQXblGFMgiVkmO7Eg11LbS/o8wEp4jgMkSa/xh+M6HpPxMN1LI3I6fPQAMnHDq6vvJ+X7+7E3amBKlBx8nDf3niu9QvlEQ7TnN3tIVnREOZ1U1WJtR1HcdkCGqmC31HfxDp4fUL9hLwdc7nGmYFTHynhjmuImexSatVzP+ldNgm27netmkvSXeK8reQeoawwr6Sdh4VVGcCiCUs6vQa6HsP8LeDjW6R3cOBlU68CWTOFZW26WCGzzQudo4WA8sPxa6cysxMhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s3nAdO9IZEKhROB9Swb/p+9iLMfaAgDhcuv+FyNc6E=;
 b=BKD9jvyhIuukKXwY7gpRtKnxj/jBdb0QZtp/0UZq6RC5dHKUUYqvmpFBAvu7XocV2EsshXg805FDA6g7R/oEhqiz+hJ5LPZZZWSZiN1EFKn0VLMG2r5KhTRv5hKyV6VYThHGwum65prF0xA0QhkQsceB26jgamCqsezV2R/9qVn88tTW8WAbVbIw1BkC7BT+OpvTzhJwb59b5KPrU2ap+EOzQNejlD5KatVIvuKmSRFq6KKjtfnQYUQRq8jrw7SuvgzUeeLx2597FZ1Ag/O/2JbNe9SG2i0BYt6CbzFMNvd2OtPUUV1/hCqXJ/NyKWRn3I6zDenJmZxAQrBCZD8Cqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s3nAdO9IZEKhROB9Swb/p+9iLMfaAgDhcuv+FyNc6E=;
 b=d3EHE4UBUjwWKcXNKTecbFMgyJlWH0pbDMEs1fqQHTY5IXxBGU6Xgqvg3nKHZ8XGnJhSOj3CW0CkP3BifWBZrhHoB91P/J1g2FaPx5OOHV/ycU0fT3Qj0f+CuFisStjGAZOHzt+J22GLrtlDcVOQeXFNBoFZR7A43NsSNdyIIa7DXqS907Dk0MbO4v8TzvIVchHApYWrcyaTw7wfHMydP2EpAWxiVIYFDIqJDp2C2W5Rh5wNaMNdvZ15xLuD7e8KlSWI3hNWxSBDa+46YThxl3QY+ZtDOY6LC21+uuZ6xR/LrodVWvNms9W3QoJj+X5S2TMygrg8iNOJWY1IRXSXwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 14:34:25 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 14:34:25 +0000
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
Subject: [PATCH 1/7] iommu/arm-smmu-v3: Remove iommu_ops pgsize_bitmap
Date: Tue, 29 Apr 2025 11:34:11 -0300
Message-ID: <1-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 468ec824-c129-4d5a-6c15-08dd872aee0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?demoxvXyHq3BbSQu1lo4/tHBd1dgxRfKXQwmx6hJfCZjx1712q9i6Gc1jnm1?=
 =?us-ascii?Q?JQgwQfwMQvZ6TeDt1wqfWikCGVNWW7xkHQecm35gM4hcwb9OSVEGR7uXSbAx?=
 =?us-ascii?Q?BHFy7bvjvp6IPuUSoF+8qPW6LNEIUKbePNiMHiVkb0qmk45e5z9TvFCmIT3p?=
 =?us-ascii?Q?AQhKBT1djQZi2/gbvq67oRm6X489tsVmiZBDwNq6sGYPJzbeB5575Nrga7ei?=
 =?us-ascii?Q?KOpug8BD2BAc6E71AlfTax/kckUPuw+7dqx1ZRubwRJMykz5AKcseP8IC1Mp?=
 =?us-ascii?Q?lsvivWC7AtQeQioYmzMn3Ibuplzia/rv3GukaortzKvoPCdPo06e8np+eadL?=
 =?us-ascii?Q?+8dQAHGwR/CPaJORiawKWx+S0sybiv6a2xV3Ll+ZW1An2A/9y9fG0q3nh2t+?=
 =?us-ascii?Q?MRKEAUtff1ApkiNFOtWxp3mOWY67IAZCLuZoH/CNaAv6Ki9lus/KXUuK+ByW?=
 =?us-ascii?Q?jF6MEIFQf4+rBUMwxxub/hrhl3Vlzq4+sZ9EvUWr4la4wuLO2JzG7GvQYnDf?=
 =?us-ascii?Q?zIQVpVUSpu5Dc3R0H3EkjuGWc3EKgWvKIY7aB60nBuW4l7SWRqy4Ltq4q6vO?=
 =?us-ascii?Q?Oyo21aG2WDc6dTQKX5yfkdmCIR7XJzN3Q4APxuCcpCA0uCzpLLEt7DSMYVfy?=
 =?us-ascii?Q?4N1tfn2ZrBZwHuxeNByTE2T5QYItXIOwnkkZoBzwfCf9JdsG82Kru5qEUWgq?=
 =?us-ascii?Q?c7kcILkeJ4gRIku/oIpLO9E6ZsinUmoOBV/LTmy15DefRRKxpk7wdSPDtJqQ?=
 =?us-ascii?Q?+g0rJnVKvwRJsTv0IT3fZxn74jCWZhIgs7aMUsBESY4nNe7+8vFnZLTHJcgG?=
 =?us-ascii?Q?Id0dffdMzkNXKA3PuP1bm5ghH3uME2/4Q1Lh5FE/CHmkVIlLw+NW3udipSF8?=
 =?us-ascii?Q?2gUOCiRvr/i1iEhC8aLAdHleln2kIDUXWFsLkpj4AuutrWEnX3rlIqtLvh0U?=
 =?us-ascii?Q?KPR/XtLSs2/fOE4D2XYgn8kzUj2KsurdBHJKozfkQGaFLWnOhgDn4cawBPcw?=
 =?us-ascii?Q?wbGWVnqce4O+kZrK3Z7wXOw3gz/WaVKzbbLhi3Hji2lOmnz4I1Oc3gAAcBrU?=
 =?us-ascii?Q?2Ol9+hezN2dfX1c1bCPpgp7nWfrdyyBaJTGrdurfUhKNE6+fw+WAF3Er6H+z?=
 =?us-ascii?Q?1fbckQIrS2HY6iTX9WFWc86agEsxAGj1kXiv+vbr2c+LqG1MxVBq7coBvIyA?=
 =?us-ascii?Q?9Q474TccDj5AHs8NSkrRUavT2+feaCh4AEjBQjBTNe0OrE8+kLb+bHupoidl?=
 =?us-ascii?Q?yJebNJwK/I/IKQGcNbk3caeTZbR4B+yTbBKfxA5OiBqBMpApto0Heeu6VfrR?=
 =?us-ascii?Q?qq9eAPAQ1v6OXjcM+C2Ww7qjMFcXrT54EFXxdEbe8UJAcIUYQk9sf2cuKPiy?=
 =?us-ascii?Q?R7w7m51bpRT86hk+NMx5wR14DMi1w26pDKwqC2BXfZLfGcvLmHEq1xKo14rQ?=
 =?us-ascii?Q?ERgrw3Fznpeta0u+newRcGNqAUoXAtLIqWYoT/gvSYzlLARALrQKZA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dVg+YpLhDEPnm6GPplhsWfgcKB6MMdCgGY4bruhsUcDYHlVEGEhzH4gIFnZU?=
 =?us-ascii?Q?F1NT0gKDe7TPJxvns4+e1wlUCL8F4Oc6QT78c8hHsRvcKLbuz2R3QrFkqTA9?=
 =?us-ascii?Q?YawJ3T0uppTASToZ3cH+Nn9dSKSd0xQ+T0raLIFl43oiUo6c5WsjUqELvUK7?=
 =?us-ascii?Q?1YMmodK1GufY9Li4HOVrER3APHrUl1nulepfymK4olRg3xQa8rZTKFTrxavv?=
 =?us-ascii?Q?qqrN3U26rlozO4v3g9alHjHKdgm2N550dH1yAWuKusRxfJTLh3AYI9T7cdIL?=
 =?us-ascii?Q?B1DlB5L6Qknw6hBmW+BTI0SOKWxhxheks6/VNcr0yCnBDbWx+UzpyyYP6k/z?=
 =?us-ascii?Q?yVuGiE6cPYfFUcdnLg43i2Q8eHMxEAp5BV2o8bhDu0g7PowBWnmTxZXWDjKs?=
 =?us-ascii?Q?C/RQIcnF0fxUDf2hXNVu/R/3J6vTNmAiKvUBIiHLpFZUVlvzsS3rlO+Sfj78?=
 =?us-ascii?Q?lwaaZMMUeN/+WAa3O8HCRXzbGNgoirs/aMOCITr85pQxJBtS/KCq9NjYn5xy?=
 =?us-ascii?Q?MK53DcjMoFeFJgFB1dMrNfI8Q9XgVUR1K87qjnq3tSKb4+ByRn0XWBLMBdsA?=
 =?us-ascii?Q?aQToHdLJHKrr/AtRzKk6isLLufssngrEoIGLP7SvTpX2G5xMSZjUCqSMKqxx?=
 =?us-ascii?Q?lZ4cm4YT3xmmBuJL+PXYWtmQ1BZoyTWZL2DNppxzS1DPJ/wBfSi59n9VEY7z?=
 =?us-ascii?Q?rMsNQECNkjTR4a9foDvpSep0EQCPCOGp3qyZo3NwUBYid+EIULTW1x4ndUnD?=
 =?us-ascii?Q?VlyCWNjONUoIbUO3VuwFZzmqbITc281YkSVicj8zGaFGfX3W8vN/EQXQBw7o?=
 =?us-ascii?Q?K2adeTTeXtBrBKZgKeTmB3BbUxmDxlx86AivOGzmdZeQuK1Y5nm5SBZLkItu?=
 =?us-ascii?Q?Fn/JKIXwy/LCOV6CO6M6xUkNaZ27nG+vb4yyfS54BSjhp6irIlraMUNExU85?=
 =?us-ascii?Q?HR79hhZh6oldy7qgw2QtWo8Spq91dnaO97sFh/p+sNJVZP+nVmDC0oyLDCcs?=
 =?us-ascii?Q?ddGSecMESacZEuWC9Wkc4979njMopmQyyTHguaZoBkFHYJbvj2UEhsmduXg3?=
 =?us-ascii?Q?k2MhBRbW3CB7IVUt3koitcEy8ZoaBF1nDU3xgyPf0cBSIo2GMeRgW7qVdQRe?=
 =?us-ascii?Q?VI07gexcEbp8+9DiWO+4i5ftIue6tpUIK+HoVVeYhz36C8aSAKUnujUmUiGw?=
 =?us-ascii?Q?CB9H2sJyLbs/W7GB1rwUkAHkTyaKdV5PWOJkOmJUldenk7+SYC0HO/ZZk8B4?=
 =?us-ascii?Q?lgfoVBt9EUo/O+3HdsQ+L1QOC6r8TFB8m71YXq9XBiEZHOP9H3NB9hZw5Gvn?=
 =?us-ascii?Q?w5/rlhQaI+XwpBYrLzyqgvwX8Avd13VnaOhJ9Bsk4jgKl58HYWaGt2jdC9Z7?=
 =?us-ascii?Q?cohiulNLJeCyjEpQcbfpkQRWH2hPXmG1JCtfwaDjZ4oJ2XqGw8zIR0sYPmLU?=
 =?us-ascii?Q?g3pn3s/3Y7QSa5tcvak/hKJmI5NRPNDZ3BXZMpKzjENka0oy3i/ZlLrdv6oU?=
 =?us-ascii?Q?tCB5AVZZ3PMozTasft0F9tMs25fSm7vOJIs/sVL3c38/JiphNDCGtXclMQiB?=
 =?us-ascii?Q?xeLEao0lR2KptTkmio7Rge9NzZHFgIU7X4AqcUsb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468ec824-c129-4d5a-6c15-08dd872aee0a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:34:23.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mt4U7xbmw0VTrkS0CjtRX6K1/ap56mSK7lvCxOSF4X9AWvAlrWnKj3yymFK9EwJU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523

The driver never reads this value, arm_smmu_domain_finalise() always sets
domain.pgsize_bitmap to pgtbl_cfg, which comes from the per-smmu
calculated value.

Remove the ops version entirely, the related dead code and make
arm_smmu_ops const.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e91d20e5785e06..a3e79a0896063b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -38,7 +38,7 @@ module_param(disable_msipolling, bool, 0444);
 MODULE_PARM_DESC(disable_msipolling,
 	"Disable MSI-based polling for CMD_SYNC completion.");
 
-static struct iommu_ops arm_smmu_ops;
+static const struct iommu_ops arm_smmu_ops;
 static struct iommu_dirty_ops arm_smmu_dirty_ops;
 
 enum arm_smmu_msi_index {
@@ -3674,7 +3674,7 @@ static int arm_smmu_def_domain_type(struct device *dev)
 	return 0;
 }
 
-static struct iommu_ops arm_smmu_ops = {
+static const struct iommu_ops arm_smmu_ops = {
 	.identity_domain	= &arm_smmu_identity_domain,
 	.blocked_domain		= &arm_smmu_blocked_domain,
 	.capable		= arm_smmu_capable,
@@ -3690,7 +3690,6 @@ static struct iommu_ops arm_smmu_ops = {
 	.def_domain_type	= arm_smmu_def_domain_type,
 	.viommu_alloc		= arm_vsmmu_alloc,
 	.user_pasid_table	= 1,
-	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
 	.owner			= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev		= arm_smmu_attach_dev,
@@ -4504,11 +4503,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		smmu->oas = 48;
 	}
 
-	if (arm_smmu_ops.pgsize_bitmap == -1UL)
-		arm_smmu_ops.pgsize_bitmap = smmu->pgsize_bitmap;
-	else
-		arm_smmu_ops.pgsize_bitmap |= smmu->pgsize_bitmap;
-
 	/* Set the DMA mask for our table walker */
 	if (dma_set_mask_and_coherent(smmu->dev, DMA_BIT_MASK(smmu->oas)))
 		dev_warn(smmu->dev,
-- 
2.43.0


