Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F123551840F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 14:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235141AbiECMT6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 08:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbiECMTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 08:19:54 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00BF2DEF8
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 05:16:21 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id l18so33027168ejc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 05:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/b+e7JWTr9eWzT8A41T4qivH0UWvv6Q4VaBudX1+F6Y=;
        b=ZQlKa3dLY0Au9EqwmpAQ9PNfZ/1DlkrLR88Q74zE4pjWUpI2dqdIvmHdAHq+P27CR+
         6E/+e5sYQNym7kUGXOCWBMWRyz+u4Bn38D60r4PZQ5ANsSOM2e5yrxaUSPuiS0mBVTEQ
         gZtqJiPNPA+z0v/Rq1ejdamJOg/vmgi7tncJEjZkHBkbSpaEr4OYDKTNZBEeD00dsiBq
         +wr5wfZBAI+MykOOBvmecAfxAc3BnQ6p7UopDMZ6E1Wq8UMSvi5Uw/erbhpqpy7p0ZxE
         QLnMAEdihf4ynXQZW/Cp9JI+uzj+FRRDF/Mmc4DQXXloC8gJjY6dsKh/iLJ2qiF9D4hM
         uhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/b+e7JWTr9eWzT8A41T4qivH0UWvv6Q4VaBudX1+F6Y=;
        b=UatyuanGh3bgUWzxbke+YFNGhFSnj1XBhgM0sxKgNjuBXkV/twIQ+gQsxsFKQwmvNj
         NzJXiRNz4/w3R6VmZ+979HDWG9HSFLvoTMU3e+ZVV9blzKHya88Nujv0sa5QIW3NxXy0
         4lESwTvBspW3XcqSUKK7UO+L16KNa4PnLs0ODMWm/SmfbRV38M8caIBhDm6nzM5dCgn/
         gpS/UG3RY2RuSwuI8EljuSANUyzprPMmbOz6P0u+Genm6bR/cjy2EdBOr/he/R7na3Uu
         orulchICQJwkCBpjvFTFG0R+l/X14Yrqfasln8eMYqmVb4kZIlKaQNmmU6r3qtxuTqSp
         Tgiw==
X-Gm-Message-State: AOAM533lxVtOmmd3JJ4QK5572VWPB4UjWqtQD6G1o0oZRQ+LwpurcoRF
        ym00JgSMNIaao/RHWast1+jt+Q==
X-Google-Smtp-Source: ABdhPJyfA5UMh/SVxzxfYjbKJ3YJkocgwD+p8sEi7WODmeBv3SkwYnMZz64eGnRjiUZfOvLKhkp/bQ==
X-Received: by 2002:a17:907:e89:b0:6f4:98fe:49e7 with SMTP id ho9-20020a1709070e8900b006f498fe49e7mr1990047ejc.425.1651580180638;
        Tue, 03 May 2022 05:16:20 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q23-20020aa7da97000000b0042617ba6380sm7663778eds.10.2022.05.03.05.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 05:16:18 -0700 (PDT)
Message-ID: <8480940f-7282-511f-b640-50e65a6eef3c@linaro.org>
Date:   Tue, 3 May 2022 14:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] dt-bindings: thermal: lmh: Add Qualcomm sc8180x
 compatible
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220502164504.3972938-1-bjorn.andersson@linaro.org>
 <20220502164504.3972938-2-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502164504.3972938-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2022 18:45, Bjorn Andersson wrote:
> Add compatible for the LMh blocks found in the Qualcomm sc8180x
> platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
