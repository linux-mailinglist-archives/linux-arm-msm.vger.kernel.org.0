Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8446450E8AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 20:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243532AbiDYSwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 14:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244646AbiDYSwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 14:52:31 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FFC128CFF
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 11:49:25 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id g6so8578271ejw.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 11:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=83hu77dgmAdgOlmu6Sz8NpPU54JO4fW9HRIvIUjVaz4=;
        b=QP3o+fHSOMrRf40mzyQrQUCqiB0DMBCJz7V49S2SDp/tc2/AlG+yOb/+Esp+KWOxHL
         Hpd2VguxluR47JPQ7RUFjqWjp/g46bH0bAvwx6tea3mKXa1M97jR4AagwTKTLN4UH9US
         oexyug+MYU33h2mlCaUkcRz2Vkk1Zer9seA6uomrtdnVNL8epo2381tJFdfmQG9jCMi5
         bfAzJlaVM1CNzAup4ELb1Ig7i7aUD5ox7Vi9SC3khNWG+XjdB6du+U4k4Wma2+0/SX/Q
         rqNDwH1ZUAVdlN/TYUZnT/JUFn3aoGcu8o+AUoI8ADGEKu5Si8gUCIU079DUbDpAAIJl
         d/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=83hu77dgmAdgOlmu6Sz8NpPU54JO4fW9HRIvIUjVaz4=;
        b=StMh8TC7zG3NHNIKs1FCRLJ8hOvqbQap0W4SO4xB9UlThZ/KkBshnyjFlgK45eitkx
         AN5V6KCoOG3hG4AplJSYq319BfPc9Tawn03xF9bAnizcyInnDMGpg+IDAaXz85Rf4svt
         8qDU2LH9SEArOfBcTuHR5VOU3RPVG7WGGABKbnA1xkf5kMz3pU5DCARgJ0encvJxkXyi
         xe/vOQHWrPDwURbIWlGf0lEXMzB2HQFHzWNqSfmFn7x2j4PQTBDzqqiCmGrHMYylUG4c
         pWGOjrRWt5L8iPUuT3Gjl6eYYYkhi0Xe24XtSbU/Z+wZrLi2wBqimqWCtScAtcX7pM7a
         Fqeg==
X-Gm-Message-State: AOAM532QCm3OOx2qbLF+uoFrLs+faS31Ojc1TaNybyQKa+4ZL0niS8Vt
        pZtIJ0Vcizee6tJH6G73Z0EU8A==
X-Google-Smtp-Source: ABdhPJyQ7KfkySdz2j3okSsEM8q3uVin74vtr55i0ci5U16Z53odwYJ/cgDVkR+3Ym2GAk7d/IyFFA==
X-Received: by 2002:a17:906:a2c5:b0:6e7:f44d:ed7d with SMTP id by5-20020a170906a2c500b006e7f44ded7dmr17731309ejb.329.1650912563700;
        Mon, 25 Apr 2022 11:49:23 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906709000b006f3a8aac0eesm277773ejk.0.2022.04.25.11.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 11:49:23 -0700 (PDT)
Message-ID: <3139ef34-322b-9afe-e5c8-ae0f1b7f1848@linaro.org>
Date:   Mon, 25 Apr 2022 20:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] dt-bindings: clock: qcom: ipq8074: add PPE crypto
 clock
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, absahu@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220425182249.2753690-1-robimarko@gmail.com>
 <20220425182249.2753690-6-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425182249.2753690-6-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/04/2022 20:22, Robert Marko wrote:
> Add binding for the PPE crypto clock in IPQ8074.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
