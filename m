Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A38E67E557
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbjA0MfT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:35:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbjA0MfR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:35:17 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1370C79F05
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:35:08 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id q10so4847122wrm.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9unmXBFY2LCpkLlGduWq9KiCNNGjxWEAC2OciASOX1E=;
        b=avi5dm/0cmJyqN+xxxHp+8Bk5+Z/0VmWOTRq0yiY4UmeaZbB0sEmpQsuzYzmUYEXYo
         rONGzpHRgMrboJ5S3CudmhmAMuLNiHxpFO7EXjH62ns3oequ5SnEmiYkv5jcinvLwnUh
         dnFxIgQpXeoHK2Sla/LF3Q22J4Xtjgk0zq+lzeGYGdLZBj2Ya/Dxl4vuysRRJSUqJH9n
         rBkp9eAd40blim6iByp/eDjLqHipBXv3Rh7L43sb/AbU+s/K11urQs6eAqz5L4ZrApHg
         NpQ6sAHjqDBcRUFZlLIXMiTGjpQYVVUNXAc67SGRcZclkpoz2B+LdpFPTXcr2nhIAXap
         3Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9unmXBFY2LCpkLlGduWq9KiCNNGjxWEAC2OciASOX1E=;
        b=v8+2hOfAvWSHD0gXr2jE0SSMs6RFcjGyKxXbuMKNCPTKxtMQ5Dc54QVFXiFSvOot++
         ELi4kc7iCsrty7z+uLIeQeg1rC4bVnMJsovXfQ3Pdz+Yqdl+3HbW0yQdCtP/i9adfRJh
         f/ty26TpuC7QuIaCMKbjZlhgiCRTHIw0ytO/h8UB+M8/fECsdF05IYRyY7Kbuvd8equQ
         Q7NK2FYl8VAcG7qdp+md0QM4MqOP255rC59fGuagtA6t6m3Pfx1ypMVGRWXphpu/Nmxy
         M9qYQgRuyELDaNr72Xfsj/OX6uXn2A7+Tm2gVkw0DKVmzQnd97TGXyuRLAnElGVz7Gax
         VdhQ==
X-Gm-Message-State: AO0yUKV7l9HksSF+gCBepeirD1Tyf0DfNuSj9pUTtC3HuRdTyHZ7LeJV
        aAzTjK1r7yYEaVkdzuXunMyBww==
X-Google-Smtp-Source: AK7set8kgl+UYZC1EZtugC3b1RYbe7/NubWbi3C5CSEFCXcerqdM+Mga7HQqn4rbU0NMZK0hYx3Xcw==
X-Received: by 2002:a05:6000:1204:b0:2bf:b33b:fb7d with SMTP id e4-20020a056000120400b002bfb33bfb7dmr11183611wrx.61.1674822906604;
        Fri, 27 Jan 2023 04:35:06 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b002be2f18938csm3732984wrt.41.2023.01.27.04.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 04:35:06 -0800 (PST)
Date:   Fri, 27 Jan 2023 14:35:04 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: allow required-opps
Message-ID: <Y9PE+Hli/kLHW2Ag@linaro.org>
References: <20230127121122.342191-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127121122.342191-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-01-27 13:11:22, Krzysztof Kozlowski wrote:
> Few Qualcomm SoCs require minimum performance level of power domain, so
> allow it:
> 
>   sm8550-mtp.dtb: usb@a6f8800: 'required-opps' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> 
> ---
> 
> Cc: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a3f8a3f49852..4875c5b7d5b5 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -58,6 +58,9 @@ properties:
>      description: specifies a phandle to PM domain provider node
>      maxItems: 1
>  
> +  required-opps:
> +    maxItems: 1
> +
>    clocks:
>      description: |
>        Several clocks are used, depending on the variant. Typical ones are::
> -- 
> 2.34.1
> 
