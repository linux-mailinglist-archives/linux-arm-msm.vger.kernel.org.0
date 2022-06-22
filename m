Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43B075552FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 20:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbiFVSIr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 14:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377069AbiFVSIk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 14:08:40 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC4D37BE2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 11:08:38 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id n15so8725512ljg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YYOVza86qJ14cSLpuOVf8g0H0wsocOlznH9bAfGGaxw=;
        b=PKyLAriixe9E4ti02dlcBihreBCiDlDIyYUbwbqrQ80mcn+af+bhNahW6lNsGTayD3
         J27iq5UCLFANnCtAGRRWtDYzS6FEox/9W75kUPwSGPTyBXku2DVcMxFU1Wi5IsMpvfCU
         E8m++fQ873QasSbFL4oaDe6Qy+AfLFvN8eNbHFv+/O+HW1glFRayCJItG/b7IIyMdAQM
         hfPASZFxucjPOV/w+O8dQcLtESFvfSreJD18JuKz7VGQDjNmNZj37ITIs1MNzGnKHHeS
         hnsas55iXcuROPPbICg0kl86ic+iKVSp/MiR9ETzL+nriHqBp8qeQw0iEt1KMKq/w0mZ
         vZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YYOVza86qJ14cSLpuOVf8g0H0wsocOlznH9bAfGGaxw=;
        b=xFAFAHTO0nz4MacrD7qPEohTvYOT1xOYxUcjWq/DnAfZurehLqnnS+NOuapfc9pwlz
         hcUFEPCtbTBZELgSEwciClUhXSJRIsxVwaMTVJn7jSMw5BsQMy3h7L/gPX5su7mMPYEs
         w5r7X0IW02qVkb+eVuQeIwJvprFRGApcXUDHRVYsSheNQcsjIOC7Fc48oKB5vSFhD4Rx
         WN+jTl7hmnxs4YQkquXxvUet6GyinrL9AflwTDdCCgEqpA69AmQgFMmuNs4lOrqOpeNg
         3JpETp10xJu0dRoZX/YYRYQKCGE1VGA/0WvNOlpBUSpcoglqP0CAOx5IwBMRHEf5Q5yq
         l7Bg==
X-Gm-Message-State: AJIora+jbvJyyFCcsKZn9skaX9Gfy5JDqQ5KEAhhji717y0J/ji6OqiJ
        ddFnuD7zFG3y5EWzar1Abo+6Fw==
X-Google-Smtp-Source: AGRyM1uhQxkDu4CTbNs4cg12dNZuoExse8UIX9Yk4z3BH/MUJryNDchCf5y8fAWed3JmdHP+Tl//LQ==
X-Received: by 2002:a2e:b8d1:0:b0:25a:8ee9:86f4 with SMTP id s17-20020a2eb8d1000000b0025a8ee986f4mr553926ljp.480.1655921317316;
        Wed, 22 Jun 2022 11:08:37 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p12-20020ac24ecc000000b0047f7419de4asm1158515lfr.180.2022.06.22.11.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 11:08:36 -0700 (PDT)
Message-ID: <687c302f-6f7f-a43e-de19-73b42b569d64@linaro.org>
Date:   Wed, 22 Jun 2022 21:08:35 +0300
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
> ---
>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 +-

This patch has been already accepted. Why did you resend it?

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
