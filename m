Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28E1560AFA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 17:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiJXPx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 11:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbiJXPxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 11:53:30 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E58426C7
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 07:48:44 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id ot12so5615502ejb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6NoS4CzM6HbNbKDtA4RCfd8Zj0ymS9k2HvHZ7A1OcBE=;
        b=ZVz2a2n84yw5F1YXMAlz+q+nvJRxrVAI14sCbr+bgI/G13lWm4Es7/JM4+Ns9n5/+s
         sDDSbpdJJ09ioxESNjqm/X+AZAqvVXtiC0a3uiyzmMOUXcSbt/I4D6xcyUNiwBmvCWWK
         z/w3o5rvbQ5LtIWamdAxJH8+aZWyYH+JrI0Pv5AlHgucMjSF0NA/V7sVqal5YkiKXh5C
         YvdCm0M1RR8Q/IRIW8jvJv1L13fcs81eFuFuJZFVYYjF7jlmxJWJWCjr0ED/SyEzvcV1
         mHzFMNNlRF4edtN0U0IlZURt5/ko8Efiie9U3kBf6uskMKkC+F4x1b8aJJTxnWyRg0k5
         jF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NoS4CzM6HbNbKDtA4RCfd8Zj0ymS9k2HvHZ7A1OcBE=;
        b=N4od0ORmCq+gAw3s6dQFihw3UusIreG03JAA4SYO78QbQYwajMbx+nC2tBwL3kmxsE
         E8a/fI2lr1S4D5qyKvBZvRR6b5XE4Nb+l3WSzfYXn39I9oj39jgUPY98eN0l3HPK44p6
         Wpx1bjhcVo643uBsVWQ+7MIWxYY2OXK+fBWurYs8KyELqYckFAwpsK4Kyi34SLKWibKQ
         rU0grUiKDIX+91bVnEakhX4pjJyH3fOulokHhymHtQE2l2I8TNQY0MJAJ+JL1w42GtQL
         gAIKF9xrdUWsj0pEY/lVrxSceFCRARvdwhTXdaRTd8UjjtXd3c85nVKf7WcLLuAChwr0
         DAJg==
X-Gm-Message-State: ACrzQf1LfVsJemNZPXK4JWwfJiS6FgBqDGnq4YiFBpC/80dh3DaVAt66
        Hnolb1NAjngn1ClUtd/SLecf+OzBZnqRGHCD
X-Google-Smtp-Source: AMsMyM6mvtTdCqcq9VOEBMfv+mspzPOqw0hztaXGnmQNJbPRa4nFm1sK7jFGjmQ084PfoA/vRTmovg==
X-Received: by 2002:a05:651c:1542:b0:26d:bf29:8cd5 with SMTP id y2-20020a05651c154200b0026dbf298cd5mr11385069ljp.304.1666618451843;
        Mon, 24 Oct 2022 06:34:11 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f15-20020a05651201cf00b004aa14caf6e9sm930402lfp.58.2022.10.24.06.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:34:11 -0700 (PDT)
Message-ID: <d20d48eb-5ec0-f8da-1f4f-d337f8afd5f2@linaro.org>
Date:   Mon, 24 Oct 2022 16:34:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 06/13] phy: qcom-qmp-usb: clean up device-tree parsing
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024100632.20549-1-johan+linaro@kernel.org>
 <20221024100632.20549-7-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024100632.20549-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 13:06, Johan Hovold wrote:
> Since the QMP driver split there will be at most a single child node so
> drop the obsolete iteration construct.
> 
> While at it, drop the verbose error logging that would have been
> printed also on probe deferrals.
> 
> Note that there's no need to check if there are additional child nodes
> (the kernel is not a devicetree validator), but let's return an error if
> there are no child nodes at all for now.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 40 ++++++++-----------------
>   1 file changed, 12 insertions(+), 28 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

