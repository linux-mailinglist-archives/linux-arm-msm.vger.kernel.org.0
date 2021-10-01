Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC5E41E800
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 09:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbhJAHKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 03:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbhJAHKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 03:10:24 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9562DC061779
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 00:08:40 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i19so31810434lfu.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 00:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d+67dZI32wvtfT/woO5CfYBNyLEC+7GhwoOQwraT6EE=;
        b=T+iko0ZvnOCFVOjzR/EupuBJ1DoSkQA0lgxYS0G9gP1D7hh54JuL9z7q3jnEKG7+mu
         ktMUZjq7C8JRlPWIq6AdKMeF2vJHzpp70p3vb5nGKIGGuso4jQH6chWx/xqksryjwJLg
         bTA7wn4Hn6B9ksg2CWU6KhXiAojJdsbHENBb+WVDMuN7GfLXztCN4/4hPKLYtPc66jdI
         8y8EN174MysT80nAsSZB3/7VaTj//JVlqgkvX+WUaeX86lPKOJa27storU8lo5nDwPEf
         UGxnfg3i4oDk3x9GxYBijePw49I8FLm3vM1tTetUSINxYXAz/DYIWqZHwDrdTu15ib/k
         B64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d+67dZI32wvtfT/woO5CfYBNyLEC+7GhwoOQwraT6EE=;
        b=t3B6kJipoa7O1HfU0QyXE6E29e0XHD6ahsnGzGWVVywNhqqx8/Ycvthz6hskQHKk5V
         OXHkJXZWOpXNaAcOIDgBFvSjNWRtfy2HMvHAHLqeSCMru+XoXrUO4NyOuQW6jt7vW6PX
         +jDR6jUJkSQhMZoA3nJnRkoMlxGdVEQUqQvw9m3+MGBdKxTHQRiNZqaxxdcv/ojMsRi7
         K1a8DP/a5najUmT0NWUwQ99QvusND75wuSCCM6925lrxEf+5o0WSG3syFbQkia3Yd05l
         l5vlpS6nGLxWDJdnIRwkTS2ENNSsSfOnQy8OvkuBM9FwU+9M6xbphIMY+au4pSkSaMuG
         dytQ==
X-Gm-Message-State: AOAM532gDgLGDICMLJmQ7JVVHlZDMwPWL2GVIQ4THAWvk9qCYYkEiTCY
        x3FTacrkU+Nwc88QLMht8G0hBg==
X-Google-Smtp-Source: ABdhPJyEo2IdYkhhcZntpK5K9ICUfn44bkyHDyERU57Jj1fA5GS/v4aJNAE9wAEb0dWr7VXBmoGWHA==
X-Received: by 2002:a2e:a54b:: with SMTP id e11mr10631275ljn.171.1633072118579;
        Fri, 01 Oct 2021 00:08:38 -0700 (PDT)
Received: from [192.168.10.17] (88-112-130-172.elisa-laajakaista.fi. [88.112.130.172])
        by smtp.gmail.com with ESMTPSA id i19sm584769ljg.92.2021.10.01.00.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 00:08:38 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] soc: qcom: smem: Support reserved-memory
 description
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
 <20210930182111.57353-4-bjorn.andersson@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <9a4ef69d-df15-0fbc-3735-6d7c861855ac@linaro.org>
Date:   Fri, 1 Oct 2021 10:08:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210930182111.57353-4-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 9/30/21 9:21 PM, Bjorn Andersson wrote:
> Practically all modern Qualcomm platforms has a single reserved-memory
> region for SMEM. So rather than having to describe SMEM in the form of a
> node with a reference to a reserved-memory node, allow the SMEM device
> to be instantiated directly from the reserved-memory node.
> 
> The current means of falling back to dereferencing the "memory-region"
> is kept as a fallback, if it's determined that the SMEM node is a
> reserved-memory node.
> 
> The "qcom,smem" compatible is added to the reserved_mem_matches list, to
> allow the reserved-memory device to be probed.
> 
> In order to retain the readability of the code, the resolution of
> resources is split from the actual ioremapping.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - None
> 
>   drivers/of/platform.c   |  1 +
>   drivers/soc/qcom/smem.c | 57 ++++++++++++++++++++++++++++-------------
>   2 files changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 32d5ff8df747..07813fb1ef37 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -505,6 +505,7 @@ EXPORT_SYMBOL_GPL(of_platform_default_populate);
>   static const struct of_device_id reserved_mem_matches[] = {
>   	{ .compatible = "qcom,rmtfs-mem" },
>   	{ .compatible = "qcom,cmd-db" },
> +	{ .compatible = "qcom,smem" },
>   	{ .compatible = "ramoops" },
>   	{ .compatible = "nvmem-rmem" },
>   	{}
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 4fb5aeeb0843..c7e519bfdc8a 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -9,6 +9,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>   #include <linux/platform_device.h>
>   #include <linux/sizes.h>
>   #include <linux/slab.h>
> @@ -240,7 +241,7 @@ static const u8 SMEM_INFO_MAGIC[] = { 0x53, 0x49, 0x49, 0x49 }; /* SIII */
>    * @size:	size of the memory region
>    */
>   struct smem_region {
> -	u32 aux_base;
> +	phys_addr_t aux_base;
>   	void __iomem *virt_base;
>   	size_t size;
>   };
> @@ -499,7 +500,7 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
>   	for (i = 0; i < smem->num_regions; i++) {
>   		region = &smem->regions[i];
>   
> -		if (region->aux_base == aux_base || !aux_base) {
> +		if ((u32)region->aux_base == aux_base || !aux_base) {
>   			if (size != NULL)
>   				*size = le32_to_cpu(entry->size);
>   			return region->virt_base + le32_to_cpu(entry->offset);
> @@ -664,7 +665,7 @@ phys_addr_t qcom_smem_virt_to_phys(void *p)
>   		if (p < region->virt_base + region->size) {
>   			u64 offset = p - region->virt_base;
>   
> -			return (phys_addr_t)region->aux_base + offset;
> +			return region->aux_base + offset;
>   		}
>   	}
>   
> @@ -863,12 +864,12 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
>   	return 0;
>   }
>   
> -static int qcom_smem_map_memory(struct qcom_smem *smem, struct device *dev,
> -				const char *name, int i)
> +static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
> +				 struct smem_region *region)
>   {
> +	struct device *dev = smem->dev;
>   	struct device_node *np;
>   	struct resource r;
> -	resource_size_t size;
>   	int ret;
>   
>   	np = of_parse_phandle(dev->of_node, name, 0);
> @@ -881,13 +882,9 @@ static int qcom_smem_map_memory(struct qcom_smem *smem, struct device *dev,
>   	of_node_put(np);
>   	if (ret)
>   		return ret;
> -	size = resource_size(&r);
>   
> -	smem->regions[i].virt_base = devm_ioremap_wc(dev, r.start, size);
> -	if (!smem->regions[i].virt_base)
> -		return -ENOMEM;
> -	smem->regions[i].aux_base = (u32)r.start;
> -	smem->regions[i].size = size;
> +	region->aux_base = r.start;
> +	region->size = resource_size(&r);
>   
>   	return 0;
>   }
> @@ -895,12 +892,14 @@ static int qcom_smem_map_memory(struct qcom_smem *smem, struct device *dev,
>   static int qcom_smem_probe(struct platform_device *pdev)
>   {
>   	struct smem_header *header;
> +	struct reserved_mem *rmem;
>   	struct qcom_smem *smem;
>   	size_t array_size;
>   	int num_regions;
>   	int hwlock_id;
>   	u32 version;
>   	int ret;
> +	int i;

Just a nitpicking, the index can be unsigned.

>   
>   	num_regions = 1;
>   	if (of_find_property(pdev->dev.of_node, "qcom,rpm-msg-ram", NULL))
> @@ -914,13 +913,35 @@ static int qcom_smem_probe(struct platform_device *pdev)
>   	smem->dev = &pdev->dev;
>   	smem->num_regions = num_regions;
>   
> -	ret = qcom_smem_map_memory(smem, &pdev->dev, "memory-region", 0);
> -	if (ret)
> -		return ret;
> +	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
> +	if (rmem) {
> +		smem->regions[0].aux_base = rmem->base;
> +		smem->regions[0].size = rmem->size;
> +	} else {
> +		/*
> +		 * Fall back to the memory-region reference, if we're not a
> +		 * reserved-memory node.
> +		 */
> +		ret = qcom_smem_resolve_mem(smem, "memory-region", &smem->regions[0]);
> +		if (ret)
> +			return ret;
> +	}
>   
> -	if (num_regions > 1 && (ret = qcom_smem_map_memory(smem, &pdev->dev,
> -					"qcom,rpm-msg-ram", 1)))
> -		return ret;
> +	if (num_regions > 1) {
> +		ret = qcom_smem_resolve_mem(smem, "qcom,rpm-msg-ram", &smem->regions[1]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i = 0; i < num_regions; i++) {
> +		smem->regions[i].virt_base = devm_ioremap_wc(&pdev->dev,
> +							     smem->regions[i].aux_base,
> +							     smem->regions[i].size);
> +		if (!smem->regions[i].virt_base) {
> +			dev_err(&pdev->dev, "failed to remap %pa\n", &smem->regions[i].aux_base);
> +			return -ENOMEM;
> +		}
> +	}
>   
>   	header = smem->regions[0].virt_base;
>   	if (le32_to_cpu(header->initialized) != 1 ||
> 

--
Best wishes,
Vladimir
