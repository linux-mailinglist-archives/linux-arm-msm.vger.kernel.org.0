Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9586D4015
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 11:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbjDCJSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 05:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbjDCJSk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 05:18:40 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744D1EF82
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 02:18:15 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id ew6so114454792edb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 02:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680513488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fh11/vZEUZKLkOBCVhKAajLq2amko3vePl8fRjQBQK8=;
        b=jO+hd1ty05tIA5V7nI2eOUnHRMS+EPf51CpabQa3jghAv5h2DbI4FHNcAs2gFGGZaA
         jEWi/nZYYw6H8IhfXPWl6dnPoke5NJNxHPEq5kYFyI8gEXTi/qLs9LqaQiJprRQrjfQA
         jxyKrjQD2aqybCq83pV7hTa4viHZNnRjPQq9RIhUuS1pQABBwjh1bPnk9gs93evCTtNn
         ejIMYbXLJbzDdw9DSXmbVPpHV8YPoc91tePG374S8KeE4THZtaQMla1Nz6xOxX2tFL3E
         LNRd4+xyeZ8Y5M49fnL4DNADVt+L94e9KqZJoMBs1cHKxqvm0OJ4xQL1aiZhBlpBqIhB
         FQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680513488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh11/vZEUZKLkOBCVhKAajLq2amko3vePl8fRjQBQK8=;
        b=JoGLYBvky3vxgujuRph6hDOZ7NyJXvcPGgFqMcoL7B1SuGTTEe5j/awpb5RbjMUalx
         ckxqZHE+qDttbHEqGvachAUAofXBIpgBEkRX7saQLsZAp0NsqEp9dWgHtDJnKDbJ5/wn
         bOVjpdFt/bbtlRmbxC6eryQj8AXiW4DdbiQRUJrEseZTGSVSLRoPZYG56IWCxIZXTTZX
         qsXFN0A8i/cabkXR7d1gAqrRgJnip4xJ/X6B4V7LmWETbj1WJt7tM5d5LzLxhRknw5b9
         HyY7o6CWsXYbzFG51EflYo0HyDfKNn5Jacoo24zT7EBMcYHFiTg5nSf+5kFpKO6A4hmi
         q/xg==
X-Gm-Message-State: AAQBX9eUXr5yVcPbDma2/mM+d6rtcZQs44oxXq1poBSjkWUuWP2UksJz
        T9onTLwfwJJgDhnC2V4HVeOwWQ==
X-Google-Smtp-Source: AKy350af6ubpegssC3X+D9m3NP0v8LJfwv/yCXR+6WKWlEvRrxHGTUrdIWLbpsbQggiTg/ceZTFrmQ==
X-Received: by 2002:a05:6402:6d1:b0:502:24a4:b0ae with SMTP id n17-20020a05640206d100b0050224a4b0aemr34472116edy.14.1680513488612;
        Mon, 03 Apr 2023 02:18:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id b17-20020a50b411000000b004bf7905559asm4341659edh.44.2023.04.03.02.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:18:08 -0700 (PDT)
Message-ID: <48f71f9a-0d00-16df-fff8-5aa455918378@linaro.org>
Date:   Mon, 3 Apr 2023 11:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-pmics: fix pon compatible and
 registers
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230327122948.4323-1-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327122948.4323-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/03/2023 14:29, Johan Hovold wrote:
> The pmk8280 PMIC PON peripheral is gen3 and uses two sets of registers;
> hlos and pbs.
> 
> This specifically fixes the following error message during boot when the
> pbs registers are not defined:
> 
> 	PON_PBS address missing, can't read HW debounce time
> 
> Note that this also enables the spurious interrupt workaround introduced
> by commit 0b65118e6ba3 ("Input: pm8941-pwrkey - add software key press
> debouncing support") (which may or may not be needed).
> 
> Fixes: ccd3517faf18 ("arm64: dts: qcom: sc8280xp: Add reference device")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> index c35e7f6bd657..a0ba535bb6c9 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> @@ -59,8 +59,9 @@ pmk8280: pmic@0 {
>  		#size-cells = <0>;
>  
>  		pmk8280_pon: pon@1300 {
> -			compatible = "qcom,pm8998-pon";
> -			reg = <0x1300>;
> +			compatible = "qcom,pmk8350-pon";

Same comment as Dmitry's. There is no compatible "qcom,pmk8350-pon"
ccd3517faf18, therefore indicated backport (through AUTOSEL) will lead
to invalid stable kernel.

You must drop the Fixes tag, because this cannot be backported.

Best regards,
Krzysztof

