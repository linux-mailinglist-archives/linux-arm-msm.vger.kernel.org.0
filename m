Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB71469F09F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 09:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbjBVIrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 03:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbjBVIrj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 03:47:39 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B527E37B41
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 00:47:38 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id az11-20020a05600c600b00b003dc4fd6e61dso5580562wmb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 00:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydbqHIOomLQeh1beAvbyiFGfrGZ1Ce579+OZnxybWPo=;
        b=fs3cPLauczcQdWa3FwFOSUhbiDXDMbGYoP25M2Of3zCyCpnMP/+YxTVIy6cPJ+7BFf
         iKGuIuehQWipO3gIj2K0Y3sqoxbQPw9XBmtE8TT/iA6Hy/exctxcVHUgZBk94GZ6r8l4
         sn7bydZckf1EsawQOcONeOTorrJr6zIhgHfVcQcYQG1M1Yp09X5KDxCO/3QQw1Jx8aIb
         9sn/zaFlc5o0dwE/NJ1tvdpFituLHPFOgI2u45mOPoKa2rsSkCBHhJnn6gOQNbmKQlGu
         oUxbqirnBZTcp7ZUzA8ufwOK5I8uJxJQfnEDqJWnsyd/htZx/ZgtOuxLhD21rEtKdk9R
         JG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydbqHIOomLQeh1beAvbyiFGfrGZ1Ce579+OZnxybWPo=;
        b=mv/OFAkFyEGtiFGLAM3Bg5U22h3mYJfhxrZA9GqfsIf+ZhpRzCxcwfN+RPIrcwQXjX
         t2e0JvQgXoNwNQbX5il8wU7Ioe5wcMv/+GnSyBdX6Sd70nYefAdPsyOM/Nrkv956yuzQ
         qCmYPhQtz6prykw4uhJHp+wT8P+CTQjv9DqfRPj6cgon/0jFR+ZdHJ3tfyku+KEROZ8L
         tjVyeP05YoVReA0QK0AzzjlnyGQe0upneu1eLfsDnzXxH5lNWijrqkTwO2G106WFtxyp
         q+Pj9otB9+oc1fLEad1YzAolsqRih0oMGX7nHKB2ETxDvYq/7tbsRVSj+EzIqSUao1Zr
         lmCg==
X-Gm-Message-State: AO0yUKWxlNoyE8t5H0gCdGyJheuwIRZrsGW/2JzHF3PRsHYZ/WVUgGga
        UGyA9iLsvSUyUOwR9wozDxVnGQ==
X-Google-Smtp-Source: AK7set/Zwaf/JaFNUau2+Uariy73JokxO9E53tfbT25EZNWh66ldE+Ieh8tCAjj8QikD8cnpcGdsRg==
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac16 with SMTP id i48-20020a05600c4b3000b003e2147fac16mr3437707wmp.10.1677055657253;
        Wed, 22 Feb 2023 00:47:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c468800b003e2232d0960sm8408707wmo.23.2023.02.22.00.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 00:47:36 -0800 (PST)
Message-ID: <51bc1656-2855-5d4d-076b-af1fc496974b@linaro.org>
Date:   Wed, 22 Feb 2023 09:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add MSM8917 global clock
 controller
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
 <20230221174909.164029-2-otto.pflueger@abscue.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221174909.164029-2-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/02/2023 18:49, Otto Pflüger wrote:
> Add a device tree binding to describe clocks, resets and power domains
> provided by the global clock controller on MSM8917 SoCs and the very
> similar QM215 SoCs.
> 
> Add the new compatibles to qcom,gcc-msm8909.yaml. There is
> no need to create another YAML file because the bindings are identical
> (MSM8917 GCC requires the same parent clocks as the MSM8909 GCC).
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  .../bindings/clock/qcom,gcc-msm8909.yaml      |  13 +-
>  include/dt-bindings/clock/qcom,gcc-msm8917.h  | 190 ++++++++++++++++++
>  2 files changed, 199 insertions(+), 4 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8917.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

