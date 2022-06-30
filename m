Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A6E562276
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 21:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235833AbiF3TBg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 15:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236758AbiF3TBf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 15:01:35 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC561EC5E
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:01:34 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id fw3so13134740ejc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7R3EeNPzdygH8nRe9+P7GLctFQM9EBB/aI4yYSr62I4=;
        b=NK+H2mBjbhrWNGMYPJwaM/UHjXkznSmyep+1uI0lkd61j8Eeo8TvvpLs5O+TpckPgv
         OQu+vScJWmOCnEwaeCPNzkaJnpJidORQR5VH7pgnuVjiScU1KPwBObtMPE6C1wYltcfN
         t+eRAeRssEmEi1eskMxRxKRrVnb9hvBGPAG7IdII/ay/FdjdfU20K5LV61zNZ604TE00
         c46G3XljCYCICuHECSgxyaEXYRJTnan82+EEWpDjHLea6wkKvluzMYuuySdvetIvQrjS
         duf2DLErmwyqM2Q926r3n3eXOYHoybx8P85V5oKk3GYOBmRU70TDdD69igREWLT/j7pV
         +t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7R3EeNPzdygH8nRe9+P7GLctFQM9EBB/aI4yYSr62I4=;
        b=UAleyNVLMPQux/3d03A5dEz1VKKqaHDkRAjnQVnCyKPr5gXZMarH9VlLhi4dN+omW8
         oHwazzANBY/ubvM+5ZIVFtQYWR5f2RSYgMuZjPxEHpq2JfmbEkQ+G+QeTI/kzRxmJkq3
         bzRg95YFeE+64qZL66U9H9UjrTfWd63mpRGtiksHb4pmwbkk/3SQEf06SXheNy+mtGfc
         rBv52QWvL4f2Iw9HI6KS1YXfGlpBMTqAHK1MfzL71mgw/t2JeD6rIIzv/e4LuYDJNko5
         0mDRX2PTBZDKTAuB3+cQ5t0mk01nb3H+qkxpjXQmH4POClnipKjEYiKWfWVSz6A2AK9r
         LH5A==
X-Gm-Message-State: AJIora/SY/GZIhXF4xsVUKabchI9G3zy1GVQsOCXfEhMu+4OX4IxwxiI
        1q/D5ookQ7kQAqU/9HWhhQq9cQ==
X-Google-Smtp-Source: AGRyM1vhswn16NyT0InBsZNwoGOr4FxxTju8XfhZuAiehPGyXIC6OjtkJ+rmHAOxYVgb7LzdHv6Tgg==
X-Received: by 2002:a17:907:1608:b0:726:a7b7:cd7a with SMTP id hb8-20020a170907160800b00726a7b7cd7amr9827374ejc.682.1656615692696;
        Thu, 30 Jun 2022 12:01:32 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz27-20020a17090775fb00b006fecf74395bsm9485367ejc.8.2022.06.30.12.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 12:01:31 -0700 (PDT)
Message-ID: <225e70ec-553d-4d44-fc61-543128b2ad67@linaro.org>
Date:   Thu, 30 Jun 2022 21:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains constraint
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> The existing msm8916.dtsi does not depend on nor require power-domains.
> Drop from the list of required.

That's not good reason. The bindings are about hardware so the question
is whether being a part of power domain or toggling power domain on/off
is considered required for the DSI.

> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 101adec8d9152..91324f0828448 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -136,7 +136,6 @@ required:
>    - phy-names
>    - assigned-clocks
>    - assigned-clock-parents
> -  - power-domains
>    - ports
>  
>  additionalProperties: false


Best regards,
Krzysztof
