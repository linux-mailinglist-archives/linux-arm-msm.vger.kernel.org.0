Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEBB3D0839
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 07:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbhGUEpq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 00:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbhGUEpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 00:45:46 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19529C061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:26:20 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id o2-20020a0568200402b0290258a7ff4058so306730oou.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2vZaK5rMHWTEBuE5R0Hk93f1smaSD/eyQxjWnxs8hMM=;
        b=mB0KXileUD1bpLEzFnlL4ZOS1gzZIi9lnYLV3XD2OaHTr3ABwOuN1Rp7c37bBUrH9L
         A6aoxW6rH6/r1Cwxj38C31Gp73mSFOoqNTyAxLHBVFmkl4v/x0pC52wgYeiXcxnW4pQX
         oetAETTHWWGAf4zjgx/70qFLkHEgwOUEKIB84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2vZaK5rMHWTEBuE5R0Hk93f1smaSD/eyQxjWnxs8hMM=;
        b=NrKeIc3uE85+7km+2PsNab8WRFbAXf5LEuMYBoHFU/MPrXyRYwnKVic/yU1UsEGSCu
         qeWIwsa5G1OEE0B8knfIhk8RgRZDVRJm23umyBIGuYKu07Fk2UHyFbwHf9oIpEfN41RK
         KYQC8zVIgWw7PmpKEvHm6iKAlddUssjyqBVDH5lKeyOqt/gsYISrWBXVfXBjxvIJnhRS
         u2fUV5b0sarREFQW6LmsvRULOZqnkswiTxvjq+0XOi46dcFhad5SMbDGo3bL5LkJ2qxD
         B2KQ7k2+RbVGghcg8gAbmE0DDzWQ2d0+TDl2fO2bEMNAFVtRuVHzGIw7L26BjDmHIknE
         /BPg==
X-Gm-Message-State: AOAM531wTgQygOIwXLPJ05o7+5kNx3CEh58MSLi85+0XYtmftKM0DTMJ
        7VEW6fqoirln1tSVrJFqKLADjTwWOc/A2Y9dBCkHcQ==
X-Google-Smtp-Source: ABdhPJyf+Q55mzHYq+y4YhRHB8zI6CgfFImzx3igvReJdBQFivIH7i/sdjeN6vVI9KZgfNVK0YcWx4BBWwuZJhot1mA=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr17450621oom.92.1626845179395;
 Tue, 20 Jul 2021 22:26:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:26:19 +0000
MIME-Version: 1.0
In-Reply-To: <1626755807-11865-5-git-send-email-sibis@codeaurora.org>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org> <1626755807-11865-5-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:26:19 +0000
Message-ID: <CAE-0n518x-W8kCdtrLjw0kwsbEnLzk9OmnKara_B=et0j9+ScA@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] remoteproc: qcom: q6v5: Use qmp_send to update
 co-processor load state
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-07-19 21:36:38)
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 7e9244c748da..997ff21271f7 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -16,8 +16,28 @@
>  #include "qcom_common.h"
>  #include "qcom_q6v5.h"
>
> +#define Q6V5_LOAD_STATE_MSG_LEN        64
>  #define Q6V5_PANIC_DELAY_MS    200
>
> +static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
> +{
> +       char buf[Q6V5_LOAD_STATE_MSG_LEN] = {};

Just to confirm, we want to set the whole buffer to zero before writing
it? Sounds good to not send stack junk over to to the other side but
maybe we could skip initializing to zero for the first part of the
buffer that isn't used?

> +       int ret;
> +
> +       if (IS_ERR(q6v5->qmp))
> +               return 0;
> +
> +       snprintf(buf, sizeof(buf),
> +                "{class: image, res: load_state, name: %s, val: %s}",
> +                q6v5->load_state, enable ? "on" : "off");

Should we WARN_ON() if the message doesn't fit into the 64-bytes?

> +
> +       ret = qmp_send(q6v5->qmp, buf, sizeof(buf));
> +       if (ret)
> +               dev_err(q6v5->dev, "failed to toggle load state\n");
> +
> +       return ret;
> +}
> +
>  /**
>   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
>   * @q6v5:      reference to qcom_q6v5 context to be reinitialized
> @@ -196,12 +223,13 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>   * @pdev:      platform_device reference for acquiring resources
>   * @rproc:     associated remoteproc instance
>   * @crash_reason: SMEM id for crash reason string, or 0 if none
> + * @load_state: load state resource string
>   * @handover:  function to be called when proxy resources should be released
>   *
>   * Return: 0 on success, negative errno on failure
>   */
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
> -                  struct rproc *rproc, int crash_reason,
> +                  struct rproc *rproc, int crash_reason, const char *load_state,
>                    void (*handover)(struct qcom_q6v5 *q6v5))
>  {
>         int ret;
> @@ -286,9 +314,36 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>                 return PTR_ERR(q6v5->state);
>         }
>
> +       q6v5->load_state = kstrdup_const(load_state, GFP_KERNEL);
> +       q6v5->qmp = qmp_get(&pdev->dev);
> +       if (IS_ERR(q6v5->qmp)) {
> +               if (PTR_ERR(q6v5->qmp) != -ENODEV) {
> +                       if (PTR_ERR(q6v5->qmp) != -EPROBE_DEFER)
> +                               dev_err(&pdev->dev, "failed to acquire load state\n");

Use dev_err_probe()?

> +                       kfree_const(q6v5->load_state);
> +                       return PTR_ERR(q6v5->qmp);
> +               }
> +       } else {
> +               if (!q6v5->load_state) {

Use else if and deindent?

> +                       dev_err(&pdev->dev, "load state resource string empty\n");
> +                       return -EINVAL;
> +               }
> +       }
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(qcom_q6v5_init);
>
