Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B06C6F3590
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjEASD2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbjEASDW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:22 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBCF1BC6;
        Mon,  1 May 2023 11:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDyZW2Z6H48JI9TKcAGzGF8vb54O/WTVd61ukUMsnU0cLrtfb1lpIslqnnhwoaKmDVHoCsx1zVLkbMpi16rxEUvazsNHG9NNAf1Bpcqdm9RkqqqIeEP+TTxabtnlVXG1aTIKy4TWLjTcoNKb3NFbt2GZcJcjBozUaV4YChhq84t7F6Xmm/IXz0EYDrB4wJ+ev17sVcACf64xCLtQOcP99Rzrg3pdPOa8LfYsNGbrPCeTQcgP3RqamTqAnR7qeq0At0hEpIz95npaX+8xaYeOa7xUA8mvoexq/VE7tce7CFN5z3qiS+tJsrM1UA6ns7MLZ+MYdpPqGtsO27r7qzLVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkSXge4rXvxraFgdxocvKlLpCIa3ELEyF9T1oilr7Dk=;
 b=K18WTKnWK9z6wbqB6wl3Dbg0h0E5RLD6/zexqcMlRwnAHOk4T8FWuHJeSMMzsKExl1oQr84WhvD4L0mBu593YlVikusjySI5pSMMO4RdR3cgC3xYqzijAE3HOymVpyS1z7L+1sGvxQ1Q9zo+JV+DPPDXpp3LctSTozihmK6aCC9uMKyz6Mu6qvhfCpBu+jJq1zEg8fBiWO1uuRCR5mAQN1CQTPJd91YNcEgvZppR7vWMwjGW1bwXBKswPWGm0hQ45LvEDN6sY120WImBCwIJ6vv9l0V2f7edL+AvKzbR5FBJTUZoLFCOm3+T8j24oikvqz9izO0eXrsHHSF9r23yKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkSXge4rXvxraFgdxocvKlLpCIa3ELEyF9T1oilr7Dk=;
 b=k7swi6qIonBT7tFO+63CwUp7xpN4IFFajWRw+uZpPhcMqpvV85NZ85++V18XxbTEeVSQTwPY+DxHXqAIss+akmSC3AuMJlbSZEHHvH/w9ZWAfCQp1yS2cD0HopTrVfniafl7edAyz4SsMjj8EyzM84vQ/fgNCEfY/R7FDj5bzcydTtJqnr4Pm4u4uygppLRpDB19EG7eA3VAQI+tXglofwad+EdnuLBix4fPl7ISYEjwXmfTq0olsXQ6oxtNQZP3h8tuLibGnr7wZ77PvrK07nVlcTJIBkt2eJ3hDj6ZEb8BeU6nKvys5Zx7BUaYpV8E+meLKxkRrQRo8yiKyZGvSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:12 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:12 +0000
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
Subject: [PATCH 19/20] iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
Date:   Mon,  1 May 2023 15:03:03 -0300
Message-Id: <19-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:208:2d::37) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 0678eb25-4a8c-4033-c662-08db4a6e5121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7CREpH8BoTLVJc0W72QgjrCnQreFvlEQbKkLz9AJLzUGRZfviHILJQL4ObaO83gWh4KjGtehkRC2F3PgcAtsCKJgRRszC0odBfsnZBXGivwenaa75EC9J7UuhJMEXeIn/xb6s5kQdZkmDrB7E5ADUaumunZtIVllbkc2CbJ70t/JHFRP+yqsHwadS4mjoceJZqhw3NuG/VIA9akYZ0qOiBNrfoqE10mDmLBiMQc1bxkvGq8Z2CwWRWygAlAjnDmSBZX3eJ7uO/qocV6vjNjgktn1av3FL+JXy4p9bK/vbla53WGezWHLjjt++Bqni5H5dzIDp5YQki/60TWG3XyVGwwF7GL0fnYh/XyBcbRl4gfXZvFJqSXU67z5QUbknQwEYjpEaFpqYa2zFcn0RTz2BQgw6cHCuEoqV9sCFrxDvuNpVgE6FJXsjt2L+1eAljGlBDpQknJgw8h7Xu9b1ZXjVjvXbWrnvL5dBU6LpzaLH9jr9k8ryfMpk4OvJejqGhMPDqjYi+O74xBgPHfaYezv57U4M3QWqAd4ycoweELkUlOZXROs9fJo8hGaRmn912bJMLu11/sIN90gjVWWszJf9NPOeV9ahqixZsudLw2tOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nlQVRfokKJt3mNfglpqhx9Q7pSE5cLZvulShYnwyTmH/K1x8zu70XHzEnBcH?=
 =?us-ascii?Q?Cj7gAqfLZeMjCxZL3KCAb4Vr1gPSNTPsIm+yPba6IXdbTkDy1XKqwxOZ45Rr?=
 =?us-ascii?Q?igG3vFH7qRsbIYuKTVb+w3HbQBAryI3XA5jSkllGyVsBVqlxplO5IL9UoV84?=
 =?us-ascii?Q?CsrC47C7HmmEDcCrGDkChMeZHM7rzEDtS1Tzmxe1mSwVVJpZFQEVjC4WSmB3?=
 =?us-ascii?Q?XiDyj2aMqsJkMBm16Ain75/kc5ilivJt1fqNBV7HxQcpfgi+bXpby2CIZbS1?=
 =?us-ascii?Q?Ki082jbdb/6ayc/+S3ZOqSjSqY2NPWMX0jwrPy1J+LsMRPCdGLikJMZp2/+e?=
 =?us-ascii?Q?3Nd4XF89jJ5T+cGT/QpdiITG6gs1Pb6SyOzwvrzH9n8y/xJ2hvgmMg2G9hsB?=
 =?us-ascii?Q?d6SItRmeiRVtDoq+cxkvO/RR0VInyEDFPPyn5py9QeGtTVK+pDnA7lRa8Dm0?=
 =?us-ascii?Q?/iI4AApwXblmpf9IHhMLSNvqp7ceuZ3SZrr5pUx2vP8n5mnrT/INK+Ea5+tI?=
 =?us-ascii?Q?zdKeChkks7vPL2QCa0pRPMjITwgF959A2HMrmQ4AFzSoYubcFAIxcw7xwj+u?=
 =?us-ascii?Q?sROiBae6sMZORrKoDJKfPbogie3RzftYm9drNpoLFriqilKRCcFFl1v1CCxG?=
 =?us-ascii?Q?KdzjnwMHflOF3TIOa3YV4c67G23X59Asp6c84oMk8iVijYw6lmfDmQwjrYWC?=
 =?us-ascii?Q?Ypj4OGmpCkQc8DdI8S/J5h9tbNe7HYfrSLdggs68YjoccaHjzvETqmLt+zzO?=
 =?us-ascii?Q?xYCcBlrGuZwF26JQW6LWV0lGILW6yTbMHoOPA9w5ri9Q0R5ad5iHAjM/saMo?=
 =?us-ascii?Q?/vkjZXXfPvotHS675rSZITaSXNeKGtxMMyqKd7QJaFmMP3ad6TOPWCJiAXAu?=
 =?us-ascii?Q?Nx0qe0Re7v7wD+ydQIPOUwz0TJDQcQ/b3uaLww5wa8E2DbNvbJd7yO6V89h1?=
 =?us-ascii?Q?QHrzXwLGQ88ngL0pvRgV3pkZVd9Ku2bh875DmZdSUJeRoWuDhMeUouNwWy8V?=
 =?us-ascii?Q?MuvShU27d7x2ZLOR1fCZBklvch5UPAUaWi/32dTSIsuFzNUwpi/bZhncAfVF?=
 =?us-ascii?Q?qUEtyR56JwPL1AKpmGav4t7gtiqwL/OIAAMmcdSeqgu+1aFFjSiT2IXRqdOV?=
 =?us-ascii?Q?8ZkZU2Aj35ctlu6wd+6n6NKqIpnhcgZD9yWFv9JIiVOxyv428KHKmSSzYDnq?=
 =?us-ascii?Q?xMAfIKiVPGr/JSreEwAKQSGF38GIDuUuFHoOkMXtj9e9uXAH7o/CBOET7apD?=
 =?us-ascii?Q?Ebep50h2ir87FZrjQc8TEfHHfgUfaYHf2efodbJQsS3WjWhRO3pjnPHrffB9?=
 =?us-ascii?Q?X8sq5f9DR4l77S6357cW9powNPfcg/avSeqlfosArK0SRYCatt7PzpEp+v6n?=
 =?us-ascii?Q?3HJIMtxfpra4aZecRoOnLVbLQKTInrI/iiF0F+DU2uCrXjWTJfLWWPOAOfAV?=
 =?us-ascii?Q?em08wtcQKXYE3b39zt2zc2zZIywPumrXl+SkHO/BtGQH38Wa47IM2rOkBJ/s?=
 =?us-ascii?Q?6cTt8YYVPs4W/3JPIYjWxNtWlKfFBA6eNeCXM1FyF55c0L4soukMfUqmZsiC?=
 =?us-ascii?Q?QBneH/TTiHtE0t3hCgzt10H9Fs2vA/08VhkD5rcY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0678eb25-4a8c-4033-c662-08db4a6e5121
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:07.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1V2ZyUEwHbhSeEYF6BIuSVdjC71NgIZEf4zaGwhwPrBNqFB2nH6xcFsQO9vUWKg
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

These drivers are all trivially converted since the function is only
called if the domain type is going to be
IOMMU_DOMAIN_UNMANAGED/DMA.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 ++----
 drivers/iommu/exynos-iommu.c            | 7 ++-----
 drivers/iommu/ipmmu-vmsa.c              | 7 ++-----
 drivers/iommu/mtk_iommu.c               | 7 ++-----
 drivers/iommu/rockchip-iommu.c          | 7 ++-----
 drivers/iommu/sprd-iommu.c              | 7 ++-----
 drivers/iommu/sun50i-iommu.c            | 9 +++------
 drivers/iommu/tegra-smmu.c              | 7 ++-----
 8 files changed, 17 insertions(+), 40 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 9d7b9d8b4386d4..a2140fdc65ed58 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -319,12 +319,10 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	return ret;
 }
 
-static struct iommu_domain *qcom_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *qcom_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct qcom_iommu_domain *qcom_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
 	/*
 	 * Allocate the domain and initialise some of its data structures.
 	 * We can't really do anything meaningful until we've added a
@@ -593,7 +591,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 static const struct iommu_ops qcom_iommu_ops = {
 	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
-	.domain_alloc	= qcom_iommu_domain_alloc,
+	.domain_alloc_paging = qcom_iommu_domain_alloc_paging,
 	.probe_device	= qcom_iommu_probe_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 6ff7901103948a..2af0a735f3dc2c 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -887,7 +887,7 @@ static inline void exynos_iommu_set_pte(sysmmu_pte_t *ent, sysmmu_pte_t val)
 				   DMA_TO_DEVICE);
 }
 
-static struct iommu_domain *exynos_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *exynos_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct exynos_iommu_domain *domain;
 	dma_addr_t handle;
@@ -896,9 +896,6 @@ static struct iommu_domain *exynos_iommu_domain_alloc(unsigned type)
 	/* Check if correct PTE offsets are initialized */
 	BUG_ON(PG_ENT_SHIFT < 0 || !dma_dev);
 
-	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
 	if (!domain)
 		return NULL;
@@ -1474,7 +1471,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops exynos_iommu_ops = {
 	.identity_domain = &exynos_identity_domain,
-	.domain_alloc = exynos_iommu_domain_alloc,
+	.domain_alloc_paging = exynos_iommu_domain_alloc_paging,
 	.device_group = generic_device_group,
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index de958e411a92e0..27d36347e0fced 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -566,13 +566,10 @@ static irqreturn_t ipmmu_irq(int irq, void *dev)
  * IOMMU Operations
  */
 
-static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
+static struct iommu_domain *ipmmu_domain_alloc_paging(struct device *dev)
 {
 	struct ipmmu_vmsa_domain *domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
-
 	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
 	if (!domain)
 		return NULL;
@@ -891,7 +888,7 @@ static struct iommu_group *ipmmu_find_group(struct device *dev)
 
 static const struct iommu_ops ipmmu_ops = {
 	.identity_domain = &ipmmu_iommu_identity_domain,
-	.domain_alloc = ipmmu_domain_alloc,
+	.domain_alloc_paging = ipmmu_domain_alloc_paging,
 	.probe_device = ipmmu_probe_device,
 	.release_device = ipmmu_release_device,
 	.probe_finalize = ipmmu_probe_finalize,
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e4b9f728002403..e0bb10adc62967 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -667,13 +667,10 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 	return 0;
 }
 
-static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *mtk_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct mtk_iommu_domain *dom;
 
-	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -994,7 +991,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 
 static const struct iommu_ops mtk_iommu_ops = {
 	.identity_domain = &mtk_iommu_identity_domain,
-	.domain_alloc	= mtk_iommu_domain_alloc,
+	.domain_alloc_paging = mtk_iommu_domain_alloc_paging,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
 	.device_group	= mtk_iommu_device_group,
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 9e1296a856ac4c..24a2a09fea5503 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1071,13 +1071,10 @@ static int rk_iommu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
-static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct rk_iommu_domain *rk_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
-
 	if (!dma_dev)
 		return NULL;
 
@@ -1200,7 +1197,7 @@ static int rk_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops rk_iommu_ops = {
 	.identity_domain = &rk_identity_domain,
-	.domain_alloc = rk_iommu_domain_alloc,
+	.domain_alloc_paging = rk_iommu_domain_alloc_paging,
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
 	.device_group = rk_iommu_device_group,
diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index 39e34fdeccda78..af68b3a2c123ab 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -133,13 +133,10 @@ sprd_iommu_pgt_size(struct iommu_domain *domain)
 		SPRD_IOMMU_PAGE_SHIFT) * sizeof(u32);
 }
 
-static struct iommu_domain *sprd_iommu_domain_alloc(unsigned int domain_type)
+static struct iommu_domain *sprd_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct sprd_iommu_domain *dom;
 
-	if (domain_type != IOMMU_DOMAIN_DMA && domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -419,7 +416,7 @@ static int sprd_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 
 
 static const struct iommu_ops sprd_iommu_ops = {
-	.domain_alloc	= sprd_iommu_domain_alloc,
+	.domain_alloc_paging = sprd_iommu_domain_alloc_paging,
 	.probe_device	= sprd_iommu_probe_device,
 	.device_group	= sprd_iommu_device_group,
 	.of_xlate	= sprd_iommu_of_xlate,
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 15fd62d360778f..2831398ea2ca71 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -667,14 +667,11 @@ static phys_addr_t sun50i_iommu_iova_to_phys(struct iommu_domain *domain,
 		sun50i_iova_get_page_offset(iova);
 }
 
-static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *
+sun50i_iommu_domain_alloc_paging(struct device *paging)
 {
 	struct sun50i_iommu_domain *sun50i_domain;
 
-	if (type != IOMMU_DOMAIN_DMA &&
-	    type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	sun50i_domain = kzalloc(sizeof(*sun50i_domain), GFP_KERNEL);
 	if (!sun50i_domain)
 		return NULL;
@@ -850,7 +847,7 @@ static const struct iommu_ops sun50i_iommu_ops = {
 	.identity_domain = &sun50i_iommu_identity_domain,
 	.pgsize_bitmap	= SZ_4K,
 	.device_group	= sun50i_iommu_device_group,
-	.domain_alloc	= sun50i_iommu_domain_alloc,
+	.domain_alloc_paging = sun50i_iommu_domain_alloc_paging,
 	.of_xlate	= sun50i_iommu_of_xlate,
 	.probe_device	= sun50i_iommu_probe_device,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 7c301a732db2c0..115e51442df5c1 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -272,13 +272,10 @@ static void tegra_smmu_free_asid(struct tegra_smmu *smmu, unsigned int id)
 	clear_bit(id, smmu->asids);
 }
 
-static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
+static struct iommu_domain *tegra_smmu_domain_alloc_paging(struct device *dev)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
-
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
 	if (!as)
 		return NULL;
@@ -986,7 +983,7 @@ static const struct iommu_ops tegra_smmu_ops = {
 	 */
 	.default_domain = &tegra_smmu_identity_domain,
 	.identity_domain = &tegra_smmu_identity_domain,
-	.domain_alloc = tegra_smmu_domain_alloc,
+	.domain_alloc_paging = tegra_smmu_domain_alloc_paging,
 	.probe_device = tegra_smmu_probe_device,
 	.device_group = tegra_smmu_device_group,
 	.of_xlate = tegra_smmu_of_xlate,
-- 
2.40.0

