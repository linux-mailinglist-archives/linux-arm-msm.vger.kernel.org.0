Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A282261C73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 21:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731127AbgIHTU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 15:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731126AbgIHQCR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 12:02:17 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17620C0612FD
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 08:22:21 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id o20so1741368ook.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CprrL+/LROkbBW4cTs+E5TrRYY4E3igZX9G7gYG5Gl4=;
        b=zG3DKyL6RXgfAjjpoboTVkZIXN5Fo0jl+wEIvuIS6f/wQa5E3MEqXwU0MPBfQTwmpX
         PIWYFq2rOApmDnAx7ALcajzqFYix5izxCkh8ENVonvfOuRMqvTVgYGwjh6JekmGGsQjQ
         U+RELVmxHHC2EzfoQsmzEL2LaEKM7MCrPQ/+dk6E8ejBrEwQgvjXUlBHwL1EF2LfkqXo
         wbycaP/xkSOASRzjaIreLTblzn9I/uCE2UJUBwkhF2y8xwVjv5HBNA+Llcn7Xgbfb7kp
         tBvpg2fSSsQ7wW0wpsAl6m1n+IkwH8Nvc8158uZrH8SvwjAh9v2CZKAym4Sru/Qx6/X3
         MpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CprrL+/LROkbBW4cTs+E5TrRYY4E3igZX9G7gYG5Gl4=;
        b=qVUz5vnqC4yIRU8dhnh+441mqwNcJUcnZPLalbaWMHxCSxWngYarToWkeuIymh4Ucp
         gNW9UHcQ+IZDeFHyMTj/wBdsQbdsbPFBZbpRfNlSu+hYHL0BDdSVor4YHEHpPs0BMYQq
         g/qjSCjwT8WFcm4Sz6v2SLPnTVrY5yUuYkw8yeS0of+gfhmEJ7zhmeJ4sFF5RsVqWR2T
         m1Nir/+ZoRuOwLlXi3V2zV/PQsplZ2Hj2WhIqvINsAERxsmoCEltmZ/3V7OyiUA0DiiA
         OAdVgoT9avs/4senwZ7BzmpRQTka51HnVY3qEntvQrJILlWeooFBZbu/trMu+z5qkT+z
         lbcg==
X-Gm-Message-State: AOAM531tNkESul/1E8tFTLaUowzMNqkxGiexAJJzhd1ZHBSSMm4ISpOF
        KR4+RB+T7xllfS7WI30jAO1YpA==
X-Google-Smtp-Source: ABdhPJyRSWbxWbxc+Nc6O5jfLmJ6bOFuPEVvNRYkmmnnGx3lYrXWkZ5m8xRlhIrwn5wJXri3MKUwzA==
X-Received: by 2002:a4a:a385:: with SMTP id s5mr18994033ool.8.1599578540364;
        Tue, 08 Sep 2020 08:22:20 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id y23sm3477818ooj.34.2020.09.08.08.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 08:22:19 -0700 (PDT)
Date:   Tue, 8 Sep 2020 10:22:17 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     rjw@rjwysocki.net, viresh.kumar@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, amitk@kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        tdas@codeaurora.org
Subject: Re: [PATCH 6/7] cpufreq: qcom-hw: Add cpufreq support for SM8250 SoC
Message-ID: <20200908152217.GO3715@yoga>
References: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
 <20200908075716.30357-7-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908075716.30357-7-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Sep 02:57 CDT 2020, Manivannan Sadhasivam wrote:

> SM8250 SoC uses EPSS block for carrying out the cpufreq duties. Hence, add
> support for it in the driver with relevant of_match data.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index de816bcafd33..c3c397cc3dc6 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -285,8 +285,17 @@ static const struct qcom_cpufreq_soc_data qcom_soc_data = {
>  	.lut_row_size = 32,
>  };
>  
> +static const struct qcom_cpufreq_soc_data sm8250_soc_data = {

Could it be that this is the "epss_soc_data" (i.e. not sm8250 specific)?
(We should still use/include the platform specific compatible though).

Regards,
Bjorn

> +	.reg_enable = 0x0,
> +	.reg_freq_lut = 0x100,
> +	.reg_volt_lut = 0x200,
> +	.reg_perf_state = 0x320,
> +	.lut_row_size = 4,
> +};
> +
>  static const struct of_device_id qcom_cpufreq_hw_match[] = {
>  	{ .compatible = "qcom,cpufreq-hw", .data = &qcom_soc_data },
> +	{ .compatible = "qcom,sm8250-epss", .data = &sm8250_soc_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_cpufreq_hw_match);
> -- 
> 2.17.1
> 
