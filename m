Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487986F5F32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 21:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjECTfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 15:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjECTfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 15:35:24 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29CBB1FCD;
        Wed,  3 May 2023 12:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/bGzqTGancaEKa7u5WAiXBUjnig5pGqrNA5DRaxF0I8oFbbYop90ZXqPAAm0jarUIF2Ejn1o+04MUSlcztjp5w2FsVGau8AvdirtwZp8RcP3e2dveMLE55djKmS1kqubQK6dc1r4RgkZZMlzELS+sl5qHQ95ZdewLO2LLuL7jZUjGXzd3bNQ7tWDhGrn0p8lWErt4XXDJR+79f8QeUEW8+lmZ5CPyrYySnz31bc8X29zinPNObkAl6gMMuSukGyl1mq7p5Z3behwJAngeh85y3EBYaE3wcoBJkIl+JlAu16HToOky8+e+U833BMmJTbDOWtwtzrs7NTbzf5EKMhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4Jrzg9PE7RerddwjDeQpWbacKsz1XZhV1f0wiSHIOw=;
 b=D7gfMC4ZedsdypDfCARm3kmkQ9IGOnNm2b1/XZza1k2bFbpMuV5jAiPGXuiG13W0iog0Sb0dPYc8N1nKNxkVQ0B7U+7paLhLorLEQdBzxn/am1iW1gI2ZPvPzE9CihYeSu3ignosmt02EXzeWTlelihKPkk+fuTsVS2RLkfSIxuut8aTZ/krupdDv5LqrcilNLGG2hXz0wXIiryVeSd6qCVp+05Jy3FTTP+3/gyvQpfHrhXs2pWnObFEM3ylgSROReQyNIcI0ZxZpTz7aapNMrkmZb0bH0cnlAeEWHEZ8O+dAHYB4YJKqaNsbgi5O0Wdm6MAFnezsui11c7eRL28Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4Jrzg9PE7RerddwjDeQpWbacKsz1XZhV1f0wiSHIOw=;
 b=VdpDCQQsTT7psH7MS+WaEAh2HWJ8QZOF4f4JyCZ5gEpgFgFINBsuNoeHIaLembXQV8/B4gwCQxPS1CQT0LGtbNsuuUp3uJcsIw5jo2TDHRlrB33NzTnBVOIOFdCKu6L/J0ZApUIOhKHc4EEvLONMdrZdFZX2kBbWHpH7gBw0m9fnWuVzklDku8Rgw+7rBVA0txjoh7hYKW8IR0smkstwZu2QJBd6pfl/6am+hwEfaxL7/oP0C725JisltrvNqslv0A7UatfnEwwXB6zhnK2yrcz97fz5qzhhQkoAx9y9TTz5tOqNDBbMtnecE2rm4Y29fKNXX3LsNjexVcypxKJvTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Wed, 3 May
 2023 19:35:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 19:35:19 +0000
Date:   Wed, 3 May 2023 16:35:17 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 18/20] iommu: Add ops->domain_alloc_paging()
Message-ID: <ZFK3dfb4bFiJjw9M@nvidia.com>
References: <18-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <fa8c5e95-b8c8-f4c0-63a0-d3176718d304@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa8c5e95-b8c8-f4c0-63a0-d3176718d304@arm.com>
X-ClientProxiedBy: MN2PR06CA0030.namprd06.prod.outlook.com
 (2603:10b6:208:23d::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bfeea87-cf4b-4692-dc37-08db4c0d8761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cxt8+j/V5ZTXh7xIfMj/BUG5t9ht8MFpa1vN5589xjhSIwEqBSXF7lPUU4EDGXs9edP6q/JTRdJ1tE+6o/4w37kVd422CobBI4o1Yx9BwcodDa2I9TdIGVErnsJYyCb51WNAyC5a1XBDZTiArKlsyBcnL5aqm7w/oyoVORyZDQU5JlXp/+GVGy8/LXh8neKOl+c3eexf+Qw7PTtSn80xb8YK/Xas0vSyzBHumIN7eCONMMfFd+yzVBY8zX6s6jL/RIUd9QjmR98VL/AtkzNzUhFXUX6EgevguthtNgdaSAlhhHi+Id1p2D0wJGmIAfVqb3ln8UWG6AK0JjTLJZ6YgFFynUkeHvt1hmTcaO6CSJaWXr7qKiQJSLSqmcG8a50jX5LyKiO6Pg//RgUyMCwPO5qXeGlZZgLexDGQkquzoE7LY54z0EU00elHr8+2E/6yj5b6EhcLumMTS8c418mFIp0bqPdMtPsV1Yzh2IiStzth5TFDJlMQcglKkMknfBleLuW9VNGtH7bv3RwWl/KTLwv/9yAfszAYFzvWT7T2fB/kvx+mFN5SGepuRkKCvz43
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(7406005)(7416002)(41300700001)(8936002)(8676002)(5660300002)(2906002)(86362001)(38100700002)(6486002)(54906003)(478600001)(186003)(53546011)(36756003)(6512007)(2616005)(26005)(6506007)(83380400001)(66946007)(66476007)(66556008)(4326008)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WHiP4mLPZ9kaYjJRyIeAorL1a4aYIQUFQdNyx2nc0G/lzn66tYugsEDj5PMw?=
 =?us-ascii?Q?oV9pnYehFSE95g3qp9uQhktjoUSf7mxK69AtR7p8HMR4exrDOATCrHpclMHy?=
 =?us-ascii?Q?68Lk0GLQ1jYcBhIiIvTHmdti6BZZ8N0481wRJmSJF8jXLQltR1nwQCmq3q/6?=
 =?us-ascii?Q?roC1i9+K4ilBmhFEH6osFWKrWYQiSuF7+ICvN7nQ6Aw/SRmuhSvW0W/yUZec?=
 =?us-ascii?Q?mU/1gBpvS23RjWfK0Hhk7BninItw0EisQIoL27Jyo98PnZ8o855ZhGrupv6q?=
 =?us-ascii?Q?zNm4oB9O14c6eYhx6xYh6yTAl9x0GinwauaQ8nHFEFoqCQsfsvoly7Hm7laI?=
 =?us-ascii?Q?nJK2LKXou6tDZyRpDF39U9oLTZQv9YBQjcVnfbzZVF0l7+SQbKTlihTZv8ZK?=
 =?us-ascii?Q?8/O0df1Nhbhq7H3S1Y/Psck1NdSzzceuUVzABD67P1T4M0OUnRZVhJED3MXh?=
 =?us-ascii?Q?QaEA4G+Wdf8ccjVFMUGfBj+aOP4wnXN7nefrFaSZjpPJOxfEodq3MPBCnwXS?=
 =?us-ascii?Q?UoVFj4Rvq7vFoH/XMGZNUOrC7k43ojWD8+FsICyEYKa00HxwkWb38FUi8629?=
 =?us-ascii?Q?Vj3xPnUOOHPbaCnf2UxsyVDdMIBfge1ZZ0uZZlLryTXK1RuiLQsun1bjG/z0?=
 =?us-ascii?Q?jmHejIM6SFbydiT0oKa1lO8TjNNbbeh7zkiQPpgXWCGgc/KSG7YYImQ6oRFm?=
 =?us-ascii?Q?ebyzonMl1x8sb8Z4MWnvls4CUTWgyw1MZhOgIqGLPmXXZE1ode+wM6L1ZIGr?=
 =?us-ascii?Q?sfQcKIQriHeW4NE7xr0Qvh8hIm20C19Mz/UMO7jbUYMbfiXcO7o+UH0dFE1C?=
 =?us-ascii?Q?opn59yoVcSmwHUpzIQh3FT9ZcE0DAsrfeZROiskrKZis8mseWdJZD1fD0be0?=
 =?us-ascii?Q?bay8yCGG7uckMYeyIM+pxTD9dtAoRGZLyNq9Rcot0WGwGTq8yUeI/JCH/GDS?=
 =?us-ascii?Q?yubUczCcBatRy9JyZsIzaARd+nj4TtE3Z8dmJpmIBOiWu28OrTv6nst7r9+W?=
 =?us-ascii?Q?eD6VRAigbGklTTMq0mNNw3J0aNMKhlO4XvWQfmRofqSiI8XpPf2gEDpvJNmR?=
 =?us-ascii?Q?At5oeVIngk9tVkosL8iMQ3rCeVfkGRmAwY1tzdxjjEyzdUoiXSinijPyaZrk?=
 =?us-ascii?Q?h9/mfk6ZuNCzw56ZyTG8cZoQYRNZm3dkvozVPiaXQLid0ipn4bg0v56Dfkl3?=
 =?us-ascii?Q?I9nyXIOLZ5WvMcCqBJwzmSnsZowVrL8VnckrPF0gpUZ9vXVfHR0XISQrFeiB?=
 =?us-ascii?Q?hmBypcP0J9XaJbYjbSSnu2+Hd0dtn6H1cY1vx16Sl1TRle8wJRguCvh/rte3?=
 =?us-ascii?Q?SDsLPRSTsnZCzjNPaaZmoSD5wo37mIvUGzdVp0ykuyOWbfNmqqMmL1fjkCEK?=
 =?us-ascii?Q?CxthyrnP3GzOkl+XyPdOIENPiiBJlIa1sIVhmDqiGS8OwF/8F9eC3jzK2mXe?=
 =?us-ascii?Q?LjgutwU4Og0/UNjz4T14FgEzZHxr3sLpcoyFMmCzOWj7FkK0bikusRWdgNCx?=
 =?us-ascii?Q?Ks+oQffBvY7tQzMyonnjktrq9kZhH8MV7tDZ7p+l//ANOYZ0MEt5ba01HTab?=
 =?us-ascii?Q?B2xSIx6Wc1Nuju2UWRZ4+VjHWjT/K9AAA7WCQVCt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfeea87-cf4b-4692-dc37-08db4c0d8761
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 19:35:19.4843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zsY7x8K2uPpsr+EcjpNfd3ImXU98oASeh8/MKUGZ/AO/LLQrs7BbpYDYLomDNnY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 03, 2023 at 06:17:58PM +0100, Robin Murphy wrote:
> On 2023-05-01 19:03, Jason Gunthorpe wrote:
> > This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
> > domain, so it saves a few lines in a lot of drivers needlessly checking
> > the type.
> > 
> > More critically, this allows us to sweep out all the
> > IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
> > drivers, simplifying what is going on in the code and ultimately removing
> > the now-unused special cases in drivers where they did not support
> > IOMMU_DOMAIN_DMA.
> > 
> > domain_alloc_paging() should return a struct iommu_domain that is
> > functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.
> > 
> > Be forwards looking and pass in a 'struct device *' argument. We can
> > provide this when allocating the default_domain. No drivers will look at
> > this.
> 
> As discussed previously, we're going to want a way for callers to pass
> through various options as well, initially to replace
> iommu_set_pgtable_quirks() at the very least.

Yeah, I like that direction

> Maybe passing an easily-extensible structure around is the even
> better option? (Wherein we could even strictly enforce "no drivers
> will look at this" for the moment by leaving it empty)

Can we leave this till when we get there? I think it makes sense to
add an args struct and the first one can contain the quirk field.

The trouble with this approach is we still have to get the alloc to
reject inputs it doesn't understand.

> I'm hoping I'll get another version of my bus ops removal out this cycle;
> there's obviously a lot of overlap here to figure out.

I think the places it needs to touch is slowly shrinking :)

But it would be great to get the bus stuff going, we can organize the
series in whatever order, but I think the "Consolidate the error
handling around device attachment" series is good now so we should get
it in Joerg's tree and start there.

> > @@ -1633,9 +1634,9 @@ __iommu_group_alloc_default_domain(struct bus_type *bus,
> >   static struct iommu_domain *
> >   iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
> >   {
> > -	struct bus_type *bus =
> > -		list_first_entry(&group->devices, struct group_device, list)
> > -			->dev->bus;
> > +	struct group_device *gdev =
> > +		list_first_entry(&group->devices, struct group_device, list);
> 
> Eww, why pass around a group_device that nobody wants? 

Oops, yeah, will fix

> cleaner. And it makes my iommu_group_first_device() helper look even more
> appealing, if I dare say so myself :)

It is a good idea, but I seem to recall the count of users has reduced
after my last two series

> > @@ -1940,7 +1944,11 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
> >   	if (type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
> >   		return bus->iommu_ops->identity_domain;
> > -	domain = bus->iommu_ops->domain_alloc(type);
> > +	if ((type == IOMMU_DOMAIN_UNMANAGED || type == IOMMU_DOMAIN_DMA) &&
> 
> Logically, "type & __IOMMU_DOMAIN_PAGING", otherwise we're already missing
> IOMMU_DOMAIN_DMA_FQ. Except maybe that's deliberate? 

It is deliberate for now, if it included FQ it would cause a bunch of
ARM64 drivers to switch to lazy mode. I'll add a comment.

I have drafted a followup series that removes all the
DMA/DMA_FQ/UNMANAGED checks from the remaining 6 drivers. I did this
by adding an op flag 'prefer to use FQ' and made the core code drive
the FQ decision from ops.

But that is another series for another day..

> Not sure how much I like the idea of a introducing new interface
> design that we clearly can't even convert all the current drivers to
> as it stands :/

I wouldn't say that. This converts 14 of the drivers and leaves 6. The
remaing 6 are more complicated and have to go in other series. eg I
have to reorganize DMA_FQ first.

Regardless, the point is not to be universal but to have a straight
forward sign off that these 14 drivers have been audited and they
don't have any policy logic in alloc_domain any more. Incremental
progress..

> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index f6a28ab78e607e..cc9aff2d213eec 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -227,6 +227,7 @@ struct iommu_iotlb_gather {
> >    * struct iommu_ops - iommu ops and capabilities
> >    * @capable: check capability
> >    * @domain_alloc: allocate iommu domain
> > + * @domain_alloc_paging: Allocate an IOMMU_DOMAIN_UNMANAGED
> 
> ...except for the other types of paging-capable domain which also exist and
> it also allocates :/

Yeah.. I can write something else here

> There remains good reason to keep track of the distinct subtypes of paging
> domain within the IOMMU core (i.e. between iommu.c and dma-iommu.c) even if
> drivers do finally get absolved of all the details. 

It is hard to keep the details out of the drivers if the argument to
ops->alloc_domain() encodes the details we want to keep opaque :)

So I have been taking the approach of just removing the
IOMMU_DOMAIN_xx text and related checks from the drivers as it becomes
possible. This series is the first wack and does every driver except
those that have dynamic identity domains.

DMA_FQ is the logical next step on this thread

> Sure we could come up with any number of different ways to encode
> those distinctions, but they wouldn't be objectively better than the
> domain flags and types we already have, they'd just be different.

My general feeling is that we can remove them completely. At least DMA
and DMA_FQ I think can be removed totally with some reorganizing.

PAGING can become maybe (bool)domain->ops->iova_to_phys with some small
work on the remaining 6 drivers.

So we might just get down to SVA, IDENTITY and everything else

Jason
