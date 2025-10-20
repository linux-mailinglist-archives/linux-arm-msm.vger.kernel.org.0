Return-Path: <linux-arm-msm+bounces-78052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF2ABF2EBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 20:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D18E18A4716
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE5027B345;
	Mon, 20 Oct 2025 18:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mFU42XZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013066.outbound.protection.outlook.com [40.93.196.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058219049B;
	Mon, 20 Oct 2025 18:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760984827; cv=fail; b=n438laViwALi2nCjLNFR5Z1EH+w29ovsyM42i7c/y8SlCWhCzy5a+cFIz1NiPvIs4dm3dTWvcpppi4urU9M7FZOOW8NBfMiy5LXgcA2GES27V+xnlz2AMQqiXF3wrEEHia/9rqvQTvIf7xww/6jMiXlFBQov7fC51qqocsJVjz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760984827; c=relaxed/simple;
	bh=fvtPUOiSvweFhUrs9aEK1+a5SRR7b4brJiXh9pv9vb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QmH99ng2Y2BsNaTayv4e7K4/+I3Eip8B0xbbX//CuqeLS9CoKar0rYWskrHWcf40e+reO/t5eeWBgsE6MyqjpiQHEZQRKRfbNzMaHhl5IVrO33ffY0r5kSK+PWB1HCHUpQpEX1NdPGmTqVKXZSZSrVrBkPxPiEEKE7JzVKeeX8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mFU42XZC; arc=fail smtp.client-ip=40.93.196.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lamqZ095nZhO4Evd/JaTuzCi3U+iB7KOlK4xaoL6QRr3iTzNXtAsS3+57uHyvOPiPxNTeQJO8g0bofn3e72GzOHF5Fm9AmsNG5+bPAiDMWZagaeaqaLlMQcNCu/mK1i6XSIDU/eJgbAz0s7XnT+DKatZEkA8s+36/UkuCN5IsnHlj8rdarvSJswG/FWNqHNM/YIQS5eHUaifPYljOPEaLTp1/NshMCGuC1myVP/Kvu7W0awwBccqGkoHIuFqcCCvvQME5NMrcmbvrlyPrpDZLyOvhHgDai7glQ0gOnGHgHs3RXUf6HRRhvkA/x1AF4C2S1ahJchCkWwkhF9eFEalAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ka1ehX/ULp6R2p9om9Tx9WVmBwl3XFYMyRzTYwhGKQQ=;
 b=k15pJK7SkJQDPS7ogKf7C0906C2LA0oQq5J69f0xcaCC7U6hxWa6d9Kd1Adsw203u03y4dipbF8wypTnClPjiKBNXLenVMxTNoSl6ZAN2yOO4ix+wMxfqO3gIqgoftQvrJQqB+sCpPvZCljTKfKv4xvkzZlqqvtYu3ooVFZJzWtdQj2oxJ08uMgFZGbU/88BcrXmp4lN+GSgjIf6X09keom51ZtjXfIiRVT3bE4Mn4MXZPTOex1hlaMNOrqcmXWyGZiBkU23VMiWuzxxUAQWO6u/SLoS69IbC9kcn5Q9dI2/F0i9bryo1G29Gm8DG0ZyPJr1+HzzvcfZAViyJ4yOOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ka1ehX/ULp6R2p9om9Tx9WVmBwl3XFYMyRzTYwhGKQQ=;
 b=mFU42XZCxQrNBN0gHYjOW8P8rHFvGs/bLU63ngxy3S4hYfaCRQeABA6Db7JX9UuF4VBqsoYoWoZ9D8kpfjGLenixmiXiLwUAmqwBeLofl7LiFCipi7D2FbbBSr4tlOekEDmNN4ouQSOnuzqDHKNtCpGDhqd5tx7EpiO8gj7UqY60/0Ng0XOzcjjquGxIQyEC/JkJQI7TebrUweHM/wrlTmmxLjEumjJjA2NQjcCCyFasB99YPBhLvt7tLpRrPbdXQJV8eO0s6bzNB2WaV4DPVslc/8OtH2EasuMWpvTaYmNj2bVC2Gv0u90lBF5B/ZGingqPQy4Ut85GClX//UFbjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by BN3PR12MB9572.namprd12.prod.outlook.com (2603:10b6:408:2ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:27:02 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:27:02 +0000
Date: Mon, 20 Oct 2025 15:27:01 -0300
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
Subject: Re: [PATCH v1 2/6] iommu/arm-smmu-v3: Set release_domain to
 arm_smmu_blocked_domain
Message-ID: <20251020182701.GB316284@nvidia.com>
References: <cover.1760312540.git.nicolinc@nvidia.com>
 <cb0cd5a2d8b68dfd77cf9b94168254f3ae62d8ac.1760312540.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb0cd5a2d8b68dfd77cf9b94168254f3ae62d8ac.1760312540.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0419.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::34) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|BN3PR12MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd90db2-0288-484b-8e97-08de100643ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DgqXNnnZmx8ZK315+bVCgNHswDJjySQP8ybiBqtEOJljaTnx/YQCK9DrN0ZJ?=
 =?us-ascii?Q?R+69sBiXo9ti1Ler7qOabrNHQpssR/XM9oollgSUSzeZ4V5+3Gu3Zbksef2b?=
 =?us-ascii?Q?/UTkmcU+CxaxOfC22e4dPqEtLMzunSvDO0HzhnW9ECkie5x5h9egYz6SLYif?=
 =?us-ascii?Q?IueZruNtEH+BfvrIUEZvR8yGwbORbQKfxWNgM/fRLIGwgeMDgUTV8Oam3xmI?=
 =?us-ascii?Q?liACSyJmJyqdNhf9hxH1pjKwpVU2Jx+7gcuPHiKoX6t1DuSoN7SWF/6egCPf?=
 =?us-ascii?Q?jGniMCltUFTfiK5P83nvEPCGh+2q1A/NWBByx3HH4wusEBd/jZsp1V8QHPaI?=
 =?us-ascii?Q?PsEJfMfnvIGvYAawlXv9ATX1b1f2+im3w4aBppvnKVZAoKygCFMwK5QZF6tg?=
 =?us-ascii?Q?Ca8FPp4ltwGWgAZKtSxyzA4qihDXce5J+N0CqSnOOPwTf6VuCAWZhUoep6Tn?=
 =?us-ascii?Q?7EAZOiv3kW8pUg/Jq/3/FUZ+DhYnSqfdQ4GUV8rWxPiU7i8zJUZqQD4Ch11Y?=
 =?us-ascii?Q?sAQ+v94dSMxRV91VxUiOw/cZep94UnDxwWLEfk7X0GAd6cUXKqEwudSSW5iB?=
 =?us-ascii?Q?ahfmTdWJ7+Ievh6doaDClMwmIoQ5z7XehMldQQ8U7/owAu4+TEZD9cPhkTfD?=
 =?us-ascii?Q?WLjDuTtnT29KkfG0Ra8x3qlqdRKowZMzEA3GHpQQO5uRe6AMU6TJ7KfQ1TNg?=
 =?us-ascii?Q?LNVeKsA4zkJkD6KeGowqWynW5GYFUpRX+jqfwXi/xVdRiQog1no/mGTYKUjD?=
 =?us-ascii?Q?Z7r3NUBlhqlU+B5k2rSj1yDm6Qfw8T0i6Vl+1xIevBL//vL3S9dAOkK/zfS6?=
 =?us-ascii?Q?saOghe+sn2xQ6a1eJDTUvbridMJUcdmONMjdJL/L0Rg4Ikh55/jkeUlxG9OM?=
 =?us-ascii?Q?TxVh9ASZyXEjWKitb+JKt2ekYlPNMdRzAh+ofFBQuQh7Zy9r9Ofj/2F9SXbR?=
 =?us-ascii?Q?bqJMQs/BQQVeETG6tkW/iOQpr1TMtSQ/09oNixRWTK8yiSHEhGp7gMM8kvbL?=
 =?us-ascii?Q?0xF6xvy6oZaIAUyzdilLCgb8FzmutJhrCB36zKeBltREGN1puj8a+dlfweQQ?=
 =?us-ascii?Q?t4vGBEgdZq7p4P8m5JEuChyTaEpIlBplk/vA28ekAeh12+7zL2sxn6DRky4k?=
 =?us-ascii?Q?MUtIaKg9rpXLGjsfr8mS9KuXRGD8JQM1KVg5mB8zoOUPLxQhg1Gy/MRMPum0?=
 =?us-ascii?Q?juC6BqJMl0RETdIpsdux8i0wXQPZoAdRNBZA4NTmzm6iE3rJt/WAqDg3nvAL?=
 =?us-ascii?Q?uOe+jF11nlVm9x2hosjHlDcEkJhXEjbiTdh5RHH09SYV/RY2ngEZ2Vp3xp+b?=
 =?us-ascii?Q?E57sxOYl0rfC6OR4LiEe20h2Po2mcuWIp9h6LZdddrWeRvG3DZhXumlzbiaP?=
 =?us-ascii?Q?C21s0aNKxKTTAoeIOMOvphWvw1rzzUk6U+ih9AmEMZFYIEDr2rdWXKc4zxra?=
 =?us-ascii?Q?tVjCmkvRusimDZ7p9TiP3ddwZl44547x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PRjWaNO321moGMEqzf0V9g621SYMvyo3zkwcjwYiFfVEDT+ynsgIAxq85OoT?=
 =?us-ascii?Q?E0pn1ACWZ+icsDDzCgatTepIc1e/XI51rIhpARZmlh0qdCCc6GIQmdcsz++U?=
 =?us-ascii?Q?Cd3PxGf7TbzXa4+r1UouJiLnD64H+lhCAXxuSPLqSssXITYHuWKkk7rUX16R?=
 =?us-ascii?Q?J0O4brPhsFKktbUXYphnYHyVqb4WHJKf2FS4SY24a+D+tj8K/8M4TycPuyAK?=
 =?us-ascii?Q?CTwUaroIZAK7UHE897omM/uIQSnpaQW2TuhgVu5S96HVfVI3Hm/+L+5F3f9k?=
 =?us-ascii?Q?JFNdgq/ixC4Gr9nPHtApRSp4KLXc85E4U8hCnMOM26azlpE0qN2yJWLxtT8D?=
 =?us-ascii?Q?dZo0Atd/S7JaP5sDK0b3QMkgwyh+EnkiSZKkbF5pjkYEek8Um/qzY33850Oi?=
 =?us-ascii?Q?LKdFeAbhV6rFE/5AsIDgV2YMfJGLcoKqvc+sOi6wgc2lq2Ws6JIv3De8+fW+?=
 =?us-ascii?Q?W002zLnJ+5FPlMhxBMP641D3LZhzbbS048bFf1wPCjwoN0GtH+FW0r26kgh2?=
 =?us-ascii?Q?+C9/UzoXQ9Nlw7V5ex+Zx1AfCkV8hoW7fNTeLkfnaZGrhAO143XDZ7JFUrcM?=
 =?us-ascii?Q?nChaEEb+LHVR3xfHJOE9rrBIALfUK7H+tq38H9O0jrv8Sp1oRyuk8jR+Rhmx?=
 =?us-ascii?Q?fsnDrpy6wpbm/4dgiopEbd0ppdfvVwNrRtOXMcdRWFz1V1+mIQFf44Y87WrG?=
 =?us-ascii?Q?YKafL0SHla2d5OMTrF7RUBiZjb/1DWD4+9UPg+168kUg0nnorz9JgsvtlofM?=
 =?us-ascii?Q?4fMzHjmhYxQnzjuFdY1UnAmtRAucLcK4O8v7Edcwhtq2CwepCjY3ZhzODrKN?=
 =?us-ascii?Q?ZkiBicvwtsJiJctG23NgN8/KtqxRGKX4T9ExyITTo1atVQDZSbVyK55dVb29?=
 =?us-ascii?Q?PHSqSb1MRVKpAEeCHsllgtv0I1RkvYfyuIGaYPK+lRKh/Mxrien1Ig+aRaYE?=
 =?us-ascii?Q?IX3GfUxzlMJiDj4qLoDDI+/zrNSBe3m1tZbb4rOLP8V3+cy0ltXHwImP6VNl?=
 =?us-ascii?Q?wbpnJxshRPCA8oKf17psBRaTVB6yLbuULzNdhyjBVnDxf3gxMJOA7cH0OY8h?=
 =?us-ascii?Q?PRmwTgLB9Pf1rCf28yk83E7QAToQxwLEQYBi9KX2OpXlCq+mmay426W9crr9?=
 =?us-ascii?Q?VaQU+Hx0ibQ0JilfV/13Ph30WizV4nZX8W0OzKyF48n/yq7AQE8Y6e+ZxMaf?=
 =?us-ascii?Q?mXKGOlMa7caUiWy4Czii5XG1XTofxR0tgL5kd/SkuKVtsMv6RXhXyeR5MkzY?=
 =?us-ascii?Q?Ha6JsyLMuC6+7Xi+Zi7651+RtDdddTTsZPh8ZmGWHgxBnE0xL2Kk9GPoK8YB?=
 =?us-ascii?Q?NoEcAeo9x5VbuclA7ssxVJjWSOmMBflqXM59yVnndB0MXzSBaPFj7DxmI35W?=
 =?us-ascii?Q?80e6N5vUHe9t9P1HtGKddWaVIjVt2nj2eoMiRkyc0pkCL9dNolHDumd1/LFx?=
 =?us-ascii?Q?yUeWwO/SjPUrNiBvC4Yf4EazHWSwePbWz2aITOYIhaTYCUCKlqDPIQ8wyEwm?=
 =?us-ascii?Q?yTclYP6FlqoVvJa0lCSLBwDmrIEWom2jsuGCrYUZwBUvBnxklGawXd4AmM1A?=
 =?us-ascii?Q?IFOZXe3qmsyLMkMjg+KV2TLPB3NlpQLMqZq7X2l/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd90db2-0288-484b-8e97-08de100643ac
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:27:02.6184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2t4yV6wLKfObk3l4ZbJ/COpqZ9q0eCJVwuRhGmAihL635kezxO/HFjSXAG7vf9WT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9572

On Sun, Oct 12, 2025 at 04:57:38PM -0700, Nicolin Chen wrote:
> Since the core now takes care of the require_direct case for the release
> domain, simply use that via the release_domain op.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

