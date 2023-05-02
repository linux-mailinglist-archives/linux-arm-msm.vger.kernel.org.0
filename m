Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 396E86F3E86
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 09:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbjEBHsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 03:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbjEBHsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 03:48:15 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965E210E9
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 00:48:14 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-956ff2399c9so693822766b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683013693; x=1685605693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ri28WKi8g60FGcODKDV4M0qSpJXtQBhdjEjPzYhCyQw=;
        b=XCrWnUbEmnTP/VzJ7Njt+yNpMhtlt6XsmPPSMBXwc4+Hf2QiHzh6RRwV8JIjkLy3Eu
         kH5n1Ulrk6McpeFITt7ySMPOgSbBHerHJSdvpM8orfy1EdOqitFY8sUrBI2oOZo7IUSF
         ZeXOlzDyXSC+Ujt4UQSAlG8NhtejqrBYgSBPhi3BifjpDN7xg44gJtlZUmGvYtcmIIy1
         13jq4ofVuyPJ9+WtWKfugkzUAB7OD6kFtesqqlDQZF0R8cCIwZVU17NuFCHt35GxTZAj
         fD5P8yao3w8cDJDnCtswcEgyoBoR/UvsokbRyYwuF5AaTT1wIfHBLtV0E8kCk0PyFUhS
         BbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683013693; x=1685605693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri28WKi8g60FGcODKDV4M0qSpJXtQBhdjEjPzYhCyQw=;
        b=ZPbOkQoFxPHH6sFhdHOnXfMvLVoCVisu9uxPx6MPzrDz5hwnMMNi1fITDPVnzo+9Oc
         ubHmmy0tW+ra6fiwd9/lsmSN7sDz9xx8kdmLL197k81DgiQ0TIDkNVCWMqCcKiGUPGcx
         Xygyb/kIRElvKql+Zs9pGXCaynYIo2cNHEbCjDRY6Qw44rsgUIJUdCK04cyjUkiJ4I43
         LDlYXt6k4QPtLzsS3oDZovd425i/W9zjnQj0hNRHlxI8NkjcIhVbTo7kmKZgqPI03qR3
         eyS0XOMxyfTqyLTMMlojOplNnTUdgYNqCqaaQKMoPHU2+hzgKIVa503U8wKBC7uBEeK5
         3SFQ==
X-Gm-Message-State: AC+VfDw/Ti2/pIkVEEEcZyrntKHAw636R4HXSZtR/JqT1ztfjEl1nNaH
        hlEr4BMheYfNcmxF5bgW7IwysQ==
X-Google-Smtp-Source: ACHHUZ5wDbWsUU3czgLFdDuWS088iTvgN2ifq6a0oUVuJqPNLsonmjIFerBqVo7aTSGBSp5rBjBwkw==
X-Received: by 2002:a17:907:7ea9:b0:959:9d8d:e992 with SMTP id qb41-20020a1709077ea900b009599d8de992mr15325837ejc.8.1683013693103;
        Tue, 02 May 2023 00:48:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id g17-20020a1709063b1100b0094e6db4d4a1sm15637585ejf.186.2023.05.02.00.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 00:48:12 -0700 (PDT)
Message-ID: <df24efb2-8279-ef15-a118-2a24885288c8@linaro.org>
Date:   Tue, 2 May 2023 09:48:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 1/9] dt-bindings: usb: qcom,dwc3: Add bindings for
 SC8280 Multiport
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, quic_harshq@quicinc.com,
        ahalaney@redhat.com, quic_shazhuss@quicinc.com
References: <20230501143445.3851-1-quic_kriskura@quicinc.com>
 <20230501143445.3851-2-quic_kriskura@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501143445.3851-2-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 16:34, Krishna Kurapati wrote:
> Add the compatible string for SC8280 Multiport USB controller from
> Qualcomm.
> 
> There are 4 power event irq interrupts supported by this controller
> (one for each port of multiport). Added all the 4 as non-optional
> interrupts for SC8280XP-MP
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index d84281926f10..2c96da1ce5b8 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,sc7180-dwc3
>            - qcom,sc7280-dwc3
>            - qcom,sc8280xp-dwc3
> +          - qcom,sc8280xp-dwc3-mp

SC8280xp comes with two USB controllers: one single-port and one multi-port?
>            - qcom,sdm660-dwc3
>            - qcom,sdm670-dwc3
>            - qcom,sdm845-dwc3
> @@ -455,6 +456,26 @@ allOf:
>              - const: dm_hs_phy_irq
>              - const: ss_phy_irq
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-dwc3-mp

You miss entries for all other constraints.


Best regards,
Krzysztof

