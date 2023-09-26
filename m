Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A25877AF316
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 20:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjIZSko (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 14:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235552AbjIZSkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 14:40:43 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA31812A
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 11:40:35 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c008d8fd07so158060381fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 11:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695753634; x=1696358434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cbj7xG6ItjgyzB3JMPXb9POyuicvcin6fqpj2Mlq0nA=;
        b=y5tE8tWGHMO0SkfEyQ0x8dftVo4zKwW+4KDdH2vv4EBAR0IzyZ8ejQ1/RKzCewigYb
         bEBsdbhKGmZb8oWLGSZfI0iA7UJvkxJit/IwR9Z/c1ytZRMcz+0RCHOjvZBWJdn8Q3Hk
         3tt5LeYgnBnwYQSq8A/5tj4PQf1IrEDmXQ8su82vnvTYkPlXF7MDmC+M9K4PV32ZNP/L
         6mghR9bqtrYpu+/2uaOnJ35oRM+MroejL8seFk+dci00DQaXExmn//usLkNg/KlSi6uf
         s1Xpdu+QH/JnaLLCa0rUB0SKxOS+nwK2cEid/cUZakk6xV/QJsKbp6JZvDt4ow9lSvis
         fKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695753634; x=1696358434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cbj7xG6ItjgyzB3JMPXb9POyuicvcin6fqpj2Mlq0nA=;
        b=C2XtpGl/+tqYzcQ1u4QjN2ESuQO3QfWeiE2OlCBAgwuTOs0v6jQbFyW4bi37ijtBE1
         R+Bc8gbuqd5SHgF5ixEbJap7/7aSZPXIG51PZqeZXJ/lWle3e7ndKzNGaDYdWM2BFlPY
         RER0l9JuZfbd3K7bT+6wPNv+h4UFJtYsaniobA9wnIOL+b6RjKRUsI+eJMWQoBgs1izW
         3qa+PdifWWPlQ8PkwQqxa/659Q0nQtp63pyeQeJU2DGwPI/YAu0mv5uY8RC5G8DX+nkt
         SwdXMS8EoxJmbNRjyoxprBhiPSo4mTnqjNWWgazzDAcbhNTsSfvP2BqkxRJmkNRGYeF0
         WBAQ==
X-Gm-Message-State: AOJu0YxjAT4yFurfy+Nha7AcjzpsEFHahjMacOYajFjQTx/2KrtU+bua
        7M1Lvdg9BSiloHIU1dpFWjhCrg==
X-Google-Smtp-Source: AGHT+IG0KLoWhYGIScPU0gY7MREMIOVjC/ozkDwJXiLjuGVLdz5Jw6Tn3wLyJn4evDa/npr+KgmZJQ==
X-Received: by 2002:a2e:9788:0:b0:2bc:b9c7:7ba3 with SMTP id y8-20020a2e9788000000b002bcb9c77ba3mr9035168lji.12.1695753634185;
        Tue, 26 Sep 2023 11:40:34 -0700 (PDT)
Received: from [192.168.33.189] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id v16-20020a2e9f50000000b002c12c2094e4sm2740700ljk.74.2023.09.26.11.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 11:40:33 -0700 (PDT)
Message-ID: <42a1d0ab-4e8d-461d-bb2c-977a793e52b2@linaro.org>
Date:   Tue, 26 Sep 2023 20:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/msm/adreno: Add support for SM7150 SoC machine
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        daniel@ffwll.ch, johan+linaro@kernel.org, andersson@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230926174243.161422-1-danila@jiaxyga.com>
 <20230926174243.161422-2-danila@jiaxyga.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230926174243.161422-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26.09.2023 19:42, Danila Tikhonov wrote:
> SM7150 has 5 power levels which correspond to 5 speed-bin values: 0,
> 128, 146, 167, 172. Speed-bin value is calulated as FMAX/4.8MHz round up
> to zero decimal places.
> 
> Also a618 on SM7150 uses a615 zapfw. Add a squashed version (.mbn).
> 
> Add this as machine = "qcom,sm7150", because speed-bin values are
> different from atoll (sc7180/sm7125).
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
What's the downstream dt name for 7150?

Do you have some more complete tree published somewhere?

Konrad
