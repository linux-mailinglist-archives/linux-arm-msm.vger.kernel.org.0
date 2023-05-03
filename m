Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE0A6F593E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 15:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjECNpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 09:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjECNpT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 09:45:19 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5395BBA;
        Wed,  3 May 2023 06:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWDsw3lis60pOxJsCxeTf3CrVlDbR5ofJqcsHCHVpDSfwgxoABcHH8bUbNfhrIj9LboBYPH3dEfrQi514jbwCtz2Z97pDn0yim/CkVn0juEd4sv5UZDq1w5VbnMtRAJFVGRpPBj8/ClQwYlwoASZoOv0zrHfMgQ3BEVSG14Mxn1XffzBRPfXOEIEK092uSzvrZPKE03jzYmf38mfqqlRtKVCv1W6XVCO9QzZo0nCkZPEfofmT8WeipMhd541722UdCpBroBaQq0+gfklTERJqN5jA5R/tUcVAO7CdNaRWtPkdAbyO5TizX01RCrQe8OXYKiVdOjUyo8wRpi7TDeqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWBH+FPAJeIOXoNU65jrAuk/Q3lzFQ9sLtzi5QbmxSw=;
 b=MH9Ww/eGlUR3DkPMVQ7Pf1M9i5SdnUG1+QM5ZvFE7enSkWNfvoN40XKJ2NnPmCpp2JXkjgsqVqFR2HPbCr68b+uj6jSkxaUIrflCnc5qxl9XDtcLtN1xu1cafGxIoQNKkeJaLQ5JZ2V1R4GDsVAZIf2vIGxk4A9VBN6gYjLrb95XjfJQKsaNQ4qOTmU4jlicxHxofCRit2LqdfVUbAwyERA+epIDo0GbapqIluNPZoNkyti+moKaR8oE0KqnF5uieVmyDeulmORvksrq+sKKAXVa7HPmWv1uTwWsoutJF9bkmHHtQwOXDf7dsCZ3xOJIFxiY67g0df9XpAJBDNgHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWBH+FPAJeIOXoNU65jrAuk/Q3lzFQ9sLtzi5QbmxSw=;
 b=jRv7EuJcul/DT+BcWM6CFgu8wgg2of2pMksdgAJypjksX5gIuKz+Hh32Is9q1v1HtQ5NA6Rz8mTyilJ80K4Rl4KsVFC4S65Gr01+ZIVzSXi13+8P9alQUGYY/cii7WqXxSLMz4/X2BmC2a50ReBrgydDEATHQFW6G4KCpSqXWolsiGeGvczhBMIDeetwLLZ07WVJ5C2Kf0XVv0o8Gqg5eI9AlZnOBY7QoD0ulrIvLW+ukZqNT9cNpexR47wPw02ZaC370WQqcV4xLPGLM7PQrih+aIvn5o1IB6LSrz8err/dEtrUiEhBe/K4vR4J3S79P9SOxj9cnexsO2lCyzX3lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL0PR12MB4852.namprd12.prod.outlook.com (2603:10b6:208:1ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 13:45:13 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 13:45:13 +0000
Date:   Wed, 3 May 2023 10:45:11 -0300
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
Subject: Re: [PATCH 02/20] iommu/terga-gart: Replace set_platform_dma_ops()
 with IOMMU_DOMAIN_PLATFORM
Message-ID: <ZFJlZ03lswl9uHD0@nvidia.com>
References: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <1db712d2-9e33-4183-2766-34e32f170507@arm.com>
 <ZFI/D6mnLKYpdIqx@nvidia.com>
 <1a995f30-31fe-354f-ddfe-e944fa36e7a0@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a995f30-31fe-354f-ddfe-e944fa36e7a0@arm.com>
X-ClientProxiedBy: YQZPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL0PR12MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a5a12b-9440-473b-7541-08db4bdc9e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AuyOdXMi+eNNJ22TfDgWcuBGYy1xWpsCUNkOyKkPWY7ZHR71ENGJDJ2BswxsfQUrEKVpBKGhCzamhmvKZLOJLH41JhtWD35iJmoF7Z9QDwVh2Q7oaGTOrP1Yw1fLaUNQCvK2m2qmQecB0aN+6LBzvljAo53d7k9KUeWfZ6kVCLXCtr31dVjzgQQ5b02bZou2ceQM0A7Hbd0EP5jTiaoWXV2k+UDxj0U4/GV0MFCFGm0T92Q7BR6Y8+Y4sd9J6hWxFhNfBs310uAayVfQmya4mj1eW+naMVD8DCgrtwfCBd8j/1BwPdSP//9NqK2oy+6E0DplauZMrT8L3p5t6bQaolbSsRKmgXqrWWwq+/JpbO1nDnOc+LJ2Rj6XIrzXIFgwDbtvlPaEAqY87A15xIZwAW+UNTyoLWsICGpCH0lrqP+Mw6w8ggtuq4FaK01ElrUnKDVgG1JFuI21NcDreqLuyi0Lgch9RLjVLQHxFd3OqOfxJP0MbFDzWzHRQaarnCdsxPP82MDQUmK5MVkjY4dKSHFmoHzRc1s1vI6gYL6nPGJ21dQyo/ShsK+DGyY1Yowt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(2906002)(5660300002)(7406005)(7416002)(36756003)(8676002)(8936002)(66476007)(41300700001)(66556008)(66946007)(478600001)(86362001)(316002)(4326008)(6916009)(54906003)(6486002)(38100700002)(186003)(53546011)(2616005)(83380400001)(26005)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PubmFGjujBwCu3hKoFxzUQDSI9RmReowcfQlN1q0LqjIXN79sjbd9HT4gMOI?=
 =?us-ascii?Q?rm9xWVsPEYSUvcngrduwq0UBwndBWbLBn7Z06v7mb2zVErkwq0kE3YjwAwdL?=
 =?us-ascii?Q?BjvsxRpH9bB9irJSuKd6KGzs9PsMTTtR0+I8wjFGbdSWJai4ANPR4Rj2YfA9?=
 =?us-ascii?Q?XbqlhQ5fGK8B3CgxwdE2xwKglZL3Ta6XbNQ36llzKn+r2eloQCbpZzFmzJPG?=
 =?us-ascii?Q?kLaN41kDH80MBhsnZemsT72ssLWHQPYb9XmE3pszWOpB60fg6VIcjiHDTqxR?=
 =?us-ascii?Q?m8EE6Xx31agJw1mVYsUb2Me5PU0Gx6ChKEJNkgBDpJBd8SU2LKoHjdsbtNTe?=
 =?us-ascii?Q?Xf/c/2gzymtiubeaRQtiX7Uah9sogfBuOOu5FNfLEQ3y8A33moQ2tDhBUNPw?=
 =?us-ascii?Q?fGG89FhcY92Ger0ADzbUrS/VhJv0xC6V9vzJ1kTAoOaAAxxN77NibM90dSFE?=
 =?us-ascii?Q?IY1+pm6CSwfm+IwPPhrRGtyXioV+oQ1QlNSjGXIQW/2d1T3kAwKsJXnNfggE?=
 =?us-ascii?Q?yhql64WUm6F+UsebAxTia8+obfiF6sWJgAR68FdQdCLsGiQ8Vnwl3RRfsKko?=
 =?us-ascii?Q?uutylkt5WI2GJGH3UKabPervj9ywu5j00m3K0hrrAdr7GlviuypUbFJe64Pi?=
 =?us-ascii?Q?JMdGqkG3cz2EmosGjWV82yFqmMctllbZbTUvXu+kSCdfLjNCGS4zfQaI5a0w?=
 =?us-ascii?Q?45zyua/7xQwe2U85B9Qu5pO8pSBzABvF1fx9Jfyf2D4wP5FVXHgFySGwbtMJ?=
 =?us-ascii?Q?iJMN5fLxcM9yN8P5fszrVNlL9ZSFm/E8mvOceXEljVxM7UKlKz06CA4xCk5X?=
 =?us-ascii?Q?RIJg6aLlSD1d8Pfq800CxtFc919EGYnXrFrA8mCfYBzr7RpvRDLshGzVypKs?=
 =?us-ascii?Q?QN9UW5ErpK/xfnXrTYhVmy+7BECvo/tpdlkmeemEHfzbxfw/4/AMvHn7NNPj?=
 =?us-ascii?Q?rmpo4a1IGjXvPHHA1YNlecEQuzqnyHeDDf7jTsp6ZhdqnT6OR+5HtB/E1ThN?=
 =?us-ascii?Q?F9KF1PdmmqnzLlsipPb3EZYJwOPXqXRId6UVTkdsWZBu9N7U4eaRKvOzq5ES?=
 =?us-ascii?Q?yMo1kqlMR1363Dk4P4W3lYFEW44fZvNmCtTIfVJ+Kp6BTWElhgP9bXjGhhze?=
 =?us-ascii?Q?2VWhyT/IA+LrJqfVsBaAbRyVp5V0AIRC/nLWeix0Q/uZJJnIt7ofrnYu2nAK?=
 =?us-ascii?Q?cskrJbHuQTK+buY/eTcWRAiHoVjj2B+d+a3Q3UXFTk5Racg85XaefD05N0yj?=
 =?us-ascii?Q?PUR7XY9pYCEaXnGVMLbGytmHKHIg5d4gUw4WKR4Vk0DaGnVqbNj8ZA1obm12?=
 =?us-ascii?Q?wd8QT4CTNGtDFCbPu40V1s7IQhn8hBpTnIo8jfE/4Ng44VS5DvJjBHljvQMF?=
 =?us-ascii?Q?JHId2o8gO8l2yq2QfhW53mBFj+BCspKV3uXIU2hq0jiuQJRTCdQsAiDnwxnE?=
 =?us-ascii?Q?FCEbkN9sC27j47+H+nvBmQR90vZ4sidq3BdOuyZyeRsrS39JU6DApBlwDUEz?=
 =?us-ascii?Q?vShF5S3ArZ9TRTLKmfqJhsWoiQfK0NyS5mIh/hNG0EjWgOvfD9kLM+emG1ar?=
 =?us-ascii?Q?+WEDloIFaFdiXykFvmM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a5a12b-9440-473b-7541-08db4bdc9e96
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 13:45:13.1336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdRu2TDS84EjqRKVk0VNNnmT81UQjgj6g7OYrULP8LVBL68Zy0e2RPQADEF7UR1p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4852
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

On Wed, May 03, 2023 at 01:01:34PM +0100, Robin Murphy wrote:
> On 2023-05-03 12:01, Jason Gunthorpe wrote:
> > On Wed, May 03, 2023 at 10:17:29AM +0100, Robin Murphy wrote:
> > > On 2023-05-01 19:02, Jason Gunthorpe wrote:
> > > > tegra-gart seems to be kind of wonky since from the start its 'detach_dev'
> > > > op doesn't actually touch hardware. It is supposed to empty the GART of
> > > > all translations loaded into it.
> > > 
> > > No, detach should never tear down translations - what if other devices are
> > > still using the domain?
> > 
> > ?? All other drivers do this.
> 
> The only driver I'm aware of which effectively tore down mappings by freeing
> its pagetable on detach was sprd-iommu, and that was recently fixed on
> account of it being clearly wrong.

By "Teardown" I mean deconfigure the HW.

This driver is odd because it doesn't store a page table in the
iommu_domain, it keeps it in the GART registers so it can't actually
detach/attach fully correctly. :(

> Yes, I'm not disputing that we expect detach to remove that device's
> *access* to the IOVA (which is what GART can't do...), but it should
> absolutely not destroy the IOVA mapping itself. Follow that sequence with
> iommu_attach_device(dom, dev) again and the caller can expect to be able to
> continue using the same translation.

Yes
 
> > If the HW is multi-device then it is supposed to have groups.
> 
> Groups are in fact the most practical example: set up a VFIO domain, attach
> two groups to it, map some IOVAs, detach one of the groups, keep using the
> other. If the detach carried an implicit iommu_unmap() there would be
> fireworks.

Yes, I'm not saying an unmap, I used the word teardown to mean remove
the HW parts. This gart function doesn't touch the HW at all, that
cannot be correct.

It should have an xarray in the iommu_domain and on detach it should
purge the GART registers and on attach it should load the xarray into
the GART registers. We are also technically expecting drivers to
support map prior to attach, eg for the direct map reserved region
setup.

> > Oh yuk, that is not an UNMANAGED domain either as we now assume empty
> > UNMANAGED domains are blocking in the core...
> 
> They are, in the sense that accesses within the aperture won't go
> anywhere.

That is not the definition of BLOCKING we came up with.. It is every
IOVA is blocked and the device is safe to hand to VFIO. It can't be just
blocking a subset of the IOVA.

> It might help if domain->geometry.force_aperture was meaningful, because
> it's never been clear whether it was supposed to reflect a hardware
> capability (in which case it should be false for GART) or be an instruction
> to the user of the domain (wherein it's a bit pointless that everyone always
> sets it).

force_aperture looks pointless now. Only two drivers don't set it -
mtk_v1 and sprd.

The only real reader is dma-iommu.c and mtk_v1 doesn't use that.

So the only possible user is sprd.

The only thing it does is cause dma-iommu.c in ARM64 to use the
dma-ranges from OF instead of the domain aperture. sprd has no
dma-ranges in arch/arm64/boot/dts/sprd.

Further, sprd hard fails any map attempt outside the aperture, so it
looks like a bug if the OF somehow chooses a wider aperture as
dma-iommu.c will start failing maps.

Thus, I propose we just remove the whole thing. All drivers must set
an aperture and the aperture is the pure HW capability to map an
IOPTE at that address. ie it reflects the design of the page table
itself and nothing else.

Probably OF dma-ranges should be reflected in the pre-device reserved
ranges?

This is great, I was starting to look at this part wishing the OF path
wasn't different, and this is a clear way forward :)

For GART, I'm tempted to give GART a blocking domain and just have its
attach always fail - this is enough to block VFIO. Keep the weirdness
in one place.. Or ignore it since I doubt anyone is actually using
this now.

Jason
