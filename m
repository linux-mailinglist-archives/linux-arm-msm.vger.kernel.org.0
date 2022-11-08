Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4846210DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 13:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233936AbiKHMgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 07:36:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233878AbiKHMgA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 07:36:00 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2579717E00
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 04:35:59 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id c1so19388572lfi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 04:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iNRUdsuvY7c1Nj94/oTEANQHqS8U5hc27GeoZ4o3mrE=;
        b=cH8HGGi55LA8q/7nwAdlY78765ZvpMnrMIgLscnN+m62FjT2EHsCspSdyTLHui5Lz5
         EImbQhjXh7RdhLM/FG7yXuwk8iU9A8Hs4EfMy0xNUBEJOS+kFEGjUENW28+4vawqZbG0
         EYTbzRls4KfpMfuBjJ7e20pQ+rWQnZE4/ofeAy1yFqpi5u1UXizMOlHQxcXvGZP/SiLZ
         Y+YUFVT8yCK5Xfbm7JlAVGrkU2f56E2IwKYQPskZNtUfAtgvYZvHRMBJgmegFEHRU8J+
         DMixdfTjMG+GmLIXnZcNkPgQoIqteT1SgRxJBadmbZnzkY3VRRW7gfijBQToUwO0K17e
         Oxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNRUdsuvY7c1Nj94/oTEANQHqS8U5hc27GeoZ4o3mrE=;
        b=LRQpSF4mfJpBPwbAbH9Dj0o8kBO9j/R5oEBd0zzRCUt/xmLxAKJ9QWyIm5tCaVUp+7
         841Z56Dl9KOrk3ZYLr2pToryiVsUbz9lOusEiPKTj1Gv9X9U8Ck0X7TAW0+D9JJ3aQd2
         D/96jgiPEp/r19o4UDnRVwboMH9LwEYtBvbrQe9cIB4Ic9gDT2f/uG8rNDaSlwoRNzE0
         3WYK6nOxeXM/EdM1HFIgSg7DMvDupbqx3uEbphX5ZA1R14ma+tZEDDq0jjgfVJY61Zr6
         XBzzAetkhIExH9pzFZhBIkgr+AS0IkP+cJsD3yGq4wSSJrg1/ynFmX3YKApOstCkUjdo
         rQvg==
X-Gm-Message-State: ACrzQf2Xs1m7eeCrj/7x3t0VXWQj+0v26k4hmEjMrtunw3YmumcMMG6G
        Y0B0zvSuGQX0FALW3ShIOt+iog==
X-Google-Smtp-Source: AMsMyM5TDQ+lKG+eFrm5U8acDAnlb/ZJeqAb+4hY75v7A/a2remZhRkhBz/z0zrYmuBWxDgKGkbU7g==
X-Received: by 2002:ac2:5cba:0:b0:4aa:5b6d:fb33 with SMTP id e26-20020ac25cba000000b004aa5b6dfb33mr19618866lfq.491.1667910957432;
        Tue, 08 Nov 2022 04:35:57 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id j15-20020a05651231cf00b004946b549a19sm1763483lfe.45.2022.11.08.04.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 04:35:56 -0800 (PST)
Message-ID: <d5d6b2ca-ce4d-4492-a33e-08448974e6b2@linaro.org>
Date:   Tue, 8 Nov 2022 13:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/3] dt-bindings: slimbus: convert bus description to
 DT schema
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>
References: <20221026164315.39038-1-krzysztof.kozlowski@linaro.org>
 <20221026164315.39038-2-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026164315.39038-2-krzysztof.kozlowski@linaro.org>
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

On 26/10/2022 18:43, Krzysztof Kozlowski wrote:
> Convert the SLIMbus bus description bindings to DT Schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Srini, ping.

These wait for some time now... v2 was waiting and this is just a rebase.

Best regards,
Krzysztof

