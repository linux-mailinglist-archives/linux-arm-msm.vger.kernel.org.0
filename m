Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECE86F358B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbjEASD0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232697AbjEASDV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:21 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8533919BA;
        Mon,  1 May 2023 11:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrZMmrJY6LejC0G4aYbgOSd+hAt+SXVhJFnVEFhqcSRQZgFcu096UrJqvpzBGLEpgnx42wX4Tkhz3U35/kafYGzsCUtLwfHo4m4PywsGEtcOYaf5h9UqG1RNxR8srFe4EM7qdW1FlxqeGNXEkHPfrKHltYlZawkx1UOrKx8V23Nv8OdpAb0Mxwk9kjezGSDdtlirIzFZ8N/OjIKrv1qUPDfzpA/1/LAKYjRu60ldnlb/hiWX09aGgwUPYD1ZIyBNbORpwdf0SuBsx1e3BCrnZUrZKl4Rlr7ZmjVJIfB1NTr9dISgK2Pg2Tps8B+i963QYbtVf517CXrd4z3g7xiu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxlJAIL/6yqo/uPvVRna/QtacFVHTVrY/pPL0mYw8Ms=;
 b=F4gJiq8X+X5+CKWEjhUFj2DTGzfGbvScGZripwJJh0trOehlG+PYk6upGdknhz5v91LgCpkRTtMZWAUJ/TEZxc6ji6Y4v97kDadj9HOaSI+Dm5z6WGdUMfahZ1qPV9lo50dgCSPrBjiq9alGEV7eXKd9Z2bQ4A7hqpT/yI+1sAhzIpwTNmKI9WoJpMI7KWpmWPbjT3ziIRi1upYdAV0VNhITRIkYNe3lxSlus8yrpd5jSiWyQtOhgxPiv+HXcZTUEGxaqKqkJByzXGpV4C4ds+NhRcHxCsVYehZj+RyEUGI6KhdGKKOet5x+cAyshY1KsW8fLnbjkSA6+3wFJj2jiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxlJAIL/6yqo/uPvVRna/QtacFVHTVrY/pPL0mYw8Ms=;
 b=Qi9iEjPNINfwxIGJJo4++rcZKIzVI82Rhx2Pxr6Qrh6prKnN6kyNkoRvOM1EturlRed5ZRysCgBgtRBQPGkhzvaoOd4I0Yt4/nKUDe9gIg4dl1xhSVJblfHqUVgYKjeGLenapZAUpC+EkuQJt1ZpQSbUkGtP/9Xam7x1YTo4lbmGWiq8/652Y3oUzKMbUKvNFS5OYFDhkN1X/ecM0lwD7xWmNLILI7bt6+ewdw8znLDGxeY6MYk8lTnTCMPlM1DjjHCxLoRiVVuRMxi4x6tOZLv1lzIYomtq8eWNAE8WkMz+54qI9DfaQqKZJT+EVNEn+FI5ZAboYDcqy8c+UZlBmw==
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
Subject: [PATCH 08/20] iommu/tegra-smmu: Support DMA domains in tegra
Date:   Mon,  1 May 2023 15:02:52 -0300
Message-Id: <8-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:208:23d::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: ae178e33-cae4-4d7b-9f94-08db4a6e511a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CkEddrUbNh9X6nDuDBRkU1svFcyXqKJOyh/PUhnW8ubwf8KZSy2JwDvh2V9OlLm4oejOTlnvBzNt66ZRGR7b3ODGGqxIV8PRoQhUJXObfYjC/Si+1DkxAYF7nUv/KO34kWImUh5q00Vc5hvDI8l1By0ADkgNBO5DyKUewnowi2pbN6g4xe+5j1AbWeAi8hdRrMYkoESkc09yu9F8w1e8qpw8+mOsULx6g4M8PreUSB/l/vp1vIzYbH4cNuzDKeoiv3PO/C1fd8Iwx3j9Q/eNPJpUuNlO3ul1iZ67fGNobrmiBHbTiwvhaUoSsGcm7gQMlJD42kTJglZaiFxxWOsgkSr3ubOBJivM07IwM7U/norrMxse13jrQxKyxVi/s/2JXCZlqVF9XED9GZEUch2kq/ij1AXnBPaaJ3nb/RZqJV3AHoKYgz/FHl2wmDnZhhu+6qFLk3vzjt5S0I1tVXS4ZvWJAm2Ba0/QJ3kpcdKUn5IlDAvTdzHT9O81AobkZbX/9x3VQVF2mXlPb0rODLGSN5gFsEY1+ZG9qhupAyCShQhc+mRZz9dLbaim/bkBFQnUgWV0/LR+oOlSY+3OzYiYGJIJPIq0NC/nqdHeKJn9R2DGh9ZdRy6UZK8/NxpChljv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?klYQ7ITw3dL2MXk8tF72w1OnY9nrZJHcga0cFo7X1f/yxE/D+aifq5Lt1fBI?=
 =?us-ascii?Q?OPL1HPOxZm0a8UWcJuGtn7XJv/THCSSCN4yo5HqygJ2PC5z4ILSN8DwyamvT?=
 =?us-ascii?Q?6KtpY/q6QPvT+p8lNe1fK9Xwmg1nKsKCFuW3qPMkDlRWeUjgKqOwtOZbLFc0?=
 =?us-ascii?Q?iOPEne3tgpcTP6nPPvBmGkBGrGY3uzvuVYo1JvDFZ2sxXKfk5Hp2CZ900LoD?=
 =?us-ascii?Q?Zo5YW4/nfsOJsvkuoFlpNmCxZyuo+VvQdpeb8LV8xi39URVHgcxka59gSTI/?=
 =?us-ascii?Q?KdXcqbR+D/boSlDZ5xLF39OtZKn9PlaKw1ERJVyw6dqWqmnIcYQasVbVc1l4?=
 =?us-ascii?Q?geLMwqwzVuJmk2XS95z5JKAONRFfRjRjoxDTB979jajNWPKnb5FYiOIY0h6K?=
 =?us-ascii?Q?BZepUqiHoScvF83ePpYSryFh1GwePUGhtldwhWC02I0ytxsUqYLBPQnU12m/?=
 =?us-ascii?Q?+XHGjCfKyhdTNiENfFtFVF74YnO1RgONj37j2Ej6LDf14nPhhWtMl77QoD9e?=
 =?us-ascii?Q?BvLFHzZLA2PhZqAPH+gyHgcg6Xd/cGvN+DssYRvjOU8JN6FU+o8/FOTGkOcA?=
 =?us-ascii?Q?BwDcPMlThpvH5quD3jf4qjtWnhwIR+FQQRK32W6awXGNi6NgWpOh+GWDVdxe?=
 =?us-ascii?Q?Hrr96N3QIxmSpqApcjbwkyO63DVP8WYPAJyqQ/glV4BKiOavgXqJ5jVFIAF5?=
 =?us-ascii?Q?1/xiF9Ra7gwk7kwAjLNjbTubYbk2Pw1eafP9WzqMZyiWOi2KTNO3MS/Cy8Gb?=
 =?us-ascii?Q?EKPDurxuHug82SBKRKxOMRfpiEuM5vngKywQ7rEnYalTL7UyoUXl3ackmf+K?=
 =?us-ascii?Q?+b7JJ0bmy2/SNBcYzxeudzAgUtiT7gKWXSGBGptVO7YHxC1w+JPlVxHfdSND?=
 =?us-ascii?Q?sA8vK+76ICdCpv0qo7ot/SmzGiv67DYiPxdFOpf+u43YOVMR3klk8u/FILeJ?=
 =?us-ascii?Q?5CvSSB8j2J7RCd39+xP+i8ZD3UouxDea9l9hrq/M5VGqOlcjfBSSa9pEUOc3?=
 =?us-ascii?Q?vKX0YijeLznAYUoYxcHxvN+d3bn3Yzkkom9xmk2qRk15bi3jMqFa/Y6Ry4oS?=
 =?us-ascii?Q?g90dl1F2XfF0EJoBvco+UIlnyOKNH71/5i53x5CTRQq256/nXcBDB5rnvzJl?=
 =?us-ascii?Q?ENh/N2n1YhWUBinrHZ2u3JhgEOFKDrhbaAZCbucw9fEPjbLKBSWchvHqtthm?=
 =?us-ascii?Q?MOGP9SuaQLga0KSJa1o0nVAppV9/KYHTlTpeS6d7ZHdsR1TgyBOy3nFNjHLN?=
 =?us-ascii?Q?7EJL3bwJlzXDZp60CkSGxGpAKTF4GQ4U5j/EZBNWGjGtbd79NX/ln6hDLsQV?=
 =?us-ascii?Q?QLl+i6RMpVtd/O0sPAZUStXV8FHih5cCb/Kbkggw6mSLii88zgCupxIyboQB?=
 =?us-ascii?Q?p1xpYXuOL1AepPxiV0ZfGTvHwMmIGYrf1DH2L8JOfsa4RFfWXyU1eg8gKdPY?=
 =?us-ascii?Q?xVFgBL/ixcrfAV9Iib3Xs6RBPGGx4+5C0P0iVAe8sTwwZq2I3eXBSfzLf/XI?=
 =?us-ascii?Q?uZ8mjNgXM0h2cHwjUqoyw1M2As1TGJcGMhCNh/dBveNYkSSREhrka3Rk4ID/?=
 =?us-ascii?Q?vzU+F45zQZMbXw40wd5/nvyuz2ATl0GrU5lbvcbs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae178e33-cae4-4d7b-9f94-08db4a6e511a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:07.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgDdNzsLoHJZWrpwWImFQKNrZnH0V4mZYuzt5LrnDlG+svhxTPclc9q8jNUBILRR
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

All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
dma-iommu.c.

tegra is blocking dma-iommu usage, and also default_domain's, because it
wants an identity translation. This is needed for some device quirk. The
correct way to do this is to support IDENTITY domains and use
ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
devices.

Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
everything so no behavior changes.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 153ea0b5de8db4..7c301a732db2c0 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -276,7 +276,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
@@ -979,6 +979,12 @@ static int tegra_smmu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops tegra_smmu_ops = {
+	/*
+	 * FIXME: For now we want to run all translation in IDENTITY mode,
+	 * better would be to have a def_domain_type op do this for just the
+	 * quirky device.
+	 */
+	.default_domain = &tegra_smmu_identity_domain,
 	.identity_domain = &tegra_smmu_identity_domain,
 	.domain_alloc = tegra_smmu_domain_alloc,
 	.probe_device = tegra_smmu_probe_device,
-- 
2.40.0

