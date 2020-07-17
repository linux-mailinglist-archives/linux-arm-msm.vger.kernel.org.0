Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F6C22310F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 04:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgGQCNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 22:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgGQCNQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 22:13:16 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF10C061755;
        Thu, 16 Jul 2020 19:13:16 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id 6so6601462qtt.0;
        Thu, 16 Jul 2020 19:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f2JKPdgb/9hZRJjwTB6zOtsvoRSAMGYehX8TUhEKf08=;
        b=DoGS1++QTCQxT8UzGH2XWCc0c5KPNKxPiUHbvd4xQA0+pBj6FyIc3Gv0VkpDQn477R
         yVwyybTW4U/i5Gre/Fy0uTTrbcAnGp5iOKXEfu0i0KgRB/lZQiDmc58pru1Y0ZCugL3i
         YKidi5oZRMCcdCroJo33WZ1+tbZopc+q+imm2IO9puatiFud3MO9P03Pm+zksnM0QJ1a
         MSu857GYiFqB1da1JPensMjH5VmFeeDAUZa8FfajJpPLAp+U8QSmf6s7ApL5utPJR1Yl
         PAEUYi10LIUGhOV3vjnGMSz1lZPGwHHjWAJb2aj2mxNnWPJZRhVCbLGAM2Fo4rdbB8et
         zJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f2JKPdgb/9hZRJjwTB6zOtsvoRSAMGYehX8TUhEKf08=;
        b=GjWFbsaFIGd6d5mAdqlzq0n8kJzYt71TlHKCyBIL3Kf6TJvLiLp0PN4VQ6xJv7K1q3
         kG23YmaInaTKfU2GV4iIWY3uE7LAZOfu85VxRINI15XCJ03Vfhfy7gnok/Y/zAPG6nz8
         fMleQALs27BaYU5584Rc1eqiR61BjCDGtjXxuPGRY+7FtZX9mEJ8H1zmBn9lOllG4pf5
         gTsfiKkIqNxFTjYlFnDcZ6IM9eeL261Kx3ZZyEcX4T+GDZ7bOSPztKMuIVhFsk+sOqGd
         hlq7LxqeMz4nLZP804LgU9k/3kkdhGWlYgDDrfHsjI7ihwc1QLCjnQCy8iHPfyvSEsd8
         dxqw==
X-Gm-Message-State: AOAM532bseZ8nhzgFTGofAxeBB1Onk/glxgjTuwWk5+Nszad44SA8LM0
        gn+Cuqfbw3ce+5qXMibEA/g=
X-Google-Smtp-Source: ABdhPJyQuxSbeRQ5xrb2oQYCV1GZiwZh9H04oau9nwukn5mMhjc8zvSQUrjlAJiDQsjFbJl1+850Uw==
X-Received: by 2002:ac8:37ac:: with SMTP id d41mr1048402qtc.294.1594951995441;
        Thu, 16 Jul 2020 19:13:15 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id 19sm8940859qke.44.2020.07.16.19.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 19:13:15 -0700 (PDT)
Date:   Thu, 16 Jul 2020 19:13:13 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: pil-info: Fix shift overflow
Message-ID: <20200717021313.GA4098480@ubuntu-n2-xlarge-x86>
References: <20200716054817.157608-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716054817.157608-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 15, 2020 at 10:48:17PM -0700, Bjorn Andersson wrote:
> On platforms with 32-bit phys_addr_t the shift to get the upper word of
> the base address of the memory region is invalid. Cast the base to 64
> bit to resolv this.
> 
> Fixes: 549b67da660d ("remoteproc: qcom: Introduce helper to store pil info in IMEM")
> Reported-by: Lee Jones <lee.jones@linaro.org>
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build

> ---
>  drivers/remoteproc/qcom_pil_info.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
> index 0536e3904669..5521c4437ffa 100644
> --- a/drivers/remoteproc/qcom_pil_info.c
> +++ b/drivers/remoteproc/qcom_pil_info.c
> @@ -108,7 +108,7 @@ int qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
>  found_existing:
>  	/* Use two writel() as base is only aligned to 4 bytes on odd entries */
>  	writel(base, entry + PIL_RELOC_NAME_LEN);
> -	writel(base >> 32, entry + PIL_RELOC_NAME_LEN + 4);
> +	writel((u64)base >> 32, entry + PIL_RELOC_NAME_LEN + 4);
>  	writel(size, entry + PIL_RELOC_NAME_LEN + sizeof(__le64));
>  	mutex_unlock(&pil_reloc_lock);
>  
> -- 
> 2.26.2
> 
