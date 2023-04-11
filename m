Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B236DD8D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 13:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjDKLFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 07:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjDKLFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 07:05:43 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052AE420A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 04:05:22 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id be27so8174065ljb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 04:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681211117;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RuzBVtpFbPcKyoEX3tglBEiOQK0I0vGf1qNsgKXvqOs=;
        b=AwuQZCuZlqD+ZeZkel+q+S2qqaICPkPfpx1JMxUR4+fGUFnJP5m6UWtVEwnD/w6nSZ
         fBlfFQDm38Sl1ngfbL6Q8sIZsdvGpw0sP6IbvO6Rwt6NE0ZO4sRIzAz1Ossv5jIkzCZM
         /mgPtQgBFl5wMrugc7rnN/Ue87mtzGHLyNNQz3tAPzDrZzIPKEp5FQW9trp2rePBBC35
         qCZvBu12T165EYYiYd6nNa+L2iyuDWkPDkDmZfTRjkQqAdtjNE9tgmW8HcK7U4AZmgEe
         roCxmlBVhd9cMjZScWGoE2Y51JpqWPR8fIOKXZaTTk+vT2k504Am/Qhv6HT3I3dk3t7h
         dNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681211117;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RuzBVtpFbPcKyoEX3tglBEiOQK0I0vGf1qNsgKXvqOs=;
        b=d28voPCaB1vYP+/bxXlCr1ofzeESBY9TG4KtPoDe8TWaZCiMUhWVHAEB3Uv+ZZ8tOR
         jIEv7/C+1l2XxI01oIEJKV/SdDPXUm55ant35rVb+7+YPwhu4oL4KKEJaE5FPO0p7w41
         xCoHwT/NXP3SomK+aP9TMqBeISxKbq90h+0FoQlspC/O+acN69VwFLnVgdQBt+7Gj2KB
         6vyRM4Muug0dylVzVdrlU7XSvVS5GtvWBWG3UrGXDXOi0hzOoszvV8jxAmxwP6b/gqMq
         e2JhKgA6E3xlJGUY5ezsZbbFGu5iynV6qgh7JcaaoydUsRIjmvbS7d2dbXblXD8FNzK8
         fIhw==
X-Gm-Message-State: AAQBX9eSBxbNrLuVurnbd+wgU3zuYOn0rmwU2qESM+d7VovQkTP8gyG4
        xMCEqbAt0jF3rL3Ujp/f+NlufA==
X-Google-Smtp-Source: AKy350YPlyO1iPJRzkFwS0URN6dmUM9S/rE1UkL9lLML1IIDP7JFadR/9MW3iUWnbQHHf+QeKsFP/Q==
X-Received: by 2002:a2e:9a8d:0:b0:2a7:7325:7e05 with SMTP id p13-20020a2e9a8d000000b002a773257e05mr2006303lji.20.1681211117017;
        Tue, 11 Apr 2023 04:05:17 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id v9-20020a2e87c9000000b002a7852b60f6sm496132ljj.58.2023.04.11.04.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 04:05:16 -0700 (PDT)
Message-ID: <61dacd01-ea28-3f3a-9af3-af6132cb11f6@linaro.org>
Date:   Tue, 11 Apr 2023 13:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] ARM: dts: qcom: msm8974: do not use underscore in node
 name (again)
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230410175232.22317-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230410175232.22317-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.04.2023 19:52, Krzysztof Kozlowski wrote:
> Align RPM requests node with DT schema by using hyphen instead of
> underscore.
> 
> Fixes: f300826d27be ("ARM: dts: qcom-msm8974: Sort and clean up nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I guess some changes has to be done more than once, to be sure they
> get written properly to Git.
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 8208012684d4..38d3ee152dcb 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -300,7 +300,7 @@ rpm {
>  			qcom,ipc = <&apcs 8 0>;
>  			qcom,smd-edge = <15>;
>  
> -			rpm_requests: rpm_requests {
> +			rpm_requests: rpm-requests {
>  				compatible = "qcom,rpm-msm8974";
>  				qcom,smd-channels = "rpm_requests";
>  
