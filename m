Return-Path: <linux-arm-msm+bounces-79079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4C8C12068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 00:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 61DD14FE2E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D97333A015;
	Mon, 27 Oct 2025 23:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iBm2RB2G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9637339B2D;
	Mon, 27 Oct 2025 23:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761607400; cv=fail; b=k5Y3MhZ3BZgxSzRHnROiLfgLP5/GaQ1ffK+EAPmaeYGC5ZvdzPjFnGxyM6RJ9WzMZDGpsr0tgO679ltcpd9+EPyTVB3w4MUku1duZyN+ncIIYuz8Re+xpaPdbB6Iai5U/dhvDrLvG66rtrDxWlNOFKTnp0JiNuYNFr+lMxJb314=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761607400; c=relaxed/simple;
	bh=tT+Dj/Sr/tQSHrIJ9Fd24WqFTqx+BPMqJ6xDJof3PfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZjnmN7SWVbPEielf/VwP5QNGk5EjLjiVlo1goYF/ojijqQas9g7CDkJcnfRf66VeG6MhJNValLjsWE/rEIhcBsO1Y2FvzNFT0VO7XPDh81lgwiUxTidztIvmQdiZdTrKU4gpXqHCk+57bl0mskP7xAi13ciAyhpZxRviWJ8Hx9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iBm2RB2G; arc=fail smtp.client-ip=52.101.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVe9BwRZAETpstdKX5EbalusKxWGPnmWtxBeqWU12HGiAHkF470veQfF0ATb9ImU7oHeLN9hJbkMbXjADBW8cxTi2KtmiC/3dYfhSouGnhB2El9n5/KkbR0P9zbUWsuCWejGvpyBz5mk3tDhVZP18UL1Y3tNBaBUFvBS1gdOxo1hz0mt+1+CKQPaqiOH45Ni/2ilp3ket9Zypr3vC8Oj7CKjxOgb9sgJ3wjeJZCPo4tYcNtK97gkBv2X4MwBHhoB7287KmTyctFRNhNXNpylM8APmDVx5MBQnm9lo39r5FjYS0y0hg4GHugqYdawhOwepbzTUuuJDi58smpGv1vMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxmPkM1esLUKpXAVrIBeYbSdB6HprKR9TbpRimSmkjI=;
 b=XBA9L9DknkvnK7tYlh66M9XeBeB0XDyrwNRbqJ87yh+qM0YEJMlPJG4o6HL8ul4kTNbpliaIFvD+LhpzjnFjNL5AumM+QM1OJsDOGoqI21cOMh69lEBks5tf/omhTGFxrZQYIiIcJuacFLWQndwNZ39vsFHYIqwjZ3KAWjSu6UuRpV57IKVxkJa0en//rAAxbacFb6Pc5NjVQuO79YAJMS8jyP1yJSjOeMGzK3qSHMUCHLZcKVJiJxTz7uuG7AMAxrQHLKnfdGffRq64QySGGkWqyOrUe9a/+lYceTCodLkcPtugv5fyn96zL68FG6jdal6V4x7VXhWgFzaK30VqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxmPkM1esLUKpXAVrIBeYbSdB6HprKR9TbpRimSmkjI=;
 b=iBm2RB2GS+A5R/MrJEu7P8ykbWmInAmpVCIwxnx2G0MGkGHrw9ToRLP59dtdsDE99yEiJ323rm6vUmesQMKRXKiN3uwCBmz4zfbUr24UCpBYnbI1KwcrQzEQH4/eRRrjfeb/A4YBsMvZBejQQlDegDeE1M+u6llHJXK4nvXe0n8Oxo6q73uXrefitiee5UrlXRIaHIMjt5DnmbMI9uFMApjzYHDUNWbwupaEj/ZdFbVtzHlDpFVtmbpJU7k5R4XxUuE3N03XmG2tJpxQgcrNcVnpd+wDNSbAdFxkEIk5lTTZuDTUdbPI6K86mYaxsS+QvWYnTOyAfsD6Syk9edMkwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SN7PR12MB6791.namprd12.prod.outlook.com (2603:10b6:806:268::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Mon, 27 Oct
 2025 23:23:11 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 23:23:11 +0000
Date: Mon, 27 Oct 2025 20:23:10 -0300
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
Message-ID: <20251027232310.GD1018328@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
 <20251020162736.GW316284@nvidia.com>
 <aPaExVobV9evs22n@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPaExVobV9evs22n@Asurada-Nvidia>
X-ClientProxiedBy: MN2PR16CA0044.namprd16.prod.outlook.com
 (2603:10b6:208:234::13) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SN7PR12MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 3175e1c4-b466-4c2f-f542-08de15afcb8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8gDmXls72+i2ypvjRrbKgg4ohmd+dQwOC0z6WWWbDhwyyLUFy1ntYJA8I+8L?=
 =?us-ascii?Q?eqfMHJSNo0M/h61hNfrpbEmrr/Yk0tY06/u+3IrF3SdC9V10f82RZyQgfYrn?=
 =?us-ascii?Q?vofQ+VYOi/nbUnTQy15fRwQhyWZpQnZsHvhSMKHA+m/Bum4fexAi+3soPKi0?=
 =?us-ascii?Q?u3gTvyPtgx5IdtzQg36G0VnEinYS37gsud0uGqYRKTuzPQVNcKiTiw6+QEFx?=
 =?us-ascii?Q?CAZq+1ce0fhIvgbWVpiZXMsY4Oanos4sGnyPXxAx14XJUAIfVWfhVdbqWiAq?=
 =?us-ascii?Q?6Ss4SiALEbGMgX7AebIjVVGCOwk1ycBiQ368CJfduTPQxTSURy17FyRv1/g8?=
 =?us-ascii?Q?tFUqO3NxxcuWXSC5wwxyQp5NS71nRIxPl6dhypmumI4GuSdaGBxjdT4wzHCp?=
 =?us-ascii?Q?NGOZQ197I1xVIFnaLwBuBpWJ1xrdYTXs0Xw4uCqX/IZODZf50B+hz+AEssnC?=
 =?us-ascii?Q?s+01yalv4R9T9n4Q5P05X1203zhne/M+lzpQrn6Q9cdzQCo162L9CZUv53I9?=
 =?us-ascii?Q?cIXk4e67uYXRjnscDm8EHWWTcYBlroN07V5q5OHSfx0dBg4TXyW452Ho+GmB?=
 =?us-ascii?Q?NEkdbPkygA/HWfO9I3iKwkH7Juwe68+fbLSPuuT9WU2I+YCOxutqtyUKJJv1?=
 =?us-ascii?Q?IHyp8hugQH8pUMO64tqqupqq0kmsitLChIsnPzhSU1vCyfvQBpi/gFteouOU?=
 =?us-ascii?Q?SStAwaVyFLd4SIIsKPGqfIlxz+b4LlEGNhGlUSixXpbGt4HhruL09CgJOfeA?=
 =?us-ascii?Q?HVNixtLgaRvYj+0wCXbupP3bvmOFj9ny3jqMHUZbMfu4qNhIA992Lj409lHf?=
 =?us-ascii?Q?Hwg0UO1xbmoEaYZ+RrE0TzqAbbEpXuaJxgwQpt15E+EOFzf6uUjkAXyz+eik?=
 =?us-ascii?Q?RUJ8WjTrjOYHGTckF/0e2Ywq/I6D2cUYyMakO7JtZz3ZxUvoqkH9gRn/BWmn?=
 =?us-ascii?Q?YVUN+FR9iaJrPw/qTzva6hEEcxGTAbhxMBUWc4+vnbzPFaSUfnTegZVUcZbA?=
 =?us-ascii?Q?ShL2hYDj9DuvB1gujJrJcQIg0sar9zPd/w046BQnF8BAYTbbjyi880MCnPfz?=
 =?us-ascii?Q?xgkhiQCylgDdoMpNZ1Q+JKh2xZ8EoHUQ4jZkegW4g4uUCG3MfLL2BoI547j2?=
 =?us-ascii?Q?0fBN3RrjgUfWic8RNVmOMkwYGX3uB/kG47A40C7cML3wyDIFAhZjKEW+Spf5?=
 =?us-ascii?Q?aoze81LgzaJ6mj1rSGFMBltZQ+esh8fMcxNJTfyBMnafODQ2KQaHd6ujdzjP?=
 =?us-ascii?Q?s9mE2cvkdqaxfB0mF+RbmEOPQhIsNaUr3oVjHB52RGDV+xD38clax7sh+/0y?=
 =?us-ascii?Q?EtjqzGGLwBObU7IzJ4Pd/AXlxSBY7nK65p8i/XO7Mg92A2nuBSGmsXmpSBfS?=
 =?us-ascii?Q?0QijdgdN4cJPFirO7W3b5lhAgQfJKyDcUaHfInys0ltcrTyqFCdM1TWvTQwB?=
 =?us-ascii?Q?Co026utFhoa9fHpAHv01Mb2yUNiO/+LH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rW1ttqyORccaZGNDk/gkkDFqxJB48NzIbMcSDSY8uZsrzr0SVbUsCsUpSqFP?=
 =?us-ascii?Q?oN8Eh8KAvKYPG3mqpa9bjRoUsdramhJuw/NwqeQ8ri2sMBa3n9W2n1GF5qxQ?=
 =?us-ascii?Q?irjonpVSMO8wPcAvCaOaWuOE8uRMDk5i8ha8C7WU4Quf68WWFXp/56Z1lN2R?=
 =?us-ascii?Q?GI6hguhlC4WM4s7SNRjC73wag1nlyFkk9doDpBd2iKejTrPTspb0gwCkaBk3?=
 =?us-ascii?Q?zLZ8G0cXwum5/zdJaaeiynIIjNEJBjhBeW4aU4pzt0BW9Mv8GZggR8bvH/u9?=
 =?us-ascii?Q?/kujaT+uBGnvDHb5OUH8goXXqrKTGU4j85/SbA7sNmpVnEkUP2C6ku5uHI4S?=
 =?us-ascii?Q?stLAHj5wJgvXOdsurkzqs9gyrRtthMAnBK/6dwYQxzpkWot3fSRcfNA0R9Aq?=
 =?us-ascii?Q?/KIr8g9ZGN9PbeCBfWzZdp/o4S6AuBeGHzXKbs8TjkIf1qg6iyGKF7hkJH0u?=
 =?us-ascii?Q?CjH2RiI0d63lWz6pLHgMNeKVMGKl9Mfnm4YbtJWclu8rUrNjDavTFKeoIDFq?=
 =?us-ascii?Q?JbdmAxHT3uTKy9oeBCcrTQSuMFYshVagWdE5HOOtqGvM4h6uWYuD07SkhugU?=
 =?us-ascii?Q?DMe57zoDef/5honLba97COcvT3bp7jcFoexzU/ommg2ClJauk0ja9L41yIFB?=
 =?us-ascii?Q?HAtpXE4aEJpHXVkiXzQ09ISBfSMU11szMHpyDLAEtBhfMic5QDoMEC3EosIo?=
 =?us-ascii?Q?pl8OvVrYUP5Kbqj/4uBRnYsN41fR95eMmTUovE1VaoH7JRPXkw8j/xIn7pBQ?=
 =?us-ascii?Q?sISIaJOO8FLBp+03yMYz4swQLfh+q/8TaMwY7Cqn5UPyGMUH8vVLS9sfsSB8?=
 =?us-ascii?Q?N+ukbC64pdMuER/s8IsuZeYoGaWrPLyJJtQ3TAv+64uNftKVgF42kjiOX8eG?=
 =?us-ascii?Q?PthDsux2PXdYL+lQnSzzIWKwpDK2HG8B2Y9AXVzlcfTxsWUPJivZG+5IWNbx?=
 =?us-ascii?Q?AIZm7dT/6qYtskvQOzsQbaUqJVfBgDeeu9dnXMUtphGmhezk25qz5BamOROH?=
 =?us-ascii?Q?ovZSoaBjBAVvd/g3EFT3hTR7JJXIzMkjtXlE3xPtos0eA5ZMb03pFIPdcCYB?=
 =?us-ascii?Q?WY9JD11l0D30tE5pjksVqFtyA7pZql2VU5otjgKs0NhzI8+/Utd0damgre80?=
 =?us-ascii?Q?5J0bYS+xhTMZIFmSV94IehdRbT6U6q6thVmQnPhoEsemR96OjmzsuCOBJd75?=
 =?us-ascii?Q?AiwOogGVLqglgaPla6D86XM2zzsPhqA3VCId6pfEex5YmV44M5C2yxiThQAo?=
 =?us-ascii?Q?uzskBxEWk8GbHyJpeK/FZozDWAmZYyzqnrtiWiRgUQ4Or2Cj1HAbe5sDQfsP?=
 =?us-ascii?Q?LS/MsHUiEotDBRFlhLi2Win4gagPtO6ZJuzEbyuJcwgf1LuqK9uvPTiU5pkR?=
 =?us-ascii?Q?UMi/C7CJ5LV52cRob1Chfvl88LprW4Pl5euw18IXJW5BYI/GWJFEwc7cxZ5f?=
 =?us-ascii?Q?vsEILJf7nTBJGa9sU6CGTwfUvnOUFBwEx7WcDaVfel53MtWm0IUf4XHa+P2a?=
 =?us-ascii?Q?C6l+BBOqHA3cpfdpYP+gtjEY30zMxZbIo6gfIU1lv8MzB4bgqMz/QN6p5DEg?=
 =?us-ascii?Q?QCaWlPq0fcFh7chzMXg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3175e1c4-b466-4c2f-f542-08de15afcb8d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 23:23:11.3679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldmZvUvX82Lzvra6BBUjKqMmmpj3vJ1desPiM17tkhru7Cr8aLK/H4YhDmSaUA29
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6791

On Mon, Oct 20, 2025 at 11:51:49AM -0700, Nicolin Chen wrote:
> On Mon, Oct 20, 2025 at 01:27:36PM -0300, Jason Gunthorpe wrote:
> > On Sun, Oct 12, 2025 at 05:04:59PM -0700, Nicolin Chen wrote:
> > 
> > > And keep them within the group->mutex, so drivers can simply move all the
> > > sanity and compatibility tests from their attach_dev callbacks to the new
> > > test_dev callbacks without concerning about a race condition.
> > 
> > I'm not sure about this.. For the problem we are trying to solve this
> > would be racy as the test would be done and the group mutex
> > unlocked. Then later it will be re-tested and attached.
> 
> Oh right, we'll have to retest in iommu_dev_reset_done(). I missed
> that.
> 
> > > @@ -751,6 +760,8 @@ struct iommu_ops {
> > >   * @free: Release the domain after use.
> > >   */
> > >  struct iommu_domain_ops {
> > > +	int (*test_dev)(struct iommu_domain *domain, struct device *dev,
> > > +			ioasid_t pasid, struct iommu_domain *old);
> > 
> > Because of the starting remark I'm skeptical that old should be
> > included here.
> 
> Hmm, the followings functions sanitizes "old":
>  - qcom_iommu_identity_attach() drivers/iommu/arm/arm-smmu/qcom_iommu.c

That shouldn't be copied over to test??

        if (domain == identity_domain || !domain)
                return 0;

That is just optimizing away the attach if it has nothing to do

        qcom_domain = to_qcom_iommu_domain(domain);
        if (WARN_ON(!qcom_domain->iommu))
                return -EINVAL;

That can't never happen

>  - iommu_sva_set_dev_pasid() in drivers/iommu/amd/pasid.c

Its broken, you are not required by API to detach a domain before
setting a new one. Keep it in attach, hope someone fixes this driver
someday.

Jason

