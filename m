Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8A55B20D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiIHOks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiIHOkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:40:23 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007D26582A
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:39:56 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id c10so10677391ljj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JpcpFpvEB8psImxmDG9KUsbNAcN0FY24XTZzbqr2fhA=;
        b=SCmxItyGtef6kl4mGnpwBHwGe9KQKyhfaoDBzriXQIS/YAPjZGGdUwWxfGDK/+tb3D
         orouZPkzszIruohQW+FWn5oPqGnwXg4370Hm8JxYCCVvkXKycUbk1MrijOr2S1XQQFVy
         jSsyymNhTxymERuJSZ+6WQyzonFp4mQgWTY1+oXJAe5zeRTo6fX1wmzZHXwpWpAKhQ1W
         akFnhty780mMqQI+f8G8WgZaJRo0hwci6y1O1AHjtXOVPGWh+kq5mmTmdCfbmm4ihp2c
         HUpo+n6Wuik/rM7AJq5ootNBr+h3GHx/TS50/f1hbaDnMfEqjHMWtvjfkN+CAjimURXY
         X2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JpcpFpvEB8psImxmDG9KUsbNAcN0FY24XTZzbqr2fhA=;
        b=inOSxdG/cOuXW5g4Gj1+hKClMKuVPgkk2ALm6DO5StIopLQ+R5DVz+Zoer85wjcPDC
         KFHTRb+OvStPIzSI6F86IWV/bkWU81SCHuQaRLaYzYqCPmbNB9Xx2Vf+U/LqblzWdKWC
         cVLhb1D+eP5x2kpHGuUS99NsksTGA3dzdS7KrQtRbNLHk23qpSMu89Z8QNrPwEbTFytg
         ocjtuIXbgGLASDQS+CbaRtdup4kHQLiAcoMwtjMZxrmsqqTRh5Xfo5EttGb3ZflVdE8g
         orgQ3eyccIoNu+ihRRyvkF6IT1F/b6piy5PvBkg5L4hNXZx5iWQraFIVWBlx5K6y9U8d
         sDpg==
X-Gm-Message-State: ACgBeo2PPmXII4c3T7wWh8KgeufnFyUqCOszsYTa/T9UP60rdjrdT0R4
        t2TiRNqyITW4H8Z662pJLnj0Mw==
X-Google-Smtp-Source: AA6agR6fkcqxGRSQf8QGpIsGuz/BaE56SevT7m1ZoTBkSIBzv61JfzIYDfG9VYWYedjvtmNU9YY2Vw==
X-Received: by 2002:a2e:bf07:0:b0:261:cafb:d4a8 with SMTP id c7-20020a2ebf07000000b00261cafbd4a8mr2479468ljr.268.1662647994755;
        Thu, 08 Sep 2022 07:39:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f23-20020a2eb5b7000000b0026bda31c10fsm250488ljn.61.2022.09.08.07.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:39:54 -0700 (PDT)
Message-ID: <d191cdd3-64be-4fc4-56d6-c0e6c5c80b19@linaro.org>
Date:   Thu, 8 Sep 2022 16:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] dt-bindings: net: snps,dwmac: Add Qualcomm Ethernet
 ETHQOS compatibles
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
References: <20220907204924.2040384-1-bhupesh.sharma@linaro.org>
 <20220907204924.2040384-3-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907204924.2040384-3-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 22:49, Bhupesh Sharma wrote:
> Add Qualcomm Ethernet ETHQOS compatible checks
> in snps,dwmac YAML binding document.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: David Miller <davem@davemloft.net>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2d4e7c7c230a..2b6023ce3ac1 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -65,6 +65,8 @@ properties:
>          - ingenic,x2000-mac
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
> +        - qcom,qcs404-ethqos
> +        - qcom,sm8150-ethqos

This must be squashed with previous one, otherwise patchset is not
bisectable.

Best regards,
Krzysztof
