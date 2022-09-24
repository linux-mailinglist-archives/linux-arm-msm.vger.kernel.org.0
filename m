Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 901F45E8A8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233404AbiIXJLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233635AbiIXJLl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:11:41 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2577112653
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:11:39 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id b6so2387817ljr.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AJ8TUjAWCXpFYS5hKa8RQdvrp2UP+wXPk43AFleVbuI=;
        b=HfFq1UkhQyJ4W74vYLzpC9NDAJc396eNp1+8eT00urQuY/SKGKI7U+uX5Z7gI9zIkX
         VMNpuSFNtebDsYOYQ9LWP4qqBIOmCTxtgdhGOdV0wiSp1D9KJ0hQXSkmgvmjME4rkk91
         dVJiJ9Ek7NoPbJUo3OWoxjfJDZNpNO+zGfrQHsAzLaXZjx/h2I0/gf5CsP6NLWkI+6/N
         I6oO9KPjFPPG+tpsZALhgS8MR1wi7x3JfzK8EbYo4pfL/9kanHpGIDKxSIks+JpiBMGT
         HJDXyZbeLEggwcY0fOlUSGaTZOa7spZPQg0dtKW/CbGkG8vLwgh+PFl8IUXJEa8/FEY3
         P10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AJ8TUjAWCXpFYS5hKa8RQdvrp2UP+wXPk43AFleVbuI=;
        b=UUykfPXm89er83JZXKA/FNBlTuLMPRH4S15pnmzKAtJZa+x4GJmSEuHGV6uKe2y2oB
         SFAbFRuSxH6fMI8D+B/jLb6R/j8LUJxZQc6cCTpkKlIT4nP/l9GCsQdHew1eOgPws1Xs
         nIcuscF7WDQ/0Q5VRLxUNvlzzLqH35N3mquXqQIDrrTqygI4p3kEH8ZtSAdw3WqI1pVk
         07IMzTRTkb6yvPhqZ7L3VrMQdBj0wU16iEyvBcdXt028DFR0eUiUt1E4CFE9s6k+qhSa
         6wPR8VDRcIIkfqsYscZ5PaGOEmqMFwC3modvN3YLnvRdwFDCpAs3in2x/SBLcUg67Qvg
         /j3g==
X-Gm-Message-State: ACrzQf23/FchHs9SrBTy43F4zsD+mp0Ex2MwuUajFHdHqh3tnxnphonr
        trhKHMxXZ5RNPuOSAd1hXBASaw==
X-Google-Smtp-Source: AMsMyM5HqWVwoHJfzOQRUlbcgtGM7KM3kBVB75s425FqDMdtgtYhO6sqhorIL1lG+Nh4QZ+Nx0QMYA==
X-Received: by 2002:a2e:9791:0:b0:26c:5956:30dc with SMTP id y17-20020a2e9791000000b0026c595630dcmr4283719lji.373.1664010698225;
        Sat, 24 Sep 2022 02:11:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g11-20020ac24d8b000000b00497a61453a9sm1827234lfe.243.2022.09.24.02.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 02:11:37 -0700 (PDT)
Message-ID: <fd91077b-e4ff-0187-8424-0b83b96588ef@linaro.org>
Date:   Sat, 24 Sep 2022 11:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
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
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 11:00, Dmitry Baryshkov wrote:
> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
> them with generic phy@ names.
> 
> Dmitry Baryshkov (9):
>   ARM: dts: qcom-apq8064: change DSI PHY node name to generic one

dsi-phy is similar to other generic names (usb-phy, ethernet-phy) [1] so
it could stay. Is there particular need for this, like coming from DT
schema?

[1]
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

