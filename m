Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58671393EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 10:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236179AbhE1I1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 04:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236365AbhE1I1d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 04:27:33 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E357C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 01:25:50 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l11-20020a05600c4f0bb029017a7cd488f5so1930357wmq.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 01:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gmLVVcZ2N+hglXJfzP+ki9yu4ta4AFOaHMScj05dW+U=;
        b=YAoqpL3LdNFFopz1uasqeeJnfrbce4oZDKGeD6db3hOHwdYp53iI0duwXQPztv/GmE
         I4Hh2K/TgdG3sQ0vRDGJ9+Bs9YHQugHmPnachfpNqJMkKPxksAlUQ2NNN+lmSrk3cUZV
         7VAgHwYTKt3ZhhNKuEON3ehfNGPv5svHxhundcdkdkoFl5DwSlf2MSV/R0bo9Zq3rIUo
         t1OamaJklC1WVQi2NNH3C8fDmCi+kiFqcv4Z38re8XgG5k9pgM4D2Trv0qksR/rSE0Wi
         fz8yLrSR0SeqAk2ruBTFnzRswveADYPx7UdhJIGBDeCkgqJkfnXGPIAENj4C3tO3uhLg
         ubcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gmLVVcZ2N+hglXJfzP+ki9yu4ta4AFOaHMScj05dW+U=;
        b=VQMShko4NkrVNTEHnydR8N1MWMRVH4rZW7AiuU+vSfneXVTzcLPcCBw+mj2/O+DKaY
         xAmM/u7I3LW11WzMbh1oLS7fmz6+y920XQgs0BAi8cCfXvPh8z7usj7JNUfW5zNXBfCz
         tbXnkycTJPeNpW40wWj2zAWBcJeUtwt7lvdmyltMvFl3aYPm7nc9Ea9DzUMUIwG8lMP7
         Lqlg3DMyjpoNcJyA2yvICC5PS5N/JFI/q+4xjsZ4T2YNyl9/hs24nr3fzj+XK7+cEHxS
         Gj77NhjqiQnXwOGZ162CGmeCMh6/OKe++k4XciuArEvAgf40eMuVvZTsOWEixmIszp6b
         Ss5g==
X-Gm-Message-State: AOAM533hSZXc2BbiYzlt6cF+GNiZhx5wxh80gpQ0Cc56jrXhGvLZmil1
        BMyzZRtgPzbDYjPZ/U0x495Wjg==
X-Google-Smtp-Source: ABdhPJx8E7fPHSUVSThV6qHpCVgZr326Eid66C+rC24e58hcLs6jPFnhaUX9sTcHUVNoyX9aVvHSDA==
X-Received: by 2002:a05:600c:358f:: with SMTP id p15mr12336004wmq.14.1622190348852;
        Fri, 28 May 2021 01:25:48 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id 60sm6300907wrq.14.2021.05.28.01.25.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 May 2021 01:25:48 -0700 (PDT)
Subject: Re: [PATCH 1/2] nvmem: core: constify
 nvmem_cell_read_variable_common() return value
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <20210521140031.1.Ibaca694aedfaff823feefa06b29ae746c641dd1a@changeid>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <269ec480-e4b8-30c8-db3d-f45095fa1d46@linaro.org>
Date:   Fri, 28 May 2021 09:25:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210521140031.1.Ibaca694aedfaff823feefa06b29ae746c641dd1a@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21/05/2021 22:00, Douglas Anderson wrote:
> The caller doesn't modify the memory pointed to by the pointer so it
> can be const.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 

Applied both thanks,

--srini
>   drivers/nvmem/core.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index f9c9c9859919..4868aa876e1b 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -1609,9 +1609,9 @@ int nvmem_cell_read_u64(struct device *dev, const char *cell_id, u64 *val)
>   }
>   EXPORT_SYMBOL_GPL(nvmem_cell_read_u64);
>   
> -static void *nvmem_cell_read_variable_common(struct device *dev,
> -					     const char *cell_id,
> -					     size_t max_len, size_t *len)
> +static const void *nvmem_cell_read_variable_common(struct device *dev,
> +						   const char *cell_id,
> +						   size_t max_len, size_t *len)
>   {
>   	struct nvmem_cell *cell;
>   	int nbits;
> @@ -1655,7 +1655,7 @@ int nvmem_cell_read_variable_le_u32(struct device *dev, const char *cell_id,
>   				    u32 *val)
>   {
>   	size_t len;
> -	u8 *buf;
> +	const u8 *buf;
>   	int i;
>   
>   	buf = nvmem_cell_read_variable_common(dev, cell_id, sizeof(*val), &len);
> @@ -1686,7 +1686,7 @@ int nvmem_cell_read_variable_le_u64(struct device *dev, const char *cell_id,
>   				    u64 *val)
>   {
>   	size_t len;
> -	u8 *buf;
> +	const u8 *buf;
>   	int i;
>   
>   	buf = nvmem_cell_read_variable_common(dev, cell_id, sizeof(*val), &len);
> 
