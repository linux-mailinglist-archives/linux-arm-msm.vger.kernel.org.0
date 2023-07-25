Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974587610FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 12:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbjGYKfi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 06:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjGYKfh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 06:35:37 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2193D188
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 03:35:36 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9924ac01f98so913865566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690281334; x=1690886134;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRSCjzoFlf7+1pwK2274OEG2qCHzv1zVFI3OEYWB7Ic=;
        b=L1ESNfLDThRmEQmyq3QCUnymgcDRa9+iMV1l0gch6YrnemwC+/tkPL+B7TmaO6Pvh/
         5cd2FDEeuJQZIe2/kkjbqTU/2w1ChrWHkTx17VDsvmmaxwtSdMzHv8SdYlfffCAvLpL4
         cxK4SgaE4gUXapWGotW0u05hBwCqeOqqr8mV/isGLZ2NC/QJ4mKTs+EXHZhceS3HCwfT
         KQMmYBIfazv7GjgIue973VYyYpM1JrkbDjTTwfSc0+9WUkdHDR41tItjmPoQ3FzHg+V+
         74mH8j3bp0zDZxr+Vu30SMhl4s8eMqlBL9R681gqSTTacMQzTHLLYslGKHjsMmBwrSGi
         BRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690281334; x=1690886134;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRSCjzoFlf7+1pwK2274OEG2qCHzv1zVFI3OEYWB7Ic=;
        b=ebBwf133qmmcuPZ2tEQr7Semz8tRfGqBjcJXQ5b7UqL4Mnhz5B2HY3lRu5E1bN3uz4
         YxuOuqDO31rpLUeAZs8hAwQx0314ynfiCLmxOb/taf71eW2FkHMgqXA0wj961JlRR/g2
         mHbaCdBFIhmA0N76uLokEHu60xn18gC/lR6ptl0FmVG6D+GEi8e00VW8tW6TOp38zTqI
         VaZ8KfHZxHwYNIkLDwiFs7YjUJSf3DGMpyHJp9lz26aVgG0LsF68qqjyVMJs50AHuLBB
         Q6UMWdk0PL4H9hCqge5oOc3S6p0GaS9Ad6xr5/jtm+IJGkevtY6ox5bMxc+SlU9n5J89
         +kng==
X-Gm-Message-State: ABy/qLYWizAJd2QeIt7+ulU/8DyEl3yCmdXSZWtpVx6A8kOY+5ppZ2w7
        wizEUVxV+75AJ3xTC5OK13CipA==
X-Google-Smtp-Source: APBJJlEeAYXZil/XyuB5ylTiwIPKbvsDFmDdl0tv2VrAlD7DtAQVb1lRFLJxpnumFOyiReYDJEeKFg==
X-Received: by 2002:a17:906:cc0e:b0:99b:465c:fb9f with SMTP id ml14-20020a170906cc0e00b0099b465cfb9fmr12834886ejb.8.1690281334516;
        Tue, 25 Jul 2023 03:35:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id dt19-20020a170906b79300b0098242730348sm8090252ejb.72.2023.07.25.03.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:35:28 -0700 (PDT)
Message-ID: <00980fa2-5f8c-d616-ef3f-957090c25d48@linaro.org>
Date:   Tue, 25 Jul 2023 12:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] dt-bindings: usb: connector: disallow additional
 properties
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Prashant Malani <pmalani@chromium.org>,
        Wayne Chang <waynec@nvidia.com>, devicetree@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 25/07/2023 12:23, Krzysztof Kozlowski wrote:
> USB connector bindings is complete, thus no additional properties should
> be allowed.  Add missing 'reg' property and change additionalProperties
> to false, so the schema will check for anything not unexpected.  This

An MIT linguistics professor was lecturing his class the other day. "In
English," he said, "a double negative forms a positive. However, in some
languages, such as Polish, a double negative remains a negative. But
there isn't a single language, not one, in which a double positive can
express a negative."

A voice from the back of the room piped up, "Yeah, right."

Obviously:
"... will check for anything unexpected".


> also allows to drop the 'reg' from other bindings referencing the
> usb-connector.yaml and make it required.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Best regards,
Krzysztof

