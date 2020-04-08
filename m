Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D57C81A19D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 04:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgDHCKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 22:10:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35143 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgDHCKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 22:10:24 -0400
Received: by mail-pl1-f195.google.com with SMTP id c12so1966288plz.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 19:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=llZYQXXqU5Is0VJnRXNm129Q3H4mwJYv5x9pxHU6sEU=;
        b=ujB3FST3/btwcbtEiVAW8jmd/Tsxe4kw8U4PXl31okBUQlWLYlXCdNzaK1/wikMOF2
         86gFD9SC08AM9+d1r8p//Y8eZql33WXFo9nqmx25c++1UT+4f9uT6HAiQzgU6Oiw1h50
         vnJqpJ96hVR1NZmgndeEI3y7O2taKXrEuiwfiGCGZW+puaFlViRTjDy7zgBnAD1kfrRm
         4cfbQRWO1MWzGwiHKCI2AFS3QFqDkkdTJHvz+AsY3oUy9YOpUjbuQJ9fVW1vxyxAp6ei
         rzWb15r/3RkEIN4kdLZ9689qDi6mrTBB2BZvpBnm8XUFRQbUajrjP4TeVH2lnY0l+5hW
         B6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=llZYQXXqU5Is0VJnRXNm129Q3H4mwJYv5x9pxHU6sEU=;
        b=aN/BE4eun1kxKL1thGuDqd0Q0jZqndq7BKEGRxZJhW0kKggp13742801eMS9L0u9Qe
         w2/dj7Aql8xx5FmIUQnz11CS2SFukUuShpYO6RNXa8xld8avDp8gbB0Cz/2FsKIIIJKZ
         ylV5JHD4IJ6xLgaBP/J8QnQTuKrTkhs5PyvZnRocFE+QqoyjTaA5Vm6PshiPajBUNCEa
         DjdKGXd4oSddkkHVHWL+avnMtg2D5Bh+hRweI5jc6KzRNj1OkB4Qle63GtiLtQ53Gn6M
         svE9Y2wmEV31aLqh41YgPxoXcbpEwj1DXO8Adg6IboTBscAX6j8m8dkkDZGQV+x/voi0
         XiQQ==
X-Gm-Message-State: AGi0PuZulS4e3drtZCH38ImHRseq8b6gW3G7DREK4KEbdQyOfrJY59rZ
        ThAf4Szcax7GILBd3yyc/Pc4EQ==
X-Google-Smtp-Source: APiQypJQ3iDNyu385MVVkdL+enzXHH2dgzHabPfKEdhdX8ju7kzJ9igc7s+KIm4A36x2QVrraViTPg==
X-Received: by 2002:a17:90a:fa17:: with SMTP id cm23mr2574173pjb.121.1586311821434;
        Tue, 07 Apr 2020 19:10:21 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d14sm15208899pfq.29.2020.04.07.19.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 19:10:20 -0700 (PDT)
Date:   Tue, 7 Apr 2020 19:10:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: map/unmap mpss region
 before/after use
Message-ID: <20200408021026.GP20625@builder.lan>
References: <20200317191918.4123-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317191918.4123-1-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 17 Mar 12:19 PDT 2020, Sibi Sankar wrote:

> The application processor accessing the mpss region when the Q6 modem
> is running will lead to an XPU violation. Fix this by un-mapping the
> mpss region post copy during processor out of reset sequence and
> coredumps.
> 

Does this problem not apply to the "mba" region?

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 53 ++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index ce49c3236ff7c..b1ad4de179019 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -196,7 +196,6 @@ struct q6v5 {
>  
>  	phys_addr_t mpss_phys;
>  	phys_addr_t mpss_reloc;
> -	void *mpss_region;
>  	size_t mpss_size;
>  
>  	struct qcom_rproc_glink glink_subdev;
> @@ -1061,6 +1060,18 @@ static int q6v5_reload_mba(struct rproc *rproc)
>  	return ret;
>  }
>  
> +static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +{
> +	struct q6v5 *qproc = rproc->priv;
> +	int offset;
> +
> +	offset = da - qproc->mpss_reloc;
> +	if (offset < 0 || offset + len > qproc->mpss_size)
> +		return NULL;
> +
> +	return devm_ioremap_wc(qproc->dev, qproc->mpss_phys + offset, len);

This function isn't expected to have side effects.

So I think you should add the ioremap/iounmap to the beginning/end of
mpss_load and the dump_segment directly instead.

> +}
> +
>  static int q6v5_mpss_load(struct q6v5 *qproc)
>  {
>  	const struct elf32_phdr *phdrs;
> @@ -1156,7 +1167,11 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			goto release_firmware;
>  		}
>  
> -		ptr = qproc->mpss_region + offset;
> +		ptr = q6v5_da_to_va(qproc->rproc, phdr->p_paddr, phdr->p_memsz);

rproc_da_to_va() here.

> +		if (!ptr) {
> +			dev_err(qproc->dev, "failed to map memory\n");

Now this will be able to fail, so you should add this error handling
snippet, just with a slightly different message.

> +			goto release_firmware;
> +		}
>  
>  		if (phdr->p_filesz && phdr->p_offset < fw->size) {
>  			/* Firmware is large enough to be non-split */
> @@ -1165,6 +1180,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  					"failed to load segment %d from truncated file %s\n",
>  					i, fw_name);
>  				ret = -EINVAL;
> +				devm_iounmap(qproc->dev, ptr);
>  				goto release_firmware;
>  			}
>  
> @@ -1175,6 +1191,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			ret = request_firmware(&seg_fw, fw_name, qproc->dev);
>  			if (ret) {
>  				dev_err(qproc->dev, "failed to load %s\n", fw_name);
> +				devm_iounmap(qproc->dev, ptr);
>  				goto release_firmware;
>  			}
>  
> @@ -1187,6 +1204,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			memset(ptr + phdr->p_filesz, 0,
>  			       phdr->p_memsz - phdr->p_filesz);
>  		}
> +		devm_iounmap(qproc->dev, ptr);

Move this to the end an unmap the entire thing.

And generally, please avoid devm for things where you manually unmap.

Regards,
Bjorn

>  		size += phdr->p_memsz;
>  
>  		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> @@ -1236,7 +1254,7 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  	int ret = 0;
>  	struct q6v5 *qproc = rproc->priv;
>  	unsigned long mask = BIT((unsigned long)segment->priv);
> -	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
> +	void *ptr = NULL;
>  
>  	/* Unlock mba before copying segments */
>  	if (!qproc->dump_mba_loaded) {
> @@ -1250,10 +1268,15 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  		}
>  	}
>  
> -	if (!ptr || ret)
> -		memset(dest, 0xff, segment->size);
> -	else
> +	if (!ret)
> +		ptr = rproc_da_to_va(rproc, segment->da, segment->size);
> +
> +	if (ptr) {
>  		memcpy(dest, ptr, segment->size);
> +		devm_iounmap(qproc->dev, ptr);
> +	} else {
> +		memset(dest, 0xff, segment->size);
> +	}
>  
>  	qproc->dump_segment_mask |= mask;
>  
> @@ -1327,18 +1350,6 @@ static int q6v5_stop(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
> -{
> -	struct q6v5 *qproc = rproc->priv;
> -	int offset;
> -
> -	offset = da - qproc->mpss_reloc;
> -	if (offset < 0 || offset + len > qproc->mpss_size)
> -		return NULL;
> -
> -	return qproc->mpss_region + offset;
> -}
> -
>  static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
>  					    const struct firmware *mba_fw)
>  {
> @@ -1595,12 +1606,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  
>  	qproc->mpss_phys = qproc->mpss_reloc = r.start;
>  	qproc->mpss_size = resource_size(&r);
> -	qproc->mpss_region = devm_ioremap_wc(qproc->dev, qproc->mpss_phys, qproc->mpss_size);
> -	if (!qproc->mpss_region) {
> -		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
> -			&r.start, qproc->mpss_size);
> -		return -EBUSY;
> -	}
>  
>  	return 0;
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
