Return-Path: <linux-arm-msm+bounces-80812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2191CC415EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 20:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C6DA4EE5B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 19:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5018E33E34D;
	Fri,  7 Nov 2025 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FHpEME00"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49B33396FA;
	Fri,  7 Nov 2025 18:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762541965; cv=fail; b=HWgNtwnlgIDdw9KiRXFStir1qringJ8BwpxsoE8/kpR5m5soy088hbFIKWJWy7tqHHBNenHV9udXe68qcQW9FfJoMlQiwS6sHii7khU9cT6UnqueeBAzxuvlD7LKeeQP3Nx8LQWZXJvM+1YEycDuzkeoHtNEBofQDMoxODkcY8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762541965; c=relaxed/simple;
	bh=kWaNm1SEC9aKdLe8HW7gfDX2t74ijpD+Db9WzSXW63Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/wOvrw8/PQuAiwajmYGPxioJKwawVSxFb1cOODOUybSi4WtMV5YAKWT0U2WbbduKhErIMR6G1VG3euPZa7MTudKqhrmfM2t7Os0sUlRZdUUHE6apVY5YAQ2t5XRnfWXw+eTQ0/VARdH7tDC3WvaZc2GuD++SevZK/GX1r3eHZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FHpEME00; arc=fail smtp.client-ip=52.101.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDnthst8Um+m8gDO0I1kfXr2I526XjXv6OSd26XYYwzVyhGLTK3f1WiRMtN3p/VdV2iEjPJTvFFSeEJk8MWRZ6no39+MJEYRJKGNYE/twAKYS66mbPD4CZp7VAyb8zSiykeU/3NqSG8A5LbX/G9fBkPJCueNmtFDkNgEk0RqrFZPAFOZWPkgNWqO7lLrrN4IRX4HcV9ZHWpfQPuG3PqCnaK31EPSRsZT7F34u65XDu6Tm2eyKpI6+ewwZRH9ctlJVuD3gjSvIHfa+NseLH0uyyWQ3f/n9Q0RT45lHlqHt+9DyKk/SV1P1qFcIdw/qnSMxWboxtZ+VVBBJ1YUGpWuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/CqcIEtH3a6mpjanHTrhl5/5mqZeanCekUhNOaJgjc=;
 b=CiOxsXUS1HnRSv8trBXQUDPSQHaEcI4FxxY+bOAvK8PxIxoTVeyTAQDiojEc3qy9BRXp9eopt5er0E70sTLSSh+H6yztqp9xC2ywXFPrSkT4W8vOLN83caigr+TBDUgrC/sTXAXeFTVUzLgnblfgxbHFGSAAkDtBWhO8yj0bdwS0icSiLeR66RS5ZRe4p+pFgDxBEgFGRQZHxkhLZil1L7b6mcnPWY0WLhwC+Tr30AXDWEmaQcjpzW+NJ90zmDAX/N2CWAdEcXOgi3p0c4AKsc7z3zCAL2k2oCpPuX0yQX1k1xFw2bd2I0lC+asWlFQifeiH0uJhBAHd0j10kYAavw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=csie.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/CqcIEtH3a6mpjanHTrhl5/5mqZeanCekUhNOaJgjc=;
 b=FHpEME00nd6CEZbzmibUkTviaETZOgMEaLAqDAq8P0QyVCObK0hBjk9/d9JsuiFbzSIuZzW3P2YcWpYGWEDo9Z1BHNkUAzpFrZJtlk/zibrGdORFMBQfOrrE3OSFD2rF7DAvz2Zz1t7YKKI7Mc1bQPq50jxO/GG5LULm7QNLR4VJ7B+urXhgt69kAy8I0c6vdgIuyBElc1mZmyk9AwieLDOkOKZF2vmKN4WAeEEEBDzWUwD4rmNF7so2s07q+UczaaKKS7erOUbrp4A4W6gpiiMaSRAIH9AAJP1HGpxQH5mNPEohqmMxDqZGaouk5SEcoRZMagVk65H3tY3pZ44MrA==
Received: from BN9PR03CA0031.namprd03.prod.outlook.com (2603:10b6:408:fb::6)
 by CH3PR12MB9147.namprd12.prod.outlook.com (2603:10b6:610:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 18:59:16 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::8b) by BN9PR03CA0031.outlook.office365.com
 (2603:10b6:408:fb::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Fri, 7
 Nov 2025 18:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 18:59:14 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 10:59:00 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 10:58:59 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 10:58:57 -0800
Date: Fri, 7 Nov 2025 10:58:56 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "Tian, Kevin" <kevin.tian@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
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
Message-ID: <aQ5BcKLR1YzRggGo@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
 <BN9PR11MB5276D10BD480FE66881870B08CFBA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aQO//+6/B/WbdK2h@Asurada-Nvidia>
 <20251103185400.GA1537560@nvidia.com>
 <BN9PR11MB527638C0E43E8AA000410B878CC5A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aQuU2dic75VkSyjr@Asurada-Nvidia>
 <20251107185409.GA1932966@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251107185409.GA1932966@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|CH3PR12MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: ec991946-88f8-4851-745c-08de1e2fbeaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XYZ4AqT2Jncw+SLim9eN/0vL0+UthlAs2AZnerz3Wyij4qNbB2wkH8NiOQa5?=
 =?us-ascii?Q?TC+YythVHBvJefhy4kdJ1bVGDC3iO9VeqcE6FUckmCjmPKGHWkMcd0AuhNNF?=
 =?us-ascii?Q?8c5/uNz8h+vYycryibPGR8Qc96To+HQE17+QzKTf+Ha8Oi0QIc0xOe7dNyul?=
 =?us-ascii?Q?9sUMrXyWm5Qz4E6Ns8T74nDoU2vZ/bkRAKYwoDF4JYhPbbgofeMui30Z5Sq/?=
 =?us-ascii?Q?gcRDciXr/7y5dhi1wlUjSP0x9wcXwJLoNTmOBbyy8s8KNy4SYnQ701NF8Uui?=
 =?us-ascii?Q?R+ZQzGTNQ/1eiT5hUBflNDj5mM1HN+RM1Oo9K38TkT+3XAkumfAzxY6Dl5hN?=
 =?us-ascii?Q?/2Cswy/TUTleRdZR9qlL1Evvhu8DfosCX9n4JfjMUyrF6lNjdKf9jJzK+6Vo?=
 =?us-ascii?Q?QWsUl89D4Tpgb0Rtboa89UG4q5EwQW5AlqSV9c/n6kQ1CZMuZ0H54Fv3vD9Y?=
 =?us-ascii?Q?+dDF2yS0cXaTjlbMqq5KWXh4e4DnHXCoknmke+85UelpiCG98YC48bCEwIFC?=
 =?us-ascii?Q?7PoANUC2Ou3DXvwVx91jnk0tL9S8xQd1z3UVlIC0MZMQ3KNc2Up9Q/D7AqXZ?=
 =?us-ascii?Q?l8COggEMYqlJmL/NIyc+XgNeIyPWv1lNYW8EKgw9Q8uHtdKx/zxGSGpq1B9h?=
 =?us-ascii?Q?kQ85RxZpGSd9ClTbye92Y3aT2XQqgFfafAW11Aq3/DddESLZjO78apnU9zbI?=
 =?us-ascii?Q?LX+iRzW/WLreR1eGtv/87d59HALYEIxeRW03dDbmWEquGTOFuaEG3QuVfqh5?=
 =?us-ascii?Q?CACSkPBvqdR2osR3LNjf3ZlJGj4TFetpdRRm+Uvdy0qUuw2XrdnDMVnrQE1g?=
 =?us-ascii?Q?MnBRTAtU0cx4be+I4e+uui0dj3gaSyNHB60Za8JTLVdikVcZkCVFMtbIcBc7?=
 =?us-ascii?Q?IHMTLaoaKAQc3H1LszBN/Mr6AicrxRINU85JhyNVWcepzfNzvUhgS7zTFQUF?=
 =?us-ascii?Q?lJLDQio8iQAgscHR/xo71bXG/91ND7ATe4zm+6O9I/o0YTrhDedLYTYQM/hM?=
 =?us-ascii?Q?IJigLonZaEh229s7xHtV5TiZ9HQTPlV5KSQC7sv68haYZEsO4d9duWevdwNj?=
 =?us-ascii?Q?Jz49RoxIAWuofwg5T87CNbyyMM6pEoP2+lcKNXPYnpM5JrKZf6tiQ5s+9N+f?=
 =?us-ascii?Q?I6xluPaw+iiz5bQ2wKeK731dWNSgKl44Ccx96ecimW3snk5Vv//g9A7lfLOA?=
 =?us-ascii?Q?B5SnZ/sv2FlIfOsxDyc0IQqpIZXFpMJT7Kv9He/wh5pALkugyhrrH5N9Zv1l?=
 =?us-ascii?Q?nnX8uswkt0zMXlMTQMWjkDXMmvCKbhOx3RTarkYP8zVOuj85BDaAsieEPm8+?=
 =?us-ascii?Q?qLpMlx1GOn+YlYGuzN0fUfTL0Ccfy+Kgf345X2ixOHkSVh26inT73O7crWqF?=
 =?us-ascii?Q?C7SuXYw6Rag++3wfDBGLgxdUVyW0qTIdYreVDFO1AH2l9GVyffWIE3aBh1mh?=
 =?us-ascii?Q?h5Ryd2LrgHyzFuYOs05A6hsSyXeqFH1OJSO+yRnx3dqW4xYgZowD5YqWJoCU?=
 =?us-ascii?Q?/6cE/EjMVCY3cMzm53IHUhrGhEycraFYOOZkpGumog3B20Rt2M4ifc4yFa7V?=
 =?us-ascii?Q?Yj2B0Tr3XjKlTM4mqfQSpcotAr84+oucRgA2XwuR?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:59:14.2221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec991946-88f8-4851-745c-08de1e2fbeaa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9147

On Fri, Nov 07, 2025 at 02:54:09PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 05, 2025 at 10:18:01AM -0800, Nicolin Chen wrote:
> > On Wed, Nov 05, 2025 at 06:57:31AM +0000, Tian, Kevin wrote:
> > > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > > Sent: Tuesday, November 4, 2025 2:54 AM
> > > > 
> > > > On Thu, Oct 30, 2025 at 12:43:59PM -0700, Nicolin Chen wrote:
> > > > 
> > > > > FWIW, I am thinking of another design based on Jason's remarks:
> > > > > https://lore.kernel.org/linux-iommu/aQBopHFub8wyQh5C@Asurada-
> > > > Nvidia/
> > > > >
> > > > > So, instead of core initiating the round trip between the blocking
> > > > > domain and group->domain, it forwards dev_reset_prepare/done to the
> > > > > driver where it does a low-level attachment that wouldn't fail:
> > > > >   For SMMUv3, it's an STE update.
> > > > >   For intel_iommu, it seems to be the context table update?
> > > > 
> > > > Kevin, how bad do you think the UAPI issue is if we ignore it?
> > > > 
> > > 
> > > yeah probably better to leave it. I didn't see a clean way and the
> > > value didn't justify the complexity.
> > > 
> > > Regarding to PF reset, it's a devastating operation while the vf user
> > > is operating the vf w/o any awareness. there must be certain
> > > coordination in userspace. otherwise nobody can recover the
> > > registers. Comparing to that, solving the domain attach problem
> > > is less important...
> > 
> > If I capture these correctly, we should go with a -EBUSY version:
> >  - Reject concurrent attachments during a device reset
> >  - Skip reset for devices having sibling group devices
> >  - Allow PF to stop IOMMU, ignoring VFs
> > ?
> > 
> > That sounds pretty much like this v4:
> > https://lore.kernel.org/linux-iommu/0f6021b500c74db33af8118210dd7a2b2fd31b3c.1756682135.git.nicolinc@nvidia.com/
> > by dropping the SRIOV concern.
> 
> It seems like the simplest answer..
> 
> I'd ignore the VFs, I think it is already really weird/dangerous to be
> resetting the PF while VFs have drivers bound.. Not sure there is
> anything we can do to make this work better.

Ack. I've rebased that and will do some cleanup and run sanity tests
before sending.

Thanks
Nicolin

