Return-Path: <linux-arm-msm+bounces-56140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5B9AA0EF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D41893BBB3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E83217712;
	Tue, 29 Apr 2025 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NHl3Vqyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D5E204C07;
	Tue, 29 Apr 2025 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937269; cv=fail; b=UUaFS7qpoPBVzIp43wbWWDJF7SGgVdfvbVjRLHurq9icQMJyGiWH7P7suySbjtS2ZYSTHSyM9ItnkPUNylY5ATrASJ8wkbtjAlEapemZRyWZjfiT3vDV256O5ratcU9QqdmYaNvSe1VQs01NX+W2WW1we+y8p9L8z/HDcfqlaxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937269; c=relaxed/simple;
	bh=bUrKHVR/eNGkFyK/NQJ0v64fIrdHlJkOpQ/dg5FcqgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ckoJN8/NIX6Rfu1P+UP9adVtYzAOEWsgIvTBQxoawgp8+kKMyqmffPWV6/f79KHg2NO/DaCQqKcZLhOP/McB69GMiXjywnYXWR9V/ktiZOPtf+Hk4/t8bWFXJpdshR8EUH51zycbgwLAXkcCQ81d5Rx70hnatfIo0KVMi81FyPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NHl3Vqyd; arc=fail smtp.client-ip=40.107.100.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSJ2C3jP8ziXosodvGeIvtc2OvasjbZB49zTnR1MWBHROqZtb2gev/QW97jV6RnwlOOJmJMoq3uu58QUh+gUEH3qn8GjcFFYtD/nfbAGgIcaIP1XRkY0tMPTYbthZd5ENHDe6LuQxEY6JRrWLeFiEERwxMZThtzJEnqrVUmNDK8OUj3NaVTwi2N0xIlBsvA3HKQZF7HO2MTL9J6yXUtLx8p/ZOcNPRuJV5taWeuwofkMiirxXUKUI6q0dpnKTPBzdJjhMlTu/QnbaXSvv1+woq8S2mJvyyjo4Ac87MlocV0pj1ulRVqeJjckTQ6oYUAZ1wl5qYTRl0B0yxOK/ySeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fco6If506JVVl/CwS40j9p/UWZVx4RSzMC6sZOCuvSU=;
 b=KVwnD+UsP/JTFlgj40rxwtwT0ovaE6HiDqDoSZZOcaBTYC8nJ1MNIgw+HIHH+XRnlfU5d2It5vmJFSxj+UdodprdRYshsbLVIcCol+7huzkDJfSS+75LPE7kRHJqIR3pwc7z0D2w2NboSyKsGKLCsPk+QsvFOp5QK5nMVd35YE9MgEGVw3yKfyi7W6Vv5gFIFrbTU8pVRdIPk7Qrhuyz4tLLSEPZE6dE5uH1oGDbYKMVv2H20j9x3AudHa/amXhbX2dX7NA+96BSfN+eSI5er3T8IzN7xjpcgIJzufB+3IH1T9HbEYlocH/wXqmIBxJMZ8/aZsZPgQ8Zts9UQ7NoyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fco6If506JVVl/CwS40j9p/UWZVx4RSzMC6sZOCuvSU=;
 b=NHl3Vqyd/gcXtWfH9TuDKLyWwuK8WM/moPmaXN79nsElBUs3m+yOVWo4c0AD9N2ziM0FdMRryxsdBiyDB6RigHDY/t9j1bQqtOfJY+bpbTCgFVMM/tD3DG/1KfEu3WyVRJLC7rVB6nOKUUWHUxcplDdTHBmvHW3H0dkk2r8Jd1DxM0wTpXbZTQz0YAMIkYlqoW1ezmBpoZlZzs/XImIlkfIRU1ZWOH9IRp0RJC1C8l11MefKt+w0KRbv+kR0bOxn942floLT1FWKCOBonEJezPnqnMI5m8PAoXAPBnRaqB9lSdwvlxHIBPQycpDQaVecUS8PjGWp8HPkI0qvjU3sYA==
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
Subject: [PATCH 7/7] iommu: Remove ops->pgsize_bitmap
Date: Tue, 29 Apr 2025 11:34:17 -0300
Message-ID: <7-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:208:52f::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: eec11c9f-d130-4cb5-f3db-08dd872aee0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yLtK6yd8a83GlQBCtYa3e7MH1tOm7y5cTHrsopM0EDfJCVVo+dOa6PM6ZUTh?=
 =?us-ascii?Q?oNxLWtor1aSm7TwdGu0lhitA1ODYRd1gEe65slbmdk8tw8o/5jWXXqTYC4QT?=
 =?us-ascii?Q?3SKNbxSLGmFUjnyosNFcv61hKPQAPFO0/ejjQ9jqu+LMK9ggoHCmy561F4Wd?=
 =?us-ascii?Q?NI42IoBee1BwOSR+GcP96U/gWTPREmd2UdwBsEmF/zFMWy3lLKOdHKRF9tUq?=
 =?us-ascii?Q?xDce9ecf0FVbB3Isnjgfni6ZW9e8cmqulOF2ugAAlpMM5zcxPccu3CncaLz9?=
 =?us-ascii?Q?kS6r7+Jm2IxuaPKMwBYDEfgD+/91PFiXJjavG5L1YfHgbXXolRWwOTsjJ9xG?=
 =?us-ascii?Q?66cyGNbZzhAVVQ23XzVYq3XMt/mSlaobtz8ZwStN50z/EPM8dONGPk8p6qyn?=
 =?us-ascii?Q?Pbwl9ZprtvVqcCk6ys5jKJqUFoiyBSw4Kt+GccRjeEnZZG+4T7bCCerXyFlg?=
 =?us-ascii?Q?RuWV5ASv3KLDvx8n57rg1p5m+zzPmSXilR/iwnaDcpoS3KKeCGM91NQzjB3t?=
 =?us-ascii?Q?S0/ZPbqRNPZp6R4jZXqYRnlhSrW1eVW7re4GzpkV+lZ7GN/u7xorLkH3Ni5v?=
 =?us-ascii?Q?UdZwjDpDUnVaaOkC+8Yedyp8VueEshdHOetxtKI8gVuUOi1ZQfkX3ctW6XJk?=
 =?us-ascii?Q?PD7WubNK7l7G4tpYHLlxEozt4y1K2cW47Y9KhwBBu8BA9E3Kue8aamt/q3bM?=
 =?us-ascii?Q?2/KVzwNyXRx5UrRxX76Rti/O3j/CV0bxjLq4PErQUGSzmtEKqA2Y0+Nuclnj?=
 =?us-ascii?Q?opgGCMkgdznOLRK0AyNnWyV34GRl+jr41xW6+ieFbE/DKPmS9VkFu82TDepo?=
 =?us-ascii?Q?2XDRv0al2yzhQuy6HA5vLsMmKSfHQi0sCazIYG8PpB5dLhbeXmFpmUXacXGF?=
 =?us-ascii?Q?8v2oLA/fVxjhddSEa4QbwkURn8prizrJHy30qkZHjRaqFu8KY0gHMsK1L24e?=
 =?us-ascii?Q?iOR6Og5r7Uip5UbDFhPM8EfJpxKggQAPNXZXIF7h/k7k9biw36TQJTYZW6kO?=
 =?us-ascii?Q?tmmoS7dSkET9LSCJmMFJQFxCupP7yDIJWSJaS3HwmabS9IJ2oFSjihj/V1tD?=
 =?us-ascii?Q?meZ8KDx0ZitNvgqNLq0HHQWnMOX0IP/2MAV8vjW9FU8il1kQ/cEGY4yA2Q5Q?=
 =?us-ascii?Q?wz93ihNC5bzOhNEhdIqBe7tYijw/idDx9JsYTDG+m/W3cGojiXYhwF6EGtB3?=
 =?us-ascii?Q?wCxm0Fe1RAaEogISnv2NVy56SOhT9RDWs8z6+Z3VruYfz2TH7AwueP/vs5Bd?=
 =?us-ascii?Q?xDWIVARZ/dkU1rylwpdjDotVgowmtwR7SHzrLK3FBMSKsZ5Fx1niyuXUfA7c?=
 =?us-ascii?Q?Oq4jadFyneujI7rliM/Q1GBmmT4yVPMlNe012fyqJCcnIekyl1XEjDK5G4/C?=
 =?us-ascii?Q?hojSh69zqp9NZfXCcPZBTsCbs4U5m3H78L5qEhRLoFihSqmxCWbl8pw9r1Fd?=
 =?us-ascii?Q?EzoE0YkjPQRJq2A7xchIiJ7ZW0Mw5bmAAvJ2uZQNCWEZuTFqB0Z1qQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jEkZhI4I1BPSVn1MYmGIeMv0bCD7tzNPKe4ILut9N63fKfeK/8JMGYE6zf73?=
 =?us-ascii?Q?q5lEhCVBpps2Dj0TBbOhsevYFu7DsVerNNnlohNJWhzJrDCDfTq8aqBkcY6j?=
 =?us-ascii?Q?4gxMG4/XkQtNTHbVJxHI6hNOawgbfITDcYKO9ZD4Y2XsagPl6hq3NYNvBrZu?=
 =?us-ascii?Q?MTQFI0SipZMto7auhSagUpjELIC42WIjNVPkEIPS/KI5r4ID/r92DSn3Bdfh?=
 =?us-ascii?Q?g90sLEooNdpYGi8SbCW7L/AsaZQ4EIn5/WKwChjWiXJqYtIHfk4qnzc9tt8G?=
 =?us-ascii?Q?2Dpr928W5R8rDqKIaBl59dDF3mK98hulf2ZxGTh3xyDTVLQB8f6ZPFj9Erd/?=
 =?us-ascii?Q?pWAViFXnGkla4vTmJrDeTAGAjJPFq+C+DYTA2OKIt+0il7KACgcc47mEWgSm?=
 =?us-ascii?Q?BjgXqp69EUf3nnkUwBSreU4tSv1TN4VbKZuacYDp8uSnlej4Q6kJg8EeAYL2?=
 =?us-ascii?Q?9AWqG8thdX8wXvQGwKaOt07mo5JiH3BFEV3uQmWqpu3N4orP9ebP654dVejF?=
 =?us-ascii?Q?CriC4QhyDN05009zmDclyq345KB7+Q/kPmfZgs5mWmdZbmoLLEwLRc1abao8?=
 =?us-ascii?Q?8Gxp/DFLzFMrlDHtic+xyf27G80rxdhsARDAfHxRYh3VX9Y9Cq0aWeizsgg+?=
 =?us-ascii?Q?KxK78Lpte79x/ByqHtDAgV5v+Tt45BKdfvlexjqcDC7PYcA304Sno7ND/FuW?=
 =?us-ascii?Q?NLfeQ5+KBJujtyi0YQEey+et0mjBUl0YB3ouz9ZrIKKY7M46OI0FQHa/ii+P?=
 =?us-ascii?Q?vStG1cVkPNT+DrHuXYbv++mm+uDOZqkKmIPZSeFOPpBIZ1gi/dFHbdXZzwgL?=
 =?us-ascii?Q?MPnbmvrfxsHRDXP3yKnksNFhuvvG+zYe7ws6oEwmHqPmIxqx+CJIQe+zf3Ey?=
 =?us-ascii?Q?QyqQjCJB9J7mRX2H9Djp3cDqe9UECDvRK7Yn1u9RPayW6TgSuIjXaV/BBGQz?=
 =?us-ascii?Q?ASchSwSnalkIutOWseaqeXTjMe9+jx13JU3fQD6ehilUFudSsPlqtoMaGiCk?=
 =?us-ascii?Q?7l/cx37IHAfrPC+A9frVHtItKo0ZELBYm//YOb65ZT0qvb1hAxJVrPCOnL/o?=
 =?us-ascii?Q?momkBMdDDMEoWoR6o5KOGA2gW++GRR3P+0iIVo9orHe0a6aGwjPEq4XTSJ8H?=
 =?us-ascii?Q?/Y0+RWCntqb8k86Ty783NrBbZV9EjGjiS+m76yEZ2VxQwCqtJ1vE1G6yEvdC?=
 =?us-ascii?Q?IzggSHPDh3Pi8f1yzk/b4a9/RgTPqNo8LVZcovcI/eytuBh3laihhxK/+4fZ?=
 =?us-ascii?Q?oguruiLH0ge7C+hW++MPt8YsYThpUrKVUZmEsnxszdvmA5MyIu8v3NjHC0Y/?=
 =?us-ascii?Q?W6aEylbnijaIcWywqEBroDi9kgBIKq5wxK0HXJKGxH3NNY93+qZ+vmi/7X8N?=
 =?us-ascii?Q?z9f1CUELAokN2Dh26Imnllnhag51e5AqkxgXlamjez6pzQJ904H0GU9VB2a8?=
 =?us-ascii?Q?ALPTTJr8qwpi4wSw4idUeQB4t4e21QiRC8XHRttx4emPtYYIHSvTwt19h0Ax?=
 =?us-ascii?Q?1rIf+pezPccoL0DfHL4SwojyQrKUonDTUgod/Ov62StinblNpTErvhS48Kly?=
 =?us-ascii?Q?BNvFLpQ9djnzFla7ZtwnXMcSWbf0PIha/wfOy6/j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec11c9f-d130-4cb5-f3db-08dd872aee0b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:34:23.0453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3BPbtN9k4K1Wmh18Oz+QiubVEXRNjEyT/ZCgkr4koIfmVH50HpHwaDza9/Aqff7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523

No driver uses it now, remove the core code.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 7 -------
 include/linux/iommu.h | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 900fb782c3a6a1..db23093c9fa856 100644
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
index 1785caee597778..1c2ddf62a672e2 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -606,7 +606,6 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
  *                It is required to call iommufd_viommu_alloc() helper for
  *                a bundled allocation of the core and the driver structures,
  *                using the given @ictx pointer.
- * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
  * @identity_domain: An always available, always attachable identity
  *                   translation.
@@ -661,7 +660,6 @@ struct iommu_ops {
 		struct iommufd_ctx *ictx, unsigned int viommu_type);
 
 	const struct iommu_domain_ops *default_domain_ops;
-	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *identity_domain;
 	struct iommu_domain *blocked_domain;
-- 
2.43.0


