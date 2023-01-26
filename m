Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED3F67CA67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 13:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237024AbjAZMB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 07:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233130AbjAZMBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 07:01:55 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377DB6227F
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 04:01:48 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id bk16so1510629wrb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxZC6LLZuJ2Wkp1f5+/EfRQ8da/gCgTKGWvHnHflOhU=;
        b=Rswj04CGt0Ro3ujr1S3ZR7Y4N7ASGIziExdcXQQ1t0tAHoOBAp+Rv5Ajen5TTCq6Uz
         V+gbLHslr8DIqj/sRgvvvf8NUzKPPd6cmc9xvD1L7rcVbwPmzDsw3cAt+hTyMsnIl2PM
         rgekxtRTULXWNdJGG/boM6Zhy9E4nKwbd+2Nja0PJkbK/LewLdXrLTCKK7crMd27onpI
         n8C54T/Wl9738vrpLNe2zjqr1R6cr0NVVjTzmHzTSL6zGTDH6BsMb/kPsihpsNZP6JV2
         4KMrSIN3h6M0XEtV1Vs7I6kkZoOtFnpJKm+11aqUHNkqsMd0Fezu0O+W/aj2Dutu8cc/
         TFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxZC6LLZuJ2Wkp1f5+/EfRQ8da/gCgTKGWvHnHflOhU=;
        b=DJFG7rI/UQAoq/6/7yDb/ZFwv7i7ahEb1WJOs6Or+5rp/8zBqPfOniFl9zAKCRO6T+
         OKxs7M1TPVWLqdVBIvssk+W0pbXcUDhQohA1gghO3GgjQFj4cMiDsvYGPOpvr4rtcsdk
         LfG0reQz4OWqg+DbVEvpdWJsrrIwt4qM9WC+cXlVn+XHX4b3taAkFgaQbOTiSCh8tj/E
         YMatLDaKD+y+r7Ax8Bt7nA4bf0M1x8H2Bxy750r11TIPB6s3pDpkYP55yTTn6YBQWSzW
         9ZhdhrcnNs7ZH93IgWCyaEsgwTd2MBnXNr009lc/TneUIuKyaUqXrUIgeqKmUzu/+Wf4
         rNhg==
X-Gm-Message-State: AFqh2kpQ/ZLW9bF6xmWoSyeM0w64uuSc7xNwoPDhNjbcbyDZo6VRQPwn
        BSnbPRNrtVD8ZSGO2bHAW/8UKw==
X-Google-Smtp-Source: AMrXdXvJKL26MJpG47M527MVT8QsOcuIjm1qzs/c5EZqKeKst2KGGu2u0oX9JCS35u+WUqsyvQMexQ==
X-Received: by 2002:a5d:67d2:0:b0:2be:50a7:cfa9 with SMTP id n18-20020a5d67d2000000b002be50a7cfa9mr20937182wrw.63.1674734506461;
        Thu, 26 Jan 2023 04:01:46 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d6542000000b00267bcb1bbe5sm1153739wrv.56.2023.01.26.04.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 04:01:46 -0800 (PST)
Message-ID: <05e55db1-5181-8025-8aee-e398200b047c@linaro.org>
Date:   Thu, 26 Jan 2023 13:01:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 14/22] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, lgirdwood@gmail.com, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        Thinh.Nguyen@synopsys.com, broonie@kernel.org,
        bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org,
        agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-15-quic_wcheng@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126031424.14582-15-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/01/2023 04:14, Wesley Cheng wrote:
> Add a new definition for specifying how many XHCI secondary interrupters
> can be allocated.  XHCI in general can potentially support up to 1024
> interrupters, which some uses may want to limit depending on how many
> users utilize the interrupters.

I cannot find in the code any user of this. Your next patch stores it,
but which other patch uses stored value?

What I still don't get how is this exactly hardware property, not policy
or driver choice.

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 6d78048c4613..4faaec9655e0 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -349,6 +349,18 @@ properties:
>      items:
>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>  
> +  snps,num-hc-interrupters:
> +    description:
> +      Defines the maximum number of XHCI host controller interrupters that can
> +      be supported.  The XHCI host controller has support to allocate multiple
> +      event rings, which can be assigned to different clients/users.  The DWC3
> +      controller has a maximum of 8 interrupters.  If this is not defined then
> +      the value will be defaulted to 1.  This parameter is used only when
> +      operating in host mode.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 1
> +    maximum: 8

default: 1

> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:

Best regards,
Krzysztof

