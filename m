Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE6D7BFA81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 13:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjJJL7n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 07:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231567AbjJJL7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 07:59:41 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7BC9D
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 04:59:38 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4066692ad35so51831935e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1696939177; x=1697543977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ij+DjJh1Cv+/0xPPGQ3pr7Ec12kvcxyGu0/MP2I6gEY=;
        b=WxL/1dmbLbcHbia5KHXkoPZDkqJiNNtDad/laM6Wub2XnSOkrrBpLy2vbC47hKG5p9
         hXB67OaCsc90x53qyJVrpQ0sH8m+ZHvCDxNHXad8O4CmzWVD0eKSZMw8+Zb6jcvjgSEt
         GjQgD2XbHJiRTeUA49Gevw4ZMMc/04OqjE7QCkYeh12bbHB5veX3d67hzAfks5ltlpqA
         WF75Gs2WUcv152YNNGUG6Najf8Hyj/gzCpNMSFxSG6qP1nYP6WY2WVd6B2YDQ7dAsiOH
         XnUpCAoPHuJUA4fJ0/7hiPbsE6oLd5uk0nqTvEtcFez0LYzZR4C+1tdsIsuhk1DXnNE7
         V5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939177; x=1697543977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij+DjJh1Cv+/0xPPGQ3pr7Ec12kvcxyGu0/MP2I6gEY=;
        b=mcIThOa4b2kkNb3DBdygaszr0BDA1pf7CEfU5PH0F0Ca5yEzX8mBJIvEYwBY7AUj7b
         jgMfa7DpI+oGm9m7RfQCpTYeE0x5m1kOdfimqVO2P8IC9Zg42DUV878jyf3+uIVB8RK3
         ANUvT0bo7K/SRhNKTM0MegwYeAvuQf26og6lxwgWiwpa2xJqdfRtCekje6UO3G5XJskL
         n6fz7yT55El7qqHWTHe1AEQkujuWTDZgMHFTrcTm/HUakrzN4ndbMlZCLtCl7tTqfxKb
         fqh2Q/ay4HvXkWavh/+OTCn8iWu4kFFF7uTs26IIy6Qiq79TIzl24pdWvC+Xslcal6i+
         lJWQ==
X-Gm-Message-State: AOJu0YzwPtR89IzMZhaBH+lqeu7G0t1EIvYzxbE76YZmKzzyY2OQozvo
        8rJowZZnTj5Pqf2WDc+Og8by8w==
X-Google-Smtp-Source: AGHT+IHFA86yg5RxNmYmm2h7/cVQ1VgFwmfHjOd0f6IUSrUdWBNY1qh2/GmlHtkcXrQFXHRv4MZuDw==
X-Received: by 2002:adf:e383:0:b0:314:3e77:f210 with SMTP id e3-20020adfe383000000b003143e77f210mr15862043wrm.59.1696939176895;
        Tue, 10 Oct 2023 04:59:36 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id x8-20020adfcc08000000b003296bb21c77sm11912247wrh.80.2023.10.10.04.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 04:59:36 -0700 (PDT)
Message-ID: <deb0e97c-2874-4388-80ce-7b2076c66e32@nexus-software.ie>
Date:   Tue, 10 Oct 2023 12:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qrb4210-rb2: don't force usb peripheral
 mode
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20231010-caleb-rb2-host-mode-v1-1-b057d443cd62@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20231010-caleb-rb2-host-mode-v1-1-b057d443cd62@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/10/2023 11:46, Caleb Connolly wrote:
> The rb2 only has a single USB controller, it can be switched between a
> type-c port and an internal USB hub via a DIP switch. Until dynamic
> role switching is available it's preferable to put the USB controller
> in host mode so that the type-A ports and ethernet are available.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
> 
> // Caleb (they/them)
> ---
>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index a7278a9472ed..9738c0dacd58 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -518,7 +518,6 @@ &usb {
>   
>   &usb_dwc3 {
>   	maximum-speed = "super-speed";
> -	dr_mode = "peripheral";
>   };
>   
>   &usb_hsphy {
> 

No fixes tag ?

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
