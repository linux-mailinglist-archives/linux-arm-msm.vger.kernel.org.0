Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5BA719C06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 14:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbjFAMYM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 08:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbjFAMYL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 08:24:11 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E96180
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 05:23:59 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f4f757d575so1094024e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 05:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685622238; x=1688214238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P67fxYh16dgbQUiAm6gB3BGUEV32rhaHVBpwn9EGqXg=;
        b=FEnRVtv2DVhHhckgL4vgzCtY5fx6oEh4knfrh0rjqapjLM88a1Cj3YDq63ciYL4v/B
         oLzrg7Rnzld+aelFR3ogw0iZWQ0Qnt6EHeq4lfcPHZjK6uF/XnwjL672iAW7MCSdstY6
         tQ0D/PdSPMNiF0wc6EGgTDAAfh5lxmq9BZxIKNZSJLWLo1ySOf5zQiOmDyJjw3hwrQIa
         mPeW8uBKs9WD6z+DjCwOiP/oNc/NFPQllD7OeVsNRtoEO2abWffGyj6snfamRfq+YzJu
         5TLkPxzdVkd8OUgl4ysnMX9uSBN4Vu2ORhEZrK7MZfGR4VzRi2jDMdWk5VVDlQWA+mKw
         eV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685622238; x=1688214238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P67fxYh16dgbQUiAm6gB3BGUEV32rhaHVBpwn9EGqXg=;
        b=iFsNS5dwUXa6aJuvgzJPCNoYZUkhxg1j4yaJ/+00d3/z6T1WphlODH2BlVWinj/3W7
         GNS1UZIeL7f7+AYAflfr+9LEAOklVpC04G529u1gYMSSmNxFhfP4rl/UVBXC3UnxlQvi
         CpYL9e38ZnwBadMbeBmPP1CyCkURAwnPE7qDFUf34wKfj4QpqplIfh06m+6UJnCvc7gc
         a7oLUzi6YZjV6PSPPWq0aTmX+0iQAguNY/CLXJ8RQrVO/4dGKnkvsThqvCkXODnvY7d8
         Aungf4PttleaoYi99XJuylV+e8+uLQH1Wnr+AmV6CmrspjLoOHaLOHLi6UJwmGmbqscV
         S+mQ==
X-Gm-Message-State: AC+VfDz4zSegNmGceQDzflD+dkOhPGKnGimcIXoxwK1o4gNRAWeYAuOe
        cq7Lw8mGDkzTbWz2q6PlZzQcEw==
X-Google-Smtp-Source: ACHHUZ53kUb/xNUNDuY8xov+Zw9RDnOfqdZlvePBoAPgBkVlJX1AuVgsQ6dH0lepObpBNUrDLuUY2A==
X-Received: by 2002:ac2:4552:0:b0:4ac:b7bf:697a with SMTP id j18-20020ac24552000000b004acb7bf697amr681634lfm.4.1685622237812;
        Thu, 01 Jun 2023 05:23:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id q1-20020ac25101000000b004f001b0eda2sm1073931lfb.56.2023.06.01.05.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 05:23:57 -0700 (PDT)
Message-ID: <e03833b4-896d-f8e2-c622-2f36c94b4f2e@linaro.org>
Date:   Thu, 1 Jun 2023 14:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8450: Add missing interconnect
 paths to USB HC
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230601120029.38859-1-abel.vesa@linaro.org>
 <20230601120029.38859-4-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230601120029.38859-4-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.06.2023 14:00, Abel Vesa wrote:
> The USB HC node is missing the interconnect paths, so add them.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 11560ec9f182..5cd7296c7660 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -4306,6 +4306,10 @@ usb_1: usb@a6f8800 {
>  
>  			resets = <&gcc GCC_USB30_PRIM_BCR>;
>  
> +			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			usb_1_dwc3: usb@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xcd00>;
