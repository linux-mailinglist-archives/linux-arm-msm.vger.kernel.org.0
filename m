Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53E17573A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 08:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjGRGJq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 02:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbjGRGJp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 02:09:45 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7995F1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:09:44 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso8522919e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689660583; x=1690265383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5VQwVrGcXMfCfvuw2kyfpvvEbdxnp5EKgVKHPURbWM=;
        b=HHvKaDKj0O6hNAptE4inyZOHuRF+UKZXm+WzhvsppGx6mT12Uv3s0wHix2zOZOkvkJ
         877SnV8WdE3kc/5yorMj2oCVMEcnUrqvrqltwTn2u3Ma5XlIhQ9YjVrYtchVjFchEUVs
         b4ns+4ukynBmrM4w9TK2edsk+MJLwwQFbmx0sdD9fvxXosHfFSPF1gAHqA55UosGsiHD
         asr4nRLbFZLmqxAJyEVTPU4ej+5KkCtQJCfSuXXDYYgcVdwYifBoECoY7YkW7k5/iM8K
         VPnYrIdT8Q//oCldxyRGgcLZUqFNTzskDMAuvE7hvRpARirSNs4Gfz0gRvAqXT76NsIA
         MTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689660583; x=1690265383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5VQwVrGcXMfCfvuw2kyfpvvEbdxnp5EKgVKHPURbWM=;
        b=IP87ZSjnhvWvXAXP4FxKQ8X7JDWlo3HjY3XZY1hMfl96lx5EziOKmFNmm9n7BinZLy
         77u3U+vhjsngf6JJ+Qq//TKlJ+YaS8+RiGvWCKDRmDxMtJ9dvlFGj9/4i1RbbIwK1aM1
         dkEcRk/bMg8PdTPoYhGu00RhcrFRb5gdm62Lq080RBTMWOl8V/AFvm6UDqV5PgXMWbqL
         DD0VvYBGaorK5NaY0cITHCVme2hVcPURAp85u/B6b6q7vxS+AId/5D9k5BFssT113dIC
         VxMlG4PRgzQtT6hFd4vc/y9OqsDN4s/Ije2xIuSHpGJjKf2elL4o4psiH0mJaHx2wsAN
         doeA==
X-Gm-Message-State: ABy/qLYy0fhoXtc2/VnXK065LO6fhlKvAwkSpX1KoV6Sg/WbQ3HORrqo
        JUU4GAAw3RaISqc46O82/vyvQg==
X-Google-Smtp-Source: APBJJlFuWqM7VJ+TLOLnaEcliAKHtvXtVu+8Nyr2lg0mEZWLl6kglI0wuWE+sp43IVhjUCSwTxDmtg==
X-Received: by 2002:a05:6512:3989:b0:4fd:c923:db5f with SMTP id j9-20020a056512398900b004fdc923db5fmr1976725lfu.14.1689660582991;
        Mon, 17 Jul 2023 23:09:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a28-20020a056512021c00b004fbac025223sm279081lfo.22.2023.07.17.23.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:09:42 -0700 (PDT)
Message-ID: <0075783f-9166-89aa-a9f9-068494e468e3@linaro.org>
Date:   Tue, 18 Jul 2023 09:09:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable DP support
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2023 07:37, Bjorn Andersson wrote:
> On Sun, Jul 09, 2023 at 07:19:21AM +0300, Dmitry Baryshkov wrote:
>> Implement DisplayPort support for the Qualcomm RB5 platform.
>>
>> Note: while testing this, I had link training issues with several
>> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
>> or VGA connectors) work perfectly.
>>
>> Dependencies: [1]
>> Soft-dependencies: [2], [3]
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/
> 
> I'm not able to find a version of this series ready to be merged, can
> you please help me find it?

This = Bryan's? I have posted some (small) feedback regarding v8. You 
also had issues with orientation switching bindings, etc. So there 
should be v9.

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry

