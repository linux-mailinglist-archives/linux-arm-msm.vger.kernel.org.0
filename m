Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1570A6ABDE5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 12:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjCFLMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 06:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjCFLMg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 06:12:36 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AB92885F
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 03:12:01 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b13so9201031ljf.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 03:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678101113;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tF2QtFJ6zNPhW7I4oiDzHUw1lz0luW83V+WT6CN1JE=;
        b=rKrbBbGnyYpCeGDUHtn27IvmYy1mDNlDStYnaIX8BrFMnWoDXXuxKUu5j+jWSUB86p
         kzep5TGpPUece+FUoCRvdhRg5CBaC0U68TGSOliG8csgVMc0Ezgmjpa4n/1/fk/CpoxH
         pHZ3fjrG9zzx5ReAkE5fn/YBj28wy0PY0ub5WINoLVr7M/qdxLr1jDg5v1OOJ594YWP1
         u/bzFYtXKXTjnXNgYIofERJLASQVe87xugP9dNt5eY77FZ3ogCb3wEOCYrTGAadX8Cgr
         QTzNpGiuJ5d46b/+bl/91ygbRihELzdk2OnEP+Zfwf2RIgbfqHgwfg76zqAPzXv/g8QT
         6Rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678101113;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5tF2QtFJ6zNPhW7I4oiDzHUw1lz0luW83V+WT6CN1JE=;
        b=XlHU27AWBiAIi/4TV1UKjv4n8B7WMfdQDzPm3qLKwvreh5dsiouL6CGjITpUotonUL
         gl0qgABxwi2WFEjmy7lrwTdr/FqUBg7hhhV1s+zyFXd8Ct+OSaxBzVqqutEVB5T3i20I
         pJg7E9CJlHIW8Nh566wM8xKxb252abpx+CnpWsLPP50cQRB54T/jQejIF7N9r/j/Mano
         PLMRpSpAWcKzqnugWqNE9dYYfBnsFT25g0QbjbGuqardOqW62jLY57Gf1GW7plT/hl7T
         b50cUT7d2YXTa86E7dTQg+9ofa6gdZ4rypatRFvxQd4MXONs3W4/6bJGNmyGP1wUwRMm
         LSWQ==
X-Gm-Message-State: AO0yUKWMeT+qyCg0NK1m1ZO2adIaFffew7mZ2/9D6oLZEA5VQehbvAip
        cITM4mEKKh6Jw1DBQs30xGVS0w==
X-Google-Smtp-Source: AK7set8vx8XROVX/gPmes3ByDAEtphu13/SZr3yPTk6ZTFpinYY05pDXaTEGpFgJZhZ30FOkHw0Epw==
X-Received: by 2002:a05:651c:2226:b0:295:b0aa:978a with SMTP id y38-20020a05651c222600b00295b0aa978amr4359863ljq.6.1678101113697;
        Mon, 06 Mar 2023 03:11:53 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00295b9d903b7sm1658686ljo.119.2023.03.06.03.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 03:11:53 -0800 (PST)
Message-ID: <2eb160ff-6d36-54c3-0c72-943b78fe338f@linaro.org>
Date:   Mon, 6 Mar 2023 12:11:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sc7280: fix EUD port properties
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
 <20230305125954.209559-10-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305125954.209559-10-krzysztof.kozlowski@linaro.org>
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



On 5.03.2023 13:59, Krzysztof Kozlowski wrote:
> Nods with unit addresses must have also 'reg' property:
> 
>   sc7280-herobrine-crd.dtb: eud@88e0000: ports:port@0: 'reg' is a required property
> 
> Fixes: 0b059979090d ("arm64: dts: qcom: sc7280: Add EUD dt node and dwc3 connector")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
This could use some newlines, but that's a different topic.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index bdcb74925313..71179182c3b8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3593,12 +3593,17 @@ eud: eud@88e0000 {
>  			      <0 0x088e2000 0 0x1000>;
>  			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
>  			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
>  				port@0 {
> +					reg = <0>;
>  					eud_ep: endpoint {
>  						remote-endpoint = <&usb2_role_switch>;
>  					};
>  				};
>  				port@1 {
> +					reg = <1>;
>  					eud_con: endpoint {
>  						remote-endpoint = <&con_eud>;
>  					};
> @@ -3609,7 +3614,11 @@ eud_con: endpoint {
>  		eud_typec: connector {
>  			compatible = "usb-c-connector";
>  			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
>  				port@0 {
> +					reg = <0>;
>  					con_eud: endpoint {
>  						remote-endpoint = <&eud_con>;
>  					};
