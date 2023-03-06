Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A10A6AC1CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 14:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjCFNt6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 08:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjCFNtt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 08:49:49 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FAF5582
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 05:49:47 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id b10so9738362ljr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 05:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678110585;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y1BGEIRMWSHjbsB2FPiNXO7X+3l1xJcvVqBZYLtrauY=;
        b=lRuvj88gHAB2KjnCzLGZIAIcTrNKmmoh4C+uOGQedzERaBAogzAR2PqRdEPisQjave
         8MN2byPUhLw/MI11b5Tp2wd6YWtu75JtQLAYq+4To8s0TZbjUIycC3kKzQqT9hGPeASx
         maDZzkWY4oUpKqqysSJEmSKNAYwHBh7MTqh+wwJ++zSGDZa5FNmiSrvCro0k2dyqD1wX
         bPtvjOkSSPkdbUMpV2hwDamIMKFrIwVm6SniSTCbwTGX+XMpBoBLiiQPCC7Vu/8hJY2O
         JGHuz5NgFdyGZrryCo+ZkdP0eP86FORD8dW8eA5dhjs8zM5dKBZd1e7xoxHe532/L121
         IRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110585;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y1BGEIRMWSHjbsB2FPiNXO7X+3l1xJcvVqBZYLtrauY=;
        b=TAU5XTqpSHeB7CgpuWu33TjUg+ih3e6r74/HqYQAVAP5VhD+PnbRWkB5D3dy6eXLAf
         GedfUFMEYdCA+Twz93YfZrlWXhQuQmIsNJzPwqJRYCB9wggUEto2Ymh1NTb45G3w/+Ff
         KogV81wrpcrmyLp05s9k4270zxFAVqI792VSrYqKdx5bKn6z7aWZU4Uq32DP055pVkVA
         GOxIOtGYEQiVp1cjil7B4Fqa6SKXk1B1LSD8xU+W1VVuPnOb/8aEaq32WsdfZh7kiIPs
         cIr3dPh1ZwqcoOcFajOBU+gMs8oIpgPifFM4cpjAt9sjQcxbn1BW9ASVqnhgyQwTPihh
         qWeg==
X-Gm-Message-State: AO0yUKWWxxvVozS8r7n3GcbDIwF3B2RlKfdyDYZAlqEjCMA2MJSuGSeF
        7OcpU3kihQ8uJrnKreuy3luXlg==
X-Google-Smtp-Source: AK7set8S4qI66SDB2DywmE42/Yc7B4GidHBVetnoh5gBPNUZytiQ9RDeQ0ilMHgn6Q/YrQ0OkP0ODA==
X-Received: by 2002:a2e:9f47:0:b0:293:4e4b:bf5a with SMTP id v7-20020a2e9f47000000b002934e4bbf5amr3492066ljk.1.1678110585541;
        Mon, 06 Mar 2023 05:49:45 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id d2-20020a2e96c2000000b00295a2d07558sm1734038ljj.112.2023.03.06.05.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 05:49:45 -0800 (PST)
Message-ID: <16c1ed3b-4721-bc78-7f92-6b9faf8603e1@linaro.org>
Date:   Mon, 6 Mar 2023 14:49:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/11] arm64: dts: qcom: sm8250: drop incorrect Coresight
 funnel properties
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
 <20230305125954.209559-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305125954.209559-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 5.03.2023 13:59, Krzysztof Kozlowski wrote:
> There is only one output port, thus out-ports should not have
> 'address/sice-cells' and unit addresses.  'reg-names' are also not
s/sice/size

> allowed by bindings.
> 
>   qrb5165-rb5.dtb: funnel@6042000: out-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
>   qrb5165-rb5.dtb: funnel@6b04000: Unevaluated properties are not allowed ('reg-names' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 2f0e460acccd..88870d9e3348 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2799,11 +2799,7 @@ funnel@6042000 {
>  			clock-names = "apb_pclk";
>  
>  			out-ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> +				port {
>  					funnel_in1_out_funnel_merg: endpoint {
>  						remote-endpoint = <&funnel_merg_in_funnel_in1>;
>  					};
> @@ -2904,7 +2900,6 @@ funnel@6b04000 {
>  			arm,primecell-periphid = <0x000bb908>;
>  
>  			reg = <0 0x06b04000 0 0x1000>;
> -			reg-names = "funnel-base";
>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> @@ -3220,9 +3215,6 @@ funnel@7810000 {
>  			clock-names = "apb_pclk";
>  
>  			out-ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
>  				port {
>  					funnel_apss_merg_out_funnel_in1: endpoint {
>  					remote-endpoint = <&funnel_in1_in_funnel_apss_merg>;
