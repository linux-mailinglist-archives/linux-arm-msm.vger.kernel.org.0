Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009F36F356A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbjEASDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjEASDO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:14 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29C719BA;
        Mon,  1 May 2023 11:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lf7mHma0SxCTy+WfQBGTaVnndD2GQCnOdmaR1WGIDgcJ9MbLHQO2qWzgHKuBj/KTkmvd0KSoPeUMKOeH3uAKMzV7/JaIKHU46+YrxZFuN9890cYgLzCZRz5m2j5+Uxt4n59ZasjUJ2xcHluUG6BH7FCLt38nDxgbeWfCe3MeKruFX4wRfnEuHQYplSfKHtR3CAdRuIcM5apqQw3obj7dstUehVR13RdkFYg/qoBBqLYOQHEwTI0EJ3TqEl3PQ87ziKSLA47g6GKWylMtnz7AfFrTGsIawzJsmml+2e7WncchS/B+ptw49qNg27HYscoOAGgv9ycwu91Bryq2ClZuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0nef3QKKpUC6cNA+XSSQkw8BrmOt7cOhBUNZx29qZQ=;
 b=mYYB5kDBy/hI868e2OBxDGkJbOiMt98xc3SE/SK4tziZOo2lOxFTvj3LGfgATUnzfja9WaNYFpgWx1nHFeRGo35mYoFjust5PH0TTrJWs4wQN8TTLAQrZOfXltXoH4Pwzd3Qnn2OkiA4BqCE9vddr60pTkSVYDzgtvgeLP0NGxsvsxO75OUVwhOxs7uR01ei0HtpZSmsuuTAvjcIi2eS4JDrm6DdQzE8n/BwX/GzZIG74Kztrk4N1na2M6a9qPQ2PHOnt+yFRkAsaQTDOdMbwRrjbJX+hV3Exv5W1gXeCKjqYWf8yw3KCwdyIa2h/mZ3xouWkR0weTgl94/bFLYiSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0nef3QKKpUC6cNA+XSSQkw8BrmOt7cOhBUNZx29qZQ=;
 b=j04cPBrc6JFcUdspLh4VAsgHhi9gdOMgFMdvlYpDzbyJiAAFQj37yxlxugIyF6L+F3IC3y3KIPwrA3xFw6qXTNdzxw5fNKuNRRhD62sWuRGE5Zj8IW72O6JFqOQwZYhByhgIQ2dI3ZgtF7nnx7bMpnAr0MPN/4zoCszIjG0bM+8LGra9M8fidX53GJOoH1AAEu52u49LPAM6CuDJzHfYm8vgcFvK9croj2WUFTIHn847CqvLqNqsjo8HJDVu3XqXYWiwInGwHMVw/5tphpfXBZGYCbAlnGYxOZGnqmu6QPxir5VmPfhN1vmn58GJl39UWFDOaHU9xAvFLD3dHKNbHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:08 +0000
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
Subject: [PATCH 13/20] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date:   Mon,  1 May 2023 15:02:57 -0300
Message-Id: <13-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:208:32a::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfd9e18-b39c-4da5-3731-08db4a6e5089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iCIW0YbjVLunZCemwxmU42WCvT8uu/VMeelam5/eon4wRDfLMP7JCYxdhkAhG2abYKQQItZX0EnQy6a93HRfxgvHXlUI5+x+d8D9rSBKV3aAsx0oEENgrQMy9AJlDcwCeSEIozczlXcXqs+Sfewj19DlPqpJem6qQAoGETznJi7SEr0b8N5YbJPdf7u7gvSl9N2qrKcpFEgHsZn1s/aox6Uitqe6qmPktvthUTExyadjHX7WrcmQtcbWneUYBb0En5QwEYYEFj5hkm0e3htPOGlGsToasDpwe1TDKP0iCiU3hJkUdPpm/MOcMboN73ydBqUCJFWcfh6XAPqaJyTLuxFmEroOiTcf62PvsCCxjpvRXH8XufL0kU0tAqVPSMXb9VJo7LpRJfH4vYojsXFf1qY2xB2UsAvY+fHeuOzpSgmGkQynuU0BrVJCMboUBiNtG/LyNw9yuNzUN8gemJXREuDf51pzF9MmIVFmD0obhmVK8KvKuKuoNhS3pA2KqOaA6rm5WQzVN7CJYWHVgBk03pl6KPFMKvLdf7rdRY8+33DnnlPEgHvjhlMkc0kOxwL8c7teaPc45eJhqKk42JM2pDWiDqLN17ZSFhgpwihac80=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/vsla8e1UwW1PBtoIivR+37vOso/6C4i42cHj6Ns8b3XFRtdaSy7x31OsbTR?=
 =?us-ascii?Q?xV4XDI/vb+SDATLb1bzFniUWX6cQ6k2eFM1IFdL4FovHyKQT17m2jX6jyLUl?=
 =?us-ascii?Q?4myfbG7jj43joCdp1y8scKwS/DobOdaqancyWCxVr8Z6Yxe4SDQd3LNvLAXL?=
 =?us-ascii?Q?0eihNZ663IFvY8s6gAW+37B1LINeMU/jrGmnq2Xjy0HSbwcpsON+ZreGfehM?=
 =?us-ascii?Q?UkpBV2cfUyFBrV5Hj07XJz07CHHuYgX2BLFBo6/BTK1m0OOcuSaulQ487quM?=
 =?us-ascii?Q?Dk/Abl+jUZ5bv3+CykoujIb3v5D8aSudi6Uu5H2XyBUDAhfYSKD5Kg39NQzi?=
 =?us-ascii?Q?mhDyzJOEh/6htJ65PuCewQo6Nu3yEb8TodzpXhhynnKEQnSbFfMZHNL9SlHA?=
 =?us-ascii?Q?n3Er8OWnueM0ywIURIEICI4foIHd6BjebQXL0H2umTfFzlOkkqhNHYO20R3a?=
 =?us-ascii?Q?ljBJ9LSSiMTe8+8wCTWNy5SqZ4DvrNYtRKZJ98HdppPLZJhvlmXDIccoHVaS?=
 =?us-ascii?Q?vuezwJPp9D33xfbpvpP2/00O0qURyxevaKlMQhHudH8jFOg1xAVVD3ovpyOM?=
 =?us-ascii?Q?ACYyx8MrohqgYMhpm8pEbVAca4cO7htGU59KMX03ZlgTLX/CN5RsHq+kVDAJ?=
 =?us-ascii?Q?J1vnmsgUkaONqTuNOicHPwjiX988Kwk54QNIw3DhzpYk2v6qPSa20Q0gXi+s?=
 =?us-ascii?Q?WsoHW1w88Z2/GtTQ611vapBti6oXS1Vj9LkLSqIkcYXja321GZOkIDWGzKEu?=
 =?us-ascii?Q?bFNr/AEMPRGbtEIoA+ptqVx7TJQlmA1w6qh1j8OtGtzgFOZNPLofMjtTE8Fm?=
 =?us-ascii?Q?KDx8aX+6r5MQ6sKKD3Dn+Vne06DsnwSr0+T80hiUXNrA61q7Gmp85VY1kWNi?=
 =?us-ascii?Q?2An5cgSzIFB/uKpAGsvlWITmlshK+mqROWHbKAqiFdKMlJst7T9hTNSxHfVZ?=
 =?us-ascii?Q?PQ57z1PxYbPMTqK+D89Eibu1K6X1C4tKwln3Is0qy5/+y16yrIUG6McWPW4y?=
 =?us-ascii?Q?JqEiy2L4FBY4SVFImxP4f8mUJLUpF45VZZPajsPR5+ij4YdIbcPuBeR+UnE6?=
 =?us-ascii?Q?pcWzGbe0LmnBxV1i7C2k0E61eyA/f/hHz5fsjHOliSZcJV3e10muAkS8NHOy?=
 =?us-ascii?Q?rib3NqROm05CtO2srvCkbzBYp7bRJVscLZS4EXcwVyM8BvFPRffEF+TL0kyT?=
 =?us-ascii?Q?iXEWBYNFg/B4UAIb6ZiNzmFn60AWfTJDpsGBg3MqeknHKQeA5rs55zwU6c+Z?=
 =?us-ascii?Q?l+op/Iw9yue0Je7DjstdH1dQQ+CAQlfDSovObJRi6vUpkW3GW10IFeuhbOdk?=
 =?us-ascii?Q?4PssrGg0y7xN+pKWh2vQAhSnu9YE3xDSq91AK2NEJ5idEDzNdVyMhxSTVb0c?=
 =?us-ascii?Q?xetnmAN7A5xGaAcDKX3RgdYzPqr5Y+LbBwcu+Ag1XSQevZyx6vctEebkv5Kq?=
 =?us-ascii?Q?d/ZM2XYr90jQyt2ZzQrE6xRTt4mBso0pNQdQJljPA1htkQuJCOSI8HvN+FH9?=
 =?us-ascii?Q?PGE4o/8PTHfM2DbcABDYXkrSReoMWVHiSrOYEw4eS2fJUCbnXavOXUg1fLWd?=
 =?us-ascii?Q?tvn95DhRSfkxCI6pi9maFi8yLYIaycY8Pf+mKqNv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfd9e18-b39c-4da5-3731-08db4a6e5089
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:06.3199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVKATbYQwt3+IRzWa91UrikQMlWqcRcUoGrGJ33wsZFdHsndr/i8HJNYis6kOV3+
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
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index a503ed758ec302..9d7b9d8b4386d4 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -387,6 +387,44 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
 	return 0;
 }
 
+static int qcom_iommu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct qcom_iommu_domain *qcom_domain;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
+	unsigned int i;
+
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	qcom_domain = to_qcom_iommu_domain(domain);
+	if (WARN_ON(!qcom_domain->iommu))
+		return -EINVAL;
+
+	pm_runtime_get_sync(qcom_iommu->dev);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
+
+		/* Disable the context bank: */
+		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+
+		ctx->domain = NULL;
+	}
+	pm_runtime_put_sync(qcom_iommu->dev);
+	return 0;
+}
+
+static struct iommu_domain_ops qcom_iommu_identity_ops = {
+	.attach_dev = qcom_iommu_identity_attach,
+};
+
+static struct iommu_domain qcom_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &qcom_iommu_identity_ops,
+};
+
 static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			  phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			  int prot, gfp_t gfp, size_t *mapped)
@@ -553,6 +591,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 }
 
 static const struct iommu_ops qcom_iommu_ops = {
+	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
 	.domain_alloc	= qcom_iommu_domain_alloc,
 	.probe_device	= qcom_iommu_probe_device,
-- 
2.40.0

