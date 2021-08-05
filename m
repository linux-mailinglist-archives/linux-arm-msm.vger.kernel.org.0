Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657513E1B62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 20:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241299AbhHESek (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 14:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241264AbhHESej (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 14:34:39 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66661C061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 11:34:24 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id u25so8611076oiv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=TZQqBrv6qFFrmIcwMHn6Tt1aOzqmQe5CcX5H31Yc2D8=;
        b=jM+qFVtxfPIwShdjDlkwiDnBtOTl3GBLcUMQkzrNJs5RMZD08KMiUYSXA6DwKlngcV
         FJdoM4rjwEct36UODwq4Z0sqEBOhjWI4w5GZWCqCzdl//cLAReV5sS8sKwe18gDlt37P
         exqVNaZ3KID+niE8g3gCNu20AhSeKoh22h7Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=TZQqBrv6qFFrmIcwMHn6Tt1aOzqmQe5CcX5H31Yc2D8=;
        b=Rp0nNOHM68e72C2iriaRsm2qZJJsi6Hvlkbbz+sMJ64EzYoyVE2MJ5EPG1Bb8AxiHR
         FEuKYTLvFRaZ4HSfT4nz18De2RAa/EjutL4Se5FdiPSPJb0EP+MXRqkhEAsYNvVd3qv8
         fyIhTMeCXUlJMKAf0WIaYCmjFMeBWpcLAksqhMD+PkBDSehXVqey0KYDlSbXJ0dwX/Sw
         I9wI3aINFpxZAdWjQWmkc3Wl+XVMLgNc9U+hdk/dtpL2K2dSQLmc/5ZTRRTjaak9k/ql
         4uLejxeeAICgtUSDJFA2l7fBQgrurqxKQTa3JedEPi/+WUl1+pfqK/q7KQEjllSIoLr5
         vG9g==
X-Gm-Message-State: AOAM532NeiRYUv1RSb/hibsHuQk3YqsTrnwQooyRlAztlHz0aXXwTbTW
        7tuozeErPfpNhA/5jCjRp4N0LdGuQWWYUu8BFsZA2g==
X-Google-Smtp-Source: ABdhPJwJ+Ulv2NUu9Hno8DPMoDQScz1PjXLsrEKbBtSi8KYZ7i0sxRfVg4lVYFImIcK8gjsNOxr3Pa8zmqL7w9Eizls=
X-Received: by 2002:a05:6808:619:: with SMTP id y25mr8128779oih.166.1628188464390;
 Thu, 05 Aug 2021 11:34:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Aug 2021 11:34:23 -0700
MIME-Version: 1.0
In-Reply-To: <1628161974-7182-2-git-send-email-deesin@codeaurora.org>
References: <1628161974-7182-1-git-send-email-deesin@codeaurora.org> <1628161974-7182-2-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 5 Aug 2021 11:34:23 -0700
Message-ID: <CAE-0n50fN42fhAcoCJBz-PEW5sEdqSKT5YuaxWE_29J=P1=vQw@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-05 04:12:53)
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 934fcc4..b84cb31 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -515,6 +521,43 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
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
> +void qmp_put(struct qmp *qmp)
> +{
> +       if (!IS_ERR_OR_NULL(qmp))
> +               put_device(qmp->dev);

Where is the corresponding get_device() call?

> +}
> +EXPORT_SYMBOL(qmp_put);
> +
>  static int qmp_probe(struct platform_device *pdev)
>  {
>         struct resource *res;
