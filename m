Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA986F3594
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjEASD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbjEASDW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:22 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A18E1701;
        Mon,  1 May 2023 11:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gU+TGNHdgDwawFqgqD6pP+Twqzk5+LENJi89ZT3ePV4HAnIyO8QfBsmekhIwSETi2MTlNt3ZSulFMx5soHgXvxSSGLGD1GRH9R+KffZb+G9H2sbdnSPzvE3RQyzoVrd+2DOfx6GCp0+iwjTmSBcb/QMg4tFNd4K5g5/Cd0B5SpMXtE+gP029eYHCy6Js8gN5SyUMV7AZB9wGJbxexxCb7jhcSrkefRMhisJfRTw2j/VkXO21pyVaeVoJyRPUkkG+GvqaSss39DaKy7rHziNcDZWhDpjAq7Qia6Pc9kFEM+cGqlOkw8nLP58nwWTFIpkT2kBIGSqpiZZOHVSXrQb2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMtGUXbdniGlFWaL3rG+Gn/qLAphJUPzpTAsqxjU61Y=;
 b=m85y/AjGJDdtcESgLlM3FATD87gBAvdGqr1oCIW70ENDK0Im1yMfFrXfSw9NdnU6A2g5KdPOQn5ygmbboGy5aBc84vOCu+iP3mWseb7NFFx+TptRwZk40pZ+xCxHGP59+7u55KVwpCwm9ZJaVytygA2qm3GHv1tXhZm87XvAMfVvbXq1RPfYpIRBR1OXmZZFPNOZoM+T1W5JGqbXH3InHhALIT0eTbOQBGKmUI9PfjfvvJ47L/dlJvTS+UOUXu7Ftz50noAS0Al7Qx61sZJP0axXrx11+QEWYsg8Qp6HUorrs851ha9qxlgHMlDqTgBEfgqhnM9oPtHPjeFRaIFidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMtGUXbdniGlFWaL3rG+Gn/qLAphJUPzpTAsqxjU61Y=;
 b=JaSm7WeIoZVrtlY8sObwTr2YzFS/MROlYsFfIWQIC3QWL7rFPfqDposam9+I4MtfDypRu3A1/MgtBmt8y1F4TQf1yb9jvQPAZUuw2pC8r06R3QZtL+lsXsf5Jr/bOqO8MeqSYE32Fiiry1w/bX2SwcQqPXhDDftgAvuwJ8ChCpZF7usYUFhGO87wS88tWO017nws0mdkeexM61JHiACUHt98IffxfWWq8nVvkyGapEIzlxq6Vq+kErrTy9TPSm7dc1ulFcs/uWjT455zP+7VpvDKKrXu5IqPveAHbg/04ftEoNHzhxVXdqNyznnlUXqE4SALmetr9UA7NajaB9nQIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:13 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:13 +0000
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
Subject: [PATCH 18/20] iommu: Add ops->domain_alloc_paging()
Date:   Mon,  1 May 2023 15:03:02 -0300
Message-Id: <18-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:208:2d::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9fdfe8-e21b-4fcb-d55e-08db4a6e5153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1MpzYzXhzkc9O+5YNA+rfditOmfvvd7AzRjKN1OCuroyS99a97hOP7SH07ct2PmugRAc5KdLg4WAI1EjVIS753EMVGLne1wBO1tBOCpzakXfmnubposWhTUAlrleG5u/aUJFsxgT8tP74JsIjqqioiXU/93fkCj5QHha7M6lLhL5nfS98os55rb9veMlslktEuEXmByYgsH9H9mtVyAooyqjLvr8UON8po/UmGiM06JCRj8G3wRgwimCSGuSkMthcrL9snoClQrpg43b3uNitFSlcQrm3iQCruXQ23hyiBmAIvysH2Ylk5wyMa07M8lkQY06/OHY8OtTGunMC7KVEOXwZrKQZvjS9K0yQF1PPywzrqU2blD8mFCFY9zTTnDc+KnhAk/5/NGX5SFzkEw2heFJJHS2SIX9BYx/MzorXbfBC7UaZLnr6qZAhYtnyfXYe8/UH98XC9vXKr2+kquLv5Ke6Eku6Y0+Zwzo/K8jFr17SlNiAlAVfvhMLVAF00SZr6rBNA821aphQS3MaTjW5eX31ODrO6EFmecnNG8vrdw+eLSkqTiFvTWsA5Y/Qx4npFDW1KP72lN7Rq4DqChqdtqOLvG+Ceesqrkq8Zr03ss=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W5IAvcmsvBmw/Fwb2J3cS7TQl+ltLj4euE6kW/wgHqujCA9Zq4Ndpaae6zSx?=
 =?us-ascii?Q?O4Euohliu4lAvf9MV3/wDoOX920gdswJT1XHlDFvpvFYLX0QmRUSQyzse8ZB?=
 =?us-ascii?Q?V+flBmhuVdU3CSoYVgqptGz+07JEeKxNZX+GDbMjM4DRF8IaXpevPgvXyxd9?=
 =?us-ascii?Q?L5y6CXkMbSyKXwmRqx4H1cF6BxHgmOMxAOFe/sMZIovebGArBgUgWdq7SMM2?=
 =?us-ascii?Q?BetIhtq4paRLIjhbwTYXcu6FbQcnn9nYrmiHy/sDVQL5Q4Hl9p3zyBftyhTt?=
 =?us-ascii?Q?mPMSYr7kjrz98W682z3/PeDdGTGymfpcYDaul23C7WqI4WayxhOsXKSDn1Jc?=
 =?us-ascii?Q?psncN3xd+YWjGDWxAmS6Ic2MXA+bi4EVHbSuAofwjsoz7CapkhW/EI7ej6Ri?=
 =?us-ascii?Q?Z/SzI7xEKXGdlrjKW/OGHIk7ohwCXhuTwORWJglJEfczt9oQyPYgV2Gwie/X?=
 =?us-ascii?Q?UqfEKrx0iOYWTwAs+A7LeoygkhvsDfahVzt4nxjfsIAbBEwczJW2Yt00SlZ0?=
 =?us-ascii?Q?rcudsGj+4e7MtSOil8vdTM2QBlinTw5Nzbia2CYMeVqMpZhvNq+X8WLSH3Yu?=
 =?us-ascii?Q?g9YkrWfIZCwjXlz4CEVIaSprypoiC6U7qo9hd14v3vBSOKF1Kxu+oTaem9KA?=
 =?us-ascii?Q?U4brROiX9QRRLL/z8+BkbAxXaZgPCImTD3CZgILRDYkiYkXydVqAfDZ1NBFT?=
 =?us-ascii?Q?FPFSO8MsfDdMZjf6vTDGzaAXwwnjMxf4NB4fQcw2KFOYMjhTMSBbADCBiJvX?=
 =?us-ascii?Q?16zVb4KHsk7FTiCBvQ3l9YIivce3h1YtKNPuqArDHG/skMPLpHjQ5CalbI8C?=
 =?us-ascii?Q?7BEit/OFcqFcbt/Lecz2tAs6sISvOfMnpE2lpS0pfIA52k/tk88c1/RF/Lyg?=
 =?us-ascii?Q?t2pMrnSW5brGU8NMEC1UaoRX0QQ2cdnqMSIQ3aMe7IuuljCPClU8FWYJ2ulJ?=
 =?us-ascii?Q?3nMGYAKkZ/Lp+GFMKQLUWUlja4cfNCRnvRsPXH0NDaA4S2n98EJoKLRSCSEY?=
 =?us-ascii?Q?nC/f1mh5udlkt5ZUsJpdBk+ND8or2WFHv0g+o0+Az0cfURY/2DFJqu2aU2c4?=
 =?us-ascii?Q?/6XZ51Qh5ecKDSDKBAreInhj4c2fSdzpo6I6KbgY5rtgOqkADtsRbh12AuLO?=
 =?us-ascii?Q?G4mgWQb0a89A/z/o9S0O+PETj5tiNIEa7gaieazQACRxaQuW83p/rrfBkfgZ?=
 =?us-ascii?Q?/9fILydb9xKnu7Wu4h6AjVvX5FlLRD2jehUFqybMZpTZODBOTqNF75aRyEjn?=
 =?us-ascii?Q?3XNyVFmAmHrzZqeZP3bl7qnzkPTPKjcGsyAooja0vvv6WTQsxjP2wfXb6E+Y?=
 =?us-ascii?Q?5PbJtHBs1Xe0yyJ33UKTC993KfNoumVfH26EnQUY52byVz5GJYcPJDwJ+NL/?=
 =?us-ascii?Q?ypV9tXNHwq+AziAD5BO9YXK3MlKzsing9IEuY8Hu5d/hOSxhLmgEMKghG8Gh?=
 =?us-ascii?Q?3vppvOybSPe9AP6qOjAhPsdGBxlUnEo/tdC2/kwBSAdhs3NNjEhd7e9R8WxC?=
 =?us-ascii?Q?LXKqptDyqCYyz9o8WFcvuVLDXGL21L5Hp46QojaiS000Xd3B8UFoSR3e47WD?=
 =?us-ascii?Q?SQnpYMBIg6vpNZpaB0qXXqumOCw6tezD9vgu0mGN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9fdfe8-e21b-4fcb-d55e-08db4a6e5153
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:07.6373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUD30zSWo7dkimV2oIi3cXqGW+sZFtj2nVJbHgLrlbyCEDZR81orvfFtg7YjA0ki
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

This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
domain, so it saves a few lines in a lot of drivers needlessly checking
the type.

More critically, this allows us to sweep out all the
IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
drivers, simplifying what is going on in the code and ultimately removing
the now-unused special cases in drivers where they did not support
IOMMU_DOMAIN_DMA.

domain_alloc_paging() should return a struct iommu_domain that is
functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.

Be forwards looking and pass in a 'struct device *' argument. We can
provide this when allocating the default_domain. No drivers will look at
this.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 40 ++++++++++++++++++++++++----------------
 include/linux/iommu.h |  2 ++
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index f20a031e2910b2..fee417df8f195d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -93,6 +93,7 @@ static int iommu_bus_notifier(struct notifier_block *nb,
 			      unsigned long action, void *data);
 static void iommu_release_device(struct device *dev);
 static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
+						 struct device *dev,
 						 unsigned type);
 static int __iommu_attach_device(struct iommu_domain *domain,
 				 struct device *dev);
@@ -1618,12 +1619,12 @@ static int iommu_get_def_domain_type(struct device *dev)
 }
 
 static struct iommu_domain *
-__iommu_group_alloc_default_domain(struct bus_type *bus,
+__iommu_group_alloc_default_domain(struct group_device *gdev,
 				   struct iommu_group *group, int req_type)
 {
 	if (group->default_domain && group->default_domain->type == req_type)
 		return group->default_domain;
-	return __iommu_domain_alloc(bus, req_type);
+	return __iommu_domain_alloc(gdev->dev->bus, gdev->dev, req_type);
 }
 
 /*
@@ -1633,9 +1634,9 @@ __iommu_group_alloc_default_domain(struct bus_type *bus,
 static struct iommu_domain *
 iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
-	struct bus_type *bus =
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev->bus;
+	struct group_device *gdev =
+		list_first_entry(&group->devices, struct group_device, list);
+	const struct iommu_ops *ops = dev_iommu_ops(gdev->dev);
 	struct iommu_domain *dom;
 
 	lockdep_assert_held(&group->mutex);
@@ -1645,14 +1646,15 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 	 * domain. This should always be either an IDENTITY or PLATFORM domain.
 	 * Do not use in new drivers.
 	 */
-	if (bus->iommu_ops->default_domain) {
+	if (ops->default_domain) {
 		if (req_type)
 			return ERR_PTR(-EINVAL);
-		return bus->iommu_ops->default_domain;
+		return ops->default_domain;
 	}
 
 	if (req_type)
-		return __iommu_group_alloc_default_domain(bus, group, req_type);
+		return __iommu_group_alloc_default_domain(gdev, group,
+							  req_type);
 
 	/*
 	 * If ARM32 CONFIG_ARM_DMA_USE_IOMMU is enabled and the driver doesn't
@@ -1665,18 +1667,19 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 				IS_ENABLED(CONFIG_IOMMU_DMA)));
 
 		return __iommu_group_alloc_default_domain(
-			bus, group, IOMMU_DOMAIN_IDENTITY);
+			gdev, group, IOMMU_DOMAIN_IDENTITY);
 	}
 
 	/* The driver gave no guidance on what type to use, try the default */
-	dom = __iommu_group_alloc_default_domain(bus, group, iommu_def_domain_type);
+	dom = __iommu_group_alloc_default_domain(gdev, group,
+						 iommu_def_domain_type);
 	if (dom)
 		return dom;
 
 	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
 	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
 		return NULL;
-	dom = __iommu_group_alloc_default_domain(bus, group, IOMMU_DOMAIN_DMA);
+	dom = __iommu_group_alloc_default_domain(gdev, group, IOMMU_DOMAIN_DMA);
 	if (!dom)
 		return NULL;
 
@@ -1930,6 +1933,7 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
 static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
+						 struct device *dev,
 						 unsigned type)
 {
 	struct iommu_domain *domain;
@@ -1940,7 +1944,11 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
 	if (type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
 		return bus->iommu_ops->identity_domain;
 
-	domain = bus->iommu_ops->domain_alloc(type);
+	if ((type == IOMMU_DOMAIN_UNMANAGED || type == IOMMU_DOMAIN_DMA) &&
+	    bus->iommu_ops->domain_alloc_paging)
+		domain = bus->iommu_ops->domain_alloc_paging(dev);
+	else
+		domain = bus->iommu_ops->domain_alloc(type);
 	if (!domain)
 		return NULL;
 
@@ -1964,7 +1972,7 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
 
 struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
 {
-	return __iommu_domain_alloc(bus, IOMMU_DOMAIN_UNMANAGED);
+	return __iommu_domain_alloc(bus, NULL, IOMMU_DOMAIN_UNMANAGED);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
@@ -3079,15 +3087,15 @@ static int __iommu_group_alloc_blocking_domain(struct iommu_group *group)
 	if (group->blocking_domain)
 		return 0;
 
-	group->blocking_domain =
-		__iommu_domain_alloc(dev->dev->bus, IOMMU_DOMAIN_BLOCKED);
+	group->blocking_domain = __iommu_domain_alloc(dev->dev->bus, dev->dev,
+						      IOMMU_DOMAIN_BLOCKED);
 	if (!group->blocking_domain) {
 		/*
 		 * For drivers that do not yet understand IOMMU_DOMAIN_BLOCKED
 		 * create an empty domain instead.
 		 */
 		group->blocking_domain = __iommu_domain_alloc(
-			dev->dev->bus, IOMMU_DOMAIN_UNMANAGED);
+			dev->dev->bus, dev->dev, IOMMU_DOMAIN_UNMANAGED);
 		if (!group->blocking_domain)
 			return -EINVAL;
 	}
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index f6a28ab78e607e..cc9aff2d213eec 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -227,6 +227,7 @@ struct iommu_iotlb_gather {
  * struct iommu_ops - iommu ops and capabilities
  * @capable: check capability
  * @domain_alloc: allocate iommu domain
+ * @domain_alloc_paging: Allocate an IOMMU_DOMAIN_UNMANAGED
  * @probe_device: Add device to iommu driver handling
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
@@ -258,6 +259,7 @@ struct iommu_ops {
 
 	/* Domain allocation and freeing by the iommu driver */
 	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
+	struct iommu_domain *(*domain_alloc_paging)(struct device *dev);
 
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
-- 
2.40.0

