Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27EBC6CFD54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 09:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjC3Hu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 03:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjC3HuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 03:50:12 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1446558E
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:49:55 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id e21so18697480ljn.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680162594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2EdrKMv5yzbDVcAYao26EMed7hVuHX+IgfAd0MIl9X8=;
        b=ISqK2HaGJ2ShTAAwlV5iKz8SRQT3UrSxld0YKVEPMYK+pscqM0R/6U+bckeojLi1Wj
         7OmqxJ4mUEWR+i8/t1Y+DPt3+FYqLnH6iqV0bExn/Cu740BjY1LMyyUjWeo5rfPAwo54
         ubr5i2m9oE2eRD6ZWnE0NWK6k5Mz+EUpCKL2G/hBI41qCTZqS+2krl6QaldSDy12Vflh
         Mj1jEIc7LWu1zg37tZtsITfX7FchrTj7m82D8wykYn6MPJDsl0ipwLk67Bf3ZiWn7kfn
         6o6e4aNvLnBsLu3NDM1Ojdejag+8vN5lqQgK7frGDdD5XB57rJoWsm1/j1lyxOsPNrB4
         A14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680162594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EdrKMv5yzbDVcAYao26EMed7hVuHX+IgfAd0MIl9X8=;
        b=FuNvQ9LyRH8oMVNJRB8mCMCQ12OSBAogSXJmxHjiaPeU3bmzoiyyx28aV+alMo9EJw
         8QqOJigyUt4SN1K+L6an9D/ASpcEhMGqMPlBDtrBrtGtRp/Xu1j/QgtjIgmXsnkczfDk
         plWBr/5VCGcbsM+2X5tPkX6r1CYJHs1R3+lRnaYxg0Glh9Z9i45jxSjAfsoaxX5F1pG1
         RLxGyabT7QGpBItfyYExL4YtkfXaoHReQVrJmjGERlip9yMPU9xXCq45hvgZTxZXvxtn
         nluWnYZ/Jto9RoDr/C1hx4bzsFJsW5roRjjbSNOBaWs4EEUOVdODnwHy+/IGXCf+AHHZ
         wWQA==
X-Gm-Message-State: AAQBX9dvOq1pbMwcuIs8wDYSwR53ObonL4MYirR+l6DfDifU9gJZD991
        QFWCPYPcHQipSMSEsMF2r0LeVQ==
X-Google-Smtp-Source: AKy350ZVqvxbpiA5Vt+73QEB9UtSOk1/Gm1un2/nbvhOOGoier9ju3WuVATMpwAVVkLM5aXBmqPswg==
X-Received: by 2002:a2e:7019:0:b0:299:c03a:1cf9 with SMTP id l25-20020a2e7019000000b00299c03a1cf9mr6747402ljc.10.1680162594243;
        Thu, 30 Mar 2023 00:49:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z26-20020a05651c023a00b00295b842c2dbsm5827780ljn.133.2023.03.30.00.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:49:53 -0700 (PDT)
Message-ID: <5d1d2d56-06c2-718f-2bb9-26bd447dd30f@linaro.org>
Date:   Thu, 30 Mar 2023 09:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/6] dt-bindings: iio: qcom,spmi-adc7-pmk8350.h: include
 sid into defines
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
References: <20230329000833.2507594-1-dmitry.baryshkov@linaro.org>
 <20230329000833.2507594-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329000833.2507594-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/03/2023 02:08, Dmitry Baryshkov wrote:
> pmk8350 can take different addresses on SPMI bus. Rather than having a
> default SID, follow the pm8350's example and make the sid explicit when
> specifying ADC channels.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

