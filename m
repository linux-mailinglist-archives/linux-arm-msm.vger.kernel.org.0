Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40AA55A5FAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 11:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiH3Joe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 05:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiH3Jod (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 05:44:33 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA94A8CC7
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 02:44:31 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id bn9so10731511ljb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 02:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1AEJkkvJsW5PL2iwboBiHlwrTQTde2dlnWXw8tEu3D0=;
        b=FAgokXKk3aNNyd6z/ejsI3SNO9qh9ttn1mD6G87U7kRtJfoUvCuuO7Mde+uT52JjKZ
         Aw5N2X5seVmUl3beG/WFteNBZDJugEFyBsyaXtlPZuGMwRCrYZmZjC0bZqWKn/6Pe2UW
         z0z6N/7VGLzwlfYm2CO3OeKNBn0Fx/xkbtFMcdKz2x5APvvQcX/+3bBKeQCUJRZATf1b
         8qgrCvnNNMEt+1zGgc3tias8nN9BCU+qoQl0mN7RdrkquLgh+jWSK2tT79gUBZ+atGCV
         fDEGScertwUdt1sMEj5ZGPISPcrjrAgqsMGXcCitMqWt53tz9RNwKPX95/VovA77YzTy
         Z3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1AEJkkvJsW5PL2iwboBiHlwrTQTde2dlnWXw8tEu3D0=;
        b=tKpWhJgrxq0q6H6+U3aHVfzQM8Pc31XLnkyghA33ycI/PqFiVAT4oPNIQ3lM1lweee
         Dkv1mWTo+zACcEzKm2v6MlYEpaqOHfJhGB0zSLyKIgaqW4FhKjjpdBEO6lVPuClN77zo
         ux8kCZUyH9KR5DHundvqCXHZ0oRTHdtBd464o+ysrV0OM+U/YZ7Y85iUgxkTRxUTeom0
         2Nq4/WwpoHr2DRs2/ZNX7IqLzIxfpwkJndLBXoMZYSkmP8u12/xXJAjs0EMRJOOgNLcz
         X4y1y7us+V035lvlBepd+P+cVADgd1MdmNShcv0cT036EEWQBsXhR9BmvkrFT3VD15My
         skHw==
X-Gm-Message-State: ACgBeo2FGQwobCozKkLUqMxrT7IwkgVBhPjVwv/MTd/6Ne6ONNvtohMI
        YQvxgEBSPZHxMGsQPUJWW74NRg==
X-Google-Smtp-Source: AA6agR4wmHcZxRiO0kPf6nYJC6H8QVWakQUNp3C2O2l7s7/+azxjAIcRdaM+cCy4MnOoOrgqzVs13w==
X-Received: by 2002:a2e:a548:0:b0:261:c647:1d86 with SMTP id e8-20020a2ea548000000b00261c6471d86mr7330658ljn.237.1661852669933;
        Tue, 30 Aug 2022 02:44:29 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id h5-20020a2ea485000000b0025e6a3556ffsm1697579lji.22.2022.08.30.02.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:44:29 -0700 (PDT)
Message-ID: <ed582145-3694-b39c-bf54-815279fe93f4@linaro.org>
Date:   Tue, 30 Aug 2022 12:44:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Adjust LTE SKUs for
 sc7280-villager
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jimmy Chen <jinghung.chen3@hotmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220829084732.1.I9ef7f8b909a7afbef9ff2251a98c67033f37b516@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829084732.1.I9ef7f8b909a7afbef9ff2251a98c67033f37b516@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/08/2022 18:48, Douglas Anderson wrote:
> There have been a few changes since the patch ("dt-bindings: arm:
> qcom: document sc7280 and villager board").
> * New firmware reports LTE boards as "SKU 512" now. Old firmware will
>   still report "SKU 0", but that's all pre-production and everyone
>   will update.
> * It's been relaized that no "-rev0" boards were ever built that were
>   WiFi-only. Thus we don't two entries for -rev0.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This builds upon the patch ("dt-bindings: arm: qcom: document sc7280
> and villager board") which hasn't landed yet. In theory this could be
> squashed into that patch.

Unless Bjorn already merged it, this should be squashed.

Best regards,
Krzysztof
