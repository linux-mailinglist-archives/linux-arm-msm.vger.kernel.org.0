Return-Path: <linux-arm-msm+bounces-60684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B2CAD27EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63C783A8E92
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C43221FD8;
	Mon,  9 Jun 2025 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j/6yLDD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5651B1DE2A7;
	Mon,  9 Jun 2025 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501701; cv=fail; b=GwmaHCOed41ZZgDrOg4yGm0uD/qVsORm4X+/ei0zMc7KaUbRnTmfnd56k1Bzv8gbm6giVxO0SzCKneQfvTHly/HifLEC8/U5Mx8nZceihKrZZk/MGGgritTf05jF2XKenuB/M5Wn/bI7IvdZOfPNK0fhQTZ7q9lvWK7dl12h+2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501701; c=relaxed/simple;
	bh=EJ/P1pjacmz2fHm9HhGI59uOwiA5UotuZBd61otCjcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UBgB3lO88RfrZrxwRM3v8Nfa9JinZGOtB+dsqJUNaPCIW6GcF2BWGl83w90pexqnTj3EolieDfH4ZVx5Is6kxGCxfK66LU49AfViCk3lQEUg4176vjXjI4iHEXr3MmaPZYXNpxUDxruLreDVSDQ8G5gf0TBALNr2iBbplEgzHv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j/6yLDD+; arc=fail smtp.client-ip=40.107.244.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdBz0XJDsyjEuiHezDFhFB+1WVVlrlUoH8RKz28ePkUhiTxQlYWRuVuRHlLug8q+ZMDquYF+mcPOYZBju2662Ns9VsgBbzioYOIPwo+HIIdXUAAEqB2LjyN2vTnciEC7aSRaa+qB/AZ8Jz4fFCo4e0UVo3yrY/B5IsWm4cXU8nbAt5TzZy58iZNGpvvofVlK0E9zxXOO4MaMV66GCh7OJxlkUrYRhLpylqftnEETYfFBT/9ZIoD2aGN1t0jzsjrsxmaioE/lJTh3VZ0zoPwWoT2MhfDtmOreltIopfWhbrAAyP+A4weHqL2ASSnr34sRMbCW7Soad7551HqNshQsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aB6HlDOrgc3B1y7oLyW0U8SxGZJVVWfJU5dlegWikc0=;
 b=CJ/fwo8EyJapA3Y3C4nQxyqLSFhVT0b0aIt1KMrIxSOZA9BamOjxyoAf0UAtxwrRqHEQIkkaH+9u2638tIEoQqxkJvxSXb/f5E51FENfqphLr9vzM9SUx8v6vMeutJGfJK8Fi+OO+uQXfAMZdDyhd0m06TjsYG09cIVH2SlXr+xAI5BF1+JjJib8BiHtnKfKpHXkvi7KLH9KtBcDVQp/8rzPMlZUgkNrPHqSaLXk/ToWnvnFMOE+a4dfwVn6nPWZzJD9p56mdn9QKSIqYOqiI+QJkc5non8lFNkCLu1o7D5U2uA0tmcNDmArQ5HQekmDXDfgMWT1obuxD+G4GtgeJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aB6HlDOrgc3B1y7oLyW0U8SxGZJVVWfJU5dlegWikc0=;
 b=j/6yLDD+e40bsrJbdO55QygTZoFnLnkDPn2rmGPadvQjcJsMcxb0d7ElVuusdC0VfcXwLwpHa+xAvysszyAgfb8HyXGTCcYmLTFuezsJX5AL6pKzhD/UtdnQ4Hz7bvSFnr/9D2wORt4z/lVBDi33YJHjHWRIlIya+II1gQqXofPDvZs0hmrwMLVmTDTYovwS2q3B/ap3dHqpcpoJdzpxYDFTWJuG4cMEy+h45aPxM4nh2wKJN1hhD0I+dq9v6DuxiB8+j8QE80D20vizriJz7igBe6nbBQNSN3FedCGKt4smiHmy8Qa8LsFCKcaT12NYXpVhZPmuy0qVQ2FMvxEl/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 20:41:36 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 20:41:35 +0000
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
Subject: [PATCH v2 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple drivers
Date: Mon,  9 Jun 2025 17:41:28 -0300
Message-ID: <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::25) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e558cb-4f43-454d-77db-08dda7960558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zc/flyrPNItmhUl8pmoPRt9XF8htocK28JBRu24EC+EhhMFxMc+nGQ+f8qDy?=
 =?us-ascii?Q?cecNqrSOI0MUeHqyMKuLMZyko8BVaZk3cXllN9lzyAq+q3syVjhAm3/6Wqc4?=
 =?us-ascii?Q?8ubugXLYKvpzQYfTCIXH8Jsx29Cdl207M3LYXJ2OVOmX1zZoQgbB3HckPwI1?=
 =?us-ascii?Q?jFlAycfOEC2/2xHMfXYSzElR3H96PEka9j42w/LNIm1yITTI72RDM3g4t1cy?=
 =?us-ascii?Q?IS3qP8E095fjiOsy5qfyGU4YLbYcPiw2pcJMGpxssKjuK5Bfk3kIp2NxpgbU?=
 =?us-ascii?Q?TOLcrut+C/pUjfEB3Ww5GxxhxcZr/L8mjww3GgpV5TDw7Nbztd0JqmNjzPl/?=
 =?us-ascii?Q?qi456yRoEesAlU53m+hRzB1EG+Vk8HdLCNdQRsALIpbo+kF1eW0ro8mzRl5Q?=
 =?us-ascii?Q?xpeXzsxo1Sr0BTswxI4ViPYEKyq/LeMOJZlEQ69W4wASlQAH/9XKUV+VOwk2?=
 =?us-ascii?Q?Iot9s3vJppkWbefPi/1H+WmC9JjWbW0B/WRbmtRcb2nk1Gw7IV7hmMxUTIdQ?=
 =?us-ascii?Q?Lk/78qVXWvig3yAJkhUNy0icrOBPrKLmJBu5X3jNBp5eXlMJylVsSsQ2Rjoj?=
 =?us-ascii?Q?pWSjQOrhOT4rN86NgeOFVETY4MnIEzGNXa41PGmSWg7jwfiE4idORtJYeQKc?=
 =?us-ascii?Q?fVVSigzrJMy24stxVWWuvDV/HMZ7CHUEAtGWqvFoQKdwICT8vnh679Rpc+0K?=
 =?us-ascii?Q?vZAo1EGB8vMq5o9b6RyFrXBbZ70Free3Buz3HfyLKL+AKfCd30ehkhIWQ5iK?=
 =?us-ascii?Q?GB5Or1cp5l5SSNsMqY4txE23QtDG89O6RzeUJJpKVaeZyM6h0XWd3UQhpmCo?=
 =?us-ascii?Q?nito18WZ7kPr8VRm6s2unW7KATiw1liUGAnirBk258zsEgbPeXzSCCsZpTkY?=
 =?us-ascii?Q?RSKcKGDqlO3/gMJ2irePpy/MH/CWgsFnQmfD7RjKP7CEogcbMFQawymbgQlS?=
 =?us-ascii?Q?3nqW5kwKeK3iFa0gCVaCMpVr1qnDCUEYdh6+KAGPMMyQPVFyMEfSYriFhMOr?=
 =?us-ascii?Q?9RU8wKaWnZBr+NC6g3eIV1NDoIGTgrHM8R1fm6qVugSceI6jBl7aBeNtJSO+?=
 =?us-ascii?Q?F8wmntSuJUbq+4500arPYNBcr1LMSCrAGKVhdirXk/Gis0ZS8qshpJPdeTfb?=
 =?us-ascii?Q?bFaf5D2Qg7gNOwg/5IDV8jXe9GIhOyOCVJNggJtyAn3Os9XvDCkdLvcNIXjr?=
 =?us-ascii?Q?CVBi0efS4rCtja1e1DgGxTCrbrExXHoQsD7e/hyAOPPjUCxWutdGk9RXuQGJ?=
 =?us-ascii?Q?g0GpsoZb0mKs/FuWgHK5DVOZoRc5QF9o37R3OJ5O6AAFgsRR7p7e+sKdhMsM?=
 =?us-ascii?Q?fdQ8EkNSkvu0t+ZvteH8zsMP+PBF1ZdPrn7SMJdUFv4qsTIi+D6CllPeuT0Q?=
 =?us-ascii?Q?6L+1rJ8OkuzHLB1k4b+j6RvWrF7pM88C3oBM6JV0VITu+I+oTG+VpT8Lh1WO?=
 =?us-ascii?Q?WIvCwYZkYXZAiNWxMw6Xtf5KQ56Tz0Tb09cnUuJoYEln6Sx7n6BHgg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+/n7vAQsel6c+wgZ711rksNEGHRtK3ZY9Ha2ihnyR2PMO1EqA3HvfYmdc/lY?=
 =?us-ascii?Q?eAjNW7QunZ2wBN5fp2mYwxVdvaWGo0TNGKLWqTPWRZ5mjD741bZ/JbGgI7nK?=
 =?us-ascii?Q?Gv0HVy0fj+fRLSHgue8bdJXHYIYJFPTw8tNDiaU2yArS8xx+zbWbjzuq6JDd?=
 =?us-ascii?Q?tKoUZ1Tk8dgU0IPksSFQHnjFDM21cpUGTgk/vnnmOsS0916IWS8NE0Tdg4CH?=
 =?us-ascii?Q?+UoWQmsCBTD3Ruws9cC5JjEAJR2Fc3Tdu1tAcvVLL4ZLndz7EZ52e7+hUUsb?=
 =?us-ascii?Q?Afv0VpjTDJoow+aG2OGgxDK3IJFLbZN0dh3SSCF6UvzOg4/IzjIupGGzp8Nh?=
 =?us-ascii?Q?KDhTVJJ/I+O+WFofyVulB3jIbkJOgcgubIWXZ5EcLXw26PZnCWKolGAoPZNK?=
 =?us-ascii?Q?b+BoXx59LRZGkBKuYxJwo2dEhRUo2kkW8jQBYYiQEH+7qoleu4LBHvFSu0YG?=
 =?us-ascii?Q?sbwrpa/yquZoE381vJ25DvyLbOOK0rZ2HvHQ+ej0OA7l1fkTVle/aglY5sYK?=
 =?us-ascii?Q?mRFkhDAeLW/TWmHDh7noKVKrJe9fQSl3KsFsCPQGL/2f8Ow9OLogyzkv2mTu?=
 =?us-ascii?Q?RrPm2jJoimI7WkXdkCOWF/t3de0ZkrIGVML8knaBgP87pjsiP0TkK3l1ZJ74?=
 =?us-ascii?Q?A4WuJk4lL1/JMfj2/1sKFpHhuUW4z6I4Q6UxBE77etzsieNsFq8YC1nHbCDn?=
 =?us-ascii?Q?2ZTx2MR5aR418RsyrdoxP2B56Ubd3X/7gG53ivjy+KokQIo1bqQ3A1pioxH6?=
 =?us-ascii?Q?6E7a4vIUM3KOpPO/xcLdueAegiA4Xi5ZmxwEvrdK5E0IEySsMfLJjOhd1LcL?=
 =?us-ascii?Q?/xcRcWlYFBbI4tq+jwcK1M57BFVQPE58jdQ12sx13S0TqcXhsvhayP1gpR9E?=
 =?us-ascii?Q?eoBqRlKVwHG4vThBNCsH3vQfs4V9r56jZDy/BjGNqXjl2I5NjnNVXa4i3E0M?=
 =?us-ascii?Q?V2RyaIXMHBy0vPMl06YZB79XJaI22r9ufa63GdnqmwF/+DGhPWEWqaFzq4xx?=
 =?us-ascii?Q?MeYFlvutyMbET+PdedndDgUnNd6+t+fjJ7pQ2gCIujpw3b9DShedUEgJQnmI?=
 =?us-ascii?Q?UUy5ACqbGEPxp/CFItku01o4tKtLSWzZjq6xfiwlhyfF5x8iQgvSAQ7KQbS9?=
 =?us-ascii?Q?XHi7phUhH3SpSjhRMf4JyHvlYG7tpcnuJA6+NFPgsFTYXB0z1alnP+GvlMe8?=
 =?us-ascii?Q?ukFOkqcH7GjF8p0cDOyn7b/BaSVP1Ewuw4DHAfTk8Vwu0c7LAOsZjU2P8ZBa?=
 =?us-ascii?Q?SBz/KMM98HjyHwsH7yjTKdvidglDrUGYGjc5dVddYs38uM0PL8uCjEQomj42?=
 =?us-ascii?Q?X9tMPlDuj2dhOEh38DDPtdnhODclaqC9jiR57P2Je7eLoCT60B/WbeqjDmSM?=
 =?us-ascii?Q?UPAgHEgx0/XAe+dZ6c+sO4U2NpsGQCMWtwFg1f0WYYk3Q+pNDxjWI2SUZ7w1?=
 =?us-ascii?Q?CrA5rcCA/nRfsTLPf3MxLJa61pjCAmnyNyAJXXz7RfLuLGag4aPe9sdw5NxZ?=
 =?us-ascii?Q?lJVvjnUbVc8t2GZu1YoqhjkupAlHwuJxrnHzQkgi+baIZY89KQeSd5b0zIyv?=
 =?us-ascii?Q?OnvCGurIAP1A1aKRI8oqzxtD1R52J6ukI7aYIc/z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e558cb-4f43-454d-77db-08dda7960558
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 20:41:33.6106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IP59ZYlr7ITv0JbDxOmrJYjO2qzT5ucx3x3563jQpIFnkEO6pBrGr+MCBFYQdFrf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859

These drivers just have a constant value for their page size, move it
into their domain_alloc_paging function before setting up the geometry.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Niklas Schnelle <schnelle@linux.ibm.com> # for s390-iommu.c
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/exynos-iommu.c   | 3 ++-
 drivers/iommu/ipmmu-vmsa.c     | 4 ++--
 drivers/iommu/mtk_iommu_v1.c   | 3 ++-
 drivers/iommu/omap-iommu.c     | 3 ++-
 drivers/iommu/rockchip-iommu.c | 3 ++-
 drivers/iommu/s390-iommu.c     | 2 +-
 drivers/iommu/sprd-iommu.c     | 3 ++-
 drivers/iommu/sun50i-iommu.c   | 3 ++-
 drivers/iommu/tegra-smmu.c     | 3 ++-
 9 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index fcb6a0f7c08275..b62a8f35c3e851 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -925,6 +925,8 @@ static struct iommu_domain *exynos_iommu_domain_alloc_paging(struct device *dev)
 	spin_lock_init(&domain->pgtablelock);
 	INIT_LIST_HEAD(&domain->clients);
 
+	domain->domain.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE;
+
 	domain->domain.geometry.aperture_start = 0;
 	domain->domain.geometry.aperture_end   = ~0UL;
 	domain->domain.geometry.force_aperture = true;
@@ -1477,7 +1479,6 @@ static const struct iommu_ops exynos_iommu_ops = {
 	.device_group = generic_device_group,
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
-	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
 	.of_xlate = exynos_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= exynos_iommu_attach_device,
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 90341b24a81155..ffa892f6571406 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -430,7 +430,7 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
 	 * non-secure mode.
 	 */
 	domain->cfg.quirks = IO_PGTABLE_QUIRK_ARM_NS;
-	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
+	domain->cfg.pgsize_bitmap = domain->io_domain.pgsize_bitmap;
 	domain->cfg.ias = 32;
 	domain->cfg.oas = 40;
 	domain->cfg.tlb = &ipmmu_flush_ops;
@@ -571,6 +571,7 @@ static struct iommu_domain *ipmmu_domain_alloc_paging(struct device *dev)
 		return NULL;
 
 	mutex_init(&domain->mutex);
+	domain->io_domain.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
 
 	return &domain->io_domain;
 }
@@ -882,7 +883,6 @@ static const struct iommu_ops ipmmu_ops = {
 	 */
 	.device_group = IS_ENABLED(CONFIG_ARM) && !IS_ENABLED(CONFIG_IOMMU_DMA)
 			? generic_device_group : generic_single_device_group,
-	.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K,
 	.of_xlate = ipmmu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= ipmmu_attach_device,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 66824982e05fbf..496cfe37243ac2 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -288,6 +288,8 @@ static struct iommu_domain *mtk_iommu_v1_domain_alloc_paging(struct device *dev)
 	if (!dom)
 		return NULL;
 
+	dom->domain.pgsize_bitmap = MT2701_IOMMU_PAGE_SIZE;
+
 	return &dom->domain;
 }
 
@@ -582,7 +584,6 @@ static const struct iommu_ops mtk_iommu_v1_ops = {
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
 	.device_group	= generic_device_group,
-	.pgsize_bitmap	= MT2701_IOMMU_PAGE_SIZE,
 	.owner          = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= mtk_iommu_v1_attach_device,
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 3c62337f43c677..21c218976143ef 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1584,6 +1584,8 @@ static struct iommu_domain *omap_iommu_domain_alloc_paging(struct device *dev)
 
 	spin_lock_init(&omap_domain->lock);
 
+	omap_domain->domain.pgsize_bitmap = OMAP_IOMMU_PGSIZES;
+
 	omap_domain->domain.geometry.aperture_start = 0;
 	omap_domain->domain.geometry.aperture_end   = (1ULL << 32) - 1;
 	omap_domain->domain.geometry.force_aperture = true;
@@ -1735,7 +1737,6 @@ static const struct iommu_ops omap_iommu_ops = {
 	.release_device	= omap_iommu_release_device,
 	.device_group	= generic_single_device_group,
 	.of_xlate	= omap_iommu_of_xlate,
-	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= omap_iommu_attach_dev,
 		.map_pages	= omap_iommu_map,
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 22f74ba33a0e38..f4a5ad096343ab 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1081,6 +1081,8 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 	spin_lock_init(&rk_domain->dt_lock);
 	INIT_LIST_HEAD(&rk_domain->iommus);
 
+	rk_domain->domain.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP;
+
 	rk_domain->domain.geometry.aperture_start = 0;
 	rk_domain->domain.geometry.aperture_end   = DMA_BIT_MASK(32);
 	rk_domain->domain.geometry.force_aperture = true;
@@ -1171,7 +1173,6 @@ static const struct iommu_ops rk_iommu_ops = {
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
 	.device_group = generic_single_device_group,
-	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
 	.of_xlate = rk_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= rk_iommu_attach_device,
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index 433b59f435302b..9c80d61deb2c0b 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -557,6 +557,7 @@ static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
 	}
 	zdev->end_dma = zdev->start_dma + aperture_size - 1;
 
+	s390_domain->domain.pgsize_bitmap = SZ_4K;
 	s390_domain->domain.geometry.force_aperture = true;
 	s390_domain->domain.geometry.aperture_start = 0;
 	s390_domain->domain.geometry.aperture_end = max_tbl_size(s390_domain);
@@ -1158,7 +1159,6 @@ static struct iommu_domain blocking_domain = {
 	.domain_alloc_paging = s390_domain_alloc_paging, \
 	.probe_device = s390_iommu_probe_device, \
 	.device_group = generic_device_group, \
-	.pgsize_bitmap = SZ_4K, \
 	.get_resv_regions = s390_iommu_get_resv_regions, \
 	.default_domain_ops = &(const struct iommu_domain_ops) { \
 		.attach_dev	= s390_iommu_attach_device, \
diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index 941d1f361c8cda..c7ca1d8a0b1530 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -143,6 +143,8 @@ static struct iommu_domain *sprd_iommu_domain_alloc_paging(struct device *dev)
 
 	spin_lock_init(&dom->pgtlock);
 
+	dom->domain.pgsize_bitmap = SPRD_IOMMU_PAGE_SIZE;
+
 	dom->domain.geometry.aperture_start = 0;
 	dom->domain.geometry.aperture_end = SZ_256M - 1;
 	dom->domain.geometry.force_aperture = true;
@@ -410,7 +412,6 @@ static const struct iommu_ops sprd_iommu_ops = {
 	.probe_device	= sprd_iommu_probe_device,
 	.device_group	= generic_single_device_group,
 	.of_xlate	= sprd_iommu_of_xlate,
-	.pgsize_bitmap	= SPRD_IOMMU_PAGE_SIZE,
 	.owner		= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= sprd_iommu_attach_device,
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 76c9620af4bba8..de10b569d9a940 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -697,6 +697,8 @@ sun50i_iommu_domain_alloc_paging(struct device *dev)
 
 	refcount_set(&sun50i_domain->refcnt, 1);
 
+	sun50i_domain->domain.pgsize_bitmap = SZ_4K;
+
 	sun50i_domain->domain.geometry.aperture_start = 0;
 	sun50i_domain->domain.geometry.aperture_end = DMA_BIT_MASK(32);
 	sun50i_domain->domain.geometry.force_aperture = true;
@@ -842,7 +844,6 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops sun50i_iommu_ops = {
 	.identity_domain = &sun50i_iommu_identity_domain,
-	.pgsize_bitmap	= SZ_4K,
 	.device_group	= generic_single_device_group,
 	.domain_alloc_paging = sun50i_iommu_domain_alloc_paging,
 	.of_xlate	= sun50i_iommu_of_xlate,
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 61897d50162dd7..fa0913e9346c71 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -318,6 +318,8 @@ static struct iommu_domain *tegra_smmu_domain_alloc_paging(struct device *dev)
 
 	spin_lock_init(&as->lock);
 
+	as->domain.pgsize_bitmap = SZ_4K;
+
 	/* setup aperture */
 	as->domain.geometry.aperture_start = 0;
 	as->domain.geometry.aperture_end = 0xffffffff;
@@ -1002,7 +1004,6 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.probe_device = tegra_smmu_probe_device,
 	.device_group = tegra_smmu_device_group,
 	.of_xlate = tegra_smmu_of_xlate,
-	.pgsize_bitmap = SZ_4K,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= tegra_smmu_attach_dev,
 		.map_pages	= tegra_smmu_map,
-- 
2.43.0


