Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F76B7CC7C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 17:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbjJQPqD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 11:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbjJQPpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 11:45:46 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0940B136
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 08:45:39 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3296b49c546so4676885f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697557538; x=1698162338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+FlDi7fXdE0wEfZd9gB+1OuWbnJWsNKY37hZB2rRes8=;
        b=eiNlSUk1EMfYP2LE38DJB7vdMj6pXoXBlT9pXDJysY/BnG89txIjNdbIuc3L2nxQkg
         mYUSHwy9Khq3dlsnrp0EqgpPtX55hIGkUIqgYR12T5RzT2TNImQMRtEUCYNazHkm1eKo
         m4yKw7vnMY+c3epKRB7VHnLI7HyawthYIOtVSKkQCC7dqiOmC52PuuhtHRrrzfG7XSde
         3wNhw8O18LdN4rW6WiGyQVMC9VEZ8Me/wEzEnoOGelZ13WKqMD23/1ewNyu4KliW+8ds
         4sKscibfoMvArNvD91igigc9SY9SNNBjwC5d4NOrFBe1aX3E/DwHQwhCKvn+pygmKhor
         qJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697557538; x=1698162338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+FlDi7fXdE0wEfZd9gB+1OuWbnJWsNKY37hZB2rRes8=;
        b=s9l9rjHdE3YbeZZYHJHs/vI0b79cBF9gxrPxG2/x2NZGC60+D3HpxUmq2kM3RI3UCi
         QL0O4DExgT7SHpljse30GiseoaPYuHzVH4zeiK0WAQuWMauDYhwM/LaA9a4CJyOicOAN
         vZIkU7SNTuZqmIRN1Tt03NfHt6XxSb3Udw2eCma/x2WLOsYjgRm0YtL7HVq2VJZ0OU8j
         h65bJKHeD51xjkGOKZKXU44DtgJBV4UTLJYubv+apV8DCfK8iO8jhrzaKMFG4XXnr7qo
         MivIgFLdYx6jvZg33F+g/ZnIC7cdBMIb/kf3mhfly+4navsPsWZr7iJjCQrFnKHs3zI5
         S3Ug==
X-Gm-Message-State: AOJu0YwafqCJUdi5aDWC5qZQsjDA1bmgkjq5G0+NfDHlMCWplDgUlV1u
        BVNVF3H5PxsECzeji1PXwfZ2xQ==
X-Google-Smtp-Source: AGHT+IG/EPVXtSqFgm43PmkVaB0SUGu4vdHzUrVbvrAHjVXTj5k4rwRAj7tJfiwCiCWHLCq9csbOBw==
X-Received: by 2002:adf:e412:0:b0:32d:8b1a:31a9 with SMTP id g18-20020adfe412000000b0032d8b1a31a9mr2260215wrm.41.1697557538172;
        Tue, 17 Oct 2023 08:45:38 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f4-20020a056000128400b0031c5e9c2ed7sm33293wrx.92.2023.10.17.08.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 08:45:37 -0700 (PDT)
Message-ID: <6ecd937b-a741-4ac3-8b99-218fd1f3d084@linaro.org>
Date:   Tue, 17 Oct 2023 17:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: pm8350k: remove hanging whitespace
Content-Language: en-US
To:     Nia Espera <nespera@igalia.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Rob <Me@orbit.sh>, Clayton Craft <clayton@igalia.com>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20231016-nia-sm8350-for-upstream-v1-0-bb557a0af2e9@igalia.com>
 <20231016-nia-sm8350-for-upstream-v1-3-bb557a0af2e9@igalia.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231016-nia-sm8350-for-upstream-v1-3-bb557a0af2e9@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/16/23 14:47, Nia Espera wrote:
> pmk8350 has a random tab character inserted, so remove it.
> 
> Signed-off-by: Nia Espera <nespera@igalia.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
