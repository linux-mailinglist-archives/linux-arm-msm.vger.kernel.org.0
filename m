Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 277D17041B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 02:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244867AbjEPABO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 20:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245748AbjEPABM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 20:01:12 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDA97294;
        Mon, 15 May 2023 17:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ET76A9NbBf9XkYQ8kwGH6AGdhjdGdYuPZa+jF+l1kgb2NiRqoqjBZ7HtZ2SMg2kX1p/y2sv+EBmYtFXTGGCAObU6wBc+8Hqy3iPHrKu2As1shB6lQy07UXyhh4gz4oJD8mCqoV9btbk8PaGL0H5rgoHc3SK/bRgfkJxubZI6I/QwapVeBgilre5MKi/DG34bK6BNepvIOyayMoOgM8CDQSIP3p5jK/4q+HuOIK2s8/GjMhFibz+eIKbVGXgVc81iOEOWb+1Tezcxlj8qgqGZ7VdASRxybMdnmv9cXyaJpuFN0b7sS5VCqhd11kVHS5H6/xpp251beinNhH3BomWh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFI6YlGa/rRO/LUho1t6NDgB0fD4aHQKfGv6pVqsJA0=;
 b=DCX+u5SVZjoCaf9mitOu6OxFm3QAI3TU2DP0yGVvhBmQMDeT+2VkQfx334PSVgNXoyITeRDsmKfOYSVMxhAxDFQxI3/Wck13X1Ts8mU1wNCFryxz9nQKn57mZAj7xYDxzUre3ReLU3tjIa1/yjU0YzmJ1xo9XZFma71QYuajWAcxmcaK8SmZoIfHxYOvjaRE4C4zIVQ9nCoGiuFuS/qamkQan7UZwfbF7qWBpV7MwrUg/5xKySAVlmoS6SbJymuHkTd4RnVHuBNLJwAnVY5nuUiwBHjl55HDSQyaWfxiMjJsBCVVyl+4LWQISV/QwKOHaS4qN38UsOPSM0c04wz2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFI6YlGa/rRO/LUho1t6NDgB0fD4aHQKfGv6pVqsJA0=;
 b=Bj7wE1vfhwLy+V0cACLyGy3EflrKhdiAN5TjjFGNtEfQ4RDiUONXXuNKNso3zL6XU49G3ntfwqujSLcuzNMQBfG1B4128yqxtaWem1YmchimNL/NnVUXvuYcWirUvWvgXVrouoTltr68+3/FzbTsxnOi8H4RGVjq8V9KR5d8OmCAD9QUZVmyDcpektAK3rzteBWaX44dDbHmZ0dXKCGHutOuS5LSJ28du5NQRkGBaFRzpTBF2n1oVDXUqtFVS6rUCg/baMMnrbqVicXV+wyGuVLmHhnUpTjfkIjJuyYHY9tLUNreVhyr0gUzfuyk8b3ZFCqfOuvtJpHsbIbXtJJ3Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:05 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:05 +0000
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Andy Gross <agross@kernel.org>,
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
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v2 14/25] iommu/msm: Implement an IDENTITY domain
Date:   Mon, 15 May 2023 21:00:47 -0300
Message-Id: <14-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0020.namprd15.prod.outlook.com
 (2603:10b6:207:17::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d2000e-d724-4942-1791-08db55a0a283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6q+HsMBOmoMwjjYGhxlMpgkN82j7pZsKAINB+WUlJHsSi7Yyv3kuOcsIkXfwA6W2w9NxQl6OO19lErhID1cNIhogwBMtdd49jmwRIuLqJb6ZfAd4qZf6Wu0zzE6DmHxy/wlnZ3D/z5HXnjNCiBkpIKdCO0A2jWWprAMv3DinsWEeWpAf8iGXlhfnQx3USavwKY/nvglIrG6y07QUWUo+yw4KVWN0Yn6J3roRh3IzJlUrY8SSlHED4dSZ0HigR6dxcuYTyrxwWUNHC06QWtMEpaou9Kt/3LGxs4LuxLpeRXzmvh90IAxGS0NuPZgHLpcZNCLY4R+YpOa5hKw64zxkHhwLMmXlcUBuiC/9c3mhtFr5HrqP6BgUtMh+eOsj08M0FH0L97W7vCci+ENDausLj39Q6uNj9vXU06QLHu3kuIbzJQbcE6RwPXhP7x3dEtvtSDutaBn0Q5oApY5ZX3AS+Odks0Bq1rBlTYiDZKReLfisDJlY2Rn1I5iXMlEIT1AV0aH2A7L1F+y4UrgX3A0rnZHt+6zuUhDvsEzskoJAIEQYJ/XhVqljPAc54t/yFGMdkJjreUDNmDngTLcuO129AjHF0l2k5A48WLIYFCLxTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1R13591sgQ5AFb6FVX5lTCpQzjoZ2dRowwvePy2HtIPs0VB39NnkA3doGB8/?=
 =?us-ascii?Q?iSzOqg9Q5yd4ZmdXg7RaYL1iQZQabOKbCLTbtDkAYGZqMIH6XJE2ImpKS6lp?=
 =?us-ascii?Q?9pfMAHAjEa65IL1xgeq29REtEYbbjn7d3opd/CJCCYb995GsQYOwkVHRXNw1?=
 =?us-ascii?Q?qHESRM3Kc8yfFNqKkC8H6lc1jrsU3feKXz4tLr+tG+kj2elMxOMG5HdhVJ8Q?=
 =?us-ascii?Q?7Ob3Hf2kzxDkesKuZdlztjBjMKmlDGDTujeL/av0M607M0IoDoWW/ofM3EzX?=
 =?us-ascii?Q?bq72SBiuZnoyCei2vThYe5mP94ogLH0HLOGDRRfEV7lpMWjTsu4pitRqGJ2K?=
 =?us-ascii?Q?fGGzNXY1ZK0HXb3q90v+//4naXJbBbwYjwOoK6OESA3c4GzCEjDdSzrS2f+D?=
 =?us-ascii?Q?vqmx5le3A3PHzXjdwQFa1PDEo+aDLav4BmUflPxPKbnoAOYhAEev7JMrnh73?=
 =?us-ascii?Q?3JE5v487AHfU0v/d2Z+6jPZQipfecStmNGvUbCSEQarg+ZYUwYlBngjFvLTO?=
 =?us-ascii?Q?Qkk8zkD5UMpwrSCVKDxqCV8hjwxl1/MDLVRdi+iW9U6VO7cPk8Onql6XbGRF?=
 =?us-ascii?Q?JZb7f17p9jUE8HbvKIbzkBiw4kWwYOuHMFtZxOEvWUHhzhrOYAY2MZ7x2dub?=
 =?us-ascii?Q?qL+SCXVcy5Q6O+QmH/UNiij24XqLQ1DKhQdN0C6L+NDoQrk4ghhg7hUIOG3F?=
 =?us-ascii?Q?SRvMDb0TGrkDaiNyQl5kNG2UljYExASY3OIkIjKTJNMZvQNld3ar3Ef15tg7?=
 =?us-ascii?Q?4B3dR/WLhTteNvf1bKU2XagnLDUai4RnFEusDJZSRaQA+IxNFNCGdwOThrPx?=
 =?us-ascii?Q?RDaoZ+yAvRH6Y6U/j7HClgduk17X+/sC6ZmrN3+timFtDp8SfgjUgrp/QwNQ?=
 =?us-ascii?Q?3ZikdGaSO6reSgv3N59ex7DIbHq8efl++lWHsfes/Qhu11RWTziaWliHyLGH?=
 =?us-ascii?Q?6pRRs6wXr4R+AkSFMNttQ7FEldLjoFnAimeeLKe/tgC/U2wVi0pY3gpo9Jtw?=
 =?us-ascii?Q?/R61libpETMXJGxyN2vIuGwOQt4zVVxwAQhOyZdfNwTXnFl9sOzChRhfjac1?=
 =?us-ascii?Q?QkRM4eJh5UHBHRisVakoXwOqMLVh+0BL3IUwCkxXlsZu9wpvYs0oFX7MKp4f?=
 =?us-ascii?Q?9Ai7OlHzK1lCca5dTrkjawvqIQnp6+b9kaoTnsPjuingeU4o2+x1ySFEGnOL?=
 =?us-ascii?Q?TBtP08dMsPTLNputhJuZIOEuesPxtuQht/xwsvXgUvYyW5OFnWsX0Ylbd5OY?=
 =?us-ascii?Q?tQy+OZYise30F/ksN5tv0O6dUbaEg3M5DKc0qwXk5PEltt+yMLeo4Lg9HIjp?=
 =?us-ascii?Q?B97qoj5n4AhNGw0HOP9UvcUih97ix2ZRj0tQ3zGTJib5wwraqFJdA499EII+?=
 =?us-ascii?Q?KqYWHM/4Ei1IZz9YyrjTcort1cWzYlKdlqO6v00qANp3BZxtpZWUtkHtVR4k?=
 =?us-ascii?Q?+bSZQJ804vyntiwdT5Yox1B3bE7drvBFm8C2x5XpYMZGVdOa/2J8BHUJN6cZ?=
 =?us-ascii?Q?Z6pOBhOfTBiwQzJs9hPKZI7LEhPbyh3vyHUssbwUF8mf/0QBzd0RrkrTxzTQ?=
 =?us-ascii?Q?1zWUXQUyc/BRCo4kd9HkSRfUiMOxL6ldc3AF4DKQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d2000e-d724-4942-1791-08db55a0a283
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:01.5609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GIp3gnLL6dB9m/P1568L9+1fCppokxFlIV9Q/5qyJSbV4/XOEi9FisI18Sr0BBl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

What msm does during omap_iommu_set_platform_dma() is actually putting the
iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 79d89bad5132b7..26ed81cfeee897 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -443,15 +443,20 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	return ret;
 }
 
-static void msm_iommu_set_platform_dma(struct device *dev)
+static int msm_iommu_identity_attach(struct iommu_domain *identity_domain,
+				     struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct msm_priv *priv = to_msm_priv(domain);
+	struct msm_priv *priv;
 	unsigned long flags;
 	struct msm_iommu_dev *iommu;
 	struct msm_iommu_ctx_dev *master;
-	int ret;
+	int ret = 0;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	priv = to_msm_priv(domain);
 	free_io_pgtable_ops(priv->iop);
 
 	spin_lock_irqsave(&msm_iommu_lock, flags);
@@ -468,8 +473,18 @@ static void msm_iommu_set_platform_dma(struct device *dev)
 	}
 fail:
 	spin_unlock_irqrestore(&msm_iommu_lock, flags);
+	return ret;
 }
 
+static struct iommu_domain_ops msm_iommu_identity_ops = {
+	.attach_dev = msm_iommu_identity_attach,
+};
+
+static struct iommu_domain msm_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &msm_iommu_identity_ops,
+};
+
 static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t pa, size_t pgsize, size_t pgcount,
 			 int prot, gfp_t gfp, size_t *mapped)
@@ -675,10 +690,10 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 }
 
 static struct iommu_ops msm_iommu_ops = {
+	.identity_domain = &msm_iommu_identity_domain,
 	.domain_alloc = msm_iommu_domain_alloc,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = msm_iommu_set_platform_dma,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
 	.of_xlate = qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.1

