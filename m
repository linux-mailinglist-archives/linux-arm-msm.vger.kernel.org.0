Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2422D77B901
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 14:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbjHNMsz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 08:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbjHNMsr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 08:48:47 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8BE94;
        Mon, 14 Aug 2023 05:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXlAojO20EnM/Qzggu0gXvSC7vramsEqIrQPZ7VeNfwgYsAMqK9tfN/tjd8IEecfOhcTnDDIqi/V2zlv2VWg5hWQ3vtQmLcKqDW8kcrQ8FKV2BzHe0Vjbbz4lq+WfSqTpVUQasNyuL47uB1NnXObB+nZkXk1UwLMHQ034BJzqipP69+NMqRkfC7NHJ7fXzUjwX7ZfJR4/PJPEpPhDFD0SRuoWTYilAJeWT8ddA0Y3L4po49ZXxNKZAGl5i/Gdu2Ce6D4i9ceKy4PMcHSqVlC2EL2ZS4pm4BWciUGQjCJdY8Sj//IDwlSj0pKyETKBSyYmdRqPa7/g8FTIP7PFcwl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8vxjLIGC1lancS+oQ9tSZEL9COmkkdrY6vklSDupUA=;
 b=WLmxM/+UWyQAEZcD5mVGh7dew/ZwaRFwDNjPq+ZMWUvy7ZQVt6tL2cx6HWTxUSnXCz3OCaT+MHrI1Hg1CMKIMRKbJnmoo6Z26HYpL0FyYpoh0Bxx2HmFGRUhRf6CMfIImvnbVHnlYyIcM4YRHG6i8OsPNz1X5bf/KuK/5A9EwCApEClIyS9KdLw1Uv0oQ4PRYNxhsYEQsffXlrrlfWqSSJxeVGpbR7O9jD2Cf4qd5SgIJK1gISRYWirzlczBWK6FUB8Vo2G2TdcotqIA9mZkLqbMqftmlpjPeL2LOlcrm0Kq+lRyfScd/VKixrprd+lARy1M2ICWgo+n400iQWDe/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8vxjLIGC1lancS+oQ9tSZEL9COmkkdrY6vklSDupUA=;
 b=Z/b3QCikJ43TgJOIZZfkjIRye0+A/8fRPm+Jy0weFWFekUly1gaLPOX5IWlpRdIAPQmsM8+lEo7h/HJztCY1lFS2TRmtKY0xipdTJFVIcoITL36OeVLDnW3znlnJeJWvFCWAejJ1UE8F/qcfjhKsebnmEBxnpmo1C/bpG/nNBl6znp9t43vnObMqz7nS8RkBaNk8bCnhKxKHInuwEd8LrfRl9/5sMI/ebMmhHeATgOFb/kZBqochYgdJ5GM89uNEy+P2JE1KuQubupyMIXSpo6MQZZfBrXqcWo/pfrY+trUQEYH+zOzbAUCewVGEgbW/vPkqfKXidQ5KeIuyoEBerQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW3PR12MB4444.namprd12.prod.outlook.com (2603:10b6:303:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 12:48:43 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 12:48:43 +0000
Date:   Mon, 14 Aug 2023 09:48:41 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Baolu Lu <baolu.lu@linux.intel.com>
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
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 10/25] iommu/exynos: Implement an IDENTITY domain
Message-ID: <ZNoiqd0/5GM+8kZL@nvidia.com>
References: <10-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <0104371e-a824-8ace-eae3-da90df285c41@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0104371e-a824-8ace-eae3-da90df285c41@linux.intel.com>
X-ClientProxiedBy: YT4PR01CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW3PR12MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1c3ecd-5623-47f8-8a61-08db9cc4cab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T3upvgdv7udyQHyGaudgbii9hPGpCa5jkelt/MXXkacjF6x0WvXJoLo6bg2JxO6SPFN6iWQcFmeLYtF1FOdwPSW+mX7pVgmJ0nZMrb94QRHM5aQyisl11dprLNIw3E/ZxAstJ/lzr7m85Uh9w0GqYAYJ9iGrd2bx7UvxoTlLeYqweprlypRX/0Zf20Aj3cPSYvCZcrFcAr0Y0r0qrNgPlWnX+eoZDvCOkxI9vBdVFivZWyPoedUXLNeMy2oJSbCkYbnaXXg/45jYfibxKLFkdtHH7rg+ASXksFeS2IghTiK/5ztEz3L4u4VafmHpJyRyZUe/WwjJDMCf2DDEHpEIpaF2HjXBQ9NxP/BLEQG9cpO7FfGJlWhzTGwWIKAJ/cdeJjZARrvf8T5YWxyyOCLAAOnmkPKcZzArjxCZtFpACnZpBVTd1XH3LmqDipuBqMrjr0srvHITFItDGBBriEA74K8yQJRfcUh97MjwfWEQrm8RbGZciCEtzRAFwvuP/L5COwSVo2jJs279u2VJPIOKIgVf4ZA5MdZzU0l6GQui0DLtoYI1z6/3zhFre814ATpv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(396003)(136003)(376002)(186006)(1800799006)(451199021)(6512007)(6486002)(36756003)(86362001)(38100700002)(83380400001)(26005)(6506007)(107886003)(2906002)(7406005)(53546011)(54906003)(478600001)(2616005)(66556008)(66476007)(8936002)(5660300002)(8676002)(7416002)(66946007)(41300700001)(316002)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PrBk5gIfi4+dr7m7nsH+UCnfa7o7gakM22rRHBC4mYZm8vTU78bpOwUFRG4y?=
 =?us-ascii?Q?yu3S8DyhwXOMi6cUj+6aXKcVssQyneeSbvFnqKQpKdUYudpKRtct2HHYofnL?=
 =?us-ascii?Q?v0MT8u6u100AQoKdYbrPYLhtO2c9/iq4u3jU5UZVWAnqFBIgPfc6SQId2Hlp?=
 =?us-ascii?Q?ga9xYLWtqPKCEtOOKSeuXd5nfX5OwLrBVfzhTUmqGjl+5ocSHAI4Z2AfBtn8?=
 =?us-ascii?Q?j9P8iXnj+elrNAddQsJDkZzt2CeLUNeZ3JppXeJfNwnGVxF32mchPaCF4nU0?=
 =?us-ascii?Q?0dFYtB8zvDZujl8qYBiOb5VqFvlRG8VCZCnwJe/VpwQ9tLQwmktr2ZFA6L0r?=
 =?us-ascii?Q?eOzOp0tFOZFF9vZrevA7toGLusxfdNsNX3hdGk6Xy/P+nMp42SHREsp14jMS?=
 =?us-ascii?Q?gFFj0FYVgLgEQW1piBgK0OCUDMiZnV/UJIzRR40pheiLKvs2zQ9PDqeP9IZD?=
 =?us-ascii?Q?F+Pg7QKrajEqy34UvIFhYs5dPvuzB21nOeBQV4A9hNcMY7smV01UjtTBCFoP?=
 =?us-ascii?Q?M4by/CWT7Bis84EJsXK4iFrc1qgjjvyd0+NBaHuIZrMI3lVMjp/pgV7OrowG?=
 =?us-ascii?Q?iqs2veBzJgWwbsgBVEMJIAHUEO3U0hHpir4pXFWd4JL5zUMJEzXqp0jqGf9O?=
 =?us-ascii?Q?3B+Wk13wppmZO57Fm5xZyHtnxOgox3imONs6A4XxBtF5STB1jZZbAsfUJEzt?=
 =?us-ascii?Q?+fuapKc9tlGV825GorpV834/470Ye60R+rsLTxTbQWnMwkth/pWGX6HY1YGn?=
 =?us-ascii?Q?J6xbSGrxIkuZnXDrJcZaXyH4YQ/bIOrq+XdvthNbAQfbHhqNPispVVI79X8D?=
 =?us-ascii?Q?ufeh/vABP5Lhw+8AXm3XCaLMazKiJ0MnA0sXmd6JliYKSVxn0K9GiqcrVXBe?=
 =?us-ascii?Q?YT6a/OuXumu0/3H2Xm3r8bYkzRLwd9a5HzWaCMewN78vTBpzIBVXtFk7fPgv?=
 =?us-ascii?Q?86+fua/cCZrh4sc8ghu88L/t2nOUbLf3Kk+Q0TwiRvwjZ8g0AqWp5i+mBklZ?=
 =?us-ascii?Q?fgrwTF5pd36hXawJFVI/oMGnmzX/y6s1E0In3AT5+UnWXqOHibJDkvzW00dV?=
 =?us-ascii?Q?km6QmIyapMNXz5ju/X9WJSE3FgyInMOAz5rTLFoptpfdJ4zNAi+Nz490qNr/?=
 =?us-ascii?Q?PxMovjqEtoH5BA0Rr8GQEBi7yd2Kl2SLpZdlmm5sjfw9t9VWCQsBPLPvHfTc?=
 =?us-ascii?Q?NuAZvIT6NxADm/jnHhMKCRGN1JOPAkBQJ7PCndOOzZCaUEKc38uuI/gIePjl?=
 =?us-ascii?Q?5y0fMKFnTC9orSs+XW44Vvc2vIKa9eq2Pfwx9tIrioo6lpiZQnJTdNc1QFCX?=
 =?us-ascii?Q?odHEitHvFydH6rSWyNn2Z7NX/cH16Yjv7oFRK/KQwsGsO669dUI8MGw2pyPp?=
 =?us-ascii?Q?RQ4WRJBY3r/Fmww4RcxuNwcuCdGdUfWS6kJWJT0pruSIR/zPXYztK3U9HOM/?=
 =?us-ascii?Q?rVP/2ssr2tJXE6rvsTPUWYNKI2TXummA9mhIlTaZCjxSQIut4NQQKS8wrsdl?=
 =?us-ascii?Q?uYKgGm0v203SwLOg2rMpT1irbYkywPrmWgkbi2jR+gPESMZNEwWCmKTfp4UR?=
 =?us-ascii?Q?j1l8JaEL3D+1w9xIotxcaCdnUdb4OUhrB1qU1Zy3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1c3ecd-5623-47f8-8a61-08db9cc4cab9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 12:48:43.5667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npYOKHbFbo7xyJdiz3XvDFLHX+I5Y6VQN+FwjxrMUS7AxbZSjzq+UBos/fZw81li
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4444
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 14, 2023 at 12:52:34PM +0800, Baolu Lu wrote:
> On 2023/8/3 8:07, Jason Gunthorpe wrote:
> > What exynos calls exynos_iommu_detach_device is actually putting the iommu
> > into identity mode.
> > 
> > Move to the new core support for ARM_DMA_USE_IOMMU by defining
> > ops->identity_domain.
> > 
> > Tested-by: Marek Szyprowski<m.szyprowski@samsung.com>
> > Acked-by: Marek Szyprowski<m.szyprowski@samsung.com>
> > Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> > ---
> >   drivers/iommu/exynos-iommu.c | 66 +++++++++++++++++-------------------
> >   1 file changed, 32 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> > index c275fe71c4db32..5e12b85dfe8705 100644
> > --- a/drivers/iommu/exynos-iommu.c
> > +++ b/drivers/iommu/exynos-iommu.c
> > @@ -24,6 +24,7 @@
> >   typedef u32 sysmmu_iova_t;
> >   typedef u32 sysmmu_pte_t;
> > +static struct iommu_domain exynos_identity_domain;
> 
> Is there a conflict between above and below?

No, this is a C forward declaration.

Jason
