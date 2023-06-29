Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE42742460
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 12:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbjF2Kw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 06:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbjF2KwY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 06:52:24 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2580E30EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 03:52:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6a0e36d42so6374291fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688035940; x=1690627940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ww5r6ehcjTwcaBETj8atUTtDfztCZTd5T+zbk2x5b0=;
        b=RK8XEAUhfo/4CKAgSU5yoeJ25LM/lt/RQHajNtFocyf9lgSBGTpUTD+9/2CUBq9N9M
         ZwU7wumFrZgvoX5Xel4e1Z/ObJ0wakytMCATqJ2sekp7ZYGUx54aI++Owoh21ot2Xy++
         IyRlGvMiwrlvuKNY3bqjpcyhTB2n2gGKhxyDYUwOpQohM3+0xcLsDkRRmrZbydDMDZYE
         qWWZCBVP+vMrGhbin0ZQ1+3C7hxx1t9uuyNN90nIpl9R1u4MaqtqjknuVNOk7E+Olpia
         ZKeDNXT/UExnmuxQd67OCp3ihnRy+MG1RXOZaG2ZtIitd5mDrcnMK7xX0/2H5DiMS7T9
         ch6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688035940; x=1690627940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ww5r6ehcjTwcaBETj8atUTtDfztCZTd5T+zbk2x5b0=;
        b=EIU2LlxrL8nyFr21rdtcPnU7gTVPN9rlJ/OJgO2N1Bo9zVjzcuvg85fAQ54MU84d2L
         98VAMl0b0vIUCxHx5yAhafezrLW2nBkJYtwesExmLv3XNMYH0hhH7xaOOEFZ5L27MKxz
         ysN+sxdAOtkq6lqhaOf8nM/Gb7uUxuPZZU3jQdBbJaseSJJQnAyFBINWjPHxIZXfgSzt
         +4Qu3+p01fXfTy5qkBaSUoWEKGtAiDttsPMuVVzq7h2iFEtwUUexh9QbflIsN98xq9G4
         zZmSqZP7jIYWEeEXtOl3mmBHfPXvmqnIizgZO8vhjQfPwpT0Sd8BUevYJZbIZUEf0naz
         kVrQ==
X-Gm-Message-State: AC+VfDzpu27ySAeOm7U+W4fevfmxsLJIzS5sl93CWA19xSaM+1yus+on
        b8nagi/GorhbCVRM8aHAnhdJwg==
X-Google-Smtp-Source: ACHHUZ5/uLH0p626QLEMqtTMX6NRz6Qh5Jj3UWxEK1I0C3SvsxOzlED7EitXGpxRj73sD4YnV05uJg==
X-Received: by 2002:a19:e05a:0:b0:4f9:56b8:45e5 with SMTP id g26-20020a19e05a000000b004f956b845e5mr1386133lfj.25.1688035940348;
        Thu, 29 Jun 2023 03:52:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x28-20020ac259dc000000b004fb9d7b9914sm136870lfn.185.2023.06.29.03.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 03:52:19 -0700 (PDT)
Message-ID: <8b3d708d-58d2-60ff-7acf-8c1eac7d8dc5@linaro.org>
Date:   Thu, 29 Jun 2023 13:52:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 08/15] drm/msm/dpu: Add SM6125 support
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-8-03e430a2078c@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-8-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/06/2023 23:14, Marijn Suijten wrote:
> Add definitions for the display hardware used on the Qualcomm SM6125
> platform.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 230 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   4 files changed, 238 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

