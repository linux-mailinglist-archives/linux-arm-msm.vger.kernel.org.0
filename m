Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E866E712DE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242576AbjEZTvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237637AbjEZTvX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:51:23 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E7F13D
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:51:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4eed764a10cso1204192e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685130680; x=1687722680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OaLOVON36NEyajizG8y+ToCjqh7cMRvHE0B8AiqYWFk=;
        b=QEOHAGdLnK7zwwH/TtpJSaE/n4f0iK7osWuiY7K1WM4vRgTwFaHQKtNAxFwVU+baQN
         VzXEY0fM1NlGGOEKRLpeKemM5v5KSmGxvsy1pIY+qs8NjCaeG/xTPeFwRZI4mSIEbpsr
         6FypUWqJ1TgTbWQRLlrOyQfRtCajmcS7sUBXT2vvbfNQMgnGTSvXPGvTqG2FjKjw9EiJ
         7ltB+Y+Wbpp31vHXzV07KIVMQkbp3Xe/papc4gyBeK+s5zUSKj43oXubNS1OE+2dmiDn
         6xayknuxWmjyk+maotoZG+sQjL84/xEM0KSu5hUGJpocGmMaXELrdEdJFypsfjN/EupJ
         Dtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130680; x=1687722680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OaLOVON36NEyajizG8y+ToCjqh7cMRvHE0B8AiqYWFk=;
        b=aD7tzqkBaES5RrpP7wfYkYzdGIO9K/62srnJjRkvw3jhUVir51jZxohIgmdXRI/usO
         sbqXGskiXcRs/cT2WBQejKTo8betT5EBti7+jzQGsaI7PVdoWlnXeHFlo7euszZXVazy
         UUXGe3QXnxycRvZYT1Zzl9CqEaeKa+T01ZnmTVTHaVZ0oHlASN92H2Dxofrbk9whMW1K
         T6701QMV8LPMugfFjzloKNRztzzIltb7B90EEFNADKHrn9u5sKG8H2Dbzfm3OaAePGRr
         NXMA9/Mtqf05B+/9yqb3K+zJPchG9QHq+NnKLn6oGlhwBNMNygfaDNYKcyzvqqdv1sXz
         aGHA==
X-Gm-Message-State: AC+VfDyVHzDXMO3hoWNoL5d7XJt2TIJCztiYlDO9wYjk84hFB7c7BnfN
        DTlderl9ai+1uS9292J6oVBzcXHfyobZMWUE9SA=
X-Google-Smtp-Source: ACHHUZ5QNFH7pnhv8m6QhJiJjzj0Jc/bokpbAEfDHevVR0B7OnZue9xg8rgKk2sbPckxx+wb/U4FVg==
X-Received: by 2002:ac2:4c85:0:b0:4f3:b97c:2d88 with SMTP id d5-20020ac24c85000000b004f3b97c2d88mr795252lfl.63.1685130679793;
        Fri, 26 May 2023 12:51:19 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id a6-20020a19f806000000b004f2b6a203aasm753475lff.224.2023.05.26.12.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:51:19 -0700 (PDT)
Message-ID: <4806dbd8-4f9b-0a6f-adf0-4beab74b1ba1@linaro.org>
Date:   Fri, 26 May 2023 21:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8550: enable PMIC RTC on MTP &
 QRD boards
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v1-0-4d5d7602f290@linaro.org>
 <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v1-3-4d5d7602f290@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v1-3-4d5d7602f290@linaro.org>
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



On 25.05.2023 17:47, Neil Armstrong wrote:
> The PMK8550 RTC is functional on the SM8550 MTP & QRD boards,
> let's enable them.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
WDYM "functional"? Is there a reason it shouldn't be enabled for
everyone?

Konrad
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 4 ++++
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index e2b9bb6b1e27..6bf111e655f7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -496,6 +496,10 @@ &pm8550b_eusb2_repeater {
>  	vdd3-supply = <&vreg_l5b_3p1>;
>  };
>  
> +&pmk8550_rtc {
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 4a8177f99523..b08a8201ad23 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -482,6 +482,10 @@ &pm8550b_eusb2_repeater {
>  	vdd3-supply = <&vreg_l5b_3p1>;
>  };
>  
> +&pmk8550_rtc {
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> 
