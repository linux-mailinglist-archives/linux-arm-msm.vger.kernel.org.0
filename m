Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A49701591
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 May 2023 11:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237462AbjEMJUo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 May 2023 05:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbjEMJUn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 May 2023 05:20:43 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB59140D4
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 02:20:39 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bceaf07b8so19724313a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683969638; x=1686561638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vBP0dMjWKo7R4JgqVzM+i/HyrAzIyY6+GQBm2IEiqzM=;
        b=Fgb5s9Pmpctbn5xKp5IWHh9OUUyJcDvHGT+e46MqI1Zi42OOKrnalAyOkzixWdb4Hm
         kMQ8vE0ddTlteF0S197eV81d5cukTfOBXM7YPic5o8VJZDFbcK6qKpz/AbyNyv6mX2H6
         wTgNnjWn8uaL6DCGJWIuCJT22g8lCUkR+OysrLAteuRwzwsuIDMHR/QxnnAZiyJe1epV
         Sv4kYDJUkWwzlq0Frvr9bJngP+Uf8FH+4ygxL+R7haU9Im0RyV8+O/zMz7lzrvjdDyvC
         q31u8sxxvrNRi1L99Vf+0pIZauVyu/wf6l8bAKiRNqpR08UrFZExP4gv9HEzEwz+hfLq
         pvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683969638; x=1686561638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBP0dMjWKo7R4JgqVzM+i/HyrAzIyY6+GQBm2IEiqzM=;
        b=KpzDT3O6iQln/1/an9wn3KaECxGJRa4Mcfu23LuFa6j2Ien1DmZ6fgb3Sh1kWlq4aR
         49VRrWpZD2D5l+8HHRTTNEeYPQAPfwPQCizXRK2O4VNcAnzmpqtNzm397UixEvkiW2ls
         cZnSbHy+5+B/kt+SdogGiEX2lGTSmR5HPek19BBoPRujHRYYD6d8dMG2vUHr51GzzNgk
         kn90VwJRZie6GA2W0GOKI9FcyZ/FZVlnmIAZs6jdmWYD+nP7orye5WU+dBKsGlQhInwu
         OUtw3WCUqfn/T5SuIFGy8ReyBMxZvjnF+XTr5VwhYYLVYCdEjfy9IfluEE56XtsQ/l29
         mPQQ==
X-Gm-Message-State: AC+VfDxt/HSdbq+Qj8bx6OHvKY7TRJ3nb3Q4VSuzRotaJ7TBnYFxllGM
        A/GdWdZ3tkU+e6OxHXOEYZaU2w==
X-Google-Smtp-Source: ACHHUZ5Hsfzy0RPgtk019w6qQaf8LB/U2dJtRDkaxFgsrN0NXrR7jDYm/aA9cW4Y72Y4W5vgb4bFaw==
X-Received: by 2002:a17:907:2d2a:b0:965:b087:8002 with SMTP id gs42-20020a1709072d2a00b00965b0878002mr24741750ejc.0.1683969638386;
        Sat, 13 May 2023 02:20:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:1d0:810a:586c:c5ba? ([2a02:810d:15c0:828:1d0:810a:586c:c5ba])
        by smtp.gmail.com with ESMTPSA id e28-20020a170906845c00b0094e84314762sm6573709ejy.187.2023.05.13.02.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 02:20:37 -0700 (PDT)
Message-ID: <0954a80d-9151-4be3-dcee-e42ddc0b5300@linaro.org>
Date:   Sat, 13 May 2023 11:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 09/10] ARM: dts: qcom-mdm9615: specify clocks for the
 lcc device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
 <20230512211727.3445575-10-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512211727.3445575-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2023 23:17, Dmitry Baryshkov wrote:
> Specify clocks used by the LCC device on the MDM9615 platform.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-mdm9615.dtsi | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index b40c52ddf9b4..556abe90cf5b 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -39,7 +39,7 @@ cpu-pmu {
>  	};
>  
>  	clocks {
> -		cxo_board {
> +		cxo_board: cxo_board {

Maybe it is possible now to change the node name to cxo-board-clk?

Best regards,
Krzysztof

