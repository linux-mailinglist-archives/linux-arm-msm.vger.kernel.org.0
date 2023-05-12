Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916CC700D58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 18:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237410AbjELQt5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 12:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237424AbjELQtu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 12:49:50 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C516F9EC1;
        Fri, 12 May 2023 09:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7VK4tW2FymNQ44X1S1l+kbov/cq2chUZKgfgSgSmw8tqd724F9jm3wT/bXZS2ArlTkADNpaeECXkEjP4TU9yObM/akj121BZRxTc66ODeU7dbzbuNPERC5VwbBmQ7XcqEjo2OSXofp+ZBlhRphZhcijdgE9b7NPnAurJmGpjOkFDab+WWYsAX8++R0TRm1hzk892MEa22nUPe2vQ7osUkkwHRcAaMk6DxkorfiapFDZlJ4NRDvMb05BywRRxftvkZXxGryuy20glZOXgmdNd+k8FDhbbFyewsM4DBb1M8+K2C901dp129Qr1Q0S+dr/IOhy1DS5I44VE/m0MhnC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSv1H7VHlFaQtzX+HsHBVHMGWNIrXIGbRNcFag8Z0fY=;
 b=Uehf+hBLmR4em2STedzAfVzRFkJyeEIH5eO+pkQNYpZuRWNpjER2u+h0K9wQMp97uKaZuCCgHikHVEmypK5F27wCcb8o07t1BMrAKmbChDn64RdqbmcU/kRnDeOmBX2ZthdH+ZcWXXTG2EtNp/dCxJp8Oafy9r9NuXk7ZWx+xOffIbsKf5jgraDKLMyOhnb6SGSTjlSn7QS9vJLMKjhrOHZiZvup0gxRKn7Evt6/+5yUcoalSziun0ZwHpVOuk0rKbMIp4UalXCjpefC2dN6L4GkdAE+uki7iLQIwRcO5EKPm2ZwuvHy3v7SW/kqfD7TTZARDUvn+hWF8OY90FBp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSv1H7VHlFaQtzX+HsHBVHMGWNIrXIGbRNcFag8Z0fY=;
 b=j1O2jyA45ezKTmmrOh4dIoc4HPiudWK4a8yRYhbdJkcXqubO+FWxXLSvcr3SvH6RutruGO6VbA5rsFILopSiaDoR5AfrTq9/gYCMwZ+LvBipG5E4csGE7EPx7YPhG79PMHR/zozneXx/Gh1He5d7UvZrP99QgB647IkW3O20UC0WRKUkoGPAwBdJZY4ozVkyK7M/tr3+XMGCr7MkXop8fTChJHp+qaoXr5SboflWyhm2H9t+6lzmWB3Qj6J5V/AuElnB5RxAt90BNUV65TkqR5nitYxxKMbI94sF79tWGZsaqsrJ+tSPUnkGFahVCSrbshqkexavDQDj0J8KyhBRCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6147.namprd12.prod.outlook.com (2603:10b6:a03:45a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 16:49:47 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 16:49:47 +0000
Date:   Fri, 12 May 2023 13:49:44 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <ZF5uKPhpBNioJUwL@nvidia.com>
References: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <1db712d2-9e33-4183-2766-34e32f170507@arm.com>
 <ZFI/D6mnLKYpdIqx@nvidia.com>
 <1a995f30-31fe-354f-ddfe-e944fa36e7a0@arm.com>
 <ZFJlZ03lswl9uHD0@nvidia.com>
 <ZFJzKQcKNFHdIWqy@orome>
 <ZFKXz/HWFkYOJrgT@nvidia.com>
 <4a5ebc65-a384-a8df-c692-ca114f1a018d@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a5ebc65-a384-a8df-c692-ca114f1a018d@gmail.com>
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a6d013-233e-4afb-ddc6-08db5308e4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GEW3LcxYaUUwylS9hG4sNAfGAik/bfS/aMbdD6MgA9WnrrnyGxEY9mP4TA8WueR7pcAYFJZO2OFwBX89Aczn1VyJAviRB+CAHa1WY42b4vl2TWbFe59fBcrk2l8SgjxT5xyxMbT1i/UVK1iSdcfw6M5fJPt5ENXWFFn5LiShDXAE54ak/qDXfG3EJRxZJ/Y3IjkPhHJ4munASPjKkV3Vfx6qvfP/9o6jWrHtrSSOOa1ug9gBeLvplbCKT/0HZAnM6GLtK0Vu8dRbNdoK/IYZTjieiQnxOWC6omWFJ94bCbYkMUR5BXWpYED8udPOUIvK/kSjGkdjiuHPGx8SNGefGGRUzoEtZpXYrPvMy3ApjtkXsDe7yWKodwrBTqTTepjZvjG1wTIBLYG1aGVn4fjJzvWwv200dXXBy3xDLPWT49Fv9F/dTQ/ejuZcPC420jQ8ssTZEulZDGJnWGZFlFx4cBEzQlOAXf7QQB6UyFaL6tHMEeYHQwI2kWipUMlddIidSQwyDMTA8vbF7TeI+Wj/ImbL6FW1CiVOd6Iz/w7kVFiTgjbAHTe3DUG/uz4qr4Uc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(38100700002)(36756003)(86362001)(5660300002)(7416002)(7406005)(316002)(8936002)(8676002)(2616005)(26005)(6506007)(6512007)(2906002)(66946007)(66476007)(66556008)(478600001)(54906003)(6916009)(41300700001)(4326008)(6666004)(186003)(4744005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CFxnevdj+8yLvrHO174+KarR0zn7i4SViTnNXAUyn8+fcRYkRLRiWqeFV38x?=
 =?us-ascii?Q?SkXeIjU3tVA49XTCaFI/OXZW/EE3rUy2d5S7iOIJ7TJWZK45A7Q0IcjtjcUk?=
 =?us-ascii?Q?TmFwoJnQpUokaP6abSI6+XOPSOOX35xoBIaoVp+jULua0J84iGQHOZNdQ8jD?=
 =?us-ascii?Q?B6/OM17DiqDW6bKmhlk2huZYPjSHw/DTWcWX/zizkCxDKelCueYn+gUGO4EF?=
 =?us-ascii?Q?te9cs8kE4UXrMxNp9BabTUcQAFDQiiRSJv6zDpkxwjJLUk8rKG2d2Cj5rhiJ?=
 =?us-ascii?Q?q386OtDH2wFD2IvTf4/bQDcMVA7a7iKSI1rh4zwwBQPNTj5wcM7HXNaSFV/2?=
 =?us-ascii?Q?iZJcW2oFbnjlWS6EUvL8coQkZxhW1yhJLWUp6TdIskxIZMjTSzyuV0pscHNB?=
 =?us-ascii?Q?QMpesKX2RCTO5+5D/OfbvUAgsLLXflyc6pmF1PoISrx9kB7sKLA7OeqPm+dw?=
 =?us-ascii?Q?YN4rlXIbi58AVgiYOA6tW1Lsh9mk9K3ufSWZspb1fRSDyjS7engqt+L9S8uB?=
 =?us-ascii?Q?w7GtSLm5B/+UPnb2pcsxzqYNeUdR89qNEaWBZigAY6FGcNZywx0TobIeLQiu?=
 =?us-ascii?Q?obT5dd7oya1YG442DE288VdT60Ce95oRDuApUaaiubp2AArFG5bJ5VXk7swH?=
 =?us-ascii?Q?+h6k0dxS/uoYql9QqM/PeLvr27yHjyEFyyEFUDDrqKy9aOHdaqnhM+pXnfCE?=
 =?us-ascii?Q?YrXHyUuUEDhKHOqIO+n8d7KTniQ4qIrYNQH7bdOuSZ8EWT5zFGX0Mbean10Y?=
 =?us-ascii?Q?0ofu6c6cqobAHSbQ1UQ2dIRf2Fa8IaPN0pjgD5BCFZV3ciByu4+IvEHzRo3T?=
 =?us-ascii?Q?aW6WvOdvX4OmrOUrjt0uz1Rp/77i9VKBpvV+qd/0tqwtm1FaoL/fqcbpaOlJ?=
 =?us-ascii?Q?02vyl2kKQ9xiQSjEo0zvIzcXKw56zeFJrSI6eWHLKJ1FwewHpoPtpnrXg/y4?=
 =?us-ascii?Q?jA/xzW4DG66kYvjx2CIpM3PdzQwGcYwD0VWZS/jnFe+ots1IUeqIfxEN0+VS?=
 =?us-ascii?Q?TzFVoVLNnE5H9sBEScCsDQdI1G2IZKiMfQ1jjxg1jzm0r9ImpD+aZrSj0HW8?=
 =?us-ascii?Q?4uqQWgk0H0/hqddJsrark1Hr+bgmSY0RAbQ/Ne0nvSb/WcyUXXxOAPbaTn0S?=
 =?us-ascii?Q?e0F/0ZFwAvxTBf738rs0nQA7ldorFVPulqSGhZrIWYtnIqpYlGBctqMxLl7+?=
 =?us-ascii?Q?/OO0cEJ9xSHVSBeSLzIYyHPaaZj9bsyWtHNEXSIZTTHGFD4Da1lkEHW+V7DJ?=
 =?us-ascii?Q?zVUbVtvD6hpaRX/vQqZghuCZgsODkEAXN/EOURu8U3vWV5ehs+US3Z+DXNtu?=
 =?us-ascii?Q?+YU9cAWtSWa0WIvdmApEQM7ErY9p0HjLQAayR6LaJh7ADqoFQ3llirs07+Sl?=
 =?us-ascii?Q?znk5jHHpV/6CwlWQi/JN9aUW3nc7u5uPH3z5ZVx0LkOMQ6fBx7tQy6BT807q?=
 =?us-ascii?Q?htfSsg4u2aEABPXVG2AXOnD9qindykZgAt9Bf07UBtMtLIg8L/HpxZWmxHNs?=
 =?us-ascii?Q?ZQ/JmqVw3VpiH8ONGKDzjX4SQ8Go8IkuL+jw/Nkzbe4KKzJUuz/d2obkZBh8?=
 =?us-ascii?Q?aWVrAVRcOOxd7QQmxF0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a6d013-233e-4afb-ddc6-08db5308e4cf
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 16:49:47.1184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqJSVcWdSv8QmY3dF1/7F+Atwnr0WYOP0xT2lp4cKw4Zqz3q380rZ1xCp5OLNvPO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147
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

On Fri, May 12, 2023 at 05:55:23AM +0300, Dmitry Osipenko wrote:

> >> This has occasionally come up in the past and I seem to remember that it
> >> had once been proposed to simply remove tegra-gart and there had been no
> >> objections. Adding Dmitry, if he doesn't have objections to remaving it,
> >> neither do I.
> > 
> > Dmitry, please say yes and I will remove it instead of trying to carry
> > it. The driver is almost 10 years old at this point, I'm skeptical
> > anyone will need it on a 6.2 era kernel..
> 
> You probably missed that support for many of 10 years old Tegra2/3
> devices was added to kernel during last years.
> 
> This GART isn't used by upstream DRM driver, but it's used by downstream
> kernel which uses alternative Tegra DRM driver that works better for
> older hardware.

It is kernel policy not to carry code to only support out of tree drivers in
mainline, so it should be removed, thanks

Jason
