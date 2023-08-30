Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A105178D8F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236502AbjH3Sbw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243045AbjH3KJK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 06:09:10 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B731BF
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 03:09:06 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5007f3d3235so8559659e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693390145; x=1693994945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbGayIc8QmH3229W77BP5+D0jARgdrG8RYkDkQrYe5Y=;
        b=l/pXmj5Y4iiA15CpbhMZhRCda9HOjjRczLqsESFBAYXnFxBHo3fElpG3N0WqTCCI3A
         BExzz+AWFds44G6hOlZxX6e37OSY8ZRfossgTtmRuYUXgeaN7UIoKIRWw5QKcmTxgrau
         UbSW4CEZ3aj17j9KY6sJJf8/GDbAQsGjaC8hMr1v/gijT6jPaC5X6AOlsAR7CSWrTDO7
         t0QuUNCTAnJGQzEcWF3wdYJqXOK6VPBGDou1Iv4I/LFVm/EvTdAMP+IxnHAw0DgZjZ8M
         vmSA2W7XIjTm+V8mP9ZaFXt+IAy5AFmk9emWvJ5DHuc5aPSMZ3yW0qcg4VxcilmPBm34
         JQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693390145; x=1693994945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbGayIc8QmH3229W77BP5+D0jARgdrG8RYkDkQrYe5Y=;
        b=GSslRtkX2FoWXBT/UouNnpjd68Mjgm6W40pUqdFUvXBiucQ3/p3SqZXWAObHeP8o7i
         L63DK6Y7FKIlF03Vm+P9I+wZhgJTRDoMQXhr0qpuF/7aX6yfpIqp5GG5sM+EOHPPbDLR
         7ltW2fwjaDF2Yvj2w29OTI/yILMW1aioBQCndAsNuLRoNYkUiCVXTIObLBuXwArNGIUU
         ww/U2N/TvfVIIxqawcAwJRHhd938lXTc1riDgDcP92BLjfOAbpAcQzt8RTpjuBbQ3cg/
         IRym3Xn8FqqGh9dMoop5fPRLSLEbsqZ3YYQwTP+L3iSQ8bZ9AkuZXCf4xGjgFbQGCqlC
         0Dxg==
X-Gm-Message-State: AOJu0Yy2BQUCvYyzhu1XJe/iBY3oT0/IflwPK7bcUle/vDI6ZN708BbM
        jh0By3Y9Piy9p+rnX/8HndlQHg==
X-Google-Smtp-Source: AGHT+IHy9a+HPDPy7Kt18kV1w/1InlaMSmy6OG+3OrqLDuwTDJYIvmuHAlIjm6BwngBARxzJqrSQeA==
X-Received: by 2002:a19:8c05:0:b0:4fb:821e:2241 with SMTP id o5-20020a198c05000000b004fb821e2241mr1330070lfd.23.1693390144960;
        Wed, 30 Aug 2023 03:09:04 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id z8-20020aa7c648000000b0052a3ad836basm6550370edr.41.2023.08.30.03.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 03:09:04 -0700 (PDT)
Message-ID: <2704de3f-abf0-0c32-379d-ac83c9e84d9d@linaro.org>
Date:   Wed, 30 Aug 2023 12:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 08/11] soc: qcom: socinfo: Add SoC ID for QCM6490
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
 <20230830-fp5-initial-v1-8-5a954519bbad@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830-fp5-initial-v1-8-5a954519bbad@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2023 11:58, Luca Weiss wrote:
> Add SoC ID table entries for Qualcomm QCM6490.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

