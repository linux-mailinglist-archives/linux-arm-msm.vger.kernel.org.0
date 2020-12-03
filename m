Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2702CCFF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 08:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgLCHCa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 02:02:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:48150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727760AbgLCHCa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 02:02:30 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606978909;
        bh=HoPygWwtGN+QMbnPBb6jAE0aVW8zzwctjjCOz2pGgmI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=r5qpemaSWLVcgIzv1Qrb/bnVcKGmUWQ7PBedooLMq+PBMGnfcHfY5GzOXDiq0Y3yp
         qiAp4ogR4axwB6Gz/iaYQOkdRS/SrONaxfGN68Hz97cQZrJdMo4AC4UC4A7qqD5T6A
         OYgRF/n6SvRwfd9JX3E9Ctt9FDWVuyBzZojMB0ID40DhWW858ekNqMABIggyQokLAX
         YuuG0dG1vMDGnJo+ssFvdlExiTl+xgNNf/bUB0TNglYfoj5/Pk1ckpS1M1o+g9YFkP
         wDUH9YkZekziGvAxjeCrZtZ4QZOoy2/VyTU8Dk2p3ABpyAQAtu3caqFIzzT13FKool
         9UQuMfgJfluTQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1606385898-8609-4-git-send-email-mkshah@codeaurora.org>
References: <1606385898-8609-1-git-send-email-mkshah@codeaurora.org> <1606385898-8609-4-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH 3/3] soc: qcom: rpmh: Conditionally check lockdep_assert_irqs_disabled()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        tkjos@google.com, dianders@chromium.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, andy.gross@linaro.org,
        bjorn.andersson@linaro.org
Date:   Wed, 02 Dec 2020 23:01:47 -0800
Message-ID: <160697890733.2717324.809961029114008005@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-11-26 02:18:18)
> lockdep_assert_irqs_disabled() was added to check rpmh_flush()
> can only be invoked when irqs are disabled, this is true for
> APPS RSC as the last CPU going to deepest low power mode is
> writing sleep and wake TCSes.
>=20
> However for RSCs that support solver mode, drivers can invoke
> rpmh_write_sleep_and_wake() to immediately write cached sleep
> and wake sets to TCSes from any CPU. Conditionally check if RSC
> controller supports 'HW solver' mode then do not check for irqs
> disabled as such RSCs can write sleepand wake TCSes at any point.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh-internal.h |  5 +++++
>  drivers/soc/qcom/rpmh-rsc.c      |  3 +++
>  drivers/soc/qcom/rpmh.c          | 26 ++++++++++++++++++++++----
>  3 files changed, 30 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-int=
ernal.h
> index 79486d6..39fa3c5 100644
> --- a/drivers/soc/qcom/rpmh-internal.h
> +++ b/drivers/soc/qcom/rpmh-internal.h
> @@ -17,6 +17,9 @@
>  #define MAX_TCS_NR                     (MAX_TCS_PER_TYPE * TCS_TYPE_NR)
>  #define MAX_TCS_SLOTS                  (MAX_CMDS_PER_TCS * MAX_TCS_PER_T=
YPE)
> =20
> +/* CTRLR specific flags */
> +#define SOLVER_PRESENT                 1
> +
>  struct rsc_drv;
> =20
>  /**
> @@ -78,6 +81,7 @@ struct rpmh_request {
>   * @cache_lock: synchronize access to the cache data
>   * @dirty: was the cache updated since flush
>   * @in_solver_mode: Controller is busy in solver mode
> + * @flags: Controller specific flags
>   * @batch_cache: Cache sleep and wake requests sent as batch
>   */
>  struct rpmh_ctrlr {
> @@ -85,6 +89,7 @@ struct rpmh_ctrlr {
>         spinlock_t cache_lock;
>         bool dirty;
>         bool in_solver_mode;
> +       u32 flags;

Maybe unsigned long is more appropriate? Do we rely on 32-bits vs.
64-bits?

>         struct list_head batch_cache;
>  };
> =20
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index ffb4ca7..4caaddf 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -1031,6 +1031,9 @@ static int rpmh_rsc_probe(struct platform_device *p=
dev)
>         if (!solver_config) {
>                 drv->rsc_pm.notifier_call =3D rpmh_rsc_cpu_pm_callback;
>                 cpu_pm_register_notifier(&drv->rsc_pm);
> +               drv->client.flags &=3D ~SOLVER_PRESENT;
> +       } else {
> +               drv->client.flags |=3D SOLVER_PRESENT;

It looks like this could be tested by checking for
drv->rsc_pm.notifier_call being non-NULL?

>         }
> =20
>         /* Enable the active TCS to send requests immediately */
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 725b8f0..604d511 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -83,6 +83,9 @@ static int check_ctrlr_state(struct rpmh_ctrlr *ctrlr, =
enum rpmh_state state)
>         if (state !=3D RPMH_ACTIVE_ONLY_STATE)
>                 return ret;
> =20
> +       if (!(ctrlr->flags & SOLVER_PRESENT))
> +               return ret;
> +
>         /* Do not allow sending active votes when in solver mode */
>         spin_lock(&ctrlr->cache_lock);
>         if (ctrlr->in_solver_mode)
> @@ -468,12 +471,24 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>         struct cache_req *p;
>         int ret =3D 0;
> =20
> -       lockdep_assert_irqs_disabled();
> +       /*
> +        * For RSC that don't have solver mode,
> +        * rpmh_flush() is only called when we think we're running
> +        * on the last CPU with irqs_disabled.
> +        *
> +        * For RSC that have solver mode,
> +        * rpmh_flush() can be invoked with irqs enabled by any CPU.
> +        *
> +        * Conditionally check for irqs_disabled only when solver mode
> +        * is not available.
> +        */
> +
> +       if (!(ctrlr->flags & SOLVER_PRESENT))
> +               lockdep_assert_irqs_disabled();

Can we have a different function that is called for the case where
solver mode is present and where solver mode isn't present? It would be
good to clearly show that rpmh_flush() thinks it is being called from
the last CPU vs. from some other random place because the code is
assuming solver vs. non-solver enabled state. It would be clearer from
the call site too.

> =20
>         /*
> -        * Currently rpmh_flush() is only called when we think we're runn=
ing
> -        * on the last processor.  If the lock is busy it means another
> -        * processor is up and it's better to abort than spin.
> +        * If the lock is busy it means another transaction is on going,
> +        * in such case it's better to abort than spin.
>          */
>         if (!spin_trylock(&ctrlr->cache_lock))
>                 return -EBUSY;
