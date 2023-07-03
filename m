Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB9A745BAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjGCLxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjGCLxf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:53:35 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77C092
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:53:33 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso69576681fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688385212; x=1690977212;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T40hcjqQsqtD3V+CGaD0K6xhhrYMNwDGjQahR7beeRo=;
        b=GZl9oJQMO+uI7Gqr5JFW6bcYDA9bujEOjFNjl/P0w7EQ7HKpw4XrEJ2mbf9ZLcXhDe
         soXzthcelKl/388lL88QP3Ms5l8CfwWmOaBxJYcHywIOcmYiEhCrhKwQkHYYAKBYdvMo
         TbBZ0ABItB0aZP9KxzIZd2N6fcGIEaK/9E92D3SlvxMLjtaVk805SI1TzwX06EFLRA86
         Qz0UPlUaKEmYCmI8mkwPtk4IXCWnLzkerXCv16y/bckLs9BcgMwG1uZEKalwQ+nRxj1f
         BwQP30bU1BajTlvi+IZMJLUAUvko4GCLfCb62LVLcWZO59Td96OC32O30Nz6toWpSwty
         pLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688385212; x=1690977212;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T40hcjqQsqtD3V+CGaD0K6xhhrYMNwDGjQahR7beeRo=;
        b=QkGwY1N3dN+KkFJ4JbTUz6GigZVlpqH1+6fkOSxlhzPPRo1fdrQbHrl4vhwoJ5HDG7
         vKVHLSoMJN5WNN12tMXGH7OduVF4VaiUSZ+5nGmj1MHSzWIqNgFRF16ygr8tVofpVcRH
         MTPT9i3S6Ni8YXwji5+wyGSh34KJ2AmUkH+H0MDkQSWdmEHKIXg2XZdIbbylpGy2WaX4
         KSQY97ESlemy8oEGzCSR7LV/5+BLAsfr0TeNNQBe/5UHLcBWNSlugCHn7SR0fJhZAqq0
         J51TjhOzdo/MIhp6sIn6fcd28+uz/TeflPxvcaFoRPr+Nwa7vj76Bv6JuYEiuyLPqIzi
         UHJQ==
X-Gm-Message-State: ABy/qLZ3LDT1LyQzLjshQscF2SRvUmBEiMzWzjQxcZdnZ1tty2g7N20/
        ke2dXuMYEVgxDYdZf0g0j6bLBnHfWzBKM67kJxRwJw==
X-Google-Smtp-Source: APBJJlHs02jLbVaApnfbo/zPUNA4tpIWqxxrHCZ9uK/QT2jW4JD9L+bbCk9QQJkoSkE0yzN2aCjw9g==
X-Received: by 2002:a2e:8eca:0:b0:2b6:ee6d:b647 with SMTP id e10-20020a2e8eca000000b002b6ee6db647mr841368ljl.28.1688385212103;
        Mon, 03 Jul 2023 04:53:32 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e9246000000b002b6e87c213esm758655ljg.88.2023.07.03.04.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:53:31 -0700 (PDT)
Message-ID: <d7942ebd-d702-e644-b7d8-5b39d135dee9@linaro.org>
Date:   Mon, 3 Jul 2023 13:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 20/27] ARM: dts: qcom: pm8921: switch to
 interrupts-extended
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-21-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-21-dmitry.baryshkov@linaro.org>
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

On 2.07.2023 15:43, Dmitry Baryshkov wrote:
> Merge interrups and interrupt-parent properties into a single
> interrupts-extended property.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad DYbcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/pm8921.dtsi | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
> index fa00b57e28b9..360a179670c5 100644
> --- a/arch/arm/boot/dts/qcom/pm8921.dtsi
> +++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
> @@ -11,9 +11,8 @@ pm8921: pmic {
>  		pwrkey@1c {
>  			compatible = "qcom,pm8921-pwrkey";
>  			reg = <0x1c>;
> -			interrupt-parent = <&pm8921>;
> -			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
> -				     <51 IRQ_TYPE_EDGE_RISING>;
> +			interrupts-extended = <&pm8921 50 IRQ_TYPE_EDGE_RISING>,
> +					      <&pm8921 51 IRQ_TYPE_EDGE_RISING>;
>  			debounce = <15625>;
>  			pull-up;
>  		};
> @@ -32,17 +31,15 @@ pm8921_mpps: mpps@50 {
>  		rtc@11d {
>  			compatible = "qcom,pm8921-rtc";
>  			reg = <0x11d>;
> -			interrupt-parent = <&pm8921>;
> -			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
> +			interrupts-extended = <&pm8921 39 IRQ_TYPE_EDGE_RISING>;
>  			allow-set-time;
>  		};
>  
>  		pm8921_keypad: keypad@148 {
>  			compatible = "qcom,pm8921-keypad";
>  			reg = <0x148>;
> -			interrupt-parent = <&pm8921>;
> -			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
> -				     <75 IRQ_TYPE_EDGE_RISING>;
> +			interrupts-extended = <&pm8921 74 IRQ_TYPE_EDGE_RISING>,
> +					      <&pm8921 75 IRQ_TYPE_EDGE_RISING>;
>  			debounce = <15>;
>  			scan-delay = <32>;
>  			row-hold = <91500>;
