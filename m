Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64AB558B648
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Aug 2022 17:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiHFPJA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Aug 2022 11:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbiHFPI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Aug 2022 11:08:59 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA96FDEF5
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Aug 2022 08:08:58 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 13so4969351pgc.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Aug 2022 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uU4q+1kcLLtSx8+NPQzdu8kyauS2SIpK22Q1e7AOuwQ=;
        b=VSAHKMeN2BFKXhSB9mCom3orXUV6CDkNpa4g8LCmLWnwRbHujmQtNX8Y6V8rSf/56q
         6T/avkIb0/OHfFSlt5KI/XadFRTEWFxL6W3dw1jXevlfQRPGNJdjGVHqh4yj9GoC/hvq
         t5vMkJeQaojH8X9crW3APgOxuDTqFRnWf+qnXY/xiOsBBOmnDBkmU0BdQV14mSeOHpwZ
         alGlTDNR0pWi9N1eGNXZE4R3UpPulij3sIo1BxLPw2C2DFbGKuRSceEAw8Tzcp/lc5Ga
         Z1ddTWJv/1YgCd01l+LtwexpoNmsaC+f1KMSO/LQfdLdz+bRWqXZ6y0NEzesnpqNRKDC
         hvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uU4q+1kcLLtSx8+NPQzdu8kyauS2SIpK22Q1e7AOuwQ=;
        b=jg+Hxuqp9YZFOFIbCJmS2JzutFsw6CTy6TYvuHFY62Kid4semopvzRzfpe7IFeHxYS
         b2OiXpK3mso59soxzA+riNHg5WXrToLY4aIbBOmHyuV7FNvOYvE7l4jgBYjLh2o/lS6w
         EK4xShPzYQr1+4nABzQCXr3BYWQ3wH+DyC0PMfi1OXRYZUjTwjKnB/0z2pzK/rfNeFc3
         OHQZXWVdNYf0vDidoHEWYO5yuzu/7GvQsNtsb3vaGgRIcGHc2mE7Htgi1IPTP/qjRMKJ
         DQZrDiV7OogI+j/4JofROKRdtCBIpwsVTvvTbyKOlH9gZcgmdDGUXbNUKMjEO3pI/QYI
         DgmQ==
X-Gm-Message-State: ACgBeo3OIlww4VU6Z+y66gIytVT1TqIYlhv/RQ3+qw7+8sYCgMxnbzwP
        Ar+Ooupn3aHx/7XpdiK6c7DowQJN8pIC
X-Google-Smtp-Source: AA6agR6HkJfzjY4xHcQDLXq9sUwFM7dPJqu+aUYTXPgnE+DcB+YVXM9CNjgMSNPlGgwdJ4qDOVdL5w==
X-Received: by 2002:a63:8c47:0:b0:40d:2d4:e3a2 with SMTP id q7-20020a638c47000000b0040d02d4e3a2mr9868130pgn.2.1659798538271;
        Sat, 06 Aug 2022 08:08:58 -0700 (PDT)
Received: from thinkpad ([117.202.188.20])
        by smtp.gmail.com with ESMTPSA id h20-20020aa796d4000000b0052d4afc4302sm5253854pfq.175.2022.08.06.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 08:08:57 -0700 (PDT)
Date:   Sat, 6 Aug 2022 20:38:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 7/9] dt-bindings: usb: qcom,dwc3: add wakeup-source
 property
Message-ID: <20220806150848.GH14384@thinkpad>
References: <20220804151001.23612-1-johan+linaro@kernel.org>
 <20220804151001.23612-8-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804151001.23612-8-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 04, 2022 at 05:09:59PM +0200, Johan Hovold wrote:
> Add a wakeup-source property to the binding to describe whether the
> wakeup interrupts can wake the system from suspend.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

So this is based on the fact that Qcom glue wrapper is supplying the wakeup
interrupts. But isn't it possible that on other platform, the DWC IP can supply
wakeup interrupts?

In the driver, the wakeup-source parsing has been moved to the Qcom glue driver.
But this contradicts with the binding.

Thanks,
Mani

> ---
> 
> Changes in v2
>  - disallow 'wakeup-source' in child node (Krzysztof)
> 
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index fea3e7092ace..d5959bdea63e 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -108,12 +108,17 @@ properties:
>        HS/FS/LS modes are supported.
>      type: boolean
>  
> +  wakeup-source: true
> +
>  # Required child node:
>  
>  patternProperties:
>    "^usb@[0-9a-f]+$":
>      $ref: snps,dwc3.yaml#
>  
> +    properties:
> +      wakeup-source: false
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
