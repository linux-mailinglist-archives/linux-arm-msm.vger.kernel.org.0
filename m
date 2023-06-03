Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A507212A5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jun 2023 22:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbjFCUWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 16:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjFCUWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 16:22:35 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142CE196
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 13:22:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f122ff663eso4273693e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 13:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685823751; x=1688415751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSyBUVrj1zvCL/sUTHseoVK711z0KXIwGLcvgpyUHHk=;
        b=RLvVfI7AzvC36Q7HcKvYNjDgJyKOKL/r8Igprjwc4Y+DDzZyF2A9Bup8j7kTzdEBYE
         s7NgX1EeCWcoq79UGTrbkJ+ZXzXh7CWZwpJsd0YUPU53CRH34+kBgA92n+Q5Z3QO+IPz
         ZWgdy3lKRsk5SXNZcguZpUunA5UbvEBQlKJ+QakhdHO4iUex0/qr8u+6RFMymR+0W9Bs
         pHh5xfwHq9+KA4qfQcn/LCP5YiGTsxG5abNyVB8egX0GDXYo1hv2CjHi4AcbXVgbVv7R
         gZ9vOslzvCSYTee/aLddUdljENf6IbrbzO+Df5+OdCEz3aYwpM/pFMnZhso3QFAUmr9b
         gHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685823751; x=1688415751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSyBUVrj1zvCL/sUTHseoVK711z0KXIwGLcvgpyUHHk=;
        b=Dgg7lux49OHs43ktAE2O7V6o0gHPxrhSAUeiI3yTdA0N78kWUG89Gq5IF0uBVn/ScG
         N69ySjOS38E4p4DfT+Dbj+84jxz/0F+H8gyZ7sVb3fvn0hy8fMWlYoCDv2LLppIx7nH1
         WuoTWrG8TMIARJBuJwlUNOGlvbCQsFDJLmVQmRtJOfkTPN05BpHYCNCQCUA+SxwJwAy9
         GGYAI1foicbZUW3kg7sFrwW+6CgUywXohlZgwarrS3FphvhVnwhGWkmnKzHF8Xv4ovSO
         y3DimAAtLZU1K2gUlRuUKDIiCMmAOWfZYG+7eAkZYcwUsrv43PXpljGs9lY2oh30imKn
         0xTQ==
X-Gm-Message-State: AC+VfDyKJtmdugUVS24mWBmcIXNgapbsk+ZsmjxJI2J07HZ2byJEA1EX
        fnHGXPc8JLfmhjz55d1ykZLddQ==
X-Google-Smtp-Source: ACHHUZ7o8uDyjf9QyROk53P4mlHpRWaY/zwcS5y5ujLt+ILwxG0RXWzBbbqXNIiyshOpW4+WUXAPCw==
X-Received: by 2002:ac2:5a4c:0:b0:4f4:c972:981f with SMTP id r12-20020ac25a4c000000b004f4c972981fmr3421650lfn.54.1685823751161;
        Sat, 03 Jun 2023 13:22:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w1-20020ac24421000000b004f392625952sm572461lfl.26.2023.06.03.13.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jun 2023 13:22:30 -0700 (PDT)
Message-ID: <0fbf55e7-2140-751d-5347-f907a46ef78c@linaro.org>
Date:   Sat, 3 Jun 2023 23:22:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC 1/7] dt-bindings: connector: usb-connector: add a gpio
 used to determine the Type-C port plug orientation
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230601-topic-sm8550-upstream-type-c-v1-0-d4d97b4d8bab@linaro.org>
 <20230601-topic-sm8550-upstream-type-c-v1-1-d4d97b4d8bab@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v1-1-d4d97b4d8bab@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/06/2023 17:07, Neil Armstrong wrote:
> On some platforms, the Type-C plug orientation is given on a GPIO line.
> 
> Document this optional Type-C connector property, and take the
> assumption an active level represents an inverted/flipped orientation.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   Documentation/devicetree/bindings/connector/usb-connector.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index ae515651fc6b..c3884eed6ba4 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -114,6 +114,11 @@ properties:
>       description: Set this property if the Type-C connector has no power delivery support.
>       type: boolean
>   
> +  orientation-gpios:
> +    description: An input gpio for Type-C connector orientation, used to detect orientation
> +      of the Type-C connector. GPIO active level means "CC2" or Reversed/Flipped orientation.
> +    maxItems: 1

Should this be a property of the connector or of the parent device node? 
I mean, unlike usb-b-connector (where ID and Vbus can be simple GPIOs 
nearly directly connected to the pins of the connector) for the USB-C 
the orientation is not a connector's GPIO, but rather some additional 
not elementary logic.

> +
>     # The following are optional properties for "usb-c-connector" with power
>     # delivery support.
>     source-pdos:
> 

-- 
With best wishes
Dmitry

