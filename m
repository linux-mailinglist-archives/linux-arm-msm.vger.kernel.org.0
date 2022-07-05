Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4667566771
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbiGEKKH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiGEKKG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:10:06 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029F013F9C
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:10:04 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u14so13916832ljh.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LwklaHXJqGy4wlgXwDIhCrndZKL+YTgeKYcd/TD3PiQ=;
        b=aOh9dSMXrNAXc0z/pI4Hry0cqbB44nx6nC5EhhDM+WOL57j1b7ci3SZm6fPiCghQp3
         cORKCB/lEX3S/qbdm3ZHkkIYILmXf1XGEJxwvvj0fyBOvSxALZOFpxj/lc0uQaMG7WqL
         kftoB4UP31UAzGQkFeGQizw0vglQsSncyz6OrLNn6YuNjIvX7VFEe28dHfn6VTyvz1Rv
         5bXohRHKKVHVaVS4/mpen/jc0NPCDgGysIvJREQ3oOzHybhU6nGKDzhh8LS/rQYEYiw6
         uY1UYmGyPUXYX04hwYkUSC/dE+TDFdLWN72oZmGu6CL3/eg886lUB3csJvJvFvx0H9TA
         6nWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LwklaHXJqGy4wlgXwDIhCrndZKL+YTgeKYcd/TD3PiQ=;
        b=VPAjDf/ltmCu0ginnbzlj3VER3m83GLCYF30ojFRUdp++F1ylY4w4OgrbLshV6xlzM
         p5JVx07MzPzEBcHhcRFc+t73bX3wRrPtAr5L2Kz8NilgreZumxX9iVPiSIFNVH1+rB6+
         FG/vlQx0iJof7O7KNc83jV/wgTZ2Iimt0lT6dgEzqAj297ocpQdXo0bCQNXnN5kfVraF
         V95+XHp98VdqvGkF2VJevd7nQaFBl13Lw1WYQG99QluZPKN/TBa5NhvVwhcRGa+iZm4o
         8IctNNmx9qr4i2cfFzmKQrSY8HCg/+SppgJE1p751oIJ9ynINqhsm9D1oJvMhvzygSPo
         o1gA==
X-Gm-Message-State: AJIora+HI9MhQ/6NyPPIWkvfO0odgAfx2B0te8hv83qzwvh4VqgL8qqR
        FMiywJwqi/tZfKbnfonSaR3BAw==
X-Google-Smtp-Source: AGRyM1s0hx6q+PGgs8vObtL5mNO4dyrsFKrnrsb6ldgX/UGAi/GroCR7ru61pNCfVXQ91wfq0KJy5Q==
X-Received: by 2002:a05:651c:a0f:b0:25b:c834:4604 with SMTP id k15-20020a05651c0a0f00b0025bc8344604mr19291694ljq.252.1657015802410;
        Tue, 05 Jul 2022 03:10:02 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id s11-20020a05651c200b00b0025d33ef2623sm220507ljo.61.2022.07.05.03.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:10:01 -0700 (PDT)
Message-ID: <d3ff8663-b72b-2616-656c-2b3b5eafdbeb@linaro.org>
Date:   Tue, 5 Jul 2022 12:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/43] dt-bindings: phy: qcom,msm8996-qmp-pcie: add
 missing child node schema
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-9-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-9-johan+linaro@kernel.org>
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

On 05/07/2022 11:42, Johan Hovold wrote:
> Add the missing the description of the PHY-provider child nodes which
> were ignored when converting to DT schema.
> 
> Also fix up the description that claimed that one child node per lane
> (rather than PHY) was required.
> 
> Fixes: ccf51c1cedfd ("dt-bindings: phy: qcom,qmp: Convert QMP PHY bindings to yaml")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
