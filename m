Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270A33F53F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 02:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbhHXAJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 20:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233260AbhHXAJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 20:09:29 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F60C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 17:08:46 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id f7so10750270qvt.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 17:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qXHgg8bh4V9/RfLoZDOv21AHCTmNqs2XAaQ2Uix6BLU=;
        b=WRlLLaLWLWRVsmSdu/QDc1Rh7jw0BbtL7yBuVloYbQAOhCFewPibup7cK+gPbEhBXa
         NvhXpKkSuYpoe7tO7OCFtjVcf5gMTzW5+6MOMrhkBoAHRX/SXTwZzL/zbzb5+UmjZ+F+
         QgtBIjydKYagFMU2hZ7f9t71p2OkzysjGAzQ2gaJPMHtTu7V2jZBM1PNMPYxKWmEPGXc
         cHhTbGo2L673WHmtQMVJoV7Nsx9T0hQSKH3yfhTIjQfh4TKIfPISlVfyUu1KS5WIIrDO
         CeZvI3TKTahZ8iLpRLwjda7zcyyOsxj9D2WhHLu7f0QuoHAcZRG5Klb5xSeabXkzP53D
         14nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qXHgg8bh4V9/RfLoZDOv21AHCTmNqs2XAaQ2Uix6BLU=;
        b=EuMlrA/QzuucWPvLQB1C6fbe8acoRcgME1ko18A4LrC+w4His0jXTAq7NHPDz+/lNf
         1c02ns56TTF8CnYb5e66joUBO2CbKyFtfxnk4gK0bLjxVm4l9WBIl5necSfYaJ1t1L5h
         Wws8R5a/9bvPS2K/9eMqNMOErmNOhp/v+iyXPL9YjsHV3soUOZxHL1amsFfIkGRjy4R1
         8Uoqu4b2p86SLeZLzx01wvI6wFp3NHOSwTvfKkTe+dIciX3nzwdWcP3dHFgfsNus+wWH
         grMzejYhN0/8sfioiRmnV9pol6dWVjFQzlQybir8DEZ/kyPzpG/rAd12qXKSg5cQPyWk
         5IDg==
X-Gm-Message-State: AOAM531qWo1EarnJJagKjWlqgy81/2fHksj4BZFv1Ivlra8jFedTw3xR
        g122P9/QzArdhzIZq5sDTREQJ9f7yLfOX6cIhg381A==
X-Google-Smtp-Source: ABdhPJyWbfNm8Z/jZ9f9qujiZJUDa0z4Oqk0Nanie5mU4W3bucnaFpllzzx45zlKucYLuf8LltVPw4Pd+0AOn0rb0Qg=
X-Received: by 2002:ad4:54e9:: with SMTP id k9mr4461953qvx.4.1629763725350;
 Mon, 23 Aug 2021 17:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210823134726.1.I1dd23ddf77e5b3568625d80d6827653af071ce19@changeid>
In-Reply-To: <20210823134726.1.I1dd23ddf77e5b3568625d80d6827653af071ce19@changeid>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Aug 2021 03:08:34 +0300
Message-ID: <CAA8EJpqtuPam2b-87FC=pJidZ=df5KROxcBi8811aZm_WBwqFg@mail.gmail.com>
Subject: Re: [PATCH] thermal: qcom: spmi-adc-tm5: Don't abort probing if a
 sensor is not used
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 23 Aug 2021 at 23:47, Matthias Kaehlcke <mka@chromium.org> wrote:
>
> adc_tm5_register_tzd() registers the thermal zone sensors for all
> channels of the thermal monitor. If the registration of one channel
> fails the function skips the processing of the remaining channels
> and returns an error, which results in _probe() being aborted.
>
> One of the reasons the registration could fail is that none of the
> thermal zones is using the channel/sensor, which hardly is a critical
> error (if it is an error at all). If this case is detected emit a
> warning and continue with processing the remaining channels.
>
> Fixes: ca66dca5eda6 ("thermal: qcom: add support for adc-tm5 PMIC thermal monitor")
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> index 232fd0b33325..8494cc04aa21 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -359,6 +359,12 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
>                                                            &adc_tm->channels[i],
>                                                            &adc_tm5_ops);
>                 if (IS_ERR(tzd)) {
> +                       if (PTR_ERR(tzd) == -ENODEV) {
> +                               dev_warn(adc_tm->dev, "thermal sensor on channel %d is not used\n",
> +                                        adc_tm->channels[i].channel);
> +                               continue;
> +                       }
> +
>                         dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %ld\n",
>                                 adc_tm->channels[i].channel, PTR_ERR(tzd));
>                         return PTR_ERR(tzd);
> --
> 2.33.0.rc2.250.ged5fa647cd-goog
>


-- 
With best wishes
Dmitry
