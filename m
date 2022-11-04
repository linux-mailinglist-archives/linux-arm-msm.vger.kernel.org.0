Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE466198BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 15:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbiKDOGJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 10:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbiKDOGI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 10:06:08 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7825248DB
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 07:06:07 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id 8so3100736qka.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uonN8nLloddhG+zjfTG2JodcK/vkMjXLFVPtg7RTwWU=;
        b=bHUgrJDiiUPKvAYNL1QAYnKS5yc0NP9689zoDl0d5eH4u/GM81pa/AzAmScwJv27HK
         sWENEgZ2Vs+ikknRhHhgc55AM+hm6KxgSklQKahiOMHgTraJMHF4SVLNqaWUvqwU6B8o
         jy63ynU8txB7Ri1NmClyahI84lm3Jt+0ClQ90+VMms7DIediHZvbU1b3ezGgm7fsHhhM
         p6yjhcXSs2xQZ4/WDr41xpQdlAXaZEbATINjKouS+hEjI+FmqG9whzslaTJqQJOzQJkh
         4dcA56xqp+l3v8+lSlkcEJpZcdLOjpL73K/qyoHs2kLOsyuIuu/wUra+6Zbg5NMIYr4e
         dqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uonN8nLloddhG+zjfTG2JodcK/vkMjXLFVPtg7RTwWU=;
        b=uNwr6tdiO+nVpNXGcQJ7BtxXhtyONPGxWO2sUzOGHK1VJQosT1RLGm1RAlICF6DbIS
         0AoZHShl1mimcqXv45Y2nw5EOPaM/VKn+oj66apijW8/K3beDUA8EVqiuldvpvo8BTh+
         z7mQr1VnrKmFeNJUyzsWlFR2NLYHo9U7jGkhYBiW4++fDn9AnSTbKijGE5M1jJkSvARK
         UvcEtxBxNZ6y0ESbgDtnbvhPFi0VyA/c+Jw0Jcd98j1ypSasDaVFN107iYaMGIHG2NmN
         TttX8XgWIx1vnnxF9KBV0/DHryi7G8ep7BEK0+jWu5bo909k10zW0rCk+7NGuyRNBG56
         3K0Q==
X-Gm-Message-State: ACrzQf1C0MJc7Zkw60ewXSTH23Oz7xXbFURSfvABnlsRMUATc0O1Kw+1
        31nFzb0onhMC4z6bCGxWO4QSBw==
X-Google-Smtp-Source: AMsMyM5bwGeqbh2zIZuzZH/uSQDVIlrHtpKBpppr2G3iSgh4BjF2kRkQwYGsZb0VStA7G0pHxGsQpA==
X-Received: by 2002:ae9:f406:0:b0:6fa:395d:1480 with SMTP id y6-20020ae9f406000000b006fa395d1480mr17884072qkl.555.1667570766756;
        Fri, 04 Nov 2022 07:06:06 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id y18-20020a05620a25d200b006fa32a26433sm3067660qko.38.2022.11.04.07.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 07:06:06 -0700 (PDT)
Message-ID: <2d4069f6-2c61-15e6-a7f8-64bddfc9fc1e@linaro.org>
Date:   Fri, 4 Nov 2022 10:06:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: qcom: add another exception to the device
 naming rule
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
References: <20221104132316.1028137-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104132316.1028137-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/11/2022 09:23, Dmitry Baryshkov wrote:
> The 'qcom,dsi-ctrl-6g-qcm2290' compatibility string was added in the
> commit ee1f09678f14 ("drm/msm/dsi: Add support for qcm2290 dsi
> controller") in February 2022, but was not properly documented in the
> bindings. Adding this compatibility string to
> display/msm/dsi-controller-main.yaml caused a warning from
> qcom-soc.yaml. Fix the warning by adding an exception to the mentioned
> file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Thanks Dmitry!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

