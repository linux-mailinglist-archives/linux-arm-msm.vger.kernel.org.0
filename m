Return-Path: <linux-arm-msm+bounces-56142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB74AA0EF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA5B81BA09D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B3A21766A;
	Tue, 29 Apr 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FyCPnuxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB51217F33;
	Tue, 29 Apr 2025 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937273; cv=fail; b=DZCrpPAapS3DxWlBFFxtNd9ZxBYXuMH6fBe9aOviH+uqONEKNCii0YfLAmEAoEZBBp6EWLsJzmYzKzRDNF4dk/1L5uSdY4xDiKBF6sa/RDYktWW/j89GS06cWG2IQJIDsavHp5YjiqccNKKiNJel3NbsncNG5ih08RmbQv8PQnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937273; c=relaxed/simple;
	bh=IOcahN3Z7aCTZvVfByurlxWSx1LfZt88XkO3xr8/Mwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eRhZjKmgmozZNACLwJaFM2ymq6iRsk2Sq7GoBp35+tln0436+dGFoOwh0jwKOLW4zRdXNVPmT88PHRbIJBHSg7OKJNEZOnwS6HpUco/9OW0Qljle7HmAm1ZIVyfNXzoYAGaxzo0Z0j5ECmZUPSmNSBbHgFqL5IMhDRM+GJyZfgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FyCPnuxA; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFijk4iV+GzPqNOnE4FpE5RU8IGU2oTBKrmC/BdIKkJiVHaAsJS3IbjtfN0lLt0kuITnrI2J1VRdE2OTHETQkq3eQnOMLedv3DPZ+NXTpU8N1zJYpQrEOZQoF4zNjaNvQB7s0GA7gsI+eI+B38r2IG6unufrWHFIR+r3K5ZQpcXlJAfD8kUfu0ns8QykshwP6Oh8TslwrD7IIMJwVKo9vq5/0pW6VRJMPwLm+zBZN8BI1OCIHVerAVC2zBUBATukc0q9a/iSOuee+PKgEepltARnavr00Fm4aAjjiLH5LOLrat4O01H1bfkhxXdDH5yvkXj9qI6VcuE6RrE/l88Gyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrCTNjnwenGVMOVRAb51QVMbkhQ7EWMKLvlrn8cUGGs=;
 b=LUlL6z4SCUH8fsvDenhr5uIQMsWQNNLnQgzOvm2kvZpiOPE+k8SIL5jsvIQZfWBJg0XBChSrTFOpjRg5mgwptk1+xrwxTQo6UyaqvAw7doWarY/u3HjoVwESXo3JT91WPuuofwXcogmdnJVCf9d5ZTCAnBfZdlbMWHFDtaTYK0f+Q3Z1bEN2n0rWFDjaLTXjkt1B9eUHAQKRVQDcTKfhDtvB0Jyrq/urJKQ6mIpT1D6gbbYXudMBpyqpBPwn6E8U46joUynkgbYBSoSGMs969YfFLla5cK8YGH97fjwZ9rSNpjapqQmpWLdH0jwv5CDQKiHDIs4ZTHoUgjsavKkASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrCTNjnwenGVMOVRAb51QVMbkhQ7EWMKLvlrn8cUGGs=;
 b=FyCPnuxAa4j7ydtj3OsQgSL/x1gshbCvg2LMI7g+cTKkvyjN4VGOM43vJCVtVfbNUaUSNf8ElWj/y+zvYwHFtlV+Kiv2gKETttamBR/h8vQFHmqstHBnqfAmr8Y+EfTuagvPHMHqh6d0pybAZKQAuWp5FRVyyJw11CW0WlMqWnNZ2DiKdB5FgVgJzJpiggo1dcEGC/eE2lMJjZRsc4joTnKLkZmAWdQZXaDzfla2lC2u1LH14ob2fVWKmDEDOVcB62MCj99FVDYyXMcxyErS/dOj05zW/Wi7Bg8waVsc+8TzepyR3iMwPPb0tuemPLuqQmWRVzTE90xOQiGP3kgLZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 14:34:23 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 14:34:23 +0000
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
Subject: [PATCH 6/7] iommu/qcom: Remove iommu_ops pgsize_bitmap
Date: Tue, 29 Apr 2025 11:34:16 -0300
Message-ID: <6-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:208:51::17) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS7PR12MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 9446ac25-faa4-4aea-03ea-08dd872aec62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ttvPD65fJ76bWUO/LL6PfdkLQkhMvrkJ6XRsZsetKOQPnb0WE7cp2zza1v1v?=
 =?us-ascii?Q?toBKSUTcFCYSmmhplggL1PK7kmz109fvgnpzPBwhindJsr1xthHostgE7AnF?=
 =?us-ascii?Q?yP49RlsAeyPjDgFrXFiOuEXQlOiRMn7CJvDXaww+FpBiqGipJPUlsmPr0rS2?=
 =?us-ascii?Q?9NrKFAeExDzc59C0pwrM+nfwOQFB14R1dVDV63C5MSeqZR/pPZYtH5ApH/je?=
 =?us-ascii?Q?ExJDYHbP9x3Lxeg8kIW80dC2CiFOnR/XMZm2/TSPaivql60gr7Kw1w3a2xBi?=
 =?us-ascii?Q?XbjzIH3diVkskgOhsTHBoWDNfDalIxGOGIY7ZFRi4HcrzPWRjSYPT3Z+hVz2?=
 =?us-ascii?Q?PaPnuDwgAgSPDPrXDZ7QVcoy7baO5sXxSK1NNbU9DK9DwNLvWkCHyyCtFmPk?=
 =?us-ascii?Q?swl/68kaqIrGJOrzxqYOAwF/Q1KDt2RmLF6YcPCSYUwVqdTaKSGEpADk1/44?=
 =?us-ascii?Q?qeogCQCo76X1kFUWHzrMt+ZRkvxSdQ4E2lco8ZKRlCfIVe9bBxOKzpAxiVVG?=
 =?us-ascii?Q?NAC6i0LXLWs2AVr59z/Y0teRryt3ll9J3hQ5+b9Uk0ywRQHfRejWuhB6MTYu?=
 =?us-ascii?Q?AMJSX3Vq1twuoRDfIyMJuuwOtBYUO7EwUNQpZnWadAEIiiaH6Jn+KUQ6C4+Q?=
 =?us-ascii?Q?fMOttf8HlYoO8y6ZVZm0LTmQ8WyuAlTAvuvLV+fnk5DWdwod8LRStjAuEKKi?=
 =?us-ascii?Q?rRK3MJNh2caBIt6FTu3drt/8bg+S26k3pt1VKGuiJI+h8cKXsho5Gt19VKFr?=
 =?us-ascii?Q?e7utzoIUF1fxKrfDmv5Rd1gUjEZzdBp39o7fisXQRzU49CrnF9JCw3TO5TBh?=
 =?us-ascii?Q?mX2wPAvP0GvozkG/NDKen0DT1vtV6tWA3cIjjylPR3FemeGk3S7Mt2KlS4i9?=
 =?us-ascii?Q?3apDuV6ICaLX10OYAeQcIgkPIamoCHDWgXuvD5j/fH41VBEwJjHqK68gMDcA?=
 =?us-ascii?Q?xJ50/H1p4Kas1plM2u08w2HGlY9nqv5mMoh40p3CI2UcRjBda27aG5ZJZg+t?=
 =?us-ascii?Q?OZLOO6xbGT94SHkizmodBBnzsymU9U5F/0Uxknhl57uhjNz8L8BpPZpdjkmZ?=
 =?us-ascii?Q?VBbGL3t87Tt5kVDfoJ4hmb9kjkcpXMkE1Dy7sxpqWt1AMKDHt6VBdAZJlb+V?=
 =?us-ascii?Q?uezW+MwnVobexdA1RbBtADXIQ2nh/V7ubDrhDLmqzmVJ4JB/ag264o1+00yM?=
 =?us-ascii?Q?aGGB3ud/N3NmgYOi5h0Tkb5fKMw3pLdZVTlik+DFcbJHwfmlcfNWLGO6Zbr/?=
 =?us-ascii?Q?DAVtq+Pyv039WzJ5HGH5iDO85TDcTM8VOSjkro5xVZ3QwUFD24EHXgBERVvR?=
 =?us-ascii?Q?LroS4R2nBkChFC3A1a/1OaS4hukF5LIbqypXxhItA4BCVigxWEqZLTUEM49K?=
 =?us-ascii?Q?fvONrEBYg6/gSRzujbUoRU0SjJVWJ/x+vYoqqk5T1JSAoj4dKrvYtKFEBJfd?=
 =?us-ascii?Q?+vSrRkTOA+jgnNV5NhNcDtywAWr03SqWw4xU/VjJmUpavpnwoxkNWg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?40eBm1SOE9rSi1Bq4T2XoCCQ3dEcrV0h4oipwFedsxoO0F/j0szXzLDrfwxB?=
 =?us-ascii?Q?8IzEmcgfzO0S1NA8/3uKDkcknz+w8RXdgJaSLwemQ4LSGRyeNb6yH70OVpdN?=
 =?us-ascii?Q?N5oKphuwY3/+DoiYRgN8eoH6PXQqJ/la123DWnpO+zN94A65thIyzHNAh/98?=
 =?us-ascii?Q?xl0nEcFrt5BlNjp6qBvPip0Ng2s77iUT8cPkzt5iXHwYFfeg4crffucUWqRK?=
 =?us-ascii?Q?e9LwlkALbUc/fzRyr3J7dU4k/Cl5pxEHgy6eIVePQ3iOX/RxBIjit9do3Fig?=
 =?us-ascii?Q?5Xbzx7weoBamazW5Pg3NvmDWGcIg3lp7xK0OtNMpsxFses4F0w8A8qjhTHQq?=
 =?us-ascii?Q?eLBiYBMw3sOA3jDXWQX3qSrNkCfH1u89lmOPg7enzNBv80P/D7U89qLPUJ4G?=
 =?us-ascii?Q?wLCz92cV2KsgQcrtam3j4T2DyHVSXri9PhOnSluK2fHk/8yKAlpHQUXBm98i?=
 =?us-ascii?Q?bjw+kkwlXm0fNcnLDRtvP5W51T1DuSlkQ8ewVap2lgJcKEx4qQXmH8XsF9T+?=
 =?us-ascii?Q?9z0zW9xSKR5G3HntF02GJ63TV9+Pt7qXHjXLmJuEf55h7r00O2jltsCqSK1m?=
 =?us-ascii?Q?iGTNJZX1lw1tPRwYrbWrqjZJaDFCHrJHkmGtDiHKLIux9bV0rhe7q5Dt/AZS?=
 =?us-ascii?Q?dLn+BKLPpVkagNf8K6GyeDE7jxpNqy0G6ODMRa7qM2fswN2wHZCytefjCqSR?=
 =?us-ascii?Q?TbkVAZz0ZHOpb7W7Jqt5QHVhw/TNtMhYigv+ofosAmS6xEbZseQVg+Q7iIdS?=
 =?us-ascii?Q?Jagrn9YcyZTXV3y4q1b0Idypoq7duIJVRyFk1k5i/7J2Xs5KZ12pf2F3PwYu?=
 =?us-ascii?Q?SnKqXvtWP2Dq4V6vUOgtkH0xEH3hlhXWQR5hRFH30lGKzvibdt9NAwrvSToS?=
 =?us-ascii?Q?mbYWx068z8rCpDVuuSWVMo4vkIp5X6Fv4rgFI6QhdYcG7jIbVmLThtll2GgO?=
 =?us-ascii?Q?5WakgbWdQs5GJWxRLJF0G1rThl9MZrAa8R/0UMm3XsrAO0As/F994S1TVa7q?=
 =?us-ascii?Q?Hx7Qdh5/lJ8fHdy8+oDMgLxml1uh5NJrCVD2CKlGGZBjxePyiGrpmswWCxJU?=
 =?us-ascii?Q?cHvxUKxkQkJQnMEvGAJYXUSlHF7MPCcfyDeoE/vAsVEyIaTHNyZdJRYJlU5k?=
 =?us-ascii?Q?HNnfwSRBXD5/Opu1GjUcOfXCMFZDf9JhxJHW1UPL8N71DJjTTZim5nlgpyn5?=
 =?us-ascii?Q?NtntIe91/sNq2e3yJ04gzgYIFb7OHj4RFBh1nvzkEjopVcEFjvaYvIKs6xNt?=
 =?us-ascii?Q?k/LBkoeT3R6Rv7kmU3YKfOklyWcsdmWTvKobvrxCojJ+UIRJatUrEhEfyhUN?=
 =?us-ascii?Q?Ki4cbti2oVzVidfivBf/RtQS29qDLILP35lA1ZGkssWhTaNumV9FxImnpIgS?=
 =?us-ascii?Q?IO9hF1ZjA0YmCx/hicB8NVt0m8si1v7R6cadjOf0Np5K+Q05mGzTulScp4u/?=
 =?us-ascii?Q?qfVseBDHDKS//ni/8maEmc/nQSFDhEtGSPdGlG2viT4redzjPw2wMiPaG2k/?=
 =?us-ascii?Q?BTtVBPsMhbX/nWkf4U4IbdQFh/EYMn4+Jly1/ENk7+n9eRacnaDq1LJIgl0m?=
 =?us-ascii?Q?udQiaSaQNfMkww5mM1xVJzp16JsRH/j063m/C5tt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9446ac25-faa4-4aea-03ea-08dd872aec62
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:34:20.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uazW8z0PqXODIAeWFdwFN9S5EL6pktTf3MbT5O1BU30f7EgErhiWL9aK3+AvIbI0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982

This driver just uses a constant, put it in domain_alloc_paging
and use the domain's value instead of ops during init_domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 3907924646a20c..d599f778e9f47b 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -229,7 +229,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		goto out_unlock;
 
 	pgtbl_cfg = (struct io_pgtable_cfg) {
-		.pgsize_bitmap	= qcom_iommu_ops.pgsize_bitmap,
+		.pgsize_bitmap	= domain->pgsize_bitmap,
 		.ias		= 32,
 		.oas		= 40,
 		.tlb		= &qcom_flush_ops,
@@ -246,8 +246,6 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		goto out_clear_iommu;
 	}
 
-	/* Update the domain's page sizes to reflect the page table format */
-	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
 	domain->geometry.aperture_end = (1ULL << pgtbl_cfg.ias) - 1;
 	domain->geometry.force_aperture = true;
 
@@ -337,6 +335,7 @@ static struct iommu_domain *qcom_iommu_domain_alloc_paging(struct device *dev)
 
 	mutex_init(&qcom_domain->init_mutex);
 	spin_lock_init(&qcom_domain->pgtbl_lock);
+	qcom_domain->domain.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M;
 
 	return &qcom_domain->domain;
 }
@@ -598,7 +597,6 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.probe_device	= qcom_iommu_probe_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
-	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= qcom_iommu_attach_dev,
 		.map_pages	= qcom_iommu_map,
-- 
2.43.0


