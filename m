Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 960466F355A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbjEASDN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbjEASDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:11 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C547E10F9;
        Mon,  1 May 2023 11:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWssRnu1TU8tfX0199fqBA76Xh1e87XRUKTd9gCKayNo2wNoD/rFjvcOZdcPV/u22ekDnn24qiuoFdmlXljKL+Sbh0sQqloyeXXeC5ioDaAYy/axH6MVc8qrPPu/9jg3p0B1YTBXbQa1sfamrrZVbToJuCvDIFsszuEbM3ndsMiiw5wtjnTGbAjCfBtpom/iCFnoL2aeRE4YGVEjDrcjFdXyRnI9xUvTXh9WInbRJlO0c7L3Bw3R9WmUATgsBnr6ewG6ymy8jN9ewwwT5vCbd8KOncRqsWW04kgWK1lc6cneAxz75bj+fHQaH/vERAHJuX4pqwNWFkrNoo68TBWz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rf2m0x6Ibt6XE316T3F0K51lW3tr1mlcQDiqdHw0C3U=;
 b=AQCURSqfAFRAWVx//KGwD8dliQBDSzjWVhfQ3rHSfAGj4Uxe9gIQ/ykZJB4ycm3ChuBMQYUQIuC1jzWzYAbSpKc6bLqjaFtHerNHZAY5bGfPt/y+++d/PgJxn9o3t/6vDBJL5WzUQ6f45nAh9p2gDXryKimFJS18BALpBO3W6n92MevKcBC42BBQbs3VPJ44ErxB4fJKGpURQbHo2y6tNb5GZhWVXVR5a/5jWH54hvy4HSOOYM7CWvvU4eju09e6yV5+nc2y1xqQ1JT9WtDF0KGkZ3LhiK9E6e6QO7njrpEHLJ0+kwTocATJRrGjjCdEw8FQSVjxoSYSnb/MJ+Jziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rf2m0x6Ibt6XE316T3F0K51lW3tr1mlcQDiqdHw0C3U=;
 b=kEdDMRh4I53blVvcwP5Ahcl4t4IsaZ2QirDis4w3bfCLI53YBCFLOSG3tVM93JJflrTrkpe2MiQtGWtRQnExWVWM9tahIt3+BV6CWfQCrmjP3QA6b/453GX6QirkIK7ulYbxDsZGKNmepn9w5zCVHN+O8HnhFC4lzzjzABwvA4LBXJ/6f0S5fBMT126Cvy9h6nR9iE+IuXqkN/2AhFk9bLqGxNm42Ui479MyUCKb51NckiC0VnitREPZzTYXz39Mpg221aFhmmTDgjW0RLYYeM/8/IRzDBwJWyMv6xjBDG7niG208JtRtcJ0XcBEAWety4mtcPlphFtr2vUlHXQvhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:07 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:07 +0000
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
Subject: [PATCH 15/20] iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date:   Mon,  1 May 2023 15:02:59 -0300
Message-Id: <15-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:208:2d::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5008b8-a671-4229-4f06-08db4a6e505e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HvnS46p84Zu+Zup8gC30ufRG7HHAtOwEPAUgyLMf/Az5qgaW1HLC9OFntXmTc8gB2gMdpSDeOZEi77Yg+/MONKfankAsEaDmC8f0dIalMs79hV678gF4B1SJTfI7nNLS2opeuhWlo9vLqg7ohWGpTC0eGfCBQRCQU68fSdMG5vxuuTaPobsVUQIAkjNJW2xVh5WUwB7kx6IOGcBLjlNLMrZ/rP7waKJ9lzZsd2WgtBy7THe+h33p1FAqFdB4IdX8nD+iea2/w7TXmI73j+5MeJ13+/X47TZTaCliZe993JSIdk7Bl7ciSuziMfElh6m0UyJxaD5MqL5A4m4A0dktcFp1Wk0w6yvDk/kkZgF6vJ9hyc5D2HgWW+tJNnAAB0hwLctjSpsrPTfJXwZdntrnBR6pTaYBF9S6pY02pmjoQkSN0gt2PvOsnijqxP02TMILAK/sUxrZNB+YVnjXP+HYQCW+EVw33nKXOP+FY0tm/7Wpf1+n1o8B4M7Yka4qkdN1nQAn1gx+Zlh7t/7F4bXMQWF1NtIzNSQzx8BldIU8n45Jlim+9PRlcIgh1aH+phMuWVvUcLIHaJpY34NqlqnGKui4UW7/57PyAEhsh8rgjGE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R7mvJm2gd2NUUxN2kSQkl+k49Cxm/rB4tPZrdLOasT0ztMtltx/CeWu0uJSo?=
 =?us-ascii?Q?9GBxqp1u3Libc28+p64UqntaQ6D8GlpYEfwhIu+t3AZCJ5M9VnniYfM6wfTI?=
 =?us-ascii?Q?PUbVk6n+ljIUk0qlaVXLck0nx/PE/p8zrqBBEBjS7BbuJWZOrEIjisIRI46W?=
 =?us-ascii?Q?gwL4AU+08FGvHxrxw42f357MGvKUNSZocbAVXnR+uxz2VNkWBlrdHPjKGQ04?=
 =?us-ascii?Q?J8zBkHcNkGH8zhSIhYQVnQAfV57osqZS5hKxK6q7kwn/9eg3aZLdw02xjfKj?=
 =?us-ascii?Q?DLVG/8x3MxscUtnpmz95CZxcOW28E8oHL7TfKZM5tz2EDEd1+l51bJmP0b+c?=
 =?us-ascii?Q?B3mCijmoIGDraYtJUO0cRdISxR4NcOW0FJDC3DL0771OqoSB0pvEMtjOpYR2?=
 =?us-ascii?Q?E1/UELb3Uqd8eS+Cb892KeaXuMFvJNLk85NjAcERGBVg5uSiVtTdGUwMfwXN?=
 =?us-ascii?Q?6FVwMHIAldGL9Y+GxFa29kXgX1AUO66J1kVoCbGmoeloCgR2Ejq1a3cqdawc?=
 =?us-ascii?Q?5oivdj64oSTmnWEz09Pv3sfBmU3pQVPbcvwsWlN6+YZH1fgcNheaoz3wB9lb?=
 =?us-ascii?Q?j9FMWhuhIJo2Ph0+7dEMyTd2VAujO3hkyxToVGEAY3b4lov66wMVrGzj2eN8?=
 =?us-ascii?Q?7FFPtl9nTJgPdAnce1CyvvQVzyHl8a20VTtCHpd+wiFZNlXY+Fbs0bOmtMp2?=
 =?us-ascii?Q?v9Dm37JnlXoHKhcajyCAm/J51/ssAyi+HpPxiXjJUGOxFoCg75Epdtspd8xZ?=
 =?us-ascii?Q?zRi1m0Ie7zx/Qg0CTqVsZZTi3/gx3PRSVaxu5m6yVpLVUOU5InhNrdvAG7d+?=
 =?us-ascii?Q?kRyDkwViRsacP21z6/6TQptWMb59URYX9xevyv1fyqXEpfqd8OWMQ2E4TGQw?=
 =?us-ascii?Q?82ZWVoe9emppO5qtMlT13xKsjZy/0CjvThXCY2W2nLGbl7oHikb6qYyfJLsE?=
 =?us-ascii?Q?487dUZT3EykupG2QOTA1C5DTnn0BQb9fOweakBXxzi77FnCrjkicoKGntxv2?=
 =?us-ascii?Q?rvqTypYc52AXRbm3PLD7TWBqMNc435pJ5KHJIIbiCKh5Vc6eWLZI7Q4qYZEx?=
 =?us-ascii?Q?ZXOpssSwpQu4IQJHm6Ah/xMrT3UsNk6S3weW/pyCodw5fKwzBsAtwIGV47/g?=
 =?us-ascii?Q?Y0R3khj5BNr29vepLQpRSzuTzlx6plwYDxcfdwEqEt3wbP/bXMQJHFe4Wazy?=
 =?us-ascii?Q?GrQW8d+u44ZN4twfkfwHa7F7EFSa+7Cb97+fd5bCyMH4ragDo+eT1bsb5wVk?=
 =?us-ascii?Q?n+I9dti9rty/hEFAFoOcrLPMCibHjy8XhZaoIMFLW3fQWNIMHpuebZdl8YXK?=
 =?us-ascii?Q?02rDIoUnKC0SYrF5fW9YaFt6NNVDUE9yAdkQLD5XrRIat07gkMiz/C5jjDvU?=
 =?us-ascii?Q?eJfN7tkRXdVhYYH2AvVndWhoemhRVA67t+APEXA3Qw5VmoZPMC3i1h9Z8kj/?=
 =?us-ascii?Q?+DoS5xl5QbH+cIfjL8AWKSD9mApqFXj9Q+wFpyy8s079Y97C45Ate12ZHEil?=
 =?us-ascii?Q?N9yTabDBnNPG3aGQ8v3M3aOlGLbJa0sK9iEw13nkp+dfJ0QeQGHU2Fb1jWqJ?=
 =?us-ascii?Q?fg9++HCXDX1Ddr2UV+0xSk23cjBsdzRbx48KIp45?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5008b8-a671-4229-4f06-08db4a6e505e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:06.0645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: go1HGY8p+hDC3Pk5oWGk9U/zklaBheAGU0/gQI3rdhPABuESIyULCSpLirt+TL4x
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/mtk_iommu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index aecc7d154f28ee..e4b9f728002403 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -753,6 +753,28 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
+static int mtk_iommu_identity_attach(struct iommu_domain *identity_domain,
+				     struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
+
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	mtk_iommu_config(data, dev, false, 0);
+	return 0;
+}
+
+static struct iommu_domain_ops mtk_iommu_identity_ops = {
+	.attach_dev = mtk_iommu_identity_attach,
+};
+
+static struct iommu_domain mtk_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &mtk_iommu_identity_ops,
+};
+
 static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			 int prot, gfp_t gfp, size_t *mapped)
@@ -971,6 +993,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 }
 
 static const struct iommu_ops mtk_iommu_ops = {
+	.identity_domain = &mtk_iommu_identity_domain,
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
-- 
2.40.0

