Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A4F525CB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 10:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352992AbiEMH5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 03:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245317AbiEMH5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 03:57:35 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268276C573
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 00:57:34 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 129so4350807wmz.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z+VCyQ4FdNddQ9JeHnVFC+z2HG9qAdxbs5Dzgp/YOGU=;
        b=U7l70itwvDOp59iGQBatgtEC7/68noHv/4vGH1xx/gK7xvyggOGACYW2HTnqYKz3ee
         sJOFgdqbHCFjCU3aQQl/Rg1oYM5N1KLbqe1vKRIzZJVZGp8F92oIuvvKTgXHunrypO6S
         ario2rMzTUHJpt5W1RyDo5AEHkPMHc+amiz8oaY8qUe5AE3xTHUlsBYYKgvlD51IrLri
         vRObZRK8TQUiyUGNtiuAcZZd2XHd8DuG6vzyk5VAodEsSQguBUEFDQ4fWttJWbeAXFoe
         1t5doi5ttGiH+QvcINZYalUci9oo4Y9W/Xu2cBhRwzX7WUqbRGIPgfJBfrb++xH3GSeH
         Q26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z+VCyQ4FdNddQ9JeHnVFC+z2HG9qAdxbs5Dzgp/YOGU=;
        b=6u/2aDh33nPjnY0UI5vQKNlDI0vvFSfwovb0RdjYrtTdocHcsoh2PE+kMuGXDKweoD
         5gkYqv9M759DtFSKcOhZkxkXPxucJjABTgTQCrw5MOUJtxDOM/PpthpnhWX3HfWpD/cR
         CGTrrDVMraDgUA3K19YI/EDMEzbAJdOxV3srppkJRdj3Dt3XlR2wIAeq2qzaF2od9CXl
         syvPQkjP3Kx7/bbT0du6q+5eRnPKAMTynacziLRkjtefL0QEGT7k7/Ipg3vwdxpkEDBo
         MZOsTDhjGv8QTGiumRZR8O5RG3UFEnNLX8LDvEEo5iByLCv0pmbuBqodzcqCPfAHX/au
         CqOg==
X-Gm-Message-State: AOAM532jIW2hfUwW1lvRnsuYStbLBbz2UnPWEC7aOqaxD1KnGjcyR51V
        vDUkYGyT/RN/eAIOYk9TxZ1PiA==
X-Google-Smtp-Source: ABdhPJy4D3xJsnTbYAm3729KW2bXLN3aezoJhW288ATXwZYtmBFLJxapQ5HevWL2cU0I7YpH37KeGw==
X-Received: by 2002:a7b:c0c3:0:b0:394:4c67:b9df with SMTP id s3-20020a7bc0c3000000b003944c67b9dfmr13853307wmh.8.1652428652625;
        Fri, 13 May 2022 00:57:32 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y11-20020adfc7cb000000b0020cf41017b4sm297862wrg.19.2022.05.13.00.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 00:57:31 -0700 (PDT)
Message-ID: <828bc65f-e585-0fe7-c038-c750861c9446@linaro.org>
Date:   Fri, 13 May 2022 09:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add sc7180 Chromebook board
 bindings
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220512090429.1.I9804fcd5d6c8552ab25f598dd7a3ea71b15b55f0@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512090429.1.I9804fcd5d6c8552ab25f598dd7a3ea71b15b55f0@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2022 18:04, Douglas Anderson wrote:
> This copy-pastes compatibles from sc7180-based boards from the device
> trees to the yaml file so that `make dtbs_check` will be happy.
> 
> NOTES:
> - I make no attempt to try to share an "item" for all sc7180 based
>   Chromebooks. Because of the revision matching scheme used by the
>   Chromebook bootloader, at times we need a different number of
>   revisions listed.
> - Some of the odd entries in here (like google,homestar-rev23 or the
>   fact that "Google Lazor Limozeen without Touchscreen" changed from
>   sku5 to sku6) are not typos but simply reflect reality.
> - Many revisions of boards here never actually went to consumers, but
>   they are still in use within various companies that were involved in
>   Chromebook development. Since Chromebooks are developed with an
>   "upstream first" methodology, having these revisions supported with
>   upstream Linux is important. Making it easy for Chromebooks to be
>   developed with an "upstream first" methodology is valuable to the
>   upstream community because it improves the quality of upstream and
>   gets Chromebooks supported with vanilla upstream faster.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  .../devicetree/bindings/arm/qcom.yaml         | 180 ++++++++++++++++++
>  1 file changed, 180 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 5c06d1bfc046..399be67eb5d2 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -214,11 +214,191 @@ properties:
>                - qcom,ipq8074-hk10-c2
>            - const: qcom,ipq8074
>  
> +      # Qualcomm Technologies, Inc. SC7180 IDP
>        - items:
>            - enum:
>                - qcom,sc7180-idp
>            - const: qcom,sc7180
>  
> +      # Google CoachZ (rev1 - 2)
> +      - items:
> +          - const: google,coachz-rev1
> +          - const: google,coachz-rev2

The inverted pattern of old revision being compatible with the new one,
is done on purpose? You claim here every rev1 is always compatible with
rev2 ...

I don't think we discussed such patterns in previous talk. I quickly
went through it and there were only skuX moving around, not rev1 being
newer then rev2.

Best regards,
Krzysztof
