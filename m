Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40EA726100F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 12:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbgIHKhx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 06:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729719AbgIHKg3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 06:36:29 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB82C061757
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 03:36:28 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b124so10579540pfg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 03:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MgywjL0uucS1GgfjcXOCNe48ST0hLkPQB14tD2SYKHw=;
        b=u7+Ho6xmQepjBmUHL21LDM96wcPI0c+X/f4cHQ7fMfm4ljWMRGi4BwJoeVgRgQWGro
         pEYkoseNMf9Q3ZwFvKEHEXP+XwPzNYJAUU2mo/VCdt7ZsQm0xOwizXT2Qj0kozQm/6lx
         0qBnfaCspfqMs8G+LZWEubYphEko1dtF4P+riyIcbznQ5fLhEQIz0NVLpgXKFIOo+hIy
         cQ0HZuym/XPabmJe+oSMyl/TWu6MuVj8fb2ujLiJu2T7lH8aFhlelCuyd2udYbmSRcfI
         gdmtIjPxsNxnDp7FyflA8XlAgSwpIf/9DrEOdgv858R9Sc0WiQmBPuZse0xZlciAVgao
         Cgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MgywjL0uucS1GgfjcXOCNe48ST0hLkPQB14tD2SYKHw=;
        b=nqsQuP9vRYbSfqfelIse/DTtKmEmg0Sr1z8XHA40YRIEqExlsTZMIQLy7cHLNmE15N
         +Bck0IjI3RAwgp+PzhWFiRKN+W6MCbAwbl7rwrs3gKD+zbfVhWKn89O1gsF48/ZmxE+H
         3SSm+GaCWsIKivxJ3jAu0U34TvMHJmwRLT8ooy7c4qCHN1FIMYXklHRlFFKWAP1gFjse
         oGM6IHETakHZ7Ps5DzeT0uoj6qNfLXo4wmCbdtfyZB+PivA+leDHltgP1mC0ckYDnezP
         cK5jySHO+LPQ/46swJKUwgebptsg3nikUX1en2pKrbq5nd8v1Y9S83cTS7Pq+J4WQA+W
         Vt2A==
X-Gm-Message-State: AOAM533SNgMOEf5hHmi9+e20yhH8JVMzZh7Sjr/2K7y2+Alhp7eQtWWQ
        y3XRVWOCysYMQt6KgqhFD5AQPA==
X-Google-Smtp-Source: ABdhPJyh+51Moh3eoMoGX/l9hmnM/lXHQ8+NTU0Y9OnHtg+GDLY1oslfmE6zrfInTsqNGo/iMTxb1w==
X-Received: by 2002:aa7:9286:0:b029:13c:1611:66c1 with SMTP id j6-20020aa792860000b029013c161166c1mr22172024pfa.12.1599561387453;
        Tue, 08 Sep 2020 03:36:27 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id g192sm10646153pfb.168.2020.09.08.03.36.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 03:36:26 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:06:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     rjw@rjwysocki.net, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, amitk@kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, tdas@codeaurora.org
Subject: Re: [PATCH 7/7] cpufreq: qcom-hw: Use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20200908103625.swla4uoxxb3hj2w2@vireshk-i7>
References: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
 <20200908075716.30357-8-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908075716.30357-8-manivannan.sadhasivam@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-09-20, 13:27, Manivannan Sadhasivam wrote:
> devm_platform_ioremap_resource() is the combination of
> platform_get_resource() and devm_ioremap_resource(). Hence, use it to
> simplify the code a bit.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index c3c397cc3dc6..6eeeb2bd4dfa 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -307,7 +307,6 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>  	struct of_phandle_args args;
>  	struct device_node *cpu_np;
>  	struct device *cpu_dev;
> -	struct resource *res;
>  	void __iomem *base;
>  	struct qcom_cpufreq_data *data;
>  	const struct of_device_id *match;
> @@ -333,13 +332,9 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>  
>  	index = args.args[0];
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
> -	if (!res)
> -		return -ENODEV;
> -
> -	base = devm_ioremap(dev, res->start, resource_size(res));
> -	if (!base)
> -		return -ENOMEM;
> +	base = devm_platform_ioremap_resource(pdev, index);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data) {

Keep such patches at the top, so they could be independently applied.

-- 
viresh
