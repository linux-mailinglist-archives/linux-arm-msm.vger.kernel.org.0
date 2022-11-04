Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F335619FC6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 19:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbiKDSZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 14:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbiKDSZU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 14:25:20 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC0862D4
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 11:25:18 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id hh9so3504662qtb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5myViM0Mbitalv+h2W7ojA0wizSVLia8tVgqtAEEIiw=;
        b=oKRjd8lrK6oMYPvCsr2LpKxSu5PF/taXDK7+ZPdTF9B8zpUJsNB0mOdg2ogGJivAoS
         pf0pNumTk+d7QaG1ExL3TE6PzurNyc2COM6PLB08mdfNm/l4rXRneHFhYQ+jp04zRWzr
         +qGp/IUBPFYZkh+oxBmGyouBzGB+/4V6yi7w+cT8z2z00oXp3wwrif+pTbKiwcwQekyb
         nD4fz5DTvvL2UX+tvuSrFDkX9sgwkHoaETmx1QeguaJ0Zi5349UyaqlNlbiJQt0UQI7d
         MCPEELZCn8LsMxqehO8G02+XJ856dfh0EN438iD8GoNyp/5H6ROfkOvLiNNzIIEp9GCB
         9DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5myViM0Mbitalv+h2W7ojA0wizSVLia8tVgqtAEEIiw=;
        b=2+tf7z2qRxj+oN3iP7DOi/XJpYPYlixzsiIhwGTh4NjtnKuiIFX3HQFqW6BPxR4Pr+
         GirI4QRVkh/hALvr1x+ycHRLKRnyC6/jrNwY++CgadWdJDkVcYO8l/LsUFrqrNi++j6f
         /lxhKl/nY+msteQMuV7KAPQp5seBQ+KKW2ysB4+dphWE91dZEvbyRcf8XGX7GnYo4/JN
         AxNGfJDWv7xOnICCQqDiF1J+8X8WZUZMXENk8lXUZb4oA+Z4dXxBfNx3A62y9/MgQsOx
         1b8Rn16mzQ75XZdNhnaBrxlFmIQUvE0hRzMqHzaJY5gsgoYw7KtkxIsI+MY4v7JTs3oL
         GilQ==
X-Gm-Message-State: ACrzQf2UrOdBeEAb3OmlPTrZbDDuEM+wArkTCYmqcNqqD/3Hd+BClhYP
        XhSAnvryEH+4vJDzHMJBdKI0hQ==
X-Google-Smtp-Source: AMsMyM5Jst7+ITulPoeWgI+1S4r6/paD+1w9tohGl9CkbWnIIpM/XKJ/YTYcFauWcikgNphrIaW/6Q==
X-Received: by 2002:ac8:71c7:0:b0:3a5:4cb1:7baa with SMTP id i7-20020ac871c7000000b003a54cb17baamr10801563qtp.303.1667586317782;
        Fri, 04 Nov 2022 11:25:17 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id k11-20020a05620a0b8b00b006fa0d98a037sm3210386qkh.87.2022.11.04.11.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 11:25:17 -0700 (PDT)
Message-ID: <5bafce51-5f03-499c-65d4-3040cfc03ed9@linaro.org>
Date:   Fri, 4 Nov 2022 14:25:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] dt-bindings: iio: qcom-spmi-vadc: Add definitions for
 USB DP/DM VADCs
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        lee@kernel.org, ulf.hansson@linaro.org,
        srinivas.kandagatla@linaro.org, jic23@kernel.org, lars@metafoo.de,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-hardening@vger.kernel.org, marijn.suijten@somainline.org,
        kernel@collabora.com, luca@z3ntu.xyz, a39.skl@gmail.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
References: <20221104172122.252761-1-angelogioacchino.delregno@collabora.com>
 <20221104172122.252761-2-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104172122.252761-2-angelogioacchino.delregno@collabora.com>
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

On 04/11/2022 13:21, AngeloGioacchino Del Regno wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Some SoCs do have a USB DP/DM ADC at 0x43, 0x44.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

