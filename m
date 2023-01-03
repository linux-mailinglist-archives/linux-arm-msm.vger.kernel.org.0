Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 052C665C0E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 14:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjACNgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 08:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbjACNgA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 08:36:00 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA71FCD2
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 05:35:59 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id e13so29246964ljn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 05:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bG56+KXz3IagBHFiZH4RRhZ3xE/+cQfXGeEVR1HbdPs=;
        b=qo6T863wOK3BWZElyh2PC1AhpeeadWxv1xvWBVZlrUzfWgTJ3xavNsS03PxsFWsUMv
         IQ5ajfdi94r+DvOh6wJ73aYNygxEiaEmymcgtxznj5Mz5iGhLr4Ay7xzJvtSDsmZaGpg
         IXtts/FAWqLMHOzMI7pJUp5eZWGc0I8LGLLGK6FYT3tSG0dXrKmFWo4fi9L2blMrw4q/
         c/QSeBTKFmPI05QHciDz2Ut0UD16bT2s8+90jRv5aTG1gBwTs1uHw5/7boITxSe2vYpz
         sm6mYf5QzMbuapGI13s/Zr8RiRTV1DSasnoUBqBDXRtQvVwL08XOxPDkppX4d1L5Yw+f
         cJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bG56+KXz3IagBHFiZH4RRhZ3xE/+cQfXGeEVR1HbdPs=;
        b=IzPb8oyipf6MA7ePigeFgAQUeS4jtk4IL0EU/HNZFkLUkyKRupe/fwBNb6Vm3atijE
         tO6cwydJkOX5z8qZasOSxUwAk3WNuj5VO6J39hXPieB7cU8WeVTn8qFHq/ZQYOATAWOE
         b66CIXuWlGsEsDbdyqmMIIeZdM9RabW5auRXRAcKMT3p1w8FGjiJpOV6D2t5FDXLlLB9
         XkEvyhvU1kmnpSN0m/kPOuswqS3VxCI8jaZtBdv16ptKycmNkKeOcFyk4R4VsWwWg6Hm
         gQbgyVckXLE6i2eHg3hVvI+GkaLcZIAP9j/FBTN+xmUXDug8PjlBcIkJdzAgDQM43HyQ
         A5+A==
X-Gm-Message-State: AFqh2krI3FsadHYf7c6o0EVsR4D/lQYLA80HYYwOCYWl5Sh2wY4JkuTJ
        DPrhtv5E3ZPmytqRcSnS+ag4NQ==
X-Google-Smtp-Source: AMrXdXuM8jqH3qAWgW64OuKftWxV7b3DShquX8gwpgt0ftRZPHsPquZw8WVxdgyD4vOqYCcWhHIa2g==
X-Received: by 2002:a2e:934c:0:b0:27f:b265:d6c3 with SMTP id m12-20020a2e934c000000b0027fb265d6c3mr9949511ljh.29.1672752957504;
        Tue, 03 Jan 2023 05:35:57 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id u21-20020a05651c131500b0027ff16ee6b9sm492238lja.8.2023.01.03.05.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 05:35:57 -0800 (PST)
Message-ID: <17ebb500-bcd8-6e9c-a43c-7b52f3f0080e@linaro.org>
Date:   Tue, 3 Jan 2023 14:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: sc8280xp-x13s: move vamacro node
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230103103141.15807-1-johan+linaro@kernel.org>
 <20230103103141.15807-3-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230103103141.15807-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3.01.2023 11:31, Johan Hovold wrote:
> Move the vamacro node to restore the alphabetical sort order.
> 
> While at it, add some newline separators to improve readability.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 20 ++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index f30ede5839b2..cc67a80758af 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -786,15 +786,6 @@ &txmacro {
>  	status = "okay";
>  };
>  
> -&vamacro {
> -	pinctrl-0 = <&dmic01_default>, <&dmic02_default>;
> -	pinctrl-names = "default";
> -	vdd-micb-supply = <&vreg_s10b>;
> -	qcom,dmic-sample-rate = <600000>;
> -
> -	status = "okay";
> -};
> -
>  &usb_0 {
>  	status = "okay";
>  };
> @@ -843,6 +834,17 @@ &usb_1_qmpphy {
>  	status = "okay";
>  };
>  
> +&vamacro {
> +	pinctrl-0 = <&dmic01_default>, <&dmic02_default>;
> +	pinctrl-names = "default";
> +
> +	vdd-micb-supply = <&vreg_s10b>;
> +
> +	qcom,dmic-sample-rate = <600000>;
> +
> +	status = "okay";
> +};
> +
>  &wsamacro {
>  	status = "okay";
>  };
