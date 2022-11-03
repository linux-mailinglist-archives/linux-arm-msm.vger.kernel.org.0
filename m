Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665BF617E85
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 14:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiKCN5j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 09:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiKCN5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 09:57:39 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0366E14D3A
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 06:57:38 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id fz10so1239389qtb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/kbu/rTJsotk1T/v0yErGccpI1lWEa56+Z8vRnAew8=;
        b=HML+OCBooh2H/+sBWodDoJfpV2vNjt8LpB7Ey/4FeHJuM9yFcAMU8cZqgrFZehOO4j
         Ug0W9MVn6AJqbM9VOoD/Ne//K9ZvGX9vWjmSuXOi8QngNqgZ0vBdHV0f12QGgiZj18yN
         YLSOWKk+oh1ueg2tKHqHZtnMdm0XjZvFOfQCBIpcoexe+Qi8RM42x837At2Sw1RhkYBC
         wWOqp60M+Ruqi8zGsSM0uGjTHEKPhapnbZ6q9IzVJfXoGc/JXfMgEozD7ZZgnIJLnbRG
         QAslBpU8a+ypCl6hi4+/8+KC9HUoO1nH1iFqtn0ffs1V6hMPoEGAkvzlkwTTyDxoGUZA
         wbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/kbu/rTJsotk1T/v0yErGccpI1lWEa56+Z8vRnAew8=;
        b=Cc+tvThHyqnKKw+hbeNl7ast+X32BBJ12zuxl/ITEAMldpn4q5SAbmShY7j9m605Iy
         xQMARi3WmA14DTvoR+J3ETbxQ6idWADfsXJtDNt8pGt5I0MjQdU5uXGFosI62fxFUU/c
         58ATVBVVPckjZt5TVyo0MCcS+1l2AAX7TCLlEPrRgQI0zdHZbGqBF399nZ2UumJxtW+4
         ic9jRGwA1iCQ1qCcIQcUpGhjdyh+tZbC0Qvb3Vd1rikJ7wYjJZZCMYDtnN8aPtVW9oeh
         chjujf0Y3HtCU0HGJ/e2hpxW/zRwIpnfYhk2efPbqIm1PAEsvrd1slPvqiN1UX0+4Vlg
         ijYQ==
X-Gm-Message-State: ACrzQf05O8bozA84+aBZ7pr7jw4D1mxhe5QvwLDnOcVNO5vH+uuriR08
        p8jOYfR0WU0JoRSnC3pOFtSgXQ==
X-Google-Smtp-Source: AMsMyM5S6KwJzpv2ZmHdDmyclRvj2EtvS6U90ilW1CUAkEh5dEIS3Zo6SMhfCQVOBz+TbcN+eME67Q==
X-Received: by 2002:ac8:6c9:0:b0:3a5:4109:b6a6 with SMTP id j9-20020ac806c9000000b003a54109b6a6mr10053786qth.648.1667483857178;
        Thu, 03 Nov 2022 06:57:37 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id h8-20020ac85148000000b003a50b501a01sm534826qtn.87.2022.11.03.06.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 06:57:36 -0700 (PDT)
Message-ID: <aa116367-9cc8-7888-84b6-d5f7814554c9@linaro.org>
Date:   Thu, 3 Nov 2022 09:57:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm/dsi-controller-main:
 allow defining opp-table
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102231309.583587-2-dmitry.baryshkov@linaro.org>
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

On 02/11/2022 19:13, Dmitry Baryshkov wrote:
> Allow defining DSI OPP table inside the DSI controller node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

