Return-Path: <linux-arm-msm+bounces-56296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD50AA4D5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 324507B3326
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E605B25C6EF;
	Wed, 30 Apr 2025 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tBg6iagr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3862321A453;
	Wed, 30 Apr 2025 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019301; cv=fail; b=rWVp2o19SbKlHEdQdg/z5zpfcuL87AUwfom97EACfFwaHxtjcYDaP0huCIqdghnNWWVt3RupgJ/tRZH/8cNSt1JfdjDCWtATOShGEORS5xSWfmpr1N+BLKX670uFGIoUUpVHuYmPCCd4CqlhIY6lZhqZ4o33sfp12VgpxZRoCeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019301; c=relaxed/simple;
	bh=tRqBRiYUc7zqglepF43pl4BKGoBtERc5W8IL8hw8NWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eWTWaby6ccFg9M/8DSvayB1WdXWTmaj4Ty218NqPfzZv+ZoE04ToIu4MPfM+6Q0SJnXVcn2l3rwIuPLMnUD84bNQYQM927uwffqiFV0SF/6li00pOX5/2Q1cE1aHr5tb6NHslbpMNmuiakKwfnO2L7/2GXeI9Mo7OtkhQ5MhY80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tBg6iagr; arc=fail smtp.client-ip=40.107.244.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onTszF8WQovRS879qkfdSv1SpXaAZa7fn1gO5+Ikvvg5YOmEjezCyEc//wiwk3nMgguuMXQ/zh7D7zjxt5UOnpr8bCvm+7/KsOuE9cVskyf1eq0358N4hZR/N1V59X5WOa6VI8E3yeFgExvoaQQzTbx2sMKDXU9iXSi2iOOkD2iNge5EUe30F33o340ugqV+tbhOeufPtY6WfKpy91fY91eAeOvOep+KZ93MIhd7ZQByi7ifY24Oazb5xhTPyEocIldVR4xrGg/+/nWw5cDDiyAGzX1sQkFcl1nO6Vxaa4Tg3YZQX9lNMqWlJ1o2RnW3++j2h04d3DJHNRt32t0xgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+fCeK3RhMW9cQNdcJHiBgPzuG0Sz1KdHFjmMHD6i2o=;
 b=XahR1YZhCN5k4m9Upqc1jBwq7/f2U5FqfCNtNqMli+37c61+j3Aq6U9f1GPmPjyMZ2sMiG+xy4RVvbUpFPCykBj8yaOW/tqgEFi+/fRvGHoNndbRGgHbH9DxRIZWY8N/aXSlFIEoShe1dBf8KANX7QNQGucizDfWxiXrDl8MsA02yemEjaz9Koo18pPd4V+NqWK2digeHWDvDKQH4xJ+A3FHKNHv9vs+naNmaZAJTV9kyZXIYhumbEXFsng64z0Mba7t7aj8PBroDPaWS3lh7SzN7T0Jd3e37PxeUNQc8j6UwZtM4TpEAn2iAdoYUQJHnZDMVaUoCPYJ+TZTsLp1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+fCeK3RhMW9cQNdcJHiBgPzuG0Sz1KdHFjmMHD6i2o=;
 b=tBg6iagrWUTfl9bqVBD8B0/GkBJ4BGH3AjrJjvMZz5/vh9RRHATmW0av00WKEdY9TfDUoaXYCRFMRzLvVhK1VbolV9EHfuRdfPAus4voQFeDbS4QYYU7kVBRiPmNIp4PlPDIBVxNysjwfOEmEjFKlyIfvLk9uQ/TqLN8XSH3Df7QTD/JFK4m5hiU9venN4Fn27P4vZu8THNOXbrm5IoGLB832CwgUPce4ixEINEkMS1Q0UaX8jieDacGqciA2/HQlVyGjWyUx4wG3AKgNdU4ga0EMsFWbyJaGpda2CnqN6Jc9LrnbKyz50ZCRjqI1ehVThDPLjLeHmbbD2NKyjWhrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 13:21:37 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 13:21:37 +0000
Date: Wed, 30 Apr 2025 10:21:35 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
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
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple
 drivers
Message-ID: <20250430132135.GG2260709@nvidia.com>
References: <4-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <176e3870fd0284a05a19d424ad1a56e73120573c.camel@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176e3870fd0284a05a19d424ad1a56e73120573c.camel@linux.ibm.com>
X-ClientProxiedBy: BN8PR15CA0070.namprd15.prod.outlook.com
 (2603:10b6:408:80::47) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ce9bde-ed6c-495f-4b8b-08dd87e9ef59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nmyVf1prK4Fhwddws/K2pvUhD5zfy+83pP3Tbc/G9MPD7vnU2bro6MThENIp?=
 =?us-ascii?Q?HF/qKf/wFlhxkE+KZ/qzsjdUxmgbkmbif+x7YoeYHKguw0ISuqVxrGjtjMVn?=
 =?us-ascii?Q?rH8eX/rlyBbRum3QvMhVaTIlBwL+GZMa1bdjdJyPilPaDs+yZsbqOaQH7lqG?=
 =?us-ascii?Q?zjEWSfKVtwiQ0prWCV5qvrBMckZ/bs5Crl8vbquokp9zSkZP8urGh4bdAb6j?=
 =?us-ascii?Q?C7unmHqWL8C24bR/GilFeqAkgmf57so9dR1sZeyM5ln6PfsYDZOjDcUPR5y7?=
 =?us-ascii?Q?oLgR6zr1RVXE+77QBTePU7sc8uyUGT6WwfkdTLjmmBKvSADqF0Wxa35Kmwev?=
 =?us-ascii?Q?5jav1dFDNorPNfYYhRPg5/yqoe5QNBCyUBmapu3i9F+YmaUBRD5zJegFidCX?=
 =?us-ascii?Q?CPyVc8MpsLKw/FTVJ1ySwUUBTT6cD40wyc8MBjWGxkpqOlruuhFLnPo0KFfZ?=
 =?us-ascii?Q?6uCHw8RVnCMXRn9Uxpi8Ss1IjJnWWMDXJtQaP87GCCIck4Zps1GzvmauTFKr?=
 =?us-ascii?Q?9Qk66ccGIUO0CcA3SuPP8gsTG59gkv8QRIVUk20BShqdNCsVpVRQHfxXTo2s?=
 =?us-ascii?Q?XSt6qmU4gbY1s0eoTVLCPI8yyy/c6Gm+1uX9PG5o33i7fw/tMOtofiM+L60Z?=
 =?us-ascii?Q?VKpTZqATphBxaemOXZKZhEVGnCPGh3s9GjII4NjcaqHOhJj6+F+QawNjYyl1?=
 =?us-ascii?Q?X3672dEGBBp9Ev2RmiTbgn6q6uFNVNMAJOrZCjj6FwLdlxJNq18lp1zJ46X2?=
 =?us-ascii?Q?vLptU8PNGzouQy9g4mSpuPoC+O18nYZvLE+vlr9kP8T7iV480RngH5eZQN3/?=
 =?us-ascii?Q?c+k/BmRlmm5JCiDVYwZnOyiljR/d5yCVsf8j+Odpa8IGbYoC3dqm4OTRvXzn?=
 =?us-ascii?Q?6+1hs4B23IjtNE6LyLx3c8Z8rAxvG/lLzQ1P6uuoyFKSg73LEXU3PxR4923K?=
 =?us-ascii?Q?aJYnHRpw65Rn7COQo+z/jz0mkAokGvff3B4Iio34LYLKxnlUYx2X/FjuDL4h?=
 =?us-ascii?Q?yi0GegiKWQCkinlb4fWZZQN+jVtRTIYdKMs67xmBHj4QC8J7dGSlN0PS9etU?=
 =?us-ascii?Q?1s67gt/AUlDBlZO7yvhRkCGlvTf289Qoi3e0YGDQN0B2lGPDkB340Nq5Bq1G?=
 =?us-ascii?Q?+TS5IiqFBnBqOiOjpZaLroHyZkbsP3QrZwwEVSuUSI/Js/EBrsFRzXDs2EP6?=
 =?us-ascii?Q?0XmLsiDxNXMvp0dCV8fWfQl3E/OHvSq4tLPJj7vI1uXs9BmKnFX+R2D/MQ/d?=
 =?us-ascii?Q?TnyKzR+uBz6lhVSN00QMw+YetVMF6lbO7fYsdgl/HrKcOw+23F0kquBB4oC4?=
 =?us-ascii?Q?iEyD4zV4lFUWhwEZSgv4hajc2meoeicIZ667h8+Qy3ZJluvwKLDq0SmH8Ech?=
 =?us-ascii?Q?LohitAtyEzyYFs6szhaQD983zhyEtE+9tdXb15f9H7J4q/+3G9jZTWfemboH?=
 =?us-ascii?Q?s/8inVSGeBw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?keIDy9IanXwRRIHvFt9kCLIrVd1vwiYLPGzd9YrbdVMSFYOyryOmUcLYp+Q6?=
 =?us-ascii?Q?Yv/Cc2O7MpeMk9tpFgchzeVp7tOfJg0kApZgScCHoc/JlvHkWGsl3mnELL0v?=
 =?us-ascii?Q?i9GKhB3chQM5zBNyz8+zfYMvmKmWcbjkDsc/X3jB8QT/9dhOqWA9mFrAOI0a?=
 =?us-ascii?Q?pmBV1IzP7YAu5q6NzgnRDKHfymNWmkFSyFF2ktr7dBXAarAK6p8gCu4lzPQC?=
 =?us-ascii?Q?+FYMQC7yK/crgrVC8+3UdQoYo9CSXvtZR2PKQH5AYZspZ3FZe5GDfHUFMyms?=
 =?us-ascii?Q?kNYGuDFRxderGoBYzcgd5qI6sOfZzqha7KuDptv8l0klfSaDkfWD7Lv63i/t?=
 =?us-ascii?Q?RNlf5+NGoLhmRqQw1AABR3Lyh+wHopATb/mRv2c3qe00BwDxWfmnPXqtXNCh?=
 =?us-ascii?Q?d79/tKNrHegrAHHf39gXdjICYe8INBrxPGUsLS3UzI4y3IMLs64yM57MvPv6?=
 =?us-ascii?Q?uDUK358ObpmU8KKG0lF/QprReQSkIWUI87yVBH9FMluZJgjOw8n9lbWpjWTL?=
 =?us-ascii?Q?aO06OMfkLEu2UV4syGZ4votnguLC2ZYqE3bjjlBOUpOFfTUBvCtTue8BxHPF?=
 =?us-ascii?Q?j53jgmKYTyfWqk0UwXnW+w59p9C7RMhmwQrMKcSp/2R46Yg+RL2C9g8FuNGK?=
 =?us-ascii?Q?1p2SD+NLivOQNo1hh36uwLke0BT7j5O21/YdXbdyQnV00H82zERejPsGJZIw?=
 =?us-ascii?Q?xDBtkkKUHW9yyWhlPmPUkEIzs2SHZGGqpQTowSdnsHmlp6BnqsBsDqGAslk7?=
 =?us-ascii?Q?XiYRSLc4z806YTGswICtLX1CmknCWDLi7NCJIUk3X5lfKy+DysO0SH5/u9yU?=
 =?us-ascii?Q?rC6NVBG6UoUtyyo9lZ2zpR1cI0TK1bVAkORqyjSXlR2HDGjNE8oSWgC1tPKp?=
 =?us-ascii?Q?rP4Gsn/NOcq9L7NEsOzxIuWNxFqic0D6tJmZzNDkzW2Syo1VxyCCp2bZBa0W?=
 =?us-ascii?Q?QkqyRAcXV5lN9LCgoh4dtPhNBeYIEdlna68Mrb9YCmwPW/8WVARBhTL02IQs?=
 =?us-ascii?Q?pfeJiKymFJOzIkSJvDPoVou3LOKEqXUeJcoddEihTW4YAg66RnfKB2LittWF?=
 =?us-ascii?Q?AQw3MlEZJdqV3uBdNA9U9zfkt4dlcNNX65aVMw/a3fqRAgEg6kL7C0+hBjdT?=
 =?us-ascii?Q?MODHKV5D4LFwTRxlKP4fhJ2w2lgAQpO12BLbE8PbCsDcPoYyrMMhG9K2mGDs?=
 =?us-ascii?Q?BzpTFt1SQ7MAlIx2pWFn3BaBJ8F0k6piOUF+nvTto4h5flnAwyokxV2xnVla?=
 =?us-ascii?Q?DGMqGf5K917wz9U7Ocj1Pbu/ABmEoZO0r/0rYw3yvi5ZJVAsVyGPFg3MJLbr?=
 =?us-ascii?Q?wfaggqEHQPFfuOhdPvsO1cW8gQY9YWlhhLl5TM3n5sQkN8gTQzHn16BqqGaj?=
 =?us-ascii?Q?Y6wGqKqI8pZov1+txhI+igB4WetzLgD9hH0ZIHc6KGdE4j2/ePybCDX78QLb?=
 =?us-ascii?Q?vHg5ISn3x4Xn0wPViClpaqgmLCEFl6WxvI5a1Q9+3IGfnimVbVLRP04TRIhf?=
 =?us-ascii?Q?wRA24ysfdzpszk4IQXbjz/DRDkK73yBFhG3XfYcPTmpBxdO3ctwqEYRs00yp?=
 =?us-ascii?Q?GPHnZN/YvcJf4NjWxnj0s2IvL4kZsGYPqo7Ubf5w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ce9bde-ed6c-495f-4b8b-08dd87e9ef59
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 13:21:37.2346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FPWT5G/ObIgONcmu4tE3WiX723coE2zL41KFmtxdX7YvxJB1RYqaIuUAOsvV1MH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522

On Wed, Apr 30, 2025 at 03:15:14PM +0200, Niklas Schnelle wrote:
> > diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
> > index 433b59f435302b..9c80d61deb2c0b 100644
> > --- a/drivers/iommu/s390-iommu.c
> > +++ b/drivers/iommu/s390-iommu.c
> > @@ -557,6 +557,7 @@ static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
> >  	}
> >  	zdev->end_dma = zdev->start_dma + aperture_size - 1;
> >  
> > +	s390_domain->domain.pgsize_bitmap = SZ_4K;
> >  	s390_domain->domain.geometry.force_aperture = true;
> >  	s390_domain->domain.geometry.aperture_start = 0;
> >  	s390_domain->domain.geometry.aperture_end = max_tbl_size(s390_domain);
> > @@ -1158,7 +1159,6 @@ static struct iommu_domain blocking_domain = {
> >  	.domain_alloc_paging = s390_domain_alloc_paging, \
> >  	.probe_device = s390_iommu_probe_device, \
> >  	.device_group = generic_device_group, \
> > -	.pgsize_bitmap = SZ_4K, \
> >  	.get_resv_regions = s390_iommu_get_resv_regions, \
> >  	.default_domain_ops = &(const struct iommu_domain_ops) { \
> >  		.attach_dev	= s390_iommu_attach_device, \
> 
> I'm guessing there's no particular thought behind not adding an empty
> line for s390-iommu.c like for the others? I slightly prefer not having
> an empty line here but would be fine with it too, so just curious.

I think it was just done at a different time, I had to rebase this
hunk..

Thanks,
Jason

