Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B081E6F3566
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbjEASDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjEASDO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:14 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B366B1BC6;
        Mon,  1 May 2023 11:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIqweLmJoTh2Q0hoIijvmMtQcB+zKe+diA/SKvjHugyuGIEQfWyRoe0v4s1aanJSbgnij3prUfGp9EOa2Qz49XuTBpJlwq6AxndP6c6P4AlePv0yPogkX8Kls2VhMmnhm41AQHDwmwFXCspQ2YmDEjKuHQzLv/GLMeZpiUR/2MNvN/ESUh3cmX2vg+l5AeVDDdG33XNqowWROlfKRakdRLukOjeUAxanSCczevEvhHP9ncfeOsaw4uONDbpMyAdM12sRa468I05f3rbecYc3QH0/n9eby0rkBSVYDAP6e4XPGYaFmaMH64PRlSYq5H7PjlozE0XACqblo304dI5SqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkERrc7tWesMfUPpLPn5NccdfNNKYyQz7OkVTIaz3v4=;
 b=QyD/pNeurXgxPeT8k63tX6Ki8aCvOLK/JbftbisQ6mCjtZgjuWFyAkWMfZ+yN8Qvw6UXxQKrx80pZdSqPRb2rZLpNg90gYFH8QF34odG8NjAaYrX1gNJDGYOpgdV0DlpyR7c1U1CeBfWxLnKtzRN6utpiSv57z9JKvD8vboI9nDTv5K/oAT2rjCyj4xUE4Sg3jcKH3BYbxHvhTagQTU/g/7Q8QkQPttD+8EqwxLJBOHFZMCXsGi3QTs7c1Ah3/d+XqM4dlUOzYNadBZFjweVZt7bPtY4wMH70kE7s2Gtu5QwsAW7BIHtQnbRbD5RBoyGyX76K8UKFYIKKCShJbcmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkERrc7tWesMfUPpLPn5NccdfNNKYyQz7OkVTIaz3v4=;
 b=JP3kFfq27LVKWKlj4uDUimNz6AbeGa3AFe6tnYhDuFG72Rsu3FgNXx2xaTQNAXH3dTsTgGDKfUyrKhd25+yldpOQM4eYLAbQZArx7bTv3sS3YeFaBmDmheTXnICl745D6VdyR99bDNC+EPRyEUSwze2wtkeQG7aAIbbUgB/dFAQP+Ovlt8+UUPv+P08gD4cm759ZRX4My599Cy7B5BZ4Ld3hN+Ls8dk9MuA7lOCvHt99VnI5RMxQqzA3nNHs/hE1pJUoYZGMGz8fd3CxvVsK1sdRcyb30VdNyC1X+98ZYlDsDucD8A3Bqm7nP8meC9pMgoDqGPbajuwrpl5TDA4SQw==
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
Subject: [PATCH 04/20] iommu/fsl_pamu: Replace set_platform_dma_ops() with IOMMU_DOMAIN_PLATFORM
Date:   Mon,  1 May 2023 15:02:48 -0300
Message-Id: <4-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0004.namprd18.prod.outlook.com
 (2603:10b6:208:23c::9) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: adcf4832-1e31-4019-ae4d-08db4a6e507f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Z4fpv7MCM6GqGJRpI2cEa4dcPZiP0oIXeziLq3lbsZgWa/18iOBCQLw9O3Fnp5ahBwLtNPFOAKy8ZgMwLiVcIYrCUCTXog8PwTNzErtEDFWljFU/yV1ohOdn681w/zIKcLm9YcvkVeWyRrSDRNlEQQa4prLiYXcUYBYqkzIr6ArbikBbFhgnVvkUZrAOjjEGx4TC18I2wHKcR5gF3tngaMzQyzJxJJcAFrpY0GahV0hKN7+5lhpx8FYd9bTQMNr18S8xuWQE7L0p6apNJ9Bere8h7E5i8+NgXySj1m/pG23mlTlkXLl6b6bSzToO2XfoQCliu160cQddnINNhqF4zVWhPgEvtyxL50vt0tSWqQxsoxOPcIk41bF8pkFHrLgYk7E7YJfpVIt4z4VfTOZ/hScpxA+XKaQSoKSmu2ySARqsKxMX5Y0juEBgXKVhevYCJuSldHJzqoHoHZHAJEssDz/BNuC2G1SxMZvCKXpBW5IAMKCCj+hG/W1BqxojzIbSKVKPGd9PykEHi1Ex9t/tzLKnA7qoakv/8/9ho2MnLbvxJ1IFhDwEPrKdr5q46B4CsFir8KJrwG7fzddl3eofB+2RA4pq8uYuU2fuGBWtiCD6ZrUCz6AjcK7Hj8fQJ3c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U6MLybbVwidRwLF4iY4srRhmG+VvsymO40k27xpXtgXXKc5heHQma235dMLl?=
 =?us-ascii?Q?Ydn4QHI9icSBT7xmrsmXjc1vq2UGIzZoK0zwoSehbE4iIpUhQy06gOuTNy/6?=
 =?us-ascii?Q?BdvzD0KsaR6uDnnTaBqvQOuS4q2vlk6aBoP7dOPsk59dVCQPRm2wsTwkoULI?=
 =?us-ascii?Q?f1WAOTvttAZ0lE4zO6mTHtQbU+oMyDO/6ni6tml3a578tXVK09jpoEkm3Rdw?=
 =?us-ascii?Q?LCsBkHqwYhDozqYiefFwzbLRSgIqiCxJC7YmPsI6nscSo76hzftjiLOGlIn1?=
 =?us-ascii?Q?+dq0EfIoGQqVQZa6LizVGj/yuxXv9376oP01iLDMRN5RHVpwpGFzCi8blsRi?=
 =?us-ascii?Q?MvEHM3w/Zs9G5gPpO8wGn6FlUqN5ag5VKLY/lEndLm7Nj0EKOZv+SNWr9Zvy?=
 =?us-ascii?Q?LPDtQd0SDTdUZqOx/aBegAqK4uzPk1+eE0FYlxeI3b9GlOmexGYcg2lh53Xe?=
 =?us-ascii?Q?gXz89LDAZxOz+g24yYmfuyUZyowdfPepBr8eiODU+sIe8MQdH6Hio+lFzXvt?=
 =?us-ascii?Q?GpxTdtbnzUUfa/P/odc92xx0zYUgarqudSNdQgT0YokphiZdHico5TVD+UGp?=
 =?us-ascii?Q?OvQLxZHZ22XMSgixdlBDyXzKvOe3VJ/SNYI2kodQDJwjD65axCjtJP6aFBlo?=
 =?us-ascii?Q?SL87YZflSFLthH2Z2DNYhleXaJ8oHg0FmEjrDznJix/uSbMXeLXTNJQUxvKK?=
 =?us-ascii?Q?GfkOyCISY8ZL0ANFik9CRlqTZ5SMQILZJHWXzOllQPpmOuao2SEHfbZAsQP6?=
 =?us-ascii?Q?BaBFsNKEpplmYX05gKKZgsL5DahZJf4p6yfxDzFvxAZc8IVqo5KutEYMMRiw?=
 =?us-ascii?Q?5F87Lmy6Fozc2UUI2B+UvRouCpQNAf8w01B20GpbYbvYlprSKMBK3QIDLCWi?=
 =?us-ascii?Q?7FGkdG+dtoJ8JgqJRAxUmIbeVaM1EKznmmeTsuJGS1rrbHotu/7AVN5Ahufv?=
 =?us-ascii?Q?1RnpNqrT28db4rdcWiq4M2h/WpgE42xUDWjxC8umeuBJkzkL57s6zD9oMu54?=
 =?us-ascii?Q?ZhrmSUtWwwvbovjTJIyU1q5TfzbP203S0V6j30Yj+AViNAjjG1zSUheXxjWB?=
 =?us-ascii?Q?qlI2TZaaJ3+kssaeSkNDqaMcTH6bmWtcvMGMJZH/j31w1Rg3/Z+r79pS/lNz?=
 =?us-ascii?Q?QwjrZ2oK280UFQvo2FfmQwG7pWx6RtnNUoA/R2BnMMiEBfgOo9zEWBP33/PL?=
 =?us-ascii?Q?kQ5wLaVx+jJ2w5eG8VZqSIdxUekIvTPBwA+t5lKMCptywc1J7uFS0bKEPyxD?=
 =?us-ascii?Q?GJzlbS0J4Iiex1m3EJQsKI8eXqwKBtascZBkp1rp81X0HQS/7H0xH2j6DiRm?=
 =?us-ascii?Q?86SMo5ZpyCecv5LNz+ScXm0RBTwrkroTGtY6N1fUTfhQpRQuhRFmNQQaH7WJ?=
 =?us-ascii?Q?6nqJP4doXK2VoAEmwOQE3ABXllFSRn79gzEWJ7qhj1SF/4tcEiKguH5YYHIS?=
 =?us-ascii?Q?wthx0pMTZEUQ3D1GwmfJdyPoBoYMWupp+UvfvKIK5qqpveBIkXEHRD0nDoHI?=
 =?us-ascii?Q?beG/JPYNtM3eq7fGlN7db6EczRT1auObkRH5gc0SilSTeeSUCcr5HIvqy0bs?=
 =?us-ascii?Q?YrQCzb03osqxho8OUhV+W9uxbyDh6ZVKVwpWWtu6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcf4832-1e31-4019-ae4d-08db4a6e507f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:06.2178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOZU18h5DevEHzXoxIDF3M/kz4s4QPYAvvpzw36MPtpHEMWnlk63Eia1JQGQWkWv
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

It is not clear what this is actually doing, most likely this is IDENTITY
behavior, but I think there is a chance it is BLOCKING given how the PAMU
stuff is oddly used.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/fsl_pamu_domain.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index bce37229709965..4c65f1adfe7511 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -283,15 +283,28 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
-static void fsl_pamu_set_platform_dma(struct device *dev)
+/*
+ * FIXME: This seems to turn off the iommu HW but it is not obvious what state
+ * it leaves the HW in. This is probably really a BLOCKING or IDENTITY domain.
+ * For now this ensures that the old detach_dev behavior functions about the
+ * same as it always did, and we turn off the IOMMU whenever the UNMANAGED
+ * domain is detached.
+ */
+static int fsl_pamu_platform_attach(struct iommu_domain *platform_domain,
+				    struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
+	struct fsl_dma_domain *dma_domain;
 	const u32 *prop;
 	int len;
 	struct pci_dev *pdev = NULL;
 	struct pci_controller *pci_ctl;
 
+	if (domain == platform_domain || !domain)
+		return 0;
+
+	dma_domain = to_fsl_dma_domain(domain);
+
 	/*
 	 * Use LIODN of the PCI controller while detaching a
 	 * PCI device.
@@ -312,8 +325,18 @@ static void fsl_pamu_set_platform_dma(struct device *dev)
 		detach_device(dev, dma_domain);
 	else
 		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
+	return 0;
 }
 
+static struct iommu_domain_ops fsl_pamu_platform_ops = {
+	.attach_dev = fsl_pamu_platform_attach,
+};
+
+static struct iommu_domain fsl_pamu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &fsl_pamu_platform_ops,
+};
+
 /* Set the domain stash attribute */
 int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu)
 {
@@ -448,11 +471,11 @@ static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
 }
 
 static const struct iommu_ops fsl_pamu_ops = {
+	.default_domain = &fsl_pamu_platform_domain,
 	.capable	= fsl_pamu_capable,
 	.domain_alloc	= fsl_pamu_domain_alloc,
 	.probe_device	= fsl_pamu_probe_device,
 	.device_group   = fsl_pamu_device_group,
-	.set_platform_dma_ops = fsl_pamu_set_platform_dma,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= fsl_pamu_attach_device,
 		.iova_to_phys	= fsl_pamu_iova_to_phys,
-- 
2.40.0

