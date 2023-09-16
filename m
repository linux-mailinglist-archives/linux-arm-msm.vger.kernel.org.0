Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEF97A2C09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Sep 2023 02:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238117AbjIPAcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 20:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238467AbjIPAcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 20:32:02 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09834E46
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 17:31:09 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a88ef953adso1718634b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 17:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694824268; x=1695429068; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wp9G9s9DRH28HBBlorzfOU/YKDu6BHZ8nl53NHfF+6U=;
        b=fPHTrDFQ9T5JiURp8ToVxhU+mInfJ3UurKHeGsicMzsg8l5zoqI5SMEvQuO7dTLNlK
         Fs56EL/eVEt0XRcnaL4bk4yuHkG1wGX8FE+5WezDFDxsbMEwX92aeH7nvjAsSqcYISY7
         t5Iocen8GGESkM8RHG5zgQQhhzoZ4U4yfAQKvq6HEtSsuCSfQIuLQc5vgFw6/c1YEKwD
         kE5SmaxUQn3T+sVic060tBmW5Qwtb6UHjvPXYtM9LBp2ZLKGArmp2r3/OZeZnGr6pVC+
         nIhVXru8Meck+mAX3fLC/Tp+OkORNM231qxdl0iC01Va+eMbaqVjmkkAZlirIKtcxGZy
         TW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824268; x=1695429068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wp9G9s9DRH28HBBlorzfOU/YKDu6BHZ8nl53NHfF+6U=;
        b=wHSEpEBecwRmWttixWWt6jTsz5l1vvOb0mcJs4F0oaMudIPj6bS9TKJCiEQKjpCpb/
         VxYVyt2AnS+zUT3r09zBEGntJqFVOWD+8ITjfiUr/TEwUm9TAg8le345YXkBtKX9r3Ry
         UrKrMgcc3nCZOk8LLkj4qccXgHc25TNPAkq8FShldqc4ibHyF9d4elw6+S29M/ohaMER
         M02WP45Ei7t/R7z2Hdjba6SRAP0wKKjkSKaaWtEXoHxf1HltUtQNWIiwyuddzuviyQiR
         3nOcD/jr0Ygc3jS6bjvq7N0ae2xslicKWoTjQa2Y8yeewq6vNfS+c2bd3xZTf7dgZR4/
         ek/g==
X-Gm-Message-State: AOJu0YzFerGDgTYwOtF9lvNdCiOYviVDYqF60td+dT/NlBdWJKXbZ8AP
        Kw9UtsHKEZyS0RTnwdzc2FWyf2lHCYtnaPbkbZ/KTw==
X-Google-Smtp-Source: AGHT+IGM/5enZcjBhS6KYMkOeT141L6ZhN7mMaxpgFhmwQ/mJpnnizdzjkJxQtWVJhtldV6e0+vYCRheZ7GEycJUPHo=
X-Received: by 2002:a05:6808:309b:b0:3ab:8295:f2f1 with SMTP id
 bl27-20020a056808309b00b003ab8295f2f1mr4125798oib.45.1694824268304; Fri, 15
 Sep 2023 17:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230915204426.19011-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230915204426.19011-1-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 16 Sep 2023 03:30:57 +0300
Message-ID: <CAA8EJpqfvmUiOvwE0PE_pWMt7MHTdNeSo1nCA5xG5ykp4Ln6NQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dsi: skip the wait for video mode done if not applicable
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Hai Li <hali@codeaurora.org>,
        dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        quic_parellan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Sept 2023 at 23:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dsi_wait4video_done() API waits for the DSI video mode engine to
> become idle so that we can transmit the DCS commands in the
> beginning of BLLP. However, with the current sequence, the MDP
> timing engine is turned on after the panel's pre_enable() callback
> which can send out the DCS commands needed to power up the panel.
>
> During those cases, this API will always timeout and print out the
> error spam leading to long bootup times and log flooding.
>
> Fix this by checking if the DSI video engine was actually busy before
> waiting for it to become idle otherwise this is a redundant wait.
>
> changes in v2:
>         - move the reg read below the video mode check
>         - minor fixes in commit text
>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/34
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>


-- 
With best wishes
Dmitry
