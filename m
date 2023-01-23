Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C0C677AF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 13:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbjAWMcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 07:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbjAWMcX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 07:32:23 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00D1222D9
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:32:11 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id mp20so29990650ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JhlWhWaOLNECTGnOtfz6hWGWOG04+uarKG5fVZLNacI=;
        b=xK4LAYkcnzT8hETQXr9hajRkyRACRzaJ0hTK6+SiYDXqHy5ivDHvMIXow8OwrzwWfQ
         bWwS18Z2i/RvqOgojoZmJYZ4dK0lFMtKdfaYQTKrvC/faLzzri6aYphMEVk3X3e8OFml
         LwS0zpbMZSPutYoTdRmI16BoatrC/yv9SZ5AcnKyb8guDl6CsEjasJjJ9WZRhMduGSf7
         I7XNPaBOsHCq35zsAKfJDpKe7heKONkefomlp2Y6ymdYOIClOqzz4iFCHTjuP9Etazu0
         ZnUKPc1WmQvYYM874ds8pz9SXaJC4nNeXNDWiA5TOv2TDz8AEAKKm5tJLm5jHylyLGt4
         F2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JhlWhWaOLNECTGnOtfz6hWGWOG04+uarKG5fVZLNacI=;
        b=m0mmuhPgxdH9xqL1PxiaaJ/WtU+q1m9sPWteBtgMp+T3+I5BwEDC1SHXMnbRZ8/GmZ
         C6zJKq41Aik2m+wKZ1Y1oI0wej0j91ANEzt7SqGnkr0q9s29NSlQMTwbGqh41km7aYRK
         sjh5mJ+hTXDJ2cD8igo5X9tZpuhwsCJ//D39mQJ+0ezdn1C8+VeKDVag3S65aTU9HEwB
         8TTx+2tIyEIOEAHIbqwJQq9hsL9M16+fTEQBsfZ75ZAPwGH4rraJXllhpiCxEosNOiRM
         ngpMtwsYEFV0kcgwlXnPcQ8IGIeVBF56yNNGBi8Wh2d+diB7XYlsMFzzZ0TxkuUQxOqY
         os3w==
X-Gm-Message-State: AFqh2kq5qYKRp5vB2QL5inbCR+afPpiBOiklA1K7Xx8B1SWeuhh8na9J
        fkFJbH1NZJ1XsnDJuF++E+JmaQ==
X-Google-Smtp-Source: AMrXdXv/47adF+0iseRFeXB/8zNXlnSKuqPhF9dw5dwzlb2OeZnmTqx2CeHIjiEWMVXww+ibHTTxog==
X-Received: by 2002:a17:906:150d:b0:7c1:458b:a947 with SMTP id b13-20020a170906150d00b007c1458ba947mr24273622ejd.26.1674477130251;
        Mon, 23 Jan 2023 04:32:10 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906b08b00b0084c62b7b7d8sm22131454ejy.187.2023.01.23.04.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 04:32:09 -0800 (PST)
Message-ID: <d1d2fb43-60aa-742d-9839-e64be2a8fb19@linaro.org>
Date:   Mon, 23 Jan 2023 13:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/2] clk: qcom: add compile test to MSM8996 CPU clocks
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.01.2023 10:49, Krzysztof Kozlowski wrote:
> Allow compile testing of MSM8996 CPU clocks for build coverage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 1b6615fe1dba..1c360eed72d7 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -48,7 +48,7 @@ config QCOM_CLK_APCS_MSM8916
>  config QCOM_CLK_APCC_MSM8996
>  	tristate "MSM8996 CPU Clock Controller"
>  	select QCOM_KRYO_L2_ACCESSORS
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>  	help
>  	  Support for the CPU clock controller on msm8996 devices.
>  	  Say Y if you want to support CPU clock scaling using CPUfreq
