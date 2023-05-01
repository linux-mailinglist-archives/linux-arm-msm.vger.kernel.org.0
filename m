Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3316F3586
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbjEASDZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbjEASDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:19 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DDE1BFF;
        Mon,  1 May 2023 11:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgBZFMd4PIJLGr88j/lbhdvsqCnR/26nhQWZ2WGTaLWniOc6s68e+0RC7waa5diCwyvrF2aEcuCTRtL8LYt3skP78wNLMTBvB3uE+CJTUAj4pSaQHRdjtvriHgabOSrayseEfdVUOGuWOzr/9+epZKJYP1I4uGEbmWhqaa48tmHbGirLhwllbef7YncG6uz2EKT3sbJ3vUuZ5UaSjLsyxJYmV5ib7OjiWBmLqJ212IWO9VEcj60pWQbo9pmpEkQAYbJKasIChK0jyzGIL3cxAMUBZA7Znda5gfUlbXTCBeDu7UpJXkJrhF1O+BiBlE7F2eoeNHcc5qbgPv/wBRSwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+stucwOwjFKhD0s67QbLxMgWtACvPSPBN034ISRbvA=;
 b=E/7epPmVe77Lh/sepQEVofwSZ/9B+m3VsUR9VepUvirifxo4DfzYAf55DTlz1XSu4aPZ+DNV8RtsQhk0MGfVv2BX+zwyVAPaptQjfDDKtvi5aym2GCg7gmEc1BRtl3pOBJLkmLltyh/s9aB+rFQZpuWlRU09lu25z1t6iyOkEu7EDbRzJamqUO1/wykgL61w5T7/jcEADp19ffs+gKSJAN1rwnfjJzrTMnvxvKWs/zXNmHOsLvh9nOgCURvgMAFsO+bt7hnvEIbi/11QJUG3LGLGcHS6iXZ1BeHE93QsgEX9vj//DiAkGIXEjqOUx8nFUo++776zUymOmZu83yWXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+stucwOwjFKhD0s67QbLxMgWtACvPSPBN034ISRbvA=;
 b=aR7JnHEQviQO9Xbb4GwtXGRssubGprvOOzUf3FiyYlXqRGaU/7luEQO1iNbqupCFH7bl1ck+OnzgI/nCiJjhwsVwSx21G2Raa2tqViTvfOkCRadUbiTuDidnXuRb3IVgqDNOw7C4snHGJm8bmCcRDIdZaWlngc6OdOYhAhEiA1ml5ImVsQUOSaQc2V30QsrfTFHPUqIbf/Tu2veWtCPEKkarX9UHXJhNbAOgR+awKWmHy5pnDKhhRSe7jaARclUGelkKl7OXU+1XvKFniRIJlaRhJO9BypUeM1KFPxbWllaYC/zaJe53JxSrFqhgTF04ovU8tKQVn/oifyNQHHAhig==
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
Subject: [PATCH 09/20] iommu/omap: Implement an IDENTITY domain
Date:   Mon,  1 May 2023 15:02:53 -0300
Message-Id: <9-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:208:2d::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9c7fd9-57bc-4c69-16ad-08db4a6e5111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K1407zRpJSkblYJ90v8axf6NxoG/ZGeTsiE2EI2cjP2De3HXb/AU0Ju+ZqljAcehdO3M3WFcJZJuoqcImfKCrHW6uqfXFimbB8c+yM0444SSPWIN21LYxcS/uX4CfstIROKWY4F1SRQKpSRJGJPTcQvnbcuwBY1+dGmUhZ7QJ65Mpl7qf4qStvPR1bVh4AFLtTdKJ3jLVE3PtX75+rzm4V3z2y0YbPTKcoJpczm/OfueUBcUki4wCsLRNTK0kJ7z2niIyNk9YiI4eR+Y70c6VHd7d1FA2AiO+lrMiMKMEG1E8fKRGhUZiLb/lgUbWzsZ1CdPIISNBQdSr6VzVnFazLyPzp9KT6q/z9Ayo/WJ4VPBfhKlvvGBCEC4BcEUan9yVNnNI/p1hcYEGHlZdFOhkI7PnbXmyyv5CxQy2VgqfcH1g2/HGcgSj7evWt4PHemaKrYvmFYRJaA6Zw5bz+2/hz9ynCjeYOIDGn4CZmugm5cp7Eqr00B/3DncnFqkxXyTbcmp6aTuuuu/jBcrO2JZvBiNKqehJ/h8N/LJ3AVRp8Pq5zNfVOr1iqatjPVjQoaPAo6059rOA8yLqyxZ+uZzUx5A44xYmWS39RsE4mpNpxOR0Erwl2nOxSnoSwm3Is2S
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0OxQkhjMER0GI8R+xrs4r9TGwez+N2ImFM6XhLVnC+SNLtLQszp7hxLRqSCS?=
 =?us-ascii?Q?U8I5b5VtJeNSQFfDAoJWAqTXEg/71mAmiAj65yj0ekDpIsmuayzHTavGiFtf?=
 =?us-ascii?Q?73rA61l9atiNjnkARt3tzvXGNUpj7wDMhjD7A/UHQYLpc5ZttQvDEAsT1q4e?=
 =?us-ascii?Q?k3ZsyAPCE79bbrFnyGObxg8hQ92WyfH4NzkReqiU3ZNkCwbsF8qkUuflX+WH?=
 =?us-ascii?Q?D+uWsT01rQyPn+IcIeHm42RBKUNsZWNKEB8CfUFv1gGmD87nXvJ8BsarwpZO?=
 =?us-ascii?Q?sCiDMDmgmGpYJrCm2goGSLE4MjnG6ZutAKIs5bUZmoHgKBtqYzyzXxR7Lka0?=
 =?us-ascii?Q?57anUOxil41yaOKFHAH0405SMFgx4NdPKT4w5sVrdVGB9C2MMdsTTWqUpSgH?=
 =?us-ascii?Q?ow24+H20OO+rX1X/Nodb0QTd9PLR3cNVFSJaKJhA4cxPKpqC+/x4LFYWTpeR?=
 =?us-ascii?Q?MsuiPyHnVLhAhiT+vn/mFzRwzjcZWzd09XFjLnxU3YL1+S96l8H4G4Xec3m7?=
 =?us-ascii?Q?DIQ6UCBnc0Y6eNuEbUvelr23cVelMUeLiagfCiKlb0skb1Jus8I6cs6c2dFL?=
 =?us-ascii?Q?Vam5yw4ELt35gJp5KT+iNpjzBiOE5RwQ4Dw0F9GZV+4pINsZIvFLaf77gEUV?=
 =?us-ascii?Q?g/dKAoOcxoZFp1ZO3eXu8Z8K8ETqf+Sdd+XUIrllL0iB2vncImrUuwSKHm9Z?=
 =?us-ascii?Q?jmh6kW1FNu+78BCNAf7kYEmmXxebQ2yTtJbYwpEDpod8Y65oW1cmL99UNlaj?=
 =?us-ascii?Q?4/U61R263eNj0etCTRG/VGNDR5lBf0F5MAfIl8BHgi96Vnnp1OmZSO+as2cK?=
 =?us-ascii?Q?aP80w3Bl6gtEafQNSSlWQ8tLh/YpLtDMuNNVDNWgc5QdVn9djLuFgUya1ap8?=
 =?us-ascii?Q?ZyEkAAFjiUiGYgX8U0um86577enBCodRknWBLIDsB+mEBgenyerMRg+Vn+UZ?=
 =?us-ascii?Q?Q2oXJtm7yHX5i48mzpSzdJr5gKHNZyQe38Wourrnt4xfhjOM+Untu92vFLg0?=
 =?us-ascii?Q?Mk94HtcM3dpIBX0udFxcLKqj+Gqyus5aOzTZEIL2HLr63cY2++INavvbFgP6?=
 =?us-ascii?Q?sqkA5BHlE3QmfcncE48YFUKIGxwKaF9dXr8e0iQwm5CmMfSv+c3nK4izAwMS?=
 =?us-ascii?Q?J4BRvfeOyiF51ueYN/FuuTTPJ8e75N/WtVVIcPoWkRDB/0AE5dLZWCvJH9tc?=
 =?us-ascii?Q?JWTZPuVzRtL3e/ETZEYaYuiOIQuDK8LDTFQhNlB2yVIhBB1vVz7UmgM+yCME?=
 =?us-ascii?Q?L53OALwQnh5I2eHyDij9pQcoayoFeYdEaIC3j+loNoHLI+vKVo2BEj6DZCNG?=
 =?us-ascii?Q?tVQGt5M56UTNeYfi8zHFUviS0YjJY6t9eAHeOLMQvkZNKJExXyRh61Fjryn8?=
 =?us-ascii?Q?dar+7bSBzcRJRQUFxk7XHRU0y86wC1ITXg7N4lPolB6OlJ2PylQDY3dTJzVb?=
 =?us-ascii?Q?CgbdXO/h2ZKSsTefhwXIzXRM3phIqE89NVv8Cc3vOhdhQIeUYhPeCRTbEJRj?=
 =?us-ascii?Q?FhFvTxb9MmnKyU7aqIO+vWCZoqd7in2Y3FAHqXdUrK6KCsRqQLjsPDdCeG7A?=
 =?us-ascii?Q?vLPsqQuLtnHzfrdYrCdE5OJJuCf4d0W2x3ZbKDXh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9c7fd9-57bc-4c69-16ad-08db4a6e5111
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:07.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsvS5XFLLaxuDyv6zvIk0PbV9Vgv6wrZE8pc2GNi4iEAG+vkqekq291Stzt0/V2f
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

What omap does during omap_iommu_set_platform_dma() is actually putting
the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/omap-iommu.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 537e402f9bba97..34340ef15241bc 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1555,16 +1555,31 @@ static void _omap_iommu_detach_dev(struct omap_iommu_domain *omap_domain,
 	omap_domain->dev = NULL;
 }
 
-static void omap_iommu_set_platform_dma(struct device *dev)
+static int omap_iommu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
+	struct omap_iommu_domain *omap_domain;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	omap_domain = to_omap_domain(domain);
 	spin_lock(&omap_domain->lock);
 	_omap_iommu_detach_dev(omap_domain, dev);
 	spin_unlock(&omap_domain->lock);
+	return 0;
 }
 
+static struct iommu_domain_ops omap_iommu_identity_ops = {
+	.attach_dev = omap_iommu_identity_attach,
+};
+
+static struct iommu_domain omap_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &omap_iommu_identity_ops,
+};
+
 static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
 {
 	struct omap_iommu_domain *omap_domain;
@@ -1732,11 +1747,11 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops omap_iommu_ops = {
+	.identity_domain = &omap_iommu_identity_domain,
 	.domain_alloc	= omap_iommu_domain_alloc,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
-	.set_platform_dma_ops = omap_iommu_set_platform_dma,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= omap_iommu_attach_dev,
-- 
2.40.0

