Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79DF62BF16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbiKPNKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbiKPNKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:10:12 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39EAD21E04
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:10:11 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id h12so21759566ljg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OzLTp/uU4VbKo3MNkEDlZ41GKK9cTnY0rK/EndLg5gc=;
        b=GPzKI00ZjLIBVyYqVYEJJZAEvLkmwCubJYFFpd1TXtf324HTOzXBXm2egc8Hw7pDVb
         zvbqKZfE/Xp2r2OSmON9Dkqzt3D+lN9+RrHNWiHVn0GW3Q9CExkGLLF4VD7F/jC9qwr7
         qwkAaBLT31+49aE+8EO/j7wPpZ44MKqptaXgfTHKRvxj+XF72Sxw1ZUsIyAaHbSo1BeN
         Lho4uMpWc9AySh8LWXoWJiVMZ39FDBl7nY2SoUtbkV2zk4VxdbfF9+LbB173lvmqNZ/m
         WIDw4+f+dBau6UcEuqskGXyYbt5Y5yyrfGTPh7rBjFpgrlOYzfP31fCRYpogsL45ZWpx
         HviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OzLTp/uU4VbKo3MNkEDlZ41GKK9cTnY0rK/EndLg5gc=;
        b=AmIigIAvyNynJgY4mjxhZyOu/yy2DnVe5tzaMx7k8s/X11kR1hRsrcr1mSVXXKwiRO
         MC5O6/B6el+eJCo0tHNtG9N8FGmp7/T+Qu9eNZOaWT+PHpsk+FgESrGqNYrC69ujBhMG
         t62KwIfU1x4F8IYnnexNqbr+F+MYc7PhoBdQHYNk13n10NlNaeergiBekY8oTjtBSpje
         Q6/ZhTKw9tFIm4x7MYaYmiNLH19Wh/4vTaBzLb+sEbD/grwErhH50Yas7imgkRzw7ROA
         5TZThzjIX9yalmdE0BPS8W3hoBpVrZvjaMbvxbTsYMcn9ReRbRcTukq/0DFxJBpZqCkU
         K0wQ==
X-Gm-Message-State: ANoB5pn/+nzJVcU10i8b/UovZjZC2/px1TifzKNGWs0n4scoXt5f48lv
        NmfI/XDVyHMrKib95l6st7SXpw==
X-Google-Smtp-Source: AA0mqf7/HiTZlKfMlkxf9Nc/zXIaXt8h0LfQcFmRqYUgDv50ZBUlJbONzPMOk4JoS+Kwp1FqxVjrnA==
X-Received: by 2002:a2e:300b:0:b0:277:31c3:c9a3 with SMTP id w11-20020a2e300b000000b0027731c3c9a3mr8129154ljw.473.1668604209609;
        Wed, 16 Nov 2022 05:10:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k3-20020ac257c3000000b004b4ad5ee601sm406738lfo.255.2022.11.16.05.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 05:10:09 -0800 (PST)
Message-ID: <37650284-77c2-44c0-93bb-d7ef303b62a0@linaro.org>
Date:   Wed, 16 Nov 2022 14:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 01/10] dt-bindings: arm: qcom: Document SM8550 SoC and
 boards
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20221116103146.2556846-1-abel.vesa@linaro.org>
 <20221116103146.2556846-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116103146.2556846-2-abel.vesa@linaro.org>
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

On 16/11/2022 11:31, Abel Vesa wrote:
> Document the SM8550 SoC binding and the MTP board.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

