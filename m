Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6359F2D1A27
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 21:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgLGUBD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 15:01:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgLGUBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 15:01:02 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B156C061793
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Dec 2020 12:00:22 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id s2so7314477oij.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Dec 2020 12:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lJr1JkK+Ht+XGBp+gVMzADV8IPXrdhTk12UY2e2HHCM=;
        b=NjceKVvGvvH4bnyrPHXXp6nmMlYZx9GoHP2TsX3QsvXVLdZGIDs/E2qTxidkpXPj53
         tL/abR3J5Xa2I09ynrqjsgkOusJo2sd+9oNuCIHzkAzHlZDJCwIE6BXfH2PHehBjIDiq
         NUWngf+Cn0CH5KYyG9bA6wV2d71Y74GZZPTdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lJr1JkK+Ht+XGBp+gVMzADV8IPXrdhTk12UY2e2HHCM=;
        b=FsNdC8WUijji1jfKRKeJvXqjduHegoyy/d0eBQZo/NzAcjr78HX6ZpLchgcd6BXGBz
         tRcTxcZEZQaTWrZ+zBqqQaEpXdZPBNhwuzBgB79hSDr5dr/KJhEZRVeG0gnZIFtO1+xr
         J3iSXbngqYfyuMRwDqjkblToOLeisZl0HPirn8+DG1ZOx1zM88uMlGIFYBC8OY0ZPhKe
         0gc75rwLSRd+63y6fAiyl76qKWhfepWJSnKHC0wPSDq3+N5i1fEAtrlkgq2xeANG4GsX
         7FIX0rdlBbvl5PKJ13XO3mpBrQ0LIAbZU575q4AuHxiIeIurPUGNQSgW5mjfRLBNNmXD
         xoqg==
X-Gm-Message-State: AOAM532Nbb9cLx9mDxRcl0QSm+WTc9B0SAllgEvkpdHgd+jfw+K7as8w
        PS++76taMkzC68GsAyO+6GNNDZJYju0k1Q==
X-Google-Smtp-Source: ABdhPJy7eR/czG2kapwtYSD7KomQdrQeoSb6UvyaDBCaKr3GtzI3Jrq3VRP7UCvgc63wnFUGnrV4Lg==
X-Received: by 2002:aca:b254:: with SMTP id b81mr383739oif.42.1607371221346;
        Mon, 07 Dec 2020 12:00:21 -0800 (PST)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id 6sm2866716otc.19.2020.12.07.12.00.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 12:00:20 -0800 (PST)
Received: by mail-oi1-f169.google.com with SMTP id y74so16757104oia.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Dec 2020 12:00:20 -0800 (PST)
X-Received: by 2002:a54:4f95:: with SMTP id g21mr345053oiy.61.1607371219654;
 Mon, 07 Dec 2020 12:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20201122054135.802935-1-bjorn.andersson@linaro.org> <20201122054135.802935-3-bjorn.andersson@linaro.org>
In-Reply-To: <20201122054135.802935-3-bjorn.andersson@linaro.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 7 Dec 2020 11:59:43 -0800
X-Gmail-Original-Message-ID: <CAE=gft4P+kuAFfZEZz7nGoWEr9ZzDFtDZgtA7vCt5wFfnghuWQ@mail.gmail.com>
Message-ID: <CAE=gft4P+kuAFfZEZz7nGoWEr9ZzDFtDZgtA7vCt5wFfnghuWQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] remoteproc: sysmon: Expose the shutdown result
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 21, 2020 at 9:43 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> A graceful shutdown of the Qualcomm remote processors where
> traditionally performed by invoking a shared memory state signal and
> waiting for the associated ack.
>
> This was later superseded by the "sysmon" mechanism, where some form of
> shared memory bus is used to send a "graceful shutdown request" message
> and one of more signals comes back to indicate its success.
>
> But when this newer mechanism is in effect the firmware is shut down by
> the time the older mechanism, implemented in the remoteproc drivers,
> attempts to perform a graceful shutdown - and as such it will never
> receive an ack back.
>
> This patch therefor track the success of the latest shutdown attempt in
> sysmon and exposes a new function in the API that the remoteproc driver
> can use to query the success and the necessity of invoking the older
> mechanism.
>
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Change since v2:
> - None
>
>  drivers/remoteproc/qcom_common.h |  6 +++
>  drivers/remoteproc/qcom_sysmon.c | 82 ++++++++++++++++++++++++--------
>  2 files changed, 69 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
> index dfc641c3a98b..8ba9052955bd 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -51,6 +51,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>                                            const char *name,
>                                            int ssctl_instance);
>  void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
> +bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
>  #else
>  static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>                                                          const char *name,
> @@ -62,6 +63,11 @@ static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  static inline void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon)
>  {
>  }
> +
> +static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
> +{
> +       return false;
> +}
>  #endif
>
>  #endif
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index b37b111b15b3..a428b707a6de 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -44,6 +44,7 @@ struct qcom_sysmon {
>         struct mutex lock;
>
>         bool ssr_ack;
> +       bool shutdown_acked;
>
>         struct qmi_handle qmi;
>         struct sockaddr_qrtr ssctl;
> @@ -115,10 +116,13 @@ static void sysmon_send_event(struct qcom_sysmon *sysmon,
>  /**
>   * sysmon_request_shutdown() - request graceful shutdown of remote
>   * @sysmon:    sysmon context
> + *
> + * Return: boolean indicator of the remote processor acking the request
>   */
> -static void sysmon_request_shutdown(struct qcom_sysmon *sysmon)
> +static bool sysmon_request_shutdown(struct qcom_sysmon *sysmon)
>  {
>         char *req = "ssr:shutdown";
> +       bool acked = false;
>         int ret;
>
>         mutex_lock(&sysmon->lock);
> @@ -141,9 +145,13 @@ static void sysmon_request_shutdown(struct qcom_sysmon *sysmon)
>         if (!sysmon->ssr_ack)
>                 dev_err(sysmon->dev,
>                         "unexpected response to sysmon shutdown request\n");
> +       else
> +               acked = true;
>
>  out_unlock:
>         mutex_unlock(&sysmon->lock);
> +
> +       return acked;
>  }
>
>  static int sysmon_callback(struct rpmsg_device *rpdev, void *data, int count,
> @@ -297,14 +305,33 @@ static struct qmi_msg_handler qmi_indication_handler[] = {
>         {}
>  };
>
> +static bool ssctl_request_shutdown_wait(struct qcom_sysmon *sysmon)
> +{
> +       int ret;
> +
> +       ret = wait_for_completion_timeout(&sysmon->shutdown_comp, 10 * HZ);
> +       if (ret)
> +               return true;
> +
> +       ret = try_wait_for_completion(&sysmon->ind_comp);
> +       if (ret)
> +               return true;
> +
> +       dev_err(sysmon->dev, "timeout waiting for shutdown ack\n");
> +       return false;
> +}
> +
>  /**
>   * ssctl_request_shutdown() - request shutdown via SSCTL QMI service
>   * @sysmon:    sysmon context
> + *
> + * Return: boolean indicator of the remote processor acking the request
>   */
> -static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
> +static bool ssctl_request_shutdown(struct qcom_sysmon *sysmon)
>  {
>         struct ssctl_shutdown_resp resp;
>         struct qmi_txn txn;
> +       bool acked = false;
>         int ret;
>
>         reinit_completion(&sysmon->ind_comp);
> @@ -312,7 +339,7 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
>         ret = qmi_txn_init(&sysmon->qmi, &txn, ssctl_shutdown_resp_ei, &resp);
>         if (ret < 0) {
>                 dev_err(sysmon->dev, "failed to allocate QMI txn\n");
> -               return;
> +               return false;
>         }
>
>         ret = qmi_send_request(&sysmon->qmi, &sysmon->ssctl, &txn,
> @@ -320,27 +347,23 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
>         if (ret < 0) {
>                 dev_err(sysmon->dev, "failed to send shutdown request\n");
>                 qmi_txn_cancel(&txn);
> -               return;
> +               return false;
>         }
>
>         ret = qmi_txn_wait(&txn, 5 * HZ);
> -       if (ret < 0)
> +       if (ret < 0) {
>                 dev_err(sysmon->dev, "failed receiving QMI response\n");
> -       else if (resp.resp.result)
> +       } else if (resp.resp.result) {
>                 dev_err(sysmon->dev, "shutdown request failed\n");
> -       else
> +       } else {
>                 dev_dbg(sysmon->dev, "shutdown request completed\n");
> -
> -       if (sysmon->shutdown_irq > 0) {
> -               ret = wait_for_completion_timeout(&sysmon->shutdown_comp,
> -                                                 10 * HZ);
> -               if (!ret) {
> -                       ret = try_wait_for_completion(&sysmon->ind_comp);
> -                       if (!ret)
> -                               dev_err(sysmon->dev,
> -                                       "timeout waiting for shutdown ack\n");
> -               }
> +               acked = true;
>         }
> +
> +       if (sysmon->shutdown_irq > 0)
> +               return ssctl_request_shutdown_wait(sysmon);
> +
> +       return acked;
>  }
>
>  /**
> @@ -510,6 +533,9 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
>                 .subsys_name = sysmon->name,
>                 .ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
>         };
> +       bool acked;
> +
> +       sysmon->shutdown_acked = false;
>
>         mutex_lock(&sysmon->state_lock);
>         sysmon->state = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;
> @@ -521,9 +547,11 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
>                 return;
>
>         if (sysmon->ssctl_version)

> -               ssctl_request_shutdown(sysmon);
> +               acked = ssctl_request_shutdown(sysmon);
>         else if (sysmon->ept)
> -               sysmon_request_shutdown(sysmon);
> +               acked = sysmon_request_shutdown(sysmon);
> +
> +       sysmon->shutdown_acked = acked;

Guenter noticed that the 0-day bot complains about acked being
potentially uninitialized here. He put a fix for us into Chrome OS:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2577656

Bjorn, do you want to tweak the patch in your tree?
-Evan
