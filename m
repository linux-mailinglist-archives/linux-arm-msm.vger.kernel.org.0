Return-Path: <linux-arm-msm+bounces-56147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC863AA0F4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCFF97A8ABF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAF6212F94;
	Tue, 29 Apr 2025 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ry/w3RoP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482851DE4F3;
	Tue, 29 Apr 2025 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937831; cv=fail; b=tFJzx2ckcKIPlLPbQ2HKBbf5rTeHgeoUtCCYlcyzs7320NBRvFfQxhsQ/WQsioAzaYDUw82P6dujaBxdydRM9/gXIrONL+KSF8dYicTct9v6uIqvqJUzCi6d29huIvdLMtPPNX/txyKnk2aKQTLQOqpOUO7WNRbTSP2X2QVq6FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937831; c=relaxed/simple;
	bh=05cl/ZSm6tEh/8oeAfnnQWYFKGxQD+uhbhRwhC6ZaME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KG25zCFSeK3Ug46Iaep0b2xzyd98J+MXQlPou7Tmlr4WIjIpmIZrBSppVbitAk7u7yMct319kTKNg7PvIgQsu+JbVoKdMrP4blaS3+i8bvlEBeycOIQgqCDbAc5QtKSEw4AsvMSwDBPU33Yspqc1X7sCrzF/ZHJol5kMyp0ON+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ry/w3RoP; arc=fail smtp.client-ip=40.107.93.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jX+RB1oe0+CIDxKsBTwkXQlQM0EAkyJHgTg00BpjVXY3zy1kaUbvnRhoXl23YxcPD95JqOsPsLfw6HobkjqIDBHCHikA9UkIMv2Bxr/5U2uY4fCnKzBQHBFSiRzPS/7BJ1VytklbKWdDjnTK86ZurOukvTTMdAfXoayqip8ZUYulqg31jkQ5BNhAnsl3QCHUUu14mJ3T93fN5Jj0XmoUJU9/f6XPN+lSpjXU8GCdYZuMp8uM6QLxWhutzhvwJXuFkEOIYX+faF1entQLrFenndZiRcvx7IyUDU2HyzDiQ3lMj/W1JGhdPLNAwhjQ/SfaaXjTrmDDszdTNaYAFDxAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eI+pGjriakqa4yf275zcu1xZgf0AZQvZJleCVPkLoM4=;
 b=ZE99E/q6wXbTZe/6xJ3vCFDubVuQnwRBPz1bFK1rBwZr26/3imHp3a5PaGxssniV6FT5quwitA9YIF7+H3Voksym2Nm9I0WSiFvQIWFM0RLDGSdqaLZZtfmYWJtXAt1oSgWs4uKHE+qhNM28v2hnc+Xqef+yR7JblYUkQPxJVpFLOqjBNVwZ5AH11GuQptGddV+4diFxzuAytrGFWIYLON/1mG/6UguEbrqL8bCNrvH9sEJuOdiIrMpxjIjDwx0DEWp67CHTC8TAIGJ6LDHeA+KnMFXmdP9IqZIibvgx9cSsbiPjaTVZ16C36lk5bPAlDptPFRskmx+s9XJnO0nrsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eI+pGjriakqa4yf275zcu1xZgf0AZQvZJleCVPkLoM4=;
 b=ry/w3RoP5/I75TVgjLqAFDsufVqV/zpiJE79F/O23GANiG0NlFXSSQBpZF/ZI6iivG1FF4wRRpwJocAniyI6jRHBPxo8ryXxAMYYqG9M17kuu4pmqSdB5DzpQ7tHjS4adS3IObxTc95de52LXsNzvUeVVztUnCLkqwRvtt2dXddYF7gF8o8t73fl8tmifUQDI48fP3VwOz3OmgnOPKeeXGq8z6g321YFlTkUMM53yGY2K6e2ZltedCZcsTuFy+XxSEQOcipsWrhm2FmEoT/1ct/AcBD+tW1WjvDqX2y9wlvzmfJifF8gjwBXpdoYMp10BC/9o9m/XCWez3clcM7S6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 14:43:47 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 14:43:47 +0000
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
Subject: [PATCH 3/7] iommu: Remove ops.pgsize_bitmap from drivers that don't use it
Date: Tue, 29 Apr 2025 11:34:13 -0300
Message-ID: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:408:f5::31) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e9acba-44bc-457f-5135-08dd872c3f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t3Dv5tgqe885lt5XfGT48uc0KVKBsoL3j9F9zBROV1bhzY11dpf3eWptC6/b?=
 =?us-ascii?Q?A+8J7TJ93VUtvPBUa4c5ckqZLwsLAabDiJ/0bUyrTh4lsFjIdB78MIIN01Ve?=
 =?us-ascii?Q?8By0vyTYAhWjj6InLArkrJuY8Fm2etPsscCi7lxBeNsvddsmr6be1Ii8L3CZ?=
 =?us-ascii?Q?fSkd3E4/KlD/ajV5oLcsEAGnyH4zFmI0l9onhn7C/ZxPN9n0K+iR8qxdUBKw?=
 =?us-ascii?Q?Sre5PirT9FwjzQg/mHuxsPzcz5Akvm+bhIzkJC4anF6ByKtGEIOll8zeFrRz?=
 =?us-ascii?Q?DpEBgU2fVueRHB/8ByUzGygUFAB+/qxe1zi+91sNuBC7LHyOQXNom1hnTGur?=
 =?us-ascii?Q?8QSuejbMDG3Vc06NqHxHNFFrTYmxMmNhElO8Zf+y9th1nQhc8J4rJ6TTRNcn?=
 =?us-ascii?Q?zxvlRHVbCcL+Y5cSbqJlfykRCH+xOgGlPxGIF4pXUNOvyZskpIhYqGH2B/mJ?=
 =?us-ascii?Q?q+BpAz58geSGpxFj9k43x4snEf5FeJIPsV3BjL8RpaD+VLOj2TvlwSkyIPzK?=
 =?us-ascii?Q?qRO+JgG2wCy1WTtflnq9sbnh4J0ARiH81ALPIxZV3YN/jhC8TbjE3RfvfQM8?=
 =?us-ascii?Q?c9iAAtdj4anZsS3ZKVwsTHJ9MUIMunGSKou0mIt1pXt4pPThyjo/j1LLBVM7?=
 =?us-ascii?Q?DWH7epkjR45poUGwGlpoWPHEGYr7JMhT/tMpi6exAnxq4Hys8OWxE+IT08c+?=
 =?us-ascii?Q?GL29s2gGQvY8poJoVj8SIdW6FKiRGeQJ6gQxNqLQhtQv9WUM1dAnQCk2ieDz?=
 =?us-ascii?Q?CyXYtbGQUf83d58JXt/iom/RtMXpC9BFKl1Ra1vkaWhciJYIs5bcYAIRQ52S?=
 =?us-ascii?Q?vwUKblo3zJ+Cx/4EW1TqdLlRa3A+UB+X7MEKiPnCVDX0wgh7/dCQAYxSBgkp?=
 =?us-ascii?Q?IkHAwElmcjrxKiAWrcYIA010fFrqbcfyn2vZ/O+z3XlBB4/uNScPdIgERzUr?=
 =?us-ascii?Q?Oeq/MD+EGr1K1nwYfdefeGRcLqNkgcW9tL8n582A9nTIApJi/jKEsgLjTqAk?=
 =?us-ascii?Q?XW0lSICIRXTEN4ckJRi526tHZGWwEzp5DBvT5guUbR5oMpS3cX70j0CzETAo?=
 =?us-ascii?Q?RhBh/jDFSDZ+5MRsSw1Uv4OfElxN/DyBCJc3DTGlQegFGLy4WsO9yX2SyxnZ?=
 =?us-ascii?Q?ORwK93ProgrBXoaZbGrIwlZMWn+ryQzkIo2dHK0MHwQJMhgaugKa0au+fMUK?=
 =?us-ascii?Q?djNdIdDyZHrj2t0p9e1xxOmzTac7cBid/jFmLvdz6L0zd4gyav6HxwgO546V?=
 =?us-ascii?Q?9WlauJG09M1Mewk6Y1TcSWkjgDwAJZflYVNIsKYisu8JSSIyGRDvwe6QBAOf?=
 =?us-ascii?Q?Vjq6HLZ4iAR63OqvzUPnKMdcov4AQYjrNrtZypKBOaJ80X5xjHmPhcnoXFjs?=
 =?us-ascii?Q?1RDm6uUEezxj3up60wM/i00RKH/3jGwTq563a5GbB9zIdAHtjXFQmXjcHDew?=
 =?us-ascii?Q?EKv2d6JjhTuYD/aAFqkB3viCSLiPw8QQkUhbmF91io11s6WfjSD49w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6YC6zUW5TY/jkovXz7uHlEyalywbG0Y39nJdIfpUOMnRXeyOu3pI7YM3cUsl?=
 =?us-ascii?Q?J4RUdS7ebgOt5UJY+J+DgkjJ9Qn3uFiMsn5n12cNGq9qoLCRhPstDGOVDvvD?=
 =?us-ascii?Q?qn8c7x2H0i4SrXtvSfeJXzyN7KylCnQivHYE4u5+cv8B89ubj2yZOnzQXLAJ?=
 =?us-ascii?Q?lTtFHztqcOjFPJrPZeWXg8w7ioYOV47prh2RdTLBstArrXbFdjRep73CdQp0?=
 =?us-ascii?Q?50uwXu/yy0MbAJ8km0i0pETctyzcF7yQZhpQ6QxbN2m4UvXJnGYLbz2zYM5x?=
 =?us-ascii?Q?leks0CkB0HsSQ9SXnsox/wKRzpRWEIjZP9JpEkhn1nnFxrzQucBYOKYfFgjF?=
 =?us-ascii?Q?FAsg7uykYQ0MWqHulrguNpXNk6iSF6YFIOMB63oBeSf39WTq3zUYtFF5ocx6?=
 =?us-ascii?Q?/m9dL3ttlX6bB0qFMkiXo9w45t8qjkM2lLTBr3iKXhANRrzoiO+FX8Y9YoT/?=
 =?us-ascii?Q?k1Lb3AWBTe0VIZt72DZUIL4la8pMWKNjVyiEXwNH5ilQRPkM75ju5KPIEvZI?=
 =?us-ascii?Q?sDMEW7j/v/TzTs4w6zEgIbPBhX90aMcnGeKnkMjUIR+2JeZJ2TXuYmh9I8Nt?=
 =?us-ascii?Q?F6AFcWghbZx3wdKuU9+EMMRLrXTq1YzaBD+6jZKBTCkhwPlWZc3mr2tPPhgi?=
 =?us-ascii?Q?6MG5To/Ehqt+iGUm2K8k+l0tvUrk7908LX/V268inYgqKi/O2rB/qAcMgKGu?=
 =?us-ascii?Q?9P9PYMMcEiVtAZ2x5P2ILG8FSQzLTgQ3zcy3mIP5hgTRvaRgqhZzLLbFtUHy?=
 =?us-ascii?Q?ATMeCn4yaj4uNjgU1hZR6z/lnA+OPjl/p6nUgzMh91vZOs/CcBC9VlgiKUaB?=
 =?us-ascii?Q?5bOUOgnaWA8/ZqgyUQ4aVEonRPDysYiUQoGO5eFdeH7XPigPhsKELAWemC1v?=
 =?us-ascii?Q?NRZFiclYM/QFBWUs/6KNPLTkMk3xFA9JVAnI66goQyn9Grymsdx3a7zpYUyR?=
 =?us-ascii?Q?eT5G9pwfBfXJdPg0VKD5yIE3rM52TJfr8fJ9FCIcclY05pzkXD2f+k37Gsi6?=
 =?us-ascii?Q?t9C/y+g1t8eKh5VaP6sDIQKzCcQZkh9VQy280po3DYNG+ubNuDtiTeBNaSom?=
 =?us-ascii?Q?YDEX2HBbi3DVG3ybFwtOCWkmXIn1kVldVXTFZA2T2xU/aJeCFb8LkDLzVke2?=
 =?us-ascii?Q?bTlxc36QxZOSm1s2lIqxUDia65BdVvqcX568iMU92DyGFgbZvIkH6uFg0AbD?=
 =?us-ascii?Q?cCEOfWffhcedzqd3cgA3Lew8JesvWoS3Bm/XJl7DOiTtG5o4M2ONxkkuQv7K?=
 =?us-ascii?Q?Pvci3Tcin2AY6UTOsI3IfZUnQVStzcD+B7wbIU+vkfRXHsOhOnUr0vAR5aAI?=
 =?us-ascii?Q?9NNT625zVAsxA9vxpsbFVFPxwttJdDiYh5oIDOr+4iUauucM1CLxcTRCZvc8?=
 =?us-ascii?Q?aXg8zvEuP/V7+bmxpEQW8byV+g69itWWum0anz5DBlAv4TYgADHyXL+ICnaE?=
 =?us-ascii?Q?ED9G7hQkw0NjWr1n+QAnrehGZ+/aLbWvP89dNAO63EDpktJvJdb+3KT7HtED?=
 =?us-ascii?Q?vEE69n/4gsyJ2GzeUiFsrChqqQ+I7xY77YCfzC+8WJcHT2pDqC+9tTSDteCz?=
 =?us-ascii?Q?oUuGSPMwpck1EIe4WYxRoEzH/m28/ekxcZkEMEtU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e9acba-44bc-457f-5135-08dd872c3f5a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:43:47.1003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpQXONb03Al1Z28xdu1SdQjIk4Om9o2ON1xRBM0um5CCG9l+3+FPf0nFhL8Bly0+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726

These drivers all set the domain->pgsize_bitmap in their
domain_alloc_paging() functions, so the ops value is never used. Delete
it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c       | 1 -
 drivers/iommu/intel/iommu.c      | 1 -
 drivers/iommu/iommufd/selftest.c | 1 -
 drivers/iommu/riscv/iommu.c      | 1 -
 drivers/iommu/virtio-iommu.c     | 6 ++----
 5 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 757d24f67ad45a..190f28d7661515 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -991,7 +991,6 @@ static const struct iommu_ops apple_dart_iommu_ops = {
 	.of_xlate = apple_dart_of_xlate,
 	.def_domain_type = apple_dart_def_domain_type,
 	.get_resv_regions = apple_dart_get_resv_regions,
-	.pgsize_bitmap = -1UL, /* Restricted during dart probe */
 	.owner = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= apple_dart_attach_dev_paging,
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 82613f90dd01a2..e996f0259208f8 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4407,7 +4407,6 @@ const struct iommu_ops intel_iommu_ops = {
 	.device_group		= intel_iommu_device_group,
 	.is_attach_deferred	= intel_iommu_is_attach_deferred,
 	.def_domain_type	= device_def_domain_type,
-	.pgsize_bitmap		= SZ_4K,
 	.page_response		= intel_iommu_page_response,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev		= intel_iommu_attach_device,
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 6bd0abf9a641e2..c52bf037a2f01e 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -801,7 +801,6 @@ static const struct iommu_ops mock_ops = {
 	.default_domain = &mock_blocking_domain,
 	.blocked_domain = &mock_blocking_domain,
 	.owner = THIS_MODULE,
-	.pgsize_bitmap = MOCK_IO_PAGE_SIZE,
 	.hw_info = mock_domain_hw_info,
 	.domain_alloc_paging_flags = mock_domain_alloc_paging_flags,
 	.domain_alloc_nested = mock_domain_alloc_nested,
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index bb57092ca90110..2d0d31ba28860a 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1533,7 +1533,6 @@ static void riscv_iommu_release_device(struct device *dev)
 }
 
 static const struct iommu_ops riscv_iommu_ops = {
-	.pgsize_bitmap = SZ_4K,
 	.of_xlate = riscv_iommu_of_xlate,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index ecd41fb03e5a51..532db1de201bae 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -998,7 +998,7 @@ static void viommu_get_resv_regions(struct device *dev, struct list_head *head)
 	iommu_dma_get_resv_regions(dev, head);
 }
 
-static struct iommu_ops viommu_ops;
+static const struct iommu_ops viommu_ops;
 static struct virtio_driver virtio_iommu_drv;
 
 static int viommu_match_node(struct device *dev, const void *data)
@@ -1086,7 +1086,7 @@ static bool viommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
-static struct iommu_ops viommu_ops = {
+static const struct iommu_ops viommu_ops = {
 	.capable		= viommu_capable,
 	.domain_alloc_identity	= viommu_domain_alloc_identity,
 	.domain_alloc_paging	= viommu_domain_alloc_paging,
@@ -1217,8 +1217,6 @@ static int viommu_probe(struct virtio_device *vdev)
 		viommu->first_domain++;
 	}
 
-	viommu_ops.pgsize_bitmap = viommu->pgsize_bitmap;
-
 	virtio_device_ready(vdev);
 
 	/* Populate the event queue with buffers */
-- 
2.43.0


