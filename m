Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8A573FABC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 13:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbjF0LFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 07:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjF0LFN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 07:05:13 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D9F1BE7
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:05:12 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6a0d91e80so32225001fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687863910; x=1690455910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szTI1atQtCe+VL3srAHVhj3JvzP+HP4Rd0b96r7/8dc=;
        b=fy8yvGLfbhpnSIy0WdMQWFRh2NwTDkU5BW+Ko457swGxnWZ0bJUIRIsKUncY+4nGAz
         45zN8CkrGrr9U3Yj3kTWwhaMKL3SSB6x/yzqrDa7Y6V5ASFqFQ30tr2FR7w3YHuSdNc8
         1VQ8DMCxm0YyvTicjlAj71tw4dgJruxVFVZl8fpwG1Oi+Ht6xqxq2+Zpk0BJFVPz2efV
         yQbo+AQWMWpSQhLnxirN/N5LtTmkxRs0KIL/mZIkKshKzMiy+WvtPfXxvLT2jUqb5euk
         F4szVsG5Xo/wo2VxtRZiZSMxVPUzMnQgabTQMOLVzDzPkJDeBZXaO1vNgOVzHGqcqyt/
         wqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687863910; x=1690455910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szTI1atQtCe+VL3srAHVhj3JvzP+HP4Rd0b96r7/8dc=;
        b=R+xeGNve9CnAuU9zCzsooTnL6YwB8T+RGUMIbgO/7ui5g19Hh2SH8pK339itHO+ug7
         OsAcP+ak7x+hfLXu5Of7MTkZtuR+YVZ5I8d7sxsm9CytxrsK2reT7Hkq7csMOQ23Twvx
         +he+lSNiQyyJirzYRIhJKuxMx6i8KBNJkv792sylQ4RcaFJGQH2KaGZ9bnwhB1hPWNz4
         s1Zbg2EQtf/A4X5Fet25E8U78sL3LxV5JxbPBldxuijdFk7+l29WEygYK2BkiF+YJ3Ep
         6bDJzTT6dJu0q8O8bX1XN9I+Oj+VOyYdE0dKHLfHRv3LqRM43By5Z8bYv9YY9LgBHpKF
         h0IQ==
X-Gm-Message-State: AC+VfDzHPBEgvO7lCQ+N4v8Kp7ecJM1OOEAwdGjGI40NQD+agHJIY1wP
        TqJAzYAJXC/+x+v8Nkyvb1c5yQ==
X-Google-Smtp-Source: ACHHUZ6kF93YU6a5msmHnkYb9kiyudJAnYlh+jy9vAb3K5BezWaBsTWSR7iN4NBJ2G2MUbjXlbxhXA==
X-Received: by 2002:a05:6512:2117:b0:4fb:8965:7882 with SMTP id q23-20020a056512211700b004fb89657882mr372457lfr.35.1687863910521;
        Tue, 27 Jun 2023 04:05:10 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id b28-20020a056512025c00b004f86ec7b992sm1462203lfo.114.2023.06.27.04.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 04:05:10 -0700 (PDT)
Message-ID: <edc6cc90-63d6-644a-7913-7141c2ec88eb@linaro.org>
Date:   Tue, 27 Jun 2023 13:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/15] ARM: dts: qcom: msm8660-surf: use keypad label
 directly
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
 <20230627012422.206077-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627012422.206077-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27.06.2023 03:24, Dmitry Baryshkov wrote:
> Directly use pm8058_keypad to declare keypad properties instead of
> referencing pm8058 top-level node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
was this board some sort of a laptop?

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts | 50 ++++++++++----------
>  1 file changed, 24 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
> index be18f1be29a1..86fbb6dfdc2a 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
> @@ -34,32 +34,30 @@ &gsbi12_serial {
>  	status = "okay";
>  };
>  
> -&pm8058 {
> -	keypad@148 {
> -		linux,keymap = <
> -			MATRIX_KEY(0, 0, KEY_FN_F1)
> -			MATRIX_KEY(0, 1, KEY_UP)
> -			MATRIX_KEY(0, 2, KEY_LEFT)
> -			MATRIX_KEY(0, 3, KEY_VOLUMEUP)
> -			MATRIX_KEY(1, 0, KEY_FN_F2)
> -			MATRIX_KEY(1, 1, KEY_RIGHT)
> -			MATRIX_KEY(1, 2, KEY_DOWN)
> -			MATRIX_KEY(1, 3, KEY_VOLUMEDOWN)
> -			MATRIX_KEY(2, 3, KEY_ENTER)
> -			MATRIX_KEY(4, 0, KEY_CAMERA_FOCUS)
> -			MATRIX_KEY(4, 1, KEY_UP)
> -			MATRIX_KEY(4, 2, KEY_LEFT)
> -			MATRIX_KEY(4, 3, KEY_HOME)
> -			MATRIX_KEY(4, 4, KEY_FN_F3)
> -			MATRIX_KEY(5, 0, KEY_CAMERA)
> -			MATRIX_KEY(5, 1, KEY_RIGHT)
> -			MATRIX_KEY(5, 2, KEY_DOWN)
> -			MATRIX_KEY(5, 3, KEY_BACK)
> -			MATRIX_KEY(5, 4, KEY_MENU)
> -			>;
> -		keypad,num-rows = <6>;
> -		keypad,num-columns = <5>;
> -	};
> +&pm8058_keypad {
> +	linux,keymap = <
> +		MATRIX_KEY(0, 0, KEY_FN_F1)
> +		MATRIX_KEY(0, 1, KEY_UP)
> +		MATRIX_KEY(0, 2, KEY_LEFT)
> +		MATRIX_KEY(0, 3, KEY_VOLUMEUP)
> +		MATRIX_KEY(1, 0, KEY_FN_F2)
> +		MATRIX_KEY(1, 1, KEY_RIGHT)
> +		MATRIX_KEY(1, 2, KEY_DOWN)
> +		MATRIX_KEY(1, 3, KEY_VOLUMEDOWN)
> +		MATRIX_KEY(2, 3, KEY_ENTER)
> +		MATRIX_KEY(4, 0, KEY_CAMERA_FOCUS)
> +		MATRIX_KEY(4, 1, KEY_UP)
> +		MATRIX_KEY(4, 2, KEY_LEFT)
> +		MATRIX_KEY(4, 3, KEY_HOME)
> +		MATRIX_KEY(4, 4, KEY_FN_F3)
> +		MATRIX_KEY(5, 0, KEY_CAMERA)
> +		MATRIX_KEY(5, 1, KEY_RIGHT)
> +		MATRIX_KEY(5, 2, KEY_DOWN)
> +		MATRIX_KEY(5, 3, KEY_BACK)
> +		MATRIX_KEY(5, 4, KEY_MENU)
> +		>;
> +	keypad,num-rows = <6>;
> +	keypad,num-columns = <5>;
>  };
>  
>  /* eMMC */
