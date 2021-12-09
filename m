Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9876E46E1AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 05:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhLIEwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 23:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbhLIEwP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 23:52:15 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571ADC061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 20:48:42 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id w15-20020a4a9d0f000000b002c5cfa80e84so1431115ooj.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 20:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UzPrDz37TsbgctSbF3jQc1Www5xR/uLVIm/OIh4LH2s=;
        b=pAgQQ1bgUJN66G/xpqk6sN1Ime7Y0O4qp5cVTQJqayrV5KAFuoiw26TORvLt8r4csa
         EoT2O8NlRQwcYcI9nDJG5UZZZVUM7ObMEvrdQXrCuEPsDb9vpSO97e4ztjc72QBaljaV
         gdld3FSuEhonRopMY2va2tW0weV284CGbfPGkWVvXMohwl4RWtWTlhxRWzAhRJ5CuSYQ
         uo/faMw3tvgr/xMpAqlJYB3T8xPHft4qiZQ+fT//xwkTmMg7YB1tzM2fZ2n79Loqohyw
         g/fGDYCbZDkmqnsydUUi7rGFqjiWWGc7juN7Wh799PrdVt/HfrUS0CUp3tuUhg89Zl+S
         lYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UzPrDz37TsbgctSbF3jQc1Www5xR/uLVIm/OIh4LH2s=;
        b=ezdgibY1niIDyXGEXyGJwFDEsERttYTUgXrSMs1a9l3VLJtmbazjhN7veGUjNNYzMP
         pa+t1DUIqPAHKZUQO3RHp3HUcN/+Bmnhd0BNJ7ALFMrpf0Ot4bUR3UkS6PDH2Iq+zSzC
         mkfMp1Vl74QLlXW0XN8FoCCeMDIQHiL5Gldd48usJewwVVALmyWemuWMgZLcCvlX3eub
         eCi6ad0pHQtW4EXIk6mkY/fUwrcNR/YQTJQ3+VitmMIsjSLLdOyV+J6JyqEtRA1ZeRXY
         +Knbg/OuNcbMAIbKERSKYbtWF6yDwCWdatRvl5y6S4vhgV9eihSp4y6YyHNLlSL9rLJt
         eyRQ==
X-Gm-Message-State: AOAM530D9bFCKrD1OQOULodEUbITABU/RHieY45mMtl+j0cmBEraifNB
        +TZv8eZI10AM1ev3ccucnyWUVQ==
X-Google-Smtp-Source: ABdhPJzVriX9cyPCHvhpXlfeRj4kbtylQnj9PMKFLon2CWif8CeJ1hyJB5YbK8VCDsdi+6L5U4UZbw==
X-Received: by 2002:a4a:e155:: with SMTP id p21mr2592272oot.84.1639025321519;
        Wed, 08 Dec 2021 20:48:41 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l9sm805883oom.4.2021.12.08.20.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 20:48:41 -0800 (PST)
Date:   Wed, 8 Dec 2021 20:50:06 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Guo Zhengkui <guozhengkui@vivo.com>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>, kernel@vivo.com
Subject: Re: [PATCH] phy: qcom: use struct_size instead of sizeof
Message-ID: <YbGK/iNJYqtgF1kD@ripper>
References: <20211207131642.5313-1-guozhengkui@vivo.com>
 <20211209032114.9416-1-guozhengkui@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209032114.9416-1-guozhengkui@vivo.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 08 Dec 19:21 PST 2021, Guo Zhengkui wrote:

> Use struct_size() to get the accurate size of `clk_hw_onecell_data`
> with a variable size array, instead of sizeof(data) to get the size
> of a pointer.
> 

Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 17d5653b661d..a8ecd2e8442d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -571,7 +571,7 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
>  	struct clk_init_data init = { };
>  	int ret;
>  
> -	data = devm_kzalloc(edp->dev, sizeof(data), GFP_KERNEL);
> +	data = devm_kzalloc(edp->dev, struct_size(data, hws, 2), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>  
> -- 
> 2.20.1
> 
