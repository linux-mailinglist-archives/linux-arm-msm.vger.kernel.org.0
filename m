Return-Path: <linux-arm-msm+bounces-10762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88018852396
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 01:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0B431F230C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 00:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB2D54FA9;
	Tue, 13 Feb 2024 00:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sGrPN4qd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BB854BDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 00:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707783582; cv=fail; b=lKg3hbLHJQH5blBHVU1+QjWJt0bnUbc1hbvNAGmk2TSA3Hy528nVdt9Q+jkO2IVaamYBSXY0qKPBv7ayUADsSnK9Hq6RHXd3pxS5QDy62qvY3CPKcC9VCnmXjsiFrlRPlfm/UXAqTavT0PHU3agqN8CZuQOp/ZU2Ei6AVStdI5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707783582; c=relaxed/simple;
	bh=lftKnkOO+kCgU324uNW9qRl9oGWEUGoS0QfjdSU2X5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EHMEFz5AruJEcm5wrQjiVIlHYgB0cpyUJPR8ZL6WH2ICukMyvDAXYZl0864wQuNW+bohpfitaOWEBatU+0iAEHRd2rMzg/JxPdRmS/yAjOQHcvOZ7nMsQ3fUub2wCsf2ZPNOmHz5uMZEOB4pt/KCtbOFwDSbtsB34jt2m9EZ7Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sGrPN4qd; arc=fail smtp.client-ip=40.107.244.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGfkljpLwTqE9CnTUguMSW4MgJMPnEFwEH27GrgMwTdnDVQv2cGYI90qTMv/UoA4caANfy95+VBYGrlnVYpSjoQE8Eu7AHN1xst4Rg12K/Ng3ocCAb5I+ExVOqUe8zZnK8uLdCMaamKJ+ys9/ZL3QXrrxs705vyZqU9V8NkoRrF2ZassMPWblZBPLzbkBR3ZVhTOnJokM/jibrcs7/dFLTcj6zex5V+I4CQ0Yvv9WyVi364nXvnN94VSLgwrxz3722anEpg473nb5NRhO2ndz38u50Z11sNmbmIVx/ToCca10/eFBDmHasSdfuenA106OwoGm4XhxVF4Ih5n8fj3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBzmTVu2/55q8h/TgnjAiXR+HauKZ8J/DedqAUOATy4=;
 b=i7UyiJXGdemBM8L7J2hVTPyChv7BaXk2F9ff95ciXJR9JfJ24Z4Y8BgCMWV0AAqUhxuknt1dh1HPYd0VWrgkctvXOhc1hJLKEMhbs3P214PU7Gj0v6qbPUc/L5WUcFctCgGRMzgjznmsSr2JwrG4yeZCJhIlO2Ul1NZL2AN3pf6PMWl8/U79QUM2TpDQvtsbdqBKHCgB8Bbf6v0e6w+/U4e1LNYF4g2zNz0YF7uxpTFj5f9Iv7ELe1GyXy2+lHIkONK36sH/D3Ecq/m0bwNUJupj85LPQehd8vRx6vUgGmCG93PEEysfHki7gLh3bbNiSjPYaSlgnI9qqb20yXJQdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBzmTVu2/55q8h/TgnjAiXR+HauKZ8J/DedqAUOATy4=;
 b=sGrPN4qdaKcZfs4YtzIPdmWAA5XI283MROLQIIy2FvmImv6zXc+/hgo4yDEV2Q9QvCrw5Bg8jgsnOllpflyYrFTFkWd1otcwOFOsnsj9FpmYBp3cJkqyYWcm4hEXDa3Xewxp3KMu6QNtasn+30kRiFJqbdZXRNMyI41rVKTcAbHQTDx+DheuAboWIIoOQAi5AjtQd2ziRBxy25AyQpSkPgXt/gm5zjJrEO6AHe84SvitE2MJTxC06aMxveEdY17LadFG7dBhrRbzI36NjugeH8QooGsMsBHysZ8dPLubaLtMXyBO9nd/ghuXKDPRnudanxOm8s4Cp5bwzoQp/gBTtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Tue, 13 Feb
 2024 00:19:36 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7292.022; Tue, 13 Feb 2024
 00:19:35 +0000
Date: Mon, 12 Feb 2024 20:19:34 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: iommu@lists.linux.dev, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, nicolinc@nvidia.com,
	robin.murphy@arm.com, will@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/5] iommu/arm-smmu: Convert to domain_alloc_paging()
Message-ID: <20240213001934.GF4048826@nvidia.com>
References: <5-v2-c86cc8c2230e+160bb-smmu_newapi_jgg@nvidia.com>
 <20240209200538.917366-1-dmitry.baryshkov@linaro.org>
 <20240209222349.GA923780@nvidia.com>
 <CAA8EJpqdc3nQmTaWYY4VDE7ChV0NjMgBK7Q0rDRTyKZoWtbreA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqdc3nQmTaWYY4VDE7ChV0NjMgBK7Q0rDRTyKZoWtbreA@mail.gmail.com>
X-ClientProxiedBy: SA1PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: b1533773-e939-4996-9af7-08dc2c29757d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tIspYQsMB08jkjMp/R7NkIkiUT6+HFqNnyhiiAm9MkYSoPXBIfzYn6ZMlK6ollkWCpneKi5DJdupaByLPw0uYFBXEBB15lVaVj7K0HUcbTiEuaX2fhXwCd0GnuRzcqJoWiO2oaT/kK8d2QjIrkDdrZ+tqBhOkY4o99GVeMTNxJ9OmjKCoRBbSJ8SmrmoxQOqouZnzRWBpNl8jpnYGbjLNFFKe6E8DgpnqPTuiXgTqvrwYZ7l41BnaJjBd0hkkx8bPbk4+nDMbNzk/SSdty8kYOQ3k2qNAZe0Gvw799f0pw2t1JSNy29QVQMQPknYu3r5yOi1ClTWjU5ZbwZnFnPc0YjzXiJqcpH+fVIE0moVp7UcHiC5Ff625KyDr+40PSs3iwupvJG9N8/vEOxAyZp6vn8iLNoPsuz3C6iwMK7l6UyHVokesX08BhqgwdKCwzwitWsyFdoOW/n2W1+O6SzSBGPWwGdQPHemByj9fYOsNZnkJcNNH+oSQHypB8SdLB9qdrjLGDyKoSGyWjFcGL/Yb+XeIUQr7CxsVEzDeMqRNcH+LwZmn9nz9KYnuNjaCGJR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(39860400002)(136003)(346002)(230273577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2906002)(33656002)(36756003)(6512007)(6506007)(26005)(6486002)(478600001)(8676002)(38100700002)(1076003)(2616005)(66946007)(83380400001)(8936002)(66556008)(5660300002)(66476007)(4326008)(86362001)(6916009)(316002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NI7z62FSwqOW+BTk8HO3HW+JRGdGlh/DX8jKRtE08pRP9JF5Sa9jT8LvRkpU?=
 =?us-ascii?Q?Qrxf4gd+t/phXxOn7+8pRvPIeaEJTHyK4CtjLoeQqAK6Y9gyREqFdthWdZTz?=
 =?us-ascii?Q?C/NHsxkp4bocR2/vrClnbso3S6tTeb/AUVedlABc/QDznhN5+9pO9HkFBIy/?=
 =?us-ascii?Q?VYNhfLh7+CBkYI5LR2n8UHtN0EfcoqaswLTjl/GMfp+4JwUIUkzbPCmXiwKE?=
 =?us-ascii?Q?MvWIE98QtNdGneZ51YrnOTSCJdQhwGkrhzxyi4rnJRqxb3dgoZAH3A0M/2qk?=
 =?us-ascii?Q?26wa9AUPYQaKIvilz6rsa3j0bJ6OGdb0BkwLwOaAlVFLyMfewmFWLqX5/Tju?=
 =?us-ascii?Q?mtYExQNZs+MkHrFRyr/4Tmid4jN/OyUEQWoATk9cOvZJKL5BlWC4Zg92KPkG?=
 =?us-ascii?Q?eBmWpigS98trNP2L6+YHGembgd29FnK6zK60P2RmqhkQcHWatBuKN9xqi7RD?=
 =?us-ascii?Q?7Zy8jtc1BRp745CdWWD7hm4NW2Qjv/x91ufRr/SqFVmTz+KIvKodv0y1G7W8?=
 =?us-ascii?Q?XrkxTr5AW2QkJqPNembfY/b2WueotGoY6i7DttI9wh4IpYs1Z9uASsugkijf?=
 =?us-ascii?Q?2XsKz0iijiXvImyhbx72h8HBOuQU2XC4dDMMhSUfWZ2g1xnF7OWf0xFIgaJX?=
 =?us-ascii?Q?NnFxrz7IMp+OQdNpZVK8MyoZTiRB8tBp0WgF76NOHrhCjHD40miW79hcqYyt?=
 =?us-ascii?Q?nYVLH233qS4FdRjej7G4DUNisEPwgjlicryYbpMf39K4VIoHknxz5iRMf973?=
 =?us-ascii?Q?V2MHcGcZASRIEwoNFDphtFPIksEKUIrcRjB1NmUVDHztXiMmGxlWjRY1pGUN?=
 =?us-ascii?Q?pOwqDjPp7CDDgJVg21JHS+rwEwmV01/lMBRSW1f7ttcM2OLESgobyqxHf7h3?=
 =?us-ascii?Q?gk++a0LuuD99tZCoNercQmsUkXlONsD4lzO2fn+U+r9r61CDlRXp7C+1S8Ky?=
 =?us-ascii?Q?HXchcn7igihwkcIFOiuxxfRVLu+rgGjCx9KIw4DH3M1F//BZrj8I6P3wMDds?=
 =?us-ascii?Q?U3NRAHUY5MNjU3Sh1Enf8Ay/e9oQSoYP9xoo8KiRofY1KpQxHMoxO3q0SNmz?=
 =?us-ascii?Q?hQKEiKK8fOq4Rv0zMPMoB7cmgFj1P0g2rtvrnnRf8jMqBF831CAnHLbum5Gg?=
 =?us-ascii?Q?3A1QzqeSlgxnX+rqyTsYiGyKEP3pzcKtSSSLsFsR7pt7Rr+BTPGnmCXUkwOv?=
 =?us-ascii?Q?mCWq/K2JX9gHMOaeUpM33Lkt+5VObGDkq4meHjaYGHwXzewdyxOjqI4OxDLF?=
 =?us-ascii?Q?IIqI9csfQGfdg0k59jDcxfHy/Y64h6VWzk/B2pEHrlIiAquJfQ0DKRE7Tuom?=
 =?us-ascii?Q?6t8FFPDVnREXjJqcx/H35aynmdiIaquJAFhIPUdT5mxi+rWGVl9gw9cZ5aJb?=
 =?us-ascii?Q?GsqPjF5gCNKMigm+rNbxekwRZeStEtbTfbjRLZ2LuLUSxsWmgULm/Plx8arc?=
 =?us-ascii?Q?3Sjm9V1ANurzAzfkwH5l0ZFnh//onpWgJQ/jfxbabDA8IEZGt6BCeSGcaZkz?=
 =?us-ascii?Q?QztaN5Cqqx++Z2mqdmz9g5zuy1yZVDWjwePJfCEYnzAS9NPaXi3uMKm5aSi+?=
 =?us-ascii?Q?BAf2yq0ylMBeh/cIAieApmXdDJUaKbhKChm1k3+a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1533773-e939-4996-9af7-08dc2c29757d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 00:19:35.7569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqeopK8+TPdrSUQ6VPrlcf366CLOHk6OPnJ6XbGfxWOsQJ4/l3qvHdRKEwHtywDz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552

On Tue, Feb 13, 2024 at 01:18:24AM +0200, Dmitry Baryshkov wrote:
> > > For some reason this patch breaks booting of the APQ8096 Dragonboard820c
> > > (qcom/apq8096-db820c.dts). Dispbling display subsystem (mdss) and venus
> > > devices makes the board boot in most of the cases. Most frequently the
> > > last parts of the log loog in a following way:
> >
> > It is surprising we tested this patch on some tegra systems with this
> > iommu and didn't hit anything..
> >
> > The only real functional thing this changes is to move the domain
> > initialization up in time, potentially a lot in time in some
> > cases. That function does alot of things including touching HW so
> > possibly there is some surprising interaction with something else.
> >
> > So, I would expect this to not WARN_ON and to make it work the same as
> > before the patch:
> >
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -875,7 +875,9 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
> >         mutex_init(&smmu_domain->init_mutex);
> >         spin_lock_init(&smmu_domain->cb_lock);
> >
> > -       if (dev) {
> > +       WARN_ON(using_legacy_binding);
> > +
> > +/*     if (dev) {
> >                 struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
> >
> >                 if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
> > @@ -883,7 +885,7 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
> >                         return NULL;
> >                 }
> >         }
> > -
> > +*/
> >         return &smmu_domain->domain;
> >  }
> 
> With the full device tree, this crashed during the IOMMU probe, no warnings:

The above reverts nearly all the functional elements of the patch you
said caused the problem, are you certain of your bisection?

> > And then we may get a clue from the backtraces it generates. I only
> > saw one iommu group reported in your log so I'd expect one trace?
> 
> With the full device tree, same result:

This adds basically an unconditional WARN_ON on all the probe paths,
and nothing printed? That is even more surprising.

Those two together suggest that arm_smmu_domain_alloc_paging() isn't
even being called. But the caller is:

	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
		return ops->identity_domain;
	else if (alloc_type == IOMMU_DOMAIN_BLOCKED && ops->blocked_domain)
		return ops->blocked_domain;
	else if (type & __IOMMU_DOMAIN_PAGING && ops->domain_alloc_paging)
		domain = ops->domain_alloc_paging(dev);
	else if (ops->domain_alloc)
		domain = ops->domain_alloc(alloc_type);
	else
		return ERR_PTR(-EOPNOTSUPP);

Which, suggest that alloc_type is somehow garbage for your system? I
don't see how that can happen, but this patch will also cause a
garbage type to be rejected by the core code.

Does this reveal anything for you?

@@ -2118,6 +2118,7 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
        struct iommu_domain *domain;
        unsigned int alloc_type = type & IOMMU_DOMAIN_ALLOC_FLAGS;
 
+       WARN(true, " __iommu_domain_alloc %u %u", alloc_type, type);
        if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
                return ops->identity_domain;
        else if (alloc_type == IOMMU_DOMAIN_BLOCKED && ops->blocked_domain)
@@ -2126,8 +2127,10 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
                domain = ops->domain_alloc_paging(dev);
        else if (ops->domain_alloc)
                domain = ops->domain_alloc(alloc_type);
-       else
+       else {
+               printk("Returning failure from __iommu_domain_alloc()\n");
                return ERR_PTR(-EOPNOTSUPP);
+       }
 
        /*
         * Many domain_alloc ops now return ERR_PTR, make things easier for the

It must print, something is wrong with the debugging process if this
doesn't generate back traces :\

Jason

