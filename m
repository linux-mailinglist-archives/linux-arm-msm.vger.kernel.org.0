Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF79BD75DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 14:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730640AbfJOMKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 08:10:00 -0400
Received: from foss.arm.com ([217.140.110.172]:37244 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbfJOMKA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 08:10:00 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C606337;
        Tue, 15 Oct 2019 05:10:00 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A0583F68E;
        Tue, 15 Oct 2019 05:09:59 -0700 (PDT)
Subject: Re: [PATCH v4 2/7] iommu/qcom: Use the asid read from device-tree if
 specified
To:     kholk11@gmail.com, linux-arm-msm@vger.kernel.org
Cc:     marijns95@gmail.com, iommu@lists.linux-foundation.org,
        agross@kernel.org
References: <20191001220205.6423-1-kholk11@gmail.com>
 <20191001220205.6423-3-kholk11@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <25f3e314-3fcc-fc4f-e7b5-4f28418ea02f@arm.com>
Date:   Tue, 15 Oct 2019 13:09:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191001220205.6423-3-kholk11@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2019 23:02, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> As specified in this driver, the context banks are 0x1000 apart.
> Problem is that sometimes the context number (our asid) does not
> match this logic and we end up using the wrong one: this starts
> being a problem in the case that we need to send TZ commands
> to do anything on a specific context.
> 
> For this reason, read the ASID from the DT if the property
> "qcom,ctx-num" is present on the IOMMU context node.

Can you clarify exactly what the situation is here? Is the hypervisor 
broken in that it presents context banks at made-up offsets and fails to 
correctly associate those offsets with the real underlying hardware 
context in some cases? Or is the hypervisor actually intercepting 
TTBR/CONTEXTIDR/TLBI* writes such that we don't actually have control 
over the ASID used by a given context bank (which I would also consider 
broken)? Or is "context number" a specific thing in the SCM interface 
which represents neither of the above?

At the moment, it seems like a bit too much is being conflated here just 
because of some implicit behaviour in the driver.

Robin.

> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>   .../devicetree/bindings/iommu/qcom,iommu.txt    |  1 +
>   drivers/iommu/qcom_iommu.c                      | 17 ++++++++++++++---
>   2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> index 059139abce35..ba0b77889f02 100644
> --- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> +++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> @@ -46,6 +46,7 @@ to non-secure vs secure interrupt line.
>                        for routing of context bank irq's to secure vs non-
>                        secure lines.  (Ie. if the iommu contains secure
>                        context banks)
> +- qcom,ctx-num     : The number associated to the context bank
>   
>   
>   ** Examples:
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index c31e7bc4ccbe..504ca69adc5a 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -585,7 +585,8 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>   	 * index into qcom_iommu->ctxs:
>   	 */
>   	if (WARN_ON(asid < 1) ||
> -	    WARN_ON(asid > qcom_iommu->num_ctxs))
> +	    WARN_ON(asid > qcom_iommu->num_ctxs) ||
> +	    WARN_ON(qcom_iommu->ctxs[asid - 1] == NULL))
>   		return -EINVAL;
>   
>   	if (!fwspec->iommu_priv) {
> @@ -693,7 +694,8 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
>   
>   static int get_asid(const struct device_node *np)
>   {
> -	u32 reg;
> +	u32 reg, val;
> +	int asid;
>   
>   	/* read the "reg" property directly to get the relative address
>   	 * of the context bank, and calculate the asid from that:
> @@ -701,7 +703,16 @@ static int get_asid(const struct device_node *np)
>   	if (of_property_read_u32_index(np, "reg", 0, &reg))
>   		return -ENODEV;
>   
> -	return reg / 0x1000;      /* context banks are 0x1000 apart */
> +	/* Context banks are 0x1000 apart but, in some cases, the ASID
> +	 * number doesn't match to this logic and needs to be passed
> +	 * from the DT configuration explicitly.
> +	 */
> +	if (of_property_read_u32(np, "qcom,ctx-num", &val))
> +		asid = reg / 0x1000;
> +	else
> +		asid = val;
> +
> +	return asid;
>   }
>   
>   static int qcom_iommu_ctx_probe(struct platform_device *pdev)
> 
