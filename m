Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96CE365628A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 13:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiLZM11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Dec 2022 07:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiLZM10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Dec 2022 07:27:26 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BD42AE4
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Dec 2022 04:27:24 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b3so15799939lfv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Dec 2022 04:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WRgHMYxNzvXV/Rkf0QUcRNHp4+EIuQ1yrJzCHQL2OU8=;
        b=oJVd9QbWMUr51an5T7995QYHfbMBDEX9eDI8F9Gi4NIozAx86uVZZS2uaQWe4UNuuO
         +3hLA7cbDspp3W6oN8RL5/mAzsX/96JgPbhdb9i/BZGAKwwyDA4BdyAp+26PnnTTiwyZ
         g63fEemgt+mJuUDyd5KzEgYwkjY+MJRgOCChr7iSCx6OW+qbJWLfYWDGlkE2wBEuI1OX
         slN00obwhnXmJMQWD3a8G15hzrkEkYfDVLd6rqfkCyOm8PtSoAUEzBxEM0GZlzg+5Wa7
         Vbmw9xgEONBBgk4vrUJCDrOT+gB5+xYh8trSHUIcLnKWCdICxuhesBfpxk6Mnc0tdbv3
         ejpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WRgHMYxNzvXV/Rkf0QUcRNHp4+EIuQ1yrJzCHQL2OU8=;
        b=foNSHk55cPJpKIc4esDkplEchmMHE07sgKsbe6tuBL8g7J7cH1eR7HnMe7W17aWdAW
         SP3qkwZJJGIaEAw4apZKmuOIkHIbTSo43mC3+5nx0lDbAZl7j9NDnf2W4om0uZ8ng1LD
         FWmmV/M/w2QrbKUjmbipsSuZD9RDwUjt3rwU1TjP4ZYXtjLoj6t0qWRNzUJfS8Yz9y5q
         TYk1T8Kik9bgPAsI2351bHghObSF4E5Z3PaGXsldD0J0AgCL7YOKrIChzsJ9kVz+hrUt
         +CMBKHrH+KE/HEGu7ZWSGJRZJHFxUmCtrZjbrQlI5fIqab8yLb2wte+MWhFYIyQKqjqJ
         rIyg==
X-Gm-Message-State: AFqh2kqW9xLP9WOwUJhMOBQRQi+9TYszEYD21VJ++A5cqXg/WZOkZN+Q
        xuA0Wx0ITfvQL3oU9ruTTRhPmg==
X-Google-Smtp-Source: AMrXdXtnApTf3ReVqgja7dPTOH6W0gQmo/vvCsRj0yba+pfy0FAolACLLh1auSSoksIsIg3CRphVwA==
X-Received: by 2002:a05:6512:2828:b0:4b9:f5e5:8fbc with SMTP id cf40-20020a056512282800b004b9f5e58fbcmr6759486lfb.30.1672057643267;
        Mon, 26 Dec 2022 04:27:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e2-20020a05651236c200b004b55f60c65asm1806452lfs.284.2022.12.26.04.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 04:27:22 -0800 (PST)
Message-ID: <f57d8d44-651e-b51d-dd72-bdf15801958f@linaro.org>
Date:   Mon, 26 Dec 2022 13:27:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 14/14] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Content-Language: en-US
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
        bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org,
        agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-15-quic_wcheng@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223233200.26089-15-quic_wcheng@quicinc.com>
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

On 24/12/2022 00:32, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 70080d04ddc9..60cd84e6727a 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -216,6 +216,19 @@ examples:
>                  sound-dai = <&vamacro 0>;
>              };
>          };
> +
> +        usb-dai-link {
> +            link-name = "USB Playback";
> +            cpu {
> +                sound-dai = <&q6afedai USB_RX>;

Hmm, that makes me wonder if you really tested the bindings before
sending? If yes, where is the USB_RX defined?

Best regards,
Krzysztof

