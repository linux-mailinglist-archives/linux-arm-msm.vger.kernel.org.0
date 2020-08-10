Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39538240448
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Aug 2020 11:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgHJJxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 05:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgHJJxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 05:53:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50EAC061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2020 02:53:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x5so7093456wmi.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2020 02:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=055yTlti7CSqkzeroMGhpLzAQUVt92U42Qi8+kNmwB0=;
        b=d4KQ5oRdaofLU1bS4195phRtm9IAhil1g45TpyJMNsdsqg9rxuavma5WVjCNEr1Zby
         z910xrANOJ4593ID/khi4HdCBkN3BkHQxLppjFpdekEbZlr0UmA2YeaWg5uWqyON4T/d
         JDa/s/FMyO8lTkSCFDq8dvdWeIhIOwhsR1TYo42BHdv47WAIQCziVv4Pq+MD6oE8bnvE
         5JBAneHgPQzf57ZiEJ/z2GnRUBRVAxiQkgvL9IphvbAiXwoBQontkQVdmnrMVMAL3zRp
         dX6zGbWm+kMdkyPmTv7zp6lEnjG3JrgXdkzsrDofj7DyBfGfjNCkphX5aqtcaZ36s7gC
         ci5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=055yTlti7CSqkzeroMGhpLzAQUVt92U42Qi8+kNmwB0=;
        b=YH148hpY3/kKIRuovq28AVk8oUy/nUR0pabIt8nlVeJSjON2kYbylo+CMGKIhFbYhr
         sfZqZ4KPMqKaVfVjBDgRKI0yDvxI+WO5zyYonYc3w1crRt2MMQkOQ/tMgYKuqYlJmLCQ
         R1wbtU+7RUYN8MsXq2wcH5sfa+WV+dBRdzNhP0AUTqXXayqX2Snd1R+ttZC0PzgjgNqw
         iBVTWalljwk2ni+6Rb5OhlNB0uihxQQPDyDSAvqj4bFxxeboYpTS3XMbgs/ZDRLykuMs
         GzU5+oR7uH1FN6jJroR+voPhUxPliyCKiysdQGgnD88n4ItxKO+9DftLEyxEHdXHx1gU
         +50g==
X-Gm-Message-State: AOAM533uE8WTqHWeGh3oAklcx7gm5KOd4htXtDvPAAKfxOCsT7weKVL8
        2/rOUSt9buVFZ26SrqFENOb/zcU9abyRyg==
X-Google-Smtp-Source: ABdhPJwikbZKK9ubEvMqGCCPHbnvwK98mxtTA4C1Br04cBnP5baqbt9HPXi/KVHqHqnR3TT6ylMaUg==
X-Received: by 2002:a05:600c:290a:: with SMTP id i10mr26034717wmd.175.1597053207844;
        Mon, 10 Aug 2020 02:53:27 -0700 (PDT)
Received: from [192.168.1.8] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id 62sm20736508wrq.31.2020.08.10.02.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2020 02:53:27 -0700 (PDT)
Subject: Re: [RESEND 3/3] venus: handle use after free for
 iommu_map/iommu_unmap
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1596781478-12216-1-git-send-email-mansur@codeaurora.org>
 <1596781478-12216-4-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c16db389-cdba-0735-a25e-8d5063d998cf@linaro.org>
Date:   Mon, 10 Aug 2020 12:53:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596781478-12216-4-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/7/20 9:24 AM, Mansur Alisha Shaik wrote:
> In concurrency usecase and reboot scenario we are trying
> to map fw.iommu_domain which is already unmapped during

I guess you want to say "to unmap iommu domain which is already unmapped" ?

> shutdown. This is causing NULL pointer dereference crash.
> 
> This case is handled by adding necessary checks.
> 
> Call trace:
>  __iommu_map+0x4c/0x348
>  iommu_map+0x5c/0x70
>  venus_boot+0x184/0x230 [venus_core]
>  venus_sys_error_handler+0xa0/0x14c [venus_core]
>  process_one_work+0x210/0x3d0
>  worker_thread+0x248/0x3f4
>  kthread+0x11c/0x12c
>  ret_from_fork+0x10/0x18
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 8801a6a..c427e88 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -171,9 +171,14 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>  
>  	iommu = core->fw.iommu_domain;
>  
> -	unmapped = iommu_unmap(iommu, VENUS_FW_START_ADDR, mapped);
> -	if (unmapped != mapped)
> -		dev_err(dev, "failed to unmap firmware\n");
> +	if (core->fw.mapped_mem_size && iommu) {
> +		unmapped = iommu_unmap(iommu, VENUS_FW_START_ADDR, mapped);
> +
> +		if (unmapped != mapped)
> +			dev_err(dev, "failed to unmap firmware\n");
> +		else
> +			core->fw.mapped_mem_size = 0;
> +	}
>  
>  	return 0;
>  }
> @@ -288,7 +293,11 @@ void venus_firmware_deinit(struct venus_core *core)
>  	iommu = core->fw.iommu_domain;
>  
>  	iommu_detach_device(iommu, core->fw.dev);
> -	iommu_domain_free(iommu);
> +
> +	if (core->fw.iommu_domain) {
> +		iommu_domain_free(iommu);
> +		core->fw.iommu_domain = NULL;
> +	}
>  
>  	platform_device_unregister(to_platform_device(core->fw.dev));
>  }
> 

-- 
regards,
Stan
