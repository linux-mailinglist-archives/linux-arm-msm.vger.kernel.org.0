Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194F451F5B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 09:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiEIHlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 03:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236352AbiEIHUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 03:20:09 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CAB388E
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 00:16:05 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id n10so24990483ejk.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 00:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=/q4d3OHrZvdq1tcu5svJ1FaMMKQIyrlKNH4TSyE5QtM=;
        b=mlL24byEHKNHhJD39spMy4tFbcQfcy8DCRoyWl+71T77EMUcEHWqYdlEHlmfA1IIkI
         ctwfNOdUTwHff30O3qav9Rlkcklgh2WdsOwicVaTOL2foZ7anYprqmnmNFjPH3fbi83f
         vVOncC1zPkceGlm6AmQ4bQMeqe+upmwsKelJBX4mls2c0h5p1kdRu9cZTTgma1KMUr2s
         aGr4vxSSb/BCNWDZG5z5z+Rm6KjozlnM23Z23ghY84QEOiwQUMZTQglnfWkmukjjlyTX
         TOvOzy2sOnLP5SIew4eWkX/oe6XjLxHVk5JLpgvMuDCdbqMt2p6ujPh24bbx0azI4aAI
         tTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/q4d3OHrZvdq1tcu5svJ1FaMMKQIyrlKNH4TSyE5QtM=;
        b=tZ6T6UGdHfyXzWKhKKM/g/x5UDe/TFO99PA6smYd46OCMn0QmhFj3iFmYfIXc1tHRZ
         fO1ueOu8WK/fXa2/4UGNDLHPX4SvBt036veatQ98HChf+CcgYxZsJ0oW0uNbGNiVzyZz
         QG5PSjqcB4VoZl85yaPYs1nYh15CosE0qVOu4hgpM5KapJHdG1xjWsX9h+dVx3IVWR5c
         xA1YflNUQiA4L8l1aFMicvTkNb+dw0ci5CPLKInoUtdLOfG0VtqzajSYy7d4QmPQq96b
         0JxeRMAasCbqNlcv6ZDwN1W+qAHJ4CQI972uWIsbK8t3mA7PXwYD7AAMQoPfUFQ/NGFT
         pT+g==
X-Gm-Message-State: AOAM533wQ7FL0jbSFTJs/7N3hsz14dyEykpF/v4h1xTeCA8lxP/nv7iR
        GCuYYLeH7PDNBhshczv+Cmp0qg==
X-Google-Smtp-Source: ABdhPJx11KaoIOBoxzezk7OjBrcz0m+M7R7hALB4LLuEiqyNltMkiAXGFjD3aRSGOCHjRpGmCIX/vQ==
X-Received: by 2002:a17:906:2a19:b0:6fa:7525:45d8 with SMTP id j25-20020a1709062a1900b006fa752545d8mr3201491eje.768.1652080554493;
        Mon, 09 May 2022 00:15:54 -0700 (PDT)
Received: from [192.168.0.242] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y1-20020a50eb01000000b0042617ba6392sm5845956edp.28.2022.05.09.00.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 00:15:53 -0700 (PDT)
Message-ID: <703ef9c7-40b2-6b57-82de-c66c2a1e8268@linaro.org>
Date:   Mon, 9 May 2022 09:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 08/11] dt-bindings: clock: qcom: ipq8074: add USB GDSCs
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, bjorn.andersson@linaro.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tdas@codeaurora.org, absahu@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220507202948.397271-1-robimarko@gmail.com>
 <20220507202948.397271-8-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220507202948.397271-8-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/05/2022 22:29, Robert Marko wrote:
> Add bindings for the USB GDSCs found in IPQ8074 GCC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h | 3 +++
>  1 file changed, 3 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
