Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82512C7833
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Nov 2020 07:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgK2GJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Nov 2020 01:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgK2GJ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Nov 2020 01:09:27 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484EDC0613D4
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:08:41 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id 38so3389039edr.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wt+i8mCuCik4YSJ0kM//c8mqY8ZlAwEjQilfu5+58jE=;
        b=QnkG6tHZpsm7stG82Y/AGjsPdf4vitr0uJ5ICNCnZ5wuKuQJro4vd/FvhGlRFZBc8R
         6iebDWJ/oMEF5rw6NOZ1eo+b6YQVnvy/462GBGSJcpI/asxCiq9LImNJxxtk9MvRKEK9
         hiQfbidc74wwYNgEqO93ji3L8h0FRQaEMfScQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wt+i8mCuCik4YSJ0kM//c8mqY8ZlAwEjQilfu5+58jE=;
        b=QymunWI23u4vazQtBhPO28cb9GkXpZ6POuX0AZkZXBO3xFtOhnOBMrCOHxpenx/o9A
         9VUjmDIf9y7MP9E2/N5646kzNht2Ey6IVFiyo4ot7zdRf13ZQEqfyHPZYylcTVF9FybV
         4OdkZaKFn+n6bzZQbbYY6IdYJhubZm5xSnacqJV6+6q1AkRntaBkmYDjIaphlsXeurll
         9IIGZl0rBvB9GNNH+h+9rLJaw18h0dnA2nRzlXWEZ9ih66sMrefECigMJoZYeGdViIh9
         giFii0DRGkYOLCppZZ8R+Ql6jzEgziEJErej8lymAdZeJnqklAisqr/Kt5MvcbokIvhz
         Dy1Q==
X-Gm-Message-State: AOAM53375KgM1aa69rk0Vo5vEItbHZAGQ0SEtZ+mNY5pT8p+HXhSddhT
        CzrZOUjkxJq8D1q+e5/gtvoSY/8KyVQYdw==
X-Google-Smtp-Source: ABdhPJyu8RYHdC1IYvnUMWP4npIUzl3xMhV6SqSeXAgTDqq5xon/S0QXDnaFwFxeuwgBPXB/pjw+VQ==
X-Received: by 2002:a50:b404:: with SMTP id b4mr15790249edh.369.1606630119932;
        Sat, 28 Nov 2020 22:08:39 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a10sm7482273edn.77.2020.11.28.22.08.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 22:08:39 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id w24so14747734wmi.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:08:39 -0800 (PST)
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr17108061wml.11.1606630119035;
 Sat, 28 Nov 2020 22:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org> <20201111143755.24541-6-stanimir.varbanov@linaro.org>
In-Reply-To: <20201111143755.24541-6-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sat, 28 Nov 2020 22:08:26 -0800
X-Gmail-Original-Message-ID: <CAMfZQbxfLw_Rwz9jjpzvEO7bnBdQoW_UbA45G1UmBjADEUHfFw@mail.gmail.com>
Message-ID: <CAMfZQbxfLw_Rwz9jjpzvEO7bnBdQoW_UbA45G1UmBjADEUHfFw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] venus: pm_helpers: Check instance state when
 calculate instance frequency
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
> Skip calculating instance frequency if it is not in running state.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index ca99908ca3d3..cc84dc5e371b 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -940,6 +940,9 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
>
>         mbs_per_sec = load_per_instance(inst);
>
> +       if (inst->state != INST_START)
> +               return 0;
> +
>         vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>         /* 21 / 20 is overhead factor */
>         vpp_freq += vpp_freq / 20;
> --
> 2.17.1
>

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
