Return-Path: <linux-arm-msm+bounces-78046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBF8BF2734
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A37C189235D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E09C28DB54;
	Mon, 20 Oct 2025 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FXjTPBpF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC02116E9;
	Mon, 20 Oct 2025 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760977959; cv=fail; b=a4mLe5ZKONz/Va4h6pChP5F4ARxmyklEsGDIAMYT7vd4RE3SXov8Ot/SX7Xinx68XvZkNEcd44OlKD+u4AuvB01hmKm41ZgOEZkr0wjy8oK+B5rsQIOy+dF14SK6+3M5Dp7iVlJNoPfFMLcKXaDMOiXeS+YaSDrA735fgbmn8B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760977959; c=relaxed/simple;
	bh=41ADdPeUOyMqNZeVCmBGMyBwziQUCKXkF1as0Mr0i54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rXpgia2JPoVfwc8kXTO2gVB7QKMesRgQDybVQhEpzLs+OfD410o2aZKnQgvz58V0ZKctfH0zMn8zOA2TMXvOaW9ieXplgOnBmo1yK3eCYXxa3tMJ8D6RP1uiNpjvl2zFatjxb6O4Jsun5BTMqNb0h0aEZ764iTE5mc5l/jXd9N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FXjTPBpF; arc=fail smtp.client-ip=52.101.57.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQA+eHyzRkv6H2/aIMaAieJZ1y7VPGH6K1vSkSQymH3tkUVzFy+aPOOo0+/UHTHmhtbw5L9s6v4AG1spDWP3P9/5UHHfkxZjYH8TQp/crCseMKIZ9bkgA0vbcq2LJoKkRoMzgtNaHOYlvDy0IZc0QOIM5AJp6lzTQ8HgFRiHZ/3FeN/2+tFjKedmX61esDses/uzfiPfJgETdEcIFk3SwK0vXpqxSQ0xF/fAoSr3XQmfmucsjKzyaDcgiWJq7gJoKZ2r0DvQChNW0zenmcTUzqdA3zDF8y3PSv6mvkl24SYw+yIlP7hRqY5Zh/9/lHH7kcJbRhmErnT1uGF+HmEBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNRNv7UPtmSoTJMWxh4HlNLl3qB2kS7Gu2CP+ouEhQg=;
 b=FXTXwImFtA/HWQN/WlFBjfYP4RzjKqeXrBWwOE/vac3nY3HiV5AT6T3foRY0nJWuGeI7ISkxrOuwUOOZ6TF3QsTlqOlIwi0ByV+flKLhEieADY+plmoCVmUoiNse/LijbmJAnoliXtMRSujHmEMXFQ6TOsJ6sgkpmkBDVHSW5H/S39tWFmxElK4XtEiHHNRSsMx2/Ehe640wGchZb7WKTjphQwNT9PwaqpeWbZhrD2GPrJbk6pRTRXt6YXwUgznJI1V4PR74W69BN1LdUYZ05DTyc/64OA29ZgH0FbDRwx2kLK1Q0qMDy1lwRfT7Kch5FBd8AgJJ+A39BgeQwmVzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNRNv7UPtmSoTJMWxh4HlNLl3qB2kS7Gu2CP+ouEhQg=;
 b=FXjTPBpFF3Vo1T8ny1uODq+XZ3XIACR8xYGPzyrgrDIRLEB+SyZfAXdGJ5yYiiqvFDhMiwaJbbEFo6I39Q7RktZp+6Rx5qHcKR1LzSVpKkWgq+HfTPbWxAXFDZKAFhj1oZHFU+2cEVOrdnHOBlQ++/PLICNUPBACndXhHK23jdw2Es02k8YbAPNNquu7ZtRt9j+gz6nMTNZ5l0EB7yDWONYsnrq8qPANa8ZKPIEPJ20yZzIXiRnqcF6G3KoGNLVZfspBCnh8uACvxcOkOwSrtGAWknOKhGWRWjB7zdM0ZTnl2eSCKACAM1YWxIMcjiO1zoL4cr3f3OFx+0D5DUUrBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by DS2PR12MB9773.namprd12.prod.outlook.com (2603:10b6:8:2b1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 16:32:33 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 16:32:33 +0000
Date: Mon, 20 Oct 2025 13:32:31 -0300
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
Subject: Re: [PATCH v1 03/20] iommu/arm-smmu-v3: Implement
 arm_smmu_domain_test_dev
Message-ID: <20251020163231.GX316284@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <f52e8079148a673641d2858700c49fa0c81022aa.1760312725.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f52e8079148a673641d2858700c49fa0c81022aa.1760312725.git.nicolinc@nvidia.com>
X-ClientProxiedBy: DM6PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:5:100::39) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|DS2PR12MB9773:EE_
X-MS-Office365-Filtering-Correlation-Id: b8762dd4-d215-4ba2-7bd1-08de0ff6454e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7zSLctB96czChtfVJL4l7O3FbO0hlAbb2OB+6uxsh4j4GMwoFSDgFW/p60mT?=
 =?us-ascii?Q?ZKLafjgf98mxC/XvpSGXkXTaYdKqadGLAU3/rrFdV+JfBWXN6EKTeZGtU9Wr?=
 =?us-ascii?Q?85AIyBg83jrzhwNyYGhhhk5weUtrygitnTXHs5HJjxBbJ5Hz8y7UUEvtqmWM?=
 =?us-ascii?Q?n2uIXXe2WW56oHrdt2ZroYpSMmRHJs9NmAGMQuJ07JhHOvyv2HokdVvHuYiK?=
 =?us-ascii?Q?GH2X6urcXS80gN6ib2EQqTxwfbYTWQhstxuBAf78OI8u9LutZEwZsaxkDlDq?=
 =?us-ascii?Q?PlcPbsubgSDrZeidO1cH9d/10sFWFSOLIoUC3SPE8a+/K85A2cMmOj2cnSmD?=
 =?us-ascii?Q?kK88hk0YOyGpdgAbRaNpUv3dluKbOWKpNvkFRhcpCa0AmvoSSjOc1tctZpY9?=
 =?us-ascii?Q?Xcvfso/3vQ4whrJVnfa8bBPCUmgL5W5pC3fWJjLNhSxI2ba4tqhLHOmfYv2T?=
 =?us-ascii?Q?aUch+EDklipIh5ZfSS2HLMfCfMXD4srHLVLK994UmFCbRcPGRlAFmXpVd5Ti?=
 =?us-ascii?Q?yOD3eZKai5T3JVkEIRRHRrR5WwsP+LGnFa/hWleRBW+rts5Bz07/wiwKPYgf?=
 =?us-ascii?Q?wsS4rFIm0WiyVsakZFZ9z/iPy0S8jo5OP1jbje81GLlAYBaJWtJWu2qr9LPj?=
 =?us-ascii?Q?MO20APqbtm+TZDCM//N5YTakLfCpCX3wAFVlf2LF5vA7HoNDqknV2pyS2OOb?=
 =?us-ascii?Q?o0GtDYMkzswy+TObfgpaP0ZyVIWx8FZvkt+6ofFKq1L+DE553gCG3Nw1+Na1?=
 =?us-ascii?Q?47FhzwG7bXy/YwgPHVh/U5cHsOHRVyHiYuuv+MGKG60piet1sqtGhTnyFHk0?=
 =?us-ascii?Q?w3W8Y4wm84dimLEJnx2l893ozxYb8K0UdYeJ3N1XyKfSOYsJmPVHwiz7y22T?=
 =?us-ascii?Q?P3zlt09CvzOPwmhg8FqcB9RCqsPSdPSFbC9wN50ciraoF2r/Z3NoE7p7zIvT?=
 =?us-ascii?Q?6utxrdmxBvmyOhJbefsfjUqnmXCq42/pfrQhD9X6UuboCN8O5nzfr9Bub8mp?=
 =?us-ascii?Q?tOn92lDMy/LUbXynX+DPn0LIm7OUK/A+BxXDM6nN8Ab+zgDeKaH46BkShlAF?=
 =?us-ascii?Q?SL4OCw5mCB5UyICQuHxQ52oCoKmEeo7Mm4w+8wVALq92yp+arPGGy4LVbI3S?=
 =?us-ascii?Q?wnDVLqwNzLrNZ3f3gPtav3G/ir/OXfaGMaFlFUKIJ8idjVOgxpv0/Couol6n?=
 =?us-ascii?Q?LRSEsNv5nZzl88EYLPh9azW65dqwVAxfG4CpkUk+8SetTPhQoGuTRq+fc19q?=
 =?us-ascii?Q?J/R71W4yZQdA2xeM5CY2G3+DgcXOi7jSg+O76JnU/UhUcX0OIL2O4AQ1+yiK?=
 =?us-ascii?Q?KtrCnt6J3YTewiWGR8W0sjVRzmt8LTuVwVla//400R2d+o5gEoQrKSZTWjsv?=
 =?us-ascii?Q?vF3djz//saJILpz+SAfq3Elv5CX0hPWnIP3Rl/DEERpxcQB6j6cxS72XCAyV?=
 =?us-ascii?Q?+wq6fEx7OOa85rlcCEJILOzW58lyYrLo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j0HEBzbQFsj8WxzbutQ9L2DoyL6JLgSdbOLACYqL6sXXXzj3i4eFIbDbRbRH?=
 =?us-ascii?Q?NSHW9hhXVaXOOTk99W0OYqqTbh1Y3ONpXO+6bbkaX5B2B5ekYm2bRQk0cPVK?=
 =?us-ascii?Q?VTBUtksx7eyKJWPDDIA/L20+YuGO/0gLffaApNhOwwvQcfsBW5SvO/k5zQXF?=
 =?us-ascii?Q?JSTe3qxZRcyRL4GF37qeq9Sqrpgu555goWVd6CNB4ikhPjQxI3Ag9xdCerqU?=
 =?us-ascii?Q?CBor78JvxOcGffjcvu7y9V6nIxywQdmvzJceWppYh11YUXlmWea7z1d8M6ID?=
 =?us-ascii?Q?UBEk8JDJza6uppv0Tibu9e2ssSvFJvbOUj/P2c+rUiFj8KnzNaoe2Dbgz4io?=
 =?us-ascii?Q?W1/nrQCuiHw24S93N/AsYqn2ky81htqHRgmSsGNF4z0tX8ls0oyv4DK5uXSY?=
 =?us-ascii?Q?cGdR1eipwpdNGzyk3EzCp6iV9UhzrEyucVVn9uNnCv71DlZO/6UzOQuhHMX6?=
 =?us-ascii?Q?sXx6gHDaczvAJXrpSl4N3gxsIGKdidSZMTLAOJOV75La2p2MGTGKm2rQUR3n?=
 =?us-ascii?Q?lfE+cKsK7M8ssb12WSJmfyjaHZIedt1u7atxD3Ri8nYuQKhE81+JlH3w4OjK?=
 =?us-ascii?Q?QTdzdXktaPPMhrJmB9C3PMjrB4Hi7Hf4FO6GiDw/np/vmSizgACd7SlnYbKg?=
 =?us-ascii?Q?1eHve1LgwLlu6NqsmlxA2t5Rpcxnuatu0j8E6Y7hMFFCspVwDzkmW66mzt7K?=
 =?us-ascii?Q?ihn+15qYsP4PjIq3CkdtiCMGwulduIWSq8LL9tmMiRIc5hm7HaGO1S1lyG6Q?=
 =?us-ascii?Q?dCcl9EHWQkGShFhfjkU+ezSJzGNnEubcLbX5sHL0hnXgrc08WkIZUNT5yHko?=
 =?us-ascii?Q?+pqvjbbVbYH+qiPaszWSdtoGAsQwRnFQAjnQ45kW4atVa+HaYjKDC2WcKAfH?=
 =?us-ascii?Q?EhXpj465Z7ciFGGZkaQx1gkiDRNC33amx9eX+2cuU9E4UlidVnwtJWEWz5bi?=
 =?us-ascii?Q?oMkC43u+fHLqA20R/NitBAF7Hcx1Q98a9TvcXGVVxJGqdm5zUXxoMcbzUzxg?=
 =?us-ascii?Q?l3plB3wtcOAnEVFlyXSEaHoz03efzvDVxPlwxjUZ5Ezak5qmddNRl1gvXOzi?=
 =?us-ascii?Q?nMHBpUfAtWf4j5zmeO11FlITrKWPootc/OBvVmJUm4QPM0FbWZaDgR+d4RYR?=
 =?us-ascii?Q?EU91zediN2pH2b8NNdHTOZAdnfEahsuld9g6qE+kDh0zEKia4NEHeueuBiZ9?=
 =?us-ascii?Q?MBaWytvItbFfJQARZMTju2kbll0tee/UJjaZ3BJ3kiA1Hr8zgT0qhrMmzGoN?=
 =?us-ascii?Q?9qlQEj2qKYYITDWB8jKNuJicYxnAZ1E3y9NJhbDSL398efJ9E7PO6QqsjLkO?=
 =?us-ascii?Q?i+TtT28km460uhfW3s9XFcgZwl43ESgpGaAPd9IEnsN5IReBQlW1P0kr2Uku?=
 =?us-ascii?Q?R72PhGvt+CjK0oK8iGBW3P8og/MZVYTDHtOSbPKlWTUSVMaUFjQruKsAYt0h?=
 =?us-ascii?Q?vrLBykPxirhJVsyNJ9WCUQx6IyCzIERBVGCl9H5kGMsM8SIBOm8odMxSmUaS?=
 =?us-ascii?Q?e+gdEIl0KV4l2ULG7Huy8sq0rhWsCe4eeAdAzTByJ2zW7CK5zEdXNPtIJq75?=
 =?us-ascii?Q?GVcKbrbHphgsrQawtNgex5Tph+Bt6nMSugdPaGPL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8762dd4-d215-4ba2-7bd1-08de0ff6454e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:32:33.4004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFJEoktZQRJ4jC0KPf97DIcbdp2sRIMETz7BlkLQ+DrrUs1By3szHa1SELEa2v32
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9773

On Sun, Oct 12, 2025 at 05:05:00PM -0700, Nicolin Chen wrote:
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index a33fbd12a0dd9..3448e55bbcdbb 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2765,9 +2765,6 @@ static int arm_smmu_enable_iopf(struct arm_smmu_master *master,
>  
>  	iommu_group_mutex_assert(master->dev);
>  
> -	if (!IS_ENABLED(CONFIG_ARM_SMMU_V3_SVA))
> -		return -EOPNOTSUPP;

Stuff like this is also optimizing the codegen, it shouldn't be
removed.

> +int arm_smmu_domain_test_dev(struct iommu_domain *domain, struct device *dev,
> +			     ioasid_t pasid, struct iommu_domain *old_domain)
> +{
> +	struct arm_smmu_domain *device_domain = to_smmu_domain_devices(domain);
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +
> +	if (!dev_iommu_fwspec_get(dev))
> +		return -ENOENT;
> +
> +	switch (domain->type) {
> +	case IOMMU_DOMAIN_NESTED: {
> +		struct arm_smmu_nested_domain *nested_domain =
> +			to_smmu_nested_domain(domain);
> +
> +		if (WARN_ON(pasid != IOMMU_NO_PASID))
> +			return -EOPNOTSUPP;
> +		if (nested_domain->vsmmu->smmu != master->smmu)
> +			return -EINVAL;
> +		if (arm_smmu_ssids_in_use(&master->cd_table))
> +			return -EBUSY;

This gives me alot of pause.. Here we are detecting if a S1 PASID is
installed for a S2 attach, but to your purpose this can be made
inconsistent by userspace during a FLR..

I don't see any reasonable way to mitigate this??

Which makes me wonder if we should just try to solve the simple
obvious things like direct, permanent incompatability and still have
some kind of recovery code to leave things in blocking if they fail to
attach

Jason

