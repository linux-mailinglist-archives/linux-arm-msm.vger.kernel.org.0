Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3020671F352
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 21:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjFAT7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 15:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjFAT7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 15:59:06 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B8913D;
        Thu,  1 Jun 2023 12:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJ0kef4MuREiAZed5Kpqk5SrqSemyLMHYBrTwCZ7D//mpRIdl3C9LsPwn6T7F5pIodSJgmEqe0mYCDPljl+shCPWuhCIChfznU26Qa5kvyZdKQkzwutIbn5bzqGVnuSFZo2nnQrdPbaGTVodvRsXWZztY/8OUoyEQgcRmqF9htAkuaCZq877I5TaQuVgsRI7KBEMwmGOvguN653bbAHuHSNdBK4CUV1/Vjqc2yTONCdEvGxejDxDQHNHLq/Ic7kINVEzxc5DSnRgFDMDAOMNaMsIUzwPGgTnzhIFCzL2O0tlQQxLMJnjl/ZaZPt7FZw35PrTNn5J61Dd1kNLh+gXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjzQUzVCiYr5PKjzSLvq2ZIykQaMLnQdK43PfedIbJA=;
 b=YI+koS4NUyyUAgIM96P2yrhpkQFGsltlcaFAGVuZvTVN8ndRuTODSApE0XPVoIJBrAo/VvufMnfo08gP53MpeaUmmJpWeaRSZoQxvPDpQi7YAL6IFi6XThpd8/d5uYjDywTuHywEpkJSrCPZZ6Z6Idm94UKbgJHbXyHr4LQZ/fR3vGMJMMSFgpml5IHL9qHgTHDTXNvgUZGP62o8h/tgm9jK46VHHq/JorBmdWIhxsBZcJfeBbT2Bos5kCL5c5C+ilMHjQooGjsKdzhZgc4WtBcHIMabbgNWojPzEgajfE/0T/Nr6/sytGV/9KUT1Sl305Y/I1U306Qw5cqX6pNzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjzQUzVCiYr5PKjzSLvq2ZIykQaMLnQdK43PfedIbJA=;
 b=TZ2Y8F+djmELGtgefD6QA9POex6KIQqCikGwsQJdhm/YOCmeao6daGtaDyJPgJ70fpSl0BF4XgCCRzQ9GA0ivj6BODsW/ThlomvLr8mFt6SnAlmDrJXOYAIj7Smqw/abAO+E5xu0wxqVSF+AlSd3RM0PzLtXfHt1V4xOPRDvfBqB656iuKeZka56YNHOi6kQvwdFeU/Irl1DyYX8orgURzlATmoBocM28PZFAVD38yOtXRWg0AerPgqp25/5pkgvbO4oNM2TjUZ6iKiSP7iXg9O+PjkA8decr2Y3MeViQaVHVmB/ljwvFP5ZbSW+p6g0Y0Mr8vJ0/ryYwpyBDAIpAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Thu, 1 Jun
 2023 19:59:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 19:59:01 +0000
Date:   Thu, 1 Jun 2023 16:58:57 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 04/25] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
Message-ID: <ZHj4gcwpYEhx2y/l@nvidia.com>
References: <4-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
 <914124dd-c319-15c5-cc03-c5db0e4002f4@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <914124dd-c319-15c5-cc03-c5db0e4002f4@arm.com>
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccbd925-2f59-4826-730c-08db62daa48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PG/ciFqZYwzT6BmT0PmSbown4d/lZ8tAA7tvKh2WjYHMxNnu6+YtSXdLIgTu8OXXGnwuvA/PCjmn17pPkw5sU8H6CLDlMbJyLUm/VKWEKDtdFybxs4bD00gVof1RRhtLWHXLSSzshnr3U2R3FYal0TbaMZI30BTO1bOHOrkkwenNOV8anO0hoNrmi1p1b4M04QFvKa0/M6NcKXD8JcYc1QejGqEY1my4utsPeen6KSUPOEzOIZgzFGA2qtrOmZ1yBiNtMQm6Hy0E0Jab46T2YFR0mpLDnMboe5d5KrCE7PFzkkvcpVrIj8tns5LGBmxK/f/aEwki+ULWiXkwAnpNL0ejJ64sceE26Af9jIy2WPL1Fxz4kiqFwY+Dpp5A5Q7KAOe7Zcy9VXNJ2/dX2JPQ9TvuJ1+QYSL3NOPl0q3YR/ZzjT7ClIxbJbX2atYLvxSjqr7aB6BZF8nIWXwU/3rMiyWzyUZpNF3FpxLfRsgdfuwaZZ6kZTMuGoOnvX+GsuF7IYvfdeuxeFibcc3XJgbGB0ItCd2rD4+AZOpiWUSsgt/f/ibU2wPCNWq34pARoS+C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(54906003)(478600001)(5660300002)(8936002)(8676002)(7416002)(7406005)(36756003)(2906002)(86362001)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(38100700002)(41300700001)(107886003)(26005)(6506007)(6512007)(53546011)(186003)(2616005)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LTSw+KWI19TIQP/r4ncGHOnkxfgFE9qv8qDURZSXoPoeGS5OjqFxRSpeYgMS?=
 =?us-ascii?Q?MV+JKoYrpsKvJPiGYCrVkDLPanvlZVKfczNabZ0KauiH97JjcdfNak+mMd8R?=
 =?us-ascii?Q?cMKqOa2N4+jS63nFxOFosV15Vd3shCk8blwzNPwxRdLgCaVHbiTu7mAYgWHr?=
 =?us-ascii?Q?A36WV0mh8wFvt4ARrJ5SNElOMIqS5XhsnBxaDvq9M9fskzYH0QKgXHbLouxJ?=
 =?us-ascii?Q?qLBla7GMVRHTJNInoZYoeQJPYtOhRLh+4jDhPRjSufA2Iq+tJpoQydT9vV9K?=
 =?us-ascii?Q?A9Uh0UfLch7NN9gMoowpEx3AZMtlgFnmA9arp2b82Cp8erJeWLcSJ/YwbGt7?=
 =?us-ascii?Q?b3wqH7twJ/fNSiRByk72q5G8uAJIdgQED7mAmuOOcNAQJY4eRk+zVvJ+vEr5?=
 =?us-ascii?Q?u67JWvtnbbmfPHoFbvIr5l0StzHBh6NQcKvLiMYu07UrTvMyMTAz+NnGzhn5?=
 =?us-ascii?Q?Llj9aT8MnkfRVLPoiWxPF065MUuXRm+wyUiZOarYx6ZJL/Px/xc/NOkl193W?=
 =?us-ascii?Q?Ms0UZFswAjYRrnUeQdAzjiz7ZT6wxoSlp8vlFPMX/yrOq64AKtkogmk3wyGk?=
 =?us-ascii?Q?gd3FWaF0VPlja++aFSkZDZ2YCJnO7A5+ssCgnDzhaMzN/z2tEtKwcKUbDHTG?=
 =?us-ascii?Q?+zakUUKXxQUOcClSDP/9SkJ29IdK+JPVFs6cjcd8Er3u3bBKRDg0hw6JuMx4?=
 =?us-ascii?Q?va8c4KluOuQOOPVmELxE/rx+C7M2qw7G5Ysoq3Z8EOAspQg6vj87Bt8vNT0h?=
 =?us-ascii?Q?Nyqxni+LuFs2vaq7xOwLh3cqt+kVgs59MhsLYe0z5HGB2GbCv9N9KWqw3tl+?=
 =?us-ascii?Q?0qXcNA5KugqV3HlQkrH2s2aLivcD5K1Fc8+oqQU5l157tRJSLRQYM9//MzVH?=
 =?us-ascii?Q?dzd3g96jtO5kys2l3iR2mbmOYXrn2lyd4MJYXAMhZNpUQ66W1LXCmE4HVoEP?=
 =?us-ascii?Q?H65oNuhpYoH2jDKmAtZnA/24sRwMvnya0fRowvAda7lLKeBcc1DomzDVheWv?=
 =?us-ascii?Q?76t2IkcABXzlAdvRw03YziaUdq/V/XVRaNMQEA4uYB9NxbTIiyxbPYekTcPq?=
 =?us-ascii?Q?CyxypNukREshFaeMjeOR4+8gpFdbzCZDGa8BKwwJNXQfi6XgiZee67wsiH7N?=
 =?us-ascii?Q?oq0LDcgauiZDzWCz2ZEr5LuQSn+LhSciN9a0C8uD44TfVy3WZNSUUR9YjrvO?=
 =?us-ascii?Q?sbeQU5j+x0K9SpdlQ/tIKjU/OcvhzIkdNXmCeJjj7oTdS9DyOWGwkHnjWu8/?=
 =?us-ascii?Q?FrdnuLIcMmknySkKh1xtgwNV48J10Odj8n6eGDGgAmGlj2WL+2F8uKJR0kP8?=
 =?us-ascii?Q?Hp5uJVFG//EdpQrylDFDPNtTHDYO/gB5e+EdD3+JXR3GwSEGMJmCer123KHp?=
 =?us-ascii?Q?xydjj3dtYlbJAzV1nJ6wtGVSSIfH86njkIKSySH2veMyVyz+fwbEpC9iUCKA?=
 =?us-ascii?Q?jQyqjchiL+A/zdXtlaki1oW9dhHCdfv3oZXLYqO0wQueI5sBUNvG4mWwKetr?=
 =?us-ascii?Q?Qmm7FpukpDi/5gWG1UNNX8mbhujBhWEo1uu0mlM5izMBTD4e6m4nCKTYtGHl?=
 =?us-ascii?Q?NaE6JrN15GATAEaEdHs7TTdPgBO3msqLBoDzixjM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccbd925-2f59-4826-730c-08db62daa48b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 19:59:00.9918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4visPQ5KbPSfTbs7R7jZ4Cq90/0maVGAfDWVJGkxL4n3xQ4AU/6nt8FprN5RSP4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 01, 2023 at 07:25:32PM +0100, Robin Murphy wrote:
> On 2023-05-16 01:00, Jason Gunthorpe wrote:
> > The PLATFORM domain will be set as the default domain and attached as
> > normal during probe. The driver will ignore the initial attach from a NULL
> > domain to the PLATFORM domain.
> > 
> > After this, the PLATFORM domain's attach_dev will be called whenever we
> > detach from an UNMANAGED domain (eg for VFIO). This is the same time the
> > original design would have called op->detach_dev().
> > 
> > This is temporary until the S390 dma-iommu.c conversion is merged.
> 
> If we do need a stopgap here, can we please just call the current situation
> an identity domain? 

I really rather wouldn't lie, especially since we need something for
PPC more permanently. I definately don't want to call PPC IDENTITY.

> Then similarly for patch #3 - since we already know s390 is temporary, it
> seems an anathema to introduce a whole domain type with its own weird
> ops->default_domain mechanism solely for POWER to not actually use domains
> with.

A main point of this entire series is to remove the NULL default
domain, so power's weirdness has to be accomodated somehow.
 
> In terms of reasoning, I don't see that IOMMU_DOMAIN_PLATFORM is any more
> useful than a NULL default domain, it just renames the problem

Yes! Renaming is the whole point.

We are giving actuall meaningful names to all the things that drivers
did with NULL. The ones that actually implemented IDENTITY correctly
gets to be called IDENTITY, everyone else needs to get labeled
something else.

Then we can tell what is correct and what needs fixing at a glance.

That is the *whole point*.

> and gives us more code to maintain for the privilege.

The PLATFORM bit is only 3 lines of core code. Let's not overstate the
cost of a label please.

> As I say, though, we don't actually need to juggle the semantic of a
> "we don't know what's happening here" domain around any further,
> since it works out that a "we're not influencing anything here"
> domain actually suffices for what we want to reason about, and those
> are already well-defined. Sure, the platform DMA ops *might* be
> doing more, but that's beyond the scope of the IOMMU API either
> way. At that point, lo and behold, s390 and POWER now look just like
> ARM and the core code only needs a single special case for
> arch-specific default identity domains, lovely!

I'm really against mis-labeling things.

That is totally the wrong direction for this series. The point is to
label things correctly. Labeling something that is not an IDENTITY
operation as IDENTITY is just repeating the whole mistake of an
ill-defined NULL all over again.

Labels need to be correct, labels are cheap to add, so lets not be
afraid to use proper labels to actually describe the underlying
behavior.

If you don't like PLATFORM we can choose PRIVATE, OPAQUE or some other
label, but not IDENTITY.

Jason
