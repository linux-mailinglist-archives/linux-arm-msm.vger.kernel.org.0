Return-Path: <linux-arm-msm+bounces-78045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04ABF26C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D77D44F89D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BD82877F1;
	Mon, 20 Oct 2025 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iwFMcVH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7A26B955;
	Mon, 20 Oct 2025 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760977662; cv=fail; b=F/pgzgnVr0fcAtv5WByz3sb+v02IsUT2uNg9VcdIR4pBolSdOnlD/ssFzcZsZliJyf/9xZRLiUlTQ9I83ZnvSI/1aTAdbuAjkMSr0w5QjTvBEXXWdBc0FVbiMGaWfVhhUOT9KMO07saN6Zg2g8lYkXsj69+5Sh2h1jBrJdJbeMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760977662; c=relaxed/simple;
	bh=Nm6l36LiAmqMwmp5msP26JGoJGgzUAEe2fRwtFVds8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qywHlRSbbyB72elHk8LssGNlNu15/pPVnjZLRMEcObqCt5levPr/Qx/5JrBtP8FZ3iBxQFMol+3ktKTpyYx4mQtkSR2yvBevck980wnzbt96jVWqd8oUVnnZhfflF0/q/10iDl3ViTTiVxukMjg4hYKl28V6pB1B4EVxR1ZT1lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iwFMcVH2; arc=fail smtp.client-ip=52.101.43.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJaaWin26By2w1D1mbMv6hfAqRbKY8Uh4+EGBqrLidpZILzA25gXAk1l2CxtZHZLS8EbT2rFbo8jBLA23cJUR7uJF+hAs7j6VGXiYdGepHywZ834UeF7AnyfE83SonQEEw8Yf45/QgyKm7P7UJe49dQgEQBd19xo8H8etfZRAOAGQ4BsRnBzCiQ3kCGVQ5gAg/nPFXmL6xaeCFE6vs3yeHQtAtUcGruYARulSQVsP/FRzaOUDOewTJcQS/kb2V+xlSg8hW4Sm3RnkiDI/6oLDFlOYrdE7gVUbWJFN7iGXw18TIn+TLT3Q3n6sD9ItSLmemHEQWAcQBkECuWKOgJ4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCI2fysfQw4vTLfosKtDgdFQ/XeP5lvETNUUOuL9I3w=;
 b=XNP+upAZVZ7qAykep+sUaX5CldYxfp0FWsxTkJNSyrwo+HV2Yptjeo8Zb2kc/0lP8LoNNVX4Im/dPUSOq4FWAk2Y5F1Zk0H44W9ZpwL9LbKWLaIUm0KxFgMyyUqKzo0jwny1mHvTd/2jRhKcETpMpIT/DJZqAlwzDSAHrcv9QE3RkrUNrVfqsjImOwh//RGsjfexuoksfVK11GH7NTKC+WEc/t+SfGfAzkR/ngJ3CF8VdZ7aUj/rp6rDmFox9CW7CEHSdAXMO0gJoMow/tBeeOEl09CwbyHxdl8UVB5Fyxg7tsJ1J+cj7lPReQfrWsvTeyAS5TQdcQLCkgKuXqye8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCI2fysfQw4vTLfosKtDgdFQ/XeP5lvETNUUOuL9I3w=;
 b=iwFMcVH2hFMGaLbttDSJB/lH2Gl5CKcgskbPO6x2bSawsq96RRwQYqkz0sDzQtknvhxrBpW/YSazsJBWHrbRpJCUFCvAz5S0MknLH1uRwA1duMJ1tf2ZWFh9Er7eS6OsIlQPc7kXnb4mQgGuQACOC0oexO4zG9WQmkz9RzC9EqMheSjWEKFqQ/eI3C8Q3eWsNR+5yrYBMJIL7R0ySJrMPxKBWTfbq8CWgY2PtBR8x4tc7in/icLjPvPDp5JFTQyRAFzEfjKlXMOFzVmhWXKEiXXmHv0T8apT61j+zt+95boNEY+eTOshYK3P+lrauVO2xUhvdljB3KA2gv9g4+cA4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by DS4PR12MB9794.namprd12.prod.outlook.com (2603:10b6:8:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 16:27:37 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 16:27:37 +0000
Date: Mon, 20 Oct 2025 13:27:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, kevin.tian@intel.com, suravee.suthikulpanit@amd.com,
	will@kernel.org, robin.murphy@arm.com, sven@kernel.org,
	j@jannau.net, jean-philippe@linaro.org,
	robin.clark@oss.qualcomm.com, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, yong.wu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	tjeznach@rivosinc.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, heiko@sntech.de, schnelle@linux.ibm.com,
	mjrosato@linux.ibm.com, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Message-ID: <20251020162736.GW316284@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
X-ClientProxiedBy: MN0P223CA0013.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::15) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|DS4PR12MB9794:EE_
X-MS-Office365-Filtering-Correlation-Id: af5b0ee5-6490-4ab5-ee25-08de0ff594df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tYiImuhGeOvt6zVjDyrsrfhmtIQA6MAbGnLoS1oX58vdozyHZ5uY7t1Cxcil?=
 =?us-ascii?Q?m8DM9pTYfm+xsXUg72E8na/cTs2hF9YELNlobKsuyPDA8yOOSl9Wu4A5O7e/?=
 =?us-ascii?Q?cAWDe8Gb7EUpRltTGNGvPdhX/xOdM2smd6fkdED73fkvn8jHp+qed8HvLnt8?=
 =?us-ascii?Q?tQZarYqWYLV++4MRFBdaQTI7n5ANL3tqeCn0bI8DZyqmEionPGxWvE8LkjhL?=
 =?us-ascii?Q?3h4BDe5IEhMG6vzhvf5nc/eB+33MW7qXmXTZA/ow8K3/zvhpndj7ZP1AevKk?=
 =?us-ascii?Q?BJB+MImgcb3wmJQ45i5QMLez8l1FXhfm23FFPl4dWK5Jud0xPYAAdoCG/Smm?=
 =?us-ascii?Q?4jcSUDcRl0Nh1nC8TFlRDZeq1Ch5VuJNvICDVgyQesfHHDU9FxvJLwxN5r9O?=
 =?us-ascii?Q?10Ts3hYUhqYqbaLOHm7dSUnW5FHrEVrMQ1UiWe9o3WZqjqgQQ8oi4WBt0wJf?=
 =?us-ascii?Q?maQ1gdDO7g3GCPEbNv1Bq9dyShNAnp/CiNeaZJejqzZB3i7JrVsOokUSTL83?=
 =?us-ascii?Q?pNNXNZU3mqWkfJ/23rijZC8IdQuyu4iD7jFuWDpYMzHdrFUA/ms7rqUDClXu?=
 =?us-ascii?Q?bR8delCTWjKwcCg9zwgW6zh6/vgP6Y9Q2LYcQZ8Io0LeSlinSjCx6DcF62jQ?=
 =?us-ascii?Q?BWAc6DXec1OtG8vwpt0vKovpqLqXs0lSZaCZ60YCDEbYDxgxfIHY10FkbVef?=
 =?us-ascii?Q?/ERhlLKoT6n24Vvc3s/JA25ZdaD+RNJrtHfZQqve19hJvTCzqtQwNpck5XOI?=
 =?us-ascii?Q?dwcBLS7hBq+NwP3/zBnAIHCHh4cy90slIgzHKZDgnsXZbFSCGcMUBIho4DM6?=
 =?us-ascii?Q?XoUWla8wBkoUBrwoTxSdWEQJNICDPzjxzrjGte6ZSdwg8FGF+mEvS2/urPwh?=
 =?us-ascii?Q?fhpx8gXnLFqnVLmkTkr8mrq+6r+KRmvrqcO1e0lJE3Qc9Ozy1T5AsSIqtQfC?=
 =?us-ascii?Q?3ohTEE2nyxkslcP6ba2rXqdXjFbCUcAUU8unRkL+HHGzeoA3fZcBw2loNuAJ?=
 =?us-ascii?Q?nn3tGiPooo6dB5i9URIgzW8oTmK7YZnAGJPu1LLj5+iaBf59bZe3+fSIhBF0?=
 =?us-ascii?Q?J52Dxsv2gQvkL/Wilu9IDtWCGAuMBFdQpoHiiq/+lliJ9Pw36PIrSE5pwCol?=
 =?us-ascii?Q?WmJt4M3aOuQtEE3bcT/2s8dSnvtZKGZRwn3CKb8/7ggcMOSJCbak1xKPbvf2?=
 =?us-ascii?Q?EAIazuRf0pqrsXGUoN+cpffAwUi1LzfI1sRQsFLO5zPzA2U+xwTSTlx7ijqh?=
 =?us-ascii?Q?6So1gcLd707EGOuU1+KGXczrsq1MxtN/+RU/fGUYC2jHnYn6DZCXzKSOlPrU?=
 =?us-ascii?Q?cYMnc6N8G+U/Dsip9O9dj1dq4VvLQXT0hTp5BSl2A5n191PYHg4f+yYC/o23?=
 =?us-ascii?Q?JQCM8PunXW9JzPTJVKXugBKJe+lsrcwazJylib+3Dzs/OBoH/AbuHkvq8lkL?=
 =?us-ascii?Q?vkfmu5uAi6FX5t+tBvIRnueEF4TCyF41?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CeHosNkGyQoRNL5gKjF+EVnIbbRnRaOmuCTURBOzNVFRUszuASeqcnfhx7Tu?=
 =?us-ascii?Q?byu1xpZgtXWw6GJ8QWk3Ieb8VJeGJszqH6CxUXUdqX2J+DxAKShJCpQ4L6a9?=
 =?us-ascii?Q?rdWYY7jFm60vn/8FMiP/qSxXxlxPn45rtq/nnueOeKrjZ8pjDWgh+uTrg7zB?=
 =?us-ascii?Q?oYFacncGncb3Xn9Hs4t4iWfBUE8YpnXTQZ+W14M1YyIEXXMmyENuSiL2FtOL?=
 =?us-ascii?Q?kU/Pt9J/hlBlCGU8n4z/NOgXlehF1/ZFAPnMxit8bgcDm3kBfNyY+jk3Kexw?=
 =?us-ascii?Q?rvlDzQX9G6h1Md8NmWUzHucsuXt1X51wO5JXsKn0fNl1ygHUtz7GmQTVBuwR?=
 =?us-ascii?Q?g6WGFsGY56FsgrfoiwY9QtG6bBTnx0NMA0IRD/L7gCrIQz+rwm8Bck2iXIk8?=
 =?us-ascii?Q?tEYZ0mlZpJ7lC8bhSFRmYVQBqgOtkmlFGzi2rqkBDM0rn802dsp9oXsU6agb?=
 =?us-ascii?Q?9JI5p7UHFkXyfysc7EFSddfnNto6KR6WeCHZ0qAmON0jwFZBCjmGDMlRn5+u?=
 =?us-ascii?Q?jiTx9pq40OeQqCljfh8ZpQdmth2pcZTOas3sA/ju16w+8loCa+0q2wG6prJr?=
 =?us-ascii?Q?5RINaovPTQsNoHIhHOYr/ZLsDu4kIFsA4FQWWbGxNJKwNBeUCmM0vdoph/Wa?=
 =?us-ascii?Q?F0D4CHlg3Xe04i5/XJMXnx+x2Kvu5rpSoslepBuGfLLnKbl8EnJHRnA3HngW?=
 =?us-ascii?Q?T/wWBPwKP5pXyPuqecU0Jd6Axj+d1ChFkTDJyMoUq0qzQf7ho/ttZubmuaJl?=
 =?us-ascii?Q?pmpj7oUenOnyT+We90V85yBCjW3mssA8B8VU1X7uBqUKvRAxuIs53DnYK8WW?=
 =?us-ascii?Q?7QXt2WksBbgij4iyak1jyHnIxYnhFzb2OAlvkNGPdqURv9b6iGtTWsp00yB6?=
 =?us-ascii?Q?zq5Mb6InAUdiwNXA0OcIP5EL3qQGJ/VQOjVD9WcGiykScn3oWp5OMMB1HB6x?=
 =?us-ascii?Q?iq4G9tdrSF6U3p0I3Xq7gjGJ+2a2Z0hidr2bk0w7b28bT4l4MqaLtD8I9Wi5?=
 =?us-ascii?Q?1sFH8bj6H2Rv3h5otCjPT6A8UCCKflXJEutydoHReWVeDgJYWDypqQQ8DVw5?=
 =?us-ascii?Q?UtCRs7WT3bX56sonnQNeqIkMqOI0yGxg2SlQMJOoECnKg3QvsxIF7nbhNbjN?=
 =?us-ascii?Q?ZBzSb5p6W00D4RgoGHceAjMVmoCsoTD9ock6EfqQdYfnD4B8gxBFG1JK5X/Q?=
 =?us-ascii?Q?tQGLfHxzFFGRgw/PDrgr9PVm8H693Q7wH1o2KKIDEdmAMGZtlPG88Iq2eIfu?=
 =?us-ascii?Q?5kEbLpzpncJTmvjOmwwJFBmEAVsTFKKqF3KA9a0SyFmdQOF3F08mmgqA6KKy?=
 =?us-ascii?Q?HMOBKtPqJbtUWfN3NCxu6ME2Q6svZBcxUnsAN47V1V1p1jp4Pb3MK2s45Nf9?=
 =?us-ascii?Q?umF3RuI+F5+DnqSuVsiH0mo2J3SEayEnchZHxNBehEhc770xLebH54lJdkR+?=
 =?us-ascii?Q?uNy151ihMlvYVBRZuqCEKv6gtOe6mFitdy/tp4cMOnlwuW4WbdMTui/Olitj?=
 =?us-ascii?Q?y65ssYbT8Pm2CscsjW6HzliqL8eX4mr5AcopwHjSdXCYeOsmVEpBAQMUMng2?=
 =?us-ascii?Q?X20OXCiTmWkFgv57aZ1fOf8uAMhYlWbJoyTcYqjS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5b0ee5-6490-4ab5-ee25-08de0ff594df
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:27:37.4480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9epYrVHT03u4Yl9aaZICDSYPZrolT0OyGQEXguCil3RKJhEWWjSxNzVjE6kQi4nw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9794

On Sun, Oct 12, 2025 at 05:04:59PM -0700, Nicolin Chen wrote:

> And keep them within the group->mutex, so drivers can simply move all the
> sanity and compatibility tests from their attach_dev callbacks to the new
> test_dev callbacks without concerning about a race condition.

I'm not sure about this.. For the problem we are trying to solve this
would be racy as the test would be done and the group mutex
unlocked. Then later it will be re-tested and attached.

>  /**
>   * struct iommu_domain_ops - domain specific operations
> - * @attach_dev: attach an iommu domain to a device
> + * @test_dev: Test compatibility prior to an @attach_dev or @set_dev_pasid call.
> + *            A driver-level callback of this op should do a thorough sanity, to
> + *            make sure a device is compatible with the domain. So the following
> + *            @attach_dev and @set_dev_pasid functions would likely succeed with
> + *            only one exception due to a temporary failure like out of memory.
> + *            It's suggested to avoid the kernel prints in this op.

This is a general rule, even normal attach should be following it or
iommufd will be spamming the log.

>   *  Return:
>   * * 0		- success
>   * * EINVAL	- can indicate that device and domain are incompatible due to
> @@ -722,11 +727,15 @@ struct iommu_ops {
>   *		  driver shouldn't log an error, since it is legitimate for a
>   *		  caller to test reuse of existing domains. Otherwise, it may
>   *		  still represent some other fundamental problem
> - * * ENOMEM	- out of memory
> - * * ENOSPC	- non-ENOMEM type of resource allocation failures
>   * * EBUSY	- device is attached to a domain and cannot be changed
>   * * ENODEV	- device specific errors, not able to be attached
>   * * <others>	- treated as ENODEV by the caller. Use is discouraged
> + * @attach_dev: attach an iommu domain to a device
> + *  Return:
> + * * 0		- success
> + * * ENOMEM	- out of memory
> + * * ENOSPC	- non-ENOMEM type of resource allocation failures
> + * * <others>	- Use is discouraged
>   * @set_dev_pasid: set or replace an iommu domain to a pasid of device. The pasid of
>   *                 the device should be left in the old config in error case.
>   * @map_pages: map a physically contiguous set of pages of the same size to
> @@ -751,6 +760,8 @@ struct iommu_ops {
>   * @free: Release the domain after use.
>   */
>  struct iommu_domain_ops {
> +	int (*test_dev)(struct iommu_domain *domain, struct device *dev,
> +			ioasid_t pasid, struct iommu_domain *old);

Because of the starting remark I'm skeptical that old should be
included here.

The rest looks OK

Jason

