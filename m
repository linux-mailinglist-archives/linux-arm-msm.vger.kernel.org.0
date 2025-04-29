Return-Path: <linux-arm-msm+bounces-56148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4CDAA0F4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02FCB7AB09A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5234218EBF;
	Tue, 29 Apr 2025 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D/8LNXLU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0501F217736;
	Tue, 29 Apr 2025 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937833; cv=fail; b=I7fVK5x3+46zXXLB1LPymMswR9iVG04pxfWWkbLdnWJOKoraDXy0SeK0xprZI406ZfAaZY0L+R/Ywe3oeZzndzQgpDyfbk1llhawSa/GUPL3LsYgDFGc1Epp2I5RV7YCoALYV4YJujCqAdgyENddTIVqNeeES3M8Ja+AhA/LtWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937833; c=relaxed/simple;
	bh=cZ3DrS4igYz/nFcJUyPqYzJczZN77oYvTq119DwEGLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AfhC05YQFWZpDl1WeVIJ3Bj63j7LNzfVQWlhknCjCFYvQFNK6pf78n8HMgqy9B5WujNiGPTDeTdnZp/pi5MQVUxoHNKtoTNIjuY7OiF8DVS16OI5tAMo59DBGWA1e0FH3sJ8mCKdOLf3yDVuArrGI4146PVPKJWy7VWVUTMHfjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D/8LNXLU; arc=fail smtp.client-ip=40.107.93.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYnAfFkoVKAw0+piNJcADwgMCR2WZ7wrgmxNAEzK4QI+d56qGJT9RZZXUnxlHuHeRu6CCavJDSL6TuTVuXsNlhhLoJHmhDwp3zk6iV3trHDevQvJgBs0pZ/0KyjtAWXcEbcR8bMVAIIRlmqfH+MCEfQsPi8OC96u/MGGG0bpAdASRU+0jAnynD/A185z8QDHL50jdU/T1Syex6CAFu1aALv6vIICovH4I5gS7jdV1NA1E5FA5NHexY1rhXye7IA+RRa8TTpCWXV2mBucDwlmN9Ozgk5BcPvzDIjDoKlJ+19apUTNpt1oWnqFOkPvLvS5Igk5mWwGxeEqIx8/Z5pphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzbLNMxiR1Sh/qc9ezJGttgA61ksVSbNYtlMAABaCiY=;
 b=KoxVLV68Ew3YHddMH7tknTi1OGzJDM/CruRudPQJhQhQT9VVi59F+4p2+KwV/Ra//Shd3QMTMy7ZCv2Tki4mPqnsrduuHtqu8lXC421bOcDQFLdD/77urprl3y3hhpV/1AOaKDuHRh7EGEmxk6/yr7VOyPP5jt8QkWG5/iG3tXQ7mZ0YFaMokepqPigmicwk2c/V0bt6njID6jNHqxL6Sp/dFclh/ebsBJPkcCL/giuWgLCc1+IrreZ1jExcJq4ITr/pdQQN09cBCyaFJ1Nx3ls7weeBD/UP7ufHLRxeB0zh6crPpgj2Y+cRdbXFliuHfk6+EycrFPXARP7de1NfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzbLNMxiR1Sh/qc9ezJGttgA61ksVSbNYtlMAABaCiY=;
 b=D/8LNXLU80vJNRhUudqcJv9oPlahkMsHc1/MOIl6UAeENwIaTxwsyj0/PZq4yXJWl/IZTyNpO+vUb37DF3J4so1fv9lMPC1XUmpsiKJI/A11BPPpij0X9KyF6suf4fPPnZ9xU0VN/3tA+bDzjyCTfQ8p4Hv9dV4xYQ6EHpMKqEIs0FgmY/zV9IbUI1fMDkF3rj5Yg7OcDx2z57Y9Gh29RUTYFwdzNeDxboMmrfvXzQUgRy69tbefB4LfD5KlmLIaxQNn0zwAv3gMEjwYcZ/dpBUa1ON/ZJJketkefeFO1PpJojP1dtwyiTnmmiT5qredzgKa3jQXMQFIZseJxvp3RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 14:43:49 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 14:43:49 +0000
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
Subject: [PATCH 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple drivers
Date: Tue, 29 Apr 2025 11:34:14 -0300
Message-ID: <4-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:408:f5::9) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a215d26-fd65-4eea-db17-08dd872c4037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hDdCK0UZgH8C5u/JwuYYQCdh7ae6CRQeyzIxP+f32zJ/HBZoK7tNN/9z+jLb?=
 =?us-ascii?Q?5hXyWy9pUElFQqj41y6rdFJCAlITZpEh4JjCiC/WDkacFgwgtrEj+pluDgFp?=
 =?us-ascii?Q?wZHXnHTrJvK8qbLOkN5qOPzwwaDlOeyPKl/PYJkA0+9nT8Xp3XQjZ9iEfh7p?=
 =?us-ascii?Q?Txaff79RfibMTwvFExZh7P35cgDJ3d81VZPHflckE1eDakIfE+8z1xBGw7dZ?=
 =?us-ascii?Q?BYtiLSNx1sD/tfIKgZw957MxMY2Sz87dSRuNkqnTC12wvstHVuMIeE7S4m8W?=
 =?us-ascii?Q?1gTkAxHw9fFAVOAT5VWdm1N+3ZzJ1jGOvqykI9IyfmJ0BaRyJNGjPQsw1m1Y?=
 =?us-ascii?Q?cGygzNZeGHFRGZCE15b6BGr/ikm7JwHPcwOPU2/kE10JkBJrL8pOgmDIXR5d?=
 =?us-ascii?Q?Bw/4DpeGiR41p+N0PNMoyDFICmR3Q2g5yD3B6sHp1Kgb6DDnn+QGKKHB/pXx?=
 =?us-ascii?Q?+rTNzTuO8t8X+eMeAqYMdVV1108Y5HqIaAntT4OSx6YaVIEcJwQKr0jft8E7?=
 =?us-ascii?Q?G+EXsDYbZ2pwyKvWVRnOH1n76F6/J4ZQl6wkQsqyGuYLp+l/Sj6kyphXLrdA?=
 =?us-ascii?Q?6djg8km3jVgLcYfPu1/hWN79/aToVKm7ehEEfDDG8Rx1rXiy32YAVK04UTbv?=
 =?us-ascii?Q?CMKQzWs7eH3iIHJsdN2BJXo98wgbs9mtlENgJSa+aSJngoA0oWpFQCawsyVj?=
 =?us-ascii?Q?F9hJTRbexGpgYhKkrHdYcHzUtArbDX1KGJ2Jtw4Wu9NjDTxzNCUuFUejD/cs?=
 =?us-ascii?Q?NLpO6yuuQAZoR6W6ciK5gXWUuEoV2zfUyBIlDjKscuFisYqvsA1RLjCqFG6A?=
 =?us-ascii?Q?dCY8OY4KB9W++Jodh1cgpkjYFGDhz9VnPnLA0Z1SE2vulvxESOw3bHv210aY?=
 =?us-ascii?Q?HQdWcEMgYqTIZ1Obd8E89lhYa5RWSU/Jc/YP9FEZfhJHyuUWg2CmL6vUEmZs?=
 =?us-ascii?Q?B+V5As0xtN7esA+8u7EYaXvh8VlJLvBNoqVR1PGNobAN2EJ0/lTeIJwa2POg?=
 =?us-ascii?Q?WLRG5etV5c3Jth9VVX6Vb6y42H/5mHQ+mSS9kqMh7n8OJ1ZrrbLPs50SLmqS?=
 =?us-ascii?Q?QGez5z3y1IKtXCLPUxQODndqqGLfrfJNcN5rPLLVnRNj3oQdrPkuzwaFrPkZ?=
 =?us-ascii?Q?X0nSmxixTK3HbAwWsxAVhV/QZrgxdFpcP4hsVTQFu8PZadsB+/CJ7udb9yEH?=
 =?us-ascii?Q?tqzIwoNVlY8OWTl+pSYQxEJczfGzinjFLh8N3/Gu2l8y+yLOz1k3OHOXtQV/?=
 =?us-ascii?Q?BiUEc5aJjKOSl+JDEH3YbjKeuFc3bVk8uAeBVI75wdaXSwlKrmSGZreW0062?=
 =?us-ascii?Q?D04fiBnYpnRegnyQ+8VYxqx8QSjH9HKMxeDbaLbeCHfeEwoOro2QqMupREkr?=
 =?us-ascii?Q?E9r4pkwmZhNLUmehnW/Ce/LrmILRtSI9Nn9Zc7IfdCbSM7gpVYaAuKuKX5g/?=
 =?us-ascii?Q?FkW+20Y370JXdjVYH6uFuAqoRSCD7MBiUe8zoWviPCprUaacRhachQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0gBCzSSblJifD4rIyPNKgkKJLdbM2icaW1IeKVzYBc6VYdJEzc8+pi3ykIZb?=
 =?us-ascii?Q?X7k/qMgufrHrZdkSKAVlHJBzNIMsEd5j8pNMLKXvGnJNUEgwHvDzrXwLLbJs?=
 =?us-ascii?Q?pyH4VO5aDl+Zj2JNeG7zPN0LujAeLt5EpdBpaF3gN9THqCNBQ1wrr67FixGK?=
 =?us-ascii?Q?sLB8jVSjLNR/7e4UeyjVcuKPZdZqne4Gwi+PW8fy3z07/2mLa33hFuZN3qti?=
 =?us-ascii?Q?wt21wg52aaEeAMKWXIJXRhdCVRyyofO68TntK+9i4Sa14M1Tgxjs4Fs9ZeO/?=
 =?us-ascii?Q?I1eySJ3SigZ7wEddPkGjbNqO+QEexEBZ59noZwH8GeTxuRBoDGkqR6L0ngiT?=
 =?us-ascii?Q?vpxxKeDl5VIrajveUBvSbJwo+x+3cojISFPun88jU/1Et+rlbuYh+Jpuh06H?=
 =?us-ascii?Q?hZUHGUxU0cLOtUTrt3DMKJ9Ag8mTiunNA8v1lvobOE16ovcfopQssCiS3fH4?=
 =?us-ascii?Q?twebdWTB4lZ1aT5tuBzau27uIShjOKiFRaZTlxpQ9k+27zmWJBA8pwHi1hh7?=
 =?us-ascii?Q?RBQrC1p8XuqHdhJI+ZMyN7lffwcr5wVA9Y8aXVK0ShhC6/CrhYjWPymp5vcy?=
 =?us-ascii?Q?UTMf1bVBYNTwwwS1g9g2uOooQf3og1Zz+GszflwC99LY3U/ApgW6PsY4s9Ip?=
 =?us-ascii?Q?Zi5nRqiT27h1wxm8xGMP44RTHDszRHa9Slq24kcm6nO+j/Zf8ZXAFqv8OE6G?=
 =?us-ascii?Q?hkBXx2BQJHirjdYzNfayqjojZHHKpJHW8P7pAwNvefxC6wJkR0MzB6XM/mk2?=
 =?us-ascii?Q?AfEr05xCPMg4oDDxEcjIkAhfQEaXN3Z5X/xdiqLN/P2f0+Hgu7/oru+ARpTf?=
 =?us-ascii?Q?dVY3hO7vBUwP0ZDDBagQDPGCblAYwmWsthNiYkl+NjhQb9l8r1oKDtqJf5KO?=
 =?us-ascii?Q?6iyIwcwnmolNH7BqOVM4TtQlQ4tcbmYJP+EmNZ/869c6XSnEF0y8pWE9axer?=
 =?us-ascii?Q?f4wbJgc9f8SDvbgbLkdJVVkMeK772pOjK0DwesngSLlyazj/5v1pai5l40te?=
 =?us-ascii?Q?s/i1wLSXy8d/NTblFxwPXUCbMEhVTdc2cF189Z6U058PCIHXQz78xNHtnp+q?=
 =?us-ascii?Q?2TDnz00Xa/6k2T1319AF8d9igrQLSQAsHISffA2S7EaAZ3f4zKp4DL9N8ZWQ?=
 =?us-ascii?Q?PFxILWHsmY12iasjClI+GmGkcqwnFstJPlBP9QlSuBGgcRlt+BHmqAX9OUQP?=
 =?us-ascii?Q?hY1HUqJphNHWdTvuB42wa3uI8yJ0gd+MAx4YztrA9cgixbgqRVIfYjYHZTM1?=
 =?us-ascii?Q?YF9aOV1bQ5G8z/FTo8XJ0OY8wVGlDI5PptiewlS2PzCO5k4rAEs5i3SjsfDR?=
 =?us-ascii?Q?e9H+kq0bf/ua8yezbxpSvZz3GTBRCUxSgJ/WbXvbrxlqB4CmqHXvs7a+6X4p?=
 =?us-ascii?Q?EEVfcmPg0N3USDxjjVmD8bf9oR9Z+qidzKUYLswGxBqkvj7mGzWbhrRF/JTo?=
 =?us-ascii?Q?AsXEFbAWgnZoOUllH5OdQDJnQQAWrz0eyJEJj1SLDHQVJu5yJrSoVKY9jBtJ?=
 =?us-ascii?Q?K7UuerRn5QiJSKtC+kUtTA+z+x0dzQS2Kcd3+cAoKAFRb6KNdLipaAy3mKWb?=
 =?us-ascii?Q?sOkvKkUOgD2xeMauJlUsQ3urZI3wGJ1D6K6VdyWd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a215d26-fd65-4eea-db17-08dd872c4037
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:43:48.9211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQz94GKb27oMNlOGoPOl4BQqaztG2D3UMh6eJZdHeXuMll8zc3jEPLS4EG8nvh1c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726

These drivers just have a constant value for their page size, move it
into their domain_alloc_paging function before setting up the geometry.

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


