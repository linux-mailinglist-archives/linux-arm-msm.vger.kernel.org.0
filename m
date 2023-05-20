Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBC270ABAF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 01:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjETX42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 19:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjETX41 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 19:56:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6003EC6
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 16:56:26 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso5176618e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 16:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684626984; x=1687218984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wb9lShLun3nEYAnIYIuQSine2uABBggnzlUt4NwznXc=;
        b=X7ODzssp+Ebd3+AXexFXMAEBSat3KKmyTDgj8UChyPwVvM5JiUZl1uSkw9J7oOHc1C
         pfOK/2UUI7rAh1theRKuzCWuAbJlS/Noqh3bxgzQAMbEuagqVgDPCkMJnPtECO+eY6UX
         Z/Xl3/1DGIQ5eWKJatj79Y1MZOAbSj1huONMlWLdYuqZmeC2O08oqB1ZksYopye1e/Dm
         kKwtnoXQ05PnOftUioxOcZAzP7OYA8Yy/2qgv7DxJmfrrfSav6dw7Ev8uEiI36Y+ysni
         PydxkHaP1FUa/5HiK+zfC4B9w5xYGXhFWS30Hslu3/rR5yAOx8HuLaiQTXPW6Nw/Ak/V
         v4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684626984; x=1687218984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wb9lShLun3nEYAnIYIuQSine2uABBggnzlUt4NwznXc=;
        b=GwqAPaJDItYDkyizl2Gf18+/IDnb/pP/5h/wsXvQfKk5R50c2XApcBhA3iYt4Y0Vr3
         tk+qlreb0jstz+Vc/NETtlte++wk/QxUMettWHuw2qDeZOc9o9W9+u1mQEzjueoZqdpq
         2xxAp9TU2LdWNkVHpTDFSYuOiLBdNDFj4XaUMtjr6d80qN75ftpbZPjqDOmynGbt8T/1
         t1YJ7VfPY0he5c4/Yy8X2wSU6Qe8ZbbY8LZEaTp1gprL7ckw5EtbsG1hJrFjHpw3O1Ja
         Aj5AVCgOa2BjqRHEjqs6Mq89ryULSnqCR+PvujoEvIYZiHYFR3xoWp4Y131mrL2aKM0R
         isgA==
X-Gm-Message-State: AC+VfDxEzO1DtdXBU5rUgcZdg0eIKfmRvmdoVL5JBk1pyToAql5iixOQ
        sUZ4VYeF0HJTmDh1oSty2GWh2g==
X-Google-Smtp-Source: ACHHUZ40fx2kgmpNmOHZxxIAKGj4pcPOVS5P5WN9Hm44MI9cAhLdztufK9WoNS7Db2sKdYt2np7qoA==
X-Received: by 2002:ac2:5a02:0:b0:4ea:fabb:4db1 with SMTP id q2-20020ac25a02000000b004eafabb4db1mr1992492lfn.1.1684626984590;
        Sat, 20 May 2023 16:56:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f23-20020ac251b7000000b004f3b264ad16sm419874lfk.95.2023.05.20.16.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 May 2023 16:56:23 -0700 (PDT)
Message-ID: <dcd02712-fdf0-9019-bb54-1032fa8ee3dd@linaro.org>
Date:   Sun, 21 May 2023 02:56:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 31/53] drm/msm: Convert to platform remove callback
 returning void
Content-Language: en-GB
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Johan Hovold <johan+linaro@kernel.org>, Joel@pengutronix.de,
        Fernandes@pengutronix.de, Stephen Boyd <swboyd@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Liu Shixin <liushixin2@huawei.com>,
        Douglas Anderson <dianders@chromium.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel@pengutronix.de
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-32-u.kleine-koenig@pengutronix.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230507162616.1368908-32-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/05/2023 19:25, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert the msm drm drivers from always returning zero in the
> remove callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 6 ++----
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c   | 6 ++----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 5 ++---
>   drivers/gpu/drm/msm/dp/dp_display.c        | 6 ++----
>   drivers/gpu/drm/msm/dsi/dsi.c              | 6 ++----
>   drivers/gpu/drm/msm/hdmi/hdmi.c            | 6 ++----
>   drivers/gpu/drm/msm/hdmi/hdmi_phy.c        | 6 ++----
>   drivers/gpu/drm/msm/msm_drv.c              | 6 ++----
>   drivers/gpu/drm/msm/msm_mdss.c             | 6 ++----
>   10 files changed, 20 insertions(+), 38 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

