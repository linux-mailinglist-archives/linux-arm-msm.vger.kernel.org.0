Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C25E6ABB7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 11:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjCFKQU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 05:16:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbjCFKPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 05:15:47 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4591E1F6
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 02:15:12 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id t14so9033585ljd.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 02:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678097711;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3pbhbSJq+ZjD9gAm1LG1AvuTXhrDcMqLXEUKg4jeqQ=;
        b=Dw/70j1shtqKVCMQRKqVeMr246XqcwpioJww0wYaTmKt3kAxYOwdCJWLg+HrdtGeko
         tIdefXbhRJAxVBDvqbdtnMEQPvCiBcrWFb820UcGPeyrci17H+ZwFjvvCHHw1qqpcDFz
         8zWxo8DtUzAm3KxxIbcp02sqaDpwu46qAP732vJCBamVbDb6ES79pbDxD6f3qQBkEnLa
         szY75sungEluCd7LDZ0FZ1Lc3RkilVnooc3iEOXEz8/kg4q5k099e8J5BZQhyPUshREX
         FwNSb+PEf6VH9JFWOzG9mO+jaWG7C3RsDretZfFhjJ4tctsjvBn+8UyCp+tTnnBM/Ef0
         nGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097711;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3pbhbSJq+ZjD9gAm1LG1AvuTXhrDcMqLXEUKg4jeqQ=;
        b=iswyOSzST71j2N7l/cbmWQPZ4hgZYBvwoLb5oHyWIhr9jQo6dCrEA+CekoQLEVr9fn
         CZzutDRogINlgPT4Zd7EXN95wXGdY9mzks2oBXy3xGzAGqcl+TeID1XhN3SWlgwQZRFf
         4J6qxrkhpuQUc2AG2BjBbNPRpjanJmqJz6p1TD6vEHJtODqN1x6HqViQa9jgrbu28DhD
         VbuGbSe3/RLZ6Z2aAm1/zZvnlpCbOHPogp+8jtAfzGnKNRXbUADl7QgpXJ93up4v3Q/0
         Dz9GY8s9Zf0xXIXbpvjFQCscEhwfNAUhuscpKxQYFhLIH5TvV6NhJKnJjiMFHPofB77D
         n7gQ==
X-Gm-Message-State: AO0yUKXxFFty+Dxj4r31LmTDsErx019BFMY4f7qMW6vErIz1Gb4ckEHO
        Ha62t9bxp4I/TmPDVeJ2+fNuHA==
X-Google-Smtp-Source: AK7set/6352seV4dB0uwZtsgIwCViYWmi4QRlYYXvs6JeuqengMsisaxhROtPxSZEMflZqm4c09ONQ==
X-Received: by 2002:a05:651c:199e:b0:295:9bb9:18c2 with SMTP id bx30-20020a05651c199e00b002959bb918c2mr3726329ljb.18.1678097711237;
        Mon, 06 Mar 2023 02:15:11 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id x2-20020a2e9c82000000b002935a8d9351sm1625753lji.55.2023.03.06.02.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:15:10 -0800 (PST)
Message-ID: <50724ddd-3fd8-a7aa-e9f5-67d87b7d56d4@linaro.org>
Date:   Mon, 6 Mar 2023 11:15:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: pm660: align thermal node names with
 bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230305154308.241651-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305154308.241651-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5.03.2023 16:43, Krzysztof Kozlowski wrote:
> Bindings expect thermal node names to end with '-thermal', so fix pm660
> and pm660l:
> 
>   sda660-inforce-ifc6560.dtb: thermal-zones: 'pm660', 'pm660l' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pm660.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/pm660l.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
> index fc0eccaccdf6..4bc717917f44 100644
> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> @@ -11,7 +11,7 @@
>  
>  / {
>  	thermal-zones {
> -		pm660 {
> +		pm660-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <1000>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> index f9b3864bd3b9..87b71b7205b8 100644
> --- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> @@ -11,7 +11,7 @@
>  
>  / {
>  	thermal-zones {
> -		pm660l {
> +		pm660l-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <1000>;
>  
