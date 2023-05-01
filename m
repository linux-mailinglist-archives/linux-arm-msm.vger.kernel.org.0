Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEED06F357B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbjEASDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbjEASDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:17 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA951984;
        Mon,  1 May 2023 11:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPHLZ54S0CtUbK695aV0/cAPVFktSre4kQMtk+6jk1CpwN2B2WRnLGNiwi98S0ON8SBiNuQ3wzOeHOXUxDDSPw1bSwM+Ol+S8Y9WWnmfsqgKgHH71wYgN0iWMj8u6PlMM2hFdQipNxanxRKiqh/Ag1o5zd3hCaqYRUg1oLrXpflnLAyThAv7aREEYP9DATdeNyHIbaSdM5i17D14F45winNHgogrza9DwfkIDZvaueYgw+6d5JN2fVzmmiZRWQcWUYVhCbrG45Svfg3kisSvVANJD37Wbx1miskCOAOYV0xFHgzDfP9iHsCDTc+yRU28e/OFEbTLDFozultxKaM09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdmaNK/xIt8Wp/CIY77cqXnZS5004Nq66cyC3U0PKXU=;
 b=O9BsRnCCEeeeWYs/tA/0glrB6giwCuwbrApv9DwqH23DLeP4j+E5fT4EDv0EGos3/WpAvqd9NPGegAbx1QS2JRB+GP5RJKBx9KIf6K4GrjtHSgslR06lujRN0xu3iTkhksBIkRBtw8Vtyjzt2+7roJw65yM/x17/tOa7wPg2EybuXVagmtqv3W5yqp/bNyltIUNBTcDNxBPORjiDvjdvpswxX6tnoqvE44SsAHas+o6LEKpqR1EmmUuWas9737D03CE3ZBwCH/as9oEoTIOtZwg1Kd9sJ0S63oGy/VYeOK9dVVWwO3B+xrQsrVyu751fFb1T+Qbhb7Cw2W474IxVMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdmaNK/xIt8Wp/CIY77cqXnZS5004Nq66cyC3U0PKXU=;
 b=NMInev6IzWiDzhsxDlnYBPhxT5kdRpR0k7x+tlLk7EUtDaCEGabls5n5bjZ+d8fDHM89jUIfkGsK3DqGVu89iHRDdzyIjD/LNYWHrRdXNOnMpWzclrWJwSnahcuxBqvBDH5U5Nmo4hHOC9I3Z1PQ561wS08MO5j+0QqkzBFvZwWYQf8uffZwfYbxIdvGR3Vev5X1IoORrAWLlMAqx9m7RVMan8Re2hNjzKroktgvYIJvGDbW0B2DXsIIs2EhnOTLJ4BuyhaY1Kc/HyB6m1KbjVVW37OFfj7jUTYmuMFuBEFICebVi3ltqe1PnlioXElZgvP7L+cntKM2kV+QefK3tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:10 +0000
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Andy Gross <agross@kernel.org>,
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
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
Subject: [PATCH 17/20] iommu: Require a default_domain for all iommu drivers
Date:   Mon,  1 May 2023 15:03:01 -0300
Message-Id: <17-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:208:32a::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 28014f78-6942-4ed6-69ed-08db4a6e50e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LhV1pyMabnr/Nx8fFpkmZAhgNCP0if+lYkgr7ceoCYRD66hUj9wL9WkXrNHAuVyaRJOqf1PM7bwOrHTQvpApByH1LqzUd8d2DdYsyEc/PYhkgJfUBX2OXyeoyzXGfqBga5jLea6GspodNquWVpTuR5CKzljjoIF57C7bNyCNLpoBZAkbVzGUmiEBLBt4KD4B6/InIYCDYZyEftkYDOe2tBR/ExlDO2bySCy8+td0hgg7ASmSILzVy7+0cfQxNfdzXrJEbxgIsV5830MmHyC2kA1y3aO9m4RND+qxbeUdCnLOqY3CLL81WYZXXlLrJNJ42mPulUHg6k1cyLCqdJYAtabxwA621ULNPYsn+2YjfvGth/9aTSyZmn+bj9hemMwX3vrkUgTs+uDnsAK3sBk3xXhS9iyDeQuPmLeGGiZhW3WtBjpr+whNg7pgfW719bcL8Zjk3GVp1KqTiEXH3ooI3QwybOfpU/o3xIHwtz2YWGsyVhEoKC+d1QfFfqvR6xvlfZiGUa2v6pXO08/AzTYFcXElwaEmkqi8/g3u1YPCpE1Z3yTnns3zBPMrpTkQw39CLYjM6IHfAzz98a9a1BJjqZ9uHPP2PQAcBlLAiCjvCCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/6RuflgswvWiU7ZEcsBjZyRtnozmX3XBsTfW+/7+KWw9YIawRwzwiter8mOf?=
 =?us-ascii?Q?iD07fa4vBV5selBv7n1cE1yOCktnfdbNTFdwR//q1wNa3cENbRfn/MFoopX0?=
 =?us-ascii?Q?Dbp4z/Txk+gxKT/n3bDaTys2m7gprg7KtfsmIScOdAeG04y1mebsF1PKbOdW?=
 =?us-ascii?Q?yt7qwzOc5lAqAUWtP9s3vk/rcyXRxP+KFWRMsw8mYGnu5iHLPaMsi/S3EVRy?=
 =?us-ascii?Q?s/A1KjJsR75zZSqmC4Q0ybaL/eszgxrq13K9dgrHiS5+vxHrQDYRimRZoRVK?=
 =?us-ascii?Q?7dpR6Dg+mv9KUxsZf3wgo5oRXOvJEvK/qm+ivRhy1NWvBqdQom4KlrhA4J4M?=
 =?us-ascii?Q?ZsDM4EQzficBhH892x1NmEGIfVNK0YaRwErrWK4BPT8dZkK+vhZzVSkLDJmh?=
 =?us-ascii?Q?qjE8vkkKH1xBzILfhlA1WaY92FkCdgL4/t7IN0jbxA9Rkuz0R9WkvcLCrCzt?=
 =?us-ascii?Q?KaSZbvqPNI3UNFfYrJ8zSw3dzk1r7Rf1ON6EXo27I5lZBgHErxS8Pq7PsAFF?=
 =?us-ascii?Q?rFbIoSv2RQMD4MICD5qn08JqdNxmFHst76nfDN4Y/eCF3GrCKtFhB16r53rn?=
 =?us-ascii?Q?T3VJjUpxKVJ0s2D+wUbbzQaMdDkwFtPQ7bffpRdc8AC6hQB0KVupJ3IMF5hf?=
 =?us-ascii?Q?E5K3bRigK79thQoPEz5ASexK9GBELaQ3oYM9W8FcKehNXeVoCkXZwSPHqCB3?=
 =?us-ascii?Q?ef7h1ZgBwoQToHJUlB9/UUxLmT7Dn9cevCSOCH88Ghv9eJFuOwaKMAn21FdT?=
 =?us-ascii?Q?S4uBO0CT8yuLcps8e8CXsWCtkc4H7G9ie/cuz+XsNqwZstfpbzOE+oT0QiOV?=
 =?us-ascii?Q?M2GY5uWBZNahaiRPx/5NUvWeZWDIp9I0cOzisI47VBeJliOcxxSti0gnxfnZ?=
 =?us-ascii?Q?kJc6C7A8x64p1DPUEH7+TWvQlCK0w+6iy6jg3nTA0RJ561IqsnSiN7UaMWIp?=
 =?us-ascii?Q?nEUT/S0umVZP3mykzzRP4IiWGHkUmTgOcdjvdQ2V9WiPUj0IMeU48QE9enfS?=
 =?us-ascii?Q?R3r44DRNYmjJpAOPhv1XHjfj5Chm8D9Y+kxn2DHBGf4t/lOorZt5pXOHsx1L?=
 =?us-ascii?Q?s3zyoOPaOkPbTKZ3eXM7m6jcxPja3ZYodqSE7pKqpLH6E+js7CboTdQ4p4Fm?=
 =?us-ascii?Q?iciXRWxp0YbGfc2YT+mpSyDRti9Ksgr4iALk/cRfJEmw+SgsgNVmDPpjBaGC?=
 =?us-ascii?Q?09l+IlcnKWyMEXbqZMj/xBoMh3l8ht5g63pGaQ6g4gfCXERikT7eAh37Lu58?=
 =?us-ascii?Q?BDzXXKn4gMeMpb4tlpg353ems4i0qhtTgeHMEAUB5ttJGJCvXG0JyFx7ImPQ?=
 =?us-ascii?Q?YO9AF4mwxR5x0ApO3ihRN4Ven6tV03PvYtMWnKizhVOWtwKaj9nr9OKJDJR3?=
 =?us-ascii?Q?e/sXOrAptWiVzDOWfocsUNOCpXoFIK+bRs9G8AJJ+/xzc58W2SdUNWFDADsX?=
 =?us-ascii?Q?d6dJdKwz297FTB6cOL4cXfkBzO5o2G5POAlbc/Nww7JL0YvP3FgivPZir1I6?=
 =?us-ascii?Q?TgRBERy7vtZzdiYdmb0O25viI4E5gaskFhmqqbHyHc8GomQ+WtpnHAafYQ4t?=
 =?us-ascii?Q?I1XfoPEPFxsaZ9hzpSALIdCLfOfXH4fDmnNpx8v/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28014f78-6942-4ed6-69ed-08db4a6e50e1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:06.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kl0+DN9lYV+ogYWTm0pWBguC4Zfv6GU45x8XmrnxvAwZcX0c23ymslQsQpjC1a4R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6457
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At this point every iommu driver will cause a default_domain to be
selected, so we can finally remove this gap from the core code.

The following table explains what each driver supports and what the
resulting default_domain will be:

                                        ops->defaut_domain
                    IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
amd/iommu.c             Y       Y                       N/A             either
apple-dart.c            Y       Y                       N/A             either
arm-smmu.c              Y       Y                       IDENTITY        either
qcom_iommu.c            G       Y                       IDENTITY        either
arm-smmu-v3.c           Y       Y                       N/A             either
exynos-iommu.c          G       Y                       IDENTITY        either
fsl_pamu_domain.c                       Y       Y       N/A             N/A     PLATFORM
intel/iommu.c           Y       Y                       N/A             either
ipmmu-vmsa.c            G       Y                       IDENTITY        either
msm_iommu.c             G                               IDENTITY        N/A
mtk_iommu.c             G       Y                       IDENTITY        either
mtk_iommu_v1.c          G                               IDENTITY        N/A
omap-iommu.c            G                               IDENTITY        N/A
rockchip-iommu.c        G       Y                       IDENTITY        either
s390-iommu.c                            Y       Y       N/A             N/A     PLATFORM
sprd-iommu.c                    Y                       N/A             DMA
sun50i-iommu.c          G       Y                       IDENTITY        either
tegra-gart.c                            Y       Y       PLATFORM        PLATFORM
tegra-smmu.c            G       Y               Y       IDENTITY        IDENTITY
virtio-iommu.c          Y       Y                       N/A             either
 * G means ops->identity_domain is used
 * N/A means the driver will not compile in this configuration

ARM32 drivers, except for tegra-gart, select an IDENTITY default domain
through either the ops->identity_domain or directly requesting an IDENTIY
domain through alloc_domain(). tegra-gart will use its weird PLATFORM
domain.

In ARM64 mode tegra-smmu will still block the use of dma-iommu.c and
forces an IDENTITY domain.

S390 uses a PLATFORM domain to represent when the dma_ops are set to the
s390 iommu code.

fsl_pamu uses a PLATFORM domain.

The x86 drivers continue unchanged.

After this patch group->default_domain is only NULL for a short period
during bus iommu probing while all the groups are constituted. Otherwise
it is always !NULL.

This completes changing the iommu subsystem driver contract to a system
where the current iommu_domain always represents some form of translation
and the driver is continuously asserting a definable translation mode.

It resolves the confusion that the original ops->detach_dev() caused
around what translation, exactly, is the IOMMU performing after
detach. There were at least three different answers to that question in
the tree, they are all now clearly named with domain types.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fb646765a87f47..f20a031e2910b2 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1655,14 +1655,18 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 		return __iommu_group_alloc_default_domain(bus, group, req_type);
 
 	/*
-	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
-	 * identity_domain and it becomes their default domain. Later on
-	 * ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
+	 * If ARM32 CONFIG_ARM_DMA_USE_IOMMU is enabled and the driver doesn't
+	 * use the ops->default_domain override, install an IDENTITY domain as
+	 * the default domain. Later on ARM_DMA_USE_IOMMU will install its
+	 * UNMANAGED domain.
 	 */
-	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
-	    bus->iommu_ops->identity_domain)
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
+		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
+				IS_ENABLED(CONFIG_IOMMU_DMA)));
+
 		return __iommu_group_alloc_default_domain(
 			bus, group, IOMMU_DOMAIN_IDENTITY);
+	}
 
 	/* The driver gave no guidance on what type to use, try the default */
 	dom = __iommu_group_alloc_default_domain(bus, group, iommu_def_domain_type);
@@ -2848,18 +2852,9 @@ static int iommu_setup_default_domain(struct iommu_group *group,
 	if (req_type < 0)
 		return -EINVAL;
 
-	/*
-	 * There are still some drivers which don't support default domains, so
-	 * we ignore the failure and leave group->default_domain NULL.
-	 */
 	dom = iommu_group_alloc_default_domain(group, req_type);
-	if (!dom) {
-		/* Once in default_domain mode we never leave */
-		if (group->default_domain)
-			return -ENODEV;
-		group->default_domain = NULL;
-		return 0;
-	}
+	if (!dom)
+		return -ENODEV;
 
 	if (group->default_domain == dom)
 		return 0;
-- 
2.40.0

