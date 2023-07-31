Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8082769653
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 14:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbjGaM32 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 08:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbjGaM3Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 08:29:25 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC083E46;
        Mon, 31 Jul 2023 05:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvH9UWJYfts8U1L/wayxWlUgCLQ+Y0+Ku/apIC6QlpW8/atUfANmdZcESEhY9YmGBIP1I0Bjj7rb2OZG4OMCF4Mvsbb4Di3ep79TvzY6YECrJvgSfcgd4xgeZ+Hbw+Yx5CX7bq8vm8cAXwBJtsaMSOK1aPNtJBYbFXmR8TbdR+ns46lKXBnsF/oMJZdlc7ir8SZyF0OpdwWt8iVWJpDDZ6V7oZLnf4a4IOvB3DHu0GT4XEnnrMKKZo9xrTgXJbf5H51Fx/CVvTPzuhKtjW+axzlQhRKVdSMaawahHJn+/YMHBxF0BFRQJd6OqIBxq01GhOdp3opd3b+dqvbPqEbzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtEQgwHL7QaCkNYds3zauhwHQxjzmUu3ELTCUFR8EE0=;
 b=MQ92IDnC8FwGlTuf3qXLMki5PkgS+a7GPS48gc8Jve8OS3Men00+vE0KBX9BkNoO12Ez9pLL71dZRlShcUCOznBjkSd3m4BLshEXJzznfVQSm/Rg11LYvmfs7e5JB0rgOcObOxE/UKbZt7ZZzDeE6CEONXifWtPm9wd+c6qmuHJaEGbv5mqBWfWTqrid+WeJAL1TV9mFCXTr+f7HuAzLFC4KQ+i1qlD9wJVVE+3Aw46ztzw0kqssbMCyxBcF7u0JCQxx6qs3tJYNd1N2NC6crz30FvCgL9/fiUfZJr62MOpVv6LqZAkpfSU+gc3d9xRS6+Zj2WwVnCf9G95fD8A11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtEQgwHL7QaCkNYds3zauhwHQxjzmUu3ELTCUFR8EE0=;
 b=FnC7QWEkdR+1LH6gc2fg5dNKS9rhYRIT8tx1t20T6IIdVwu//P8fiAD4ecD/P3Zykd+rTc8Frno11B+NRlnxbF9nevLENwtyDHw/pXV53CS8o9jxq4L2mKrJQXCVbIrqMMdMa3d8VGiTUDCWZT7ezPRBFjmr8SxkrM5Zl++3+p8Had7FW/GmtcOCPqH+DJezVsOm7NMmvwDR6Rl7BGtW1qeIsD6s6XI2KhYdBmk8mAAgNGztC1WiE1Qa5Zf0/jE8T7h0CkQLKHVngJ+P1ot8QKiaHblwDwO2mE9QBXDO5qnJ3Fu3Zs5npQpL2C9OAMK/tvGxcnuAUYXDY212rMN76Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 12:29:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 12:29:20 +0000
Date:   Mon, 31 Jul 2023 09:29:17 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Joerg Roedel <joro@8bytes.org>
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
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 00/25] iommu: Make default_domain's mandatory
Message-ID: <ZMepHZrLFURXaIoZ@nvidia.com>
References: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: 92bc7af5-e181-4166-70c8-08db91c1c36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kSZqP2P0Fg/KhGLhsvonoUuG9S6jGNf1722Goaiic9/wF7BOn+23Jdh64yG87dY17wLCHHLnliclrPMgCiaFgFPUMYtAxzP1OuemzwaqR7fzdyMnjQMtOf5E2Y2gXYVPkN0vBJf3bhJMkCwYdufwTvp5T/dHuYPyFZLbFuzlbrJM/n6ZIOeezKRgkVNwFEt7ON5SBVwR9fq4sLvHqdj+TMHSsGhoFDgiHJg8pNFSJ9hCXB4KkQpNKFBWLslNCmcwTW0Z9yyvwYwVuIKHCjmBO+V1iS7c+b/RRgDWPv1K+Cyqj87n99yYPHqIJcBxpN6h6CwslPQsLeL8G+FBa+0oe42Xo+jPm9h0XwDWZAFXMdFkMjmcgUtQj+b6Br048T5fARODvXxpCe9akNJ1yenVh9REL8BK1WCnmiDqvUmZFyTAWf3BS9yA3Km1vwnohsYf19gtJyX8Yg3lqLvWYdLTD79DR6p+kEIC0yJDdEH/TWVMZ1DywqVxZzqd2OStf0rWslZcEj9kCubOMD0X9NGA/aXMhvOCorlyzWvuAH7RCORFNgK73OluVtP29UEppPwv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199021)(66476007)(86362001)(8676002)(8936002)(316002)(6916009)(4326008)(5660300002)(7406005)(7416002)(41300700001)(66946007)(66556008)(54906003)(38100700002)(478600001)(4744005)(2906002)(6666004)(36756003)(6512007)(6486002)(107886003)(6506007)(26005)(83380400001)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N0wzJB4BCCyjz2G7e2GQfDtBH+pIrIFkcniUahLMQLSQMbCKgOr1KpkWuF12?=
 =?us-ascii?Q?CZOQvoo6SmYmOJkt56Y78ZUgLx+WuSRCxX8jMOC2Y3dAHUlX4SlmARoYObDZ?=
 =?us-ascii?Q?+WVHwkqfPDaggpWUh67DH8phZdVtczYeg4Fj/QTeiUHcGmM8g5WiOEi2dZ70?=
 =?us-ascii?Q?TBAot+Mh1QuUbswLXmECDXchC+ptg/zoIe4C3DwBmuZG9rVSZQFmBPyFi6fV?=
 =?us-ascii?Q?rdsqmkcPgwAmeyl23C8qi3nqMk50QEcoVXMpdnzcn1qLNjejjw2hmpbRvlMb?=
 =?us-ascii?Q?l33FIWOyQOLj7XcGRBpXMnLXUpNIeumxlLopC2G/i5SIEWHo/vRtyh30oPQW?=
 =?us-ascii?Q?9n1b/fZ+A9XWASyDwBDS5wNkEAKDYvOvV2mvcNSPvQomTXs2Xi3trMfkpL+B?=
 =?us-ascii?Q?QasqJS8GsjZGhf5gOm6AIPuQbyjdBj2gqyv7hEKF2pP4Fus0zerqy1+o2b5A?=
 =?us-ascii?Q?3gJ5Q38alKBessLVtC5WLuuRlJOSYtGUASmXvRWDFxjbdCmmZAgr1ASDOYvs?=
 =?us-ascii?Q?E1wXbXgyjX2gsPwgTq7OSvxsKA8zOPLKvVMvLXiWHrVLlfWA/8wvHYAcM+aK?=
 =?us-ascii?Q?DwvNzXPrbbLHW6S4oeQefqE5ReRqgwEFdRjGbrVT8Ub3MjaNnSpSaS063d3c?=
 =?us-ascii?Q?hNwI1UIvXCOpjDBf4sqLqTHxnT9vub8SKAQj15+4IzQUBW+Njw5eDs7zLdS9?=
 =?us-ascii?Q?jBrRQsbT33aWKl+b3xqR8O+KtUKVlFEw6Ne9MKn+8n+RzoCDwmu3zdh/sVyh?=
 =?us-ascii?Q?MCXAbe36S6xSRX8enNUr2oRYv48rYMBG521CtjTp3TD7Zuq9irSHPoZMMq0a?=
 =?us-ascii?Q?qs/xccM2B7w5nBnODmDYW/Gp98X8gI9KUe62Zeqitxh+qzNGfe5RvwxbY8lU?=
 =?us-ascii?Q?bUdcV+cie9wjoBqC0aprnywT+yP1MJuwwo2lwOtjXY7xeUjGMj502ibfCTt4?=
 =?us-ascii?Q?Ff4wcQo+hRD8H6xXReUIpWCvMvhvvgAP/uzvbblYfotzXzKHpZ1+uvfaCPu2?=
 =?us-ascii?Q?kNZp/xXoM002Zw6KuGf3LICdm85zODHNBQM46ew+PU33/fRnwt837y3u4NK/?=
 =?us-ascii?Q?7AUsI8JJEJbQjFo4E4DfAuVtfzfCXvB1S95RuM06kPYiwB+54HBuydtlTbzr?=
 =?us-ascii?Q?0eS4L0XLwPMo/Q6vnEjZdI1AEf0w6UiCeq4N8jzVqtFWVYtCd14OM72hPbqG?=
 =?us-ascii?Q?2gZhdEBrqra6MkMWEEiUMDLacbHEdOodl2dMvuAYb/JPOWVRKXQLNMpK9fbM?=
 =?us-ascii?Q?3cjrPZ17bbltTCz3YC01gVl4YuN8NUxujm1/Z2jy21RzdqJ4J8iLuTsDqUOh?=
 =?us-ascii?Q?sClBj8slKQkmaLr7qF7QMgJwbFXEoBbwJWOk1CtcvCCXcYj1VP+etdq1ClHw?=
 =?us-ascii?Q?BDOLtS3wGMKukwu0+V1aHHIz0l60mXFP84BnOPdpO7cZaFmutuppyA0dXOzg?=
 =?us-ascii?Q?rT/Rfqs94NQKJQ2n9pb2IsDQaHr26fhU1iAxcJq91bJNMehjEAT9NWpPvLsY?=
 =?us-ascii?Q?nP2jH+A0UNM2ylEPUcidtdPwmErNpV529dsW1sv4T8wz4CrnIGRJ8jbJ6mk+?=
 =?us-ascii?Q?oyImrhUtLrzQkTQjxLo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bc7af5-e181-4166-70c8-08db91c1c36c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 12:29:19.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0je1o1rY/zdIQywA98c2fjrR8Z/kPk/uNcuvsq8q/ZbODf1Ez7gG1p6UT3jXo3ZN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 24, 2023 at 02:21:50PM -0300, Jason Gunthorpe wrote:
> [ It would be good to get this in linux-next, we have some good test
> coverage on the ARM side already, thanks! ]
> 
> It has been a long time coming, this series completes the default_domain
> transition and makes it so that the core IOMMU code will always have a
> non-NULL default_domain for every driver on every
> platform. set_platform_dma_ops() turned out to be a bad idea, and so
> completely remove it.

Joerg, I think we are done with this now, it has been two months
since a substantive comment.

Can you take it so we have enough time in linux-next?

There is a small typo in a commit message, patch 15 should have
 s/omap_iommu_set_platform_dma/msm_iommu_set_platform_dma/

Let me know if you want me to resend

Thanks,
Jason
