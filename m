Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F24AD716181
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 15:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232622AbjE3NUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 09:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjE3NUx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 09:20:53 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3959A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:20:51 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51496f57e59so3816846a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452850; x=1688044850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ea2LdewWSYBlTGL1pC0uVnJLZZioO8cfJgJDEPtNoG8=;
        b=qvydoxNAZHcUiT+Wxla0aaBfxHooTFXK0IF/Trw7A2o/U95eS5pNGk7nya8DU3YaHN
         VqSVNL8jYNpuvaMHVgCheZfgdBYEivZuPcOXK2wo0noNfFepqoA8vw/wYg/dXBRkXiK5
         jbgKSMCokog2ZTK6X5VD4tK1bCoKDOk/JemiAimkGQ92Rqh711M8pa9yyEVMT0g034dW
         iK2w9byBhHkDClsxWReyXeebR0jD2fus3SA/TKkJMPYK5qKVTLxO0H8330wH2m5nL3Ac
         hsN891MLZjnN9/8xa7GMqvdRtdKOcxFyZCz0pEfO8uMWCW4QU2SbvHV5gDvhphB3dzBB
         SU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452850; x=1688044850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea2LdewWSYBlTGL1pC0uVnJLZZioO8cfJgJDEPtNoG8=;
        b=NQfOF83v5leRT7p1amkLciKZ+gI4BShn8E7+vDv86WrY/V3mNhfxS4kf7OA0k+BSWP
         JW9NEsmpJ06nFu4g3nxX/u+17+oYUKxlAqg++hEvZyJqXa6ZzZ9NbMJ32q6mqs19C3dj
         MTdML4tpN+1d7UHUYhOYINMNwmLVAwrJA4DfdWxKNi+0erjjX9tdZUDzXCw5cis1TY3P
         WhUgLpABiUOUR4dABmlGjsUP6aezMy1Sb/1zzwPrAKXBVYiqvonky8+9N/xnzJKn5hD1
         +vmQKEnQCahTGNcU9DONH16+lpWdMS0kRnfTKYxfehyJcxp4XjaZCYmR3JoR6b7VLuoW
         mRaw==
X-Gm-Message-State: AC+VfDx/1+rIrFeU423GB1CMwnnMnqIZwSEyesMGUDvzPSuWAx0bTj6f
        Mks/wxa5KBiFMxr6s4ctdXO/zw==
X-Google-Smtp-Source: ACHHUZ5Ec8mS0WQOTPmfsRcm8kG86wAB7r6cdlwRv8fyLj+55BTyGZ0d5j3fIeUVp34EMJ4rhBObtg==
X-Received: by 2002:aa7:ce0c:0:b0:514:9422:37db with SMTP id d12-20020aa7ce0c000000b00514942237dbmr1488683edv.39.1685452850273;
        Tue, 30 May 2023 06:20:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id i12-20020aa7dd0c000000b005149c3fa632sm2798999edv.13.2023.05.30.06.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:20:49 -0700 (PDT)
Message-ID: <d2a69542-14e3-ea15-0c21-93d0df19fbf8@linaro.org>
Date:   Tue, 30 May 2023 15:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] ARM: Add Samsung Galaxy Express support
Content-Language: en-US
To:     Rudraksha Gupta <guptarud@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     david@ixit.cz, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230524230459.120681-1-guptarud@gmail.com>
 <20230524230459.120681-5-guptarud@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230524230459.120681-5-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/05/2023 01:04, Rudraksha Gupta wrote:
> This adds a very basic device tree file for the Samsung Galaxy Express
> SGH-I437. Currently, the following things work: UART, eMMC, SD Card, and
> USB.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---



> +
> +&usb_hs1_phy {
> +	v3p3-supply = <&pm8921_l3>;
> +	v1p8-supply = <&pm8921_l4>;
> +};
> +
> +&usb1 {
> +	status = "okay";
> +	dr_mode = "otg";
> +};
> +

except what was said - drop stray blank line.

Best regards,
Krzysztof

