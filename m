Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E463619A26
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 15:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232067AbiKDOgQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 10:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbiKDOfr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 10:35:47 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844E73137D
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 07:32:59 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id u7so3275220qvn.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 07:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OeOrHPnEU5cox0eqwYtdlY9TT4wnzhynjogUJRsWZ7o=;
        b=w/ARTFunLSDiyxRHSOzo6qwqLgD9x6KwLjikPcCosCa1wU2ELA2NXqsHWDw6OAZX0+
         1ZKqC91ImfY/cR+gQfcLhCT4yk1E6H5yMfDLHXp0KBUN00cqK8Vm59sAB8zGcpGH4968
         pglQtaGcq0d9DfTmU/YvyVTTbfEN0fWnSu3/q+utycA/AQI+Wc6pS7ocGeNQoU0jNcXJ
         kwJ2KB2Z6oz2+Oat5Q2+iQJ8mOU9XnJihaRX5cXfR+quWHBN9W9H+eCPt242Bld2ODGw
         YtkNJJWbjzormwNWmg/NtR250tXkhy+1cQgjWltaSPuHrt6fliBziGlezFBe8VOS17TC
         5TCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OeOrHPnEU5cox0eqwYtdlY9TT4wnzhynjogUJRsWZ7o=;
        b=7OykXoxu4V8YYU+CHH7VxSJkwAQq7vET4WEyPkFe6ZfNxjwBIlGC2j7RYSjJGa5SOT
         TmhlpvGTI/GxoTOvsi/QT/9C6LYAsV3xVlHe5dtB5y/fQAMmV771YVaxUNpuaXp1G9p7
         82yosMmD17XaVz6rWVjtAzAhLuH68O/B2ck9HbBVS/O1BVJAQ2TKIWkCq1NN5Y+M9A4b
         YMpqj1SD48K2zOqkma3tcMsmxUoB3Y26TwW1jO3ScO5cQ9oessd0169TPBNv/DkyiEI5
         d/mmhjIXt4m+YPldQR+gZ+0FS64sqwOgSAE5U/0bYkgEr0Xcaw1uta+XPTnG44Oeh8pR
         oEYg==
X-Gm-Message-State: ACrzQf0XnpND1h9I4dOK9WZoNNS4VyDKcAGVg3nDfiAF6pFapRLHvOQG
        zDYlLbwOsJNdROyow0M90AwtqPvog7AF0g==
X-Google-Smtp-Source: AMsMyM5Mv0wIYbec9tqLkuKXmCDe7J07JAYbB3fGL2UWnMWOFRvwdpyTKWWwHbksWKnADQkPdEmnQA==
X-Received: by 2002:a0c:f391:0:b0:4bb:7482:526a with SMTP id i17-20020a0cf391000000b004bb7482526amr32859051qvk.20.1667572378718;
        Fri, 04 Nov 2022 07:32:58 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id y7-20020ac87087000000b0039bfe8acff6sm2499020qto.58.2022.11.04.07.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 07:32:58 -0700 (PDT)
Message-ID: <6cdd193e-8a7a-c781-320a-8bf18f9c5c68@linaro.org>
Date:   Fri, 4 Nov 2022 10:32:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: Add bindings for Qualcomm
 Ramp Controller
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        kernel@collabora.com
References: <20221104142204.156333-1-angelogioacchino.delregno@collabora.com>
 <20221104142204.156333-2-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104142204.156333-2-angelogioacchino.delregno@collabora.com>
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

On 04/11/2022 10:22, AngeloGioacchino Del Regno wrote:
> Document bindings for the Qualcomm Ramp Controller, found on various
> legacy Qualcomm SoCs.

Subject: drop second "bindings" word. One in prefix (dt-bindings) is enough.

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

