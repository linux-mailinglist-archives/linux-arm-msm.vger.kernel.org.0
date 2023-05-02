Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358636F420F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 12:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbjEBK4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 06:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbjEBK4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 06:56:43 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722744ECD
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 03:56:33 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2a8dd1489b0so34473901fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 03:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683024991; x=1685616991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2Nlhcp7G8z/XIdM0zZT8I/Ip/O0Xqk8H2JVyN1iB54=;
        b=I5x8ZOHzu0sqMhU/6WCryZSJfsa1C3sf0dNAvOTyyD3JSpNXn4WwOUl+RNS/WsM9sg
         R22VzZ5ELRHpwCwbUL1SQkNj7aobpnkKwcz49ePU4diYwY1+ohrIKvI3/3ctui6GBXuX
         OZzOeakzeedqFOhxmmbHUy2uN9t5f73s4KjRFWTLTLf1Vlu4BRKQSp4G3eVd0AGroxyZ
         HDiDIpZD4AZ7JOQYr3uc3xttAz9YEfVARLIiMdkd08G88RJByOHKR4U54JCsYPtFakMN
         Ir2r628PeGjq++nZhOb0mMX8sTOaDPTkhjENybrS+O1cJKAZsYgUBwFQY5YXPKQNNQXM
         ng8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683024991; x=1685616991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2Nlhcp7G8z/XIdM0zZT8I/Ip/O0Xqk8H2JVyN1iB54=;
        b=B5XVZN2iAKJfXgRKgNd/alVABnAPz4A+z1O3RzNigBby//T15eLbgFOI8m0ZD6wLIv
         sO1LBKUSHSkXS01kNhZsvG1fZIaOqv55u6aWrLP/YRnh6TdziB1PCXvRkumSYkXdStdt
         G+KmldW4DTPSTaKApVAfnMe0USokPbZHJ2+6I51X6uThklnP4qZoSvJ9kWvnu982CTT/
         La4T1SLxF5pq47VoaurXKOyzIb+8pdcEMPai1yI7U2QwRcnVF2pPLlK4x1KCxXcSP58F
         q3LO72BFWiYL0KsIFgi34oIR5vQKRYjZRWPvxRScF2Ex+ClPJRQHkWrnv6AWqMh7GJPE
         xMiw==
X-Gm-Message-State: AC+VfDyaJRv1XorMaKQHxJRRVvQq/0exfha1UrCxxTGXKHUbYbbcuGnF
        P/5iiXaGl+3x+a8erxMeJd5rKg==
X-Google-Smtp-Source: ACHHUZ6o65hEBPmGavppGPq7uahkgIuhRYFXaQ/9TrBVbLvTjKCQFOYbXUFpO86RGYU+lhD/6SCs0g==
X-Received: by 2002:a2e:3615:0:b0:2a8:ceef:e6cd with SMTP id d21-20020a2e3615000000b002a8ceefe6cdmr4652563lja.52.1683024991119;
        Tue, 02 May 2023 03:56:31 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id d20-20020a2e3614000000b002a8d2c6300bsm5212935lja.48.2023.05.02.03.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 03:56:30 -0700 (PDT)
Message-ID: <fe945024-3f58-ac2a-5174-359c789e33f8@linaro.org>
Date:   Tue, 2 May 2023 12:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 10/13] arm64: dts: qcom: qrb5165-rb5: Switch on Type-C
 VBUS boost
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-11-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230501121111.1058190-11-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.05.2023 14:11, Bryan O'Donoghue wrote:
> Switch on VBUS for the Type-C port. We need to support a higher amperage
> than the bootloader set 2 Amps.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index dd924331b0eea..b326bdeeb7742 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1338,3 +1338,9 @@ &qup_spi0_data_clk {
>  	drive-strength = <6>;
>  	bias-disable;
>  };
> +
> +&pm8150b_vbus {
> +	regulator-min-microamp = <500000>;
> +	regulator-max-microamp = <3000000>;
> +	status = "okay";
> +};
