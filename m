Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 713D52C7822
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Nov 2020 07:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgK2GDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Nov 2020 01:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgK2GDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Nov 2020 01:03:04 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDDFC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:02:23 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id x16so7194525ejj.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eOJePbnIwaExU9jLd03lUnaNrDCMN/HWo7t0wyAP25E=;
        b=Rd3ipsa2AJM+7Qvi713J8i3+10Ej8rUhIQAfk9VjpyZdAWjDKjkv9jIE9iOHnaNKS1
         bz20a7/h6+adkm79yT/9z0YJtUBEa0QwBWky2MW0i6Wo1ErCpoHL9fZXKnhJO8AVeNyr
         u0l+uPxqOUiaN3Ku2GQubMqPZshP7Y9i/9rHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eOJePbnIwaExU9jLd03lUnaNrDCMN/HWo7t0wyAP25E=;
        b=sEhbTLvGiYid55eFtEO+2/8KF5cWjiOCobuABxOeOSKxr1xzJklFaZbcOhYJUKLEpl
         sFfVJ8YUusHMqgfHGA/gijtNPonjvDBHMDQL5ihpBgUttFybhKQiA7DEw+EY++uBmvYT
         8awAIYMnMfFCRkjRvWuZTbc3UFYIF9V4AbAsMSR6ZgraMR8x0PBTE1XO4J3XxamiaOjS
         Ag7jb4t6EifIDEEuzMzeuozP6cmz/hsQ/T4g+59wijgKFmOCei8nxREN6FUsFA71Bcap
         Gsjcm4mLsDQ9JT7iZkULTk8L5dIkTH6vED3YN3vG8dFoUwqFhoX87zuEwPxR94pXGTAr
         oYDw==
X-Gm-Message-State: AOAM533fhjqxjSHMIRbSsGVTINdgs9ieBDhHrMebRifiwXscchVRaqjS
        LBr1eJqtkxo+vcfjIXKXQToRTmlt5j/26g==
X-Google-Smtp-Source: ABdhPJxQtl0fKWs2SPMYlJOF4T59gAoySV5jj9XQPfPcOA96Pvs+bJraduBfXpt4dHdgLtHakuCv+g==
X-Received: by 2002:a17:906:9501:: with SMTP id u1mr14685769ejx.405.1606629742398;
        Sat, 28 Nov 2020 22:02:22 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id c6sm7275348edy.62.2020.11.28.22.02.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 22:02:21 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id e7so10620646wrv.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:02:21 -0800 (PST)
X-Received: by 2002:adf:e607:: with SMTP id p7mr20639872wrm.93.1606629740798;
 Sat, 28 Nov 2020 22:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org> <20201111143755.24541-2-stanimir.varbanov@linaro.org>
In-Reply-To: <20201111143755.24541-2-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sat, 28 Nov 2020 22:02:08 -0800
X-Gmail-Original-Message-ID: <CAMfZQbx5j+c3HQBjaT45ur_6r6Nm3tsRji8D0f_EtLJF_CFiyw@mail.gmail.com>
Message-ID: <CAMfZQbx5j+c3HQBjaT45ur_6r6Nm3tsRji8D0f_EtLJF_CFiyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] venus: hfi: Use correct state in unload resources
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> INST_RELEASE_RESOURCES state is set but not used, correct this
> by enter into INIT state once the unload resources is done.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi.c | 2 +-
>  drivers/media/platform/qcom/venus/hfi.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> index 638ed5cfe05e..4c87228e8e1d 100644
> --- a/drivers/media/platform/qcom/venus/hfi.c
> +++ b/drivers/media/platform/qcom/venus/hfi.c
> @@ -388,7 +388,7 @@ int hfi_session_unload_res(struct venus_inst *inst)
>         if (ret)
>                 return ret;
>
> -       inst->state = INST_RELEASE_RESOURCES;
> +       inst->state = INST_INIT;
>
>         return 0;
>  }
> diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
> index f25d412d6553..e9c944271cc1 100644
> --- a/drivers/media/platform/qcom/venus/hfi.h
> +++ b/drivers/media/platform/qcom/venus/hfi.h
> @@ -87,7 +87,6 @@ struct hfi_event_data {
>  #define INST_LOAD_RESOURCES                    4
>  #define INST_START                             5
>  #define INST_STOP                              6
> -#define INST_RELEASE_RESOURCES                 7
>
>  struct venus_core;
>  struct venus_inst;
> --
> 2.17.1
>

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
