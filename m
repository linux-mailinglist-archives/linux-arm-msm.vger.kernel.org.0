Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D86B8672190
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 16:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjARPmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 10:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjARPmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 10:42:24 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F938685
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:42:23 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id l8so7863777wms.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5NtzvFdoFFlXehDB6hdQDZxmdVgG0Ute1O+CIKYQYY=;
        b=RWhZjnHh9WSWwTA9jw44PxMZPDNPFFp0GKA5E9S9AFAxhg9ZhTjXsgO6CSoawr0cjq
         z9XfsVboRXUEz35SLMUdVCU6nBqLV+gnZPLC71xHaKsdipcz71akbOCe2meuDTGz6blv
         Ml9Y4OOrwM8det2bsUSaBWKDOhnLYcDpSYbyJ6PZqLTgr2sV5dv0mjy4Y5gvZ9ZqQ8Dq
         //pU9iYsXKYHp/4zxJ1MA17qH0TUmO7uDypH9UeyRJP45FRMA/ZV8GrppjYLafQEVfbX
         NN9LLf6cvW/20oHlmr2dLTmdh272/jN4WFJsXD8nRUGFCA9v9o1zPZTJflgHNXrgy2mZ
         w2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5NtzvFdoFFlXehDB6hdQDZxmdVgG0Ute1O+CIKYQYY=;
        b=O31tZbBVKmdTqHOkxUHG/NmTY45WMNjPwgbd9dzb4UQjupa6ywwM0oKg4SJUnIymts
         dfEJk7UmvaeEuXuucnT6Y2+tQBdX2k71ZrlaxKtOKgC/J/+/o+mSgV+Hig9Ty6D3g9mt
         mf0v3+XPul1YouphyWRhu03tIoYchOdKPoVWPO8gH4UcfFv6ZF0IQ9KGKiLE+uUT2vuI
         YLrI7jEhMo+hWPbU14H2oAfAhbU63FtztH8BscMo2KDtRZHtcdDquh0g08z8qnhgHfnE
         u10mL5tTLIJJ91bEbW7fxpUidAXOLLVZYEBhMCS/UA3JfB+bDrsDaluQMrtIRw0brtFM
         sM6g==
X-Gm-Message-State: AFqh2koDPsRm8azqNETeAywAgM/cyulpUQvZqHMR5i6LGZwtDxe9iYAs
        Prcg3le+GXPkVAgyekF+4JR/jg==
X-Google-Smtp-Source: AMrXdXsVLoYdnXbgjpmAkxbAFGqj9KLwuhq20Nolx42pqNG+EPcjLIG/4NRdxKA1mRETFlBNcXa9OA==
X-Received: by 2002:a05:600c:4f4a:b0:3db:5f1:53a5 with SMTP id m10-20020a05600c4f4a00b003db05f153a5mr7157275wmq.20.1674056541792;
        Wed, 18 Jan 2023 07:42:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bca49000000b003d98f92692fsm2210849wml.17.2023.01.18.07.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 07:42:21 -0800 (PST)
Message-ID: <f6ad4465-b991-3afa-903b-027f38239321@linaro.org>
Date:   Wed, 18 Jan 2023 16:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: document the GCC clock
 on Qualcomm sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230117180429.305266-1-brgl@bgdev.pl>
 <20230117180429.305266-2-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117180429.305266-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 19:04, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add DT bindings for the GCC clock on SA8775P platforms. Add relevant
> DT include definitions as well.

Previously you had nice, clean and short "add ...." in the subject. Now
it became long "document" while no one asked for that change? What
happened? Subject space is precious, so why changing it?

"document" is a bit redundant because bindings are documentation. So
basically "document documentation"...

This applies also to other patches like the interconnect.

With fixed subject as I asked in your v1:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

