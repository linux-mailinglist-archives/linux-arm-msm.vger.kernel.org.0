Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24553654408
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 16:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235505AbiLVPOb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 10:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235377AbiLVPOS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 10:14:18 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AD92657D
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 07:14:17 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a19so2242504ljk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 07:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pe60z7sOPgdNmMoaBm9gqJAGwx8DeOE6G4rpNU/Dxso=;
        b=RXxD05WFgOXm4VLh4/C1VgYmc17QfRc+SWT877WZ2JXefQHZaUg24iiC2SHpijgCMu
         uDap1cnRuCP7gguQ0rZ9WL6EyS/VRAem5sQXeumBTKkDIIOn2mBfzWf6xDRgtPnyvmDm
         Rjst7FOX5u1s+lPXrGMKRphCcwkw6yVB3hEpvyvYFWKzMtLpa+GNYJvh/zWOwG4mdwKf
         ajO08O9qN1c5odb79KbWEfo+wD7ttuujsdUZmLYTpiNSEpE68qxaoE7fbrXyc39lJU8u
         SMUVPfez8U7/vZ0LyCPfGXYcxbjnhSsQ+87ODnUbgNORuIYIosdBWQiESPRaL7sk9WDD
         jgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pe60z7sOPgdNmMoaBm9gqJAGwx8DeOE6G4rpNU/Dxso=;
        b=O1kg7b0qsd6KrJg5nC4teLGIZ4F6XTJcac3iEZvdfBjGD9ysbXpy6GrA0h1T8eAXnd
         DqXKJn/UnLCUlF1+j96/zGPna9fB0g5sBOvTW+CpwwthcyOlhXHzlltC4ej4mv/UoIXC
         oCdfbvvFwAlouLElnfCVdONMoO9al2/zGxdJp4+1JN8Qv8X4/2UiEYz+ivyqpfL06U6+
         E5EcRmkLE6UuAh4GyjNwVEjKFOZIOVjWz3XZI7Z6WL8ysBpKmbLo/7p3k3+ElIpjYTxL
         /TOm7BFx7mpuVp89hcy3X+MpMQjK6CElEVfMcv2KMM9O7s5OAuB+eflryoRm/04APLyM
         VFMw==
X-Gm-Message-State: AFqh2krKiK5HeNrtHjaQTOSwaVZQ5h7EFn5oV0eNxE5ZbISidkzXY2vJ
        x+KKO1raJfH+OFgkBGmhwVerqMxF3O5t5Kad
X-Google-Smtp-Source: AMrXdXvFdNEKOncS2Cehjtfz9and/trFT/D/VuioBxLX6Czy8gPEXL7F9+N40PJvaLe5FuukbY1msQ==
X-Received: by 2002:a2e:82cd:0:b0:27a:c0f:30be with SMTP id n13-20020a2e82cd000000b0027a0c0f30bemr1778754ljh.35.1671722056313;
        Thu, 22 Dec 2022 07:14:16 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id o10-20020ac24e8a000000b004b4fefacd89sm96363lfr.139.2022.12.22.07.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 07:14:15 -0800 (PST)
Message-ID: <defdfa62-6c89-6921-e789-6e989a84553d@linaro.org>
Date:   Thu, 22 Dec 2022 16:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: sdm845-db845c: fix audio codec
 interrupt pin name
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Doug Anderson <dianders@chromium.org>
References: <20221222151319.122398-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221222151319.122398-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.12.2022 16:13, Krzysztof Kozlowski wrote:
> The pin config entry should have a string, not number, for the GPIO used
> as WCD9340 audio codec interrupt.
> 
> Fixes: 89a32a4e769c ("arm64: dts: qcom: db845c: add analog audio support")
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Cc: Doug Anderson <dianders@chromium.org>
> 
> Changes since v3:
> 1. Add Fixes and Rb tags.
> 
> Changes since v2:
> 1. New patch.
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index f41c6d600ea8..774e4352f299 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -979,7 +979,7 @@ sdc2_card_det_n: sd-card-det-n {
>  	};
>  
>  	wcd_intr_default: wcd_intr_default {
> -		pins = <54>;
> +		pins = "gpio54";
>  		function = "gpio";
>  
>  		input-enable;
