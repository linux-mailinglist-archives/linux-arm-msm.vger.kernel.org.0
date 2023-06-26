Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 414A973E167
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 16:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjFZOCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 10:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbjFZOCo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 10:02:44 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4991717
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 07:02:39 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b69ea3b29fso18792931fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687788157; x=1690380157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P95F46FHFtUvfecutBQEk+GjvQcOHcyS1bOsu5lMsVg=;
        b=aBHNP30nnAeqLGs3J7jiucFm0/sxptH2wV5ts7YECBVbMNY0+iVlf0SXa8+Jn+WyEC
         rILcZzkOdOymLNCZ+LvbIfnvQAVNAKSZrR3pj0oHgcrH7Z9KJ6kkdGfK0zBwYfFiCebL
         xtp97fR5MQotO8YeUsZDj1bWgpdqDIn+eVPYuB+OCIMZlh/UsVctMbjdoIp1tf+ylHa4
         G95gWsLmGoF9qqGdh3SqJrgTuCtbZ7ew6RjfH9n9GTiwkeQRimd5tRU4KpmWsK4kbLnN
         IqxRpAkwdDHErDtbIDiyqjMHRfRrfzfg1RM9I6UX8d+w7I6jhEk0mpLI/1ku3Uk4Z5lu
         9Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687788157; x=1690380157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P95F46FHFtUvfecutBQEk+GjvQcOHcyS1bOsu5lMsVg=;
        b=QNFHrcPxr2hjegU+DlhU/6h8uOExGBysQv7Pp8jMokvP1A7mJ2n8HFiMt/Dlx3H/fT
         u9i5zjfX1OijNvHOrKVCWrCGH7OrPUo4Jgb5bxd1xW8D1tbnS2JbZvEs7B4Fh2HcU6en
         c6AAD1zNqjk6dNtmldjQlPxJoFChx1BorCiATCKxwK3mAuTsbg9Tc2dCT7FI38D8bkKM
         NkKOvHTSWSt7JP7uPn9DuHwmEh8B6paS/cHwwcRXgtuhSsnmoWjpNw6b+20owpaHYxC/
         JHT8bewR3II5mH/MSX0hHxsoG8mha4GL9vHXsH+ZIr8GEheRJbkDOB+/u7xraTEbXnhp
         eGHQ==
X-Gm-Message-State: AC+VfDzJUqgxEI8s2Q7r/fGvPgA46iCBq0lHVl59Ii53laTENvpoGjJy
        A5vIBfcow8TSBNXJrqdDrNGSXQ==
X-Google-Smtp-Source: ACHHUZ5PmXhjDhTMOmYe/Hfn35SnfeoMBX29BBtSZx9DeeOSEq/rumQKvpa2h+4aol0xpdew/s/hQw==
X-Received: by 2002:a2e:9d4e:0:b0:2b4:67e0:4ce0 with SMTP id y14-20020a2e9d4e000000b002b467e04ce0mr13945422ljj.44.1687788157204;
        Mon, 26 Jun 2023 07:02:37 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id g11-20020a2e938b000000b002b22a1a21easm1250810ljh.110.2023.06.26.07.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 07:02:36 -0700 (PDT)
Message-ID: <95226bfe-d019-6b00-0f3b-d252a2988ab0@linaro.org>
Date:   Mon, 26 Jun 2023 16:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 25/26] ARM: dts: qcom: ipq4019: drop 'regulator'
 property from SAW2 devices
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-26-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625202547.174647-26-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25.06.2023 22:25, Dmitry Baryshkov wrote:
> The SAW2 device should describe the regulator constraints rather than
> just declaring that it has the regulator.
> 
> Drop the 'regulator' property. If/when CPU voltage scaling is
> implemented for this platform, proper regulator nodes show be added
> instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
> index f0ef86fadc9d..ad3c922843c7 100644
> --- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
> @@ -350,31 +350,26 @@ acc3: power-manager@b0b8000 {
>  		saw0: regulator@b089000 {
>  			compatible = "qcom,saw2";
>  			reg = <0x0b089000 0x1000>, <0x0b009000 0x1000>;
> -			regulator;
>  		};
>  
>  		saw1: regulator@b099000 {
>  			compatible = "qcom,saw2";
>  			reg = <0x0b099000 0x1000>, <0x0b009000 0x1000>;
> -			regulator;
>  		};
>  
>  		saw2: regulator@b0a9000 {
>  			compatible = "qcom,saw2";
>  			reg = <0x0b0a9000 0x1000>, <0x0b009000 0x1000>;
> -			regulator;
>  		};
>  
>  		saw3: regulator@b0b9000 {
>  			compatible = "qcom,saw2";
>  			reg = <0x0b0b9000 0x1000>, <0x0b009000 0x1000>;
> -			regulator;
>  		};
>  
>  		saw_l2: regulator@b012000 {
>  			compatible = "qcom,saw2";
>  			reg = <0xb012000 0x1000>;
> -			regulator;
>  		};
>  
>  		blsp1_uart1: serial@78af000 {
