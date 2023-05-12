Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1CE4700FF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 22:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239134AbjELUwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 16:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233853AbjELUwe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 16:52:34 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC34A10EA;
        Fri, 12 May 2023 13:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVptgSzBtU85Zr1RVj9Wx/XdCxztyWYv32Q3j5iDyW0f7aJJuh36ATlEX39o+dFLGBwN400feL+DaatKwFn4LnWDx9nzEs7tqXJkCWEJBu/LnP24WDgj/MiQbSfHNI088RRi0PQJHo1wVt/bxVAEIsnWS/iY4VcFxRM8BR9OpsW0LUmP1qFUSKn0Ok6aVEVF22Oxv9PIdoLMV4pUZlUzYqMHHzH6ijoqIvYR/0hfe4Hn7vHGoDHWZz/4gY0uoy4Kpo71oH80gWAZUHRdAt5bfeclq5Fzhfo8EkpTYofsAznIcBFG5I9dg4PRrAv91CGxsrWA91iH6mk3pGcQOHISQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efScZjkjmic7la8z/qAlJo5TNkfYpCfcYfV3h4narFE=;
 b=Nz3a9/MV2nEeevJKlSGMR8XplPFHNO25UvOIbbMav26RA/9ZEblAlRSjAcu1k1MmU+XnOTtnTlhzH+9HDoqBDntQph85Hfqd8cXUcOiHBgZxv+SArPNB2zbSD6AHH4re3MYn7jrjdnFBXN3vD1b7fdNPy1G2xZ7Luqzd4FYYUdsUzDwwj1csqZ22MNeQcNyRAALJS8x12YkwGkYekWdGlwEEpQgsVZdXW5VpInRHtsS1HRMeIh+UXB3fWhDpkHRwP14ASgtZwrNGfNHPaPj2yDCqolU7nb8+5aNum65xhK8ecbBsDEVL3J+GuTPBbix2kA2Zhdde1vvaH7DvEo3fSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efScZjkjmic7la8z/qAlJo5TNkfYpCfcYfV3h4narFE=;
 b=SXqigWThFFPY4vrs9IpK404+EPyF01qzNa9Csoj4eEgwxTuyPPRZTAQFGyTenmGXexgG16M9jwBL+7Lbp/8HbdXaJf4uKYV+xwNqFNMOhZCT58W63nBb8/ljTFQto63R6sBKkfRzt2d/baqkIq1qiiq5lMH80E1RpQh9k2A/feE2EVPrkAYxfxrczLzWROM+PR/1C8vyh091CyNUi3hsrwWpg4i/+Fm8znKISe0QUKv2/YQpCp567U3ho1G27p4mDj08sWg0ygo11I168mjuHCTBYewBsNnpB8ZW2KwUKGFTO8TdzKZ3Iu3stluauUlK6cSKw/cYUpKT3NNShxuq7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Fri, 12 May
 2023 20:52:30 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 20:52:29 +0000
Date:   Fri, 12 May 2023 17:52:27 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andy Gross <agross@kernel.org>,
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
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 02/20] iommu/terga-gart: Replace set_platform_dma_ops()
 with IOMMU_DOMAIN_PLATFORM
Message-ID: <ZF6nC7fvmaNZNph3@nvidia.com>
References: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <1db712d2-9e33-4183-2766-34e32f170507@arm.com>
 <ZFI/D6mnLKYpdIqx@nvidia.com>
 <1a995f30-31fe-354f-ddfe-e944fa36e7a0@arm.com>
 <ZFJlZ03lswl9uHD0@nvidia.com>
 <ZFJzKQcKNFHdIWqy@orome>
 <ZFKXz/HWFkYOJrgT@nvidia.com>
 <4a5ebc65-a384-a8df-c692-ca114f1a018d@gmail.com>
 <ZF5uKPhpBNioJUwL@nvidia.com>
 <9488a2cc-fbc6-6c1e-58f8-e2e1dc5db579@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9488a2cc-fbc6-6c1e-58f8-e2e1dc5db579@arm.com>
X-ClientProxiedBy: MWH0EPF00056D05.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:e) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a442b5c-4d49-4c47-17c9-08db532acce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XfdKzJ2+8zMFLBARctyz8DdIysXLM9aMKpNjOZac1bxSiNgys497s2V/XsSuhUVbbRO96dkBv9IAb1PJFnJpiu4G5mV24AH4OfURTW4PR8P03NIARIDbR5NxgKG9jygLjCjYhYLpE9MlvxfdKX1qAZgN4ixmO93hz4G6+MmAsuIsdJ/+XBqKNvOzCwLzk3/dKo5+B2kFFtzlJUhZqd2ahTHkeWIaOHAPEKStgLiuO6J9+DoEOL/AZa9f6dwjE8Z0laBP7vb0Z0JDLWLB+hcQTwmcp8eS9yL7s3jy+DEarU3oi4PHOBSqKP2W1WbJSgwhp6mpiKQ9ppRJHoRSZMVWqx2DCkucW/rngR8FKJfpHBC4qbXUZ8zo2+i/C3NuuEOfmI9B42Lz4OCShGy4S5gk7UUIq5CJIdzIqoYdeLivEyALvQkM17A/UruU09nB5Bq3LDhVjAD3jeW/V4J+gNe0h5j+yA2aYSvqsIrSyUnblUZqCaJ3AtDQCZVMF80Sl6zqxGhWO+x8m9Mb/ZysWcGwnBwSbvqhFDMjYrCRPY06ADYvHZ+sT6IV64fICvIQBClO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(7406005)(6506007)(478600001)(26005)(316002)(7416002)(6512007)(83380400001)(41300700001)(66946007)(66476007)(66556008)(54906003)(4326008)(6916009)(38100700002)(6486002)(2616005)(8676002)(86362001)(8936002)(2906002)(36756003)(186003)(5660300002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iByBEW7V+hdwnnMf3C6nVnRgkFI+mQq0zbKNwjIYdqZdbdt0pPpII+b2NZ2K?=
 =?us-ascii?Q?uelOeKBHNG4MlCvLE9T3GESlLNV7PVy/m1jQf3EAnbaRGKnF0r10UtFLEXXQ?=
 =?us-ascii?Q?+eHes9PpOXuCsebNzzUZtkWcwVqLUwpbt7k7NpfQs6odJoeqRCxtO0erCl2j?=
 =?us-ascii?Q?6TelzDKUUgfrRtfRTFEq0bAMyclv10tgfxl8zxUgBud0NTsSJGMCaNXBVQv8?=
 =?us-ascii?Q?5LdEB5y2QV5sWVU+QabTzPvdttl7kkmeei573TkzeOGTSz8GYCQWxQPksTIr?=
 =?us-ascii?Q?jC0QYbp3VyB+eAAKqJObeivSdsZEHjym/oU8KZV9sR+6+0k4Ad9SZp44do9X?=
 =?us-ascii?Q?GrXZoAi8XrBwbvKQz9q3vFkSjAJaaq7O3zKySndvIGP3hUbmjmxaRCHDd4Xe?=
 =?us-ascii?Q?HnpjleOhS4pJWtasUhLadi3xD0fIh0ys96oND4nG8GnstBK5gX/eG7Tj75af?=
 =?us-ascii?Q?NYnMzogU4yWj59VnTODvKdsieK3tQdB/8NK04NMJgMfpsNNw34R9Zvdz9gOP?=
 =?us-ascii?Q?6QLENxKgZPMs8hfvcFlbh0rvf6zLkZIW2xYxqPm27sYMuY3CLgurU4RPiZbb?=
 =?us-ascii?Q?QQ86fRHduNKPAKyyTBm5k0A5fDiVn29D7Ni/kRaazybhTXKQmJQ81MNzQStn?=
 =?us-ascii?Q?dghiTnXiKjagfoN8u0wo5ug73xrU4G+0LbM1mcel3zgX+/Dlg2PC12Hb/QGh?=
 =?us-ascii?Q?d2ilq5AL+ycIm01MtUW+tvHVXzCOQjpB5UnpndHeCCByWxG0blQaJVVR28Te?=
 =?us-ascii?Q?bju/VVuMnvEYDFsFxX9pqq73XCDohr5UlRfIbwIYk8Uf9Szwt/WleOsgxFZ4?=
 =?us-ascii?Q?a8dz2OtlC4DrMeDM1XPPCCeO+jj/BNy41DSMCxJx5G3vUW+ggBpAtec05gw0?=
 =?us-ascii?Q?pJ+aAJCjx5YQILftcGqK6bN2nbEhsKV+OYuGY0jLnXF51NZDIhTJ3Io8Hxf7?=
 =?us-ascii?Q?SihS84WWE5KDjNph7CYvjB/6k9zR0dIIP2E6+xUrd8iucEENARpVToK6Eu8d?=
 =?us-ascii?Q?smKaUwAQ9vBv2kwKiuZwSGj0YGxPs0UWB78HxJ+Z+NnqXzd6al1M+j07VMVb?=
 =?us-ascii?Q?qCh0CoHRYne0Bc+HBohHWCMZM4d039AayEloEX7SWkC0g6+z++wW0zr9ZyUc?=
 =?us-ascii?Q?0gt/KXTvvMbYRy03UlcrvlOZ9c11yIK1ZgeNejWwbCVohGC6TLer2ValxWp0?=
 =?us-ascii?Q?npdxpRRSNEWG7RxAIFOsrtu5oo6chhrwdPk1ociNsWwKJO8CyqX32FFtG3zN?=
 =?us-ascii?Q?1JusmxYbh7KVap7yBMtD1yhKCM+nkGSH+dEktwpq5/SwkIgIRekxB71CGCaq?=
 =?us-ascii?Q?EYWIV3DECnP1t9bf58pDWSC+eUU6LOTHwvapBn+miyLzCwrlv3fw5ImDyutl?=
 =?us-ascii?Q?FMnc/nhbFhurCvTnWiZeTXcfWoAMqsxpsrt6G49OL8s4kmSpl4cTX4l/goX8?=
 =?us-ascii?Q?ERIWbHmqxSY18iUODcoEyN56wLnYo5dKMygHI0RMxMbPiPWWVNxhIv0X5iBN?=
 =?us-ascii?Q?Nnjkk+oGM8GlyIU5kCVVVL6kYw0bxDpHrvnzCrU2moVgyRP9DabQUBfJKn8W?=
 =?us-ascii?Q?aQxn7NjG6KE4lp9rw6E=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a442b5c-4d49-4c47-17c9-08db532acce9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 20:52:29.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9yW1Skn+kvOBwIRorqSo1+xEPGwoWewzqFjQyIauZ3aPe7npwZ77g+wxw9Dakrd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 12, 2023 at 07:12:21PM +0100, Robin Murphy wrote:
> On 2023-05-12 17:49, Jason Gunthorpe wrote:
> > On Fri, May 12, 2023 at 05:55:23AM +0300, Dmitry Osipenko wrote:
> > 
> > > > > This has occasionally come up in the past and I seem to remember that it
> > > > > had once been proposed to simply remove tegra-gart and there had been no
> > > > > objections. Adding Dmitry, if he doesn't have objections to remaving it,
> > > > > neither do I.
> > > > 
> > > > Dmitry, please say yes and I will remove it instead of trying to carry
> > > > it. The driver is almost 10 years old at this point, I'm skeptical
> > > > anyone will need it on a 6.2 era kernel..
> > > 
> > > You probably missed that support for many of 10 years old Tegra2/3
> > > devices was added to kernel during last years.
> > > 
> > > This GART isn't used by upstream DRM driver, but it's used by downstream
> > > kernel which uses alternative Tegra DRM driver that works better for
> > > older hardware.
> > 
> > It is kernel policy not to carry code to only support out of tree drivers in
> > mainline, so it should be removed, thanks
> 
> Aww, I was literally in the middle of writing a Friday-afternoon patch to
> fix it... still need to build-test, but it's really not looking too bad at
> all:

But we still need some kind of core support to accommodate a domain
with a mixture of identity and translation. Seems a bit pointless for
a driver with no in tree user even?

> After that I was going to clean up the force_aperture confusion.

Oh I already made a patch to delete it :)

> TBH I've grown to rather like having this driver around as an
> exception to prove our abstractions and help make sure they make
> sense 

Except nobody else seems to know it is here or really understand how
weird/broken it is compared to the other drivers. We've managed to
ignore the issues, but I wouldn't say it is helping build
abstractions.

If we remove this driver then the iommu subsystem has no HW with a
mixed translation in the iommu_domain and looking forwards I think
that will be the kind of HW people want to build. The remaining
GART-like hardware is in arch code.

> not like there aren't plenty of in-tree drivers for hardware even
> more ancient, obscure and less-used than Tegra20. FWIW I have
> *20*-year-old hardware at home running an up-to-date mainline-based
> distro for a practical purpose, but I guess that's considered valid
> if it says Intel on it? :P

Well, We keep trying to remove stuff across the kernel.. This week I
heard about removing areas of HIGHMEM support, removing ia64 and even
some rumbles that it is time to say good bye to ia32 - apparently it
is now slightly broken. Who knows what will stick in the end but it is
not just ARM.

Stuff tends to get removed when it stands in the way..

On the other hand stuff with no in-tree user should just be summarily
deleted. We have enough problems keeping actual ancient used code
going, the community doesn't need even more work to support some out
of tree stuff.

Jason
