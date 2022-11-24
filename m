Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67BF7637890
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 13:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiKXMHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 07:07:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiKXMHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 07:07:30 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C49C5B60
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 04:07:19 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id p8so2229529lfu.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 04:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BNX+VAXy5EEQKW4dVQA9t0aNuY53hGn9NMReFt1aw0o=;
        b=cRMEKs+EvIxDSTnX4Pxu63YUJVx936jfncdnST+d4XiBu0M6AGZfkD3dXww+iM43Jq
         /9llE34sC/c7SwMLgakL446wRCJWOmg2WtX/i2RzGQkf4wldsiabmEMgGk3nKt54dAAA
         pp/LTcDPzUVOVuHhkxJXgzmNi0En/Chv6jApZ8EYXOiamGv6NvSuO+XtVRh0bczuVnpF
         NSbuznn0XDVd4Bq7lT6vN+joOujkus+BB2AzbQJBKqRB4xcZLMIsuJ25sPhDLG7nKiOa
         UciWV4bc4PokmmV85zItxQpvpawKz0GQVXmmY/DL+LD3Copp8lXgbCc73JVL4mrklxqP
         RCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNX+VAXy5EEQKW4dVQA9t0aNuY53hGn9NMReFt1aw0o=;
        b=2K7vIEr1bgoaTnNPfQa+lP7wQ7xYFsHle2MwgV/GA5TYNstToZXNNhP1GkRv+2Uu5g
         nvkG3bQc+YPOn8jxbIiGRmAatrbjs/4INJr8QXGkSsRnT9avg+M5dBPIjkQd/fX9jDKz
         9zWZZ4Mf//B5UUzsajs9Hsy5jJklMsYtAvG389PzWdxD/kYFnikfa/PARYQaq8K6M+mE
         oEQ7O3q7Qz1Wh3L8PTdqycZfsS5Qlyqh6D02AQEK/g+tKgwv479V9UjcI9mekpteJeC0
         q2Af1ewSeLdpVZwFPGh4EYWpTd3Nmr3uXRtuz1yViV18CW+C1FJcAv6gx5SR5aLlZj8Y
         IO3w==
X-Gm-Message-State: ANoB5pkkNlyEHVuC4d35mndBFHRmdA1vEFUV0VsqoSwerstZQs325GVz
        MOsyVKqnwPyUUuzOZ//klmvcRw==
X-Google-Smtp-Source: AA0mqf5ZEhxi5T9vhC4MfxPti8Ii3DtWX2M7YeMErlqgqxPTMYbRCpXDU1u9kfwmHh0Qu4T8svZo0Q==
X-Received: by 2002:a05:6512:ea8:b0:4b4:f6f4:df2b with SMTP id bi40-20020a0565120ea800b004b4f6f4df2bmr580498lfb.321.1669291637677;
        Thu, 24 Nov 2022 04:07:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e9-20020ac24e09000000b004afeacffb84sm103378lfr.98.2022.11.24.04.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 04:07:17 -0800 (PST)
Message-ID: <89c266f3-9084-42de-b71d-591fe440f001@linaro.org>
Date:   Thu, 24 Nov 2022 13:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/3] dt-bindings: interconnect: Add Qualcomm SM8550
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Melody Olvera <quic_molvera@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20221124112232.1704144-1-abel.vesa@linaro.org>
 <20221124112232.1704144-3-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124112232.1704144-3-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/11/2022 12:22, Abel Vesa wrote:
> The Qualcomm SM8550 SoC has several bus fabrics that could be
> controlled and tuned dynamically according to the bandwidth demand
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../dt-bindings/interconnect/qcom,sm8550.h    | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/qcom,sm8550.h

I missed that last time:

Filename matching compatible/bindings file, so:
qcom,sm8550-rpmh.yaml

> 


This should have stayed part of your previous patch. The headers are
part of bindings, so squash it.

Best regards,
Krzysztof

