Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D004E554D8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 16:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358345AbiFVOhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 10:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358249AbiFVOho (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 10:37:44 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B2C3C736
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 07:37:43 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id h23so34667226ejj.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 07:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Q7FWHUTEap0PZjswCQpJN7yAT4damqIiUlPO4JtpvK8=;
        b=AOmms+lpRy3WoF+seNDdWn3S8SWmvZ9HoIchhnWnpPEIzM+tHSaM8zmKl6LU0i7q9i
         fUZaXjmeZMeFkY3ccNRvGGU6l2Byap6ODfm5+0ShjqKyPtIKU2+qynYVvu8UxSkbaEFs
         TpPTIOSmE/oU8ZVw94G0/yXjq1481If+sch9z4/sVoPuYxwpz+AaM4SdzOxmY0ip4uq0
         rlCNSZfTxO8blnJNIAv5UC9mfc7Mu2Voy/TM1V01geSEYf8Lw1jmCF49TQoOY/FkQerb
         Fc+KkF/9Hvapk/e+ggpurD9sgkDQREd1Ux42i4QneAgEmumuI9CD5oQPrFztWzpyhgeo
         65Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Q7FWHUTEap0PZjswCQpJN7yAT4damqIiUlPO4JtpvK8=;
        b=eFD2VKz+MRuq3kgyiJp5rMukgSYZE1/TAxcVOk6FMWmr5+CS90KNnlzO24X70u84Ux
         mmk56l+ZkBKlkAnpCG+1zD4mSjMr+rjmTCTtF30tNY6IVZNb9yf6niduuJ9ksArSeCTk
         HDByGNs0M7OqHUmrvcQZkU0Y+ReoNGz/2OptIvGC+OC1HJvRyiIcJ2yenWPmiyzyKz8Y
         CUuQDZAtQRXk58YuNR798jT0jqErrDWwETXhk7+l0qVCdpqmPIClHWJe9fDh0fEwG4j9
         zCs+HJIh+aAtO+vjIlxKThqebJA8u2qHVv8JPN2sC2rd79XTY/5h0+PmYVqhoBzwG9HG
         AocQ==
X-Gm-Message-State: AJIora++N8gQtT4prv6ZS1kffB7XvQ1dJXWOgAcuH8YGD/AboUmKt9qy
        r4bEpvbYxxvaI/fU4WHcTWkfpg==
X-Google-Smtp-Source: AGRyM1u1RV97xZQnajZzn4UOSzoNgfTAf1p1d8b2E+yNf71kj+KdZvXEAp2Xl75lEO9HhsBsNaAC9w==
X-Received: by 2002:a17:907:8a17:b0:711:e3fe:7767 with SMTP id sc23-20020a1709078a1700b00711e3fe7767mr3395022ejc.380.1655908662250;
        Wed, 22 Jun 2022 07:37:42 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id en26-20020a056402529a00b004357f391015sm7935823edb.97.2022.06.22.07.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:37:41 -0700 (PDT)
Message-ID: <c54b9423-10cb-e174-44e6-61468efd333f@linaro.org>
Date:   Wed, 22 Jun 2022 16:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom-pm8xxx: Update the maintainers
 section
Content-Language: en-US
To:     Satya Priya <quic_c_skakit@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, quic_tsoni@quicinc.com
References: <1655874639-11273-1-git-send-email-quic_c_skakit@quicinc.com>
 <1655874639-11273-2-git-send-email-quic_c_skakit@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1655874639-11273-2-git-send-email-quic_c_skakit@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/06/2022 07:10, Satya Priya wrote:
> Update the maintainers section with latest mail ID.
> 
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> index 2568736..61bd0b3 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Qualcomm PM8xxx PMIC multi-function devices
>  

Both patches can be squashed and then applied by Rob.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
