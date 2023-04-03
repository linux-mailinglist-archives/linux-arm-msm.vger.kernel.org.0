Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFFE26D45CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 15:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbjDCN2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 09:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjDCN2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 09:28:38 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08169A4
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 06:28:35 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id x20so30322114ljq.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680528513;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTBu3T1hJbXzcrjoGIJunNPzVFd+efBZWIx71bT93xk=;
        b=wQ0g8/V8tDhuICVtLAptLwNJswGIpGOW6dhlyRB3fdbSiFnwK8HpSJuArQuskuSsfH
         LvY7E6Ne5GR+Tjqmbt23wr9RqB5q4kgeXKguw8SwA+MFnlEgbEzOjvtCQVYj5aoaVqNO
         lwpevotRMsU9eRkylFiVH+0Jn4LkvPT4JggfOHZoJc/bbYcBXQnI6hfEOaXSbLPH+vsn
         IixYvcaQ/cVHgIdFDtJAy9wCq8pN/U1lNJSPdihtHJSLckoI0LDZzRHFAh2lrBQY1IZp
         CD4pjmRNTeaEnaUX/NI4xmOtBZbDGaxJV6cFMel0u9oeknXft25TIYWkNmCqYMIoQhyn
         HCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680528513;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTBu3T1hJbXzcrjoGIJunNPzVFd+efBZWIx71bT93xk=;
        b=t2WRqA0PWeMOKY/VZ1pHuk9D8q6oKy1PKA17kdEwOELGvgUv9SxwDg+l87xIkVFtsk
         wwHznCKX8IbIdBMA86wvo+Xt1DtaFQSFugSjCYnzQciFYNPssOX19+Yii+Ne/3AQEw6g
         6nboXFu2uQTmiM+884xplQTUFclhL9xZwbEh16R5snWOh9YRTjZMiE0gJBPBOdX/SffY
         N/ZjjfyMj5gWdVicw8xBPKqOV9aBXbdBIRTIOAAPJ55Z/ssnnuko7aIds54jrvd8RyYf
         zVegWq3U/xxmPYyeQAKfGuTJL2k9FLwA8P6gSgWDDVVcbfGtlVXsx3/byG2autABZJ7y
         xyPA==
X-Gm-Message-State: AAQBX9ddSakFN3BLaOO5Un1Dxsw3leCkxNKbCDM7vZHJqMOC5bo8ZAKd
        Pk3MEjV78qr+2QA/Z8+fEB0U8w==
X-Google-Smtp-Source: AKy350bltB/j+7gkyzcUfPeXeSlKDE+w+ZmetH3bB5XqsR5v53b4LkVVARBVVF8mPwYthu4p/dOhxw==
X-Received: by 2002:a2e:b0c4:0:b0:288:7a51:3882 with SMTP id g4-20020a2eb0c4000000b002887a513882mr10477487ljl.10.1680528513306;
        Mon, 03 Apr 2023 06:28:33 -0700 (PDT)
Received: from [192.168.1.101] (abxj135.neoplus.adsl.tpnet.pl. [83.9.3.135])
        by smtp.gmail.com with ESMTPSA id t15-20020a2e9c4f000000b0029ab1f2b196sm373133ljj.24.2023.04.03.06.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 06:28:32 -0700 (PDT)
Message-ID: <1db568b2-4f1d-736a-1987-6c2b8359a26d@linaro.org>
Date:   Mon, 3 Apr 2023 15:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: correct Soundwire wakeup
 interrupt name
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230403132328.61414-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230403132328.61414-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3.04.2023 15:23, Krzysztof Kozlowski wrote:
> The bindings expect second Soundwire interrupt to be "wakeup" (Linux
> driver takes by index):
Seems to be a common occurence with drivers that were written a long
time ago but have been updated for new hw since.. Perhaps something
like of_irq_get_by_name_idx(..., "name", idx_if_not_found) could
be useful..


> 
>   sc8280xp-crd.dtb: soundwire-controller@3330000: interrupt-names:1: 'wakeup' was expected
> 
> Fixes: c18773d162a6 ("arm64: dts: qcom: sc8280xp: add SoundWire and LPASS")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index af7bee14fa06..cd38320dafda 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -2606,7 +2606,7 @@ swr2: soundwire-controller@3330000 {
>  			reg = <0 0x03330000 0 0x2000>;
>  			interrupts-extended = <&intc GIC_SPI 959 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "core", "wake";
> +			interrupt-names = "core", "wakeup";
>  
>  			clocks = <&txmacro>;
>  			clock-names = "iface";
