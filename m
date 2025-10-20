Return-Path: <linux-arm-msm+bounces-78057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E31E7BF3009
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 20:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C06F1464B4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DB6149C7B;
	Mon, 20 Oct 2025 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kdf+fjZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011038.outbound.protection.outlook.com [40.93.194.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8648727C178;
	Mon, 20 Oct 2025 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986042; cv=fail; b=imvqbZit2KM8ueDGkqIhM5KvywoNekut4bI75ei0RWRJfkjBEmp01TeEI0u93HuzdS2ClzhB/Ys3XYDxpnf2GMPr8yL9XsH5hbyAJO8kW0SEmxJEQT9Ej4VWacOseHWHXV/ZGekMBVsS15aoe1ikbmdxYHFZdsI8LIV0yNDK0Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986042; c=relaxed/simple;
	bh=wuY8b0KdSWnk+4uxel5Y0BGNC7AmPb1/JIMznK3SpME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VlYlANIqef0mddCV09qsuHuecQ2D5BJc4z3uh1viuMwY7sl9OTBx9/bOH9ukf4yKQHsAuxGGVSCDbNANGPHEZOPxKWTonvSon1XdD1E9ZTtlcy9y3YzBDrkp0n1hpPAorXlJvZoci3+s2RbC2r6pOTeIn9dlHL5q0PoS0UlKopg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kdf+fjZa; arc=fail smtp.client-ip=40.93.194.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0QOrttW24P4rAZo/KUo0kCRNhY4u0rAiFVu8T4LypPxL99+OxXjaaKtTYuadv1JTgTAZJcY6TgHKZT1CYw80EW0d7clp5FS6QHqt+18JoLxDv6yflg/ITWwC+qX1V9c8C5rUw90Nx+TocDDdWZKQsdkpvWtn6PAKJgNqDrdoDyplIu4L5qfQ4LAbyQGWn+Pef8IrsjcpeYgvBQ3WrmGLbGlxTmVaPGeCPVq9WzBeKZmIC08mzEm3Vvzw7tdJV7RvdMPRXkHmBBFAJn9YXC7Eyga2kIqsVP4Frzqv2K08H9ZBUBadpQmh6gJ5Et3ywyTovwW93yI/EOg/bh7y/5OrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CilgOmB3PmmJBXdjPACzYWmzSaC6FSXbe7AKUnZ3sjA=;
 b=WzrrtElVW5RZuMp3VxUGuaz4+4huF07o0pjclGGjLJXxs4ZXytEd653p6gnXQA1FcRkSXKLr6CWEqQ4sMctyM4LOujpHZT0ihQ2GHJhkGUQSd1+9K+6fO/JAYaajXrYP1ApL/U9llZRXd2RK73yIXELRC9ixhuW9kfQXlW3coXAkTxVdfTRALs+V0dIQLLPuIy2/IUNPy317MZoc+aSXR3rN0tCnO4PPSCWDMnlEsu8qNHnhT8qUAsvKl3l5kmbiLSWLj/TfVTcw97MiVr0iqEySbIWCzCoPYXbjGcX2uDDPl8ONaHMV+rujJyTzE+KMygzc3Bemzh0aFyUM3+26RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CilgOmB3PmmJBXdjPACzYWmzSaC6FSXbe7AKUnZ3sjA=;
 b=kdf+fjZafKK+Z9VgDoejv0iwN4UHMz63FYGzWoL9XtqIkw4ocCftk8VHdodcmkzc67Yyh8nLStUlHKp+l8/S83v3Lb5l9i4tJnr9UIsK4ewUZd58vdvcw9ZP0uji1hUmtome1qORnCcLv30BQwRs/OK00wlTqBA8a9saWbbcOndWJZMOR4NmvpHcfRy0Ip7AGS9G0uvwezJu7VpIljfiOW72HvuFnRSQpoYLz3ZQcdEsyxXkkwGG3xVxzNHo3cQA4Z5GAUPWkbE/O3D8rF7SC14lKxER8WQ2GCN4pztp9I7NY2xH7BzaT3D5T2kBD2XvVAzo9mcNpgao6bCLlCu+Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Mon, 20 Oct
 2025 18:47:17 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:47:17 +0000
Date: Mon, 20 Oct 2025 15:47:15 -0300
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
Subject: Re: [PATCH v1 5/6] iommu: Do not revert set_domain for the last gdev
Message-ID: <20251020184715.GE316284@nvidia.com>
References: <cover.1760312540.git.nicolinc@nvidia.com>
 <691771cd72daf8d6c813d25067c6c521d834e350.1760312540.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <691771cd72daf8d6c813d25067c6c521d834e350.1760312540.git.nicolinc@nvidia.com>
X-ClientProxiedBy: PH8P221CA0044.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::22) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a6681d-8b7a-4dfb-df52-08de100917dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LGTXyFOX5UFLztirMGyyGtqByiufqwqBWymR94WP7MaE3bSBjoWFdciZxisW?=
 =?us-ascii?Q?ZQKJ/EHC9BdNJFEC4nt3dIptdjn/qIic3B2QOjx0mX/ATushtvstYZeHE+uJ?=
 =?us-ascii?Q?XvCtwbJZI3yMICaPKRRfP+IkbMGae8g2K2RGx0CwapQPTeBwxnYG62FKwwAd?=
 =?us-ascii?Q?W+LAX4DeksXlUxrfOMj/KTvqv1mpMUtOYt4QrK2YTU2OfxqFCxxMfWagBUjv?=
 =?us-ascii?Q?zoGSJPwxvWEe9LQK9TZH+Nzbgbl73XY31R2GOVDld6HolaagkW9+hiehRrxv?=
 =?us-ascii?Q?YZ5M7kS2fhhHqk37dN6dMhBeIu/EI3iQzN+dXfn7lCIjlUK0+2XlEXkHdMwV?=
 =?us-ascii?Q?qlAsOF8VcM19wP5fCBexAuaoVTduqvjB8uAM6GT6XzdoBiFKEoMiYL0drZkN?=
 =?us-ascii?Q?Jr8VFEcLwmnMf/mkSx5lVtdEjuHLJQ4ko/2TSqgwrQ9hOPcm0fzryglCjGSI?=
 =?us-ascii?Q?W+wGQg9+CPLgFkQXe2j+VZ5lQUA7lqwV4PIe2PEROg6z4/19fzhz9CXYgmjb?=
 =?us-ascii?Q?lLtGIfgHucqtd75P0iwS8MF3bJ+hAdADlH7+fH0GCwir4e5Dq4krSseWZML1?=
 =?us-ascii?Q?Qp2sgjM3dSkTR54k7E/k38xVGEigtMlmtq7/Lxp63D/iFa9f7MkGrNb2hauC?=
 =?us-ascii?Q?/YnExkGCs3ZEyz3AyhswjNuoHnMhfunlsLoZ2556Jy6dDYXodb/0QbG4TyuD?=
 =?us-ascii?Q?fq+kiXly8ZAvNBiUBVzlNa2J233MeYLQblRLQ2nVlk3b5B/rC9+EPzbRw7fl?=
 =?us-ascii?Q?/iV7MAEBNdAohljsc0sWw6t4CF0CSoXmQYP99SP/Qk6RWqO4DjkfOgCMZgR8?=
 =?us-ascii?Q?59mY5lyCrz6G530FkQSIyyi+1ZY/PWcgPITOU6pZYxXU42qKYHQtXSA8ZCwL?=
 =?us-ascii?Q?vthcNSIG5ptiCkDH6/Ay9CUGbRvopefqwkUCEEfqzr0ksYGargppCTkgiQpR?=
 =?us-ascii?Q?JxC6DqMpZRlebzzvaahSKbvlYD8iVN/Wk4roWQKmYjYYCvqqPcPaHl7a6wkl?=
 =?us-ascii?Q?Y9VyNzxTXG7uzmuekQkmPIIcGXvTJ8udnty29AHab84iitWNAAiJWYlLADzO?=
 =?us-ascii?Q?Bw2c/mkw19eM7p05U0Hc6m3T0p7f7dTJnbiiJUkwzrPa9e9R9+jCiUScV2u/?=
 =?us-ascii?Q?BeQi7lb/gew0mCP4dtSNWRLV6hE2vq016hHCvFo27wUqrOYu9UgN1+mNh3t+?=
 =?us-ascii?Q?YhR/S5QumUSAqrseYuwWYekQCRtqpePHZYj3GyERvc9B/fQc/9zKcKc++Cpl?=
 =?us-ascii?Q?u0WLKPd1y8YYoVJDoClb+heQ/yVGKHY1rjKfnro1MppfDRQuJ9SfIly5nJV3?=
 =?us-ascii?Q?du49PzkfGeDpTGWuIg1gLaeTzags4t5KX+4hh+U2o3m/0LBqzh1lyIPEGD5V?=
 =?us-ascii?Q?hqD5hYgoU6j1KtbQOHCOmkDKMdvJRg5lP6VHXTJG0+oZJK/znnDvuVcEsIww?=
 =?us-ascii?Q?Jnx0mBB06jgAOrglPJhgI+dvy1ZxQj+i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pgj4/Oy2enlBvTPd5jnAmEdkLxWJvv3mTgJzm+FDjbhAaUFJD6rifYWlMGl3?=
 =?us-ascii?Q?dT4n04eE5Mf6B5JN+tMMWis1Df5ZybcjhQrCCcVj/4pRaqCh0aFQ4zSToECE?=
 =?us-ascii?Q?8Hju/EdpP3P6gfKFSav7sOGL1Iz+TiCNk1jFYxsWmpZtDf1iygE21Q6/Mvpk?=
 =?us-ascii?Q?nKjQyoILVDKIuns7RSPW7DjxGURgO1LR64mK6TLXvfGXXWHtWw1u7QFwBUQu?=
 =?us-ascii?Q?LoDDrqWZO86q3HNceiIIVvql3uQZBSMenEyNITAvpynPV/2x+uvRt9Pnjuqq?=
 =?us-ascii?Q?OxoTSEpU4BxEeugxEHaNmzKJFsHZNKh9s1V0o2Zo4+Jq+5RAJtNx6LPEGvBn?=
 =?us-ascii?Q?GhbKavbqI7O1EefwbbN9aDKuQYRL2TiQ51JobNXjl5FxqCm2jTMBFCGmdiSM?=
 =?us-ascii?Q?0SRxIyE1WK15JJwJeEaTZ///0KDCD4fN3TuNsj79It3FUmWeETk54chpDEzV?=
 =?us-ascii?Q?iS9snB/7Z3K0anQ+C6KTLgSmYm+FSwXKtwN3WK8iGTJZ0cxwpDLIJSaObBHa?=
 =?us-ascii?Q?KtMpgu2zQq7RvwhT0mRKyn4jPMau/h87hfbvA/tzALpI19tstfuXQV8H161U?=
 =?us-ascii?Q?zvnXt00zrbnnNkQKt5Oe8swoT5kyRmXCrWClQZEPbQ601pTJvbaOBcSJzgTU?=
 =?us-ascii?Q?C58qwU43bm9clC9S2FJdD2CCbwrF+TqlMNRPIMoUtmE17Md4O+GxkdsVGu59?=
 =?us-ascii?Q?7B1RJA6RXitRw4SWVBzSOTlASDUCPl9Unt0MUu9lgMCYAPP9TjtHBztDlYls?=
 =?us-ascii?Q?VML1mK5JDPw7mNNnTbExQXI7Unfx9p/28xrKCLICis1JWpiHBGm+4uPOxHVG?=
 =?us-ascii?Q?8/SUbzp6Z902o9LsB4nQPzuKenqnXAWAPi6aZ6bTESs/KLypIlktuMNYf2ya?=
 =?us-ascii?Q?/sX/b2SpFkkmXeJCqb7q8eB4Ae2b0WjpGY4+1xsYfxIB8ut71V9yXH7tZkB6?=
 =?us-ascii?Q?PeXwVxw5FFJo7BCwaGFq14wlG0SztV7IZxwuTuoy9sGINZHOJiuDgJzLxSSg?=
 =?us-ascii?Q?VatpDZ/svuZTiWwi3NkfnOGkfquE+xOZKTyTuW55k2YPNQOuEWpPqJiE4fQO?=
 =?us-ascii?Q?LMH6W7nkksW8s1E4cowot1GBxbmykj944yn2kihx7NpOJ1NF13d2jogeqBF2?=
 =?us-ascii?Q?Sic6Jv9is0PZo8Wnf8od+kp62aBVZy+xWbPj/fxdquyRUR2vgM53C/L+zuOY?=
 =?us-ascii?Q?bi4Cy+VaVQb9wA1xrPUoOz+c1vMJyA70fQqFHPdEkmAsgmFkA+fdob+jo/hZ?=
 =?us-ascii?Q?Gl6G1SU5qyCHOQW0VIqbCWCYlStHaYdarbwi8R4gJ2m+covkOj6pa7M4FHTF?=
 =?us-ascii?Q?DSrRwK5ZqfXKgO5AyKNBx2KcqjMRcacvhVgjRK/O9DPT0kJd1f5zVukggvhq?=
 =?us-ascii?Q?Qb2ThJ9Aztd0CxKYVBNvibvyee6WWC/KRTRHozPyX9p4Zkina58OwVJlV43N?=
 =?us-ascii?Q?A1yG8H6RVrt3dT6QBsHLu8Ui5VASg7LZh20Lb1VXEbtliVhGK/oqbhhFUVGK?=
 =?us-ascii?Q?xOKd8WgzYpEmpjedA1pBMRIkPib5S3hA7dhueLotM5gNY3t9FcJGO/SSPlOh?=
 =?us-ascii?Q?dyu3+nn2B+5l51LWzOprJdqqOK5OVFlHoBFpMGrz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a6681d-8b7a-4dfb-df52-08de100917dd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:47:17.5548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMpzJRKPYhzTvnFeJl49fJn+CXUYGKPTBtWG7GDi8ItdiWRCTplLMhYCDIyCXLPY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650

On Sun, Oct 12, 2025 at 04:57:41PM -0700, Nicolin Chen wrote:
> The last gdev is the device that failed the __iommu_device_set_domain().
> So, it doesn't need to be reverted, given it's attached to group->domain
> already.
> 
> This is not a problem currently, since it's a simply re-attach. However,
> the core will need to pass in the old domain to __iommu_device_set_domain
> so the old domain pointers would be inconsistent between a failed device
> and all its prior succeeded devices, as all the prior devices need to be
> reverted.
> 
> Avoid the re-attach for the last gdev, by breaking before the revert.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

