Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC90597005
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239569AbiHQNiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239541AbiHQNiT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:38:19 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D737A2CC9D
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:38:17 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id w5so19043590lfq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=iz8NfZ2UfG9R0Q6JtK9cyZ3GXnjmaI3TRoBuTDq1Rro=;
        b=shbpVUOof8BkWZ8FwJUh33w4M0TTypDmYGlJ5Y0TKnM5QGjnGGq+xFRfXHhbPWD6Nj
         QO8+yF02PlmI0I0YS8RKNuiFf4gupmvN8/i5GVnKjKt2JsS1FP+D6WQ9e0XKHEamoPCA
         xDQOLmMg0UufHEUP3WBOmQPKdItvfup9ufxecf2UPS7hxbhFj17xfyZHItJsL2OeOuDF
         zFyCZyZw8FuYKORGErXD7/W6IpYh0n5RSVM7xWpgS8mcIHp49yY9Me5F1Nu/tlTZTmc0
         ukQj6EYFO1EehhP85GQM8kcqYAJ6sPdSb4R8z5AxVXXdp5fdRsyCAoHzzboj/tkGYji/
         gy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=iz8NfZ2UfG9R0Q6JtK9cyZ3GXnjmaI3TRoBuTDq1Rro=;
        b=YrDMjbSDeNN7Uj6YhXqgHR2Av0t/Pgcd+fv94XuN/bRpFdjvffiu79iYuizU19CHTy
         QpEmW/GlL+bJJMRqQ46NXG5lqh76JLJVxxG9YBIAGLuqFQgt47S5xNmdp64gI/QDZDb+
         M90xRAzs2ODyMOFPRJ06Wk4cV6O63FENJIW1O9lx43uoAxete/fWOlN8dcoSehY/SmNs
         RUOi3m6BDdhdhBZ1nus6jZvMWgvbH41uvjHcO6OOk+S0XvQYKB8N7QahHTDHL6qgTUlk
         6ZE3amW+FfksEV2wa22NcWJ9HegnEmx5ZcAASzBhMsbzbUpoBKL2xGFGx5pL0JlOEm9j
         fDqA==
X-Gm-Message-State: ACgBeo3LAxP60V1m01Nq3YhTcLoYhMX2ZMMMgcsLWuOWkUFhzzqB4LtI
        MAO6ikvRmODSjjKXPOEGDfc8lg==
X-Google-Smtp-Source: AA6agR5SKcTvItVXz7OXg5a4HDGW/7XkWM/ON7b0g6SrG+QEh56fntf85RD39+UJCQR8PUa4SHZJxg==
X-Received: by 2002:ac2:4e66:0:b0:48c:e34c:69b4 with SMTP id y6-20020ac24e66000000b0048ce34c69b4mr8432889lfs.85.1660743496246;
        Wed, 17 Aug 2022 06:38:16 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id h5-20020a05651c158500b0025e634498b8sm2216535ljq.48.2022.08.17.06.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 06:38:15 -0700 (PDT)
Message-ID: <d03f42a4-0bf2-98df-3536-efd6be66ff7c@linaro.org>
Date:   Wed, 17 Aug 2022 16:38:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFT PATCH 08/12] ARM: dts: qcom: msm8974: add missing TCSR
 syscon compatible
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
 <20220817131415.714340-9-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817131415.714340-9-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/08/2022 16:14, Krzysztof Kozlowski wrote:
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 8baca2a77717..0a9f252c88a7 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1234,7 +1234,7 @@ tcsr_mutex_block: syscon@fd484000 {
>  		};
>  
>  		tcsr: syscon@fd4a0000 {
> -			compatible = "syscon";
> +			compatible = "qcom,msm8974-tcsr", "syscon";

I noticed that existing qcom,tcsr-msm8974 should be used.

Best regards,
Krzysztof
