Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C181ABD87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 12:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504633AbgDPKFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 06:05:32 -0400
Received: from foss.arm.com ([217.140.110.172]:58348 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504310AbgDPKFa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 06:05:30 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEFD6C14;
        Thu, 16 Apr 2020 03:05:28 -0700 (PDT)
Received: from [10.57.59.184] (unknown [10.57.59.184])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 897873F73D;
        Thu, 16 Apr 2020 03:05:27 -0700 (PDT)
Subject: Re: [PATCH] iommu/qcom:fix local_base status check
To:     Tang Bin <tangbin@cmss.chinamobile.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <7f8cadbf-2568-19f5-610f-6ae7d9846ec6@arm.com>
Date:   Thu, 16 Apr 2020 11:05:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-02 7:33 am, Tang Bin wrote:
> Release resources when exiting on error.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>   drivers/iommu/qcom_iommu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 4328da0b0..c08aa9651 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>   	qcom_iommu->dev = dev;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res)
> +	if (res) {
>   		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(qcom_iommu->local_base))
> +			return PTR_ERR(qcom_iommu->local_base);
> +	}

...or just use devm_platform_ioremap_resource() to make the whole thing 
simpler.

Robin.

>   
>   	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
>   	if (IS_ERR(qcom_iommu->iface_clk)) {
> 
