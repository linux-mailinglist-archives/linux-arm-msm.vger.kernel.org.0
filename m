Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A47364DC1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 14:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbiLONTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 08:19:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiLONTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 08:19:08 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714EA2DA98
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 05:19:06 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g7so15629130lfv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 05:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuBRmTDLtgN417FwD87ZJbkr08uM4dGETokmcGbpo7E=;
        b=ytjX+7PTI6Cdm71113ZX7kZNcgf/RLASDtbesNbb+Jf/EJUxMiZi1nu5fr+MRhpcZb
         YVu9cVdMPojZQGnk7V2R4olUCgh5xsj4dSwbCzDbttUOzFbS3RjHftXjk71rAQpFJ1Do
         TvmT81kL9tiRNl9K4QhKETZJh2aqIHo84yYmzK2McHW41rW3zEiQdl48wDCkNMH1bD6e
         DI4VpevoUQ4QB9IcdmfHMK6GINoqRyZgoe2/vhSgcC7MbKJQqriNDwBrN0CDQ2F+1IC3
         uPAjNBOfD/qc39uG7WNGpqHxjlw364ubp7BvHI8FY9eJFLcjVe6zl1DWH89h05doYvU+
         RYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuBRmTDLtgN417FwD87ZJbkr08uM4dGETokmcGbpo7E=;
        b=x15qAzr6Gos/T1S1JXaF6CUvwIFxZhkJbBRuwLmja7H+jY3l9eGdUo/S+XFaKuhG4s
         PmFliOAMVSP7EzAvjz/pbLtk0F8qECMj8fHnJ9GgMWeECwB0Ieryp0A4z0oTNYHxXUt0
         7AlulYXyvev8pz41BzoOsJj76SwCXrLzJkTFBZsB99MrfUfCx0p6GTqS2+6beJ1dDCwn
         fsOyIQRn2NCip29xlK7I9WefxvbYrRG9r0PARHSKN9KRPqWLDIDHKy+Bk+pOA8Xy8CKW
         YRf9aq0w3ikYAzQMO7Ogzj0zDNMeXHw2HRYqdKCGlqilqGtcOzKYlPG/5a3kUEHtqIU+
         mI9Q==
X-Gm-Message-State: ANoB5pnDtqySucc3HGlJO3hIQcwXoi8NCf8KJqkhPjptaFr9TnT5G14j
        Kk6IOrqeu9XYk/R43cRuBYzuyQ==
X-Google-Smtp-Source: AA0mqf6iQYvcqNP0orxkQWx0Eynf+/41JdVbnwDQn7uXd60nNEyRXvjFJUsyt8ZHcmvmRjL8XnunRg==
X-Received: by 2002:a05:6512:b81:b0:4a4:68b9:66bf with SMTP id b1-20020a0565120b8100b004a468b966bfmr10978494lfv.10.1671110344797;
        Thu, 15 Dec 2022 05:19:04 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id j6-20020ac25506000000b004b53eb60e3csm1155212lfk.256.2022.12.15.05.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 05:19:04 -0800 (PST)
Message-ID: <62c91a41-c4e0-340d-f564-3c909a5363f9@linaro.org>
Date:   Thu, 15 Dec 2022 14:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pmi8950: Add missing ADC channels
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221214232049.703484-1-marijn.suijten@somainline.org>
 <20221214232049.703484-4-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221214232049.703484-4-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.12.2022 00:20, Marijn Suijten wrote:
> These seem to have previously been excluded due to either not residing
> on the test board, and/or lacking VADC_USB_DP/VADC_USB_DM definitions.
> Now that the channel constants are included in dt-bindings, add the
> channels to DT as well.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pmi8950.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> index 7a857b2f3a5a..42a867685275 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> @@ -69,6 +69,30 @@ adc-chan@d {
>  				qcom,pre-scaling = <1 1>;
>  				label = "chg_temp";
>  			};
> +
> +			adc-chan@e {
> +				reg = <VADC_GND_REF>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_gnd";
> +			};
> +
> +			adc-chan@f {
> +				reg = <VADC_VDD_VADC>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_vdd";
> +			};
> +
> +			adc-chan@43 {
> +				reg = <VADC_USB_DP>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "usb_dp";
> +			};
> +
> +			adc-chan@44 {
> +				reg = <VADC_USB_DM>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "usb_dm";
> +			};
>  		};
>  
>  		pmi8950_mpps: mpps@a000 {
