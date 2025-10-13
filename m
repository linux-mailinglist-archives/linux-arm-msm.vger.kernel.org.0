Return-Path: <linux-arm-msm+bounces-77048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063EDBD57EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 19:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64FFE3E51FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 17:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD65D2C11C9;
	Mon, 13 Oct 2025 17:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C2apNRhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011070.outbound.protection.outlook.com [40.93.194.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0402BEC2D;
	Mon, 13 Oct 2025 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376164; cv=fail; b=k+C+KQLjVskbPLvuoaZmZ3clrcBElFj1o5NisiN6oxIPSSACC+l5oHxFIc5KbChV9uw9d0wSNYIZWDU6C1L/Qn3fykp4ijl8kGNN+98PJRnmerEysbPc2dwtY6ywUHGj+GWYR7ArBc7aKywBi8YaqvcVjquMfrUjCvkR+Y0y+yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376164; c=relaxed/simple;
	bh=6HQoSfPtI1Omj6YkmJylAZH+2X+HOuNxu7BPdXTXQHQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTEecXoBc9Yharskct1A8YgAxB8k7UbBccJU+XFiNYwGwEBGKPvsDDpijXp9vMBddzLwn6W5btF/atbzxWL6MCGu28/PTtIPXnodLjJPoqDXTz3GLMd1836YshcUCgboILtZpQ4vMuAUcOaYtpRF3i8Y+CrVJjh6JNonhTEhgDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C2apNRhK; arc=fail smtp.client-ip=40.93.194.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQbWXPMxF70GMbNGkKtmXEomexWZMakrAC01ozDNEvRmnp5m00HEOwVP6zHo0qyVrwECSftyR86slsB2t1xVECxuQdvTVwx4p7f3MQAIs5W+JvSw59jkaiTPTUGYg4oH04ARaVZfG+yEXo+J7Ph6AD7FRfRt5lRWANUrp1qdBIGKGAwm5jGqnqFkK+NIq0bsQIo8I4eF+WIVzp57LV04LKKeb+rlVA0IsCfo2hfWbuoEoYyeotV7qtiw15q3oSKnsRZGaChwwdvX+mnIIesruX3BITABiM5+KkgBOrD6mcwGdAE+loVey5aS610pBN74qUk4AOjcB+mT/jpY1O7Ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBFzFjM744pvcWKfxcWjcYGUSZzANLCdtx3flHgof18=;
 b=NnRLPJRp6d1GMRUODmZE8Ilh1wOVO8rRpniAWJKNAppKuwze0PZS7jb7a8wIII858b5s9uM8pvfws3wj3/okW6asOaCBWcWR4A0D9HeHXwtLEU6xS+eX+qoIIRocGQOSOLBUtJbAP3zWJdGaKbjYg0XvqocL1YztJt40UwPno0ThwQ8eYQy91N1eZTms1sFXVheIy18EMLdq/5kDjMPC8ds/iGB3MDnMzBdxwVXnqkp62SGiKcIx2268C4OxQIf5DbzxgSE0h18wxKX2VEpbjqMYcLEvPHnGzLPG+b5UFCBxZrZCJanaLUYxNvWHGmxSXL4j38U+WEV9EzZ6bj521g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBFzFjM744pvcWKfxcWjcYGUSZzANLCdtx3flHgof18=;
 b=C2apNRhKsmlm4qx8wdkksIPbzZMVvf+2XYn0ktbJDOzXy2f/hOSUM90QQThMqX0UQg4F+LlV7ijWOBX2Oi99e7jf4NNBZIyn/w9N4PhhrMuEM8NEG/27YVglLYpFMu5SVmgN/H1Y2JIhqHCP+9wn3nNiI7b7hdlp1lIz8ovLziaasSyLVSWtrAdAjdW6S+u87ETGglPpke7yXWxmMcGTynf+4es4vmBl4Al9z853NY62zt4U+w6zu7froJOCNLfr6t2rLNeelysE/H8y1eu8m2c8f0H+ECGz3pI6GSSK4TteYpw1ybmGt8GE/Hkec6exMl7JetUY+mDzNLt5CtJKDQ==
Received: from MW4PR04CA0210.namprd04.prod.outlook.com (2603:10b6:303:86::35)
 by DM4PR12MB6255.namprd12.prod.outlook.com (2603:10b6:8:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 17:22:37 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:303:86:cafe::98) by MW4PR04CA0210.outlook.office365.com
 (2603:10b6:303:86::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 17:22:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 17:22:37 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 13 Oct
 2025 10:22:26 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 10:22:26 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 10:22:23 -0700
Date: Mon, 13 Oct 2025 10:22:22 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
CC: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>,
	<suravee.suthikulpanit@amd.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<sven@kernel.org>, <j@jannau.net>, <jean-philippe@linaro.org>,
	<robin.clark@oss.qualcomm.com>, <dwmw2@infradead.org>,
	<baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <tjeznach@rivosinc.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <mjrosato@linux.ibm.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
	<virtualization@lists.linux.dev>, <patches@lists.linux.dev>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Message-ID: <aO01TkkA7ZLDgqXg@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
 <5165448792268e184e508a9c76fa0ce382a4a389.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5165448792268e184e508a9c76fa0ce382a4a389.camel@linux.ibm.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DM4PR12MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 5910ceb6-b4c9-41ce-87e1-08de0a7d1b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjZ4ZlRtT3hzakljbjVxWDlNZGtUTFVTVmtKWkdiVEtUcTJwZ2d2dGpTejIw?=
 =?utf-8?B?QWZ5UlJyZlNwNXNDT2dzUDVIZ0tXY0RKdkZielEwU1pnenFtTnZodWNxcHJ6?=
 =?utf-8?B?WmtMNTYvRzNNWWNzR1pKQm9aQjFmSVlTVXd2K1Eza0NMcjcrenFxLy8xTkky?=
 =?utf-8?B?SC94TzZ3UytPZXVCVVlIa3FXcWdOM0Z5VW1wQThaWTlqVzFVS2E3RjBjR1U1?=
 =?utf-8?B?aWV1YmdMT2RYWGQrZ2NZeXdONFdncldyUXJWWXNtU2Z5RmZzNTVpaDViN3Nz?=
 =?utf-8?B?ZUZ5S041YzAvMmRidGZpbGo0SXUwSlRxSytHR0hGN0ZqTERqbzZmOWNyQnFk?=
 =?utf-8?B?YitMUldWa1A1TTZVM2VWMjNBTzJ6UXhSN1hyRDNZZnRzcFd4SDdldWF6WHdX?=
 =?utf-8?B?K3pTY1NENk5KMEtXMG0zdmRQaG1PUUpPRm5XWGFYUmFwSGY3YkRiNWw2bEhN?=
 =?utf-8?B?RnB5ejFpWFVGbWg0STRrQ203T2U5TURvaTRuM1k3V29HYW5EM2xlL2srLzlD?=
 =?utf-8?B?dWkyN2J0WThKSFV1Y1dHQlhLNk05dnFYQ3VFWUFuRmVVUGdTUFU5RmF1SUhj?=
 =?utf-8?B?ZHJrL3RoeEZCSkU1eW9aRkxkZU82YmdnQ1AwMU5MdlhEQWRLeE5sOVdPaXdS?=
 =?utf-8?B?azBEcGNkUU9XQ0tVcGpMcGlnNWRqRVl3RksraUhwbittYmYrMkFrVjQ4cEx6?=
 =?utf-8?B?WSsrSkhwcTBCQkpYMTNWWGwwQkRCejBtalFoaThWK3ZwQlM0VHpoR05CQ0J2?=
 =?utf-8?B?Snl4cTRtS2FGaCt5UDFZYXBjN0gza2d5YS9INFB2L1I0TG0wSUVnMXYvOW12?=
 =?utf-8?B?R3ZENzluVWpQU1NDZEtzSkFoVFVNVDlITjc1OTlRNEliTGU0S2V2NTQ3bVhI?=
 =?utf-8?B?eFhpRHJLVm1qUHZoZitEL25aWlNhOURWbFVsOElPRDRWalY1aTZzb1pIdk11?=
 =?utf-8?B?M3BxYVhkdVJHN016L2tHeGhOdDlZdUlCWjBheDV2TFNNZ0Faa1A3V2UrOXlM?=
 =?utf-8?B?aUljKzFGVHVCcld5ZWhkdlhIby9sT0d6VjBvQVFVZ2w4S2VNUG5zaGhlRTM4?=
 =?utf-8?B?cG5xVFVMN3N5elBtV2w5N3NDTVhxQVNBLzU4Y3lDNkhWMlB4eTZwSzBlS3dW?=
 =?utf-8?B?UlNFTWJuQndhTlZ1Q0VYOWJLcDZBQms3M29GdmRNRVBUUE0vbVFJNmQ3VEpw?=
 =?utf-8?B?dUIyb3lCUU4zVDZMSWREZVN3WjR3UXpTZFBEVGtGRUFUWFM5UkV2Nk4yemow?=
 =?utf-8?B?MEV6WVpkTVg5NXgvUDdiRnpOR1BKNkVtWGxuNGNoTEVXTlp6MW92bGJZZ1Uv?=
 =?utf-8?B?UThham04ZFNWdzV5bWlJVDlLN1hwMXpybzQ3MG1IUjVNcHZ3RW9GalBmMkZ5?=
 =?utf-8?B?QzkxVitwSnNoL01neFh1QktYZGVVdno2TW95K0Rvd1dIRGJTTGx2MGpCa2hx?=
 =?utf-8?B?RDd1cmFlU3BieHFQQUpEQS9iNGlGQ3h2Nk1kcXJEaG1mVEJCZjhhb3RJU3Iz?=
 =?utf-8?B?M01NUU5zS2Rqc0J4dm9vT1NDT3NkL1F2aEJtZWRac1pKWVAwTE5qOEQ4MzA2?=
 =?utf-8?B?VnlyNS9lSzRicDRhN0dSZGNXV3Q0eFpRSzNxNkFsMFl1c0hycDFWTURDM1pO?=
 =?utf-8?B?eGV1MG9HVCtzZCtIaVNROFQ5OHFHQlFINHVTNHhNZTlDb0ZFUlIxTWZaR0s0?=
 =?utf-8?B?M05mTUJFSUk0cW4yV08zRWZjSFhhK2tUY3NXWXJLeU5LbE1NSldPK2Jwcmhh?=
 =?utf-8?B?d09rZjcrM1hGWjRCL3c2dlZ5a1ZvRXZPUUFZNlNoU0wyd0pnc2xucmtnQU96?=
 =?utf-8?B?dWUxdFU2RFkwdWx4Z0pHUXhZb0pXOFhvM2FvcWc1cGRFYnNpTWpJTGJjK3Yw?=
 =?utf-8?B?c3JwNFRialRaTVc1QnRCaVBCenhXUUtPV1ZxeXJBNWtBYWJtMzJFcHF5WmNZ?=
 =?utf-8?B?ZnJmSisxdWxZS2I0Z2tRL1JYK2VDMjFXM1FFMFc4TW9IYWlsb0ZXL0FBSTY0?=
 =?utf-8?B?YllmaTcyQk1LZlRhYXJwUFFtVDQzdUcxcDllTVJJVDNIWThwcnNPSGVuWTIz?=
 =?utf-8?B?WlM2Y0tDVDRvNGF3T2lMdmZnRk50UE9TeEhpZzlHRXIrK1pNQUNjSVJ5c0to?=
 =?utf-8?Q?6Uzk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 17:22:37.3033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5910ceb6-b4c9-41ce-87e1-08de0a7d1b0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6255

Hi Niklas,

On Mon, Oct 13, 2025 at 11:53:55AM +0200, Niklas Schnelle wrote:
> On Sun, 2025-10-12 at 17:04 -0700, Nicolin Chen wrote:
> > Add a new test_dev domain op for driver to test the compatibility between
> > a domain and a device at the driver level, before calling into the actual
> > attachment/replacement of a domain. Support pasid for set_dev_pasid call.
> > 
> > Move existing core-level compatibility tests to a helper function. Invoke
> > it prior to:
> >  * __iommu_attach_device() or its wrapper __iommu_device_set_domain()
> >  * __iommu_set_group_pasid()
> 
> Should this list also include iommu_deferred_attach()? The code does
> include it.

iommu_deferred_attach() invokes __iommu_attach_device(), so it is
already included in the list :)

> >  /**
> >   * struct iommu_domain_ops - domain specific operations
> > - * @attach_dev: attach an iommu domain to a device
> > + * @test_dev: Test compatibility prior to an @attach_dev or @set_dev_pasid call.
> > + *            A driver-level callback of this op should do a thorough sanity, to
> 
> You're missing the word "check" above.

Ack.

> > + *            make sure a device is compatible with the domain. So the following
> > + *            @attach_dev and @set_dev_pasid functions would likely succeed with
> > + *            only one exception due to a temporary failure like out of memory.
> 
> Nit: "… only one exception …" / "… like out of memory …" this sounds a
> bit odd to me because on the one hand it's one exception but then also
> a group (temporary failures).
> 
> Maybe better:
> "… would likely succeed with only the exception of temporary failures
> like out of memory."?

Sure. I can do that. Fixing both parts, it would be:

 * @test_dev: Test compatibility prior to an @attach_dev or @set_dev_pasid call.
 *            A driver callback of this op should do a thorough sanity check, to
 *            make sure a device is compatible with the domain, so the following
 *            @attach_dev and @set_dev_pasid functions would likely succeed with
 *            only the exception of temporary failures like out of memory.

> --- snip ---
> > @@ -3615,6 +3657,11 @@ int iommu_replace_device_pasid(struct iommu_domain *domain,
> >  	ret = 0;
> >  
> >  	if (curr_domain != domain) {
> > +		ret = __iommu_domain_test_device(domain, dev, pasid,
> > +						 curr_domain);
> > +		if (ret)
> > +			goto out_unlock;
> > +
> >  		ret = __iommu_set_group_pasid(domain, group,
> >  					      pasid, curr_domain);
> >  		if (ret)
> 
> Apart from the comment and commit description nits mentioned above this
> looks good to me.
> 
> Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks for the review!
Nicolin

