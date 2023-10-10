Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAF17C0180
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 18:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjJJQXQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 12:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbjJJQXP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 12:23:15 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A347DE
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 09:23:11 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-503c7767348so1599060e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 09:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696954989; x=1697559789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zGxdskynZq38kn996amRvHGUp58nLQDbuPG7+yxVYHk=;
        b=RjKH9wc4DYVG5kRtgu83t8mJYXDdFoJeN//M90qvdrhZ77a/+Y0zbK2yrMvhBK5eCH
         T3TLzjI5by3CeTqncv+coRdF2ae5XsCzRJPYnnN/gHD5xfSyM+mEWHC6HXTfNn5ncRuv
         EZKx6Gavr3vay2hKpz5CzrlAOWi2DoAV73H4AViu4iavZ1Q5lC8BMEl/OWi6Cp6gZ+lc
         RobhIa+J424Vy150O87Z/YWaGs2a1d4GKKreNbiMf+mtHAekos/nfYcab2Dq1MK9Wnxi
         hyA4v6cD44RDRtOI9Y9NQtdYgh0nEBFmvbvBtho5KDKutyohQT/ouvv81TWEpZgvpxga
         ZR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696954989; x=1697559789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGxdskynZq38kn996amRvHGUp58nLQDbuPG7+yxVYHk=;
        b=XfCbgYbKnEuzGl7FHlD4FDm16JkPbuGhnLI4K8tFS276Vxccp/kR9QL/I4iaO4y/rj
         SfsO7gKPBV/QGNSSSo1Y5KZnauX+3xJugJNSof/C1vzZSdR+te4boBMqCNrI8eT9YwmH
         nBqd+UQcJZLfCI99RQNaVdxgmUiS3o/9wPPGamiCYk0H9lV3WH1ZSDqH1jBdP+ED8jA/
         y1IikLpXvOI2D3/AbU0LXDCKjPcLihle3JTP4wtgahBkr56lKrE02fbCuyu9Ruri1NdX
         Lolw4++13ZnkReLwVAgUsKxfGXoOxkyWuc0L2jQGm1DT4vZXVnxoE/4OFYM3DhX2+jj1
         XyXw==
X-Gm-Message-State: AOJu0YzHjXrzAvPvT7LmGTeVePSgu+Vnj9rGRou2LX6u4OVP81wRBDIq
        NTZBRUIbYk+gp5iRAg+qm+sZjg==
X-Google-Smtp-Source: AGHT+IFTE6eOdZXoi8YRtnGanq+t9ep6GtcNWqfxr1sWycbErleyJS5/yW9eIoIOCZNMnyP4cC3QXA==
X-Received: by 2002:ac2:55a9:0:b0:502:af44:21c2 with SMTP id y9-20020ac255a9000000b00502af4421c2mr15010256lfg.5.1696954989429;
        Tue, 10 Oct 2023 09:23:09 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id t17-20020ac24c11000000b004fdde1db756sm1887519lfq.26.2023.10.10.09.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 09:23:09 -0700 (PDT)
Message-ID: <8d51e471-916e-e132-3f56-75804379c6cd@linaro.org>
Date:   Tue, 10 Oct 2023 19:23:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
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
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20231010-caleb-rb2-host-mode-v1-1-b057d443cd62@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20231010-caleb-rb2-host-mode-v1-1-b057d443cd62@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/10/23 13:46, Caleb Connolly wrote:
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Thank you for the fix!

--
Best wishes,
Vladimir
