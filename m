Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6130E6E8FCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbjDTKOj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234667AbjDTKOI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:14:08 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C461BC0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:12:11 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4ec81245ae1so458263e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985529; x=1684577529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1gg5qH9FVKEIvZx9IgwaMQ/p/pcxPmbM2nNSvflA+Y=;
        b=oGF+NGmUcuKNfYKptKRvcA/mqBwJP3vVKuFesYiVXRdyTFgOoercusxcIZm6AB4RE8
         /wRmO/0CDcuj9QTn+vHkn6mrx/DuytmBsRSzskfwvb0UDt3Gf6H0c3kE9rOL763teqFl
         IeHCZIap55eiRWQFwdNU9nDGVj5cWc/nVmvjIM7tqxBkrRWdCoSm3HSMHPCo3tLuyUB+
         zNZLX5K8573+XXXjDBREn7WlXbSCjv2O153I2thYxjoJ1PFi5xTmzksQv0SF2vk28b0+
         u0gJwnTPdUCAKmZgt637xMuWdIqW6AgN2R4HzYxUXecvTMz9WyYgRVksLixG7kmkYWnJ
         RiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985529; x=1684577529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1gg5qH9FVKEIvZx9IgwaMQ/p/pcxPmbM2nNSvflA+Y=;
        b=cxwdAPdM9SOWxgPbGLNOeT2IJp+OrzOnRByiL91mfEH7tSU4IGBYGcGSLf1+hf9TDf
         eziGNPMcLqVvVCjTtAZE2MQYvBazycUuEjXYVFGIMh6428R/7J9165yr/wwktGFOdSWL
         xQBI3jZCjf8tJ9ljqzI2l319Y9jv9jEzbxVaJKyr/MnxqJmhpBxJ9dymqRP8cZICY0UF
         uVmL18XLOqDJhDt5Nm+nu4OLHew2TxtgboeapoCmMTKspQ1OVVQduiepiFoqjBxS5Kf/
         xN+If6yNfnA7BODC0/mlHBrJAraija45A7BDjopCExUJWc05xOMZXrP8zi6TQcUYRMZm
         lDBg==
X-Gm-Message-State: AAQBX9deLEZLoOd8aemgmwhU4YY3Q5uGPPyaUqPInF919q8I8UC882Z8
        QayYqvshnV3nsgYk/GFDTcB0Bg==
X-Google-Smtp-Source: AKy350ZLeDAg/Z65XdnFNNxyJxECDLyd0G1w1LAFz9U3aeC7C/mcAJ4Bbx0in4YxGwlg5oYVk58TSQ==
X-Received: by 2002:a05:6512:204:b0:4ed:befc:9b4e with SMTP id a4-20020a056512020400b004edbefc9b4emr363243lfo.3.1681985529604;
        Thu, 20 Apr 2023 03:12:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f21-20020ac251b5000000b004cb45148027sm166060lfk.203.2023.04.20.03.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:12:09 -0700 (PDT)
Message-ID: <d757326e-9dd1-36ea-9340-2a95c3cce70c@linaro.org>
Date:   Thu, 20 Apr 2023 13:12:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/8] pinctrl: qcom: spmi-gpio: Add PMI632 support
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230414-pmi632-v2-0-98bafa909c36@z3ntu.xyz>
 <20230414-pmi632-v2-2-98bafa909c36@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230414-pmi632-v2-2-98bafa909c36@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/04/2023 19:43, Luca Weiss wrote:
> Add support for the 8 GPIOs found on PMI632.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

