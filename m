Return-Path: <linux-arm-msm+bounces-77454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5CBDFE38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 19:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 815AC1887E5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 17:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCA73009E7;
	Wed, 15 Oct 2025 17:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VjgmJgDJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012069.outbound.protection.outlook.com [40.93.195.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DAA1FDE14;
	Wed, 15 Oct 2025 17:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760549741; cv=fail; b=twNXjgJ6BoAQT53qNM/OY+WtJJbatz8n0fBRj19Hpnu4LJfclFv19uKk8SbKZAP45J3FEbPbvhQIgoLxeBa0E+yHvv2WaQAFlglQytYUYwk9526oCZEuAeEpA3xRd9BNNz+YhJFedS3zlNLS2zIzmCzDZ+XHH+vxcJsKelM7vBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760549741; c=relaxed/simple;
	bh=Gcy0djEpDW3YoiV4uJfpD+9/ymZRRH/DD5Smah/RMIo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyrgAP7xg0sz8a+GQmKmua094p+xWDas/p9Ke/JC30PLhSdR/hP8RoSKb9+13i14iMPbujlS/xrHqSfhoxK8Z+ad0OBBiLOAW7cazkXZQeVkc19RWhMB9tm9Y/8deVL9aONc6Oo7X0oEVCDaU9FJKMYVg/h4Kg83mE3s74qM2ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VjgmJgDJ; arc=fail smtp.client-ip=40.93.195.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4rd/8UneRUiYtebjgd3VqKK4G6zO/W3kvMSLh7/OGqiZA/e1mP4XaE23Lkf1b5bM7BUkipPLRCrTy4EsyGEC7uCjBOSv+hhKof1yqXqC+2GARYuCt/AcgLyKJ7Q7r8UG+z2jFd2UGlrB4WY+NZAONf9ZzXB0aZU2VWXVtutgfh28qvxHQMT4gHrh7ivNHgEQKl3+QqyVp3TIy4goBxi4+R/EhzH94OIwK7wAUf/C9ujHFyOrq9+J87N/R4qNFyu6msK1TroITWxYjDghw8ZEfFJFuY0sf2+fl9fQeHBn5kihcIDsRY/n2Z19ceGuLmyOr3yyKzSQJRHyplLHG2Ogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym5KXypVXoWNGKcpOctEcTYQtwndUzaCFTGYBCx9F9A=;
 b=bzdvdM+WbMkQxpwkFfo3oyuoSO/jpYw/hkfK3Vvos2bfMmofn2U6bntE51bsrArkBzKJqHBYtivuq0+jEV/zIk0v5XOj2jqGE7f8vbzbKPmIuenp3NqdctmdTY0mCvGzbzVDdzZ0jm6F+KmZ1xtsbOlq8rtBSyiZ4SXX8mTkjJ/5wn4WpE/bWEQ++MGRmVYHnhHgzVQc3bj831eYPtHBAIYkL20bKuoN+dh7Y8Fj7kTxcguWX9S5Br/i59Z5ss5C9rkkpVgBnqJasWZFfM8D6PA/HX9jcdCwuwFL8YAM0iavLmpk2081qJm4KD4/Gs0W0kcRst7Zw2YqAtKw7GtAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym5KXypVXoWNGKcpOctEcTYQtwndUzaCFTGYBCx9F9A=;
 b=VjgmJgDJDGZCflKhKF9R6yn1mbUf7i9hGa7Th0jq/K/9kGnTaxfCoQHkxHixrsr3SBasLfQM6B/BjrfsUB21CYVYjEmOGco9ClJrnm72EnrzKbk9W4NkI7yvWSQTXgdaYQ9V37Wr+Ge+m2mCF1Ri3+b1P5NMgcSR+e5KLdp1wnTi9UDkuy0Yye9ALZF0308YjfxrwBGfEcbZpj3euryV/m9ej55MtpKTb32a+NKUM+fVtNbCGYydQsCGhSHf1m5GSAnyYvDbBgLeUk3zLmUYzPhlbgALMW4yoLxfc+KmO6lDS6NzxwwD3wYZmZl32WCrci2qr1HEOjcloPwb2jKlNg==
Received: from BY3PR10CA0025.namprd10.prod.outlook.com (2603:10b6:a03:255::30)
 by DS5PPF884E1ABEC.namprd12.prod.outlook.com (2603:10b6:f:fc00::658) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 17:35:35 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::cf) by BY3PR10CA0025.outlook.office365.com
 (2603:10b6:a03:255::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Wed,
 15 Oct 2025 17:35:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 17:35:35 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 15 Oct
 2025 10:35:19 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 15 Oct 2025 10:35:18 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 10:35:17 -0700
Date: Wed, 15 Oct 2025 10:35:15 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<robin.clark@oss.qualcomm.com>, <m.szyprowski@samsung.com>,
	<krzk@kernel.org>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<yong.wu@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <tjeznach@rivosinc.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <schnelle@linux.ibm.com>, <mjrosato@linux.ibm.com>,
	<orsonzhai@gmail.com>, <baolin.wang@linux.alibaba.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<jean-philippe@linaro.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH v1 6/6] iommu: Pass in old domain to attach_dev callback
 functions
Message-ID: <aO/bU6IFUBpo2iz/@Asurada-Nvidia>
References: <cover.1760312540.git.nicolinc@nvidia.com>
 <53e12066ebcaa1bb5a3f4ed1657e088f3d8e8464.1760312540.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <53e12066ebcaa1bb5a3f4ed1657e088f3d8e8464.1760312540.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|DS5PPF884E1ABEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 98c03e62-0894-4e66-8494-08de0c113f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7hdTfa0JClrud6ghuQBWY+EiQx+m2L6DjbnnI2eDrzRJ/zkDVzBpbotKUls5?=
 =?us-ascii?Q?32j7srKXh1k7BHRGglhjkRg3F+fjHdNuzqjKEal5ALo1f17GLbtOqW4j9gLe?=
 =?us-ascii?Q?NI2854Y5XlrQ8Gq6lEUisT18pYZhAn9zvbyKXjgHCGDnaQD+xO10zZWxl33+?=
 =?us-ascii?Q?mreU7n8IXxoRp7WinKvA/VA9AbuRygAzdIuzTt/dlD9pzz6ptExFnjdwwsEX?=
 =?us-ascii?Q?4ZyvVRGfeFmHND611J6xgrxWtKW4uPW9a0qbFqSYcMVMvx7bxBqIM2PiHyuX?=
 =?us-ascii?Q?vGUCO2XCLs5J+rfRR/l0okbHNURRDk4AtT55izrBVkBA8WWEczuI1Nre3xzs?=
 =?us-ascii?Q?JEiI8PshwjnMkcDb7F0rPFrT5oZ86iaCL+InFaYyzErxd0uNmss7x7pJ6ssB?=
 =?us-ascii?Q?pF4uMZytqOCsR4wC3lQh9Mdkhf/Lu9EVmINvjbw+FQJoXMy8Kt8Pxtac/3RG?=
 =?us-ascii?Q?YerFM1bL4WGCjDy2X5kQHkarTCMyk0Zdjx/GjJQOtiu9NFUrv1Gfic3J8gTM?=
 =?us-ascii?Q?an3HvX5PNhiZgoDlzACC0Wk1Mbj5dQvT1YQS/sAYCDuWE8k2e/GTt+0gl1W+?=
 =?us-ascii?Q?rjv0Wx7fdN69lFRfsMskvU1JZ5USM4Cg+6kwww4BAV0D9fHVVtLJDQB0pNTi?=
 =?us-ascii?Q?fWJUG4J6Hlh+xC1f39WyWXQwe6xPmh3JKWvddgrLRyGTqxhx0Yy02KUg6ryX?=
 =?us-ascii?Q?ePMUNo2ezQa+UR/tFART6tkhN+m7tUksH8cGrGiEus1sFMqAtC/e1w3ABkMM?=
 =?us-ascii?Q?NRYxeqGusrgBdK5wTO1g5tTM3Z+8uUqg62jmmt97fsxfUT8F8G+cjPCcFR70?=
 =?us-ascii?Q?WScGMnZL0n7ePLYUA0vp20czAkiBJffbHbzvMVfMLa6yKNrZLTUJf3ohh0e8?=
 =?us-ascii?Q?00GHRshzg6UgoAEvTK1qxD0CxnlSZGB0ckSJli1aMKq05fwpK/ECJ8mXGYdr?=
 =?us-ascii?Q?QFQEb6ON93ffF20ob4dqJR3vLrSj87JaNpODjU8iWPN/qRL3N0G7kxZ5QdbB?=
 =?us-ascii?Q?tbGNrgTpMMqoiJqS8uKd7Yf/8EuoXA4Fs0canAdGhBBrlw6z9OWzxlziFtQt?=
 =?us-ascii?Q?UHRzILlQRigryajET3vgfeEmtCOrX8Qpp/VxwvxjltReGiPXthzc7F8xc0+R?=
 =?us-ascii?Q?wo7QIsZGXQFJ+J9suxdLWEC4YShpntykGqc73j71XbfpAfjjUIG8M5H0f9Fu?=
 =?us-ascii?Q?89Vd9sTNPJtGXZKF/Q1a24L2rwNGI/cei84mUh5EHQ82YrrTu1m0X/ApiJ4e?=
 =?us-ascii?Q?Ja0eLj1Qk9VwtGbO4ZbpgkNU7NGNTt6wzYeBfagZG3UZW+OkHEdmqRkgbm5Z?=
 =?us-ascii?Q?WafXM59vzueKpOdqGMfQGBrtANxGayPRy1iRlQTdPrwX1oApE/Vkqzh/U+Tv?=
 =?us-ascii?Q?85LzbTW9nClRHYCyVCVb+EvlQkoJyP2Ve666jpkx5ba7gktcCaCGDjMEMeWB?=
 =?us-ascii?Q?2u/NwN9nSSVuF/9jPREUIcpkgG53+SpKQfk8UOBYYseq/vgQ+paSj/ElpTYQ?=
 =?us-ascii?Q?mXp9kzwzvXR8gJnxRtI73gZR74Zo6BcJPgPB0oQX11ZpoEDLlSFe3QYzTG+K?=
 =?us-ascii?Q?XW0X09jPQsCnUUupNCw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 17:35:35.2391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c03e62-0894-4e66-8494-08de0c113f85
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF884E1ABEC

On Sun, Oct 12, 2025 at 04:57:42PM -0700, Nicolin Chen wrote:
> diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
> index aa576736d60ba..366e47978ac07 100644
> --- a/drivers/iommu/s390-iommu.c
> +++ b/drivers/iommu/s390-iommu.c
> @@ -670,7 +670,8 @@ int zpci_iommu_register_ioat(struct zpci_dev *zdev, u8 *status)
>  }
>  
>  static int blocking_domain_attach_device(struct iommu_domain *domain,
> -					 struct device *dev)
> +					 struct device *dev,
> +					 struct iommu_domain *old)
>  {
>  	struct zpci_dev *zdev = to_zpci_dev(dev);
>  	struct s390_domain *s390_domain;
> @@ -694,7 +695,8 @@ static int blocking_domain_attach_device(struct iommu_domain *domain,
>  }
>  
>  static int s390_iommu_attach_device(struct iommu_domain *domain,
> -				    struct device *dev)
> +				    struct device *dev,
> +				    struct iommu_domain *old)
>  {
>  	struct s390_domain *s390_domain = to_s390_domain(domain);
>  	struct zpci_dev *zdev = to_zpci_dev(dev);
> @@ -1131,7 +1133,8 @@ static int __init s390_iommu_init(void)
>  subsys_initcall(s390_iommu_init);
>  
>  static int s390_attach_dev_identity(struct iommu_domain *domain,
> -				    struct device *dev)
> +				    struct device *dev,
> +				    struct iommu_domain *old)
>  {
>  	struct zpci_dev *zdev = to_zpci_dev(dev);
>  	u8 status;

kernel test robot complains a build break..

Both s390_iommu_attach_device and s390_attach_dev_identity calls
the updated blocking_domain_attach_device function but are not
updated.

I will fix and send v2.

Thanks
Nicolin

