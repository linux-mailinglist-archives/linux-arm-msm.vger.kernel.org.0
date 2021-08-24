Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 982B93F691B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 20:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbhHXSfc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 14:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbhHXSfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 14:35:30 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51679C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 11:34:46 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so48573915otk.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=MpSjVxSMjJK4OJw4oTKLD3JL0PWvQPTVS0fPqXZYl3g=;
        b=n/JcnajTDuWMOgB1dqCLhqVz/SK9+IAgpIc6Z5Dlx0X3Bz7NVcegvqK2cpm3DNJbPQ
         10DZqlRko41kmEobXSLmA4zrYTieEAA4vI1y7bwkO66KsdU7sMqstshTU6BpT0hdAZfy
         i6kXOJtX6evRy9U7I6Sp6+LA4yS0fHqGvNoOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=MpSjVxSMjJK4OJw4oTKLD3JL0PWvQPTVS0fPqXZYl3g=;
        b=MGRh1ccPhSzfWfqscbKwONNwuYe0ZSiPLYgYU7I2JGfeSALKu+MStif+RDtFkuKvIN
         UB193G6UcFjKoGmAYCwKqHuyodCceKPprglle8sswR6J4KZmMPSc4URxsCW/U5g9am9v
         rQfh9N8MaCJUJdrrexIewF8iyzyxPH7qk3caEvLjUgWlb/6s3JwxunvWRWYRrE3VP7GH
         Pdebv9TdEQIKtYr6rhKy6TIAqznlBpnWiaRmswPuWyNBIedZPFU2ZCwxAmf8pHKGTaih
         8Is8OTJWHmZiDLyn3ePSMvFOr26CaJDzQUE4yE8CodQFjus6i4aVR6se6qguI5iFlnTd
         tboQ==
X-Gm-Message-State: AOAM531gztLp2gBMKjMycYMGD57inp4s5vn4q+qobRbenkKRR4qPiGBx
        1l7sEL1o4NkopfGNWuF5YZ+8luY3ZL1XKA+1LK9XWQ==
X-Google-Smtp-Source: ABdhPJzRH/Uc7RJJIpCbxFsIdbJBiPfb7rT9/hLjX1Vp9cEqoF/t87EH1mDk73cPqGvQmJ4MtwBCUJQX8YPNs8ZHDkQ=
X-Received: by 2002:a05:6808:180e:: with SMTP id bh14mr3854642oib.19.1629830085691;
 Tue, 24 Aug 2021 11:34:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Aug 2021 11:34:45 -0700
MIME-Version: 1.0
In-Reply-To: <1629113954-14084-2-git-send-email-deesin@codeaurora.org>
References: <1629113954-14084-1-git-send-email-deesin@codeaurora.org> <1629113954-14084-2-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 24 Aug 2021 11:34:45 -0700
Message-ID: <CAE-0n50G_OYqR6R8+K5RkrCBvdQW-E-zDoMZ-yyAoEJW2WyxcA@mail.gmail.com>
Subject: Re: [PATCH V6 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-16 04:39:13)
> Not all upcoming usecases will have an interface to allow the aoss
> driver to hook onto. Expose the send api and create a get function to
> enable drivers to send their own messages to aoss.
>
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---

With one nit below

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 934fcc4..a43c22c 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -515,6 +521,48 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
>                 thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>  }
>
> +/**
> + * qmp_get() - get a qmp handle from a device
> + * @dev: client device pointer
> + *
> + * Return: handle to qmp device on success, ERR_PTR() on failure
> + */
> +struct qmp *qmp_get(struct device *dev)
> +{
> +       struct platform_device *pdev;
> +       struct device_node *np;
> +       struct qmp *qmp;
> +
> +       if (!dev || !dev->of_node)
> +               return ERR_PTR(-EINVAL);
> +
> +       np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
> +       if (!np)
> +               return ERR_PTR(-ENODEV);
> +
> +       pdev = of_find_device_by_node(np);
> +       of_node_put(np);
> +       if (!pdev)
> +               return ERR_PTR(-EINVAL);
> +
> +       qmp = platform_get_drvdata(pdev);
> +
> +       return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
> +}
> +EXPORT_SYMBOL(qmp_get);
> +
> +/**
> + * qmp_put() - Match get_device() inside of_find_device_by_node()
> + *            in qmp_get()

I meant to put this comment next to the put_device() call. This should
say something like "release a qmp handle" and then the existing comment
moved down to the if below.

> + * @qmp: qmp handle obtained from qmp_get()
> + */
> +void qmp_put(struct qmp *qmp)
> +{
> +       if (!IS_ERR_OR_NULL(qmp))
> +               put_device(qmp->dev);
> +}
> +EXPORT_SYMBOL(qmp_put);
> +
>  static int qmp_probe(struct platform_device *pdev)
>  {
>         struct resource *res;
