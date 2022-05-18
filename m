Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0D552BCB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 16:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237089AbiERMsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 08:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237312AbiERMsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 08:48:30 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD381611F3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 05:48:04 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r23so2583926wrr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QDRebOwKR1U7lf+8cC6DEw4q2LYFiJkBiZbjUsroBtA=;
        b=VFaRnp4nJwGe6+K0h8fZQDYP5mjMH+aTJbeT60nygLmmb469VcltrQ6iMwJiEYNttV
         4D4ZTqggYzl1/ZJBDkT4Xhrmx31nbBDFdah32gRN3iGBOSrOUdbh14K50Ycue1VUuG7W
         Y0VDI416R7dTuWuaPW7VgbetqAEKAMlXpfJU/4FI8YPJDzPjgl6Hao4OZvJ8fhasSJOn
         ht4CvN5xsGDQRe9ctRWXh8UTanBF5YXkBRHzot7VF9OpvbKZEexFfK6tTleUlsQQ7zLm
         t9SHTSnO8546tiucnTUBlb/TkjG+0EK8b+x9sD9Keib5aoHcTkrboaKFuz8AIMqaA4av
         Pzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QDRebOwKR1U7lf+8cC6DEw4q2LYFiJkBiZbjUsroBtA=;
        b=7t/+Jtlwp+pM7UrIWejzaZRIXLksN9cTEq5k/icQrkZvAVMPvYYR/Xxpu3SW/bYAog
         1nUgHSK8D16GE+jJ7QdN0xbDtGq2Xpxzna/73U4oMW4wAO8F3V7iITXRghVIMoR10VmI
         pVXTXBAtgX4C0zP9qRoURiyVXs44B0L4+Pu8qLoOmFf6nG8/9gFvJH83iCEr286pidNx
         YFt/JsHmh6dmCGsqA7OkoX7WQ5JLm3E0WmbKy+uxr8of18DSyY4wplEzZ4J4pHj1vc2F
         jj1fsvneuCkuA2UQxoVT+AARNtg6KRifAJMXRJsPwX/na0OLD/F2YD1WqTv1N03+1yf5
         sNXg==
X-Gm-Message-State: AOAM530gy/HRwBJVpvxo530CLQy77WFqh+UvLyWZoRhHIrFnwxKAe0d3
        8HKn15xBtSpz6uH+3vJPjgBhUg==
X-Google-Smtp-Source: ABdhPJxAJE+m5SmQKDYPjuDuk+UjAwN1tLOx3HmhZwD9VCHZO2OgecLZe+qruUro7ymOOQ+JRFmfNQ==
X-Received: by 2002:adf:e186:0:b0:20d:910:6481 with SMTP id az6-20020adfe186000000b0020d09106481mr12650832wrb.522.1652878082781;
        Wed, 18 May 2022 05:48:02 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c2b9400b0039453fe55a7sm4188006wmc.35.2022.05.18.05.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 05:48:02 -0700 (PDT)
Message-ID: <f645fe49-8adf-c1b2-89be-e8ab8f620f16@linaro.org>
Date:   Wed, 18 May 2022 13:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing
 driver's init level
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2022 11:35, Vladimir Zapolskiy wrote:
> Access to I/O of SM8250 camera clock controller IP depends on enabled
> GCC_CAMERA_AHB_CLK clock supplied by global clock controller, the latter
> one is inited on subsys level, so, to satisfy the dependency, it would
> make sense to deprive the init level of camcc-sm8250 driver.
> 
> If both drivers are compiled as built-in, there is a change that a board
> won't boot up due to a race, which happens on the same init level.
> 
> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sm8250.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 439eaafdcc86..ae4e9774f36e 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -2440,17 +2440,7 @@ static struct platform_driver cam_cc_sm8250_driver = {
>   	},
>   };
>   
> -static int __init cam_cc_sm8250_init(void)
> -{
> -	return platform_driver_register(&cam_cc_sm8250_driver);
> -}
> -subsys_initcall(cam_cc_sm8250_init);
> -
> -static void __exit cam_cc_sm8250_exit(void)
> -{
> -	platform_driver_unregister(&cam_cc_sm8250_driver);
> -}
> -module_exit(cam_cc_sm8250_exit);
> +module_platform_driver(cam_cc_sm8250_driver);
>   
>   MODULE_DESCRIPTION("QTI CAMCC SM8250 Driver");
>   MODULE_LICENSE("GPL v2");

So I tried this

-                       clocks = <&gcc GCC_CAMERA_AHB_CLK>,
-                                <&rpmhcc RPMH_CXO_CLK>,
+                       clocks = <&rpmhcc RPMH_CXO_CLK>,
                                  <&rpmhcc RPMH_CXO_CLK_A>,
                                  <&sleep_clk>;
-                       clock-names = "iface", "bi_tcxo", "bi_tcxo_ao", 
"sleep_clk";
+                       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";

and the system wouldn't boot @ * 736ee37e2e8e - (tag: next-20220518, 
linux-next/master) Add linux-next specific files for 20220518 (2 hours ago)

If we do a grep

grep subsys_init drivers/clk/qcom/camcc-*
drivers/clk/qcom/camcc-sc7180.c:subsys_initcall(cam_cc_sc7180_init);
drivers/clk/qcom/camcc-sc7280.c:subsys_initcall(cam_cc_sc7280_init);
drivers/clk/qcom/camcc-sdm845.c:subsys_initcall(cam_cc_sdm845_init);
drivers/clk/qcom/camcc-sm8250.c:subsys_initcall(cam_cc_sm8250_init);

and

arch/arm64/boot/dts/qcom/sc7180.dtsi:			       <&gcc GCC_CAMERA_AHB_CLK>,
arch/arm64/boot/dts/qcom/sm8250.dtsi:			clocks = <&gcc GCC_CAMERA_AHB_CLK>,

I think the sc7180 has this same dependency loop. Probably needs the 
same fix.

Also not sure why sdm845 camcc doesn't declare a depends on 
GCC_CAMERA_AHB_CLK - should it ?

Recommend applying this same fix to sc718x

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
