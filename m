Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA3F6397F9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 20:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiKZTEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 14:04:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiKZTEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 14:04:01 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5481582E
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 11:03:59 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id r12so11576455lfp.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 11:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJpb+WkZomiEzVr3FB9WEc1c2EffiMVPclC8fGlh3s8=;
        b=dJgBE61y1TEmCKX4hb3KjCC5icYw0Rjg5nXCZ8mYvHKGctBqvJN8rZATLAR1yQEnjC
         Sj2cN7RDvYRRE/War1xcr8lYTXHbs3Psnuq/vWD5tE4I8eI6dgfpi8E0lfomzrmWU6sZ
         2dE6Nbr5P2Tc92US/3araYp2EOh42i9T2C4t+AD2IS58hrmctQN+Cfg35OhC89KV6nuq
         sOEHmvct96WKxyM7JvA4rYNGLNZZwaWB0SScG44WRu2nS+kE7KPhUZz+TLijpLGD0T6I
         5OOPFMmGhZDcXOQo4q5FmqQ0YpZUpflmtaLvpkhGR0b1q81ZCj1EcLNMD5binun0hcxX
         XomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJpb+WkZomiEzVr3FB9WEc1c2EffiMVPclC8fGlh3s8=;
        b=t96K3x8dSIVghAx28q193Nc06HsDu0pWurXZwcyPRIbR2cX/hO5ZzzUuEbLklDKu/i
         rdySjvURLrBiWN9t0ohgduaFb0LzByBAslFAL8V8s8mL+VyXn+i1VkhCYJMR/w4OApxC
         9fM60Vi6ke7Mss4nS3qeI++H/gZJUnegWw/v1QYe6i1XPq1VjtnAZlluHIxzIHfdB8v2
         G3LS9qhIQ0IqC9z59pfATp7eFofLJsuAg4hFYrv2GhU3uHigAObCLA963U9g4U2byAu5
         jziWKuQJJ6MhD358dsNJ+AFeRPO4FsEDsIh9n9fXVDCjL17j1GZBk20ZODKL4BFYi9YE
         Ffew==
X-Gm-Message-State: ANoB5pkf6g0lGxFqa5Fi7jHKqt1tSsEoKdG9FfihUCyGL2lsqTgYfq8C
        bYH6h2QEnMkkoBRBY0N+hopiYA==
X-Google-Smtp-Source: AA0mqf513EmQbR4frhOdq/bbbyDNS7W6KiUDqApBp0la6BHiUOGHcbkMtbdFVBN2q5QtFbEZzZ00vQ==
X-Received: by 2002:ac2:4d44:0:b0:4b1:2aab:7cc0 with SMTP id 4-20020ac24d44000000b004b12aab7cc0mr9740288lfp.553.1669489437839;
        Sat, 26 Nov 2022 11:03:57 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
        by smtp.gmail.com with ESMTPSA id b29-20020a0565120b9d00b004946e72711bsm998920lfv.76.2022.11.26.11.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 11:03:57 -0800 (PST)
Message-ID: <4a2a36ee-85d3-bf6d-ec19-87a89831f67e@linaro.org>
Date:   Sat, 26 Nov 2022 21:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 16/18] arm64: dts: qcom: sdm660: Add compat
 qcom,sdm660-dsi-ctrl
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        dianders@chromium.org, david@ixit.cz,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        konrad.dybcio@somainline.org, agross@kernel.org,
        andersson@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-17-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-17-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,sdm660-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sdm660 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index 10bf1c45cf6ec..f8ec728e67f3d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -154,7 +154,8 @@ mdp5_intf2_out: endpoint {
>   
>   &mdss {
>   	dsi1: dsi@c996000 {
> -		compatible = "qcom,mdss-dsi-ctrl";
> +		compatible = "qcom,sdm660-dsi-ctrl",
> +			     "qcom,mdss-dsi-ctrl";

So, we'd end up with two identical DSI hosts, but one has compatible 
'qcom,sdm660-dsi-ctrl' and another one 'qcom,sdm630-dsi-ctrl'.

I think, use sdm660 for both of them (for both sdm630 and sdm660)

>   		reg = <0x0c996000 0x400>;
>   		reg-names = "dsi_ctrl";
>   

-- 
With best wishes
Dmitry

