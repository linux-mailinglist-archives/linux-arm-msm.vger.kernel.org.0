Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E266F3555
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbjEASDM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjEASDK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:10 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912B31986;
        Mon,  1 May 2023 11:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+QYeZ/TzrG8aiuGz+aPXMxbw1gFBp4Eil7+6GgruLu4yKORXHkM50GJOBdUuwLAU8oxwBoav30HvuWnbQ10JEleKq/9mSY7bVB9I6+VoitdYSmGKfxdq4kfP5MQZkIueRFBWAgN+3fAFfHdUxQ+K0jgTRZ9l+b10TciRhhNP54RB38CEIosnzG1hixJ1fZR6V4idP/Diwxl6XafCa4QJDiEfPVJsvE4w0rUuRPqEuXJ5OFuwEVtTeEd8iWjfeZIW+mhUwA4YLhOLbHtU3ry62xpPXJmXLwkBIepaFoK+7dNbauopeqPCr8NcVhHq5ESIlPQM8XIIDfwrDif4ivRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xknJqFhASn/4agduoYXueJ6BdwXbF1MQIUJUFXVhUH8=;
 b=KKCSXUCVdDlkkASDrivuuqwTBuGYGuzG3p7E9kg/CfFx3nOVBOs00sQ69teB9HTVLTMzTc9CtM1uC3vMt0qzkMpq/6j38nl4kKG3DSpWD5mFq3fFtZx3bbGTKejmSm9+tFJN0sBVYNddLnwg9lAk0JYHjwK1605SItRZ67dr0DJKpaImNAC36CvLHMaaZTAj5a5B9QB/PyK6OPfaOPujHuHBoVAkhUJuOQSZjWq9P2FO48rddx0Cx2vWdLWTyxQSZYwEjCQo/F5NxivuOQnTcC8PvWpJheB06P68XrWa+TySn/kVsRlUsOsdjU0GAQA1D0PzU9aRa1Dc/HwdqCwGNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xknJqFhASn/4agduoYXueJ6BdwXbF1MQIUJUFXVhUH8=;
 b=PZaznm/qMXJuqJpQgfX3ApgXARarFhgxD/FD2FO2xzKy8jcJqrnaWK3OpMMJSbOaPOvofqwaZ0UZfBMzvCI33CxMybwdbD8y/3VNhoq8h2Bm1ES0dtyGoa/9On7OgkxfcpujDMtd1n/oMMhFRz6S4iWxYSvTuaquiZdR1RCwlq2aXuLBavpAxORU29SMi4L2CFU2SsWZ2Uj67W7BL2ELg0slcHGzcDmGQB9YpuzPKpj6aswNPMYmi7Xj7b9ysjCoO5cY54YkgKGnTSHpolFdjkDJs8Q96+TkJeHHz1kAX0NHpAM/4IRZJI8suY3R7H+BpHOkznXCI2FSQAVQ16FBtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:06 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:06 +0000
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
Subject: [PATCH 07/20] iommu/tegra-smmu: Implement an IDENTITY domain
Date:   Mon,  1 May 2023 15:02:51 -0300
Message-Id: <7-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0014.namprd18.prod.outlook.com
 (2603:10b6:208:23c::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a95472-c511-40b8-c911-08db4a6e5035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rbeZdLbPfLqyIV2E6L3iTjE/zdIrAoPWJPN8sq/vKDaT0t15WSYrIzPxgUBfYq7DzNHpbK0NKIepNbqQcvkJZOUdrBNJA3XV3oKKrWjYuEY/FPvk2jRKbC3ztUmvyQIDTl8R22foJieNjcX3yGgwzvsPqBZyKnJMpv7jPI5d41fFH0fQV2K3eMYQvmdGeOxzCz+zAM9GvJ9kesOFC/1aSz9TLiod6EF/lFpP/CizxamuA2suWjEyAT//D5GCDETdQjiUS5u1z9uN2TV05tQbwZvKu/KF3w6UCWZG2izRyKR3cPrIAAo5p+wj2lKbuhU5xXTzr7eB9A0T8bsvqF83jTlHmktbJqrhBdB31eBcvmlY/AWi49rkTWGcLJFTYcpQmR2gZKx2vSJEZuAsr7XumNU22NhjllrnaPWFDr+AjuqznZ7lxiKSNumLmqTRpTRrdX9iaVIhgkQRIoRyx+5aLh0M+3pvAj7IUPBYFMylJuwNMOhUmNM1xSNVBh6X63gFxKbYdly2E/lyOv8XS00AUAGQDtKM6hoCEpCKHKoZc8i9PS/f1eC18aIqzDJKRoe1I7+ZJnnPH7xIKuu1sL+6uw1sED03H6riOr3WmCnmXKk6ZP9TWP1HD/kbeDLmXpJ0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AD3aoS0JNdc0owfrl6ClZh+3NiSP4vTJbYQqj/mfEmBfMox9OtNd+RZVCmN2?=
 =?us-ascii?Q?GehGbqBRt/CbqUwtoV3jDQ4bF+0+MdIQ6Leyj64U6FUL+l+DWD7tdfSwm35E?=
 =?us-ascii?Q?o20SGQ1QpNxHJYuG+7UIeazivRb9/DWWUzcVcOEQJ8b7J6Gs7BRjrU7uj68o?=
 =?us-ascii?Q?0cuel1F3uSO+mirMdIdEmv7EyVFgKXxuUASpke/W6itUuavYy6HfxCoZ4lr3?=
 =?us-ascii?Q?Wq9QwIbPIJgh0GUO9SuUZvrJhHnWCAdMFKTBCNNpLktibebdFJLsc1CCXBpi?=
 =?us-ascii?Q?Z+4AKrwjyzHUZ3HcCNDAWMxg5QU2CRh7mq1DE2BqmFUybNldbhYulr8Pvs7g?=
 =?us-ascii?Q?Pd4wb05xa2J5gBrZwZOBSSH6KKZ4pSCPw0gJx4RrmV9KunEwktuY4BHiyE96?=
 =?us-ascii?Q?dr1hf/s7GuE/gM729ywVn4JT+p5xQTQOte+M0oakqLY/tT8ndmG8K8+6ZmAs?=
 =?us-ascii?Q?91gGLsM9pPyW3t4CTZcXAFgT3stGyuH7jvAMQlfuGkyC6yao81LzcJgjpQu+?=
 =?us-ascii?Q?RLsPPvE8IsZFKoeaPvJmmz8YHN3rSIn9YYb7w63t39SiZRPVBUf5HH7msLmC?=
 =?us-ascii?Q?nX1yimaHfzYga6wPGNRH3MKiThc3lbBLo4pD3IgdEXxzS1f6Z17KC5xy98uf?=
 =?us-ascii?Q?7rccC42flHKNEVreZ7aS8qO6e4ksXl6PUVcTMJDj3pOoEPR5QQkqcw4ndj9q?=
 =?us-ascii?Q?fDldJXlUPwqH+dzakw2xM/CQIpWXHWLUlMB0ytFdTm5vLnVaWwIdbOddbvaY?=
 =?us-ascii?Q?zlwq67sqhJ4HGZmdB4ktjgWST2xqIefZt4Cf//ahi2V43H2fhmBXHnIYL6s2?=
 =?us-ascii?Q?Mg7l5ykWQ+s5eqYJ1UQJH23QLfsDBjkfVVGcGpYYzYawamBVmgs8lJpvxNIE?=
 =?us-ascii?Q?MIx4FpJlBdreQXDbMtfCW8BeHerHcnYibqIpb5xPCuq0XSGehLaPzaRQF/53?=
 =?us-ascii?Q?dkag7kVKUGi+0CDi7WZ/vLIL6UCEAPrT2chNofPebucKJ2v+xd9fBuDVoAc5?=
 =?us-ascii?Q?GQzd+NcIeIktrjLhsutDr+IJRn0RhvXrMzqKjaD/JhRRPBIWpSD+uX3mFwsX?=
 =?us-ascii?Q?mw2UpOSarf71l+7A6Zpfl8NUE5fJ3qP3fAmnSgfQpktB2IPDNf/Hlf+pBV9N?=
 =?us-ascii?Q?31HxbvK/F7EJmzUhmF1niQKhP4fjWFzhbQHDhrgYIVqdea42Js8EF+niNzhm?=
 =?us-ascii?Q?/tGp0LZdiVfYxsRP4Tu+0CU6B8UimBUfYlN6pkjE1k7LI8Uk9OrSJTE2cMbA?=
 =?us-ascii?Q?RCqVBggLHQOk4Ph7ZjeSYWzAC1+/zlq3QI6Mb/BK59pMbb7ZZ3VjzrEapqCt?=
 =?us-ascii?Q?Ld3Q3bSwBv08lNra7G75NE2Bih993THY1mXwg8GPwCFg5RAu0lCP+e4brO3g?=
 =?us-ascii?Q?YONL98WY91fHJloJO95gVLV52wse2m2pmOmDfQICaPoI5zG8K33SZHlfaoQf?=
 =?us-ascii?Q?GOqrCEBXBfg8VeZHCC53xE6mIytxJYgUXRNGOQ9+tR4zdAGDlDNg5DXERHQr?=
 =?us-ascii?Q?LIqkNomaU7XDN8FIdnkenctwIeCSvuKJZXYtWI9K76zK6ibcSQ/OBfSrhRkp?=
 =?us-ascii?Q?Lu8n8mcdUCaXvss1fvpzoBwx/uFGqgbjRGC5IlKJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a95472-c511-40b8-c911-08db4a6e5035
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:05.7623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D73iNRCgZHLfufA6CWjU3R3w34/+U7G6PDS/JTyXOJ36b9dK/77NiFQaUwEm59QX
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

What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
putting the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 1cbf063ccf147a..153ea0b5de8db4 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -511,23 +511,39 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 	return err;
 }
 
-static void tegra_smmu_set_platform_dma(struct device *dev)
+static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct tegra_smmu *smmu = as->smmu;
+	struct tegra_smmu_as *as;
+	struct tegra_smmu *smmu;
 	unsigned int index;
 
 	if (!fwspec)
-		return;
+		return -ENODEV;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	as = to_smmu_as(domain);
+	smmu = as->smmu;
 	for (index = 0; index < fwspec->num_ids; index++) {
 		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
 		tegra_smmu_as_unprepare(smmu, as);
 	}
+	return 0;
 }
 
+static struct iommu_domain_ops tegra_smmu_identity_ops = {
+	.attach_dev = tegra_smmu_identity_attach,
+};
+
+static struct iommu_domain tegra_smmu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &tegra_smmu_identity_ops,
+};
+
 static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
 			       u32 value)
 {
@@ -963,10 +979,10 @@ static int tegra_smmu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops tegra_smmu_ops = {
+	.identity_domain = &tegra_smmu_identity_domain,
 	.domain_alloc = tegra_smmu_domain_alloc,
 	.probe_device = tegra_smmu_probe_device,
 	.device_group = tegra_smmu_device_group,
-	.set_platform_dma_ops = tegra_smmu_set_platform_dma,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.0

