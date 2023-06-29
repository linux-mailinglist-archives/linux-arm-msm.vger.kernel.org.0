Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B38742450
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 12:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjF2KwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 06:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbjF2Kv2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 06:51:28 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940A92134
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 03:50:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f122ff663eso810953e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688035839; x=1690627839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guJGAnCCFO9fo+Q+lePAT4AatbNAwA3TFffGx0GvU2g=;
        b=FeYShU0DV1r0J9WSZmSnq9d2EoVzRoh5p49t+fWb/LGP8ECl+Gy3WSNWdZtVUJHBQv
         zqvtPfCyWiu7RTS6UJyBI4599ar9DmtwSdu/7fh/Vjtucc2wp5m5eXsuNeE5WuX1CAkp
         Ayx2t3b56TRAucWstatE2y1GNO2zkjRXci5Zb3ts9pP9lbOr+CgDBRCOkg5Jto9t9f30
         ftp5lkYdIuSlxkZLePjjCDcrrCm3LOSHoT46eKUjr+fpJfk1aIL33uCMTgNrWd3D1Kye
         jNWN84Kg2J44iAJuyMeLJenjkPuPXNv8JiBsCHnxwWciS/nIa3Db2EawhD3a8rQaStyv
         jx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688035839; x=1690627839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guJGAnCCFO9fo+Q+lePAT4AatbNAwA3TFffGx0GvU2g=;
        b=aBPxXDXF2KXB7QT5qbWRgVLk5VQPsOVZd5AYGrBD/rf0AmKwIDLVMCeehSg/2lL04h
         HD8ZQyQpsW056+wDvJPBU1LEWskKNH4N8f+HwTWkHx35jW+Dn89v2Lx0XcUI6zGvT1dl
         BOAxe0foD5C7NlmeJAYFusB3N3c3KPXRY3fTp6pyktEnhmxWQ5ydaa+pG2LhFkhBIJa9
         QxWD/aTD2yG7JtNLv+YaqSSVJqE2ty/pnNiSGCuxfvGF97JaZQoY5hhs6/qK7fZsGlE6
         cWv2q3B3oX5bnWWSr5RzBddtB9/1Kim0TMqLQiHQMQSXsezpENvZpF/5HpTIkTp8uPyM
         sEUA==
X-Gm-Message-State: AC+VfDwwtpbPQa0UY+oVacbh1dpKHgac5m3ExA4K2plIm68219mDcfEf
        Eu7XX8infDjcBy3vBoQTt8u29g==
X-Google-Smtp-Source: ACHHUZ5r4m7KdWWjT77yGYOUnmn6vM0l13dgN6t/mdKe0fnH9Xe8pYvpvGlo4fSP5Eyx3hzgL0RLSg==
X-Received: by 2002:a05:6512:6f:b0:4fb:8987:734e with SMTP id i15-20020a056512006f00b004fb8987734emr4131316lfo.68.1688035838866;
        Thu, 29 Jun 2023 03:50:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v15-20020ac2592f000000b004ec6252aa37sm2297812lfi.116.2023.06.29.03.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 03:50:38 -0700 (PDT)
Message-ID: <0682f82e-0ca8-29c7-0ee6-e2438122bf5c@linaro.org>
Date:   Thu, 29 Jun 2023 13:50:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/15] dt-bindings: display/msm: dsi-controller-main:
 Document SM6125
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
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-5-03e430a2078c@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-5-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/06/2023 23:14, Marijn Suijten wrote:
> Document general compatibility of the DSI controller on SM6125.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

