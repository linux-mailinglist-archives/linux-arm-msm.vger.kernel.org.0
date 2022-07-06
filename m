Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4CC9567F75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 09:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbiGFHFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 03:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbiGFHFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 03:05:24 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1799926CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 00:05:23 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t19so23695067lfl.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 00:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DjJWh0nZiIzVQSxYKq4yhd4wJ+ppDdUOImr4L84iPRA=;
        b=xO5fKweKllcZX+2MUtldeM5jwT4QinDo+e97vjMvl5RbPLKiQllk/+p4iimxBh+DRu
         lWZz95YrwzqyWhanulsCMzJSaLadyxX9dIrOa2WP749BX5GV2lp7/wla/G6ohtQMkP/C
         yv06XL4akgD6w4WiAsMSuTmWN3m/5KEOCJ2NZx2afxLChZjhSPk+So4eCo7A3lY2CO0v
         cuJiQXWksjTbYIf0pmRQH+ZmcGXoNoqo/TBp4y/zqwCZp37p8AwcNnmM9FxNCIAibaTj
         xAgDqBby7fCQcTdsBmnVEu8WUBPwjIm69c8uGSrcGc+IpojAO7z2YpgyRZRapJk82RzL
         dBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DjJWh0nZiIzVQSxYKq4yhd4wJ+ppDdUOImr4L84iPRA=;
        b=zxCRlTWrUU3uDJ97zEbKfQMzstZzc1KnxiXFdQaKWKRAU1tLVvRsAKdZvRpv7H/DSP
         oiqKJtsMb1VrrMvLJEwP74O25Skiu/FmctJFU0wxhl2cL2i+rV0K2Zmhzz214DhMWSdR
         vFdG0jLOqv+e+TcjhjjgBZQPtxTPNixyehP5cjyl9xeNvEaytI50ZUV2wbIqaZ/1yu25
         RYRxjK5Rt+MPSKyGwmOmISKN9lABAIUOmDq5r3EjmD/eHUHXYn2U3Xd2HlW+EBD75fO0
         aw13HCnuJNuytcrXnvA1xmuRQncqBjk+ZTmvmLBKyK8J9VTyfbgoLYNlfbrGZUythUx1
         /+jA==
X-Gm-Message-State: AJIora/fjjuR5tZWMtjiL30msSyv/vLgGKkD56alMjW434oZ5WIdRpQL
        kVISj3Zsh6qldZknD6iP3w/eqQ==
X-Google-Smtp-Source: AGRyM1sczTtMVM/629rXprfOKAwXlLvM6SuOehwWrAwoiNnjNx+FYlhZrV3x5PftKLTUiSSrk01rNg==
X-Received: by 2002:a05:6512:3e07:b0:482:ba6c:64ae with SMTP id i7-20020a0565123e0700b00482ba6c64aemr7459413lfv.512.1657091121452;
        Wed, 06 Jul 2022 00:05:21 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id u11-20020ac248ab000000b004837dbe7ef2sm781324lfg.120.2022.07.06.00.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 00:05:20 -0700 (PDT)
Message-ID: <f0f1f652-f219-1e33-47e4-2679315da46c@linaro.org>
Date:   Wed, 6 Jul 2022 09:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [V5 2/2] dt-bindings: remoteproc: qcom: Convert SC7180 MSS
 bindings to YAML
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        swboyd@chromium.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     mathieu.poirier@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
References: <1657020721-24939-1-git-send-email-quic_sibis@quicinc.com>
 <1657020721-24939-3-git-send-email-quic_sibis@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1657020721-24939-3-git-send-email-quic_sibis@quicinc.com>
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

On 05/07/2022 13:32, Sibi Sankar wrote:
> Add a separate YAML binding to act as a superset of the PAS and non-PAS
> compatible for SC7180 MSS PIL. This also serves as a way to increase
> readability.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> Depends on Krzysztof's remoteproc cleanups and improvements:
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20220517070113.18023-1-krzysztof.kozlowski@linaro.org/
> 
> Previous discussion on PAS vs non-PAS bindings:
> https://lore.kernel.org/lkml/YUps1JfGtf6JdbCx@ripper/ [Bjorn]
> https://lore.kernel.org/lkml/CAE-0n51KBYjZvwGNy06_okmEWjEfRLQO54CYaY6-JnbBk6kOhA@mail.gmail.com/ [Stephen]
> 
> v5:
>  * Improve phandle-array schemas [Stephen/Rob/Krzysztof]
>  * Add more details to the firmware-name/memory region string array [Stephen/Rob]
>  * Drop 'items' from label [Rob]
> 

Looks good, thanks!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
