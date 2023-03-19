Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832AB6C01B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 13:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjCSMpI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 08:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjCSMpE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 08:45:04 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DAF5FEC
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:45:02 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id cy23so36885731edb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679229901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCTgZebVVm3SAwgFxhDwSK/Gl8/y1efOmPvW3Xr29/c=;
        b=Vs631nDEi4V1cnOrP8EW+vBiJqkI+OSdgEVFP8h9aPxViFxmLtttn6SffkhyhYsi4J
         qwnnovowkzRU38BgeexRZVFH+Q/7EE32isO40fwyH1Wtp/5wRuznrH4lwrfwDYCfPYuZ
         tOwWHNCw1DnosBfeSOz+0F4yLCBecxJ288koiLDGvSiOII8eEShlAOOByMhQj7bT0UmT
         juYmnZYejNjv2leX/VPVum78B9c+U1XUhl5ubbGPZTlRQCoKOJkHScZKRl/yNdP3f36Y
         W7bDBiFNWKfteqUfEFVesmQWqri3wQ5/kbyRBUGQ4S6ckDGjNFwgXdMAJU8XasllUurV
         LBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679229901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCTgZebVVm3SAwgFxhDwSK/Gl8/y1efOmPvW3Xr29/c=;
        b=v9P7JXGBhY3/SBn4XfjZbR5s3wqR0K2YC9mRJL0QAQjRNZr5zgMRl5A2vFHE57Hsp9
         25oDmuVQY4HpctC4zvthr+QxCyfCY59+0NSUIUNxYcXo2ANzIt7wqZxxp7Wdq6J29Rt+
         JaTAtuWVmfHDXyESUmU3U/+H27PB3zxtKffIUaBU7WCAfZL/t5c76fUH5Aluz1TelV26
         ORuFhYCo+UCV91SV3HLNUIMVuhk77d9/mMNgnHupgAQlUiiLJOcBmY9xq1QFivrPViXi
         oCbdoSGNQYOUOVXZ2JWGqpoQqG7+r8ggI5IIC6kwMHALJfCkulXQJuvUTvg/tVfhIJLQ
         ntBQ==
X-Gm-Message-State: AO0yUKVW3g45jSwflu/zmAodDAFP/7TlbhemSvXPAF0CibZ6UWQL34UO
        nAwGqIZSbckqWmmXLnJNQhT7Zg==
X-Google-Smtp-Source: AK7set9ycbQpkITSZZVeeTqAXAUV+8hhBWM5zggBut5EX71bp/x884UwxtW5Gs6+Ckc0B6YxdlzDhw==
X-Received: by 2002:a17:906:52d2:b0:930:57e5:d9a8 with SMTP id w18-20020a17090652d200b0093057e5d9a8mr5383738ejn.68.1679229900749;
        Sun, 19 Mar 2023 05:45:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id e3-20020a170906504300b00930c6c01c9esm3294677ejk.143.2023.03.19.05.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:45:00 -0700 (PDT)
Message-ID: <0aa1e2a6-b0e2-ce4a-bada-8ef0e6412be7@linaro.org>
Date:   Sun, 19 Mar 2023 13:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/14] dt-bindings: interrupt-controller: qcom-pdc: add
 compatible for sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
References: <20230314183043.619997-1-brgl@bgdev.pl>
 <20230314183043.619997-2-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314183043.619997-2-brgl@bgdev.pl>
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

On 14/03/2023 19:30, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a compatible for the Power Domain Controller on SA8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

