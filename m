Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02EBD5552D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 19:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377071AbiFVRvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 13:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376986AbiFVRvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 13:51:44 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9A235271
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 10:51:43 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id j22so13671867ljg.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lyHjNlGIepIT/t3IaYDnRx3eF0Wl2lezOvJ866alVNE=;
        b=phpEogNR2Dg76Apl+C0m8n/9gUnfdkc6rnmv8hg35SveC82wohLJms9nr8qUFjSTrt
         4Wqhfvb7TrbFI0PccZBegFGbM6GWr4WH60OyCtbhsxjLU5Gc19GKXWPP4ElsqfSX70r4
         GI8QbEhNgxtYK4Xyzgo0aD4lxO8yoOXSP1ERqgttwcWrM9LBVriiDKrg6TWygQvTAYD1
         gwUXdUJl30pALaY/eKtcdJDLVMhcpnDNUTG8kt/basq2l9yPy5n4cAJPiHRVjSyhApU7
         AIhFhue8YAUjo6mD/YxRMnzlCFrk8+m/fUb1RIXRUrWefCqJsAgGjAgmDmmRQZi0niT4
         eSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lyHjNlGIepIT/t3IaYDnRx3eF0Wl2lezOvJ866alVNE=;
        b=tZcfpFjvp0KQBcFmJOjiWl9aE6GjFd4V+2dpAToEbSM2/HGWatEuCUfX7u04DhgN+C
         em3NAz/nPrA+UXIuFpbFqMbK4JmDbK/GmvMF5iA0P/4n4iMtez6J24Dzr44TCPpbevGx
         Bsyeg5kWVqWqjp/ltr+cEKaTonn8DOlQp1NTQd7IavA91+KKeeO8tXxQl5HpNNcWKqK1
         kMvKQ8HaOhoGTdQ+T59dL3kNC5FhOwHDxFPrrLR16Y9fUCu+YHmXqkcGE2UDrr1qp23o
         yKkVBx21x/lkU86wlnWReSx4o+ZcI2vCxvRcoqS7bNiKCGuoa0gRuOQkUcCenVc5K9F8
         V7ew==
X-Gm-Message-State: AJIora8hwWqbLvyvYYWBa0dy1iGB2LAPpPyeEE3M1kzheLtHM+qzDk6s
        pkZjPZY5A73NRpsWNM3xFZlOqQ==
X-Google-Smtp-Source: AGRyM1uqRH0eeNtScZfg9vgahrtzqeNiUZh3ZaiXJFRiWQWm4xvksCJ8mnE2AFxPxob07sW9BfcD1A==
X-Received: by 2002:a05:651c:211e:b0:25a:88ca:d766 with SMTP id a30-20020a05651c211e00b0025a88cad766mr2448216ljq.230.1655920301613;
        Wed, 22 Jun 2022 10:51:41 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k1-20020a192d01000000b00478fc20dc88sm2628594lfj.73.2022.06.22.10.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 10:51:40 -0700 (PDT)
Message-ID: <54ef4527-bb30-c7c6-ab74-0a2557c763cc@linaro.org>
Date:   Wed, 22 Jun 2022 20:51:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: msm: update maintainers list with proper id
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     abhinavk@codeaurora.org, quic_aravindh@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1655916953-32039-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655916953-32039-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/06/2022 19:55, Kuogee Hsieh wrote:
> Use quic id instead of codeaurora id in maintainers list
> for display devicetree bindings.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index cd05cfd..c950710 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: MSM Display Port Controller
>   
>   maintainers:
> -  - Kuogee Hsieh <khsieh@codeaurora.org>
> +  - Kuogee Hsieh <quic_khsieh@quicinc.com>
>   
>   description: |
>     Device tree bindings for DisplayPort host controller for MSM targets


-- 
With best wishes
Dmitry
