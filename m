Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA765BFA2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 11:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbiIUJGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 05:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiIUJG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 05:06:29 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90C84D144
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 02:06:18 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q17so6134956lji.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 02:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=XaidjAsbHoo0XuNv3vGo+jLMtWQ7sKWfR6BQnnoqVhg=;
        b=u6xqRkmEM9F9+V12EcLiJDVhzMVXWJOvU7DezT5ZXQgomVGTM5Drpkv3HW1/SV0iNR
         lzlusjNvJZaAk9gK6GdLrtOI0KMMZKangoAgmWKRXs0sS4SJGdf19+OAdPzzVKE33+st
         iufcYvsvXhwJjWljHuyfU/pPnnDJjnAYfLs+ZdJWvSpOO/RdYfEmkGcbP+G+NCNDEk/K
         qL2wIbodePsZ8+Q5yTDirg3cSxibfum/BAz+D1l7/pUiTnAU9ysuzAW7l4XkjDZgJVjL
         jZUFA8HlUnthD3JccI68Ka7MpsUCW9+slTR6Qel27oyAu8DRZiojIuVIe8EFMFIUp8ML
         B4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=XaidjAsbHoo0XuNv3vGo+jLMtWQ7sKWfR6BQnnoqVhg=;
        b=7cUYAiZTZdnR0uL0YnXPW1iCZjdOKxvpk9USgEE6NXa2tHp+WW8/PuqqhCKi0ELheG
         MkBj5gWcWYHTGHQahbYenFnKHBxiO4iG8l3vT1Vq9ocJOkKDzU14zmYHXI8gDmIxf2V4
         sJSJjAmVmmxOgaGzTutTrO4aRrwr+SodYpIc/qFaDIAMe42+DBgJjK4Dz30lOorAWREs
         cl8fIMNq8Fsmp38nepVdt04jeJ90haEK9ufB7g2SU1zCAEhg9aOQ/r/nUEfmiGZAySLL
         lHN5Xby/JxhLEhX0liuQN7mw5UeXihshFjNnD0WL0NP/eXa0Rlm4GTMO5ekdxQYJnzGn
         +4jA==
X-Gm-Message-State: ACrzQf1OhJzf2r9wM90+wAyHiauwunZo/98xLm4uH13QF4ppCoFfQFFF
        dGZPLjkN3vGx434DTdf+VZlKhQ==
X-Google-Smtp-Source: AMsMyM4jr3yj+Za5Q1J3zEjr0NI9DPwY+BCAsdPok1ihwOMy33j0cqgU++DMnqxUlBiFj4O9FI+ORA==
X-Received: by 2002:a2e:80cd:0:b0:26c:5516:1c07 with SMTP id r13-20020a2e80cd000000b0026c55161c07mr3972844ljg.279.1663751176957;
        Wed, 21 Sep 2022 02:06:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f28-20020a05651c03dc00b0026c1032d060sm340024ljp.135.2022.09.21.02.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:06:16 -0700 (PDT)
Message-ID: <895efe99-e0cf-d524-9ba0-8912ac5f1b50@linaro.org>
Date:   Wed, 21 Sep 2022 11:06:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom,rpmcc: Add compatible for
 SM6375
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220921004458.151842-1-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921004458.151842-1-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 02:44, Konrad Dybcio wrote:
> Add a compatible for RPMCC on SM6375.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - changed the compatible to match the style used in the file
> 
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

