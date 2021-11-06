Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64C6446EBE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Nov 2021 16:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbhKFPxJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Nov 2021 11:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhKFPxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Nov 2021 11:53:08 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B708C061570
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Nov 2021 08:50:27 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id l15so19782078oie.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Nov 2021 08:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8Qra9akannOKhHfzF9P4EEi/dtPKcdfqFmb0pyjRQ68=;
        b=dzv9XWCCxRprjKKXScrpOCvs+6FdSi28Gvt0E1xNYibSuwbNIz+resh9bS19/F+rFB
         t3N9/psI/V5V06B0wdF1Q83rUvrwpFcMIi8ABjTLHFXJZZxNYQbhP+IKTkB56rXKdRaA
         iGWrck51xPr9+jbs1gdQIJFuj8WU778qgruuT2oafrCA+iyRBsKXKYPGeGly0kJKqjv5
         8LonxpWyKsTkJVtKSNpsh2smJm7vHFECuaTsIw+4feUfOXUnEheE2rD6/Dx4652yVGCa
         3FXl0NyG2/wiL7MF8EqEGDY2mZFMIY4EniTD16YqZy5xcXtfvLoVHx6bSTkA5DoFrTBb
         gqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8Qra9akannOKhHfzF9P4EEi/dtPKcdfqFmb0pyjRQ68=;
        b=gvpKnJQ25SW9AocEE7mjDGCA/9NnW9sB7ZKe5LM4zF6xrmTpOxkqkTsqt+YDJPRL95
         KrL3NjKdd3lQc0UR7rtkcgv38HOGOpjebnJ2ZWXZ3Rj0qTa2zzBc8i3rledWyjLekcFL
         alOfXc5gXoM/bf/j8M+WVRB4LRB1AGoBu5TykMXp59/Sjm0vXHyGghzbuMVjf2tNmnvt
         PiHO1d3XMXEIMJ/NjsDz2ELEtTNKm1lyE/NX9m1giqJcMZsb6mjmbS2xdAq2IHygEGpI
         gNVlE9062c3NEPMae5gAakCKTAV8MDClfVcT+Tn4QmWUlieewgMqD2uXwDMKVOvtNNQC
         BLOg==
X-Gm-Message-State: AOAM531RcUTv/lRoO3A7MHjp3tYz29eRe21wGcvGjtI3fCii+ebGemkZ
        KDpKLEWLgHitKBdjNOKF/eW2NA==
X-Google-Smtp-Source: ABdhPJwBJ9YCa16fxUpZolirtN5bLSZpdYhwFTjrajGd+orwqE/4zEDLYu89/vMhKXVRAg59/mmxIw==
X-Received: by 2002:a05:6808:144f:: with SMTP id x15mr27350233oiv.132.1636213826928;
        Sat, 06 Nov 2021 08:50:26 -0700 (PDT)
Received: from yoga (rrcs-97-77-166-58.sw.biz.rr.com. [97.77.166.58])
        by smtp.gmail.com with ESMTPSA id o42sm3797396ooi.9.2021.11.06.08.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 08:50:26 -0700 (PDT)
Date:   Sat, 6 Nov 2021 10:50:24 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     agross@kernel.org, amitk@kernel.org, thara.gopinath@linaro.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/qcom/spmi-adc-tm5: Remove unnecessary
 print function dev_err()
Message-ID: <YYakQHd3Hr944k1B@yoga>
References: <20211105013340.38300-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105013340.38300-1-vulab@iscas.ac.cn>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 04 Nov 20:33 CDT 2021, Xu Wang wrote:

> The print function dev_err() is redundant because
> platform_get_irq() already prints an error.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> index 824671cf494a..8492dd3bfed6 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -612,10 +612,8 @@ static int adc_tm5_probe(struct platform_device *pdev)
>  	adc_tm->base = reg;
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "get_irq failed: %d\n", irq);
> +	if (irq < 0)
>  		return irq;
> -	}
>  
>  	ret = adc_tm5_get_dt_data(adc_tm, node);
>  	if (ret) {
> -- 
> 2.25.1
> 
