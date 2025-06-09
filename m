Return-Path: <linux-arm-msm+bounces-60689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE14AD27F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66CC3163C24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBE1221D98;
	Mon,  9 Jun 2025 20:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t2mSh7wb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA87221732;
	Mon,  9 Jun 2025 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501706; cv=fail; b=tg+DcamlVKYrKjZER07c5Y8MP916WHUbnpNhCNul1pfl/RSbUAzsKP16jZ5DdCSXi1BJe3Smw8P1oBqMmkFqIfq4VO8YuE9gqX3MDUP6yu5J5vqlovCDu0Z0gibXNtCAnPA8cJRBJvGt+Z0YmSGG92gfZEk6i7kXLjxk9vPPJlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501706; c=relaxed/simple;
	bh=etJEJqDT5lS6CKeQQyckYZDdNYkGT2BrLZiqZuhmHrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dyRuyngtRPFGE1/u+bEfwThZOI48nvMCDTFfGi3P1Y5XXuEVGRCCR5zxih02LFQe+efBoxxNnU/aqOXY8w8NrHvInbIFaLD24IQE200nSlTljsAjSg6nYVddlbW43WCTvMvshimmB6vRXY3cBD1VfvkTEy5amk9q2FkGFhiG4dU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t2mSh7wb; arc=fail smtp.client-ip=40.107.244.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F208tR/wyW5eHKHBGv/GNjljAvSB4MsWtUR9m+AnN+xYHhOjHE4Vl3FYu7G65yULKfTq2KYIjhkEqfnAMlxiDHrMjXLMbZSUa+EfQT5Emn9DbP8b88Q7e0MY6x9Kbsczj2p6L6Fk9KYp3Oxz0/BLT2WqJh7yM1GrdMRQiDK2E15Q2z4yYgxtTX/QwXHuDaYe+PXdRi/hV5IgtHD93Qeg/n1GCBCBG0ZTsNIRZxjTCS+0iOAuu3QK59YQcTs4KTau/+rsCojwAZTg2xk0awXQ1f1Jm0DKozwIU85+fdP+I0zRABwsY9fmTSqzDxGi+5CU6HiOiD8bNCNfJoaWBCbV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUPJQ/bm2F2KMX89Z13RkqvmJlapYf8GGDp0Xm4DzTY=;
 b=s4lKIj81yZ1V4CcrknhKGOMcQBXGpF/e6nhF96kzLMvUnwzzU858VkOo9HnPFJRRmvr2lA9xyMQGM7kIW4CDmQN5RT8SZsBfc2mqSkWrKRzH4qR0x2OqsJVALuidzZ7drfA8loZlBlF38vrwGGhkWdxSiOvGwqnCZC2VeMMr3q2TbV6IoTsmPCCrNpdbIdbkW1cY9NEDBPpwgNQF6rRP6M/pbhV9SU2kM97al7FHE3cRD6CBXTVsylhF6+AO8NlZUjqtYoWxMxdLrJ73WTgyYFhtqXNUaI14UPuvc6SUdRy/9+TZm1FbUZxF7BVV2xuq8JWQ6zDKAJGNuKpmUpP4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUPJQ/bm2F2KMX89Z13RkqvmJlapYf8GGDp0Xm4DzTY=;
 b=t2mSh7wb4jSW+iWfP36ihb2yYzKn9r2kuTh06S5b9xhLu1jkXc48oc65Q8d2XSuLX4LouqTjt4iGijbwHS6z59RykxDR0sb2Yzsp5tbB3W7qQw4iDBKBw/XXfi5PtRFVKqy2mILTQD67dYTMNTSM9qzJfiohbbZCRCnghw4dKbmxb1vOcw946AFTki54QkPuhjNGDeLH55K6wx4IKT5kgUP8BlGkHTZgjhAWtmGNCqYf02KYZ1duXPsuyL+ITdJXzZYDD9hviFLCnyKKYDzz/wP/wt4ZoQnQwJP0DziLe3Qj6rF+sxN6grq1lC4ENe8frj5RUp6Vq7bYMuwxz6wWbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 20:41:37 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 20:41:37 +0000
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
Subject: [PATCH v2 7/7] iommu: Remove ops->pgsize_bitmap
Date: Mon,  9 Jun 2025 17:41:31 -0300
Message-ID: <7-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0501.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::24) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3bfe6a-7a6d-4eba-cf04-08dda79605b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?120J2oo6wzvyf54MDrEU5uHGznfSHx39mPByEtqJjRYZG7O6s7tQZE6xz8/t?=
 =?us-ascii?Q?q15+f9rG0PBPKSiwtRwEdAEmZprU9y50C50TuZSnavZpSTwH/sjQ4j7/ptTD?=
 =?us-ascii?Q?3Fy/Amw1P0bE7Ziy5bgKyKoKsx/woQAlIfrR0zj3HMit+NcCc/tW2si0/e4A?=
 =?us-ascii?Q?yl8BX0YnHA+94EjxybE5nnHD+aYZpKR4dPX4ZHOUT0cRSekADQSezGN6CUUp?=
 =?us-ascii?Q?WtGTm6uDvP84uGk3CYjdGtpKd76WgNGsMJnxS6HCnPCmJRTni4FfIDBPKUQE?=
 =?us-ascii?Q?KaPQTXXGqcivRv/fAwEz6jW4F70j+fvH0TP91Tw8vtpvcW1vkjmyRQ/9ON2Q?=
 =?us-ascii?Q?AyPZuV02pA7jWe8FYAGLTSFgys8bSrl6BYhjy8Xnr6Sz/Ad/Ylf7s71uqb4h?=
 =?us-ascii?Q?StNMHuLKV6iKXVsPzwRtal/wdUjpuBVgKxU7H4c87VOgLGxNj6Np66M1CL6J?=
 =?us-ascii?Q?VNFecV4hIH80HkF0WYEuW6UiHT/bi4Sb5UP0piVEgcQfvG0rPAdj5sHjhRJn?=
 =?us-ascii?Q?neAW7H5WI88JfbhobsgGmjo+Yz/re5g2SIl295uHckC7ebudEAPr9Oi763GB?=
 =?us-ascii?Q?XZKoPE24JwEe5kgulR4NI/hB/drp/zZqh4l3MU4paZLmUCvdkJ0iXwd/in+a?=
 =?us-ascii?Q?yymi4AawEhytuLfa1gDrJa1eKe44OmZ4xFDyFdsvIw+uTPkt8Yex+W+mzmzq?=
 =?us-ascii?Q?NdifXT5MCTwBqBT54gQEMhPSv7ixOWjG8oQOHYoqxjAXBipnT+Z6IYfD36j/?=
 =?us-ascii?Q?5seD7vd7vF99ByrpUdsIsY72GqCyVyPDR8hpT4A7SlYj3fHxIZPEI9Azs2al?=
 =?us-ascii?Q?ppCqcmZn/g0GUDM5U1hBg8dWGqq0iMuqCwgrpwtMbLMiqKxlh7jlhxk8dO9n?=
 =?us-ascii?Q?cTZfOd0/ySCnFow32tE8hfBe8a0XdlQoh1pyyPN/BqHCXgkBn5hvHbMlsSC0?=
 =?us-ascii?Q?hiOEo5slqac4LefUxO88bVXpYG/fKNNoZ6ZREXDQ4EuuCkwohO17SiV2Lqpi?=
 =?us-ascii?Q?UtSvjpBvfRSaGn6Y4TjxZHaMWzZVJwM9YVbHe0jKDdPgmlfEUiZiB1ZocRUb?=
 =?us-ascii?Q?HJOQGRXY4H7f1TQX/G1kMqJlHc1sFZSHu+tAbEOsaPf6uu34eq288MQPAw8f?=
 =?us-ascii?Q?Xjx+5iRftqET/pW1fum6kqbSkDI+5neWXpzXF4zKv6koZMUYkeLwETYtipgy?=
 =?us-ascii?Q?7qE3mO9hUMmpoxdaXwrz/m/vR9pXfbCmDCfiylWFsXAqv+Jpm0YhwafyQmvH?=
 =?us-ascii?Q?BkPzwMXirYbgBDQONVVAkApwK1klvF7lDh27zriHqmnlyk3ScAtaNDw6Gin/?=
 =?us-ascii?Q?gflFu+UWH59x7sgNOEr+Q6ozAx7pRhxk15sNJx1VYrB/KTBNKCvgfOwArtMR?=
 =?us-ascii?Q?hwyRjR5OVkegJ9HVNrxZQ3Nw4kGWUMNFwHZensnFBsdStTnDEfIeIPo5pPXD?=
 =?us-ascii?Q?ls0mw1CION9wbCCaSMJBbOPXGSydX6im5yws1NRXjeTqMrRBfnxfNg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wpF237B6707lGBZ3imc+4pHcTE7m+enXLmKQhGEn4RfBEuz2L5Y6y79z8w+V?=
 =?us-ascii?Q?fnnFoQVTaYsQmFlFk5/ueKl0/st6DZStSG6kGBuhNtBP5LwiobPBfP7AROCp?=
 =?us-ascii?Q?1ylUR+L9UOKvkB8jcFD/HCRXDIzWXa8DDWgE6FHN5dEUABnMQyTNBr3NANhq?=
 =?us-ascii?Q?BMFQW3hV75bPWNN13KJVzIyUegkp/MYcADBKvpU2rDzff+C36qINVRahK6qG?=
 =?us-ascii?Q?jIqIaxgH0tgckhfZSo6wJYa0VhzS9eP6LiDXo/JatPipkmCgXiiL/IW9LEd5?=
 =?us-ascii?Q?pYlfDW+a54VK945FkD6ryXfhj4wDB05U5s4cSVdur3UA4CRJxbTv2+Gzq5xp?=
 =?us-ascii?Q?xwnCcAiCJnyKpqCFLhR787VR0a+jfNsKPZX6jgTZj+m684sKVg+gJjj3q7Mv?=
 =?us-ascii?Q?ZfnUNSrlyYF6V3mauYosCMtpmXbeOHFZLInGze3KhCCR0hHCrienrG2uf7TL?=
 =?us-ascii?Q?U6p94g0ufx8MKmTAn2omrhTN6WHQ0zW+8pif1Pfg4oQbFbCjeIAkIYjExdW7?=
 =?us-ascii?Q?898JGcry9KFh8xwy4xmLgJssAK+eqptZJdTFtuUqdUtb1pVU3moOVgScyfTb?=
 =?us-ascii?Q?ykDRdFCbEK7LiynRKzzLZnhVLTJeRWZTnGNMtgoQ4pmvsZSoJv7DHvUjh9d8?=
 =?us-ascii?Q?63DYluzrg8YCuoIGy8MoHh0/elYmIxYVr2OK45jShwg4kem1gOh4dKJEw9a6?=
 =?us-ascii?Q?ZJZJDG4gR4ibJ793JlEtwLR59gsa5Cpe4V5OdBAR7njWgj/SRH2v+/P1xdCY?=
 =?us-ascii?Q?Ye/3vqDeVDBDPDPUNbb44LDOXs54RU/zS75ruVXVepGeyLBatwZXS81KtMgg?=
 =?us-ascii?Q?wpoleCKMDvKfLVJlIBS53a3B0h2zZYw8sGZcb09wQwpk888R6XcoxdMSWS8a?=
 =?us-ascii?Q?KlMpuWHARewgV4NZPvITK34cl8B8qkF7ueRQdXEDsVZtIb5MxPmIZPT3uXbr?=
 =?us-ascii?Q?WnuQfq3GHjUvpUNrHzZ7AJqu9ZPkR9oT2GTphAB+X7LDEQfnw8gSi3uFVPol?=
 =?us-ascii?Q?XFChqhYHhmoCwo3rxNdfBXHHvxo5FtHSWfsRfohqe495Wsikcd8avnfAHr/s?=
 =?us-ascii?Q?MChBrP0vo8Wfk1ZEsyOqvVUOKW6q301LhVS+BBUIVCR/CrPAnQ4qVk7+iVuE?=
 =?us-ascii?Q?GZk57VKIDUTObzQNESrXq67CJdtGYmVMqtdhi4y93FV4eyEJhyKUqH4vOfnP?=
 =?us-ascii?Q?Y8C/X/y7Yv8/soIlM3/s9qgCgn1WbiQ5s/SxxsbKDbBIsHwzs5K/fKgr31ue?=
 =?us-ascii?Q?SXBdU6vbKqJa5cb2amiMTjUTaod5i8hz8IB3K48WkOcDfEXsTDmm5a15dWRk?=
 =?us-ascii?Q?TnjsX/sIFVzkXMrHT8lL5jYfRDVaLt3NtATbJWRcslig4TVS/qb1jiSgB7EV?=
 =?us-ascii?Q?DIVn1EJXwCP9DR4uymqXEw3q/+gTqMvpiB8UORlRYXaQxX0aWxInVMJYGnAU?=
 =?us-ascii?Q?PMAAC5YrwmD1uQnM2DZCVYJokzw8KalukCGHcV/QRBvQlDJX5y8KajVkw9TA?=
 =?us-ascii?Q?9u7yfLkY5yD42aUQxvxMsbBKomQ4Mry6w50vDB2GacXB70AFOpUFsEbUTZhf?=
 =?us-ascii?Q?Fffk6IXVdU0tPE9VOIiG0oz16srvf5sXMKns7Qgc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3bfe6a-7a6d-4eba-cf04-08dda79605b2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 20:41:34.1499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQeCxPl00uCgmpo/7BSHdEDuaa1PdFsZ96FUgEJ6+aKhHl1ojBzu0sba+afNU+Ky
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859

No driver uses it now, remove the core code.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 7 -------
 include/linux/iommu.h | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index a4b606c591da66..060ebe330ee163 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2002,13 +2002,6 @@ static void iommu_domain_init(struct iommu_domain *domain, unsigned int type,
 	domain->owner = ops;
 	if (!domain->ops)
 		domain->ops = ops->default_domain_ops;
-
-	/*
-	 * If not already set, assume all sizes by default; the driver
-	 * may override this later
-	 */
-	if (!domain->pgsize_bitmap)
-		domain->pgsize_bitmap = ops->pgsize_bitmap;
 }
 
 static struct iommu_domain *
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 1567328079945f..7073be1d88415b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -604,7 +604,6 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
  *                It is required to call iommufd_viommu_alloc() helper for
  *                a bundled allocation of the core and the driver structures,
  *                using the given @ictx pointer.
- * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
  * @identity_domain: An always available, always attachable identity
  *                   translation.
@@ -659,7 +658,6 @@ struct iommu_ops {
 		struct iommufd_ctx *ictx, unsigned int viommu_type);
 
 	const struct iommu_domain_ops *default_domain_ops;
-	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *identity_domain;
 	struct iommu_domain *blocked_domain;
-- 
2.43.0


