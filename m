Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 627961A3568
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 16:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgDIOJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 10:09:44 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53831 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgDIOJn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 10:09:43 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200409140940euoutp02b1b7756241b59daba4c93a8ce7d8a350~ELAe9KuRp0449904499euoutp02Z
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2020 14:09:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200409140940euoutp02b1b7756241b59daba4c93a8ce7d8a350~ELAe9KuRp0449904499euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1586441380;
        bh=uOPOsjDBeoOPh/LWEsOhJf6fcYgFmHlbGZ8c2IaZow8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ss/rI+6NlyU3oEvmTa4XmrEG+8okyYAoMJCMGnHj7bBPUJbItptqJs7eL+ZclycFW
         qNPPpcbbyJYm/6tUzbTUgmDIz5eTJygGGL2Gfhpoyfk+6OJ3taOZAJPzf4Fn6iQbjD
         TDz84m2jcnqsPQVV0gax9Vu6eK3ZtTiOWkF5NIeA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200409140939eucas1p1fd05eadd1ffe536c1416de7d8ab426ea~ELAedSvQg1667416674eucas1p18;
        Thu,  9 Apr 2020 14:09:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id AC.CD.60698.3AC2F8E5; Thu,  9
        Apr 2020 15:09:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200409140939eucas1p190daac74c0d5dda4627314c49c1a5b50~ELAdsr7MZ1667916679eucas1p1_;
        Thu,  9 Apr 2020 14:09:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200409140939eusmtrp1ca40318d7b5d19361604d60509ea60fa~ELAdrogZI2358223582eusmtrp1R;
        Thu,  9 Apr 2020 14:09:39 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-16-5e8f2ca3fdfe
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A6.A6.07950.2AC2F8E5; Thu,  9
        Apr 2020 15:09:39 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200409140938eusmtip13f3b3d64a3bf6142809d9900bb2f4a50~ELAcr5K9K1665516655eusmtip1O;
        Thu,  9 Apr 2020 14:09:38 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
Subject: [PATCH] iommu/exynos: Rework intialization
Date:   Thu,  9 Apr 2020 16:09:28 +0200
Message-Id: <20200409140928.1403-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <40af831b-d00c-0cf9-0a06-e60c048a9ab8@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSeUwTQRTGM93t7hYsroXECRjRegSJilg0Q7yPPzYSjUc84oFW3ACRK62g
        eDblCFSgQEkgBYuggqKCUkBEBFqVqo0UJAGCJWJVRCtqBA2Iim0X9b/f+973zXszGQoTnSe8
        qciYY6wsRholJtzwutYxy6JLC9WhS6pMy1Hb63Ec6XNqCWRu/oSjnGsaDN39OEigCZudjy42
        r0CK6+18lKwtxVF64S0SaZ5e4CH1azuGLBZHmdP8jESdDUUE6kzqAOhr/wSGskuSMFRgaeKh
        9BEtgW4+7CORMlmC3pWMYsjw5Q0fjTXocFT+TEegZOuytT7MG4OOx9zQ3QCMwWYkmLvaPpLR
        X/VnqivSCcba1UgwuifbGP3lc4ympxwwmUmfCCarpgIwd7p0GKM3n2KGq2dunbrXbeURNioy
        gZUFrD7kFmFLeUXG2fxOZKvfEgpQNlsFBBSkg6CisR04WURfBbD2diTHIwBW20JUwM3BwwB2
        dlt5fwP55n6Sa5QDOPYoBXCFIzHQUu9yEXQgVA2pCCd70WLYPZzCd5ow2krCovu/+c6GJy2B
        D4qVLsbpefBxXpMrLKRXwr7eDowb5wuv32pxsYBeAy2pma6DIN1CQX2NYtK0EX5X90yyJ/xg
        qiE5ngHNmgycCyQB+KrtJskVGY4bKQsA51oBrW0/HLtSjv0WwKqGAE5eB4u+XHHJkPaAPUPT
        nDLmwNy6fIyThTAtVcS550OtqfLfWEP788l1GDj+QsvnXigXwNGSbjIb+Gr/D7sIQAWYzsbL
        o8NZuSSGPb5YLo2Wx8eELw6Lja4Gji9q/m36Vg+afh42ApoC4inCNJ46VMSXJsgTo40AUpjY
        SxiizAwVCY9IE0+ystiDsvgoVm4EPhQuni6UlL4/IKLDpcfYoywbx8r+dnmUwFsBgpfWzlHN
        8vB4fGZcktdj8sULA1DxLkPFzgC74JdXKaKJLUG9qWdlAnpg9/G4XN2qPjRxarPnk30qwv/e
        3In9Waas1uWDzZ+3G6dtCHEPlLxM0aYVa9rq24Uh6zFBwj73TX6nlT6mKKDb21Jm3/GjMiNV
        kx28Z+6FsTC9PSOPJ8blEdJAf0wml/4BxxsZz54DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsVy+t/xu7qLdfrjDBreMFqce/ybxWLzxK1s
        Fqf3v2OxmLhyMrPFzjcv2Cz+P3rNarFgv7VFw+oLrBYtsxaxWHTO3sBuMfnUXCaL/sevmS3O
        nwdyJ+4/y25xedccNovLzRcZLT49+M9sMWFhM7PFjPP7mCw6v8xis1h75C67RVOLscXzhT+Y
        LQ5+eMJq8XPXPBaL5WfnsVm03DF1kPZ4cnAek8eaeWsYPQ4+OsTmsXPWXXaPzSu0PDat6mTz
        uHNtD5vHvJOBHpuX1HtMvrGc0aO3+R2bR9+WVYwe26/NY/bYfLra4/MmuQD+KD2bovzSklSF
        jPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MR60P2QseaVRM6H/K
        1sC4TLGLkZNDQsBEYvrpB+xdjFwcQgJLGSVO///NBJGQkTg5rYEVwhaW+HOtiw2i6BOjxM9X
        L5hBEmwChhJdb0ESnBwiAkoS1z+3gjUwC3xhl7hwxBDEFhYwljg8vwksziKgKnFiyj6wBbwC
        NhJ3b11khlggL7F6wwEwm1PAXuJ8Wy9YvZCAnUTL3unMExj5FjAyrGIUSS0tzk3PLTbSK07M
        LS7NS9dLzs/dxAiM6W3Hfm7Zwdj1LvgQowAHoxIPrwFDf5wQa2JZcWXuIUYJDmYlEV7vpt44
        Id6UxMqq1KL8+KLSnNTiQ4ymQEdNZJYSTc4Hppu8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC
        6YklqdmpqQWpRTB9TBycUg2My7cIu7D09V49ePWsjfuqpbcsrDIvbZiZllKyhifw0+Xik3VL
        g3pf3Gu/qbr7oipP47+s69miW93cGObodsQ9U25Wlo6QUA6bEHtRujiz5oqnLIvWTOUZd+eu
        nc/l3elyjDnPtddinvCOafyxTLOCRJfHVX29tXmr0K+ICs64X64dZxQn1zxUYinOSDTUYi4q
        TgQAbHx3Hv8CAAA=
X-CMS-MailID: 20200409140939eucas1p190daac74c0d5dda4627314c49c1a5b50
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200409140939eucas1p190daac74c0d5dda4627314c49c1a5b50
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200409140939eucas1p190daac74c0d5dda4627314c49c1a5b50
References: <40af831b-d00c-0cf9-0a06-e60c048a9ab8@samsung.com>
        <CGME20200409140939eucas1p190daac74c0d5dda4627314c49c1a5b50@eucas1p1.samsung.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix initialization after driver conversion to
probe_device()/release_device(). Prepared on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/iommu/exynos-iommu.c | 80 +++++++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index f865c90..53c784f 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -565,6 +565,7 @@ static void sysmmu_tlb_invalidate_entry(struct sysmmu_drvdata *data,
 }
 
 static const struct iommu_ops exynos_iommu_ops;
+static int exynos_iommu_initialize_owner(struct device *sysmmu);
 
 static int exynos_sysmmu_probe(struct platform_device *pdev)
 {
@@ -573,6 +574,8 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	struct sysmmu_drvdata *data;
 	struct resource *res;
 
+	dev_info(dev, "%s %d\n", __func__, __LINE__);
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
@@ -649,6 +652,8 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	exynos_iommu_initialize_owner(dev);
+
 	return 0;
 }
 
@@ -1225,24 +1230,8 @@ static phys_addr_t exynos_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 
 static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
-	struct sysmmu_drvdata *data;
-
-	if (!has_sysmmu(dev))
-		return ERR_PTR(-ENODEV);
-
-	list_for_each_entry(data, &owner->controllers, owner_node) {
-		/*
-		 * SYSMMU will be runtime activated via device link
-		 * (dependency) to its master device, so there are no
-		 * direct calls to pm_runtime_get/put in this driver.
-		 */
-		data->link = device_link_add(dev, data->sysmmu,
-					     DL_FLAG_STATELESS |
-					     DL_FLAG_PM_RUNTIME);
-	}
-
-	return &owner->iommu;
+	/* this is called too early on ARM 32bit to do anything usefull */
+	return ERR_PTR(-ENODEV);
 }
 
 static void exynos_iommu_release_device(struct device *dev)
@@ -1268,7 +1257,8 @@ static void exynos_iommu_release_device(struct device *dev)
 		device_link_del(data->link);
 }
 
-static int exynos_iommu_device_init(struct exynos_iommu_owner *owner)
+static int exynos_iommu_device_init(struct device *dev,
+				    struct exynos_iommu_owner *owner)
 {
 	static u32 counter = 0;
 	int ret;
@@ -1287,6 +1277,12 @@ static int exynos_iommu_device_init(struct exynos_iommu_owner *owner)
 
 	iommu_device_set_ops(&owner->iommu, &exynos_iommu_ops);
 
+	/*
+	 * the above iommu_device_set_ops is not enough, initializing fwspec
+	 * is also required
+	 */
+	iommu_fwspec_init(dev, &dev->of_node->fwnode, &exynos_iommu_ops);
+
 	return 0;
 }
 
@@ -1308,7 +1304,7 @@ static int exynos_owner_init(struct device *dev)
 	if (!owner)
 		return -ENOMEM;
 
-	ret = exynos_iommu_device_init(owner);
+	ret = exynos_iommu_device_init(dev, owner);
 	if (ret)
 		goto out_free_owner;
 
@@ -1330,34 +1326,51 @@ static int exynos_owner_init(struct device *dev)
 	return ret;
 }
 
-static int exynos_iommu_of_xlate(struct device *dev,
-				 struct of_phandle_args *spec)
+static int exynos_iommu_dev_match_owner(struct device *dev, const void *data)
+{
+	const struct device *sysmmu = data;
+	struct device_node *np;
+	int idx = 0;
+
+	do {
+		np = of_parse_phandle(dev->of_node, "iommus", idx++);
+		if (np == sysmmu->of_node)
+			return true;
+	} while (np);
+
+	return false;
+}
+
+static int exynos_iommu_initialize_owner(struct device *sysmmu)
 {
-	struct platform_device *sysmmu = of_find_device_by_node(spec->np);
-	struct sysmmu_drvdata *data, *entry;
+	struct sysmmu_drvdata *data = dev_get_drvdata(sysmmu);
 	struct exynos_iommu_owner *owner;
+	struct device *dev;
 	int ret;
 
-	if (!sysmmu)
+	dev = bus_find_device(&platform_bus_type, NULL, sysmmu,
+			      exynos_iommu_dev_match_owner);
+	if (!dev)
 		return -ENODEV;
 
-	data = platform_get_drvdata(sysmmu);
-	if (!data)
-		return -ENODEV;
+	dev_info(sysmmu, "found master device %s\n", dev_name(dev));
 
 	ret = exynos_owner_init(dev);
 	if (ret)
 		return ret;
 
 	owner = dev->archdata.iommu;
-
-	list_for_each_entry(entry, &owner->controllers, owner_node)
-		if (entry == data)
-			return 0;
-
 	list_add_tail(&data->owner_node, &owner->controllers);
 	data->master = dev;
 
+	/*
+	 * SYSMMU will be runtime activated via device link
+	 * (dependency) to its master device, so there are no
+	 * direct calls to pm_runtime_get/put in this driver.
+	 */
+	data->link = device_link_add(dev, data->sysmmu,
+				     DL_FLAG_STATELESS |
+				     DL_FLAG_PM_RUNTIME);
 	return 0;
 }
 
@@ -1373,7 +1386,6 @@ static int exynos_iommu_of_xlate(struct device *dev,
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
 	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
-	.of_xlate = exynos_iommu_of_xlate,
 };
 
 static int __init exynos_iommu_init(void)
-- 
1.9.1

