Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF14858B64C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Aug 2022 17:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbiHFPK6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Aug 2022 11:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbiHFPK5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Aug 2022 11:10:57 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB871115C
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Aug 2022 08:10:56 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id z19so5031383plb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Aug 2022 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nEw8DioIsZsw9Lxm4vVux8Gwg2rPrBpy7AqY3jBwj5o=;
        b=kvIEr95+JwC4phiy+fhiYF624DS4Ow5MH7+uzZn5wz+Ks8YF8JxFn+GAL8kVLmo6ow
         yk9ltMX5Hi2V43eedL16SkRHH4qO9HnwyEsXRbQopCbzk6NY8mZ95MMXYZCet1bxWKap
         lW/BGLlod8p4oFFmifYZMUOFiOZRZteEzRl4tsSxS0ro3uQk7nHnpZqrFLQB5NpeatVB
         ET8W3mnqoZ/WhXI7Y1npeKBwRQhBNSBvvM+adhlh9OHP/45lO7diqBuGOnjZevykUtrK
         x+oPCLCftG3T2+DMvfPbi+Rzjwv8WnnNzgFO9pEpxVaHpl96YhfPz4HEX2MlyhaTLcH7
         LUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nEw8DioIsZsw9Lxm4vVux8Gwg2rPrBpy7AqY3jBwj5o=;
        b=BBcaunVcBIncYOQggA8ez6dI03YgRDsVf7f6t/hCDV+C0Fm6QI3gx3sZIO2UGfLQA+
         xJbSLiXCfmyEQUkd7Jn13GDVQFzVWHlO0+FKdoCg28m2IeZvBPkjWLT3LsXwjepAujwu
         0Ebv62+O5TcyWf9Plih5vd1wqBMHN600Jpe5B6zRXForjaEdNvZzf8RZhLdWXINxqldf
         BZak8cxRc6Bzb5wvazrIqr8jn8vuLlr6fxdgxYGunO0yQyAr+h+S2zqpvxRtVhEZTd05
         mV08KSTXO7mwF97JQeH1Adoh7PDbytJrYt7ZQwR52H4REdNzvqr7uzLoHeCO4AmYdpCP
         z0nA==
X-Gm-Message-State: ACgBeo0n7MlXUhKW3w7qZpUbABz+Uw2ssq8wxyOZtqwv5ksB9OrhT701
        8d6pwRxRBd+biNgI0JGQgaXt
X-Google-Smtp-Source: AA6agR4VGRFre7BjReOSNXOBR3OOJN8Xe3WI6xX1+Bpm3cAkaTTVHaydbOlN72xeobkruUIlhMfrDw==
X-Received: by 2002:a17:90b:1c82:b0:1ee:eb41:b141 with SMTP id oo2-20020a17090b1c8200b001eeeb41b141mr13008438pjb.143.1659798655896;
        Sat, 06 Aug 2022 08:10:55 -0700 (PDT)
Received: from thinkpad ([117.202.188.20])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d50400b0016f12cc0ecdsm5189798plg.274.2022.08.06.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 08:10:55 -0700 (PDT)
Date:   Sat, 6 Aug 2022 20:40:49 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: gcc-sc8280xp: keep PCIe power-domains always-on
Message-ID: <20220806151049.GI14384@thinkpad>
References: <20220805121250.10347-1-johan+linaro@kernel.org>
 <20220805121250.10347-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805121250.10347-2-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 05, 2022 at 02:12:49PM +0200, Johan Hovold wrote:
> The Qualcomm PCIe driver does not yet implement suspend so to keep the
> PCIe power domains always-on for now to avoid crashing during resume.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/clk/qcom/gcc-sc8280xp.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> index a2f3ffcc5849..eaeada42e13a 100644
> --- a/drivers/clk/qcom/gcc-sc8280xp.c
> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> @@ -6768,6 +6768,10 @@ static struct gdsc pcie_1_tunnel_gdsc = {
>  	.flags = VOTABLE,
>  };
>  
> +/*
> + * The Qualcomm PCIe driver does not yet implement suspend so to keep the
> + * PCIe power domains always-on for now.
> + */
>  static struct gdsc pcie_2a_gdsc = {
>  	.gdscr = 0x9d004,
>  	.collapse_ctrl = 0x52128,
> @@ -6776,7 +6780,7 @@ static struct gdsc pcie_2a_gdsc = {
>  		.name = "pcie_2a_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc pcie_2b_gdsc = {
> @@ -6787,7 +6791,7 @@ static struct gdsc pcie_2b_gdsc = {
>  		.name = "pcie_2b_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc pcie_3a_gdsc = {
> @@ -6798,7 +6802,7 @@ static struct gdsc pcie_3a_gdsc = {
>  		.name = "pcie_3a_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc pcie_3b_gdsc = {
> @@ -6809,7 +6813,7 @@ static struct gdsc pcie_3b_gdsc = {
>  		.name = "pcie_3b_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc pcie_4_gdsc = {
> @@ -6820,7 +6824,7 @@ static struct gdsc pcie_4_gdsc = {
>  		.name = "pcie_4_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc ufs_card_gdsc = {
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
