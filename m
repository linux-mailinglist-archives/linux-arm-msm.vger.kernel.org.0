Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3FFC6F3F3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 10:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjEBIhP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 04:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233158AbjEBIhO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 04:37:14 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62104230
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 01:37:11 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f1950f5676so35401495e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 01:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683016630; x=1685608630;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=slDIlxCzpTDEG7C8ch3ARU2YpQ8UOYPe5KwfSUBQkG0=;
        b=g+RSpRPgBqEI2VbBOoVxQGKpa3AMHuOEqbyIRgeDneAbNNoNKoLFCGmoibDbPugIHF
         3ruexdSS5iaVdF5K+SyQ/CdQaK7EQHF73roOyjKXZ29Hevw70t8GNVz0kTtPLtT8MS2d
         vmow0WxbwPOWeoW1J44SKkPWcI7o9cseXERy6hYOMQZDR25xSh3r+NRUfTvADOva4g6J
         0cSG8f0z+zzJSck4Oq2XeyeszmLIW1DlqFvLK8Q1r9zbTuoCby3UHdqhcsvR1bjp/4BA
         VlZ9CdC/yZybqL0zSRrQ7SjTf+QVSo1frMN/wdOk788euuiAUUXxjqNhzcTPChp4VcJp
         JVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683016630; x=1685608630;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slDIlxCzpTDEG7C8ch3ARU2YpQ8UOYPe5KwfSUBQkG0=;
        b=UAxlXBba1WXslepWQ8JcDBhdDXMBElY0D1gMMtzlP8RcdOtaplbJnoaZuiyH9bwBs6
         dh+I7bbyiFkoeIX8+JTCk3XD0sp5gcB3IJIbu062yb7PuRP8ZA++m1rM3XkKXPJu15KY
         QInxruiwW0sm0IgwurS/s+7JqV1Lr6Dkpl6ajGzFNqESPAXRCGRHUsxhsSy515dB6B2J
         9C7uTuPulb5/mV8/a7vwALM3LQCruCzyQtSxUXCjgcNOJyMArQPnSdkDECQNpwdxoRqa
         68J3goxRDtum639xqJtsBEwsq4refIgQJwpKvMeeNc1SEC5bt4Np7h7ShcmgmxfNM60D
         whkQ==
X-Gm-Message-State: AC+VfDxmK210VjTiBQ0GCSnwa1T+qsDE1Au28EFER49M9VXdx9B+V7zA
        Nd4ugEng2SCCOLaIbu0a6xXBAA==
X-Google-Smtp-Source: ACHHUZ4GLXjezsJUdfNAqEXfs4OLKLaSXBFQ+MZqXmikJdKCs4OEQl/PQUX9OqzEU4GO7wuqFkRgIw==
X-Received: by 2002:a5d:4b0e:0:b0:304:a40c:43c6 with SMTP id v14-20020a5d4b0e000000b00304a40c43c6mr12864429wrq.11.1683016630069;
        Tue, 02 May 2023 01:37:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e265:b513:556a:4149? ([2a01:e0a:982:cbb0:e265:b513:556a:4149])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4751000000b003063a92bbf5sm259473wrs.70.2023.05.02.01.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 01:37:09 -0700 (PDT)
Message-ID: <fec55fce-e156-9f15-bfb5-5f56dcdfdcef@linaro.org>
Date:   Tue, 2 May 2023 10:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 10/10] ARM: dts: qcom-mdm9615: specify gcc clocks
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
        devicetree@vger.kernel.org
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-11-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230501203401.41393-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 22:34, Dmitry Baryshkov wrote:
> Fully specify the clocks used by the GCC on the mdm9615 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-mdm9615.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index 556abe90cf5b..e81e5e3196d9 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -10,6 +10,7 @@
>   
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/qcom,gcc-mdm9615.h>
> +#include <dt-bindings/clock/qcom,lcc-msm8960.h>
>   #include <dt-bindings/reset/qcom,gcc-mdm9615.h>
>   #include <dt-bindings/mfd/qcom-rpm.h>
>   #include <dt-bindings/soc/qcom,gsbi.h>
> @@ -106,6 +107,10 @@ gcc: clock-controller@900000 {
>   			#power-domain-cells = <1>;
>   			#reset-cells = <1>;
>   			reg = <0x900000 0x4000>;
> +			clocks = <&cxo_board>,
> +				 <&lcc PLL4>;
> +			clock-names = "cxo",
> +				      "pll4";
>   		};
>   
>   		lcc: clock-controller@28000000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
