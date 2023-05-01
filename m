Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33546F359E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbjEASDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbjEASD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:27 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00E01BC6;
        Mon,  1 May 2023 11:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKcXGlq0EY1Nb0VYw1oVuk/hwjghVkW8MJKosG//+sp35VSRwKM7bz+pHGMnFwzfSEsGxY30tzoFlZclLPZyoof7pVXQrvW5mHeEbObdRZCEp3iGWjVWqhR3U4CrG7APmZJ1+OPBmM4uE1Jr7cuuUx7QlC2tCk/1O/dlSHS3mdu5HzU8Tli6wJXAdtIvlmzT7vXd8TbXnue+l9DLBa42a/96xD0fLPtMcecV2MSB9OwpQnziwjvqXxemitixgbE8STgUUNrdNIgwfoME7FcT50AEB7THxlxcLJim/EaPFNgs77zqTuYl+odKNbTqP+8vj9WxW1333n5HuctlLaHETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxfEne6hTvJIrssBCM0Wl3ZWfLoTWweQYD10J76/mu0=;
 b=QubgEOrnMOjMAkKsOsKyKRoqspuRrVjD7Y3D8w19QsgjWqpHPgIKfqVWHdde91j6/1XmdH7aZZ1jYimQTuSqEypWRr3276E1Vit8TqHShUDM/tOEOBmhvBdq7qSIvXZNAgaZYxaoOcZc9dABZ7jYY+RP5GN7yOG9vH0h4ceZUozYSE8weqvmenv9LxsYA15vK2gyotwxXOWcyDKiUXJ93FUjZk7XG0fBD681SsyBiY08ZprZNzZ9lYPSYJ0vMu+H8OHujGuQkQtFDeY//r7Dg5mmZ48nVh/SeWoaI+k9svxIgrR+HvfxwSNyyaHpLEemHu2ZWbX2Ai1uAGEPEyWwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxfEne6hTvJIrssBCM0Wl3ZWfLoTWweQYD10J76/mu0=;
 b=fNQm/1cnA5/60eo/z99W4Os97mkLWSfqbyehYno3/3hlcGUeeAlBkuZGPCMTAYrOMBJFdmerh3hoqsGmCnVYR+9fgjs/e9AyUvi5Oz78Mx7qLj47pnEALiNbKwAYN/9mo2MVJXKOV488907cKZHxeOtfRCBdQoLJfRgLQu6UzkKIwuFV1i8xNXfXEPdW2ofqD3C4a5DsTwO3pAP3QxFavPXpier0jfMv02soumDTG45jzP3eg6YTQ5vH/oT+zeZmX21ht1OiuDmRxoeJWfkC5vstRxHfOfa/ssLPfYSMPDHzGDWS0HQyF8l+DZPtEVkLwePDFQinggVDk5OPpAOK7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:14 +0000
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
Subject: [PATCH 20/20] iommu: Convert remaining simple drivers to domain_alloc_paging()
Date:   Mon,  1 May 2023 15:03:04 -0300
Message-Id: <20-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:208:23d::27) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: e9159dc7-1166-4bb7-4957-08db4a6e5169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6NvOHk8iDdsZrfUjMYazjU6DDanuw2z3fzrYEY3Oz5Na2FRQBbjg43oJjsVW1F2U8E43abG4GEug0kNiP4xEoBHCz+hfG1zctACPK1sdvH/O8bChKSOoeCD71bsGowdu4UwEC/R0y1SpKpdjEvgtuEFPNR66+FSZR7+R/3dv9Yr3pQGi3XMqq69EW9kpMrG26iKuy1+JP35BBLtnnup7eIkfcdaAwZMOv4GmRoKV5Qy4l034/sxklYBjNsqXjnuaMN/Vh5yg5+v11FpIg+B1rRD765++Rlh/x9NChedoqU4eTOhYZmGiHVAXjuwLOynd80dGqwKkTbA7vPow/c/jLeb+mhbK1pLGnQbAZc0TtbsRG7rqvflZK/uIlwvpY1iTyVYnFYuLdW+74t6d/yAIxWm7BXvN+I1cGY0IpI8cYd+mmuj00YVKkBf2qg6K4rZpcsX6kGEPKDpH9HWDrMtYgyJqH0BEY1LUFYrt+K6ugxQ/77MpOlZ6CzBz9nQoYs9TKjqWGl51NW49NI+QV5Pg4Hc09nup6UMPZ73rxKwAEGAIRy7cH0vEvKBNgWUBu6NIEcmAd7GqZHRk4VYbMz9eAt0VZ+IqsdJYZLff+hzu7vg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4JU62A81EJU7zMj/Keu2ufqUsCCHhVVJpF+Pamijl6PURRdBu4s+2e63+Iue?=
 =?us-ascii?Q?oZpPciqr9C4+5LR+7/b4CEQ4NAPaa2SKqKCw5WF3jamir9Lk0FiV5eSLVemP?=
 =?us-ascii?Q?74BnhzIuzcund+UErIvE49IY+sDrQCcj8/Xys04zCwTcBeO4HkiDdDgjNS3K?=
 =?us-ascii?Q?cQgsabBN+B1h2KH+wrBEOuOyBsV5DarFvf9qsOuFJPKHLyFmeiFMHnTSI7R7?=
 =?us-ascii?Q?OqlqWXg0Ob6BFqhWAr+RMXLojpsNUf9dbsdJJwcn0yiqzX9y70VmlYmXd2Y9?=
 =?us-ascii?Q?+M3u+BnInlOPgF4Gx+H1ppzwE8Zw5ZGeh31SbUG9k7JowgRbbSpfyscFQcA7?=
 =?us-ascii?Q?qsboD7rxJ+JEXG4DgfYGTrPsNvYFesuBK3fDt3SxJ3i6eaz8dFE1tXdaPC/X?=
 =?us-ascii?Q?SMt7UXrshgcqFbG71d7/r5V8FIyYTXVIkAWfVo/jyvb4hE8sJHaXyRPDhHjX?=
 =?us-ascii?Q?oUzlGtga8swCqtQnpmyaztgXBpYGuKzfwnXw6JJTthI5+vjqjH04/Vm43xlz?=
 =?us-ascii?Q?zUn9nS0gMV4CDpCMcceQfvzrsVPmxmVLwOGdpoBjOl2PX0ZevoV89OpFY+7d?=
 =?us-ascii?Q?1hUxOTw08RcYY8QoUihiTpMCFmRA4KFSxKIMsmL2krtP3xa31utaQPyfV9f1?=
 =?us-ascii?Q?7Hh2ti9/cmRf9HGoJPIQ4hWvmhVovOkKGawEsHVe0TBnwkk0TREbmGGSouCN?=
 =?us-ascii?Q?xG5o9KuTr2rfhGBZ2avdiIXBEfve3W3LMAlJVf+SIVPy+EEetElvmYNFmGcn?=
 =?us-ascii?Q?GJqXXKaespX1LU6OzvhQ+mVZt+fhaxoOnArZhUBxICF2t8BXmsciqcITKgzd?=
 =?us-ascii?Q?cwryDuRxNqmve0MaXqCJ79/TFcUinCN3l7PL1dU0hBvOmqj8q1c6IWaf71Az?=
 =?us-ascii?Q?bgogX5XjAUKK2KBr6/5pYsf1llzm5/bkNXrRwMnXsnRVUNV67M5FcLe1M185?=
 =?us-ascii?Q?dZIB79F+5tRjUFQMKgvW/E/eTkPq5PLcffRgEEy8Oc7gwFEzdiGdrB48Ieud?=
 =?us-ascii?Q?9pA/odOCEvFNB0R5AVZRpDNepnEiwzelLZh5R70PDlRurJVmuG+Whv2ML81V?=
 =?us-ascii?Q?w49ZqQDg3qe7bMvep8WAiJ5OrZ6XWqT3pqM2ZRHO8Z6SuG754Z6aOrAaRcAB?=
 =?us-ascii?Q?JjUc+gDdd5eQ+zfsn8qeZgTcqYa6ChJG2krZb0dS3aXgjSMbtf4h4JP12T3o?=
 =?us-ascii?Q?Hqqciz/UPnmvuv4YxddlvQFhG5DLZxaWkK2VUBE1CYWEpjMJZl3cvfkRuInY?=
 =?us-ascii?Q?h3rY2OW2Qzqwkag3x+gosDmcGa2Dse0ogdjyBaEJ6b0XoaY4BJEGhkwJ3Lg8?=
 =?us-ascii?Q?/rfZBnCmLqwQOH5mAnychUIrzFsT00D9hqIFtMOSvOBOd2Y1jCLXRenLd6hO?=
 =?us-ascii?Q?QWgDWS+QPMpBaPhDL7ibU4KcilW2G3BWOOPhn6WWSo29uO7pP727yg1wjuwr?=
 =?us-ascii?Q?yWcmH4tMR1Lv/DK44zrSZW24LtrnCV7TKGgU4VgP7KlYOtcHAibFmnw5Gz2O?=
 =?us-ascii?Q?o6e5viP8NuAzSGw8qBkt2pOqBKdizqaRaPh1AW/rAsii9Az7w4ICI693lo88?=
 =?us-ascii?Q?nXjU6Rdu/5jt97UogS0hoj0eK7d1xE+GhHKhxCCP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9159dc7-1166-4bb7-4957-08db4a6e5169
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:07.7860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLSLcaEVCPUEJVqvMvCNlVEL0My5KVFiW57R4zcjfzz4kErlGQzumMXXeWQJ48IC
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

These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
allows them to support that mode.

The prior work to require default_domains makes this safe because every
one of these drivers is either compilation incompatible with dma-iommu.c,
or already establishing a default_domain. In both cases alloc_domain()
will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
to drop the test.

Removing these tests clarifies that the domain allocation path is only
about the functionality of a paging domain and has nothing to do with
policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/fsl_pamu_domain.c | 7 ++-----
 drivers/iommu/msm_iommu.c       | 7 ++-----
 drivers/iommu/mtk_iommu_v1.c    | 7 ++-----
 drivers/iommu/omap-iommu.c      | 7 ++-----
 drivers/iommu/s390-iommu.c      | 7 ++-----
 drivers/iommu/tegra-gart.c      | 7 ++-----
 6 files changed, 12 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 4c65f1adfe7511..641e89f7d7f444 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -192,13 +192,10 @@ static void fsl_pamu_domain_free(struct iommu_domain *domain)
 	kmem_cache_free(fsl_pamu_domain_cache, dma_domain);
 }
 
-static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
+static struct iommu_domain *fsl_pamu_domain_alloc_paging(struct device *dev)
 {
 	struct fsl_dma_domain *dma_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dma_domain = kmem_cache_zalloc(fsl_pamu_domain_cache, GFP_KERNEL);
 	if (!dma_domain)
 		return NULL;
@@ -473,7 +470,7 @@ static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
 static const struct iommu_ops fsl_pamu_ops = {
 	.default_domain = &fsl_pamu_platform_domain,
 	.capable	= fsl_pamu_capable,
-	.domain_alloc	= fsl_pamu_domain_alloc,
+	.domain_alloc_paging = fsl_pamu_domain_alloc_paging,
 	.probe_device	= fsl_pamu_probe_device,
 	.device_group   = fsl_pamu_device_group,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 26ed81cfeee897..a163cee0b7242d 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -302,13 +302,10 @@ static void __program_context(void __iomem *base, int ctx,
 	SET_M(base, ctx, 1);
 }
 
-static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *msm_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct msm_priv *priv;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		goto fail_nomem;
@@ -691,7 +688,7 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 
 static struct iommu_ops msm_iommu_ops = {
 	.identity_domain = &msm_iommu_identity_domain,
-	.domain_alloc = msm_iommu_domain_alloc,
+	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 7c0c1d50df5f75..67e044c1a7d93b 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -270,13 +270,10 @@ static int mtk_iommu_v1_domain_finalise(struct mtk_iommu_v1_data *data)
 	return 0;
 }
 
-static struct iommu_domain *mtk_iommu_v1_domain_alloc(unsigned type)
+static struct iommu_domain *mtk_iommu_v1_domain_alloc_paging(struct device *dev)
 {
 	struct mtk_iommu_v1_domain *dom;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -585,7 +582,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
 
 static const struct iommu_ops mtk_iommu_v1_ops = {
 	.identity_domain = &mtk_iommu_v1_identity_domain,
-	.domain_alloc	= mtk_iommu_v1_domain_alloc,
+	.domain_alloc_paging = mtk_iommu_v1_domain_alloc_paging,
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 34340ef15241bc..fcf99bd195b32e 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1580,13 +1580,10 @@ static struct iommu_domain omap_iommu_identity_domain = {
 	.ops = &omap_iommu_identity_ops,
 };
 
-static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *omap_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct omap_iommu_domain *omap_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
 	if (!omap_domain)
 		return NULL;
@@ -1748,7 +1745,7 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 
 static const struct iommu_ops omap_iommu_ops = {
 	.identity_domain = &omap_iommu_identity_domain,
-	.domain_alloc	= omap_iommu_domain_alloc,
+	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f0c867c57a5b9b..5695ad71d60e24 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -39,13 +39,10 @@ static bool s390_iommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
-static struct iommu_domain *s390_domain_alloc(unsigned domain_type)
+static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
 {
 	struct s390_domain *s390_domain;
 
-	if (domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	s390_domain = kzalloc(sizeof(*s390_domain), GFP_KERNEL);
 	if (!s390_domain)
 		return NULL;
@@ -447,7 +444,7 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 static const struct iommu_ops s390_iommu_ops = {
 	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
-	.domain_alloc = s390_domain_alloc,
+	.domain_alloc_paging = s390_domain_alloc_paging,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index 09865889ff2480..b90801dddef413 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -167,13 +167,10 @@ static struct iommu_domain gart_iommu_platform_domain = {
 	.ops = &gart_iommu_platform_ops,
 };
 
-static struct iommu_domain *gart_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *gart_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct iommu_domain *domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
 	if (domain) {
 		domain->geometry.aperture_start = gart_handle->iovmm_base;
@@ -294,7 +291,7 @@ static void gart_iommu_sync(struct iommu_domain *domain,
 
 static const struct iommu_ops gart_iommu_ops = {
 	.default_domain = &gart_iommu_platform_domain,
-	.domain_alloc	= gart_iommu_domain_alloc,
+	.domain_alloc_paging = gart_iommu_domain_alloc_paging,
 	.probe_device	= gart_iommu_probe_device,
 	.device_group	= generic_device_group,
 	.pgsize_bitmap	= GART_IOMMU_PGSIZES,
-- 
2.40.0

