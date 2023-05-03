Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623286F59DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 16:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjECOWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 10:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjECOWX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 10:22:23 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269AB6A5E
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 07:21:39 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-957dbae98b4so804553466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 May 2023 07:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683123697; x=1685715697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lzdjV/4bMtyVt1PeABwaOGv1DR6tlUBhJyB7WC8q1p4=;
        b=yRiQg4SWJBBZfQq3m+31aOzgf7pgQFyxiWn816TYBvVTYnz5B7L75W4L3zlJTO2lPC
         0AEHi28Gav8byNz0QqXOSIamnXDaNGXdaF8YATuALLimFq8rE7w9qsHpOiKJW+Moi+Aq
         ZzvVU0VN/vvLR5e1RTMO5uXnxVPoEB8HYAHQMYo3Mct2V7Z/vBTwIKISOEF2jCNO29jZ
         qG7gtUMe90FJB3tScWrSycDKuw0qLMab4DaS/PGmxhbJftt+99YWkkL57C3TySvM1lDH
         9S7zR4oee2NXutOMaLA8I9Yo80H1pXR/PLWWrtgV6AnkFujzRccSP6gZ2nYmJB/FqVDK
         FgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683123697; x=1685715697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzdjV/4bMtyVt1PeABwaOGv1DR6tlUBhJyB7WC8q1p4=;
        b=lHoCwreUD2euwKHXImXtxxJsM5L9G7SsMeyiQivY7OwwX9xVuS+pq06CAeBoz0RE4B
         PVoE8g96zd6K/3hsp7MwwRRSnZqsrAzWXN7cNeBMvI09O3UF5hK5kFxfEUWko2zyT6+R
         abCMQMl6uDHpuADdV3xu6FgqlfDJNXGASTQWY7EIHzGjKDVOSfnn8XfnDLrAkMi3VAew
         XjSt2vCToynbS8sk6YlT6KE78x3WbakgprWv00IS3X7B06+Tphj9NMQbZn+kVxn+uLRK
         JEUPPCn9YNrei6MnnwXE1bgkG1OcQR0dad6iQw5XHW0Hgf50+2z8sS33hx/DDqKONyhP
         Q+qw==
X-Gm-Message-State: AC+VfDySzzaytpJEU6YevMj/c7WrDOJzlYWmencRbOunb54hYxp4G69R
        yLGIqehauHW23Yr1FXvmqo+e5w==
X-Google-Smtp-Source: ACHHUZ7OMV+/YFFDrmBbCUqyIrcUkJW65lWjdVYy26UE6bXCeI+shOTAWi6MXVnQVuwRE7VHAiWwng==
X-Received: by 2002:a17:906:c152:b0:94a:845c:3529 with SMTP id dp18-20020a170906c15200b0094a845c3529mr3630276ejc.9.1683123697401;
        Wed, 03 May 2023 07:21:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:db42:e3d0:c55a:8cf1? ([2a02:810d:15c0:828:db42:e3d0:c55a:8cf1])
        by smtp.gmail.com with ESMTPSA id e5-20020a170906844500b0095fd0462695sm8759304ejy.5.2023.05.03.07.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 07:21:36 -0700 (PDT)
Message-ID: <7dd7980c-7616-9919-0ec1-8be91c400bfb@linaro.org>
Date:   Wed, 3 May 2023 16:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: pmk8550: add reboot-mode node using
 sdam_2 nvmem
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230503-topic-sm8450-upstream-reboot-reason-v1-0-c5ac3dd5b49f@linaro.org>
 <20230503-topic-sm8450-upstream-reboot-reason-v1-2-c5ac3dd5b49f@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230503-topic-sm8450-upstream-reboot-reason-v1-2-c5ac3dd5b49f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2023 16:13, Neil Armstrong wrote:
> Introduce sdam_2 node, which is to be used via nvmem for power on
> reasons during reboot. Add supported PoN reasons supported via sdam_2
> node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Tested on QRD8550

Best regards,
Krzysztof

