Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 480DB7053B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 18:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjEPQ1O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 12:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjEPQ1N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 12:27:13 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBF826BA
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 09:26:52 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ad1ba5dff7so126152811fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684254409; x=1686846409;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+aR8jzGP7NWseFp633dudw7mMACwrOnvnWtwOpTJLQ=;
        b=mp7xIWiv4uZkFSiJf/tqZjWger3lA9gCuvDtOW7zKKCXq3ZHjdWOiD/9sQHahNURdL
         td/FJSzj32bGdHheeOs0i7gS/FkpAMkJOZ1cFXGf0vHPckdWsEG/03EeIexl51NPVDL8
         253GRfOkCvckt/V8k1oKh27B82SS3g9dhpHux5iojguQDirNKAyYN/vesZ+DAPlbcXSj
         KbZu4hSmKhTbZmxJl88oo8D3Cbrt350pjvROB+U7mbJymUz+XTImDtM647lPlY7o+6Rl
         8Nt3aNtFV7DzJBa1bOJTl7huN9HKt4oppaUue1T2txKcMBcJp7B2d0pTtVDreRtbGECh
         W2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684254409; x=1686846409;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+aR8jzGP7NWseFp633dudw7mMACwrOnvnWtwOpTJLQ=;
        b=PlTf6fH7kV/DGD45KmtFRL0V5B4Ay9cWzGFyJlD/idvSWih1GCN6b1C4STFYOCEtIJ
         HPQ8zpWk2Jvu2uU4hcBgNn6zTA0jY/NlwMId5Jn/EYcBAFrvdXaDo7xcHV4CqK7KQt+5
         oWqFDVQRxm2ORm782HmjyORYLGkMOCC72s54KBrBCHZVm8BwQ8JCDB+HAq1qHEHc4D+p
         5qTv0mdrN0b8XCTZPq4M56kTE1z0uBRnUUj1BVkz9xF+biGRm/r4Jo+KEFLNJ+oPnEMS
         FUTQ68LzIWiEzUHyZ6AjwlFWVPDfTWuq08MVmwNsz8QcKBEU6QKlY6cYNgQ5X1DIvuzh
         aSNQ==
X-Gm-Message-State: AC+VfDzvVBRID5c9/cmSnM2rJ78J514zrRDrH+fQ72kJQZ9ZwuzC68bn
        Lm3yTOQ97wfYfT5rqdYr2a3yUQ==
X-Google-Smtp-Source: ACHHUZ6kwUt1thThZPgHJYaqHKLVmzIr/EagdHGQTB/rTXUynYMDLk5EKD1fB7KwxRLuQt3LFTQTQw==
X-Received: by 2002:a2e:91cc:0:b0:2ac:7a39:9feb with SMTP id u12-20020a2e91cc000000b002ac7a399febmr9537168ljg.53.1684254409566;
        Tue, 16 May 2023 09:26:49 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id m23-20020a2e9357000000b002adf8d948dasm1370003ljh.35.2023.05.16.09.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 09:26:49 -0700 (PDT)
Message-ID: <2e9c9836-3829-69ae-0c9c-ca625965498d@linaro.org>
Date:   Tue, 16 May 2023 18:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sm8550: enable DISPCC by default
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230516154539.238655-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230516154539.238655-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16.05.2023 17:45, Krzysztof Kozlowski wrote:
> Enable the Display Clock Controller by default in SoC DTSI so unused
> clocks can be turned off.  It does not require any external resources,
> so as core SoC component should be always available to boards.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Changes in v2:
> 1. New patch
> ---
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 4 ----
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 1 -
>  2 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 785889450e8a..f27d5c657f44 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -419,10 +419,6 @@ vreg_l3g_1p2: ldo3 {
>  	};
>  };
>  
> -&dispcc {
> -	status = "okay";
> -};
> -
>  &mdss {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 6e9bad8f6f33..0a3a08336b46 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2684,7 +2684,6 @@ dispcc: clock-controller@af00000 {
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> -			status = "disabled";
>  		};
>  
>  		usb_1_hsphy: phy@88e3000 {
