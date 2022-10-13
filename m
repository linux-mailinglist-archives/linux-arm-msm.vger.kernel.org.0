Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0997F5FDD2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 17:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbiJMP2r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 11:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiJMP2h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 11:28:37 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1665238A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 08:28:35 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id y10so1474809qvo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eUjbQu4zm7niGTGZKyNQe8l1hB9sEPbw2H2fN/18f2A=;
        b=U5Iezm94InNf+UEN7fGDzNm9YUKHnL3NCm5gjmO2PqJMmSvTiCSfU011zadBBrO74r
         cTWtVOmCHs5xvlSfWdPtZOnCqLSLJIm9Mh8r9ZFgd27AvSOSO+OU4tvWniuTBLwnPIlP
         NEXFJfBUXpZ+fU23flTRZM6obxI/xquH6mQXFOQlkqHg7cZDzcyRjpoSxbotXBKP40hN
         pXVt+wPY7fxVh4H3dUH/yKj8fF9X4gxMDZaBNbLEin+Kk8SfD0vqfHKWlyzZP1wWPM6f
         NvxZz2o2Rojw0G2IHPMwedNbQLbhUemaGqKJfVXwoxyLZ6gk4XLgPioJBS7ECn3nID3i
         BOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUjbQu4zm7niGTGZKyNQe8l1hB9sEPbw2H2fN/18f2A=;
        b=wBHh+O43Jzuf17GyDsR4vDQYaYAAdTqc6A3vfb0Woz9igiTHco+gMRlvK6PNcBg95Z
         rg6B/EpBr5Hj3IzJqLl9QkrDmO75y4vjEmcEDDBmhYDz5VfArzfvT8AIav9HZr+x+l8n
         u3/ahG+yVVKRuXupJRlYi4Lym0nNwVHd6wyTgaox4MyW8qIwHmJFIxqOf1+GNz9SmPzm
         yZWPiF7X+cIyE5k+ysfUMk2yKy4KA4YGGYD/zVJR7qrHAGplunfOytl4EEWzVSH5WNBz
         6OD7/sq1xf1cBzS69KxfHxJCCNWlZNKgpP7eiQdGhpaksjOgsPV/PXxmo4pt5XrtuNy6
         9TaA==
X-Gm-Message-State: ACrzQf21TmQF6JvekuL3iCO+H4GtypFrLq4UM0jrEy1IXdEL9VGThk0j
        PLkLO3Sop8j3R4KVVuV2z5vwYBFhYm+nKA==
X-Google-Smtp-Source: AMsMyM4UOHTpAHHQOdRNFb5XeeVtI5l85qoTtoqYlK6QvkEcTPdYuM99TFJ7zQi6N9mVVJuvTl0RzQ==
X-Received: by 2002:ad4:5cc6:0:b0:4b1:ae75:6ceb with SMTP id iu6-20020ad45cc6000000b004b1ae756cebmr200467qvb.54.1665674914225;
        Thu, 13 Oct 2022 08:28:34 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a0c4600b006cec8001bf4sm14531qki.26.2022.10.13.08.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 08:28:33 -0700 (PDT)
Message-ID: <974acbbb-c3ca-669e-3f49-3dd49f427c91@linaro.org>
Date:   Thu, 13 Oct 2022 11:28:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: align TLMM pin
 configuration with DT schema
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221007145116.46554-1-krzysztof.kozlowski@linaro.org>
 <CAD=FV=UAcn=yeCZ_jum9kGgqsdKsPpya-FPumYUWO=iyp-kKYw@mail.gmail.com>
 <4aa8450f-4504-c65e-56f1-0625584fb8cd@linaro.org>
 <CAD=FV=Va6xUtVEd0jgQF3+5OM6tQ=nW6xZeRatXULY3SUqAKBQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=Va6xUtVEd0jgQF3+5OM6tQ=nW6xZeRatXULY3SUqAKBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/10/2022 11:11, Doug Anderson wrote:
> Hi,
> 
> On Thu, Oct 13, 2022 at 7:59 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>   };
> 
> The end result of those snippets ought to be something where, on
> homestar, the pinmux gets set to "mi2s_1" for gpio49 - 52 but the
> pinconf only gets set for gpio49 - 51 (missing 52).
> 
> Your patch fixes this oversight because it combines the muxing and
> configuration into one node.

Thanks, I see it now. I'll fix it in separate patch.

Best regards,
Krzysztof

