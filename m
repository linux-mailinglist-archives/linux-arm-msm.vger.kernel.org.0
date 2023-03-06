Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 008A26AB680
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 07:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjCFGpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 01:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjCFGpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 01:45:32 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97901D931
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Mar 2023 22:45:31 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id j11so14616421edq.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Mar 2023 22:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678085130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KevYO5t6jLgZvZMbsQgzW97smMok9qIMDZkmRufforU=;
        b=vKLzIipoFaTe1xeOjDjFunYqVlxxcwAj0AL/+EGV/CENltwOmAjTB+DdEp02nR+tuf
         BtMR6iHvigW1MCYHDFTJs38pJtITQ9QIuen/B3eLv2Hb9kivEpBFZLY8XLBrkWNXCzqv
         jDIvfGD6AiBHOIMRtql3Koi1BlaNwtW3yvF77DZogN21RNjUqtxlZpLzC2Ly34Egf3/B
         QPJp/XoMinLmqshpe25UUam07jjDngPUFKFFFamsjTBA9kuNWXffYpjAHO5n+VxSSIAh
         1kqJSWzQekjUmJpGnirawsoHdTCkB+uCNPJd8k0BZ9lDBwo6zKl3jZboooxmo9JjuaaG
         cO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678085130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KevYO5t6jLgZvZMbsQgzW97smMok9qIMDZkmRufforU=;
        b=mWclnlS2YBQVVm0Fs+ovIHb9ulHR+/T3c105I3ArlOWo0K8gzVJcE+3F3kmX/yvQb3
         jmLqby6ke17jtnn+GmlejaO8fYyiYZaeqSUkug0Jrn0SoDmZ7vT7++nUDmJo2vaDqUWs
         N7J6GvL58wor0Wi30uZQWPOLNYSkYPqlrWC6BTzK0W858OWCVGLJK8Qbuio0z8nIBTrG
         b3R1BPymcoHrFpQGkiZ26IbX7tzYQWFbplAb+zzkdnpbCAwzs6U/+/QxL7x4I/QLbAmN
         XHSXwOw+saiHBLFc08BQ5fFvl5ORVrabIGgpSh4rSHVSsxvUjHrTK7VCiRTM2+TWafwD
         cqXA==
X-Gm-Message-State: AO0yUKUaWPJ0bL4dP+9k+f3Fj6VERgAP6/uwU4/lzwhpRXxAWVeJB6ub
        EfKyF5OsjHq5h6KOg/q6ak006w==
X-Google-Smtp-Source: AK7set8qYn3twDQbbs11TJYzkV/ubceSKwRbH7EChpg83+SjH4CZQjqOQmMQsowcTxRsXzDQjQa8Ag==
X-Received: by 2002:a17:906:2a58:b0:8b1:2614:fbf2 with SMTP id k24-20020a1709062a5800b008b12614fbf2mr10009282eje.70.1678085130240;
        Sun, 05 Mar 2023 22:45:30 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:d85d:5a4b:9830:fcfe? ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id h30-20020a50cdde000000b004c10b4f9ebesm4616002edj.15.2023.03.05.22.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 22:45:29 -0800 (PST)
Message-ID: <889d79fe-81cc-f944-a448-abc5e62c9fe9@linaro.org>
Date:   Mon, 6 Mar 2023 07:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add Soc ID for SM7150
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, David Wronek <davidwronek@gmail.com>
References: <20230305191745.386862-1-danila@jiaxyga.com>
 <20230305191745.386862-2-danila@jiaxyga.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230305191745.386862-2-danila@jiaxyga.com>
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

On 05/03/2023 20:17, Danila Tikhonov wrote:
> From: David Wronek <davidwronek@gmail.com>
> 
> Add the ID for the Qualcomm SM7150 SoC.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

