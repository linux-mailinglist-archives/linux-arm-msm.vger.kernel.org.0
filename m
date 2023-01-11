Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1DF665AE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 12:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbjAKL7L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 06:59:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbjAKL6m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 06:58:42 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617B811807
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 03:54:35 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id h192so10352802pgc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 03:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tuGrfA5ZoduC+U+/Dzm1vbrMa/DrUpFo/Mb/KBOiJyM=;
        b=sOllFDqSKsIoThCO+osFfVByaPssK7iEgoU4esNxabUirE3T+YG56eghykRrD2xDa5
         q1tjRUhN9ty6cOd7Oniuf4yIqhQj91RrpiIey7LXJtyAwufTMdEU/KYoA17FwvqbYPHT
         tLGcXeUONqUkwEwOk0qbOLJu3c47ogLOIkDaXI3mdc7je6OByPPA3b4VCbmGVxS7WiVS
         4qLD1WewLDU+YQM4XRy9nk54RNun9OCu8N1/dFroexPbPNBSMoSdKerJB0YNka0I/The
         y7TNmG/hFsgaTr6ycQh0pa+nlTJpGt8q7OOHSj5g15DYbCbIGV3phMuIRPE8GpRuKOHq
         zS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuGrfA5ZoduC+U+/Dzm1vbrMa/DrUpFo/Mb/KBOiJyM=;
        b=S2dC39DjuLy2GBlyObdvAPCc1X3MIJBd7swQmhEeZoK8jkDgHqrI78+4w+9oN5Fzh4
         Al1FgyOYKKlo9EtxeBDUlSh5EZ2g9Epe025TJgJWobQM84MzErW/C/aV8LJuVJ0zEqjN
         r0qqCkQUL7E5B96Zpd1rwyOvFzjsheOKg3EhsRGA+1wN7E7dnwjDPiG82fvuy7PJ1huL
         7IH6Oeg4mbF1HruLIi3TdaZLHHNPWjAhVkI9W23ghHmAQu0vEUGc3RLYXIs5JiWnkMYq
         xouTeSaHOJg5jahPIIhWG0oNpMugyefshQQN0mo0AOH3rLvX9aLjGx4YhnZHZ8gF9qUS
         aF/g==
X-Gm-Message-State: AFqh2kr+MTb6amoAfr5CkMmO0XID5W95e2P4m7mQkwWN7xXJjewwKD8u
        G2zQDyDtgDYnhbNBHXBpxR6A
X-Google-Smtp-Source: AMrXdXuY9rd2COIMugVCP6lJlrYfIZlsthTobcvWr8ibx9VwPpGiaIJ8pVuZWWivHpqXmFj28CQEKw==
X-Received: by 2002:a62:6001:0:b0:582:33b4:4c57 with SMTP id u1-20020a626001000000b0058233b44c57mr1981705pfb.33.1673438074810;
        Wed, 11 Jan 2023 03:54:34 -0800 (PST)
Received: from thinkpad ([117.217.177.1])
        by smtp.gmail.com with ESMTPSA id g28-20020aa79ddc000000b00575b6d7c458sm9853146pfq.21.2023.01.11.03.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 03:54:33 -0800 (PST)
Date:   Wed, 11 Jan 2023 17:24:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, konrad.dybcio@somainline.org,
        amit.pundir@linaro.org, regressions@leemhuis.info,
        sumit.semwal@linaro.org, will@kernel.org, catalin.marinas@arm.com,
        robin.murphy@arm.com
Subject: Re: [PATCH V3 05/10] remoteproc: qcom_q6v5_mss: Use a carveout to
 authenticate modem headers
Message-ID: <20230111115422.GD4873@thinkpad>
References: <20230111114337.24782-1-quic_sibis@quicinc.com>
 <20230111114337.24782-6-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111114337.24782-6-quic_sibis@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 11, 2023 at 05:13:32PM +0530, Sibi Sankar wrote:
> Any access to the dynamically allocated metadata region by the application
> processor after assigning it to the remote Q6 will result in a XPU
> violation. Fix this by replacing the dynamically allocated memory region
> with a no-map carveout and unmap the modem metadata memory region before
> passing control to the remote Q6.
> 
> Reported-and-tested-by: Amit Pundir <amit.pundir@linaro.org>
> Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> 
> v3:
>  * Drop revert no_kernel_mapping since it's already on the list [Mani]

I thought you are going to include Christoph's patch into your series. That way
all the patches will be in the same series, makig life easier for Bjorn.

Thanks,
Mani

>  * kfree metadata from the branch for parity
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 48 ++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index e2f765f87ec9..e25d44e20ae7 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -215,6 +215,7 @@ struct q6v5 {
>  	size_t mba_size;
>  	size_t dp_size;
>  
> +	phys_addr_t mdata_phys;
>  	phys_addr_t mpss_phys;
>  	phys_addr_t mpss_reloc;
>  	size_t mpss_size;
> @@ -973,15 +974,29 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw,
>  	if (IS_ERR(metadata))
>  		return PTR_ERR(metadata);
>  
> -	ptr = dma_alloc_attrs(qproc->dev, size, &phys, GFP_KERNEL, dma_attrs);
> -	if (!ptr) {
> -		kfree(metadata);
> -		dev_err(qproc->dev, "failed to allocate mdt buffer\n");
> -		return -ENOMEM;
> +	if (qproc->mdata_phys) {
> +		phys = qproc->mdata_phys;
> +		ptr = memremap(qproc->mdata_phys, size, MEMREMAP_WC);
> +		if (!ptr) {
> +			kfree(metadata);
> +			dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
> +				&qproc->mdata_phys, size);
> +			return -EBUSY;
> +		}
> +	} else {
> +		ptr = dma_alloc_attrs(qproc->dev, size, &phys, GFP_KERNEL, dma_attrs);
> +		if (!ptr) {
> +			kfree(metadata);
> +			dev_err(qproc->dev, "failed to allocate mdt buffer\n");
> +			return -ENOMEM;
> +		}
>  	}
>  
>  	memcpy(ptr, metadata, size);
>  
> +	if (qproc->mdata_phys)
> +		memunmap(ptr);
> +
>  	/* Hypervisor mapping to access metadata by modem */
>  	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
>  	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, true,
> @@ -1010,7 +1025,8 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw,
>  			 "mdt buffer not reclaimed system may become unstable\n");
>  
>  free_dma_attrs:
> -	dma_free_attrs(qproc->dev, size, ptr, phys, dma_attrs);
> +	if (!qproc->mdata_phys)
> +		dma_free_attrs(qproc->dev, size, ptr, phys, dma_attrs);
>  	kfree(metadata);
>  
>  	return ret < 0 ? ret : 0;
> @@ -1893,6 +1909,26 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  	qproc->mpss_phys = qproc->mpss_reloc = r.start;
>  	qproc->mpss_size = resource_size(&r);
>  
> +	if (!child) {
> +		node = of_parse_phandle(qproc->dev->of_node, "memory-region", 2);
> +	} else {
> +		child = of_get_child_by_name(qproc->dev->of_node, "metadata");
> +		node = of_parse_phandle(child, "memory-region", 0);
> +		of_node_put(child);
> +	}
> +
> +	if (!node)
> +		return 0;
> +
> +	ret = of_address_to_resource(node, 0, &r);
> +	of_node_put(node);
> +	if (ret) {
> +		dev_err(qproc->dev, "unable to resolve metadata region\n");
> +		return ret;
> +	}
> +
> +	qproc->mdata_phys = r.start;
> +
>  	return 0;
>  }
>  
> -- 
> 2.17.1
> 

-- 
மணிவண்ணன் சதாசிவம்
