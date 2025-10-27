Return-Path: <linux-arm-msm+bounces-79080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE59C120F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 00:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B4AA58622B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105C53314DD;
	Mon, 27 Oct 2025 23:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lbbsG0eL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013007.outbound.protection.outlook.com [40.93.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C92232E124;
	Mon, 27 Oct 2025 23:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761607611; cv=fail; b=LDE2LIDGP4Fp07hR1OStEvbJUVhn9f2xcpiHX8P0TkZlztdRRMIq2alwqn66CLwpiTSScsp6wh8MCJ+1SRY9XEzy9xZjbSQIOXVGJF4fuTvx5A3crrAgar+x9NM/gPZdrDCBzdkQCQs75XwKB8wGujYURzME4hKFYNC0TQgHsqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761607611; c=relaxed/simple;
	bh=o+ii9tBsf7amZgKWCTCLlW91sfViDfSss/x7ohQVrBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AcCECMRiUKUX2LXFGKLEmYxw4XMb0kcf377/ymjnYrej+FqOinU/Zn3RMot4QH/KjBV+i4uQys1To4yOMFeSAqTOpZOUKx324lFOX5iNgWtvXTGuzLXzFESkem1n27mgPuBYoFwd6Rtrmbw+BI8B1sF595z6Dlelq5eie8mwb2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lbbsG0eL; arc=fail smtp.client-ip=40.93.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/S2KiMk9FPZwoDyDEbICzOjPQaXf732TJpXIs7eVqvR0baFHjpQCAQLGp1TP/pkgx3vpDNTgR9+Z0X4WLrevqCPEibdKrQ/EbFog4WpASjTMNqPTE2gjTeYOAmOoVeXMWcCJVJPs1xWn8HgSiyizDm+dqhoqAbsPlj7/iHc2lOREuE6LLcfUNLu+ufVhwv7V0Mp9xB6XSRQDDpbqAOkwBf+qY1BQCAih1d++SghJvyvyf2GjjvsGrBXnYB3HJfGVYEK0+614KocsnOdkKYFukLS9+19MaE1BDNw7WzCTLOuC4aFJSeuzUjXboUo/GoyEIGijlIZ4xVDCimS/V04yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx7BUMBHnYmfmeqjkgLxcm2+ZpM3DfyTQljjnYSuyrM=;
 b=ToBjWBKTaWXSuLqgwpbAuGBSURB/sVJwJ7IfuJNWgJENHidfOhH3WyunLxLw9hlzI/XKcNhfTsUMmuMxKq8oBbAWVwKYm8LhgS+Yjib0u69n41/C+2+g1dUodvlWyrE3AUe9ymfv+xY1G2s7KvSfb9j4RdTvaoLJpzeOf5l3DyOaMWtAQOe56MIq7gB9GhgGBSxeYDqAXygCeiamWSf8Ivw/faW4WZnn+yXLAmclulPxOqpZ2qNsqZ8gTK4MP7JykqMuunNRnlFkB1FhSIQI/f0ql3qR6KaRQ4wX86dM/B0K/inLvd2Ym5L6PKIZqlXiEx2R7LUHHhhdJJnGEaEeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx7BUMBHnYmfmeqjkgLxcm2+ZpM3DfyTQljjnYSuyrM=;
 b=lbbsG0eLfGdRhdSdREtblJl7xUVs/fr46qiaiM3A5jlHZZQkDAmk4L62HhIXnryD9jvQBlKAIswAPcG6mTXjUBwKAOBsLFFRX3ejX0vjM2gloHWy/VgCBuRqjmXde4QvNkJHSfI7eD8kgXjiVRUli6I25QGjY+1mw4JDpmzN+aK163t21pA7pmbpg7rWtOecXM9SaCsoP2P9/HTERd08EQpfTJK7WOlP53HEpMlG9rBeCQYs4np02N0pqBgc45fZVFU+ggOMuzULXlm2t/rVSxIwujl9O18qQ59GHfWgCIBZ4LEFar/h7ih3NsiSM6tahjCwZa6MvPXpB17H7IIp2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SN7PR12MB6791.namprd12.prod.outlook.com (2603:10b6:806:268::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Mon, 27 Oct
 2025 23:26:41 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 23:26:41 +0000
Date: Mon, 27 Oct 2025 20:26:40 -0300
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
Message-ID: <20251027232640.GE1018328@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <f52e8079148a673641d2858700c49fa0c81022aa.1760312725.git.nicolinc@nvidia.com>
 <20251020163231.GX316284@nvidia.com>
 <aPaWsEg1Y3XqsA3E@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPaWsEg1Y3XqsA3E@Asurada-Nvidia>
X-ClientProxiedBy: MN2PR01CA0049.prod.exchangelabs.com (2603:10b6:208:23f::18)
 To MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SN7PR12MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d6454cd-481c-4edc-ba5b-08de15b048af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KYIr0W99nu7jT8pnol/aQsy6rRlolAzh6rp4ejtemDxSkQj0Oab7vcwJF3nF?=
 =?us-ascii?Q?/pmps/1fTrKl0OQCkI4g7feku1jews9DoVidmiNVmuSQYJDTCfZag83zFGqb?=
 =?us-ascii?Q?UaDBlr1z+4k6JteM1+CBaVpcS8GVvlrgfBRTbezfcLt4nWXlBqlhqHSwq4oF?=
 =?us-ascii?Q?7lqBHYbmrSGXLd6l0ZrifZ5cMw9CppMZHLhjiECtrW5WhWRnSSzG1dNcw2RE?=
 =?us-ascii?Q?TujflS6EKrchfu+4ylM/Skw0juKwbvolsOSTEeUuPYiFVvuGvUCiTJoJyzOi?=
 =?us-ascii?Q?Qjad9NxxDztGiKrt1siGCQ2eWbruPstyNd5U3yqBkCgF880C+4zzeAjoKLdA?=
 =?us-ascii?Q?/mofGtibK6TMbVo/SnbLBe9EzkfiIVTWFIBBdj4iZvXILijpWe3RifI9888l?=
 =?us-ascii?Q?fz+/IYvAwvgVlM/zbazJcDd6o4y5P+3jVhopG5+OCrzUtLjwsM4HlQympNy/?=
 =?us-ascii?Q?jaBqnvrLLXyJ4CPPQVyC9hGCl0xC1d56eCte5k7Ve1iW3f+CcofMPN4r6fe6?=
 =?us-ascii?Q?BPnHaln4bkyLTnDlCoejcNhbktwPlRDl5O7EzVoEBsl0i65F893peJJXERur?=
 =?us-ascii?Q?936DO6sg0kXiwaTj1W6uwSXOED3ow64Y1lFeqHC7eeHuQ9ajzUsex/F3Bfz9?=
 =?us-ascii?Q?m9GlasYUPDx4e8AXA0BYhxwaZo60rpJhlYRQ+B9FMrNFZ3qn3MYf9FnJrLER?=
 =?us-ascii?Q?ta1ximCGlmNkkjzS+Y/fsqPtTkvV4RdTqA/QBh8U0sqIeHYeX1etVyimOp10?=
 =?us-ascii?Q?KlvubpB0AzIbfQ1vNZ/Zo8qop1Me/m3497kiSUpUOpX/0T2gZSfd81lklOfz?=
 =?us-ascii?Q?cQEqQzBChhx5WdZtXwnM0R7P1PG+1RsnjpYKI7CwYt2XjnbGiC/iTl11iXLc?=
 =?us-ascii?Q?qX5Brn13nNxMcZ7VN/GVUa8HMKMidelqpwg71j0yiSMrtsblJspwm5zLAcMN?=
 =?us-ascii?Q?3W8zZMAIJhR8Uem5twr2qDI0nnXtUUYMhLE5A/eK4TIZbeVuP8t1punlaVVv?=
 =?us-ascii?Q?FikWu/cmn1+g95laHdj3ITi2eEXu3SVc9wAyU6MEcSSaJ6vrCJO4+mo93qCd?=
 =?us-ascii?Q?sY72J4BMYYN8vHvnjIVapjcuzd7ZfeORGGTqwD7NJQ8jomykyHRSchOx1rOe?=
 =?us-ascii?Q?JwvHrmlHNplinEIL2vaPkotJup7Ufmo65vfLecBxzBmBrVM6unlM4C5ZXRQu?=
 =?us-ascii?Q?abba8R1bwg16Bq0m1Yu9D4lyZaT9kEgeiYrb02MIoC+J5Chop7U9PUtjX8OZ?=
 =?us-ascii?Q?ljNbqZpTdzddHnS2ATV1t7hCH11aEZ0mPUPfJMi8Ka+oRVCJxeNTst+IMDdg?=
 =?us-ascii?Q?8NNg0GGqx6xvTugfzLT3e32+Idfu0Nz01ynRYPtm2KmV07ZYmOtwApTUAqPz?=
 =?us-ascii?Q?OHAVP+u1Ef4HVlLaUQLD3XGy5r6LkWeo/rp7QrF/7RSs1+hvcWrsfEY7AvHj?=
 =?us-ascii?Q?iqAesM2uxQRQQdmYleb2zkA0elPG/fQ/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MdrKUo1VRvzK62ai/Ce5i3rd/ggQghPW5IwFzh3JwTRyJLj51LXcbE1qm6DG?=
 =?us-ascii?Q?qoVwazo/PqKA53fFRKSAydecMrOID5xwSQwPsJqHaJGcDsrdQRb2lLIMW6VU?=
 =?us-ascii?Q?ikhfwen91iyI2lRgjkuMD+hP5O1uNqgMBGW2hOcz/a/zWDDofsNr6Dj11IJG?=
 =?us-ascii?Q?80laEhLFU1euloFOzQQyC2TORVEwDRqDVKbv2eyzsqQSSmiD8CbJnxrxiqQp?=
 =?us-ascii?Q?qDwol+CUhrjWszpLN6IPnBsS6DhLYE43XVkV+VHQv28NBbYAgTiA0uBIiNWe?=
 =?us-ascii?Q?TYLolxNZMSmqO102TUi+h35U1ycBba9blzm+7qLEc9x9sulJQKHZZN5oN0sk?=
 =?us-ascii?Q?NZyWa8tqqCiYaLSm1+cjnuubrIvK5t9XEqhavO/Vd0V/Aw7t7Ef/E4fb6+w+?=
 =?us-ascii?Q?hHaO4ffA9UQvdT/8Qcm7pLbud8sGqBbmt+FTVKvSlDR34SVshnvUnO822v2+?=
 =?us-ascii?Q?nlwz/hYGzOD83dJm235aE1bTEBrguXRsgnRJwy+mDZ6gwcHiNSo+uaxdcYo4?=
 =?us-ascii?Q?OxuQS7vTNbTkgER+M09TjHQgL7K4idKlT2k1ELgbSuyPq+LwYvQfHAqPgX46?=
 =?us-ascii?Q?I3joIGtsl31ej4xFRswRPI6ouV4P04VkrT+vNWt0Zwrnuoo18YukjPoSZxKS?=
 =?us-ascii?Q?IAmpxKsMl8NdqMDBuXTDVqk6GNOw42YWcNWIK67lVlAGHRq85j1ygGgGkVZ8?=
 =?us-ascii?Q?dTiFa7DYGfmQ/GGI70mgL7RBvxr0AMSlzHG0rFx8ol4joPiBeUp+coaMJh2m?=
 =?us-ascii?Q?Q890+lTdYuY9FQRzg61L28FwO90Ph/QeGNO+UJKOetBu0ZpXCytKQdqRlWdE?=
 =?us-ascii?Q?5YK1BsF49FnUjRrHkZeq0pYzdzTt/pox63N23huoJ2MpjXt7ms66GLGo5bM9?=
 =?us-ascii?Q?YZ4CAGmOt5WcbaHIcMv8mEZcsMRMlxMAIqK4tVynFENlnDktTpJhSkNOTLVA?=
 =?us-ascii?Q?xpvgTpImdqhQe4FY5sIAw9Izr2VpnSEotoMkd9vS82mjlTIEY0hWlP21pTw6?=
 =?us-ascii?Q?+tEHo+6sFdRcZVKyuAYdziVsuK93do2slGOYijf3Pw4+W4gT+xxih/lY1sXl?=
 =?us-ascii?Q?ZfThhgFB8k+YQt+pJpYO5yY5jFybePzdfn+pHFLK0n5zanMYc+DYPlIxm2xB?=
 =?us-ascii?Q?hkLpOUzkj+ERsy71elxD3NgvO5QW54XDRZxoy3CuXo8EIiDHt7iuJgF31r0L?=
 =?us-ascii?Q?p+4Xard/7ipqDR0ujMKGI2y+ifuCvNt5nmCq0ibqk8sZXli0SZkVYNLZ/efy?=
 =?us-ascii?Q?Fop/RLYUMvske19LLPzC/xVYVk5s7LuU99JAccNCB057r3xHzEYPI2+FFxRv?=
 =?us-ascii?Q?EA6JrtmGCQfKWCd49IzPa+8o5EyjY8gZ6XCIu1tJtBPdktCV9efhmPzp82Dv?=
 =?us-ascii?Q?4IAvIqqVq12Yg+sunNZBc3QfBXdK/aiEaOoxRuoS2Fce7c8ggV7SbCL/yLeZ?=
 =?us-ascii?Q?BW1f+9GUaQlgF8AuY6hlsMIdI+LiSZ7UbzH9SpLm6rGCRqVaFEJVxluIcc4o?=
 =?us-ascii?Q?3pZotqaKg9Jm+RqASe2dq6+g5WTDmbIHsz9PpPMLD4o7A3SWV6LRS+zI/Y0B?=
 =?us-ascii?Q?HMumaGqdCHK0ZbBygN8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6454cd-481c-4edc-ba5b-08de15b048af
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 23:26:41.3272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gb50Z1dqxSylnIaT5cxXN938vYkZ2jSHVc1zxEWuhYypV5RUfbPszxmS8O59p4Uy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6791

On Mon, Oct 20, 2025 at 01:08:16PM -0700, Nicolin Chen wrote:

> > I don't see any reasonable way to mitigate this??
> 
> Right. It can't simply go through a regular attach_dev call since
> driver wouldn't expect any inconsistency in the core.
> 
> Driver would have to be aware of the reset state, and make a copy
> of the old domain's CD/STE to use for a test_dev() during a reset.

It seems convoluted :\

IDK if you want to do that some kind of "attach but really don't" flag
so all the tracking was kept, just the STE was forced to blocking.

Then since all the fake attaches are tracked and validated switching
to a real ste shouldn't fail.

For instance SMMU could continue to build the CD table and act like
the CD is active, but the STE wouldn't point to it.

Basically, this approach doesn't seem to solve all the problems, it
reduces them sure, but there are still enough gaps.

So I think we either have to live with them and call it a user bug to
change the domain improperly during FLR.. If it happens dump the
translation into blocking and move on..

Or we have to do some kind of fake attach tracking which doesn't sound
appealing..

Jason

