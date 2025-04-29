Return-Path: <linux-arm-msm+bounces-56139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 575FCAA0EE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CB1B1BA0A16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20057213E78;
	Tue, 29 Apr 2025 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XNbsZLsM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0E18A93F;
	Tue, 29 Apr 2025 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937269; cv=fail; b=ePDXIolq7mvE4ZyGZehe0XI6mxHPeF7h5Ma5cRL+wHaQ0Zz3x8U+k0Iwg5rWpAQrCaOJSFObzUfKLJNRbczJqrc4MfJokdV8Q4bgUc1a9ULhJGjDsUpUmgG5KqIRzlZ0505wNP7Q3B5y5GkAlFLPlx3IvAZJibVBBFvHesI5FZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937269; c=relaxed/simple;
	bh=nUOKCL35gm81kl/AWHMwyj4Jr1X3e9XaHqoyMkKoW+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DSF+ppaMFhZbAUxBQxGypCb9d1+3NAZdtmPt894niHYeRL3I9YF995FBjEyZfdQ8NeR+zYHyy2ELmSFPHG/4lJMy0Srxx1kzCobQOCul1U51jFWQorj2pFNarenfl9g4rKSsSNkMUVfS9nHOEmJL4pSHbERToIKql1EIBia2f8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XNbsZLsM; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKZA9vAj6v7KbZ2Y/EL7Dsng8QT1UCMzaY4oxh5PSKGPwef5VJR3FxqfxUmL4rWpmsC+wtlQT2gtcy3QI72gMDKj7iln0WTVwKw58M+p3NwnkY6CdwYHkAuqsLqFFWLyNplqUTCQoNno4USdgi0V20Il4aHZhw/7HLZLfFwTduMAqt7tvkZ87Ib4SFyXn6fQceraGgI1ipJ4rW6vHBf5sXeZ43aUw31rn3woVaGeNDTa3n2z2pgiBfUq1RhsR8Lfg1AqQZIGAdLi+lvommPmsuZDlfne+t7ZmRjnPR5JZTzxSygeKCT2HLEA2n00X631iYKmP625BUAzZn7OEB38Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dgdd8pOJg2GJTFgjPwD8AjTz4qgaNcUcqM8yxsnH9dg=;
 b=xGXw0rs6n9kH6QPkaXBAi/L76RVVARScXj/jjPeDAQIFMmknurNHsoGrgGk5cxRMMO/CIvUNamFUJ+FjFj0hLZ09j2GAGa6YaeOj72deNON/Xm1UsOB/KMGQcPOurVFLbxxgq2sn2MF3vwcKb0zgO5Xe/DCOCOpJnqqt5gPDk7fz7HjBhoVffaxoAzI3S5s5ww/hYG4cXlNNvvyK3FCnZnqLDQDp/DswuvXIL+cSY5X4GntRj3I9Yn5pp+V1ZvS3GZjQ5EhRw7YKuW9ZXMQXFgA64hEIVvhxzjp6s7zQh/gX/u95VRqTjiC6rhoUAufIirAN3FB92bfiuaW5fw7DYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dgdd8pOJg2GJTFgjPwD8AjTz4qgaNcUcqM8yxsnH9dg=;
 b=XNbsZLsM46bh4c1t1gwhciP9PwPtILKHPiLGsw0ywGrS+JHjsawWe8LVPJHOB4O0J4/aci30JEPIAk6tExv+uk7NIbrJwXp8VVVKCEv4c+hCIBhMjK7HRRrWz8QIxU9FPZ3tPL0/AKcAUd+5gFVKq5hkAUzdsOaDyTcL6+OOl/eLkbbanrvswSKyIJBXP8AzrhR5sLUXJOpddSNlfvtvs91dlm+lkGscr0/QG4Oz8CTYtZqwkNOyj3DRLWOgSBwEXbeD7AwrJiGHte2R6+4WbXo755+kBB167RHTfpfln2uC+vWSm6xV97J7XvEId084dOV9q1s4kKVhRItUiExdTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 14:34:21 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 14:34:21 +0000
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
Subject: [PATCH 2/7] iommu/arm-smmu: Remove iommu_ops pgsize_bitmap
Date: Tue, 29 Apr 2025 11:34:12 -0300
Message-ID: <2-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0001.namprd14.prod.outlook.com
 (2603:10b6:208:23e::6) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS7PR12MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: e547b7dd-94db-4310-fb9b-08dd872aec54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JnYFzUA4kN0wc0RKxfSCSEZMYxSPuzY3xkBqvUae7qJBiUj3yr4yrT0IOt7T?=
 =?us-ascii?Q?fH+iet/qaPnH6CmXU1FR8tKlCInOJ3xIXNQk64SHOpX/qum8JCkDqT0QkMuP?=
 =?us-ascii?Q?EjNzihQuQbQ76QS8QXmKH3A+eXGfQsocRJUIsp2vLAWNtWp1klRVNUpnmBFV?=
 =?us-ascii?Q?YrKVOhSCQmSGBFEz9P61rWdNBZinTozC9ilVkXUrZC3QFs0yk9s3akSZFfH5?=
 =?us-ascii?Q?LkltUZj/BJ/Ib2WetF7Im4oBDeqX7PGPXmMewA5XU74eX4WxaU7owoDJXaNL?=
 =?us-ascii?Q?LwxqGZS+HkrR/KsUy9Ey8IJbbNtWLTrIvIak6YcCgJ/DnlRopiLrStbRkVnj?=
 =?us-ascii?Q?JlKXme1WTmE1PNtfEihXWjZu+A/uuw7DiG0hSFP9+D1qhqXodMnKJfDD8HoP?=
 =?us-ascii?Q?/85v3iPnRdHAO6+S7zh3UZVY0fx9w6goztvLk78aedRjfviJYk17ETLBapfW?=
 =?us-ascii?Q?OqV76Ido/3RR07h82UtHUShGCFKEHOHBij7hpIZm7ViKscHdAOmFuPhYmXJ6?=
 =?us-ascii?Q?YGwLiFsVVyBqVio1SWQDKz7HBZbZ88+eHwddtKasl3zzp1W9MLyyAFTOLddL?=
 =?us-ascii?Q?nIEvQIzhjhxRXFOCgxx2L76zXYc1/v5aDPPLU46XhB7I8ThEAUt58X+/VNOj?=
 =?us-ascii?Q?e85UtrHtMJCakxtfkIW3nWb/7jlbScTb0qItWbCj0V7zlub9AxkRP/X9hIO9?=
 =?us-ascii?Q?vrts+AgISL0lck7eqgN3U2MeM5mlhZZIJVcMjObU7t2zMtqyAadO0tuAeUnH?=
 =?us-ascii?Q?3VKGQpNjysnv8oqEjU4nk5kSPv3TCv0vIBReS5K5uOK8kb6dZ8tm4iU9MngN?=
 =?us-ascii?Q?Tw1wkfXUM2glOby+yczWwbejQvxLcgi1Ba7fbzoCzZwYD3FY2AvyiD5HnVca?=
 =?us-ascii?Q?zLEn7IxGC3tv3/jHzJEwZ456C2kUbqqRvAGwXZBREfiiDey8y5iYBKGM6LU5?=
 =?us-ascii?Q?tliK8jWk1VrMxdEc/6yj0OL2v9rucSLL3nGISnmdvFC9nVhueV6O11bTGZdm?=
 =?us-ascii?Q?twJIq+93WrPDX385vKTaoZuFQBiqdqpwuDOoQBjkYP4jK/Vjku6q0gq5jLeP?=
 =?us-ascii?Q?OktUt7mj9+A2lT4dKXtVs0oizqbirFsMeTR7wINf/hqWwR6OnU8xh4cYe1d4?=
 =?us-ascii?Q?a46D2B4FiTBCEBKD77cvhI8I//qinGEn/vUAoE37NriQSW/pYCLjOYbh+5BB?=
 =?us-ascii?Q?IQdCJ7/noHEFwg/Dp59nGHXbYidWiniN+0T+x6dc6o2YHJ8D4FH/eYjh5Wtb?=
 =?us-ascii?Q?/Epxy3VGd/qvVjImRk6jSj8br//QVpDcMoHhjgo9CwEk3fDTfITe64hr8rQ9?=
 =?us-ascii?Q?AXWFMdWMEGahtHSv1QchIRdtAN96r03+mDau53MmO24j0yB2QgEap+Xo0tW9?=
 =?us-ascii?Q?jCkSHStdavA4iMAOoYnVwWDHSrQGSQU/nebahJ1MCEpR6tYJm9WQUo0OwpHP?=
 =?us-ascii?Q?8rzKgHW/0xCf4GfTCXoDHR9EuxJ4VoZelo1Ho/+JXDFyyNH5Re2J+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6fXzFhRtpaoIG+ve8bdNL6WjIxAq/lccurkdnFq6cy0rw1rFOod6p4LszQpW?=
 =?us-ascii?Q?NodtpKJLnnmpdXb7Sj4I0DIV+9H35W0ial+Y5Q8e5AkrpecwoLmMyoLAo5md?=
 =?us-ascii?Q?BfjXlsUAfc+I7mJNtIy0R1tFQFE/yu3Py0rep+EXS8Nl6V2h8Yu0gvIXhIoR?=
 =?us-ascii?Q?ydTo0f42ZlFGa3IiXgcNLcWjxFS9kUcYfmGwGtQ8stBxSK6dLVGf0dj8Dh9D?=
 =?us-ascii?Q?gy1ushlISmDpxCz9KfboqzrnpPgPdRW1jElD22NbUguEWEQyIJIfYfDmaqLR?=
 =?us-ascii?Q?NlADL+9J4QEtkJe/D+yONMMYnJ3RRL0WYdnv+ckMhj1Z42QPTIaz0nhmPp2I?=
 =?us-ascii?Q?bDOv/ChIxF7Std+r1Y/VEQCxUb4fM1eP6zlfn8OTNtTWVgSZ083eSuZdTCJ0?=
 =?us-ascii?Q?Q6BS1IgDGAYBM5r4E4O+3PAgmVzHtscYOZ3YLDPlW2Bs4SI42WFu9koKsHCI?=
 =?us-ascii?Q?E/3lwdq5X1z7FQklGEsbH3odetrBAfFzlU8aYC8TuZiPd66wI+6c1NWz0on1?=
 =?us-ascii?Q?X+P664Wu6by+ChDklaPffCj+md5V/5TURpasSFKfFmsrKynf7D/LRVbdn0Cc?=
 =?us-ascii?Q?OIN9cGVuWQ01V5XmQN7aDRCpfBZZxmV6yg79NOc7Pf/53BuPPnnXQ5Jks10W?=
 =?us-ascii?Q?kQzQ469DdmBX2PCMcHmkAu0mWsi3BSeEDdwrhA8wl4jU/W+jrBFZUpAif7rw?=
 =?us-ascii?Q?7xCnNusMfX8rNtLVUlljIFm3Xn6HUb6hamOgTI0QDcqqRINMXmNzngEVh/XF?=
 =?us-ascii?Q?qxApVVUaTMLONtclgoPg8TLoCmXAYpuYSGYsfhQMoUZpiG76eZl/ZmLpG+9z?=
 =?us-ascii?Q?IseqvZy91oROX4XU7wPigQ8uWmRSIjfGb8AZ+gp3UBBuG3EWA7aXdTC+eztH?=
 =?us-ascii?Q?cBqBoDTLjEjP+V9WrvN2zheYGo8FzhxpOgJKQVWETNMCQDV1k8NTZJEzu636?=
 =?us-ascii?Q?IRI4v1EbxxzRVOZYy0yKXINFl+HNwruAV24On3AJnpQk7IOpzwnr8/ALSzbl?=
 =?us-ascii?Q?j476x7E5i9eN2EykuoZAStjlZNJWfLDqlSH1M82OqlxuxZcxsT54f6AORRsh?=
 =?us-ascii?Q?iX6UGofwwQiVKSRzzV/QENqRcm/X/tat4Iec++9SPE188MA4uhDzJkIdX9SJ?=
 =?us-ascii?Q?Usy0MuC3OOGW5xdihnm12FxELgFZ7n46/NjBPoDGMdAup5gGT2dDI0N7CCeR?=
 =?us-ascii?Q?GLfHx3ersdmcnNWHz7/bppSvkf6wDVkqD6jXHcsY+1zIXNVzWTyvpMRbgNkZ?=
 =?us-ascii?Q?15fgBVZNMgEpCtt6F6Fv62SqLkqcHZQJpfaFut0iXOtzzIcFjsJH1mfvTJCH?=
 =?us-ascii?Q?/TeL59pq5MjrpXyPBj5QOm2nQPJfzCQX+0f0Fprx1YsewVEaVLTnjyoh0H7g?=
 =?us-ascii?Q?UVcEQptvDVW1T/ujdm4GF5XT+FEdSOVHQe/GYMHdITsow67l53xK/3y52MS1?=
 =?us-ascii?Q?/nJy5ahloWvJP7vSroZEvm+C9p0F7KifLft1c2jkW5bFosrfSR6N6WGT2F8U?=
 =?us-ascii?Q?FqXVuOCJRs6y4jwgf8sBHBJcWahvr0c8R4vDTu0X0w/MYVuqwN70jXrqhGCG?=
 =?us-ascii?Q?teTeChZUNgy1+TXe6DQFdJdO+XE4BfklVREpFgcQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e547b7dd-94db-4310-fb9b-08dd872aec54
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:34:19.8939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaWX24bewgQuYcKWc1sWJKTuPR9g5MEMX4uVvJuRhTHhaQeuBbeKAO/fUzxS2F9R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982

The driver never reads this value, arm_smmu_init_domain_context() always
sets domain.pgsize_bitmap to smmu->pgsize_bitmap, the per-instance value.

Remove the ops version entirely, the related dead code and make
arm_smmu_ops const.

Since this driver does not yet finalize the domain under
arm_smmu_domain_alloc_paging() add a page size initialization to alloc so
the page size is still setup prior to attach.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8f439c265a23f1..1a3bccb55b17fc 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -109,7 +109,7 @@ static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
 }
 
 static struct platform_driver arm_smmu_driver;
-static struct iommu_ops arm_smmu_ops;
+static const struct iommu_ops arm_smmu_ops;
 
 #ifdef CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS
 static struct device_node *dev_get_dev_node(struct device *dev)
@@ -913,6 +913,8 @@ static void arm_smmu_destroy_domain_context(struct arm_smmu_domain *smmu_domain)
 static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
 {
 	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = cfg->smmu;
 
 	/*
 	 * Allocate the domain and initialise some of its data structures.
@@ -925,6 +927,7 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
 
 	mutex_init(&smmu_domain->init_mutex);
 	spin_lock_init(&smmu_domain->cb_lock);
+	smmu_domain->domain.pgsize_bitmap = smmu->pgsize_bitmap;
 
 	return &smmu_domain->domain;
 }
@@ -1621,7 +1624,7 @@ static int arm_smmu_def_domain_type(struct device *dev)
 	return 0;
 }
 
-static struct iommu_ops arm_smmu_ops = {
+static const struct iommu_ops arm_smmu_ops = {
 	.identity_domain	= &arm_smmu_identity_domain,
 	.blocked_domain		= &arm_smmu_blocked_domain,
 	.capable		= arm_smmu_capable,
@@ -1633,7 +1636,6 @@ static struct iommu_ops arm_smmu_ops = {
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.def_domain_type	= arm_smmu_def_domain_type,
-	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
 	.owner			= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev		= arm_smmu_attach_dev,
@@ -1913,10 +1915,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
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


