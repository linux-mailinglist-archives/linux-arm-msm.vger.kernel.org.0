Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 631BC6C0177
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 13:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjCSMLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 08:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjCSMLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 08:11:44 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A1C22A2D
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:11:37 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id x3so36746742edb.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=D1fP3GN2Ho75ugMAWO87ldGgGppe72Z3Y/fiWx4nspzwK7rloaOBoF9R19b0JbiRD3
         /mLXqx0QXb4f0L0ilB3j1w+e9Fwq4+LAGzNO+pIUKuu81K+Dhs2nyPPhOdR1hF6bDzbu
         0y3KFtdlTTRo3LySMTaY9gOhQSMrBFk88A8n+//C69MZejED+xn55zfOI7TYqDszOPc+
         fKWW/risjXSXRSuUrm5fQoJv/1hToGx7tQSgd3glFjr0Y54XW8bJZTY/vYLNslJ4g9T4
         gGptc50sPXOMaTIvYxS6fPpQP0vMqlYdWsQdm9P5lE+f6mWTqVQd8o0LR1x8SVnpFN1o
         NnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=FVp9NgFML+T6ffkjyP8ABDcXBT9yDnCZOUTo12SogGbK1DxQecjZbB41mGFZAi1d5d
         JMiL5/WsbOv6G7IohsGP82pCZSDxNIOiZw8+nJ+FK+wW2OkvAfcMx2ry824MDlO34mJf
         qfSD16sDc9+gIz5D9JjiqjZn2xaU4FMSaN8XxiWV147UuE5RpE9xl3TJcP6wByspn4+t
         wWa68w5jImb/BU2O/cyTxbq1RU77ekswu0XmwTBKeeKDRAfaEYSl3cneOVu6owFEHFHB
         Etsm5dQPdQ91ItEO4fVhvyfjAT95exXE2f1ktYHZFnDoh4LmxJXxLYLlPstF/0FKboZA
         C++A==
X-Gm-Message-State: AO0yUKXTJ44MmmmcTI+0d5IOlfX7odmZ/YaPfTuMUEIAvg1Hehzv1wJ9
        vdKaNZ5wCH2vIdXhojlAhTGZDQ==
X-Google-Smtp-Source: AK7set8iy8PHLbwswKclQFdAmwnEMv+GMXgczERgugb4jIY36ndBXldESO9YpLHBZGsBIL348OtAog==
X-Received: by 2002:a17:906:35d6:b0:932:be78:a728 with SMTP id p22-20020a17090635d600b00932be78a728mr5583291ejb.68.1679227896102;
        Sun, 19 Mar 2023 05:11:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id ja21-20020a170907989500b0093338259b2bsm1635711ejc.207.2023.03.19.05.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:11:35 -0700 (PDT)
Message-ID: <652a5f5e-6f01-4e5b-d1e3-4161b58d5ae5@linaro.org>
Date:   Sun, 19 Mar 2023 13:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] regulator: dt-bindings: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        chrome-platform@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com
References: <20230317233616.3968003-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233616.3968003-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

