Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26CDD707672
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 01:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjEQXcn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 19:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjEQXcm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 19:32:42 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6225F40EB;
        Wed, 17 May 2023 16:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2J+oE80v+B1Kweq6z+STuijyPtEkRwz8pWoXjK5/lQ4oTOz3mj7kQzuMqaizG9F3CDXxn1SPDZ12GUVIrss5lQvnO8AOsROrJUHU08jWds/Xwy2ni4vQ6NT3akOEHyDNXrU0AQf7GG7/ndMSDYssSOJNoOJW7BNYvWmlow4ZTg+0Z1R81JLQTzISBekPtY7ntcWV4mBmsXlEhhFfteRdZHsEOze+edxxSXD+de+gaZsjOsIXvAO6wJx60ga8lV5hSOXUMsHx0ZRZtxb0cbb5t0uynFY9iRHWxsQFsEsfk5XV5EcivwgSrhAade6XQ/BagWzw4JeIkEsqBhvyzz5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU7+OS0futKjoBt58LQ+nXP395IRweXRjQi4kW6PQLU=;
 b=Oeo0w4/5iIve7I8iVusfV7B8W3I/Fz6Wxu2h+/W+gJKHNDn5maJ1ZKO016jx3O6IIRHXD4iEAEXDy+N3X3RJw5NDwwpb+S9cIgbKHcAafK0ONde0BZSBLcYpJvbwFpi4010MX9ajBY89qOqYnJMMHu5USl52el4hupiiJNKxyqnfTg8ptZvVkZHk+yTXIMGrvN7eQmUokftc15sZCRDH+bpPurGs1h3H7L43+Xrx5bh4uxSrLpW6Wx3ctNAc5Hx1SOQvtYS+chdssRAE2v0q1N55PQVj4Ay5uC5Nphu8dOe9Zn4ysQpWiHtzSLlqilkyffZxycabLwasEIhuoZaLAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU7+OS0futKjoBt58LQ+nXP395IRweXRjQi4kW6PQLU=;
 b=T9dbxYfi0ePh8X7jY4DWSOh/1wX2Pd3qEz/X3enlbBpLhGYWh+9H9J8rgPwD7yquiJvDAeDLOhOt3pCQFi00U3NOIDUA+dUAlN02tFWC75pOM12ItgpPcDBhHd9ZpcYDl38kmQI1OsTb5REddcPhFx6Xh+wL59OQnHdxP1vmaSbLPy5tbCWpGE5+RUrMnr52BGOg0U50+SzNGm6CizbLS/swXInbWEdZZzWGEbUBf/F2IQJ9XEVzzQSnFTnxUKykC1E4AswHHdnhtQbiN/JngfDwbkNa4gGol5cIZ3UJUOhjcCjjt/pyJm2XsU9g6JPUnJJWxkFTHhHsR7JY/otAnw==
Received: from MW4PR04CA0257.namprd04.prod.outlook.com (2603:10b6:303:88::22)
 by SA0PR12MB4542.namprd12.prod.outlook.com (2603:10b6:806:73::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 23:32:39 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::3c) by MW4PR04CA0257.outlook.office365.com
 (2603:10b6:303:88::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18 via Frontend
 Transport; Wed, 17 May 2023 23:32:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT087.mail.protection.outlook.com (10.13.174.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19 via Frontend Transport; Wed, 17 May 2023 23:32:38 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 17 May 2023
 16:32:32 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 17 May 2023 16:32:32 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37 via Frontend
 Transport; Wed, 17 May 2023 16:32:29 -0700
Date:   Wed, 17 May 2023 16:32:28 -0700
From:   Nicolin Chen <nicolinc@nvidia.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
CC:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, <iommu@lists.linux.dev>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <linux-s390@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
        <linux-tegra@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        <linuxppc-dev@lists.ozlabs.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
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
        "Niklas Schnelle" <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 00/25] iommu: Make default_domain's mandatory
Message-ID: <ZGVkDB+MCrx3tQho@Asurada-Nvidia>
References: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT087:EE_|SA0PR12MB4542:EE_
X-MS-Office365-Filtering-Correlation-Id: 192db192-fae9-42d6-3f47-08db572f0083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xp1ANaCQqDkvQxMkDGNeVnZgg2QHq7mlxtx6A8BUGbMjgoK/P5t4maMzuKixtU7LOp1Uo51Vq1YlcBrFPWS0rnzkEwCuhDzcZeOuHx/19o9krkOp0BlyU+ELCWMUAa2hwCDlxWgHCeqWhgEmE/6HiMNQ3HaErUKoXy1VV+dz5h9TrvywnLzRpJS4c5bx3ly6mA5NODX6vzM91weyCKzGWGqSEKxblrcKPQn6ug8piZ8Bp71af5OIFJd4wIwY6r5tgQhZ/OWx3z6/vImdPUa7OL33h6NUI3X+UUCl3lwWLMfbYcf48h2em+LTnt8k2b/xfZfdLOwqtyB+/vcWiH0tUgSU3UCZFbEQlnWMm2dGI2NsnvZSke9uazUM3qy3KR6LdIVfXbnjrx9xpCEzwl9H0xvpZT7axGCMoG/RBVT/rjx0IO6nfxRmzCFQIRXTm245v+wimriyw7R8Z691v8EpdPwTZ+JsqDOSIdYsWIxL6jK14OaX+JShd8mKAe5d5V918vZ2AcBEpzMLOWu0zl+eOMkD6ihhybqSDfKBlYw5BFA+BxtQo0mXWF+7TCnGhGrvi/rGWPHYrKmd3RPzf0jRIRe1ckw48EBLqTTkA0QPyisnVLFgu2A+82FWUp2LDoyPUY1LjMGD65nnIxPjWZdUVjbHzaY9rvlgmAIWNrawbvWntCrWkGwAGa9aU59g/9Iwyk6RYfuMygImtPEcSX7+iCzGDeF7hBh5dMDabpdtET0nSRboAE8Ym/yNorJPawsljffBQTVY97BVKPn21CS5etWQxehgcoxSHpfuCz7vii6g6rpIQ9uyBl4A9UO5PmM9
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(82740400003)(7636003)(356005)(40460700003)(41300700001)(7416002)(7406005)(2906002)(6862004)(8676002)(5660300002)(33716001)(6636002)(8936002)(55016003)(86362001)(316002)(4326008)(70206006)(70586007)(40480700001)(82310400005)(83380400001)(966005)(336012)(186003)(47076005)(107886003)(426003)(9686003)(26005)(478600001)(54906003)(67856001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 23:32:38.5800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 192db192-fae9-42d6-3f47-08db572f0083
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4542
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

On Mon, May 15, 2023 at 09:00:33PM -0300, Jason Gunthorpe wrote:
 
> This is on github: https://github.com/jgunthorpe/linux/commits/iommu_all_defdom

Ran some VFIO-passthrough sanity on x86 and ARM64, using this
branch. It should cover partially this series. So, if I may:

Tested-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks
Nic

> v2:
>  - FSL is an IDENTITY domain
>  - Delete terga-gart instead of trying to carry it
>  - Use the policy determination from iommu_get_default_domain_type() to
>    drive the arm_iommu mode
>  - Reorganize and introduce new patches to do the above:
>     * Split the ops->identity_domain to an independent earlier patch
>     * Remove the UNMANAGED return from def_domain_type in mtk_v1 earlier
>       so the new iommu_get_default_domain_type() can work
>     * Make the driver's def_domain_type have higher policy priority than
>       untrusted
>     * Merge the set_platfom_dma_ops hunk from mtk_v1 along with rockchip
>       into the patch that forced IDENTITY on ARM32
>  - Revise sun50i to be cleaner and have a non-NULL internal domain
>  - Reword logging in exynos
>  - Remove the gdev from the group alloc path, instead add a new
>    function __iommu_group_domain_alloc() that takes in the group
>    and uses the first device. Split this to its own patch
>  - New patch to make iommufd's mock selftest into a real driver
>  - New patch to fix power's partial iommu driver
