Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743466F3598
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbjEASDa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbjEASDX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:23 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3641119BA;
        Mon,  1 May 2023 11:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD/+verImaFZMJiq8qB+xsDWZJ1oWLkE3sOk5imEHX6AtA1PMVDVmxNjvPUdyFupL8ifcrjkkm/UL6W7K6MVhXBYrQyku5zjYfSNmp4BbCczaZzQvck1SpJFoMXJex0NjI0WwluGYo1XY2HOZerk/sVHXRFVYy4oeaYch3w0qw73M2ytDAkHmDFZF+us6K2Ma9PBu0UhncwLLAuKObY6sNMNlRW/wlpMnpB/mkFoz6Q6AMkLhFDxy9/iHghzSnlJ3V4zRS3HJv1xG+EUcnRsA5ngyFURsCKdMbEN31wOjILnf42RPBHXx7k31hw2toFrxjaBH+UzIm8gQ4CVNOo/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=redqFhajgre4x/fmsyCEDyKeTC++9I3Jtp1ibJHqor4=;
 b=VTuoit60q4c9xebAuNoTM3WVAT6cnu4Fg0ncqp5+1a8ekjoFo/oOqlMwuCQjRZxGg2TyLz97gAda22yIlD8OWpwBsQcXumYYswlEnb5OouGPo/JIm7AR9in7Xf7QcC0SIcvabULLmLn19yagUsy5ws5rBKWMH+WPhu6mvcmwN0G0KZ8RuArNCjKyFiqjVo8T/dj0CLeN7518/IgkRGTKaH/7xFA4dy4avtmQBb8mfaT6YFmWN2uaJkG1SosPb4zca6fMr/N8MA0fIBroQxlMQ3bErPZSoVODohaZWG4EBC+QXfYiDStXuQ7rxj2+BdueyQpO4anAyuDKFdngPIXk3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=redqFhajgre4x/fmsyCEDyKeTC++9I3Jtp1ibJHqor4=;
 b=RpYwCacovONnhQj5hKzztbFEUycvfUw/XLqTzEHMjUMb7e5fPdRFTusPdS2yH+JRNQsMmOGKqnS2b7ZQgpphcd+CTcFiglOFaBq/9sFWqcRLPKdCwQzyuGJnqIwoNz7d3tXjr0625/Lj27W/NlB4ae9hgG5DtD7bYVATMSV3kGcv26EDfh00QSJ3CLvQaylp0FMcYmwaoB6+vPMd1aHcWFbwqhhTYBMwk8hDrWq1mPtq6qipux+BSt2nEq9UILXlsoyzVfz/rMm8JVoUxBMnhLph4MiVafT+bxbth99o+DgbhuIkP/5wT396kYXaB+92FSGEqfIcoA9aw4NlF9oNNg==
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
Subject: [PATCH 14/20] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Date:   Mon,  1 May 2023 15:02:58 -0300
Message-Id: <14-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:208:2d::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: d39f4ae9-6a22-42a2-ab92-08db4a6e516b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JZPNvhaJKHfOFC1db+yy9h283IkBVSvDgFnzy8wwD3MwrnFsFAiHcxDZ+dqw4NVWKl/DpFEEXuJpP4zEkVNY2UPLgdnt5UsdL5tAUjxVKZ1yUexsb37rIRkXxGO3T+HImlR/pmYcWvilCNPBbnXncXb8mN7T0S9sE5yBGWeWpgjPbByedZP8FU8n/oza6mpbIG5WaSlKo6R6TVXVro1wKgo7Sbrx/HkDEHYA3bFcqbpOKMlhEO/sibwUHhX+Wohp1EsjBJskgaf/tUG+XhPAQB2OCjr4veNTC2/wkVzGi6Z0SAje6jioPWAau47H3fl6etKl+WXr9Kc0ErZ2sPp0fzcWrImcDsVj4LrTYQJemiMmSEVdGyfyJRs8QDaxWGSh/Y6aqD9RvAi1ZlOojKPVjr03N0y7aTQ/iI1FSemeOcqGgjj9r4s6366FFg2hIBOhZ0gy22YRqpIwS1+hlBvmE1TifLJPwOrdRx91SJV7C2PFIQyAUPCVWTOWHpSODfCj56TbJ/J1I5MIg1+zJh9BGePZ8JcA2FVcpasLBKEl7k/8sUrXvZmKNb48lmVjkohufW0aQ7UmnrR+VDZyLV6qsSH+9ccevaybQSMMz8DJkY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P+czNfvmqUvaEeYus07aHA13sZ7XfrfodYypb8MqeprqdQ3KXL5fVt2TxcOo?=
 =?us-ascii?Q?OU4YTSuPV1bdXqBK3Zfu2PNJHJG6b1bXJPaE3NoGIDRZt6CNszNX8aMBuE73?=
 =?us-ascii?Q?4tnAb14bPkfXvhF0856dbgnMyIrdom+i/Rvvv4/DGgVxgsqVYYkSbEC6qk2x?=
 =?us-ascii?Q?ROhQQe/USKjXgi2PlBn6VsLdeAliBYk1zGAYyTQFq1qUYp7PBLHoG0AuB/fV?=
 =?us-ascii?Q?fjnjp0a0Wt68YqvTr8/cKX1LPWLzqzVImSkLxGPWl8jXBUksDghvPu53n++S?=
 =?us-ascii?Q?E4RNG9PVccnUV1jXzTbW+byimghTa04cx/IYY5qVB2etCTwcRNbK1kWD5QLo?=
 =?us-ascii?Q?fZ+7tDG4Id1s3CrVYQnys5fGLxKI0LOfNH4x8p60pUhRBoA6Pg4P3GfzBOvk?=
 =?us-ascii?Q?gDy+Ky5hcAEBFxO6hykJCmeA/QE5KO8o8g0ODtEVwef2SNMDP4xgJ9lgSnQ6?=
 =?us-ascii?Q?qBZQl5tDqJyz9iwJojzt+fvFwjFJhDfpZoB+Svku3jy3aefLyWKM89ljAyYz?=
 =?us-ascii?Q?lezeAxfMUCi8OP8zdm89uBv/rRkU1YHOmZ4tWQSCC8xIeyB5eWvhwPrktzIq?=
 =?us-ascii?Q?h2fxAa0MuablExtBuMf/J/2YBGYPanS12yu1e1sitLIYuJg/ebN7M9wq/LAz?=
 =?us-ascii?Q?LPfa/C2XJE3T+3vKzEIIxdN+vvAnzRoX26wS3EX3FnwKi33clgLne8vmCwhe?=
 =?us-ascii?Q?N2o1xpzII4NC8g7V5dkZZUk0M3ioT8dG/ZRinEadLxzDYBAmNZ+MnyDOis7g?=
 =?us-ascii?Q?DBKKGg9DPvDY7NTK/t4s0Pd+3gLJ7nyBcZ2cKkvuVsZprIPwK1JeU6qGXJMf?=
 =?us-ascii?Q?0XPOYOfXEMnLb27Egd0H/Efsx+g8cZdyGi/nAho+e+8wPHpZMPgVrHX335my?=
 =?us-ascii?Q?HeYYfHDWJEjVF3rbr8jixz234ufCjKZqOYuHA07GLW/BlR/DXZCczulIW4Bf?=
 =?us-ascii?Q?/B+FUeiHjp4luBq+jwBNgluRJs7TgeVfjNlsqy9EFn0ph3kkmAXbv0TpQhL9?=
 =?us-ascii?Q?XyObOw9+nt97EgJLdU98ZHl8aR6l1dzvMX1D8qRVpm867joLhGJapwLlyEdl?=
 =?us-ascii?Q?rUmWy6MOfywuaE+db0q3ODPj2M21TE/sNtMzzU+P1P0wXjgUifvuumlJMQpP?=
 =?us-ascii?Q?/aJm9AVvEjkCE/uL5arnW3vc+HVH/H4+CbH26MJFImgejgBuL/ryzdHfFnoc?=
 =?us-ascii?Q?O5Zgfl+5hfLuJ+GUD4fl5TRyYpxY+n0A8NVYj06EcHc/Lf21va9vO86W8wsg?=
 =?us-ascii?Q?K+kKxsG5KQDSgEmLB5nIF1bhVHDCgayu/0Un2cUFzA3pME87ICmcYGu4ESe9?=
 =?us-ascii?Q?S8bfc5jI6Dr60VHhRH4pbwonsz8Vsl2Xr5h5TKH26v6rD8mJzzapakKmyxFl?=
 =?us-ascii?Q?4L/CGmGw+RWweGk04+OwOw1U7KxerAeJWiaaA9KIhAhiuTrcy9zA/NGv/4Ta?=
 =?us-ascii?Q?DIORkybjafnYdNkpv+ZUjtSqW3+pKcsXbED2tU8Q6Yy3zrzuI58FsxxMY5Vu?=
 =?us-ascii?Q?arEglxeFrjsnd/9AjH+a0vE5qVcDvgCRdK2ygSH4el30UZ/U8zQjlJgAOWla?=
 =?us-ascii?Q?dwAEERzNSaBAoCfguPk8hF7OS+0AIdk9N5emvS6/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39f4ae9-6a22-42a2-ab92-08db4a6e516b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:07.7676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS1+2txv4s9ro/YY1L13Eft2Nw12bismg6GCZwUn1h1D33O5G7OKs9o7Ca0ru/Aa
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

Also reverts commit 584d334b1393 ("iommu/ipmmu-vmsa: Remove
ipmmu_utlb_disable()")

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/ipmmu-vmsa.c | 43 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9f64c5c9f5b90a..de958e411a92e0 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -298,6 +298,18 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
 	mmu->utlb_ctx[utlb] = domain->context_id;
 }
 
+/*
+ * Disable MMU translation for the microTLB.
+ */
+static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
+			       unsigned int utlb)
+{
+	struct ipmmu_vmsa_device *mmu = domain->mmu;
+
+	ipmmu_imuctr_write(mmu, utlb, 0);
+	mmu->utlb_ctx[utlb] = IPMMU_CTX_INVALID;
+}
+
 static void ipmmu_tlb_flush_all(void *cookie)
 {
 	struct ipmmu_vmsa_domain *domain = cookie;
@@ -630,6 +642,36 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
 	return 0;
 }
 
+static int ipmmu_iommu_identity_attach(struct iommu_domain *identity_domain,
+				       struct device *dev)
+{
+	struct iommu_domain *io_domain = iommu_get_domain_for_dev(dev);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct ipmmu_vmsa_domain *domain;
+	unsigned int i;
+
+	if (io_domain == identity_domain || !io_domain)
+		return 0;
+
+	domain = to_vmsa_domain(io_domain);
+	for (i = 0; i < fwspec->num_ids; ++i)
+		ipmmu_utlb_disable(domain, fwspec->ids[i]);
+
+	/*
+	 * TODO: Optimize by disabling the context when no device is attached.
+	 */
+	return 0;
+}
+
+static struct iommu_domain_ops ipmmu_iommu_identity_ops = {
+	.attach_dev = ipmmu_iommu_identity_attach,
+};
+
+static struct iommu_domain ipmmu_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &ipmmu_iommu_identity_ops,
+};
+
 static int ipmmu_map(struct iommu_domain *io_domain, unsigned long iova,
 		     phys_addr_t paddr, size_t pgsize, size_t pgcount,
 		     int prot, gfp_t gfp, size_t *mapped)
@@ -848,6 +890,7 @@ static struct iommu_group *ipmmu_find_group(struct device *dev)
 }
 
 static const struct iommu_ops ipmmu_ops = {
+	.identity_domain = &ipmmu_iommu_identity_domain,
 	.domain_alloc = ipmmu_domain_alloc,
 	.probe_device = ipmmu_probe_device,
 	.release_device = ipmmu_release_device,
-- 
2.40.0

