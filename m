Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721AC228F2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 06:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgGVEbE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 00:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgGVEbE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 00:31:04 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CA0C0619DB
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 21:31:03 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k5so505437pjg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 21:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3XBwyiS78uMYFOfDxL2yQtlSZ0Cbw1xcLCghfCTCxaQ=;
        b=bjQFtuCX725epKazSyvziW9h0IATYdDlWjzt0BjDpBJltgvz//m/0gmsKbyxRLRG9C
         lm6goDLk1rPXhXN1DLtw6T/10uCt2Vmi9TdUXwwa+5M1xqnpXgYqTIsoOzDX27MPxII5
         T0xAJ7bL6zKeoyEP98GW1McxTPjdXX8f19lRUWxpMEU3Q6cOIpiHbF4rreqrG7Rc9SmG
         AmUIXTSJYWULcDJip8HHTGTK1oFSRixvhaEyhWcVf5BcLPoa+bp8HeRZtcBHQcwAyCND
         ftBxpYFYgWujyQvWdmAsFptn+IphIv1QDTVEhkN+pZenv6Vyt25cVYg1fIRj5HNaatpN
         xYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3XBwyiS78uMYFOfDxL2yQtlSZ0Cbw1xcLCghfCTCxaQ=;
        b=oXYn1ZZl3GIFEBxA9/sqOs6w/iRe1m1dq7k2mNKdGSYi5Mzn6YlLSQv+bWoGhMmlnN
         lFrwQvT6SFamnGmD3XS7NFOdtKsBxL11FJwRYzXO9VTIco9Qv1TnrISi1+hmf9CqyR1V
         P4SlEn39S5A1IHm8JK3qZkU8m4x8PhP6Ph7MxI0b09mHxr52UBHKaVycN9BSqqIoyP5f
         YtstFGHvXAdivgT0wZHIXiUB7PfvX3MafBN/rCsVa25Xnb9EXUcc8KfoijvQGd0u75Tk
         waOG7AbmDtRJjfsJKdEq5zFoQkEE9Q3xJRwbuz9rhaZV2VKKdFNvHobvGIO4fkpyUSMG
         F+AA==
X-Gm-Message-State: AOAM532oPZEvPIZnFMXuBk6yz2rjEezglFn9swKF3Kwa0FeYzRaENOx5
        aHu6qgv/KS8hbFgfJAHmaDc0XazK7gQ=
X-Google-Smtp-Source: ABdhPJxPeCOq9ly4uwRkU0U7gGky2kIzhcKTahzjSYwyY0NWkH4fS3oyeN8+WZHGupmMCcbGskp2TQ==
X-Received: by 2002:a17:902:9683:: with SMTP id n3mr24548708plp.65.1595392263131;
        Tue, 21 Jul 2020 21:31:03 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l23sm4764543pjy.45.2020.07.21.21.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 21:31:02 -0700 (PDT)
Date:   Tue, 21 Jul 2020 21:29:09 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     agross@kernel.org, akashast@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] soc: qcom: geni: Fix unused lable warning
Message-ID: <20200722042909.GJ1218486@builder.lan>
References: <20200722020619.25988-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200722020619.25988-1-yuehaibing@huawei.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 Jul 19:06 PDT 2020, YueHaibing wrote:

> If CONFIG_SERIAL_EARLYCON is not set, gcc warns this:
> 
> drivers/soc/qcom/qcom-geni-se.c: In function ‘geni_se_probe’:
> drivers/soc/qcom/qcom-geni-se.c:914:1: warning: label ‘exit’ defined but not used [-Wunused-label]
>  exit:
>  ^~~~
> 
> Fixes: 048eb908a1f2 ("soc: qcom-geni-se: Add interconnect support to fix earlycon crash")

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

and applied.

Thanks,
Bjorn

> ---
>  drivers/soc/qcom/qcom-geni-se.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 3413129d73ef..d0e4f520cff8 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -910,8 +910,8 @@ static int geni_se_probe(struct platform_device *pdev)
>  	if (of_get_compatible_child(pdev->dev.of_node, "qcom,geni-debug-uart"))
>  		earlycon_wrapper = wrapper;
>  	of_node_put(pdev->dev.of_node);
> -#endif
>  exit:
> +#endif
>  	dev_set_drvdata(dev, wrapper);
>  	dev_dbg(dev, "GENI SE Driver probed\n");
>  	return devm_of_platform_populate(dev);
> -- 
> 2.17.1
> 
> 
