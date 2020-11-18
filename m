Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94ACB2B8372
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 18:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgKRR6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 12:58:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgKRR6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 12:58:19 -0500
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70826C061A48
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 09:58:18 -0800 (PST)
Received: by mail-oo1-xc44.google.com with SMTP id 123so648298ooi.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 09:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ype8c0rhDFgZ75ftBGay9s36wJiNcNYG5bOFvh9dHc8=;
        b=bRZdlXx5hBOzDd132mrm/QxucR8+0v+UBvSaXStZNTg6EWimeL6IFua12EeoiEwndp
         L8yTZWpP5ydWcqCsOm8BpWwIUoL/ZympVQQXXgGLW0prlhycx99+BVzZq5dWveiRlIxk
         SFoZZ7+b1UdgOD1z0o/6sw5i+0RQVYLcQyjvcYinlEzbyC22gYGmD6F8xU4gKxwvo+tl
         b6sdSPXoetLaFlXC0Ipsk0Upi8F2ghO4w6OAQwzvHE7bcxHz6qlwTqQkGCMCUWtrKCf6
         vYMPZfVjIYJV+ZYXYpDVySRZ6lP96MLigaT7rgHQNMyC9+VQyT1SC0Jo+MR3PQNCtLiM
         qUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ype8c0rhDFgZ75ftBGay9s36wJiNcNYG5bOFvh9dHc8=;
        b=Z3ya3t1M6L2pKjCv0zGSZ57xSrURQZ6HjLHFMVQm6xX82Rzs6Tji5xOkLKYdRbxFL7
         e832qjdh7NzuEKMokEX8hXcMPmoaTstwZWkLrG3t8K+aaC4lfLLS5O9DUkIK4fOu7hY5
         5BC8DpElrpGnLNUIP+RA8AXNaZBjDXhllpWkjmg9R/sAxlGUVkCf8D5lcaoGTNYoj8Da
         XkzWdSgWHWD/KqF2P5IcuoRV0XJ0ik+e+y3QtJwG/ISGfKbnh8EWwHBKkQtRrVvbCuqW
         hb11yNS+smFXNcgrOeTJGYw0eE3Od046Dtl+O3U3tBg0NXBpaWabJnGIO5Ddi17WxqMo
         2ehQ==
X-Gm-Message-State: AOAM5307bKrxPH+GHBlJ9Oe8exW5Q+usfOTJAFgrx2Ar97o0a5qcDO5g
        RpD5MdUXbefmMVn9QXjaEhohkg==
X-Google-Smtp-Source: ABdhPJyPQg27yiEWaOCyMrK+70i4GG+36VSaQ/+Nl4DzQ6kXvkBpetR7ZAG5EVjcqS0Yg1YaJv/ZbA==
X-Received: by 2002:a4a:c4c7:: with SMTP id g7mr7122549ooq.50.1605722297630;
        Wed, 18 Nov 2020 09:58:17 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c6sm58938oif.48.2020.11.18.09.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 09:58:16 -0800 (PST)
Date:   Wed, 18 Nov 2020 11:58:15 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, evgreen@chromium.org
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Replace ioremap with
 memremap
Message-ID: <20201118175815.GE9177@builder.lan>
References: <1604473422-29639-1-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604473422-29639-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 04 Nov 01:03 CST 2020, Sibi Sankar wrote:

> Fix the sparse warnings reported by the kernel test bot by replacing
> ioremap calls with memremap.
> 
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> I'll send out the patches to convert ioremap to memremap on other
> qc remoteproc drivers once I get a chance to test them.
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 9a473cfef758..2c866b6da23c 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1194,7 +1194,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			goto release_firmware;
>  		}
>  
> -		ptr = ioremap_wc(qproc->mpss_phys + offset, phdr->p_memsz);
> +		ptr = memremap(qproc->mpss_phys + offset, phdr->p_memsz, MEMREMAP_WC);
>  		if (!ptr) {
>  			dev_err(qproc->dev,
>  				"unable to map memory region: %pa+%zx-%x\n",
> @@ -1209,7 +1209,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  					"failed to load segment %d from truncated file %s\n",
>  					i, fw_name);
>  				ret = -EINVAL;
> -				iounmap(ptr);
> +				memunmap(ptr);
>  				goto release_firmware;
>  			}
>  
> @@ -1221,7 +1221,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  							ptr, phdr->p_filesz);
>  			if (ret) {
>  				dev_err(qproc->dev, "failed to load %s\n", fw_name);
> -				iounmap(ptr);
> +				memunmap(ptr);
>  				goto release_firmware;
>  			}
>  
> @@ -1232,7 +1232,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			memset(ptr + phdr->p_filesz, 0,
>  			       phdr->p_memsz - phdr->p_filesz);
>  		}
> -		iounmap(ptr);
> +		memunmap(ptr);
>  		size += phdr->p_memsz;
>  
>  		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> @@ -1299,11 +1299,11 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  	}
>  
>  	if (!ret)
> -		ptr = ioremap_wc(qproc->mpss_phys + offset + cp_offset, size);
> +		ptr = memremap(qproc->mpss_phys + offset + cp_offset, size, MEMREMAP_WC);
>  
>  	if (ptr) {
>  		memcpy(dest, ptr, size);
> -		iounmap(ptr);
> +		memunmap(ptr);
>  	} else {
>  		memset(dest, 0xff, size);
>  	}
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
