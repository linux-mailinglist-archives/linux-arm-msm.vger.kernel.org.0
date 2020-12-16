Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9912DC68F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 19:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731048AbgLPSdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 13:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731043AbgLPSdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 13:33:36 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D934C061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 10:32:56 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id s2so28614738oij.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 10:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TOKrfljSwb0iquFcwhx16t0mlmb8z327F7siyfgd+Io=;
        b=yd2cqrPLfduV1Hea+fTiIe+/9IkIEb6MKlQIilXuDL4916KjY5zK/R3iTzbUDPdN6Y
         LRpSlA9st56gL6Hpw+u8O3sPlKB3aPyOu+Tghlrzn7j/4DOYqGl04UCbHqdMK2uLSxT4
         zyEt0D4fi6/beYoXjvEb/zDZxfQhTFOKvIvtowB7eJR5cdFUU58CN7uHi8VhlrTK2IwF
         da7AZZCsYZajEZ1Q9gV1DS4TMYLt1MwuFWJ6MdTtovrbdDiJON9cJY8fEFdmQISS2mpL
         2pHMd83p47SRJN0l95Nc3w6SFV76WZR9gnVQCx+IP1Thu++ADUU8fhlRCLtoxYZSa0bK
         VOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TOKrfljSwb0iquFcwhx16t0mlmb8z327F7siyfgd+Io=;
        b=Y3aJHNAdz5p0DbL188B+tG8NrF3TO6HXD8mltILxYccBcvkiPFu+boZsomPtkxgcEK
         FCrKlNSASuOEOCBXL+VDGBXnYGZl9t4qir3isS6RbzTL7UxUfMlumG9NC7II/va/e2I5
         UzOi8mispvBrHVvD1Jk0g/5gIM5dZR9JwwyvzyjV0kvc+j2UdXutiJO6sAxQmYSAuW8p
         sHUXoCgMAHRbvDlOjM6Vstl5uhoVkPgjMcEh1JWaRp3OQd99pvDFE1H41YVwpf4umBeR
         c1qdwiAH4JrLIb3pTc1qvhDqd/zbD6hVsiqho/pIGLrm0/W5oiPblpa4C7fCSg8Jo737
         NuQQ==
X-Gm-Message-State: AOAM532/l3W2Z1fStqfoBn1uwkAeJAc/Oa4yisldfwwrm/mAl+SJPY7z
        9TA0UGvy+1ZCEaEuN2c+ZzMyFg==
X-Google-Smtp-Source: ABdhPJwRU+MItydmtpCEjuBcCjGgBaYAvNj1wCz3tWiuHYbakckuOaLYeu9+147ay8nGxmUWevswhQ==
X-Received: by 2002:aca:c0c6:: with SMTP id q189mr2738473oif.178.1608143575260;
        Wed, 16 Dec 2020 10:32:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z63sm615486otb.20.2020.12.16.10.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 10:32:54 -0800 (PST)
Date:   Wed, 16 Dec 2020 12:32:52 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     agross@kernel.org, dan.j.williams@intel.com, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] qcom: bam_dma: Delete useless kfree code
Message-ID: <X9pS1F91OxYMCMpI@builder.lan>
References: <20201216130649.13979-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216130649.13979-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 16 Dec 07:06 CST 2020, Zheng Yongjun wrote:

> The parameter of kfree function is NULL, so kfree code is useless, delete it.
> Therefore, goto expression is no longer needed, so simplify it.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/dma/qcom/bam_dma.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 4eeb8bb27279..78df217b3f6c 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -630,7 +630,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
>  			     GFP_NOWAIT);
>  
>  	if (!async_desc)
> -		goto err_out;
> +		return NULL;
>  
>  	if (flags & DMA_PREP_FENCE)
>  		async_desc->flags |= DESC_FLAG_NWD;
> @@ -670,10 +670,6 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
>  	}
>  
>  	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
> -
> -err_out:
> -	kfree(async_desc);
> -	return NULL;
>  }
>  
>  /**
> -- 
> 2.22.0
> 
