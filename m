Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 950B872A3A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 21:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbjFIT4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 15:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjFIT4a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 15:56:30 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D7E2712;
        Fri,  9 Jun 2023 12:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOnhTtxEAuCxwEqS6k7DBJX1iapO8SlnvYVOBBeESuJuNJ6GPDpLRHPek86UwO9IGtofwBG+ceqcSPTE3r/VfWBu9o+PdC9OioWI3lLi6+PFT+h285svegx4xFZqDjKZGODxMNo8gwvPcDHaFLQuZT4nVGoG7sstRpivIzENv8+mg3TQk32K1YQfLcaPii5YRKcOiHNvVCNJNi65sze+I0fqX3w1EsRXqcLhfR6ZdgFCZp7dNJ0VWSdTqV44LriQCH5BqNjfFhvXmRWtzlvdxxWIoGqffwGeSiIQr6xT+s/7tgAneiRzQnxSVmQZ2SayVnsPXFbPBEe7P+qffMIblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGJ9OhSGaMcQ94+sOuAW3uy5BsT4kqLXHivmJ7O0hfg=;
 b=a90kqcJzFn+7BVMdm4uNnRnsbqmnV1kIc3/OWiOlwjhtj9pFv8BQS+yx1dZx8ZCJ1UDS8BI2Vu9WO5090C3jb2hf4oq21yFpfOHjxy6iU0ysWf5Lluh7SwcOcTnQlL3rO7yI1uC7rXP8qt76h+pwKSthooVGVPGBtafDofWNHxh8IYwxiEm2mbO5F9cDGC+lpmq3WUinoCnvDJ0rIgXGwctvuT0cV6fyJBSJVIBQOCfAGh6tG+4nG520gbQ0S5hIWUZzGsicgYqM1u0logL5+t/I1F1DSRckOUDJ12zrMfmBiJhpix96rACVampL/FCN+dK0l+tJVapsvgyXbtipTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGJ9OhSGaMcQ94+sOuAW3uy5BsT4kqLXHivmJ7O0hfg=;
 b=H5MZ/DH99wtB63f6VpL5TNQ939m91cqiVQmV+l2Bbh7Ozf+3mzkv01lRmQF9urJ8dFoSgCW/fXqtMz99CfOE1Q4PskxNIfAREsbTPoWYb6jFpRzKysIAjSwNB12f2yicQgNLcvpDrdEP4oKYqMz6/OMh2Ewf0MP5rbkZKcg9w2KZFggwNzGvEZw0vWvYyF55ZWZFk7Jeyv51JQE4mxkA3fa3OZo0skY2eNMIAiR2+B/Ill02WrB+H8YPssFQGWKSWCNInXqzhkMhf2dzcN4+gc9NVeA663n8++G0Cu8on0UqIoML6Am0m9A4OwrH88IVA9qrfzMGrru9bsr21k8NQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 19:56:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:23 +0000
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
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v3 22/25] iommu: Add __iommu_group_domain_alloc()
Date:   Fri,  9 Jun 2023 16:56:10 -0300
Message-Id: <22-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 734d4e13-e7a6-4fb9-b889-08db69239822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSfQCN+b2Eg6/8blE5BNCi26rWCJjt9XbzVNslg6D5Chv52hstBD2G/+u/PVV4uefD0PsV95NoXYnaLiSV2YhaioNLsL3zhXvJ1bMTc9ZA6mSfVZdwnMVUIuHN2jfHyDu9hiVYIgM/T1cfZJ0rAy5+2Fz6KYrds0CmFMS7eZkoc6h8aBxx/k/bZRWeOK/umlBrDYJxAvdJIXHrT4tn6rb4/pHaj+/qdxFhyQ8iLMHwHUulp2BSsdmG9OfiTmJpdsvkEh4LhfJMNpq9C+RiNGCVGG+vw+bu1t3iwif6/UIg90PJKrqqRW4nIKHnjRvvcjauACODw20GRtd34TU4EGIMO261Z8z9gA5aAsEOV5y38zGUqzrRwwjZ5nT+vOO5Dsb7rgRBxO/v9Ae0jUZudj6ZlbzwaspirGEvuz4zTHg+jOSqpBruskANpb6vrO3QUoaZJyi7OcU57rgV4+lofgxgAVsxDkBKayDgGL+23dQJyTVd+aVQXbgss0Jad1mv43hgnZ3/PS4SyGANOp7edA67GOqwX/93ZU1gIG/fFhgKhLiovoG/Un57rACdJkE0kp4GnCCDhjSLe3ojCihoH4Owji36x5T+2rDcHtVcQfVv0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(7416002)(7406005)(110136005)(478600001)(8676002)(8936002)(4326008)(86362001)(66476007)(66946007)(921005)(66556008)(5660300002)(38100700002)(41300700001)(316002)(6666004)(6486002)(36756003)(2906002)(54906003)(6512007)(107886003)(186003)(26005)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kx+O+xWbX2cwAoewmtnj7CH4u7E8rTfpihPfpu0M72g2p2y9G5D7ZF6LowGe?=
 =?us-ascii?Q?uMHcmO9VuTsdQNDWyAtPqLbqcUOS/MLHQOW53zsEYsq6ol2XLJigFtuJgItR?=
 =?us-ascii?Q?jfpufUGIa+hiczGilhAC0iC4pyyej4Nv284dBbQrpisNooqlvJHsKdAAHJis?=
 =?us-ascii?Q?OnRQjzK4AnpvlpvB0USm6pKwBTU4Zw9YzLhnlLrbOspjdqblGzTbmGxaEFNL?=
 =?us-ascii?Q?9IFJ8h5xiOV7xC7EUIzL3N8rrIct/eCGYIVOCfUlv/uvkTrWuju3Zy5bRymF?=
 =?us-ascii?Q?uKzRgygAlJug6itpzBCFMQuxxy4z2iPlIHaDbNMezGvI0YC0vjXJX1W2npuK?=
 =?us-ascii?Q?77v0PpcWlW0mMK/JjVVUimS1gEABF0iACTlfJ50FRgs+49Y8rAgWaXuHwkbA?=
 =?us-ascii?Q?s0VTajj5J2laG32tWSuca4DQTLXrtyBz1pPowE5ZwEFHhQf0McgUWa5ITIch?=
 =?us-ascii?Q?pMi7+OXNtpy9ZwFz1mZHST+1vrY9vhSlNwnHM3OMnd7svVH4DuTa2xilpXr2?=
 =?us-ascii?Q?p2qeIfyqXp1tfawWls4bDnWyZXCeoncxkSkEKyFaqEGI7UgVq39/mAoyoCHn?=
 =?us-ascii?Q?8GwUS5ajVGFHWZ2mNBFxD1lF/9/JHvvxF8L2O4HmCx5CUZ7J6dogd2SjJlRq?=
 =?us-ascii?Q?GHjUE4xIh5tvRSMYTfXTinreZ6PwnDd1Yo0PPBegEz2jIPknpwnQ95E3qjDa?=
 =?us-ascii?Q?+YDJGbPmLrdwR9BKL1ayb56a+NAzc6YJsYungnooOZWfnX3nUZRCDBOM1fgv?=
 =?us-ascii?Q?RmFbJAcnooTMc6NZkf6zXG9/NqqMTH3bxielW+NdRMWDBtckNnnI0sXyseXJ?=
 =?us-ascii?Q?SN+V+hrEjVW8uDQdC6ameqREsFE8uTVt4bXNTxnuvVbYrJe6GP1RX5bNZRaD?=
 =?us-ascii?Q?yvp3BY/OWH7MwTtuab2gjvMN49TcHog9MylHPRyI34nhB8M12q/YBsZub49P?=
 =?us-ascii?Q?QHOLHBEoZPHMqw0YgEajB8Pfm8vQ5UkQ256qvM0y4i+nLFB/ElH3gHZDqCiF?=
 =?us-ascii?Q?jtCdXrW19rFml+u2Trmu23tTr8WBltfoHqv127JMSlxGx1cGAHmS8b0amTWs?=
 =?us-ascii?Q?8S49OFB4uuxkzuOqwgItU9+Z+Vx2LtipFxPf8tS7+/Unr0UVKDbVI5QIDNPD?=
 =?us-ascii?Q?lwKYJPkGymhhVR48OFRntvI7Olk6VAjBx/eKTPEjkxsV6ktk7rV6YtlsSCIN?=
 =?us-ascii?Q?Yys9chHcZ8f4ZYelq3pGqtUg5M2ugmsNIVv8M8inimRJOhVnVdpozlfBI4Qx?=
 =?us-ascii?Q?oVFC1V6fTCVbgw733TLUH90/X76PWXL8Hyt2Pm5nRlMsYJ1FnZNxM7TSjUjs?=
 =?us-ascii?Q?PaZjONDViKUD9zmIizsVJoRQVsodTnt4YLT08aZSPfoQyybTxyrqJPls8F15?=
 =?us-ascii?Q?SBIc0T+qbJ0XU1h35uD+cX6etB3Zg1++uXJiO1PS5SSLqIaF0dggYoTx5yBU?=
 =?us-ascii?Q?uTI4CSHkdM6pYArBpRmpcrutCLDilQz2ciqcw8yNTC0h/ds5hXVNQhAQZ3rb?=
 =?us-ascii?Q?lj/fGJDSiTkYn7FLRnJ3/cjIUSMj9jt0xQVlNcK3Q7KFfk1FuvOcM8f2b1bC?=
 =?us-ascii?Q?l3639Ah8yw4QiZFyurYPvxVQlIXK12mNr58PMQBH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734d4e13-e7a6-4fb9-b889-08db69239822
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:20.3358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nvxerb/L4NE/LF3IV8e9V+10GXFbDtm4hqQ60ucrK1dYki+HIkzhpQ4ifkI8b3I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785
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

Allocate a domain from a group. Automatically obtains the iommu_ops to use
from the device list of the group. Convert the internal callers to use it.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 66 ++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 98b855487cf03c..0346c05e108438 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -94,8 +94,8 @@ static const char * const iommu_group_resv_type_string[] = {
 static int iommu_bus_notifier(struct notifier_block *nb,
 			      unsigned long action, void *data);
 static void iommu_release_device(struct device *dev);
-static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
-						 unsigned type);
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type);
 static int __iommu_attach_device(struct iommu_domain *domain,
 				 struct device *dev);
 static int __iommu_attach_group(struct iommu_domain *domain,
@@ -1652,12 +1652,11 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
 static struct iommu_domain *
-__iommu_group_alloc_default_domain(const struct bus_type *bus,
-				   struct iommu_group *group, int req_type)
+__iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
 	if (group->default_domain && group->default_domain->type == req_type)
 		return group->default_domain;
-	return __iommu_domain_alloc(bus, req_type);
+	return __iommu_group_domain_alloc(group, req_type);
 }
 
 /*
@@ -1667,9 +1666,10 @@ __iommu_group_alloc_default_domain(const struct bus_type *bus,
 static struct iommu_domain *
 iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
-	const struct bus_type *bus =
+	struct device *dev =
 		list_first_entry(&group->devices, struct group_device, list)
-			->dev->bus;
+			->dev;
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
 	struct iommu_domain *dom;
 
 	lockdep_assert_held(&group->mutex);
@@ -1679,24 +1679,24 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
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
+		return __iommu_group_alloc_default_domain(group, req_type);
 
 	/* The driver gave no guidance on what type to use, try the default */
-	dom = __iommu_group_alloc_default_domain(bus, group, iommu_def_domain_type);
+	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
 	if (dom)
 		return dom;
 
 	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
 	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
 		return NULL;
-	dom = __iommu_group_alloc_default_domain(bus, group, IOMMU_DOMAIN_DMA);
+	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
 	if (!dom)
 		return NULL;
 
@@ -1984,19 +1984,16 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
-static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
-						 unsigned type)
+static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 unsigned int type)
 {
 	struct iommu_domain *domain;
 	unsigned int alloc_type = type & IOMMU_DOMAIN_ALLOC_FLAGS;
 
-	if (bus == NULL || bus->iommu_ops == NULL)
-		return NULL;
+	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
+		return ops->identity_domain;
 
-	if (alloc_type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
-		return bus->iommu_ops->identity_domain;
-
-	domain = bus->iommu_ops->domain_alloc(alloc_type);
+	domain = ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
 
@@ -2006,10 +2003,10 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	 * may override this later
 	 */
 	if (!domain->pgsize_bitmap)
-		domain->pgsize_bitmap = bus->iommu_ops->pgsize_bitmap;
+		domain->pgsize_bitmap = ops->pgsize_bitmap;
 
 	if (!domain->ops)
-		domain->ops = bus->iommu_ops->default_domain_ops;
+		domain->ops = ops->default_domain_ops;
 
 	if (iommu_is_dma_domain(domain) && iommu_get_dma_cookie(domain)) {
 		iommu_domain_free(domain);
@@ -2018,9 +2015,23 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	return domain;
 }
 
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
+{
+	struct device *dev =
+		list_first_entry(&group->devices, struct group_device, list)
+			->dev;
+
+	lockdep_assert_held(&group->mutex);
+
+	return __iommu_domain_alloc(dev_iommu_ops(dev), type);
+}
+
 struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 {
-	return __iommu_domain_alloc(bus, IOMMU_DOMAIN_UNMANAGED);
+	if (bus == NULL || bus->iommu_ops == NULL)
+		return NULL;
+	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
@@ -3129,21 +3140,18 @@ void iommu_device_unuse_default_domain(struct device *dev)
 
 static int __iommu_group_alloc_blocking_domain(struct iommu_group *group)
 {
-	struct group_device *dev =
-		list_first_entry(&group->devices, struct group_device, list);
-
 	if (group->blocking_domain)
 		return 0;
 
 	group->blocking_domain =
-		__iommu_domain_alloc(dev->dev->bus, IOMMU_DOMAIN_BLOCKED);
+		__iommu_group_domain_alloc(group, IOMMU_DOMAIN_BLOCKED);
 	if (!group->blocking_domain) {
 		/*
 		 * For drivers that do not yet understand IOMMU_DOMAIN_BLOCKED
 		 * create an empty domain instead.
 		 */
-		group->blocking_domain = __iommu_domain_alloc(
-			dev->dev->bus, IOMMU_DOMAIN_UNMANAGED);
+		group->blocking_domain = __iommu_group_domain_alloc(
+			group, IOMMU_DOMAIN_UNMANAGED);
 		if (!group->blocking_domain)
 			return -EINVAL;
 	}
-- 
2.40.1

