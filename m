Return-Path: <linux-arm-msm+bounces-80811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91940C41585
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 19:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43BDB3ACCF2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 18:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C9A33B6DE;
	Fri,  7 Nov 2025 18:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WQL2pUBs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010070.outbound.protection.outlook.com [52.101.193.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6B92405F8;
	Fri,  7 Nov 2025 18:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762541655; cv=fail; b=nc4XinzM7xrJzWIw1CD4WwBBsHUsWB9GVdx59qvsCLSR2PBEObM5Z81P1dGaAEAd8/xklNw3982kaq7rW+3kt9bYeD2Y8iSa3GrIIqIr+hdahTwJ/PJvvrkAXgyTx8EPOwFwhw+djRBiMYc0SR9oDJMMCrCiQcrah8yrS0M2ZTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762541655; c=relaxed/simple;
	bh=LksJntOP9cR4pyQxwb1JEoyn5cCeURVs7Sm+qETfKdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XA2I+axX/QSly1JCfCe4ick2riMnwdYt8vCCZiBMIGBpk/FugrG+zJI6DKZuj8MWBn4hSHyADL+7B8Cz+wYd4+OzoBHR9qaHxtmufLzXPG6GdsxkZgkqNNVuStlYK+aFl9M2vPUUuTXaLKQ4q56Da2jECA76XUb5ZM/SRLybEKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WQL2pUBs; arc=fail smtp.client-ip=52.101.193.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2N3WH3Q0s2xy0fx+Kz2QAI4tgteTrLMqdENhBnAFsbiWAq9197EjxSwCevXpbiQS8Bhyzq8EsJaYoGDAJ8pNPmJ2eP1AUOBsVy5Z8ePqlqogjRDAnXxxh0Gk4UsB6ngU00f9XvegXmDIwCvOD4C2460CQG+cnq/rnmwTGzQsQ4EPOmLeNVn++5O5HAKa937iwFUA93O70icFOjS9w0r4NgT2bdMXRhbkxfpmCaITVLtojuhVZYF0MvxyXI6zd9/s7MsNyH4rdPYOHrnxN0XPCnNu3dfxpyAHNvhOHPihWJDxhLUxMv5dUpIx8HJeWYLk1Z5LZaL8W8SsKSN7sYazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/dh4Pj1aNdIFYDPt+HIvviv3QRuW9QN0KOksoJbBj0=;
 b=e4ZiMs+OpcpZfgqaGXQf3efyuVftC9yTxEbvIJpmy2A7w0Lj10lMOgMRuCNXLa1M3KXWVMK51TixW9CAnqlp80ttfXc4V1v9SjxXBbO8EfJFj76uHix3YC4ihfir4/ukgZ19Q1tRX1XsyD8/8M5Fb7hkIyTa8237e/QWHBiu77hIzs0hatbIFg4O2RuVbMS0BN9npLwBVP5hQWzCF1QrC+H+yEUUGgxTFyFc2AFyPbxQDubW9o9UcVnrryBgzVvp+ESGTshg5Hna4np5kZHBASvh9xjLHMnO5ABe9o1AH1MySiaNNGj/V0XxCInaYXiW7bN5eNjLWVfdFwNz63p85Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/dh4Pj1aNdIFYDPt+HIvviv3QRuW9QN0KOksoJbBj0=;
 b=WQL2pUBsLkpov3w1ovfs2JP0WCMRwnJzTu7cG3VGqBZmjFz0IYjl1DPeOp/prNjJTeYqmQ4wF6QqzW3jtuM6MtQixwEPo8D4C8xk7CUyfDU3FRmsmdl0wEJGvIsR12Y3KfzlUEWrx55Dt+oBx3WR4WJ5YzFKB7RZaDfebGhg5oH6lZd+EzYZWtWb35NkId5X4JHFBVcCHt0ZfQr10w/EvyhwBpSde9WVk7QPbaIsJuNRtStclFhE5rCIKUan5DL3ixZZdL1IzEDTg+SPIs3LpKCq/qkC4Qfs+I7UHnZZnTjvf4SUmEnejJDs+BPeRvkeHTR+b/qK8XmoiympC2nRkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by DS4PR12MB9819.namprd12.prod.outlook.com (2603:10b6:8:2a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 18:54:11 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 18:54:11 +0000
Date: Fri, 7 Nov 2025 14:54:09 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"yong.wu@mediatek.com" <yong.wu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"tjeznach@rivosinc.com" <tjeznach@rivosinc.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"schnelle@linux.ibm.com" <schnelle@linux.ibm.com>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"wens@csie.org" <wens@csie.org>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	"samuel@sholland.org" <samuel@sholland.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Message-ID: <20251107185409.GA1932966@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
 <BN9PR11MB5276D10BD480FE66881870B08CFBA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aQO//+6/B/WbdK2h@Asurada-Nvidia>
 <20251103185400.GA1537560@nvidia.com>
 <BN9PR11MB527638C0E43E8AA000410B878CC5A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aQuU2dic75VkSyjr@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQuU2dic75VkSyjr@Asurada-Nvidia>
X-ClientProxiedBy: BN9PR03CA0610.namprd03.prod.outlook.com
 (2603:10b6:408:106::15) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|DS4PR12MB9819:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be6ae1a-3d60-41ec-075a-08de1e2f096d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JsmpoF1IZYe5z1K7MbwGUP1Fk6PGBfsRyhSY0Iwv+r5KnCJklCDFcNVihyxh?=
 =?us-ascii?Q?bSh58i+iLI5hmqoq7PszQ360G0awh5yLR2oOXBSctT9mkilrZLgNpJPA4oQg?=
 =?us-ascii?Q?bjD52KZ205MGAxOn38ATqo4sL+atFnQ/vSBGa9BoAvWxQXDusn8ZHnUW/7Kw?=
 =?us-ascii?Q?Ko7skszwn+D6gpI1yLwNeQvbC4QjjFdZBXXFhTKAG4cIKKscGEYJAQKgw/pT?=
 =?us-ascii?Q?ygYUuGoc0KXnTr6qOhJuNRmjI66VU0i9QSUDRpEuD+sBaCFfflxQrbnjxWa3?=
 =?us-ascii?Q?sC3Mgnlrx2w27buUZxADU2wA59fP59CtJL5tv+2TUddff3JN0lUL5wTvDksV?=
 =?us-ascii?Q?CzFuYc15xJhnnlJI3Fdoe5d+0ugOEW8lU4VKOxxtdO+X3c6/7nJgaCU8Or6Z?=
 =?us-ascii?Q?WkDhPAsD14SADSrPAEQ22B+ZBmoLY7J4bL/Bg0Q2g36ePCwWIlB+etsakBqp?=
 =?us-ascii?Q?5XOYJFCmhM+93TjdEma8oB3bZoihqOjrOjcG1AD8uDNBPzUnWH+m9unSSp3X?=
 =?us-ascii?Q?T/kA3O96rgMFsig7aCmeoXYyJNWdvwrZCpoVHb+3NqFtkxpr1/gcV37OVOdF?=
 =?us-ascii?Q?PoyWFS2SAui7o2xEmbaFUXRmAxaTR6w6lXJ8LIXdCE20Db/Tsy3wnpLG8p+o?=
 =?us-ascii?Q?V/6eRArxgDSyvDTs159LNyzAZJ73RueOfWb3gYjF/T89a4jw9qKlGHjTcSmo?=
 =?us-ascii?Q?A62U64gBwIz0CESNehn6XM1tUdIny7DhdWqJiVy1En8I+491vv67SDVxhcgo?=
 =?us-ascii?Q?Qgh83Pq/RvkxxgdbE83B7eyOhVqH0mBTlUN8oU5uublDTXS8VzVTqS/RVGR/?=
 =?us-ascii?Q?R8I7zRHSRKWdC48HWYdyXHlMksd48JS2w68PLGrWJ1yJ7QtlE53TflRdmZbR?=
 =?us-ascii?Q?Viq9c+ErYeMh2y6nNSlWEziAeudJ/ZnDZTJQmqt9pmuwle+/SdfSmcrIF1ds?=
 =?us-ascii?Q?cySCEWlmffu0dCaD+vZ7w/TE4wYVZ/Ap8yHksJNivLXbzTFK8RJVsvIS/wnP?=
 =?us-ascii?Q?UWcqPz0XMYxkeWkpctdhV72k7jaW/NNfu2SDnSZyxt+x7ognoag+9KcvPrWh?=
 =?us-ascii?Q?FLXwtiyj0QeTBNS64Ts4UzgpyTIG40x4B129Swg5QapC2WWXt2nKRv0SaSs7?=
 =?us-ascii?Q?nEOY5UaJYOjAvKoSRqOvGlrTvvwvc1aorHAyUL1bT7Vm1lDuM+lyPtqEOoYo?=
 =?us-ascii?Q?cxH40hq4ad+uvmozdN32U690wDxEPBD47OPzaQwq5WwI/r1/Hv+93l9pST9O?=
 =?us-ascii?Q?mh4cY8ySacmVB3AwiTtZFjrs7m6iRwpDxq5ksDE/xDhiGqrsPaNY5XuG+cFY?=
 =?us-ascii?Q?xWeBC7OhuXtSvuR9NpUTchtmf+sDk2gMYF94PUqnBqwp0GAMAQt713rJCWPj?=
 =?us-ascii?Q?WEs/qAc7SRyYOevBetH9NzvCtpbblIhK5aCksr/ZP7Q1GQq9UwassZLa0GJS?=
 =?us-ascii?Q?PsHaF8W3Yp3ETnVcndeh6D7AZENI97DoEq2j+zfDEtjHDrrPLvVerw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iLFQKnT3JaLPBqvAihvjxWzScgisUOQwxQ/KPE3fMYGw5hRNTtngKS4+PFDH?=
 =?us-ascii?Q?g8ZsV+3Ft/ll77wCZefKfhQ7bj5/lxXi2/qzqn9cX+rdN0ptUUm0xPXnct1B?=
 =?us-ascii?Q?HBm8hdgIz+FaBiJm/nE7Q6lp4Rz+2mD2YlDxGzm7w2UiyvuolFogd7s5hkGS?=
 =?us-ascii?Q?pXRESehyLfccbxqtTwZmUqHeC1S9CjKqeL0pT/qSaNy4QxguVkigiqS7uvSw?=
 =?us-ascii?Q?PqDDzy2FR/baHO+uT1Tua2Q22CczAXWqvGKsHEE3EXbtXrHQFeW7xf4Lb1YE?=
 =?us-ascii?Q?sATiCWA9dkeOkhhtyAsxNSPeqCahptAxMG1/AsRVxLp+escmtQgjHo0dFBeA?=
 =?us-ascii?Q?6wDcmbPqxdkNzlwWloFVSG353pEmbpR34H/YmaSQM4HRj2Sh0od0GIpXYgSp?=
 =?us-ascii?Q?IiH//+W+U0pjkb00bIca8itAEubKplTzZIlXoolasrdcIiWdxrB/beV6T4Uk?=
 =?us-ascii?Q?ylzuSMC3okFLGdV/nipbYxFVZ6j1rLO2VYtQyekCXEfhKV89BslqIXoNp8Ch?=
 =?us-ascii?Q?B474LrZ4fsleDHo8G7txW5cAmRxN9rxygiS9qZqPwdgVvRcrV0zdzeIA0E4f?=
 =?us-ascii?Q?rwN/sZSoMZiLHeW7ctrM7gh45j6YmPJObBE6jV8wuzmNmYZdKmxkY0bG3A7/?=
 =?us-ascii?Q?OTC0xsVpBQU+zafcvoc3weo861sfwE3GN5XqRMLmYyviDmfsbXHq113mSmvY?=
 =?us-ascii?Q?2nxQ1BXIOmeGsaMI40RvU54h070kyf6a7EC38sYpGNR74UO5MqDpUZYqCsxI?=
 =?us-ascii?Q?e0x27JOWO5IxkCJe/T0Nil2xHgPkRoZBE6fBzGGAPEjl9jtT47bVXx0CkjJQ?=
 =?us-ascii?Q?nEEEdPfNFIWN8hvNxsrC4poZCuZmVJSquJO33WSKl68FKYzIIG/UmsozTxc3?=
 =?us-ascii?Q?a3gAanPlNklrQDvowBjeiueo9SCZ2NJBh4o5tZ/uanLOpljrU8Tkne+efHGO?=
 =?us-ascii?Q?zrpJNo4I0Plbih3SUjO+K3Q1PwNoezbCD850GX1RRImyIy/s4O+GxUILfuVW?=
 =?us-ascii?Q?sHQ8mvE2JHKZJFTLQjsHlIe2LvBNTqM8saR/2DEfcZMVxEEvHyL1uui6tpmC?=
 =?us-ascii?Q?ga0C1EXO3c2N5Bxdt8uHGLC8C1I50GZWwvzw2dhovMh1GQegVAABl2huvpCI?=
 =?us-ascii?Q?HBdWhYfOKOIFKH552jnAbhtkvKrnpPWt2VljTwgumh1tnfIEYaBg0sJ03p1G?=
 =?us-ascii?Q?SkTCF7fI5LQDSmG/kTRIVfJebSuLRIL8w7Rx2i1VZI4bkvNPojm5nbgQ3HG+?=
 =?us-ascii?Q?1tndk/P7vjF/X51HxOSdzhCOZY7JxLUHKlXmXTOBGReGIrf0TA82f0R1jsAq?=
 =?us-ascii?Q?i0y30tStNbwj1KU0PRIltiyCGctCo1bRDKAbjoIxM0DKJBXND4POKXgrOWgG?=
 =?us-ascii?Q?oMbE75azpYTumPV8GR/uojuPVZSN4+BZAlkvZZoctC5I4ppncpcLuhyy+Wvn?=
 =?us-ascii?Q?IToUy6AHKcPE9rfH8rqV7DlpOx3efMW1lFh4HrKlsMfUBJNfsbZndwegjz0e?=
 =?us-ascii?Q?BUljScZ49Tv3rz2ctL058c5h1ERGRosmcc++AC4/g1LATUWYPCzDOcl6knOO?=
 =?us-ascii?Q?yvgzFLz6UWMCXr6SP+o=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be6ae1a-3d60-41ec-075a-08de1e2f096d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:54:11.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYgc59X6PYsGk5HDOYFcNkKFzndLuSDwzWyqrKlRAEQdsAWVVbmfC9FCwsUVmtOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9819

On Wed, Nov 05, 2025 at 10:18:01AM -0800, Nicolin Chen wrote:
> On Wed, Nov 05, 2025 at 06:57:31AM +0000, Tian, Kevin wrote:
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Tuesday, November 4, 2025 2:54 AM
> > > 
> > > On Thu, Oct 30, 2025 at 12:43:59PM -0700, Nicolin Chen wrote:
> > > 
> > > > FWIW, I am thinking of another design based on Jason's remarks:
> > > > https://lore.kernel.org/linux-iommu/aQBopHFub8wyQh5C@Asurada-
> > > Nvidia/
> > > >
> > > > So, instead of core initiating the round trip between the blocking
> > > > domain and group->domain, it forwards dev_reset_prepare/done to the
> > > > driver where it does a low-level attachment that wouldn't fail:
> > > >   For SMMUv3, it's an STE update.
> > > >   For intel_iommu, it seems to be the context table update?
> > > 
> > > Kevin, how bad do you think the UAPI issue is if we ignore it?
> > > 
> > 
> > yeah probably better to leave it. I didn't see a clean way and the
> > value didn't justify the complexity.
> > 
> > Regarding to PF reset, it's a devastating operation while the vf user
> > is operating the vf w/o any awareness. there must be certain
> > coordination in userspace. otherwise nobody can recover the
> > registers. Comparing to that, solving the domain attach problem
> > is less important...
> 
> If I capture these correctly, we should go with a -EBUSY version:
>  - Reject concurrent attachments during a device reset
>  - Skip reset for devices having sibling group devices
>  - Allow PF to stop IOMMU, ignoring VFs
> ?
> 
> That sounds pretty much like this v4:
> https://lore.kernel.org/linux-iommu/0f6021b500c74db33af8118210dd7a2b2fd31b3c.1756682135.git.nicolinc@nvidia.com/
> by dropping the SRIOV concern.

It seems like the simplest answer..

I'd ignore the VFs, I think it is already really weird/dangerous to be
resetting the PF while VFs have drivers bound.. Not sure there is
anything we can do to make this work better.

Jason

