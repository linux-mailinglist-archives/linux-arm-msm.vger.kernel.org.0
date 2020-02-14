Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1409315D00E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 03:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgBNClL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 21:41:11 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39430 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbgBNClL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 21:41:11 -0500
Received: by mail-pg1-f193.google.com with SMTP id j15so4172063pgm.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 18:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=eCyRMSwDhUx3DYVZzm+7HHgO3GMTp1RY7+uRcyHTPeI=;
        b=jWCAMo8EQdcK5KgJsuy4ct3kIXs800bHvuwy7eaSvUJ6vjxd0uxMYlrTzk5OJ+nIaG
         hRxdpE5zgAApIeCCKctakaQV1rb1+CevGAxyZKAg44aai2FNZQ/+Ye1//HuoTs4/jNqS
         PGaecUCEUoOntwF63nWtLazgkvgSU2eX7Ts/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=eCyRMSwDhUx3DYVZzm+7HHgO3GMTp1RY7+uRcyHTPeI=;
        b=fl8EK1plCrQ3CXBPO1S7cicEUm6ubhCdI4q2RmCoVOSB0MIKQKeOV5hG+mpcT1E/d3
         dLWmcly8+ZNOEBNdTMieFvHh66ThEK9pWiYWz1QYDmIuqQ1jONW2OZM347Gz2ipGUZ/9
         1ghME1DoczWy6p9Sxv6jpHnfVuAo7MOOAG43FoSosQ8L0cdGI2HQ43acYmhH0qmA8vPN
         zI2ynJZFVRjhfRv7Ad2yXCAlI4KPKa0j+5EQn9Auq20JdwhQWzWvzsTff7NgKOJXCLgb
         x0OHD/3Vn093J83laAA5IKybew3pzQDCtjcmnFY9Wd75nL2mqSfh0zkrmhc9pauto7lG
         RdYQ==
X-Gm-Message-State: APjAAAW4NmSM84L3quboSk7h7aLvxg+oshn3rCKRYQXwXo0WHvWZIpjv
        qFHsjWlqnmzWNKmB3JxKZYQlcA==
X-Google-Smtp-Source: APXvYqw7VRLbP38LxX1QJdX8p44zufhYebjDSFyj+OYD+cPmrjXyIJE9pZtr4Da8lcmqnUNS//QrNQ==
X-Received: by 2002:a63:ca04:: with SMTP id n4mr1083967pgi.110.1581648070461;
        Thu, 13 Feb 2020 18:41:10 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b12sm4758285pfr.26.2020.02.13.18.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 18:41:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200211005059.1377279-7-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org> <20200211005059.1377279-7-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 6/8] remoteproc: Introduce "panic" callback in ops
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Date:   Thu, 13 Feb 2020 18:41:08 -0800
Message-ID: <158164806895.184098.244699295706516537@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-02-10 16:50:57)
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/re=
moteproc_core.c
> index 097f33e4f1f3..8b6932027d36 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2216,10 +2218,53 @@ void rproc_report_crash(struct rproc *rproc, enum=
 rproc_crash_type type)
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
> =20
> +static int rproc_panic_handler(struct notifier_block *nb, unsigned long =
event,
> +                              void *ptr)
> +{
> +       unsigned int longest =3D 0;
> +       struct rproc *rproc;
> +       unsigned int d;
> +       int locked;
> +
> +       locked =3D mutex_trylock(&rproc_list_mutex);
> +       if (!locked) {
> +               pr_err("Failed to acquire rproc list lock, won't call pan=
ic functions\n");
> +               return NOTIFY_DONE;
> +       }
> +
> +       list_for_each_entry(rproc, &rproc_list, node) {
> +               if (!rproc->ops->panic || rproc->state !=3D RPROC_RUNNING)
> +                       continue;
> +
> +               d =3D rproc->ops->panic(rproc);
> +               if (d > longest)
> +                       longest =3D d;

Could be

	d =3D max(longest, d);

> +       }
> +
> +       mutex_unlock(&rproc_list_mutex);
> +
> +       /* Delay panic for the longest requested duration */
> +       mdelay(longest);

Is this to flush caches? Maybe indicate that in the comment.

> +
> +       return NOTIFY_DONE;
> +}
> +
> +static void __init rproc_init_panic(void)
> +{
> +       rproc_panic_nb.notifier_call =3D rproc_panic_handler;
> +       atomic_notifier_chain_register(&panic_notifier_list, &rproc_panic=
_nb);

This is an atomic notifier, but the notifier function takes a mutex,
which sleeps. It should use spinlocks, and never sleep, given that panic
can be called from anywhere.

> +}
> +
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..14f05f26cbcd 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -369,6 +369,8 @@ enum rsc_handling_status {
>   *                     expects to find it
>   * @sanity_check:      sanity check the fw image
>   * @get_boot_addr:     get boot address to entry point specified in firm=
ware
> + * @panic:     optional callback to react to system panic, core will del=
ay
> + *             panic at least the returned number of milliseconds
>   */
>  struct rproc_ops {
>         int (*start)(struct rproc *rproc);
> @@ -383,6 +385,7 @@ struct rproc_ops {
>         int (*load)(struct rproc *rproc, const struct firmware *fw);
>         int (*sanity_check)(struct rproc *rproc, const struct firmware *f=
w);
>         u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *=
fw);
> +       unsigned int (*panic)(struct rproc *rproc);

Maybe should be unsigned long to match other "timeouts" in the kernel.
