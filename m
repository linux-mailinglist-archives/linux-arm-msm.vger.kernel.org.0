Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98186512DEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 10:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233984AbiD1IOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 04:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiD1IOZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 04:14:25 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33C8737AB
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 01:11:11 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id B1AB52FB; Thu, 28 Apr 2022 10:11:05 +0200 (CEST)
Date:   Thu, 28 Apr 2022 10:11:03 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Xiaomeng Tong <xiam0nd.tong@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, will@kernel.org,
        sricharan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] iommu: fix an incorrect NULL check on list iterator
Message-ID: <YmpMF3ico9tregcJ@8bytes.org>
References: <20220327053558.2821-1-xiam0nd.tong@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220327053558.2821-1-xiam0nd.tong@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Mar 27, 2022 at 01:35:58PM +0800, Xiaomeng Tong wrote:
> @@ -617,23 +617,17 @@ static int qcom_iommu_of_xlate(struct device *dev,
>  {
>  	struct msm_iommu_dev *iommu;
>  	unsigned long flags;
> -	int ret = 0;
>  
>  	spin_lock_irqsave(&msm_iommu_lock, flags);
>  	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node)
> -		if (iommu->dev->of_node == spec->np)
> -			break;
> -
> -	if (!iommu || iommu->dev->of_node != spec->np) {
> -		ret = -ENODEV;
> -		goto fail;
> -	}
> -
> -	insert_iommu_master(dev, &iommu, spec);
> -fail:
> +		if (iommu->dev->of_node == spec->np) {
> +			insert_iommu_master(dev, &iommu, spec);
> +			spin_unlock_irqrestore(&msm_iommu_lock, flags);
> +			return 0;
> +		}
>  	spin_unlock_irqrestore(&msm_iommu_lock, flags);
>  
> -	return ret;
> +	return -ENODEV;

This looks a bit clumsy, a better fix is below:

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 50f57624610f..98d23c52537b 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -610,14 +610,16 @@ static void insert_iommu_master(struct device *dev,
 static int qcom_iommu_of_xlate(struct device *dev,
 			       struct of_phandle_args *spec)
 {
-	struct msm_iommu_dev *iommu;
+	struct msm_iommu_dev *iommu = NULL, *it;
 	unsigned long flags;
 	int ret = 0;
 
 	spin_lock_irqsave(&msm_iommu_lock, flags);
-	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node)
-		if (iommu->dev->of_node == spec->np)
+	list_for_each_entry(it, &qcom_iommu_devices, dev_node)
+		if (it->dev->of_node == spec->np) {
+			iommu = it;
 			break;
+		}
 
 	if (!iommu || iommu->dev->of_node != spec->np) {
 		ret = -ENODEV;

Can you please verify this and re-submit?

Thanks,

	Joerg
