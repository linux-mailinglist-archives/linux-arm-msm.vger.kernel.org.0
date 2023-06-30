Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C667436B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 10:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjF3IMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 04:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbjF3IMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 04:12:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F05B1FCD
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:12:19 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f86e6e4038so1960020e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688112737; x=1690704737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+kmi96YERORzCFGWsxEn1Ss8jzUB9ou9W1D9mEuodnk=;
        b=dKyYaTxrhF1UxMH4fuKL69epEIyewnf4GcT2NJD9tI3d3RK8l5S5LXLQt83i2s6+C0
         DtZCxTKuCNvKJ9UltqEAMVwj5RtoKJgyZ5kqjw9WyrTdRqpiarzu+LnCqECvuDqHtW0T
         tsib1uyUn5f2GEGmugf3y1SA74ZKQwos8Noi6fvnkcMOFIUxLVNzYVEHOeRdq8EN3PKT
         1Se46CsU3uykx3pwfG+QEuYlFA26UTTv1kpDyRhKaZX37g3MJuTOeiLN4lTPH5lMEKCj
         M7QIGGwr6sKTejcdzh6NOlLMNWrQn3l1AMr3GW0MrLnJBgWNI52LJaznub12O9ozkBGz
         kdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688112737; x=1690704737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kmi96YERORzCFGWsxEn1Ss8jzUB9ou9W1D9mEuodnk=;
        b=kJ4kRrSid96ysXB7rQJriX5XRqkuhfQoI0WnN/auEoMCPXm1LtxF2Xdx4JFyOSRkU2
         v7HduHyp06bmnnH9gyVPuBCdZUYE6uNVhRxSvf4oKnJ0k2YvkBQy4tPMVMVZEKinBacg
         EvXvjnUigdPW/zVrL71KSz24yJVS/L0g/cAqUjyDJKHpvkR1d9slpaBrrtupYmxEhmKm
         u58dOD1mFx2R5yytkleN1bB3pnldMiF4wut2TAirW5FBcZy4V2/6b3B/8Y7BW0TZqfzG
         z89WHux/cFqfIeeyiziU9NcfyDbmyFzC4rKBoWaKP+9JLPYI+EcmfouxKE9LhnQoVoww
         nQug==
X-Gm-Message-State: AC+VfDxcNjQo5XO8z7yd7hbjpLSi4umajkYBvRa/VFXtdlVlxCpiIjku
        ap711c9nfhP2Kd4aJ8gB3X0l+g==
X-Google-Smtp-Source: ACHHUZ5msFVrafxSMBgzWjkXLzTGxeVKdsWpmbzKhvMo5ZVBH0/Dpwkp2H3G4gxKIkPkVTEYRBqyUQ==
X-Received: by 2002:a05:6512:3a85:b0:4f8:5d2d:4941 with SMTP id q5-20020a0565123a8500b004f85d2d4941mr2429097lfu.34.1688112737572;
        Fri, 30 Jun 2023 01:12:17 -0700 (PDT)
Received: from [192.168.1.101] (abyj222.neoplus.adsl.tpnet.pl. [83.9.29.222])
        by smtp.gmail.com with ESMTPSA id d26-20020ac2545a000000b004efe73ee01fsm2631831lfn.306.2023.06.30.01.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:12:17 -0700 (PDT)
Message-ID: <9c122062-e2ac-9daf-72e2-94b8ff3bd2a2@linaro.org>
Date:   Fri, 30 Jun 2023 10:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/7] arm64: dts: qcom: pm8350b: fix thermal zone name
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230630061315.4027453-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> The name of the thermal zone in pm8350b.dtsi (pm8350c-thermal) conflicts
> with the thermal zone in pm8350c.dtsi. Rename the thermal zone according
> to the chip name.
> 
> Fixes: 5c1399299d9d ("arm64: dts: qcom: pm8350b: add temp sensor and thermal zone config")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pm8350b.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8350b.dtsi b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
> index f1c7bd9d079c..05c105898892 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
> @@ -8,7 +8,7 @@
>  
>  / {
>  	thermal-zones {
> -		pm8350b_thermal: pm8350c-thermal {
> +		pm8350b_thermal: pm8350b-thermal {
>  			polling-delay-passive = <100>;
>  			polling-delay = <0>;
>  			thermal-sensors = <&pm8350b_temp_alarm>;
