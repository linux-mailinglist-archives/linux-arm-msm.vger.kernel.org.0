Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0964553A80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 21:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353791AbiFUT0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 15:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353545AbiFUT0x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 15:26:53 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE61252A2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 12:26:52 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i18so10394595lfu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 12:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2RzAy2FOEpehPxnH3bYSSH7G+sG4HLDPrOEUX4d5sdI=;
        b=ChyHumwecOmxJKrDdm8DqEyB3r1ddFNdGSENW+MsnzNj+1sYdDtKnyUowfbakTpRqe
         nYD+ao4oB2Rs/6dScmf1wiNFYuPea8eTQPGKtp3W2kEF1erol3vEffbceWhaNbsL/2vP
         WF+KhSkqMNKOJn9dT86IrK0H8RXCiXaksMhwLMwrPJSvKkdNcRmeNk9sE1A+9AqEtkTO
         y2ncUDWnmBGCp7AzAoHcaqkw40fV0xYNv3qMLyfnVVQkDsofsNmrQICQipSh+FCxe6ob
         u7RRYxk3FOiO7EAf7hE4kKFEhEismcZJXkkX/Cr0HiBbZzVDOLngtSO+PlbIf/pVhgS6
         F6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2RzAy2FOEpehPxnH3bYSSH7G+sG4HLDPrOEUX4d5sdI=;
        b=q4jUNlpvL3Ou1nZSZnEVZz+YWyAWUTD06sdtj2zXoFpT/0VGf0fkZuTz+lfYWqwl+l
         mbLhbgJZAyNsE97wc2xzQsv17bo5qvO+Ke28Kdx+LeYwi5qGsUieT/43RS6SLQ7N6cgC
         WpE3NHTUu5aum69lFe0suceBZuDaUuqwQ68HcSyiXWODH+dOZWsKbJmEcfQ3yJ0XnuZp
         b4qO0X/1vW4QFGbqInC5b5pWtbQiYK8PlJVsu6fjb8ef+GItGop1Okz0zUroV55Jg06P
         1C8JNKBbzUTM96JjjR/mfYIdHfyG7W9p7jG3zyvQl0UKhRHdZZmi2EXCBoFUFJCFWwvu
         DUpw==
X-Gm-Message-State: AJIora8eyr7C/gt03bhy7+JmpFh6jJrHVEST7BEFwxjbQalTPe7ju7lD
        wydfzgdmJhIQZEmQxyozx9SQOA==
X-Google-Smtp-Source: AGRyM1s7P82vI50epzV9gPcSLKEFMb+7oZjLGtL9ab/+PU/VZM1ate8rAQpqED1MUI6HBZqKS4zprA==
X-Received: by 2002:a05:6512:3981:b0:478:54e2:7003 with SMTP id j1-20020a056512398100b0047854e27003mr17468375lfu.416.1655839611736;
        Tue, 21 Jun 2022 12:26:51 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.230])
        by smtp.gmail.com with ESMTPSA id z11-20020a195e4b000000b0047255d21179sm2273438lfi.168.2022.06.21.12.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 12:26:51 -0700 (PDT)
Message-ID: <834d92c7-fd0a-d015-c4ae-2fcf3f1a77fb@linaro.org>
Date:   Tue, 21 Jun 2022 22:26:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8992-xiaomi-libra: split
 qcom,msm-id into tuples
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Kumar Gala <galak@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>
References: <20220621185649.37391-1-krzysztof.kozlowski@linaro.org>
 <20220621185649.37391-3-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220621185649.37391-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/06/2022 21:56, Krzysztof Kozlowski wrote:
> The qcom,msm-id is an uint32 matrix, so a list of tuples.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
> index 7748b745a5df..15467b697e94 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
> @@ -17,7 +17,7 @@ / {
>   	chassis-type = "handset";
>   
>   	/* required for bootloader to select correct board */
> -	qcom,msm-id = <251 0 252 0>;
> +	qcom,msm-id = <251 0>, <252 0>;
>   	qcom,pmic-id = <65545 65546 0 0>;
>   	qcom,board-id = <12 0>;
>   


-- 
With best wishes
Dmitry
