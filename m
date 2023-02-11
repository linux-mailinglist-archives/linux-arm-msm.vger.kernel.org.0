Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA4A693227
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 16:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjBKPxu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 10:53:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBKPxt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 10:53:49 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C5E2940A
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 07:53:47 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id ud5so22578791ejc.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 07:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKZqBgVqI4hZV+NJ0GWGGIXdTylFyIHNhCHPHXw7djg=;
        b=EWTdEm8mpW0BRVkPX5dSRP0f9YcZmoGBVd5+gsFU3HS2MvT7Moy+skrgVpOEdX+CAe
         8BzELHOTdCTbgTtCgDcojDsByW/0sYhE6K20LWMcm5HpWM0YnY/wiktmPslbbYITe3W4
         1L0k9cPUdQYLHBjMVK79jsqNozZaJZroBvp0nKTbOJj2Uj1+Gc3E5Y3rr3dXUivLn/A+
         8AVDOKQknurlpGaQ4nOrgizjSilAnxqOpLNsgRSr0cMjBguaU2B9ydw3/5SpQXlfNnES
         P3b/umegQ0HkD0mmO8XBVmpw3r1SaqYJCKMMRXLj85Ej5K3vta0R93jR8S3G3xNiyIuU
         zbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKZqBgVqI4hZV+NJ0GWGGIXdTylFyIHNhCHPHXw7djg=;
        b=bdn3hjA6Ei9M99F0rk/VuFROEuYfFeLTReeeMxblWfm2YgAkLM1u2XIo8yqCIu+yY0
         KgPjNeaLZcrs+GDmZzG9qmEaN/A9tLBlOdJXjLb5kkSkL8u2Bzt2FhSmPnVHIfI+mtdT
         FK7oRsHv+auukhgjt8yuXJrQKxWwgu5U5TI4phIrJMR2We901ri9W98f/GJBQbbxG1i/
         8h0jIlaunoAf3w+mZPoKjazkQbEANxfoGD7Sh8q68IEkQRhZ4cuNpB4/P1F94OmNNT6T
         qx9kZxIcSleHkUsi+YRTZnsgHSbpMNytu1/8GQe5u/0/O/GBKiPdJ/1btXpqWJ4ST+FQ
         CfeQ==
X-Gm-Message-State: AO0yUKX62fqLNy54AEmLS6BRxdP4sax97s4dglJ3OTuXbhN+/cTh1Wvq
        s3ES+eeEi3ppafpitU95+eiZtA==
X-Google-Smtp-Source: AK7set9FO7zB2GUeBRC4Ham7KNZJwN9kCt+a12XisjpCuhDH33RtTaoh6qneKat85u/e1+crcLlc8w==
X-Received: by 2002:a17:907:7e98:b0:872:6bd0:d2b with SMTP id qb24-20020a1709077e9800b008726bd00d2bmr25894167ejc.45.1676130826621;
        Sat, 11 Feb 2023 07:53:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 25-20020a508759000000b004aac33c1f4fsm3893134edv.14.2023.02.11.07.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 07:53:46 -0800 (PST)
Message-ID: <ed8807da-b0b2-b652-e0eb-937aec916749@linaro.org>
Date:   Sat, 11 Feb 2023 17:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/10] drm/msm/dsi: Remove custom DSI config handling
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
 <20230211115110.1462920-9-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211115110.1462920-9-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/02/2023 13:51, Konrad Dybcio wrote:
> Now that the only user is handled by common code, remove the option to
> specify custom handlers through match data.
> 
> This is effectively a revert of commit:
> 5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi.c      | 4 ++--
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ----
>   2 files changed, 2 insertions(+), 6 deletions(-)
-- 
With best wishes
Dmitry

