Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 322E86375C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 10:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiKXJ7q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 04:59:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiKXJ7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 04:59:45 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F835131D
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 01:59:43 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j4so1839512lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 01:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uLVxA3yQxeJsXZtEUirJWHQKMadANt1t6I5SMmMyUzs=;
        b=gTV+FCVayaeo95KLyfwT7X7NCzSuAZGAUZqCHPJzJro15gjLhEsZin5+vHQSmhnR9r
         Tpol7bJ6jAT7Pp3n28Nk8Mp+qlvA4o14Bj8W/SARUiFygv6TZVHQ25wMy1G0ZM7BigGp
         ENsf1KFPHdn9wWgugLmS7F42EmBkailAUz/3TANizikTjjdZ0RPFijz9zUsEXjwDJ/aM
         FNFYgO7msNuCYWqKxQU9Gi5v+k9qd0HFtlneb+MMmtGi6GTqDEMEl8ITZM2fZPAfOMmD
         w8frOfKjyTnxB5zGar8vsypiR/Q6JxEIGSuEnetMmLu24q2PSBMomY27T8VrBPJvgrZD
         arZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uLVxA3yQxeJsXZtEUirJWHQKMadANt1t6I5SMmMyUzs=;
        b=GQW3c3LiPpdHRmCX/SNHSmrxtBvQWhSi4Fbrsa3JZUCOXekxYyORdQqenBe7QlzQNm
         QDN/GyEnR+UtaOYuI3qNK4s4DB07bbuaSOHjzZ+2SCJ2Jx7xu8MGpEkcGwhKhM1LGHYt
         3j76yjLJJe/0nTUNBI22k1z9+jV8ulTM+EFmIaZnQwH9kiR1SMauUymzTvD7LEgOOsYi
         QkQ/HAPoBRsRC+s9X14fdTJLTMynIpxnfi6cm77WI6R5TJEFwgatDNoYVXjnBf4sFZG8
         OsGWw2Qn3uvoKEgQLmpEz+Jf1dwMeyYWMzrEujA63fWfYKk5586b8k2uS7hGU7+934sm
         cyFQ==
X-Gm-Message-State: ANoB5pn9nFZ86RaKwfFHYDu6qFi8+WTxhNN3iMUWyPY4je1TnKBITVJ2
        GoZzZNG4J1dFlw5EYesAp1PDuw==
X-Google-Smtp-Source: AA0mqf7Ni/8WYAByN5XvDcKkRGcR9g6e7hzhW5WCPQC+CJZwj8ABjf9mNiNY/UAJctZ6mPXOT1sfRA==
X-Received: by 2002:a05:6512:324f:b0:4b4:f3c5:f195 with SMTP id c15-20020a056512324f00b004b4f3c5f195mr729506lfr.516.1669283982300;
        Thu, 24 Nov 2022 01:59:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i8-20020a2ea368000000b0027628240ff7sm59496ljn.135.2022.11.24.01.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 01:59:41 -0800 (PST)
Message-ID: <a3eeef2d-edb6-fb73-040a-832fb54c142c@linaro.org>
Date:   Thu, 24 Nov 2022 10:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sc8280xp: add gpr node
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221123104342.26140-1-srinivas.kandagatla@linaro.org>
 <20221123104342.26140-2-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123104342.26140-2-srinivas.kandagatla@linaro.org>
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

On 23/11/2022 11:43, Srinivas Kandagatla wrote:
> Add GPR node along with APM(Audio Process Manager) and PRM(Proxy
> resource Manager) audio services.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

