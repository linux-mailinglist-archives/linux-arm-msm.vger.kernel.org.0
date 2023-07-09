Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65EBD74C022
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 02:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjGIARv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jul 2023 20:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjGIARu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jul 2023 20:17:50 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD6BE4A
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jul 2023 17:17:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso5079909e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jul 2023 17:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688861867; x=1691453867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXWnFB7TlbQAIBfashq2bcvidLQkeNd93VaQ06HpejY=;
        b=ZB3UmJkUNHrpmLoSMK7CiCJU8nagw5wA75E1RX1uTir/KXmH93d7Gi9L/RoidCPC8j
         MUaefqyJmWCr13p7Nyqrzx3zjcb9FqK785hczrENqg+MxMpuVvGTRE48spM0UN48u4cB
         jHvTY6h0NWE2+GbToaHwImbR8E5mKOj8mUeE8UdGLeGTLtlVp84i5ueyla6RWn3f7h15
         GazlMAiMtGm7l2cKrEEEViHmZ3baV7QjgG/4WN3KsMLoUiSpJXSGCyNWNmkcG+Y3sOXX
         4GD5gpgWxMwRrG69uZqiSnK2Mrtv08C5XYSfZc+WAGNiwVID4wWYQTvU0hwaYwZDcs6K
         S7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688861867; x=1691453867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXWnFB7TlbQAIBfashq2bcvidLQkeNd93VaQ06HpejY=;
        b=Nzsqm0fdGEXOTYV/WqVGQqWORlu7zp+iCiYA7hSsyt3WprvKtOpLmn32w7ikoc8O4p
         OBZtcVadBpLMJRyk8mnCHPFQbzfryfm+61WMPthwocdisaaYUxa5a+huqI+qhno80ocI
         eDhjF+AuJ/0yLP06u3wXPX4o320CCTPyuxcWnywIj5pY/vd/ulB2E09qBL1WF7vY1x7O
         8XKTEFJROYmSlAzxg18Sc3CBFddyk73DzcNDxEiF0vvvjizacKB9EO/fQCcrAYQspfgu
         YMHb6Wzq0xOp3EU2v9aam48zR6JDT3w2uAMaJyorLUCnLk4oCC7Pi/TajuuVgW78h4su
         jZ5A==
X-Gm-Message-State: ABy/qLY9BCpCgu3S1DaYtmB3eJ7Ykpbv/4FyJYbCJXiTMFQFyRlugaQJ
        v9HzjDVh0do7oSvhVlexGFfpCg==
X-Google-Smtp-Source: APBJJlHcRSy2r13NftwBi/jBgQovyjb73CXtDZGgb+OPim7zXhimjf2EkQsW/S9IRmXnTnCzoCjLAw==
X-Received: by 2002:a05:6512:6c7:b0:4fb:8eec:ce47 with SMTP id u7-20020a05651206c700b004fb8eecce47mr7154821lff.58.1688861867171;
        Sat, 08 Jul 2023 17:17:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l3-20020ac24303000000b004fbb207ee0asm1157667lfh.206.2023.07.08.17.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 17:17:46 -0700 (PDT)
Message-ID: <4bd12281-63ed-ecb4-ae66-7ae63bdb1655@linaro.org>
Date:   Sun, 9 Jul 2023 03:17:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 08/11] arm64: dts: qcom: qrb5165-rb5: Switch on Type-C
 VBUS boost
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        lujianhua000@gmail.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
 <20230515133643.3621656-9-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230515133643.3621656-9-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2023 16:36, Bryan O'Donoghue wrote:
> Switch on VBUS for the Type-C port. We need to support a higher amperage
> than the bootloader set 2 Amps.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index dd924331b0eea..b326bdeeb7742 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1338,3 +1338,9 @@ &qup_spi0_data_clk {
>   	drive-strength = <6>;
>   	bias-disable;
>   };
> +
> +&pm8150b_vbus {
> +	regulator-min-microamp = <500000>;
> +	regulator-max-microamp = <3000000>;
> +	status = "okay";
> +};

Note, you are placing this declaration (and further changes in the next 
patches) at the end of the file, in the pinctrl area. Please move them 
up into a correct place.

-- 
With best wishes
Dmitry

