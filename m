Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B1164653F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 00:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbiLGXk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 18:40:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiLGXkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 18:40:13 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401B58AAFD
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 15:40:12 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id bn5so22678225ljb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 15:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRIjdXMU+hROafjnkjje/sfB4GvhGqvX1pIwmIMOYUk=;
        b=dPjPWHoCRIzQn0lG6TQAzVpxAbwzqRKkircLaLGcGR3KSwbVfY+ncjEM5MjE1khSwC
         FUV+pA/AIVQrxDZhzfOqHsiDQo0IASpAFwtIbINKn3aukCKlXj8XZhVuAMQWdE0jMPDX
         dL3PM56uyqi+iPYCNNgerbwg955OPX3IV4hsSTR9PZwuFuZvtaBktFXDZZ9BYWz53SMr
         tkhUB6LYG/btRHDH+pOvMPyHQGhq834CJRQBBU/Cid0AujIVPstRVYP0GLTKehMrml8d
         Fq5TshjJ8MsBjAB3lZm+cfzLPl0kjo2jh9P+R3ozjdXM7byXWbbcbtpP4u6RgHCrFTr0
         MQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRIjdXMU+hROafjnkjje/sfB4GvhGqvX1pIwmIMOYUk=;
        b=UWRNczi7jzAl+7ekjvjL5Kx5iOh6jLSIv4nVZXOSqEf5ea2cSSqbCkM/yth4qabM28
         SMZURDZ4i+t4dtN+XlF9QgFYvwupCUlPofFu1f5j2Hhw6IFn15lG6UwOQaUwSb0T7Sa0
         3dQYsK2mX5zOCBhCW7E95IeRd9OyAIwLyt0hGBUCpakTswdqUjkuzpelP97sAdtnbxUR
         P0xBz/OB6kZr6N4+o0d7TMAbVxTQ4bodaTijkRBFhsgFZG73ioB/tez1vouL4qBoR3ak
         upwTlYvl1AMnh+5Y88YZtEgTWKe1yuMoZtd6RYBQFqLzqMquwcbqvWKmEK5csgaHfVZC
         IFgw==
X-Gm-Message-State: ANoB5pn8RUJL0xE5RHBhkbRLPBijw6e2WZENO4/Trtx3NcckP5lgR9Pt
        zoD3i2gXjsPJ5QuxV8+q631yDw==
X-Google-Smtp-Source: AA0mqf5iKdnHu+jtm6Nr4bgVmFnKseN07NPJyrAwVWJGzXVOiMrlJzGxcHf1l6Gy4PZqkTPotl6qFg==
X-Received: by 2002:a05:651c:b26:b0:277:9847:286a with SMTP id b38-20020a05651c0b2600b002779847286amr22932017ljr.309.1670456410638;
        Wed, 07 Dec 2022 15:40:10 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j21-20020ac253b5000000b0049c29292250sm3030149lfh.149.2022.12.07.15.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 15:40:10 -0800 (PST)
Message-ID: <bf820a39-2c04-67b1-1275-71b465e53055@linaro.org>
Date:   Thu, 8 Dec 2022 01:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 04/11] drm/msm/dpu: Add support for SM8350
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-5-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221205163754.221139-5-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/12/2022 18:37, Robert Foss wrote:
> Add compatibles string, "qcom,sm8350-dpu", for the display processing unit
> used on Qualcomm SM8350 platform.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

