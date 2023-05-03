Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE46F6F583D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 14:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjECMy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 08:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjECMyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 08:54:25 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED01359F1;
        Wed,  3 May 2023 05:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJM2M2OSid0DCqYj9mYXhH/bKU1VdEL+57lInDoF+NENtlpnq3E4upTNHhTDlDXmqqyzVf8HbDnkH3TOvYowFB1UK2SQlziHbq/F35TM0zpl20oP0Tt8JRlXoAYavFHgmp/miK5SQWZMFdy3zWT2gLG8ABETv4ekGR3gGWPyK1w9U9qYc+/XjgY/+EQHrXTy1hwJINIVT9yRcd+0pGGMnfROG0w0VCuFS4dOglSZaw0vZUTNoMxPiqkE/hAQcclBMNWYgme18W1MS5fC2zqYp6oQAiVgNLgnQQ4SiIJTom5wzpEmhdJYSV6NR3APDLg4Jfenx11hMxzt8QkqzgKXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBXOqw/9CRGRe+kXshX8DH1qMCNt8jsbEapB6OsDke4=;
 b=ibfk34RMey87EJdZxZL4UknINnQnmxieyJ+Tr9QQtxti0T0ep1vqmJwCcglBMMSR0QeYb6RYdkco1fxwb8OF3xzxX1/PXR0JMtSpueKCzO5Vk6k7CjJIsrVVeMYN2km4p/O9YBDG87x3E6UZVp2YoSMvAiolepdEX0jAyY9FXyqBp/J1+jc+Lc37ZZFpovRHH5/NGl23ZEjbUkrhMYq6ZP3k9E6ji3CmdW0+7+VpxYd46u8xhooQhMQWy4/JLDh6AnVUQyhlcqLuKa+aJuEzCTcSXF/H7kZpMdsfRnWp0MnvToZRYlTor15sF148gxUSzJSTOKozBjNJ11PNmRd8fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBXOqw/9CRGRe+kXshX8DH1qMCNt8jsbEapB6OsDke4=;
 b=ZaM4Pa/18W0yW00470bHrTC+ET8ejMaEoaSEbrzxpZ+cXk3c5ZnQARMQTCL4ckYvr2TcLTRV0qDCoCBr/5a68m0uuc4oY0cX+JEyYH9yWUQpgMh6xoNua6xZ+LBBT7vfssFzuFeWV5MZlaJ7QoilZn2mFAKHSKYGh2L19Ehs3oUiaY09tPwT2HFLUzxhYbE4aGXsPdRffVbTucUfddcefQpiI6bA7pMjjnLktskuL7hpwK+JvsR9CFiSSHu0Dbu1JJvOxfpZQskve7JfJrT1C8QysgV30DbAh3oy1bsfomBW1WeKfa6QvdxudKR6eRDh/xdOcdrFp9xcYB8e746lLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 12:54:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 12:54:10 +0000
Date:   Wed, 3 May 2023 09:54:07 -0300
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
Subject: Re: [PATCH 04/20] iommu/fsl_pamu: Replace set_platform_dma_ops()
 with IOMMU_DOMAIN_PLATFORM
Message-ID: <ZFJZbzlU2m403fyB@nvidia.com>
References: <4-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <32aa1228-3eb9-340a-41e7-88fdd7c0a5ac@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32aa1228-3eb9-340a-41e7-88fdd7c0a5ac@arm.com>
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BY5PR12MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 498679bf-30f2-45ca-ce15-08db4bd57d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i8D+x4ExxPaGjtn2XyAPIUqI045/JZkw306v/5kp0NvmL8h4ZZKai+1KHQgPegeEPsJ5nAXiAayGcicEAyvHwzmvglucaIEEHRJyD32ciQzRViic27MtovhLIB1ww5uevSTU706L8zFpXgt9rDZONUIjkTZJD12sCeaBeSA/2bEtVMBM5OraB1Vommxy8jCTHd9XagU621+3fwH3aMRdeDVWq/agcFKppTWQ043dHXi2tnq8vINlDwzPADT1BdNH/hPjtIv4Cxuxe37GwpZDb+XHKw2QYL6kUgOqchCF2uHMeq7LMWb0OM1g5L6n/LdZXtOuYm/MmHb2xTdtQUa7CJkzDIyIYqC37gWY9coc4EscAtafY0Sqb73IlerJQLNIATxyOClVkXmC+qi/aZZybglgz5+vJ1zc5lFaTTehWldnvk5VyLHmnogsgXqEgj1qjMKCJKWzHgStjovnZhkEWW4m8bQyngIdsQXV9f7gRg82oSH1lbJ+xO/NrQGuyfHshjLihcWFcClhQo30eZyMlSeme/xoNmzRdVWB6y5uB+FwUqLBaltlky0h3Wpa+Wfv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(5660300002)(7416002)(7406005)(6506007)(8936002)(8676002)(83380400001)(2616005)(2906002)(186003)(36756003)(38100700002)(86362001)(6512007)(26005)(53546011)(41300700001)(66946007)(66556008)(4326008)(66476007)(6916009)(478600001)(316002)(6486002)(54906003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DZxpq+R+SO1hpwR0fx1XOW+6zjVZVvwd8gRm5xXIOBfI9x1wTU0iLPZZfO4N?=
 =?us-ascii?Q?TxkjDOLAOZqSAUQKqmV1Dg5DvkgPKWW7U9zn9XdSWegbD//jxRogcAwtmR0W?=
 =?us-ascii?Q?C3JAjQzYedCll398LXiifidI3X3KDvCPJZ16kFNcIY0thQRiusew8vqZkFn9?=
 =?us-ascii?Q?42EHMIAL5h2eXOhpyraCgjo4gNU9gipHb1BWbm5iX1645gsjNHydpV6Pk7zT?=
 =?us-ascii?Q?X5MOYZN1aBqIwcVuer9m3Kl96oZLIDu8q8HAyWjUBUASREaDzOjuwoXQlBMK?=
 =?us-ascii?Q?aSCcqTPVMnnWgYwjhCWJOi1pIOxgQJV0AblnS0LgAwnjXDf4wrdUhofvt3VJ?=
 =?us-ascii?Q?DKk8l/pvXVP3L7Zi+W/67kkg/bd3/hADGzHjUgCzuA8/2+JTMoqn9Vo+AUCJ?=
 =?us-ascii?Q?hvZaNYw9iSb/W3CkO53wnCKtttEyssfGo8u4xJKfxtyNbCMJcMB7xmZa+uA/?=
 =?us-ascii?Q?RhDGi1No2qbJz+JVrfdgMflY8WwB7dtJ0x5wb8l2hvCZhWtHtckIgF1ZTfL1?=
 =?us-ascii?Q?404wLaK1OpyOYr8kAe22NLX30bZhI5fqvko+gSW7sU+I+IzSeWZrEe9OY5UM?=
 =?us-ascii?Q?smKb7BiBaS+liKZYJGmc8y3K+xdoEpHMnQAoXzlWRvaEzcJYiEuT6PfAb7Vu?=
 =?us-ascii?Q?a4kWgYRETxCvkRIyy1/QChuqnVzt8L3AnHTGeImjW0OjW9irfpkzH1/KYaIE?=
 =?us-ascii?Q?xHGYsReK08Bhqp5Wkf2q/ZoSHxg8s5iiXCuQbI2aSNx00Ij2BKgLHQiZbhv4?=
 =?us-ascii?Q?5UwXBqyGe8OKpQmdUB9PlBBRlNaxR/C/lvVNA47AXYUQNZQN90KUxR4optIG?=
 =?us-ascii?Q?ZFaJGxFCdFZClrRfUqrLTfuLFgktpCLU4speHFhkrd+AmXdrwiOpbHfTf+1G?=
 =?us-ascii?Q?MslevuWxao+jYP1ZE/06U6iVm03x+P5uv+v6PHzeUgsQZCansZIIoBcO2wVp?=
 =?us-ascii?Q?jpH6EA43gs3Cc5nEbYyQBl6QQz+814lW/2pNHQ3n7MKxD623GJrIA2OQp89i?=
 =?us-ascii?Q?NNxGDXOS+eQHhBXCbgOLXwSyhbHeC+RTCoBs0ED5k5gbr3zsbzDyFzjSe0nu?=
 =?us-ascii?Q?8ZSNQezxT9qBhF8HOgKpIMC1dGvLAJKNum8uXY8QHctdFjoFHRLNs7RGAkwu?=
 =?us-ascii?Q?l08IOQTb/De5I/tSuV9zM8TsfI/+BPj+/lnMyP9wL3FX5iOc7+yQ3Li9tmnb?=
 =?us-ascii?Q?nUTwAgtZTb1pIcmq44PeJTGQ3udZOOTyg0oKB0xp641xXSdnYWU3xI0LIlq4?=
 =?us-ascii?Q?j4Cjof6pnJ8UwOo6PjJtJz6bZaTCgSPcj/kDnnsxjEAQia4vEttfQuBAlUHH?=
 =?us-ascii?Q?cIwn0nIXWDkvQVhr966aN6OKDFi2uX5KxoHONysOxVrMC5gRb7r8FKVs2wXR?=
 =?us-ascii?Q?+mQk5w5Lp8if2oy8XQMotpBOIqXokyeCjGUMv/Tfko8Wp4381NCTCqAkl33h?=
 =?us-ascii?Q?i53wAyxnS9kaTDo04yciAOVb9IlIQYT0ibQMW7s//7nwDL8sRqMhgXKfD9gn?=
 =?us-ascii?Q?p4vqPzHseOVpHPDAFNng1qjLSfe8CrH43smlZcwa00Nz+4iaZK0YkKI+U+0/?=
 =?us-ascii?Q?izck4QKcS5CcfeSdbwo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498679bf-30f2-45ca-ce15-08db4bd57d12
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 12:54:10.3059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjLQOyqr/UeAyMKXFk5Txe055mxRRawH7jyJvx47mhEmHrcGAo01Ak7ifSF8PGi+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242
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

On Wed, May 03, 2023 at 11:57:59AM +0100, Robin Murphy wrote:
> On 2023-05-01 19:02, Jason Gunthorpe wrote:
> > It is not clear what this is actually doing, most likely this is IDENTITY
> > behavior, but I think there is a chance it is BLOCKING given how the PAMU
> > stuff is oddly used.
> 
> Logically it has to be identity, since there are no DMA ops interacting with
> this driver (it's not the TCE IOMMU of arch/powerpc/kernel/iommu.c), so any
> device using a kernel driver rather than VFIO must be using dma-direct and
> thus require an identity mapping.

Yes, that is the usual argument.. FSL just seems so odd because it has
drivers manipulating the iommu so it wasn't clear to me if those
drivers were the only drivers hooked here or not.

> At this point I finally got sufficiently fed up of this driver always being
> the mystery weirdo and tracked down an old QorIQ reference manual, and now I
> have about half an hours' worth of understanding of how the PAMU actually
> works.

I'm going to post my other FSL patches for the group setup then before
you forget ;)

> Based on that, what setup_liodns() is doing is indeed setting up identity
> for everything initially. It also becomes apparent that it's never supported
> giving a PCI device back to its regular driver after using vfio-pci, since
> an attach/detach cycle will then leave the PPAACE invalid and thus DMA
> blocked. Oh well, that's been broken for 10 years; nobody cares. Call it an
> identity domain and move on.

Okay, easy to do thanks for checking the manual

Jason
