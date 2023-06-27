Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3636373FAB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 13:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjF0LDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 07:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbjF0LDh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 07:03:37 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DDB1BE7
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:03:36 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b69ff54321so33380331fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687863814; x=1690455814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLZns2wwfWbcPXbWq+DI4dSVq7o5vrmJGJ29Egn0b0A=;
        b=voj3hu/G7VebjTbwCiJRVPwYyjnXSvXZ9+4tHQCjn6pIxSWDijYerIa5x9hg0UKeYo
         jjjIDUEKHjwBLx/rKiyYqanRBDpsjgN92I9fBQ5bSVBoCDdkxU3r9KMD16o6rwp+h10E
         +SbZ81xIxrYGuiWYfuy8+SYjdvV+dHhpfsv8pSzujSiRChffXcEy0X5t8pYqkNjwX8WD
         xqv7b62EkGICWALDcCTgFc5HxHAUq1t8on7gkDUm1JisikfmuQtnTwvszr4OX8vmQDMK
         4eX5/vQewezWVd9vW0vh0asLAoypnuwC5dYiE6IFpkxKxsXS4Ixb5VtDNtzprraQ+tSN
         By6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687863814; x=1690455814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLZns2wwfWbcPXbWq+DI4dSVq7o5vrmJGJ29Egn0b0A=;
        b=VGcCoj/BtP7L+NMVQM02hG2xddSJ5CHaB02jnHkWjyyfEai72B7nKUiWCiT5U7T7DH
         uS5tYFkzJ/xJQgPM7QD9ToAusNR8yStcXRoDaOFPBKDYIXEoA8+9tjDejtLJADllXLuS
         /3xdt0SGCkbIhzbRnT0saLCdUdScG/Uu5KUqdJfmQe0MawZvedzduMVvksF5fnRyLGPg
         MeAb8Vi9aVTLeVShOx0+QaX4UHb9gBlFV4baSXO2YkS/MY6vmBzcLVfxElyiMac2Dq3x
         v8zLrsTJ0pCKH8P/1+1BZfL3vgjkl2mH8wqPJqcUOknyCz9TqGR9z39a1/pwG+IWSG0y
         vqtg==
X-Gm-Message-State: AC+VfDzpKUThR8F3r+1pmiEsEPVzZ7FtBi2nJxzQMcZH0Np8y+uwNilp
        D4V7d2DdC4FcXlGm6IxHbJ3A8Q==
X-Google-Smtp-Source: ACHHUZ4EifpK+Kf6PfmRdTQgofHfvn3sFarLitOfj7VoY/rdfAR00P0y+2ZOAi0WYd6IKe6JjicMpA==
X-Received: by 2002:a2e:a1c8:0:b0:2b1:a810:e43a with SMTP id c8-20020a2ea1c8000000b002b1a810e43amr20585392ljm.34.1687863814348;
        Tue, 27 Jun 2023 04:03:34 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id j12-20020a2e800c000000b002b1d6bfab5csm1692576ljg.22.2023.06.27.04.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 04:03:34 -0700 (PDT)
Message-ID: <2328afc5-91ed-6bf7-f841-1e250e614f6c@linaro.org>
Date:   Tue, 27 Jun 2023 13:03:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/15] ARM: dts: qcom: apq8064: correct XOADC register
 address
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
 <20230627012422.206077-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627012422.206077-2-dmitry.baryshkov@linaro.org>
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
> The XOADC is present at the address 0x197 rather than just 197. It
> doesn't change a lot (since the driver hardcodes all register
> addresses), but the DT should present correct address anyway.
> 
> Fixes: c4b70883ee33 ("ARM: dts: add XOADC and IIO HWMON to APQ8064")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index d2289205ff81..4f4393e11580 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -766,7 +766,7 @@ pwrkey@1c {
>  
>  				xoadc: xoadc@197 {
>  					compatible = "qcom,pm8921-adc";
> -					reg = <197>;
> +					reg = <0x197>;
>  					interrupts-extended = <&pmicintc 78 IRQ_TYPE_EDGE_RISING>;
>  					#address-cells = <2>;
>  					#size-cells = <0>;
