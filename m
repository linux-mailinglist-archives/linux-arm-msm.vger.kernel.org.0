Return-Path: <linux-arm-msm+bounces-56141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EAEAA0EE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85E9C7A7D91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320DD217F32;
	Tue, 29 Apr 2025 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cOfUjJJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B8215F53;
	Tue, 29 Apr 2025 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937271; cv=fail; b=lclV0vshIWH4ssjhtCvSFFdOOY3SmMI/tszE5iyYWKbJDJp/9CG6z2U925GbayIq5p1nGFHhXGDMtjTL7elcYuI2kOAEX8xYcdN02jTrJ7tNSY+xX5Q9I8+V2wRh6pbQ8Ph2JaGKO2ZSfrAb18TZTI5wXHVH3VwARlYR8dD5TI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937271; c=relaxed/simple;
	bh=EFPhtJpT7I7yuLmA1139L7lksVm7ZUEi/Hj1L0+Ts6A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ecyIHVb4SXAjQ+ztLHC5d0vBgC3f0hdGEt0OST1JjBFCJY9y8DqnOMGdItUz4vX+TdQIJ2oDneiWAlnxdDrpHn1BRNxeuirFwA5UvYugruarU3zABWp0jQaapS+4paGL0OEyJZs6b085zK2auuyLDV2lY2x0fW2bXJ7oZydQ27M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cOfUjJJt; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnj2abSOubokfDjT4ZlBGJ0C8o1HODvtlQ375cxQF2EKSiWck4CUcdRy2gDvRMTUbPuoRVhD+BnKcWn37chnFAe1VV/8LRthRrIQJOK7aVWEW0lEhx+Yu14SLsqJiuaSD8lbWX3YCTOpUp307dCM9f23ugDzotmJd++XpwxqCti32OKt07tSM1Ew4/PzkYORuR7asEnaOVf63ud4zJEywBrj5bAHMMlYX6Eh3IDoDWlfgup4DopEd4q/aMkeDo26eqtSm/2V68Y6ueRu+0vm2tfCGJoJ+jRw3ly3VXp/yIChYMQDpH5txTedYeYmDjpMq2/wL3MKLUFcV6sa1s+JEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVpA0mJfaj6xXV/iKj3TzJaHuabrUESIyqTbLVs1MFU=;
 b=jPApXt9caFH6ICn5lSs6NLIpc5rOg0US6YWNTCP33o3IKdhazyQFvbARGfKf0r6uKCRtGf/346mejx2bQWmhZT1CZqruhzbdcfbOLkbbHkLtDTgTwoDpSPIYKcMbGSRRs1F+URxUG4mZbvqJYusuvIIGXtBVC5A6Rz1r1GVmgOKpUi3iqjjqbGX/SQiExGIcP7FnR+m0moZW7/1v4i4ZusRLD/kLJUcaItks05qyYUASepK4HGwGH/Gy4iox4XMNAVd3SBLPdo9vpVMD2IV4ZnAQR3/0Fs4YKrNbpX5CrmF+OLfyemgZOs3NVHWc+jATL+L7E0bWV39zXMbzXslGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVpA0mJfaj6xXV/iKj3TzJaHuabrUESIyqTbLVs1MFU=;
 b=cOfUjJJtNg3320rx44ThIX6fJgyBlgWFkoq1QxCzDoO2IMShsKXoJ/iAf/DYOjAKRboYKeUGUrHyRqWbMDiEm91bl5y6CKuz85DOelpsE9FGUl7xDouk7YSWRhpzkIEH6zTHIz0MMfxoi7ZX4wCss4IdK9DfmFzeQI+78lpb2aeqlENceaNeecZf9wSuwVFzIc9ONzoIStPsdpTv/biswlc2cZiKG2Eb5ak8pLuFeY/OL8K0fVHU22bzEjCKaiI1pJ1/ZyEYy3ZVLS8PQOtmsv1XzGrGKwDptWHRcs06Yvc9SZLnotz5eg3fAkDxggvI2YnGnOkDr2BEXWPRtGG1eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 14:34:20 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 14:34:19 +0000
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
Subject: [PATCH 0/7] Remove ops.pgsize_bitmap
Date: Tue, 29 Apr 2025 11:34:10 -0300
Message-ID: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0012.namprd14.prod.outlook.com
 (2603:10b6:208:23e::17) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS7PR12MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 006d84b0-224f-4af3-db0a-08dd872aec51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CSMmiWcM3vmPonWzkS5OwoTNNOg+fFkLyG4+MgsAFVGrNOB3AkMxK4lZdYrN?=
 =?us-ascii?Q?a60kTH2kjesdkUfhfvN4FDb60GtSVMDE5sh7yFQdJ5lB+zyFDF5RfJrObFi+?=
 =?us-ascii?Q?s5Ewj0iBZcxanfWQlfJYD+gr7WbglpDjOSoXwW8oCODU9hU5k9UzmTf05wrs?=
 =?us-ascii?Q?DpWeG2lDYX4/ieN+vbuKSMeJH66atgFwXx9W5yJ0bqS8QdJSTlIqpcXlEC+k?=
 =?us-ascii?Q?g6U/W0XaRrI/qGbIJ+x+En6oE6Bboy6BaP/6EKfHiifIGOaRVaK+ozV1oCS1?=
 =?us-ascii?Q?8h6+oKHPndBv6kFx/CpxzWfG1+IbmOnbqUnwkou9LC0Qkb1ah8nWCdNBBaFl?=
 =?us-ascii?Q?Xa7zoKo3uBjP0TOE2CxtHKiQs5NXqJQHAi3k1hSRgNuQw5M9cP37E270j1Ci?=
 =?us-ascii?Q?YOsp/uOtOLQvllbzTCcAOD9+i3AKS46FsMAJcXJ8bi45MWq6D5T94XyilNyn?=
 =?us-ascii?Q?IXRRlN527OAn7dvYkKaQa/8e3Lgd/2XFhc6nyATarGHmzOYuU3R5jikhsK50?=
 =?us-ascii?Q?p0noa98QxRd7C/CL/1TdW6IhSjhoaRT0MX9rMq8/ZVqrkJEynrIz7x84VZZb?=
 =?us-ascii?Q?CUasXWPDJkMJt6zZGlbDy0cDR2O7ZqLBXwVRXPSexz8N2f7xx3/tmLImijBz?=
 =?us-ascii?Q?ny53RRUiSfOOAw4S2CCVpsz5pSpqQnab8x7xWhY8/9jKM5gQGJ+KPUvifAS2?=
 =?us-ascii?Q?mrjl+KOtYxTpStHfwuBeyIvuFwP61TkZJNXurJjYcDsr+NiS3cGw7BCxZQnK?=
 =?us-ascii?Q?PsbXBAYz4Rk4Cr+uOOlJ4hITsqUli+gCxO517TUvnkNvwMjLQDxEAqSqFQGL?=
 =?us-ascii?Q?a0L5KuHkGoAPmizACZYpgRXEwgWy4BzhnRAdJXx7n+hHyTAys03Nr88NisJl?=
 =?us-ascii?Q?++Zg2kwAIdnLsOyEFUHwXKchMHz/0lQoU7GGkXHuqKCUwyLQe9oeW/5rQfpc?=
 =?us-ascii?Q?R3Rvs3K07P8nE6FVMEFLAVSCPFFpeXe9XlduxXQGPrxoT82Fhj9jd2X4xHLF?=
 =?us-ascii?Q?Q/T3QmimlO+XIrXhGjlPGLY5DGgQkxKWUum3KTx6eE1YW1zcRGMrBvTLG1vh?=
 =?us-ascii?Q?VzntGCE6eFDjo1CfpeY3rsrIeJ2/Pje5bFIVzcXgARIYnpG87GyH3c4yKX4q?=
 =?us-ascii?Q?zYUXr03XmlkYP7SWtEO/uXQPLoep+HaQhM7x+5V35GKUP44MYGsCzy1jF4O4?=
 =?us-ascii?Q?XNVR80TyVr80otawK8X7VGp7HkBRbCPW6sFlV6Bj4fOTQYsRpLvWYAqdjIjQ?=
 =?us-ascii?Q?wkuFvDfSy2FQvJMbWqYOeFJRWFNvGDkqfz6Y50W504gstdqxdZDmf8qSBSgo?=
 =?us-ascii?Q?DOuqSECH0rWtWD5nB+VWXnWhd4TqqoAr80vWdJPkA/QOy2pUkfE1sozBXzZj?=
 =?us-ascii?Q?KO4HafhgcmLwE2q1LsE9mOmaABiT+jGpJ0Eq6XIO9QJzuMuyE1qroBwrt2+5?=
 =?us-ascii?Q?Qa7M5hvJwXUE3oWtLi6nTjEBSmxMI3vVdD0SrmCteMtzeAptzDVrCQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oBolikKzXGM2LiKcBBt/vAIVClpg3cQ0HlDH+RLpxu0YIQr7jndYWsjUW+0D?=
 =?us-ascii?Q?raGfzkoZYWOcfenxgNSR8WLg75TDUvtioioMdBFwZ0T/UCaOJieJfsIF6+id?=
 =?us-ascii?Q?41v1Hyse98n871pYimL6hMbdcH4yZ/eXKH3hDF2EcQDR/sULnOpleeWhLkqp?=
 =?us-ascii?Q?swHw6x68UO824cb6XYqQ5yd2lQ/deT08mZPv+xkxmhOEsSI7TWO/iGLdhjp8?=
 =?us-ascii?Q?51OEYDW24uZkX+N61hjvy/3dWoWEzUi9Pkv/pVmJE7MAgGj/ZG1Hn5gOhwns?=
 =?us-ascii?Q?5H+e4TjC4Ot9ThYmPrQtybU8+guwtNyiO2gGqW4VNV18oD3EJ8qdJcU/m3XK?=
 =?us-ascii?Q?jlFmjwzilh1p4oByLEHXu5ju0/be/zthQpVWhu9SvPPW6PeAvWvVLGGHElZQ?=
 =?us-ascii?Q?dKB4DFS/VoO2mOP41jvTCbY5RG8o43vrc8opKrAvzplluR20GY6dJVUxN/4Q?=
 =?us-ascii?Q?r8xfWxm0019fvdZXvZBKfb8qESI9UPBwj03QmbRL59c+VAbmEi/VXAeMwQ2e?=
 =?us-ascii?Q?jlnuWoe6zdGncvyZ8X+3qBcr/0hdZDi2nDPstJP2Jk3BwdkKIrUWAsEllcxk?=
 =?us-ascii?Q?MD1zNtaEegHanCPq0jy+bFRIYJOFdY6nZCOtk/LJFqdoDZW+sp374cl3Tfee?=
 =?us-ascii?Q?4K+ER9+WG1nyF9Act3L+ys47KjvNTh09NHRrXK5smM1Y2z1Ytjcsp0YcDCjg?=
 =?us-ascii?Q?UoRCfTp1VQTQEFYQbdGMXjLw69dJLCTw1C2Ov6r4GWxo01gMMkVyxw5QyyxG?=
 =?us-ascii?Q?UJZXonENk59kOI/aXQhX3nNUOD4AuieJ4q6HFs+7jjucHtLKgjS5BSU6j1qB?=
 =?us-ascii?Q?GWrEZWjaj99w5eXdk1ntuWfEQbcKjNLGTd6kyUNAycjHFTucqPc2fAZOqQVw?=
 =?us-ascii?Q?Gv9UCi9z9P2oC3vand1/kY0nHXB8V7KzelaMcz376iccc/sfbmxEX+9OmbzR?=
 =?us-ascii?Q?ZVI888Ljqlv//ZK8Hby/c3YRQS0ihuVQozmKoMjTSG7jr3suhgqu48Sy+EQ5?=
 =?us-ascii?Q?xQuy/6LzgWHVnFPrg/fDBLw+t5f9L2tjP2KdeRqV5aVumZIHSeLCkoV7YM7j?=
 =?us-ascii?Q?A+Np8Ddikr9C6uPVDOVaR8QoHOuh+RWi/co1B8zJcOJ4nnBFguGLidB8IG9t?=
 =?us-ascii?Q?UAnyXT5mKA/zmodR7E9MphtHN7DpUo/PCrNtMrGZFsaf76K6IQ7m/f1cmVXc?=
 =?us-ascii?Q?BIyG1QEaaaaJDw5imIXMEWQbOR0z09uPYZmQRVSwBW61L+YK+Lo9stEhlZMh?=
 =?us-ascii?Q?U5+MK25+S5ddMRgQIZGuLgwlxULbswqf4dX9myogzJ0MSqUZ+Cyhi3RvH6XW?=
 =?us-ascii?Q?VpgHt9L1NmqteODSG1x0nnpbZ0rtPbUxyAyVIUfS6c4q/cEUdlsrXhY8mHJj?=
 =?us-ascii?Q?6s/vb1tzKQXPwIsKST5GU2AOO93SzyaAx7rjfehNI0A0lzVege4u7EdPEWpr?=
 =?us-ascii?Q?EqE72hzmRZtpntWs4cuc/XDsj8Dru411ejLS8je4RTwLCM8wx6Cr0NzY/Di6?=
 =?us-ascii?Q?4Q5KJ5CqXFIyk7o3bZfJ9e/mEM2uRmBdmJIKI1sSS7wXNhDX8Ke4uxScOJY9?=
 =?us-ascii?Q?7RGTI+D8jjlmDSwBsvXmP9wwbCXsltOsFXIvbtZ5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006d84b0-224f-4af3-db0a-08dd872aec51
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:34:18.8419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QH2x8TGOFjPF43wB2EW7M+EwRGXaqzKZxLhSigJe4lErYw/ss2gfSKua04EraGDs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982

Now that all drivers are using domain_alloc_paging() and dev is never
NULL, we can have all drivers correctly set domain.pgsize_bitmap during
their allocation function.

There are a few oddities that have accumulated here over past changes:

 - Some drivers always set domain.pgsize_bitmap during their
   domain_alloc_paging() call but still provide a value in ops. This is dead
   code, delete it.

 - Some drivers calculate a system global pgsize_bitmap in the ops, but
   it is now trivial to use the per-instance value instead. In several
   cases this is dead code, delete it. This also allows
   constifying the ops in these drivers as a hardening measure

 - Some drivers have a fixed pgsize_bitmap, put it next to setting up the
   geometry in their domain_alloc_paging() functions.

 - Finally a few drivers still use ops because they have a delayed
   finalize operation. Set the constant pgsize_bitmap in the
   domain_alloc_paging().

Then remove ops.pgsize_bitmap.

This is based on iommu next, and must go after the virtio
domain_alloc_paging() conversion.

Jason Gunthorpe (7):
  iommu/arm-smmu-v3: Remove iommu_ops pgsize_bitmap
  iommu/arm-smmu: Remove iommu_ops pgsize_bitmap
  iommu: Remove ops.pgsize_bitmap from drivers that don't use it
  iommu: Remove iommu_ops pgsize_bitmap from simple drivers
  iommu/mtk: Remove iommu_ops pgsize_bitmap
  iommu/qcom: Remove iommu_ops pgsize_bitmap
  iommu: Remove ops->pgsize_bitmap

 drivers/iommu/apple-dart.c                  |  1 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++--------
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 12 +++++-------
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     |  6 ++----
 drivers/iommu/exynos-iommu.c                |  3 ++-
 drivers/iommu/intel/iommu.c                 |  1 -
 drivers/iommu/iommu.c                       |  7 -------
 drivers/iommu/iommufd/selftest.c            |  1 -
 drivers/iommu/ipmmu-vmsa.c                  |  4 ++--
 drivers/iommu/mtk_iommu.c                   |  9 +++------
 drivers/iommu/mtk_iommu_v1.c                |  3 ++-
 drivers/iommu/omap-iommu.c                  |  3 ++-
 drivers/iommu/riscv/iommu.c                 |  1 -
 drivers/iommu/rockchip-iommu.c              |  3 ++-
 drivers/iommu/s390-iommu.c                  |  2 +-
 drivers/iommu/sprd-iommu.c                  |  3 ++-
 drivers/iommu/sun50i-iommu.c                |  3 ++-
 drivers/iommu/tegra-smmu.c                  |  3 ++-
 drivers/iommu/virtio-iommu.c                |  6 ++----
 include/linux/iommu.h                       |  2 --
 20 files changed, 31 insertions(+), 52 deletions(-)


base-commit: 44e9f08cac9f7cc49e14f141b556409c805912ec
-- 
2.43.0


