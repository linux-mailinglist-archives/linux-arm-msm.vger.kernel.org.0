Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E894873A466
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 17:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbjFVPL7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 11:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbjFVPLy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 11:11:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EEEE9
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 08:11:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f866a3d8e4so8130887e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 08:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687446711; x=1690038711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUdCFZ6oe2yjg7ItwssHZu7+ri7EshQvaijGFsVG5dc=;
        b=KgNDgPZ9ygnaiP4ciSV2w4AJvLAWUjgivYnePevyYg3fjO27hpMMa+7z3A6zlu1VwZ
         vrzi6JsTcNmEcu/tlOC63tWem4snhB4FwqKAEV+W/n6jMdDN3cEmNnG+s2FYMQf9HICO
         QxZGUJfTs4oCh37WFQzVQM7ixhpZFIwy6WgymJC65/LDTZS+nmzFVXKNn3P3diGdSZyM
         7+tonMY5akYvocQkDzaOgpEQs4QlTj2eBLLbBcJ6sp4LXQgjHPT1/iPHX/+ltzfj7hKx
         1i/8xmKz8u5cSgHyTaQR5jKC1xttOSi8HBs2I7pFXEgbRPDtFgAqe4nO4Vch+REtcAOm
         fYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687446711; x=1690038711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUdCFZ6oe2yjg7ItwssHZu7+ri7EshQvaijGFsVG5dc=;
        b=GV5euO2WQ5YIsIxE3iTsYtXR1xC/QLpGz4XPeaWHUc2bML07tWe2rybzhwhNYc8OYx
         Xs/Q+UzMLeqA5H0b1YfxXOSa/61mq9lR5q/kVbdxDmfW/zghUMXrl7tRopIa+Eb2Fgwi
         3xkqVbEZKUFEvZNBiUkiao21dGp0J8fMY8Sw0NXdkRDFkRUGz+mF0G1/LH5lyODTaZqW
         fO8U+NoMMFRNoxSW87se6TEzMBOpJYiFQEljJp7f3byaSypaBkQidrw8FAJtjNexANot
         LH7r5OGWNoNxbEbwN/+Up1eFWpGugNDm/lWxw9DkwnhcObbq58pSvySwjxga02QEFq3G
         7wyQ==
X-Gm-Message-State: AC+VfDziO6tU4VBaoj9LwcZjxbOGn02C+7lqROEwGLMB3INKPKAtGP38
        BJMtQeRIfUxKe1syuvtA/8WCtQ==
X-Google-Smtp-Source: ACHHUZ6UM8p0nLiWpEkLmFQgIAz+Ss/WrxwCr84aHjaowE/pNxIsu7Fo+SyLQCc9pl8Ys6Pw0vM5Cw==
X-Received: by 2002:a19:6554:0:b0:4f8:eb99:19a9 with SMTP id c20-20020a196554000000b004f8eb9919a9mr5870627lfj.23.1687446711351;
        Thu, 22 Jun 2023 08:11:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id f12-20020a5d58ec000000b00309382eb047sm7213190wrd.112.2023.06.22.08.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 08:11:50 -0700 (PDT)
Message-ID: <83b95d08-e32e-3d57-cf00-3c40e0e44ee3@linaro.org>
Date:   Thu, 22 Jun 2023 17:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/8] arm64: dts: qcom: msm8939-samsung-a7: Add touch key
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230622020344.65745-1-linmengbo0689@protonmail.com>
 <20230622020448.65791-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230622020448.65791-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/06/2023 04:04, Lin, Meng-Bo wrote:
> Add the CORERIVER TC360 touch key together with the necessary
> fixed regulator for it.
> 
> Note that for some reason Samsung decided to connect this to GPIOs
> where no hardware I2C bus is available, so we need to fall back
> to software bit-banging using i2c-gpio.

Squash patches doing one logical change. That change is: adding new
board. Since you sent it as one patchset, then one commit is to add new
DTS. There is no point in sending piece of board and immediately another
piece. It's not release early, release often.

Best regards,
Krzysztof

