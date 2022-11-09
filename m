Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D87262241B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 07:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiKIGue (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 01:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiKIGub (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 01:50:31 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757871929E
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 22:50:25 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so988523pjk.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 22:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hy9yWm3EPsb6RbVghUPJanZO5MYjfITHEKuEDJq6g0k=;
        b=Bs1D4bml8x+maqPLoWnDCBMLcTmi2jluu7gRuRF50V6EIEZViifxH1l4BoRYFgIyc6
         BxSqjeFXI8b++f+1g4sAEpM3sXN5107/XUdiZLKpS+crlPF3FzH1IzVERH1Y1BveXepM
         7Af9OfEzfU2E0vTWsDSwOtbRlIl8dnT28LC8qjA9dH+CllFF2ickKXPwKkd1Thkg87I0
         cviJEZCLbnW4uZKijTwlgCcCVypsfTF3vlVIBJ19OGQTOBwfORQGSHkXHFzUgyBjGPEN
         sa2gE88E4Y+D28IgejExcrua1Fi6eMjNEmAIgZECg3OxKeBE/rLN1MVwXm/QdiXrag5Y
         Grmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hy9yWm3EPsb6RbVghUPJanZO5MYjfITHEKuEDJq6g0k=;
        b=yXCuz3FLkWlTZQeuKvT857RSWfqwBVXtnPZc7Spv/xHWoUn18N+qJjasnlPw8UmZ6B
         gdlxP3ViNtFdRfOtVQdwQsTAR0XVeNlzKTyFxTOrfVeuEZ6M5X5D+q3V7Q3dQMciJyR2
         N1zq8/qRkG9dq47bUyVGhWhdL3jVfNw/J7SZrv0jk9QEPpZ9GBQ9mmX/tSrtNt7ew0Tu
         BV4GSL4RWsLqz4kokeKSLGCAfwNEZtpoyYtaNhezlSXXjRZ1LB5TxdjIfOFxRTJFvP3n
         FcjwWWB5aS0pldcwclflDQVcV4fKDWJGzsQsd5BA1nQ/BA6CoOguz490xpzATG6/3SxC
         IVaw==
X-Gm-Message-State: ACrzQf0+SHDiOgT6YbSn/o9PdoyXoGLDG1S0a2rXYQBP6sHyw6tdkOKA
        EAZhHUdx1ekAhWxMlfmWltDKdQ==
X-Google-Smtp-Source: AMsMyM5MwK4KweG78Z9x+oIbwtm97gO0TUSwaZDg1yKwbC9UlevYrrWAcQwxIWPUw7Qyi/FNR0NCeg==
X-Received: by 2002:a17:90b:164d:b0:213:6a84:2529 with SMTP id il13-20020a17090b164d00b002136a842529mr61965836pjb.32.1667976624929;
        Tue, 08 Nov 2022 22:50:24 -0800 (PST)
Received: from localhost ([122.172.81.73])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090341c200b00186afd756edsm8137442ple.283.2022.11.08.22.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 22:50:24 -0800 (PST)
Date:   Wed, 9 Nov 2022 12:20:22 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Chen Hui <judy.chenhui@huawei.com>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, rafael@kernel.org,
        sibis@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-hw: Fix memory leak in
 qcom_cpufreq_hw_read_lut()
Message-ID: <20221109065022.yc4teojggd4mrkqt@vireshk-i7>
References: <20221108072302.736-1-judy.chenhui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108072302.736-1-judy.chenhui@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-11-22, 15:23, Chen Hui wrote:
> If "cpu_dev" fails to get opp table in qcom_cpufreq_hw_read_lut(),
> the program will return, resulting in "table" resource is not released.
> 
> Fixes: 51c843cf77bb ("cpufreq: qcom: Update the bandwidth levels on frequency change")
> Signed-off-by: Chen Hui <judy.chenhui@huawei.com>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 833589bc95e4..d15097549e8c 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -193,6 +193,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
>  		}
>  	} else if (ret != -ENODEV) {
>  		dev_err(cpu_dev, "Invalid opp table in device tree\n");
> +		kfree(table);
>  		return ret;
>  	} else {
>  		policy->fast_switch_possible = true;

Applied. Thanks.

-- 
viresh
