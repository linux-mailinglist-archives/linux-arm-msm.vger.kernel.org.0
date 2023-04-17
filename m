Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B556E410D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 09:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbjDQHbu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 03:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjDQHb0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 03:31:26 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377A449D9
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 00:30:57 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4edc114c716so745861e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 00:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681716655; x=1684308655;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bH7hhGAZ1xrF+O/xhmRlsxx9fYdeyRenLFf5qdsWz8=;
        b=T5XUsvOgDS+hLtHnx6urp7ZmQvoTmuF45MX4auGyMjWlHzuXIM9PbnXRKVtNq2PJiq
         qepBwwS2pZuv92IcGwajH6QWvwGA4nh7G6X7qMxylQg2RGx6JYvonDqr7A0Aw5kzHOaJ
         h581WyTESLlMRGWQNPog7RZgfqAjXsSi0TehFKujOyiHPlm1rT2zXAc19GCkMbgRb+PL
         b8KM72C+VWK90lWnxKQqByuZxwJ9VlsqBrNOcnwRS+JdN8lxSvHP8wCuaAH9dq0i5P/n
         kb+J1qFBZYURvSxAJ0FZaqxbpdmJUSbxfj2zyg1dystUG9RBS4iN9mjM5xK5/leKSWCR
         LMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681716655; x=1684308655;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6bH7hhGAZ1xrF+O/xhmRlsxx9fYdeyRenLFf5qdsWz8=;
        b=HwtT6wZhjgZfrqRkM0QoCBt/0WTguJIFALq58F20ab3TymjsScHAjVinMHoOFUIFK9
         Mbxsb8GfIdyoEoSltmbHt5bV/q4HmveV2P/JD0ach6Jaw293A7viLQBqPmyvSso0a28A
         nO8tLbI397+imn8oDfHOrH8ls+6aFFyO1/aQ28BZRtrTL3DlQUazd3pHsYSEnbwWAkRx
         mjvEeNjCNN47D8svWnNrgZVWLQZs6mAUTxPy2X+hGhgJXIWbF+d10Oprpr7CH0PomIHW
         HOnpOWvr2ZhAIUzvsqzrndogqfJw5N+xtU2TvrO3eBbv/JWTaF27tcv/piu29LCa3j50
         6i+A==
X-Gm-Message-State: AAQBX9eki/HXHT/UYJf2tWNzi02op0VHfc3kxg85OBNATwB2aag8KBTl
        vbtr8fPqC8p+IXIA3+htl48Xsw==
X-Google-Smtp-Source: AKy350Z71kbWAzDkgmit77YNhvFRfy++O8Mu08OxCquFiv//38vO+Az5FWwFJT7vLam9hQveKYooKA==
X-Received: by 2002:ac2:55ab:0:b0:4dd:cbf3:e981 with SMTP id y11-20020ac255ab000000b004ddcbf3e981mr1452475lfg.28.1681716655499;
        Mon, 17 Apr 2023 00:30:55 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id y10-20020ac2446a000000b004eb0c12df21sm1960861lfl.128.2023.04.17.00.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:30:55 -0700 (PDT)
Message-ID: <bf9db17d-56f2-caac-c6ae-376dfc077da7@linaro.org>
Date:   Mon, 17 Apr 2023 09:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550-qrd: add missing PCIE1 PHY
 AUX clock frequency
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
 <20230416123730.300863-5-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230416123730.300863-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16.04.2023 14:37, Krzysztof Kozlowski wrote:
> The SM8550 DTSI defines a fixed PCIE1 PHY AUX clock and expects boards
> to define frequency.  Use the same as in MTP8550 to fix:
> 
>   sm8550-qrd.dtb: pcie-1-phy-aux-clk: 'clock-frequency' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index d5a645ee2a61..a08aa438bba8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -359,6 +359,10 @@ vreg_l3g_1p2: ldo3 {
>  	};
>  };
>  
> +&pcie_1_phy_aux_clk {
> +	clock-frequency = <1000>;
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
