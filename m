Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C24B5B4F04
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 15:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiIKN3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 09:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiIKN3l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 09:29:41 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E0FB7E8
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:29:38 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a8so10609608lff.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OphWLkvQQhrqzPynWAsAAmx8wbBl38TQydjTLvj6GfU=;
        b=N6UfXyWB7yENz1CQ+2maHfxFJu2qp2DJTkFeZPu0bpf2bQDOY+kUQzi7CfOfIW3JKe
         JzhmUyTQCKRx0BL4gKktIrq/UPm12tphAXjEmknBoTODt8kg5Vct2uvwa0Lrf/3vnLMg
         3bzbNsAZ4Bpm4meSw85/TPSnjXO5G6uSAnc2bPtVNisFRnAWNXeyFoXmoQ4aBMmL/fUk
         AzOoZvIuGNee3MEMChOUvk1oATZ9b1I3EIoKzdZV9UuZE+wrH121yQZoQD5xwEt//zTo
         GFXFVm+aWz5eSFc3ib4YIvHFXUoaDevMVWWHAdz3+Ry9toHfZ3jxYZJQXR4nU6hz7xm+
         yD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OphWLkvQQhrqzPynWAsAAmx8wbBl38TQydjTLvj6GfU=;
        b=JddZzeuXRQxyBIWqkKjPFUjrfbdgnf7g/JEq7wz+ZMnUK1s9jRNkCWNjdKcvnHPnuk
         iXn/TQCtbhg2fhEpixASkfuVxJpJk/xdLKbMQfI0ZccoSY4Ky3aNvdXsQI6UfRoutF0g
         fIpf9P8X1p9h1QZ6Hrf9De+i6Gl9l4d8LhYe62O1eufubdgIYCGjDWGiobiyEnHTfJkP
         SiEVaaserNP7SjeTQlvwW2cZYuITZ/9No3MB8SDgb/Mrgi1bGkj+OVMicgH3HOOYWQTv
         CyelW/XfwAxoxkSdqDA20YjQBZe6aNUu8fclxPV28uIttbcE5uxhtS6V/0W2T7yOOb6n
         /X1w==
X-Gm-Message-State: ACgBeo3QaYZFhbaHohWFjLF/8zf9s1r0H/+OjUGi8U0dLPpYG0q0JvhW
        v/GnwUIa73XN2LwQFiBrFyJWAg==
X-Google-Smtp-Source: AA6agR77QmYpJc/3ns8W4bNYd6/vvw5ojXJlgiLaqOa1Z13BWn+8R27e3O7NEuzAxRwfqrjLiSMiHg==
X-Received: by 2002:a05:6512:2381:b0:492:afa4:6b67 with SMTP id c1-20020a056512238100b00492afa46b67mr6933722lfv.621.1662902976894;
        Sun, 11 Sep 2022 06:29:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t28-20020a192d5c000000b00492e3a8366esm615491lft.9.2022.09.11.06.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:29:36 -0700 (PDT)
Message-ID: <9ab86610-af65-3eb3-b694-0d08ee139d32@linaro.org>
Date:   Sun, 11 Sep 2022 15:29:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 4/9] dt-bindings: usb: qcom,dwc3: Fix SM6115 clocks,
 irqs
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220910143213.477261-1-iskren.chernev@gmail.com>
 <20220910143213.477261-5-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910143213.477261-5-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 16:32, Iskren Chernev wrote:
> SM6115 has 6 clocks and 2 interrupts.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 ++-


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
