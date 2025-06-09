Return-Path: <linux-arm-msm+bounces-60683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E99AD27DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6F911635E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAA9221FA6;
	Mon,  9 Jun 2025 20:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uPmq1HkF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44B221DB0;
	Mon,  9 Jun 2025 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501700; cv=fail; b=GTDQkecwP+8PRnwZM/xodlKjFpb4xwziQXaoWpuk/5kSHoauvlt9BaIFASfqdccNqZnqct7Y6WHy5HRecVxA4+Kuq2QdrsKGlrABP4Yg0jNrnJC7KStA1AjcHQoDjkO4k8hiU3VS8vHsexDhoZ+10C0bfD0h8MZvO6npISghYkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501700; c=relaxed/simple;
	bh=ux5DAl4srXoYSyR7+oM/GRVqVlzBwWkg0uQbMGlqLqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kraFYmXZEz7DgNv+WFrIpNBT1OjlhoiypwRTTdiYrtIPwZCTMW0jbnfWu6YiMVh8Hvr3x5pte3YKecU4qvGLExAfkcJ3yd4ODTChbtKviurZhEAFoFvFm0C+A/G/cuy+Ghfmkyn8gt8aaQKVP8Y0yjFLBdibqhcmUzPQN1uUAxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uPmq1HkF; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d18NFkf+l8HJHKQ6VagmJInMdi7ZPaZlI24xNfs+Bh2Ice1N58fpr2+XOBjeudjdfNFuSJS6ZEoifxoL5Sz3koAY29rcHjF+cP+EEShSoXkXmEvEif8YSlo6+MPsynZwyCRNP03aG6ZemsSoYpO9ziSlKQNgmlDUk15EcliIRxEsMWBP6GA7fvf5Bb3a8Gus+/6WETL3iOt2U5XEMpA6cud7Stc1DnnfEmfSH4BQ7elu4QgQRsTZmvjvGP2Q38zC39qXCByT5MDohrXOkBmQ6xuYMu+r0nLcCmPW5+ja5FVWYBD7m8IXcmOtcAVhkAk1ds9JcxXoLrQ6w0K1tdX2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aAF8eVgWvDOdefG5JzO987iow/dqwPAOD8beGpCluo=;
 b=NndsotsxpN+eadO8VV5Dz15L1yW1DGAUc99ysLNx1fd1pZ+bNgEDBQ3iqqLobxzgW8MrFRiy38l9JgsNcGulXrhenCc+AP0lVmQ66my5ULNhEA6cdSBacWDABmTNBNsXkjj0J70QvbvVZz0YuWqIG4A6rYtruz+T4mNopBwniGvCYm6MCt+ePS3Eazm5Op4Fkw0WgTAHdLEO8/ipre+71fRI+JAXX7KePyMyYwPDqmHvjO1uPPDDzY8TsgHdI8FMTxjD8z0BRHDE226+HN8c7Htg6/S90PZ6cN0FzVk9QzNUa7BfZdfS2lglduI/QB4CWsnoVBYq+4CQW28pJAwPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aAF8eVgWvDOdefG5JzO987iow/dqwPAOD8beGpCluo=;
 b=uPmq1HkF4UghpSiwW3wA7YuoY7pDkbkPcaF74DyrjMUAWvo9UniiYOCSSRldrnR6cZT2ZMHu+zDjc5qY2VdWKDEMBAyFnoKq99wMRGLeLleOtGzgnmkM/dogzCAoD3/AFXt88aXVdeREbj5wzkxve2RRxs87waIPhsEQrGe/a16n+6mYY992St3V0dNMpZUCaVhV1bnirMgw02CM2eAtp81xeCVtKql6fgU8WW0aJuDRBEUWdXNDWTMe0WvAFCdikzjMTJE/DbJiIZZBXbpOPY9Ux8bVpWxFsiP7en+bIBFVaINsjMq0eyGiSkcK8LLiibXYBE6h6n4gb4SixP45vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH1PPF73CDB1C12.namprd12.prod.outlook.com (2603:10b6:61f:fc00::615) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 9 Jun
 2025 20:41:33 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 20:41:33 +0000
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
Subject: [PATCH v2 1/7] qiommu/arm-smmu-v3: Remove iommu_ops pgsize_bitmap
Date: Mon,  9 Jun 2025 17:41:25 -0300
Message-ID: <1-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH1PPF73CDB1C12:EE_
X-MS-Office365-Filtering-Correlation-Id: de627404-ca4a-4b48-c294-08dda79604be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OYbsaSldyiAeQ5hNXKaNlXZRTAkmBKkr1/nbX2JsrwW26VfLMgMxksHLG7ky?=
 =?us-ascii?Q?QfWFxlpAlH+He6nyrh68oEj2GFmWZY/xeTfso3uZW9+BC8fl4nh8138KdNvZ?=
 =?us-ascii?Q?mBlBkuyXoFvSg6XiWTooJoiEHtM24bnC+1kWxwq3wjG4oOYACihv+fOMKuc3?=
 =?us-ascii?Q?gpB2zfo1yoYUhypBa2MdOxK4UAJoAyfA85/mrgoVTQBhGXPiKNOnQgd9PRpA?=
 =?us-ascii?Q?w/Aaq41aV51ixHwV8DrecVeEJ032T6UfwfqVd7nAGb7GEoXxwFpGnujs57Sz?=
 =?us-ascii?Q?uPJ14hSDFchviyJDCQcmX/P38A06XrE22DwDt/DZaUlhSwikGtQh3vDi9210?=
 =?us-ascii?Q?ZNVkPmfOKkCSR2EKXLZPqeeOTU9zFQP6UuVq5ESzJNkPDh8AFlHHbyhuAqbU?=
 =?us-ascii?Q?EFSGpiZP1o2qLHct/R0tku7NBWIuxKX2cYqjDd0o0TjoFQzBut3i8EPy2SXW?=
 =?us-ascii?Q?o5DE7LDsLM2W/pVy0ix67EenfVXs9MkX2EVB5bCwM10nUGwMc4q/ErA+V4jz?=
 =?us-ascii?Q?6SW0kc5OaA+0fFsPcS7KnoTkxtRo9lCiWDySCl6iZysQ91tpv/T4PS+8bmKv?=
 =?us-ascii?Q?nHx0fUpAGQCijutYDsSV9Rf0ocgTJ8mMNaEJ0UDwDwkqxlb/b0eO6fLBA0Qw?=
 =?us-ascii?Q?X6LPn8yfU/riHpKaVsl7k177XiYlzXCyI2RC2v2hdB+ttLQ9Y2qHzTahpWey?=
 =?us-ascii?Q?cKbIomlm3hyxhyfl1bUiTV1c3pDzdmHyxUoougT0qJepRGgU2Ra8J5PO95tz?=
 =?us-ascii?Q?kUCoyhqvnn1r6nSuFVhZZdi1S4XRafzrQ1gakkHCj/2a2uOSOxWpGrDglvDr?=
 =?us-ascii?Q?ZpQS4qI+EwVeYlE2VQFnUkvi1Nk1zeuT3bZ8ANYZotO2mRNd0T5Jrt/889TI?=
 =?us-ascii?Q?CqUVQXjXLBWlKdAfpoljgrLHgbHYMN1v1fokEZHqpJWQ5LOWZ0NvLt67ESty?=
 =?us-ascii?Q?9J1ga3LE/qez36k+qPnesQmezq0yj87rJ/DjqPGkPEPikNmzxCtiojhlG2mP?=
 =?us-ascii?Q?nxgCo+AAWjt8VMVg6/RyAX8p18KqBUPqKuJYbfemiP9DZHWrvA3Up0gzdsob?=
 =?us-ascii?Q?OaUXmPu6w8KqdAaPVo1SSm22pEnve/0qGvhrroiGB1bRYYb2PutTitUfe78H?=
 =?us-ascii?Q?BMS/YLDf7N9B5C1YYZdZ/dWFr5zqWtpKL3eI/AEYLllOyVqdNeyM+/b4vmJd?=
 =?us-ascii?Q?Y18gmc5uhFusWKtH27RcRV1YBZkTG1ctQWO+dnHCobssDdCAJ/wnm0cwLDVB?=
 =?us-ascii?Q?R7z5Q7zJimI2oEyGQ7XqHtdKSmDhkmkmHfFqERh2icb7jMgA2msscg6IZdTv?=
 =?us-ascii?Q?2Tv5UnGe606hxh/aJg1bnk1WtWDkmicWf84l0CjMIMYeZ2ZKl8pMljgs29p0?=
 =?us-ascii?Q?iQNcpMWShCPqJXxfY0P6BBuRNCRrFhUHMnMGc7qAGMlv4Hwb0/IlWJPmFmLu?=
 =?us-ascii?Q?eQq/ac+gAEKK2S7LF72u1lpA7mm+4j+8zgZEknu0INH8QZdEv43nZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zk5JNIQomizkz/aYQIUcLhG39uL9HbNCdbla2sZd5Pypu2KWPMDOGetbEFOB?=
 =?us-ascii?Q?cuBpRJos0X8Kk4oGUEJsLPh/bgvLsOdHnDSv1gV+47nvurJbWsQ8TA/X9sMs?=
 =?us-ascii?Q?I97CNnEqqLRobVpDyNjROSWaEM53WSG677RqUa9weChgxtfFiGx77OL6cRcQ?=
 =?us-ascii?Q?Kqbl6P6AWOUw/fVbPc6qZzbif231DrES4Mw8ltvKD/IzRczbsF7hm9bi4Q/a?=
 =?us-ascii?Q?Lw47DMo9w1Ed7LrS43ao0vmh6HyYvFjLQVZ6YlJC0gdxFI4C4GwNKnJsj0cF?=
 =?us-ascii?Q?/yDSsG42XJveaqyaTJuFlrWbeSinFRUajzT/qyWHhstn3kvO6N72YUKKJUvl?=
 =?us-ascii?Q?RsEYw2NGkaM+x/kypxwRSQvdP/mm6fvd96y9tke3K5n7DbokcjRu7FTopg4+?=
 =?us-ascii?Q?Bhz+3txyZxk+zp9nO7Gy7ZbVpP4H+RldY5p/n2LFlWhRYemgpxJkxqkqmL+g?=
 =?us-ascii?Q?QRcRWUc/nwkxaAQ2iFeeKDkH2nhtNj/C0qwopI0jILAFphw1TeZs4y1qFsfI?=
 =?us-ascii?Q?2puSrp8CqDvPuGyVDX6gEvdjbuStniK0vJZTZCEV7extAEaLztO2HteQa1U3?=
 =?us-ascii?Q?eJWS4ERgENNT95kV3awZyJY0J1Rw3h/ReXco5Cx4InHEv2jZr0DCnb0254JT?=
 =?us-ascii?Q?gsKJh5Ex+P0CDPC7uZ8Vmbg1AAkQCZUPn7oaUSfvFrsICnfXjbaGmT8uiGMP?=
 =?us-ascii?Q?OjeKS4Dbt/PS4bSdcDlwcLKv88kc1JjwABG7X1U6VDcv8+xXM9exsb1j3HTu?=
 =?us-ascii?Q?Fbid2DN+cxGrRdEJ/yosjSXbt6U8RvhwMtpM1fIXC0Hd5u/A0XKuwOdPhtrQ?=
 =?us-ascii?Q?rk+LjPeDu0vbWZV1OzH21I69QjzfE/iDJPHZeAXWNWFe2MWvAhj+VmqAxSoC?=
 =?us-ascii?Q?idUu/9cFC8RlYbBhWKs+h7/AZefL6h03hh5SJgMtoHzUVe9c9cT0wXcOX1AG?=
 =?us-ascii?Q?Bx9BhHIrbJWVJqllwo5Ned32d36b4bnFwaiiP5rEYf4tPsaIjyV5rAihbCOl?=
 =?us-ascii?Q?BBt20SeLWPyOU+QOUYB/KaVMXnXzuc07jKK4Rdb7AYL9u8+9C2cvHaEfLmJB?=
 =?us-ascii?Q?GlXWkO69eh3duuqZf8iCvFF9ZYfT1wNDhyiKJQQUbkBKi8WEvdFPgrgyY9Be?=
 =?us-ascii?Q?TDAPN/yO4yCpOj90j4ozlaZHLYGDNEydNO37LLv7zq/QaI+Op5iZXcvG0bCc?=
 =?us-ascii?Q?ZVgwsoDpcbolIuAsdZ+v+h1df/jtyjQskCy1rKM8xgSWpiMyOKSKFLF4XvPK?=
 =?us-ascii?Q?bw/6Z+9hAfPbwo/QMbpnvlOCo6n6cryi2mnCuL55t4vuZ8xulXvmCL8TCULJ?=
 =?us-ascii?Q?mRrkEmUKiGG3B8xMEzBJNM9/KtETnkLRbiX0i7LZhRIC2sgZmoiNiHnh5DHs?=
 =?us-ascii?Q?w1J4Qib+uYDa1nXeYE+v6t8WoHQq+E4sDeXBgbT6t+CFUmO+DsH6Er0A5L7Q?=
 =?us-ascii?Q?bhCSH1Ub23+XOVW3N1tz91l449FKuy/1V55nfaI3+eOAXYT0Cs5jdWzwy0/j?=
 =?us-ascii?Q?CAhd4jWIIqUzFadQKe1HhERwdEgNNC0bG+QQ3whWQNeYRqUhrZ+gg2h9HS0N?=
 =?us-ascii?Q?xed5DgtsFr/c++oqcNkmx3kcskVgyW6mNgI45ZR8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de627404-ca4a-4b48-c294-08dda79604be
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 20:41:32.5894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIZ0FV9VZfsKAo/zHHUPLz/ETcKKXA0FyZZiUlbvs01VzcL7ka1nQmbxCDt0+Ha1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF73CDB1C12

The driver never reads this value, arm_smmu_domain_finalise() always sets
domain.pgsize_bitmap to pgtbl_cfg, which comes from the per-smmu
calculated value.

Remove the ops version entirely, the related dead code and make
arm_smmu_ops const.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 10cc6dc26b7b7c..351fe2516b694e 100644
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


