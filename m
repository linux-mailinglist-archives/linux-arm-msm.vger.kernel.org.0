Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7DC17609B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 07:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjGYFsu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 01:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbjGYFsp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 01:48:45 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC05173F
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 22:48:41 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9926623e367so886302966b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 22:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690264120; x=1690868920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=db7jObuhHF5sO1ePbYpHVcEiKjDc4AYN49BBeUvqECE=;
        b=UuaUcf3CmpCgrW5PsVKEmQgCz3EJHaf8rOb4ERiRmyqNhnvOTZDRNTk8u56apWlSsk
         +ZwnvA/g18ZgmMPdrP4qg0k3HgliHUeC4eMrisJ8kFJ3zu28FQAhv6q9CfBybbhK6nTX
         l+ERY1J8CUCBj9teR7lio/JnVO6RV9uvyqTEl7RiguGQ4C+w65qwQV25HtS47hginbGw
         WdG3+UaQZQMGshXKXQ2gy1AAl3WX0zuV57t/hn+POyk+RIxfD46l8bq6qEQq5mFLQvek
         QI5XZnNINNfBPAyhJSfzHeNp7U8raLVuvxNSx180swydfbYfvv7YP43nQK1UV/nG5iMU
         JnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690264120; x=1690868920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=db7jObuhHF5sO1ePbYpHVcEiKjDc4AYN49BBeUvqECE=;
        b=ZI4xDo3X4dBqAuJQ8+7xLHWrLxkSQtRUob69h6xYl6t9c20wd/1JtFlNUEEAv209Oq
         8R2IrjkypL7HTn7ic1M+V1HAnBpYwaSLqck3itYiZUrLKjHaS7pIGS99F6KzTmDfXR0U
         nmdLY43N1l0MFHlUj7gDYU1YJhr3GeoY1eYqMUYHJxVA3zGIEB6MPTHDyxaBy7KXR+ub
         Twb4QIX3TCE46a9C4ct17i/HifAVk+P0eWBsrO0aded31i9xxeKS1ad6tEIGDSiWeWmm
         b1RqAtiNaYsjgIZe/VTVJcaTkDQ3JwZ69tSyDkNzkSYZsXSG4GKyW8nZSRAWKm41UNQx
         0/IQ==
X-Gm-Message-State: ABy/qLZoY+E92EfrvYLoFibYZv6YNyxnOpDiCNk2JY3vrAtA3N0k+fOR
        MV9j4sEYEINlC7ImrSjEAWf5/w==
X-Google-Smtp-Source: APBJJlGb3BfaT/FbfT9ufyHI/2h8HJmGpgTI1AqQItq9xpeW6o4NshTDmzGPvVhmWrODWiH5qYV5Ew==
X-Received: by 2002:a17:907:2717:b0:997:e791:e823 with SMTP id w23-20020a170907271700b00997e791e823mr11198027ejk.28.1690264119812;
        Mon, 24 Jul 2023 22:48:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090639c700b009934855d8f1sm7596369eje.34.2023.07.24.22.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 22:48:38 -0700 (PDT)
Message-ID: <5c899d97-c73c-cc39-9a99-d83a92f70cf2@linaro.org>
Date:   Tue, 25 Jul 2023 07:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-longcheer-l9100: Add
 initial device tree
Content-Language: en-US
To:     =?UTF-8?Q?Andr=c3=a9_Apitzsch?= <git@apitzsch.eu>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230724-bq_m5-v1-0-17a0870a73be@apitzsch.eu>
 <20230724-bq_m5-v1-2-17a0870a73be@apitzsch.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724-bq_m5-v1-2-17a0870a73be@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2023 22:52, André Apitzsch wrote:
> This dts adds support for BQ Aquaris M5 (Longcheer L9100) released in
> 2015.
> 
> Add a device tree with initial support for:
> 

...

> +&usb_hs_phy {
> +	extcon = <&usb_id>;
> +};
> +
> +&wcnss {
> +	status = "okay";
> +};
> +
> +&wcnss_iris {
> +	compatible = "qcom,wcn3620";
> +};
> +
> +&pm8916_rpm_regulators {
> +	pm8916_l17: l17 {
> +		regulator-min-microvolt = <2850000>;
> +		regulator-max-microvolt = <2850000>;
> +	};
> +};
> +
> +&tlmm {

Please sort all node extends/overrides by name.

Best regards,
Krzysztof

