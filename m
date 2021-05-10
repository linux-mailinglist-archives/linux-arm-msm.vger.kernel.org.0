Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDCE6379078
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 16:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235134AbhEJOUN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 10:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbhEJORt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 10:17:49 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93300C061379
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 06:54:48 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id b25so24619232eju.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N/tsR4FPpi1SMa4JphRzoqbRD642hzPRhRehPxfLE8I=;
        b=FPrJVgd7V/a2zz2Q0otP08sQFNf/w1p+kVWgnWsOnyKsYCck2v8rIeWPnFO2FuYhuI
         bE2RHp92aBVZ6n4NZ4rz7Kg1aiRJQf2/EXF+OlgXmVhxhlDFQeVASC/NuoaNhQqd4y6K
         eEZ8IpC6c0yXpubstKGcroxL6vZ6Vvg8920GalWCq/BAbUgMSK848W/e0xXI2u/FF2Wc
         vANQekUzQlLLjYdwyGc9ID0Y9UiqrbpgiS4rGltEP4GlJtAZjO6YoErvirmwVdb5eScx
         M4rjJzY1C/75EVAd9XX9gBT+1w5poDKuWYut+ufz8O3zndjtkL57z4F9xiAxX410Kq4V
         bYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N/tsR4FPpi1SMa4JphRzoqbRD642hzPRhRehPxfLE8I=;
        b=IwtXKg3Fao8b35dTV7GmvOyCPQmRSCUYpUDcPwh23g+gyMGbTngcIrNyn59mk/Cits
         x62IUGhfZ3Wh/vSk3+fkwi7pncyHU9I2zZJtiEElo08IPvisUZ8liRoJlnJEjaC+sY7k
         kXVa8/e/Jpw8XAEXxk16ehkH0uDyLGMmEA5ih+z63kXMscixrzQXL5SGdyocPXwxixm5
         t0ulQz3B0K/kL818JbftMOPdKjhL7hiI8ncx8XPkKNe7Gn7CFaxlI8Yu0TxfAzNX/ZXm
         ar+rn5Wr0FsXS2Z1xmXbP3GLWClVukScc2TtOHGwVvR0anMBnuP3xfwmDcYAaScz3KfA
         s4eA==
X-Gm-Message-State: AOAM5303Xw3qY3W7oDIM8mLuKpdu4vKEyIJziy7lyJm2es5GTrBqIruM
        X/miJ+QG8/XaYLxeK0CbuLxb9A==
X-Google-Smtp-Source: ABdhPJx4OsN4bcqkQbOKWXhTyPn2+tTamYNiif8kVzvyu0hItzjNmFGr6lyBRCAfCvz2Y20of3O3mQ==
X-Received: by 2002:a17:906:4809:: with SMTP id w9mr22916796ejq.401.1620654887266;
        Mon, 10 May 2021 06:54:47 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id v14sm11444780edx.5.2021.05.10.06.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 06:54:46 -0700 (PDT)
Subject: Re: [PATCH v5 13/25] media: venus: core: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
 <492e148ae1c7b0a8858c1670037925d3e4adb719.1620314616.git.mchehab+huawei@kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <adb102ab-c197-fdc8-4858-5683bd97baf4@linaro.org>
Date:   Mon, 10 May 2021 16:54:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <492e148ae1c7b0a8858c1670037925d3e4adb719.1620314616.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/6/21 6:25 PM, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Tested-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index c7e1ebec47ee..d0fddf5e9a69 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -990,9 +990,8 @@ static int core_power_v4(struct venus_core *core, int on)
>  
>  	if (on == POWER_ON) {
>  		if (pmctrl) {
> -			ret = pm_runtime_get_sync(pmctrl);
> +			ret = pm_runtime_resume_and_get(pmctrl);
>  			if (ret < 0) {
> -				pm_runtime_put_noidle(pmctrl);
>  				return ret;
>  			}
>  		}
> 

-- 
regards,
Stan
