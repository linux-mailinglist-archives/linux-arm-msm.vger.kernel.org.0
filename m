Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675D8628315
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 15:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235927AbiKNOqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 09:46:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236390AbiKNOpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 09:45:46 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931AB2AC4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 06:45:27 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 21so17673561edv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 06:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhg1ArHeDiNOIc1c3WO2PoBqb5MmFgT3P2U3KW2IFus=;
        b=o3s4slZ74bmw0QnvFTOBthjLXwVbREy4a+w7/cyMOYYLN+CKBzwf/kbQuveBqYZi4o
         qTKCvTjFAwkp0z92CddHMITKBZ3I/IJkfy4R5YN6l+zVb2PD3GfHUcM2abqbJTU1PNGk
         2Q3N3nYDIQhQGCjzhid9jl9vXdIhRI+4o3NLo7ero2eSzH9a3puwT22HQWmE0yKSwNzN
         fiFXTnHv7k+y2qOeFOJj/jyduP94euiAGKQ57Bdwp547A/9DDZ0XMcshGUcnWGdARhlJ
         YyxT/m1Jdk4/aKcHksz8iSpcFyeHmPmSZ0Y/cVWHrvmJCRzyOmWuDFG9aJaqsYD6O5tJ
         oJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhg1ArHeDiNOIc1c3WO2PoBqb5MmFgT3P2U3KW2IFus=;
        b=h8YXNLhzJpYU3ajYCbQua7oUoXqoxnoaYzEmoaxg0qjSTI4PkEyGxtEUqgTlT3k0Pn
         +90BNkEyVMVI0VqKzRzFsDYwhUD4wb8ZZ3yPtUvgEHk+BguXNX7KCKUbjq7NvgLnWl3V
         yVxwd/Yszx/hj9/gORiwkYFyTe0BcTpcrGf7ugQLaPnJ6kQxCaF3OIu++6VCRNHJkwuh
         0XCSipWuGzHCN5g6JzSva12cvEXPTmD0Tcs1LF3IIyR5gNISvfjHCMehR4ZThiuzitSZ
         H8wUhQmyN9e2+XOIn+H2A7htitYC7jUf8imP9rF3sGA0HHSSYE1RFc+4tpzin9KzKPvx
         UQnA==
X-Gm-Message-State: ANoB5pkegMjnwzvz45Em9UU+rLHq31xHeBWkmhkvt+fU1wW1jDUXyf4F
        v4xOyeAcITIjLuW0oUy5j0FMoQ==
X-Google-Smtp-Source: AA0mqf5UhKezVrtz4Xy2aw+DQByvwrXrMoixV7ZBK55+9Lu+A/hlbMW67OukXIBkuVzSbyMcNV5bFA==
X-Received: by 2002:a05:6402:13cb:b0:463:4dd8:d6ea with SMTP id a11-20020a05640213cb00b004634dd8d6eamr11618779edx.426.1668437126087;
        Mon, 14 Nov 2022 06:45:26 -0800 (PST)
Received: from [10.41.68.197] ([77.241.232.19])
        by smtp.gmail.com with ESMTPSA id v17-20020a1709067d9100b0074134543f82sm4314567ejo.90.2022.11.14.06.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 06:45:25 -0800 (PST)
Message-ID: <1931d0f3-d280-9a42-b359-48266801cc71@linaro.org>
Date:   Mon, 14 Nov 2022 14:45:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Add vision mezzanine
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, robert.foss@linaro.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-7-bryan.odonoghue@linaro.org>
 <0dcca394-1e90-6743-a50d-33b26c1a4836@linaro.org>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0dcca394-1e90-6743-a50d-33b26c1a4836@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/11/2022 09:49, Konrad Dybcio wrote:
> camcc goes before camss alphabetically. Though I see no reason why a 
> clock controller would be disabled, even if the clocks sit unused.

We discussed this before

https://lore.kernel.org/linux-arm-msm/0864eed7-bba2-59ec-dc5f-b491ce114798@linaro.org/

https://lore.kernel.org/linux-devicetree/20220518091943.734478-1-vladimir.zapolskiy@linaro.org/

@Vladimir are you happy enough to enable camcc by default on base rb5 ?

---
bod
