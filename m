Return-Path: <linux-arm-msm+bounces-60685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE643AD27E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C807165139
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A382222597;
	Mon,  9 Jun 2025 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Oz0VOL1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634C221FAE;
	Mon,  9 Jun 2025 20:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501702; cv=fail; b=pHCs3U9YWNnO06pNlvJaz2cqm/nshr9ISw3a3Rq5EoCaA7zISqGlzskC/dH7tzRVN1e8XwW6nG2IollEE+pT6q9/XEd9BYtYcLrkRx8ACaNFFLkYtLPLPTjF60czLM54qaFizUky0RN7uHFDzfFWSx1saly71nEFUw9/f3OZdqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501702; c=relaxed/simple;
	bh=iAlyNNWPU8eKvKkbkz8xyXHrBLkvnGrsa9p9jIC4JDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WMEAnqCNOZD1ptDloCGBTZ/S5I6sb6VJHb8S5jw9A8Yp3lpw8RZPRN0OtvzKM4QaYEuOMg7IP3nzE8UdC903lB0HsyDbmWMg9Rd6kbOSEnkFNy8nNC+PefXwHGY3OthT9cE3StqSYpR3/HDSjcUtM79BAA2AeIQck8j1OJzBOuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Oz0VOL1d; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsTIQBM9JtaDWiMup3LuDEY60icJy5iyE3hIRPBsyO1XbbNqU6C4gXcOdhmLEvkkhGJ6rWhMTmdX8Ab/IO1IsxcNCjpMsrX0lBIVMOJIE6KwOgkEBSpMRKp145YweyZDBopUefUgHDzC/VjJixH8I0RVvN/2aOuA/MlII37KsQY8rU82sf1/LP5q56EAUlrWuEF4tqLOeIrmODFBFxDsgNU24nEZayKsY2QPcxynfRtATnfmwMIOGVKLctyPRYM4iwY1PoTDuaJ+HonMJ1o2modXBeQx1FcQImony5QD5et1x0NvXA6ndsRKUdOzH/xipgp4hJRdVj3xj9RTzOpWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMe+Gxj808ErJf1T5Dj7wYclp1cFPpEdw0FwW6J8N1k=;
 b=mYAghBywUE02SqT8sHsfj1wO7Vl0gcM/rCK5gNE70+4CDQT2R+84maZCJluBHgLlN1d3le8NgiNLPYN+epqKMDbzee/0Ys9Q9IOMw/8g+O0wNVdZrUxAeHtpl3AYJ3lfcWD9gDmvih9nZWljY+xOpGCzyL62gYIZqMwxDsRCI77iQCO0bdIJAhC4gyXyxVdbrw+yAMjTZkZzqd8APNqkDqH/2cnhoqaVP2pQfjjfwjd0nRWThDmWT+ysKM7ddAfHAt9mT5tqAa2cYzaorLyjbiYLWUnp+mKbCX7yoniiiLhRygDGTo3TVrHtv4YgfJeD2S+UULvofV1nD8fiABq/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMe+Gxj808ErJf1T5Dj7wYclp1cFPpEdw0FwW6J8N1k=;
 b=Oz0VOL1d1fz2M1PFMpFfQVnqq3hua0F2ssHZSmEfQ/HnbS3aMnkNtsDkLryvF9srWt9AJnTzRFXrBymnOH1ba+nl3AhqtLHK1OCFW9Loj4qfCsDMNPw4zNKLlfrLrBGMpLDgXCEIHFftE8tXdhdtBrgz4/ASp94YZ1jnJ1ehuKDOPbJ+10KrSAJ2WIMU4nUM+c/h00jXdcKtt84eCoJqMXyalvEtSZ/JQn48k408K81ibC1s6aPekR/2mp0pftNfjp9wb/bEsjbRB6WGoTg/tFXS4N8nJHvpLb2gIs8YvaraakJzZkBuGHfQBuvCja1xVxmLZ7SbPbfC7SAyBtrQOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH1PPF73CDB1C12.namprd12.prod.outlook.com (2603:10b6:61f:fc00::615) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 9 Jun
 2025 20:41:34 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 20:41:34 +0000
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
Subject: [PATCH v2 2/7] iommu/arm-smmu: Remove iommu_ops pgsize_bitmap
Date: Mon,  9 Jun 2025 17:41:26 -0300
Message-ID: <2-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4P288CA0034.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::20) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH1PPF73CDB1C12:EE_
X-MS-Office365-Filtering-Correlation-Id: c905372d-ae51-42b7-5821-08dda79604c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e8GFa1tmqwyXLKqispPjLpyx28ccww3X357p87jCfFjuY9Yu3pmdjZt0pCH+?=
 =?us-ascii?Q?62++05PsVaI3N5pDA+vxU+zXBcjKtPAFNINHkZZBew+uJ/6U02zkJA4I6R3V?=
 =?us-ascii?Q?YiAVyOkHqm9q3iqbORGcPxaxXa15DH++Mk5JFbYJWcfx8SQ6O3/3uDvuQb3W?=
 =?us-ascii?Q?/0uRXCfJkwktX8ze+IHyFVNihxybQusf4MJ4UXMsuaCNbTbuaiMUkLiuO1Gu?=
 =?us-ascii?Q?JXjWrZ4Gr81JSi7G+godHd7uymzQ6v4sU5yZ35b+7+PAnlk72vQcw2zm8F9a?=
 =?us-ascii?Q?8m1W4vAU5Eigxcz9H9c86RPO1u4Pv53H6p25iHEz7QVOO2oOJ9nnI0B5avH8?=
 =?us-ascii?Q?kAxrf2DBDXY3kvtleOrz2Vtk3fQlDiGLNziwR2R6eUeu/lxhseuQ+OEeZ7bN?=
 =?us-ascii?Q?L6cepWHCd79zM+YrTckLCu3koLAhGTVw6qD8umgrRax9XiMXFz6Zzusu3NmT?=
 =?us-ascii?Q?mqz2hpjasVpgTUWSo2TJOoH4ui5LZaen89tbC2Y/tF1Me/tDhjan8wkSSyli?=
 =?us-ascii?Q?/D3aZrwVYG7AlyTAFfc8xmW7ND06zQKGwYMvl5wHp+i8zo8TAdyWoP6wPivl?=
 =?us-ascii?Q?NMUsXG/A60pn+gzWkQjg6Zyqy2N+t/K1cuwPPPa205hMKsBN6UPAjhbYL46F?=
 =?us-ascii?Q?oYD/3pC9XNWNaYQgovtg40VvPk8NgwOQ/XYGBvt0huy642SmPgc4EbEhsy9G?=
 =?us-ascii?Q?sMF04Q6Y0repif69SEHmxNY+fyG3S3fgyPqPd6P0jcpNC9Aw3nFhHP1HstZf?=
 =?us-ascii?Q?raDAas6b9hYAOeNOwmFoQ1WuDiM2/ak89vuuMRUIoHD50C4Vq1Zr2d4ZaH40?=
 =?us-ascii?Q?8eJtBmzpCS7E2Jm/1IkRphEjLTbZxYt5toxoXjQDe3QIiiVwYIqrym4TUXIi?=
 =?us-ascii?Q?E1BcIfsJLg5VUeYmJpx0YFsgWWjG2udTfwNX9VNea5bUOEcTnZtIthjn1T69?=
 =?us-ascii?Q?jh5w8OEv52RvaJM5Pq9PTxCye2spVfsUWX8Hrr50C6/z46hjvlNU/9m0aBTr?=
 =?us-ascii?Q?x4LlFC0P537y09Rm3pbwrHHRsGJGj1CUiKsXM+MYCH/zyH5BwdZBxpnxF7Aw?=
 =?us-ascii?Q?Nex6+MxLsUUJbIOseUBAY1TM+CYxgZCfIvU1XPOCx+BV/NsvZ3fvrHHRSZsg?=
 =?us-ascii?Q?fDm3b/3FA/9+rLqs+8JsnHlBr+y71vdqnPO2tWNYPhTNa+5VBS2t9dus773c?=
 =?us-ascii?Q?GXa0Wkx9G3hgBLQQlKXz149Tc7yFcm1YGo3/tgvpqwMirT86KurvJ0/1+/2g?=
 =?us-ascii?Q?8Wi+gB3f4JT0pglLMTiFTw+Jxs8qm9XF6V4ywDURUsZY6vNjcptdVL1ltsIC?=
 =?us-ascii?Q?ECdgm5AXZc0XMf0yX6uQiNa28uKXY6x9DRLFTafEXo2VJfX44cVbu2kYL7sy?=
 =?us-ascii?Q?jUtlI1Pit9V752Nx55LNpPaq4wm9Z0G07b4W1XroPPIwO1BVmIHknCyLp8gE?=
 =?us-ascii?Q?mhbEvT7xXChxObAHQvRfr9TItDu4joEiLlehmja9M+lrnIucrirORA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nfMxtV7bznrcgCsYSm1Von7c/7eYP0REj40tFtFzZRqQyveXUL2e/jToBa5f?=
 =?us-ascii?Q?QaJL083brLdhIGKvElFmCB2TEgmCB2mlxjCdcN9qCVheUOW4eZiKc798MxpE?=
 =?us-ascii?Q?Zyo27e1iWNkXPIq82b7HmhGEm1xqf9y6skG4iJLDq9bO2EaFnKxyXCE7E/MA?=
 =?us-ascii?Q?fBuRmAUvKTXi9s/r1SbIhcik9HmYeIQSfVC0wLEeWjXcNLK2azInfqW4or9M?=
 =?us-ascii?Q?JLBunB/tyb4Ayvoz6SY4sGxq3x4mHcbCauvXpLmvUpv1lUNIl/6I73Rdj+Qc?=
 =?us-ascii?Q?bDiOV4yWeUtyND+yVFw5XMuP52mm7QGSRAbE4l+fWTzSNDwse4BWNGgZedrR?=
 =?us-ascii?Q?xrVKLs7no03VnvxCSee16IjY8r6YE1hD26mtUE4pG5FAcmfZFCF+xRmO/guZ?=
 =?us-ascii?Q?B1+Ba4++YPS68Sq2wqqmVsjzfyJ+ywMUAVAcxh8LTpzmaN5pMv3fNw4L4JU9?=
 =?us-ascii?Q?dUHoezYLuyuXsIrA6r666jx4+1IzGjtqmJkonqAbP+pYLj8WS1YE1BYOyfcL?=
 =?us-ascii?Q?XmWzhBEkSKd8ROu3V0xgtCLMhV74b/KPhXsaxw9/nwGloCdS1rvFaeH+bweo?=
 =?us-ascii?Q?nA2gMnunOSBvTzudnH5G1w8J3J1swhhHC/NcK9Vwv1tv55Bs1QGfcHBT4S9C?=
 =?us-ascii?Q?ETXM+06VfO+3YUjS2hKiXpwolWitZ1geoUfpPE44Hj5Yu5R5lRa4Qsaeflms?=
 =?us-ascii?Q?qCNkZPCXHWlbJBEnpYU91w1y6ivdFrGQzfT3jvG/VsGp88WlVX6qpEJ374+U?=
 =?us-ascii?Q?blr86mLr8F3x1rpVltouxEkxyNnPMLxHV2/pX8NItX0fvhxVstzAK7DzReGF?=
 =?us-ascii?Q?krPoxxU4uJwvIgPTRD18RDEcDiowI4PGkYQOAzBEiNxYq+vNDVfTxS8bRoMu?=
 =?us-ascii?Q?T6gsmsgR00gcq2XVt7gnYIRn6wWOVeDU9ZU+UPeEhGkIT0R6Speli8AC4jX/?=
 =?us-ascii?Q?mm9qbfl5WJqIPJz5d1q6MHfV7WLugAigVJ9Pc9yVz3mDoU2B9CJYQQnan9oz?=
 =?us-ascii?Q?MPLHYd4tsKwL0JGLBfD1FSX2lvufy/+EuUe8oMERhVZslMWfvGlCzRSJdoin?=
 =?us-ascii?Q?2xI458xXuHRMSUhNa0Cf3FCfAK2jUGPiPY0nwoYKNl+aB+DpzeJJOz061Zzv?=
 =?us-ascii?Q?P6mH+cnznOwk7hEaVsJiQEVMFlMhcsQ9Spb7Du/w5EtfzkmrNjDT5VoPvuXR?=
 =?us-ascii?Q?5rMYZq3ZepSa8D5siJlCQF1WgjUth/nMl6z1mncsS6wHrsNxH4z89DKXeVn/?=
 =?us-ascii?Q?Y2wCEIzr9OFMmtsibg09EeUrKK4yPRWVoWF4FI5vA8wk6hwr8wgbby+UIm8m?=
 =?us-ascii?Q?6brmvg58Vo8vCPEj6G0N/IpFYnXDbxzKXDI2C8FUPvciT8Vv3xTnQU4no+0G?=
 =?us-ascii?Q?DydlYuUm5BNKGDeT4BkOLXOelRy5Ks1g3T315MsN/NMzLEBicz08JYxIaBfA?=
 =?us-ascii?Q?JXD89W2q+TJkUZIqp+8WEjhzhOAwxNWkFLM3dw1VTiLm0Xsq3cbfRj3e/joj?=
 =?us-ascii?Q?IK34FOtMGG1z+RhUvA7ZH9c/n6uMEjw22ZobbSh5pxCqX3zF4qDLlMvLl4dJ?=
 =?us-ascii?Q?MeJZ5hkxrwkSLL2a0YmHo2lN9fkOu9+yg58ChRaQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c905372d-ae51-42b7-5821-08dda79604c4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 20:41:32.6762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4cOZxHhpZ+RA85rWJIBDaVXJOXT0yhLBBjTDbs/qgfGlGEG4FlP0t+fZQA+r73o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF73CDB1C12

The driver never reads this value, arm_smmu_init_domain_context() always
sets domain.pgsize_bitmap to smmu->pgsize_bitmap, the per-instance value.

Remove the ops version entirely, the related dead code and make
arm_smmu_ops const.

Since this driver does not yet finalize the domain under
arm_smmu_domain_alloc_paging() add a page size initialization to alloc so
the page size is still setup prior to attach.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8d95b14c7d5a40..4ced4b5bee4df3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -109,7 +109,7 @@ static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
 }
 
 static struct platform_driver arm_smmu_driver;
-static struct iommu_ops arm_smmu_ops;
+static const struct iommu_ops arm_smmu_ops;
 
 #ifdef CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS
 static struct device_node *dev_get_dev_node(struct device *dev)
@@ -919,6 +919,8 @@ static void arm_smmu_destroy_domain_context(struct arm_smmu_domain *smmu_domain)
 static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
 {
 	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = cfg->smmu;
 
 	/*
 	 * Allocate the domain and initialise some of its data structures.
@@ -931,6 +933,7 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
 
 	mutex_init(&smmu_domain->init_mutex);
 	spin_lock_init(&smmu_domain->cb_lock);
+	smmu_domain->domain.pgsize_bitmap = smmu->pgsize_bitmap;
 
 	return &smmu_domain->domain;
 }
@@ -1627,7 +1630,7 @@ static int arm_smmu_def_domain_type(struct device *dev)
 	return 0;
 }
 
-static struct iommu_ops arm_smmu_ops = {
+static const struct iommu_ops arm_smmu_ops = {
 	.identity_domain	= &arm_smmu_identity_domain,
 	.blocked_domain		= &arm_smmu_blocked_domain,
 	.capable		= arm_smmu_capable,
@@ -1639,7 +1642,6 @@ static struct iommu_ops arm_smmu_ops = {
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.def_domain_type	= arm_smmu_def_domain_type,
-	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
 	.owner			= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev		= arm_smmu_attach_dev,
@@ -1919,10 +1921,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_64K)
 		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
 
-	if (arm_smmu_ops.pgsize_bitmap == -1UL)
-		arm_smmu_ops.pgsize_bitmap = smmu->pgsize_bitmap;
-	else
-		arm_smmu_ops.pgsize_bitmap |= smmu->pgsize_bitmap;
 	dev_notice(smmu->dev, "\tSupported page sizes: 0x%08lx\n",
 		   smmu->pgsize_bitmap);
 
-- 
2.43.0


