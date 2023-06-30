Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544ED7436E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 10:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjF3ITo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 04:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbjF3ITn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 04:19:43 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DAD1997
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:19:42 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso2547866e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688113180; x=1690705180;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QQq9NTHobPqeSfcXQ7aU1rLWiJqSno6OurOsmAmkQY=;
        b=qi7zdbfnnJVVBGENqi243qHF0eVZImrdPMnsUGHylbN2GbHbTnFdUkVeT+l9mM8nR+
         4z0LVu+weSBY8ZbNCZ0Y57PRTDfXhmE65fD3MtPb9SK1h+PSs0PZebwm6vU23T1RnHJW
         q/G1aB7AMnG2Kjqv108yQo3BfFa/3AtncPXRMn8RBGwAAOJt8wDMsQLFNBAZHi05Iwz7
         +11zNDFxZgwriLYtVAnkS9bIGxv0XKWRyjHU1QXkj/N5fMGRXx3glIx1qTXbscyDJYG1
         u0wIPqRxP1lIYviuiEt+htyg9A2/jt4bspXKMCGkGL0DyhZG1pDu+xndayRBPaUHbjSO
         vuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688113180; x=1690705180;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2QQq9NTHobPqeSfcXQ7aU1rLWiJqSno6OurOsmAmkQY=;
        b=ca6ntT5D6aDzHFIdeMu3b252ceIJIPkDTGbpOys8R3KzLiuzYnXlzpI6bGbhDAPuOk
         Kcd4r0FyFX2/ERSOkNgmAzYo5hVlrF16GhtW4iW59lKPgkBz1eNrRVjpwXnG2/m4GT3F
         cya6cyH2DMgCo8X/ta6SC6XRfpYBME1ReFeAfdpesjeOg462tMNMtZBncVfEVyWe9jGv
         Nf7Z9U3JWEpBdHAn0tb9sfH9+Y4QNWRpWFD+E5UvtpBp/78Rt2fs0raS7pHQK0kZbaru
         ktx0to8V8Vwg1Skk4jIaW06/SkAIyQB911GDvvKn4ERW+QQLbCY0vXA98dewCf0OE9vQ
         I0Dw==
X-Gm-Message-State: ABy/qLYv0+RECZ+4+noh9vgKPY7YmRozwwuMirQuBzaiw2wb+HyN9W3t
        ffNwZcF9QcpS3jMuLsCflu5XJDz0KGhTie2hrdI=
X-Google-Smtp-Source: APBJJlF9DxDWlPlR4S6OH6RalO709z8tlBHRKPg0kZSn3jwh3a/IMzmWQXh1YQGbGjAOgek+gfaFRw==
X-Received: by 2002:ac2:58fb:0:b0:4fb:9772:6639 with SMTP id v27-20020ac258fb000000b004fb97726639mr1504788lfo.6.1688113180356;
        Fri, 30 Jun 2023 01:19:40 -0700 (PDT)
Received: from [192.168.1.101] (abyj222.neoplus.adsl.tpnet.pl. [83.9.29.222])
        by smtp.gmail.com with ESMTPSA id u17-20020ac243d1000000b004facdf96283sm2368647lfl.254.2023.06.30.01.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:19:39 -0700 (PDT)
Message-ID: <c59d002b-9d06-d744-d90b-22da4186522a@linaro.org>
Date:   Fri, 30 Jun 2023 10:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8450-hdk: add ADC-TM thermal
 zones
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230630061315.4027453-8-dmitry.baryshkov@linaro.org>
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

On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> Add thermal zones controlled through the ADC-TM (ADC thermal monitoring)
> PMIC interface. This includes several onboard sensors and the XO thermal
> sensor.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]
>  
> +	channel@144 {
> +		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
This define should be cleaned up.. Since it takes a sid argument,
it really is ADC7_AMUX_THM1_100K_PU(sid)

Konrad

> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "skin_msm_temp";
> +	};
> +
> +	channel@145 {
> +		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "camera_temp";
> +	};
> +
> +	channel@146 {
> +		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "therm1_temp";
> +	};
> +
> +	channel@147 {
> +		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "wide_rfc_temp";
> +	};
> +
> +	channel@148 {
> +		reg = <PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "rear_tof_temp";
> +	};
> +
> +	channel@14c {
> +		reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "therm2_temp";
> +	};
> +
>  	channel@303 {
>  		reg = <PM8350B_ADC7_DIE_TEMP>;
>  		label = "pm8350b_die_temp";
>  	};
>  
> +	channel@348 {
> +		reg = <PM8350B_ADC7_AMUX_THM5_100K_PU>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "usb_conn_temp";
> +	};
> +
>  	channel@403 {
>  		reg = <PMR735A_ADC7_DIE_TEMP>;
>  		label = "pmr735a_die_temp";
>  	};
> +
> +	channel@44a {
> +		reg = <PMR735A_ADC7_GPIO1_100K_PU>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "qtm_w_temp";
> +	};
> +
> +	channel@44b {
> +		reg = <PMR735A_ADC7_GPIO2_100K_PU>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "qtm_n_temp";
> +	};
>  };
>  
>  &remoteproc_adsp {
