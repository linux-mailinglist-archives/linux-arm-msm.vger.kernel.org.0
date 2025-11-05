Return-Path: <linux-arm-msm+bounces-80485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B3197C3743E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 19:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2A9393458F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 18:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CD626F2B6;
	Wed,  5 Nov 2025 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sukUT+O4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011014.outbound.protection.outlook.com [40.93.194.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE521E00B4;
	Wed,  5 Nov 2025 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762366710; cv=fail; b=BTlF+S6T/CSuuVQdU25/QBaJ3v10FRebZ58HeHApQDhWEQW6wacZw74qagIJuhJ+GSxIV3RC8zC4LuF3gzGS5cd2eQU0Tj5NV42iPajVWlo/hgWIRqsRuz/joUlIkXDlo/Q9BVI8R0QUhzlZvgFEsuzf41hZB3pkAaIp+Jk0TLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762366710; c=relaxed/simple;
	bh=FkiM+kh2rMErygFvDRS1UOtJHOVVMoZyZuZAUTV+n5k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dW52Azfd1Zx1Pmy+fsSB9CLkhR3YwQhkVYRV3IR2MR33+HzG+PecltpFwrehacO5h+yru6aC2qslrebuHP/9nnRZPjfR8QQ0OMOtKz9lkkUXdetptIwpxHbUOhwUIx1mBb8FWUGkU2clFZMrHaTMbD2yIQcxU/ha0X3/tBjlx9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sukUT+O4; arc=fail smtp.client-ip=40.93.194.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKuNbrr5ooxS5PArsMEkxfRbFzaQ65qM7fznj9vRFC2eLUY5mdYTsfH1MriLNd/mmcXLiYefzxGASSU5cYZDyOvJw6MrIGa5Vf0EKUf+oql8g/t2Q3z/Pn8VaG8JF0kf14i9nwiahfcNRP2LZctjdyS2Zx8IIpZZQq3SNdU6lGm3yCedCQZ1PC8La5TVc1N5pawLSN3mq0vLPUnE2+JivYtdE6BPQrkWGgUSLBoOhT5i3p5VKVsTwJOkQ+veYcu4Wl1+MgVxHb61dV0T5xi5H0YkOUx/QOMcJoIT1ZGUSNyU1FDYvZMgs8R9Pr34iJ7F2ll4cWAku6kCzKRBgGofmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVbxH8zZg/dBSjSSQnbJVnTvN0blKg05thaY9dEiC+c=;
 b=XxH/xwmmG3L+izbkVl/yKju4l0HT5aHQTtT3qPW65/9mbUGyNCtPtMVg6snwKGRHZn7TuQLxGhwUUOl8neXA9YNK3OLsTew7F+STVxE0qsWRULsRJxbtfGnAiKvRN2h2GFSv0f67kMhynxGjfNSAFyjgrBOsnNsFnW38h2LU3/JxhBKRP44q7BpHfwNefgMXsn8cO4axhjMPAtOY/Q0eaFYMlnZAmFhcN/EvIJZSH9dNUv6rPccBgT17iuUTQVb//o+9I2KXffE2IG7hWi9rscJcjLeSEsT5Lyqh73kPETdZxrScdiJRuMV+YWocBinZirWQzEKBlvkCX+FjQlJigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVbxH8zZg/dBSjSSQnbJVnTvN0blKg05thaY9dEiC+c=;
 b=sukUT+O4vTDXOL68jp0W6wppVHjS3HCDfExAbcnzRPnMwKZFYYmQUaapn0mE2x/LCtUwDm4Aw9guMBjGwcAWK9rf9ymZkytWLgOXHuCMvMz8JpPCVz6SqZp7cP8lOufC1tGqiA58EjpZT2jN+X4kyE5HaJU9bZNXswKiAkSGqOQIh1KOkFDA1kePW/wpu66l/7X21/0AddT0S1Yff3qCC1opCVFAelSdhQe24tmUqLQxNBOlQ144igzwAxt9J0iZe4CVrfAE+vjYzxsYjDSCAcdRVn6lCJOUc2qKOgTHBdhXFSr7TQj62yDvS9q/bq+CEt1/1Qod1lj0WMLIHhdU7g==
Received: from SJ0PR13CA0198.namprd13.prod.outlook.com (2603:10b6:a03:2c3::23)
 by MN6PR12MB8591.namprd12.prod.outlook.com (2603:10b6:208:471::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 18:18:22 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::c8) by SJ0PR13CA0198.outlook.office365.com
 (2603:10b6:a03:2c3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.5 via Frontend Transport; Wed, 5
 Nov 2025 18:18:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 18:18:22 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 10:18:04 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 10:18:04 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 10:18:02 -0800
Date: Wed, 5 Nov 2025 10:18:01 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "sven@kernel.org" <sven@kernel.org>, "j@jannau.net"
	<j@jannau.net>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>, "yong.wu@mediatek.com" <yong.wu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "tjeznach@rivosinc.com"
	<tjeznach@rivosinc.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "heiko@sntech.de" <heiko@sntech.de>,
	"schnelle@linux.ibm.com" <schnelle@linux.ibm.com>, "mjrosato@linux.ibm.com"
	<mjrosato@linux.ibm.com>, "wens@csie.org" <wens@csie.org>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "samuel@sholland.org"
	<samuel@sholland.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Message-ID: <aQuU2dic75VkSyjr@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
 <BN9PR11MB5276D10BD480FE66881870B08CFBA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aQO//+6/B/WbdK2h@Asurada-Nvidia>
 <20251103185400.GA1537560@nvidia.com>
 <BN9PR11MB527638C0E43E8AA000410B878CC5A@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527638C0E43E8AA000410B878CC5A@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|MN6PR12MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba14651-9b7d-41ac-b073-08de1c97b458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fyNu0vYIWg5Wi5i56jiDih4IKeySzyyzBaJlMhyvaIH9i1tZ5wzcB0ygDsKs?=
 =?us-ascii?Q?bAgB6SeAPmJxS34aUS9cgYK43nzigsJ4nAZ8lBchHXqG8D6O0P6lIaZV1YJp?=
 =?us-ascii?Q?1ngPK7eSr68QfkpwtdMWaS2Y+qKUfBQTdvUV/+PX7A+wuxtTDqlLuw56y0OQ?=
 =?us-ascii?Q?cOunGV7XE3dSZUzojr00xKGfNqjqPUz2Y0uU37+Npzj76ldF4vqYsjFr23Qy?=
 =?us-ascii?Q?wrDzF9VNkEJ5Nb6qF0CsGlIP5j2st7L0GvsrqnvDYq8FMyo2ViGPSb64MO/S?=
 =?us-ascii?Q?KwEsNtlik6J+UdbW2dut7LS2nFAWy9t8JiymSA95GBS6nblDE0kEvVRv4QWj?=
 =?us-ascii?Q?Xtv8io5X3exvLxXdUsppPlsfpp6hLoYSegxpzJYI3jOOIaEALUIvK8+JxgZe?=
 =?us-ascii?Q?WAxxRS9V4K24RllZ1/JKcRvXHbmQjziOqzuVYf/MjzqGIkcWDIY/xMkQz5yl?=
 =?us-ascii?Q?nWXAljB+JbuZSqAQKH3bYhiKGAvwfbeuraNAfFDhXljlumrpxXSVZmjrB+Ec?=
 =?us-ascii?Q?zvb3H1q4BSNkso1Ikv69ymWP+J4r4wROnP8Ez0mwFXqkteD+dvEjX3xlku8f?=
 =?us-ascii?Q?97gRZi6PN+8st+NLfDwbpGulfnrTinOx2BEqXzQpy1+6radCHn9ElYfR1Wwg?=
 =?us-ascii?Q?BYxj+M2VIyjL2sojXsWXW4V/Pkmb2Ncta6SJPDta+tGSxNjxGJb9nwWi+Ddv?=
 =?us-ascii?Q?WMN8Es/nGI6U1DIDuSISwhhj5lbasKVSbCLb20BXXgkJX39AEFohJoYlLqOa?=
 =?us-ascii?Q?7CnETMnS0E81igjZmbMyXN8esmWuZvhdcmFVZSU0iFrRxXBEy6Xjjx2fySvo?=
 =?us-ascii?Q?BIs1HDLxz+hpoASn0XSRQyd7BnjyvmSG85hERMITZZgoARUK2jWERAhLTm4r?=
 =?us-ascii?Q?m/cuucM6K9Qmr0WEorkx+FnfX2la/FexlZnrPqnC3KbcLC9lLCglyGPVUGyG?=
 =?us-ascii?Q?mz6Azf1RZhw5dvuRR68UZL9gQ+r4L0lFTuwY0e1rJ0VDIyRotnK9zjoEwIAw?=
 =?us-ascii?Q?xhnJTWIslLaIvACsgaVTbvp4cbo7HR4ZQTYWPo7uru1SsdzWn0KkYYV7GllG?=
 =?us-ascii?Q?eP33f7+iQpCX4cnmWW5QSJPE1kxSUMYddQ6VSG9Vnx1WgUgJ/PbBWrLy+TR7?=
 =?us-ascii?Q?zbek45sd5vm41RtvOmOjLzPFkNVnxPCzw5pIlgmXz/KWFQwF0f0nF+rqtIH0?=
 =?us-ascii?Q?lgPovybw/X+8tm9n/uIShFtmofcv57MHAt6rrwY8pxmegesjTbzFuavtFlcX?=
 =?us-ascii?Q?NIsKhOTXfXIQKMXNwLVbqpRZrsEJlNiR+qixpMrhmSpOY+Fi2fY+WmxJmPAB?=
 =?us-ascii?Q?hiGCHpbA77F/vHMt9Yu4xqXT/6kTgXaDaT1k/siuYyTvUYAj3Y5ku59ftEqd?=
 =?us-ascii?Q?7y8lOfI3tAdphTWIIh7zd1Dp+QiKF79LlB972HgUrM6Ayg5UR85ZxziUlVpV?=
 =?us-ascii?Q?JRmUVaveZgSZ7cH3Z0C0GijVaZHRNdk47a0bzIQsKtdp7Nfyww7Zpsba/t98?=
 =?us-ascii?Q?vKfXgY/In3nTLQXdMQhbcVBq5O1rNCAYfOywpZK9ZS2if0uU5hE6sgyEgXNL?=
 =?us-ascii?Q?H45fT9JVcUNlUCv9V1Ew2RC6OgA6olppabvpLIa9?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 18:18:22.3550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba14651-9b7d-41ac-b073-08de1c97b458
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8591

On Wed, Nov 05, 2025 at 06:57:31AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Tuesday, November 4, 2025 2:54 AM
> > 
> > On Thu, Oct 30, 2025 at 12:43:59PM -0700, Nicolin Chen wrote:
> > 
> > > FWIW, I am thinking of another design based on Jason's remarks:
> > > https://lore.kernel.org/linux-iommu/aQBopHFub8wyQh5C@Asurada-
> > Nvidia/
> > >
> > > So, instead of core initiating the round trip between the blocking
> > > domain and group->domain, it forwards dev_reset_prepare/done to the
> > > driver where it does a low-level attachment that wouldn't fail:
> > >   For SMMUv3, it's an STE update.
> > >   For intel_iommu, it seems to be the context table update?
> > 
> > Kevin, how bad do you think the UAPI issue is if we ignore it?
> > 
> 
> yeah probably better to leave it. I didn't see a clean way and the
> value didn't justify the complexity.
> 
> Regarding to PF reset, it's a devastating operation while the vf user
> is operating the vf w/o any awareness. there must be certain
> coordination in userspace. otherwise nobody can recover the
> registers. Comparing to that, solving the domain attach problem
> is less important...

If I capture these correctly, we should go with a -EBUSY version:
 - Reject concurrent attachments during a device reset
 - Skip reset for devices having sibling group devices
 - Allow PF to stop IOMMU, ignoring VFs
?

That sounds pretty much like this v4:
https://lore.kernel.org/linux-iommu/0f6021b500c74db33af8118210dd7a2b2fd31b3c.1756682135.git.nicolinc@nvidia.com/
by dropping the SRIOV concern.

Thanks
Nicolin

