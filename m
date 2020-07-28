Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8ADD2313B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 22:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgG1UQu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 16:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728259AbgG1UQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 16:16:50 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D144EC0619D2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2020 13:16:49 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id o10so6072471edh.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2020 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wSt2JnaWx2nmE7TZWR1qBRnXBnXNBvi3wOezMkM0TJQ=;
        b=MFpv0OOjcghLBTUZzL6xIkhQOQE6drPLIr7GjUZ34JU4DGBj951SzNfKh22bbNCFmr
         /w8gNNg7Y1n2KW+39bsP2vr5O2OS4ykj5l/91Vbs6RZdcJAk2r9nPNqFbrCcqQbHgka9
         YiCW8U+K4Rx1/TgWo3n1WGKY10Xtm1YUHp713t1BpZ87iTy+buRx+bRJwNH+LgLnQ97A
         IzLNKDrAbngZA0mxz4eogTjSQ7ET2n82nYWH9u9+rQzNIbMtlsvAGQo6LVtYFfrZltku
         RF+GLhjE/7UhR1isWppZc5R294qzXSfKuQwAkQVCNxUwQlj4UB3HBboEo00Hlqfar4hG
         z8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wSt2JnaWx2nmE7TZWR1qBRnXBnXNBvi3wOezMkM0TJQ=;
        b=o2+AJK81bFrigywSDDq9oT25eIkzoiqkyHCNtaySNZRyEfkh+AFKVAVw6RWDn10Sg7
         QdCtKwShAfafP1yXVB8pqInUse48Y+C0cS0EqDaBM3CZYLHUrRoVTHUyymoZkHU2kCGz
         ib80ENp0L1qbaFNwHvN7nSNCHd0sQhTgHkqTx1VVUvS2xWPYhGEtSsuD72dpW89Fst/s
         0gieAq5vCUQ8RiPzE95d2ADShmxVhGQA1GQCIaCf3PDAOG4T5ODY/3lF5ipG1Tqo3HQW
         YAlcAwHTyraIqEUPWHJfEDjIO1B4DZOBw77ZgadXWcoMFj4XmKuLsy02JjtPfHGX1rU+
         aGSQ==
X-Gm-Message-State: AOAM533jERyzcPKyFwEKsSLFcwz5dMMJ2W66XY+oymEQdtozlSdwxjNN
        kQauUm6SFPMNqe47OYRhTmhggEWaYpdcHRVGt4+/Cpl3yipy5A==
X-Google-Smtp-Source: ABdhPJw5cXYGO/PmcyNXnEXiAEjFZph4a2w9FPo/PvgvfdUkaxB431e95MNpQuNd02Eqy+QmxetCX57ROtUJWSrHop4=
X-Received: by 2002:aa7:da4c:: with SMTP id w12mr26991656eds.122.1595967408435;
 Tue, 28 Jul 2020 13:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200728075102.30807-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200728075102.30807-1-saiprakash.ranjan@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 28 Jul 2020 21:16:37 +0100
Message-ID: <CAJ9a7VjQCEJ80+7AZnZ-Mv5-EUzOZHnnYr2HeFpm7aktYt5fHA@mail.gmail.com>
Subject: Re: [PATCHv2] coresight: etm4x: Fix etm4_count race by moving cpuhp
 callbacks to init
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On Tue, 28 Jul 2020 at 08:51, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> etm4_count keeps track of number of ETMv4 registered and on some systems,
> a race is observed on etm4_count variable which can lead to multiple calls
> to cpuhp_setup_state_nocalls_cpuslocked(). This function internally calls
> cpuhp_store_callbacks() which prevents multiple registrations of callbacks
> for a given state and due to this race, it returns -EBUSY leading to ETM
> probe failures like below.
>
>  coresight-etm4x: probe of 7040000.etm failed with error -16
>
> This race can easily be triggered with async probe by setting probe type
> as PROBE_PREFER_ASYNCHRONOUS and with ETM power management property
> "arm,coresight-loses-context-with-cpu".
>
> Prevent this race by moving cpuhp callbacks to etm driver init since the
> cpuhp callbacks doesn't have to depend on the etm4_count and can be once
> setup during driver init. Similarly we move cpu_pm notifier registration
> to driver init and completely remove etm4_count usage.
>
> Fixes: 9b6a3f3633a5 ("coresight: etmv4: Fix CPU power management setup in probe() function")
> Fixes: 58eb457be028 ("hwtracing/coresight-etm4x: Convert to hotplug state machine")
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>
> Changes in v2:
>  * Rearrange cpuhp callbacks and move them to driver init (Suzuki K Poulose)
>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.c | 51 ++++++++++---------
>  1 file changed, 27 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
> index 6d7d2169bfb2..adb71987a1e3 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -48,8 +48,6 @@ module_param(pm_save_enable, int, 0444);
>  MODULE_PARM_DESC(pm_save_enable,
>         "Save/restore state on power down: 1 = never, 2 = self-hosted");
>
> -/* The number of ETMv4 currently registered */
> -static int etm4_count;
>  static struct etmv4_drvdata *etmdrvdata[NR_CPUS];
>  static void etm4_set_default_config(struct etmv4_config *config);
>  static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
> @@ -1403,12 +1401,9 @@ static int etm4_pm_setup_cpuslocked(void)
>  {

consider renaming this to etm4_pm_setup() and handing any cpu locking
inside the function.
In the circumstances - as part of the driver init rather than probe it
may be sufficient to call the cpuhp_setup functions without the
_cpuslocked suffix and allow the calls to lock the cpus as they are
made.
i.e. cpuhp_setup_state_nocalls_cpuslocked() => cpuhp_setup_state_nocalls()

>         int ret;
>
> -       if (etm4_count++)
> -               return 0;
> -
>         ret = cpu_pm_register_notifier(&etm4_cpu_pm_nb);
>         if (ret)
> -               goto reduce_count;
> +               return ret;
>
>         ret = cpuhp_setup_state_nocalls_cpuslocked(CPUHP_AP_ARM_CORESIGHT_STARTING,
>                                                    "arm/coresight4:starting",
> @@ -1432,17 +1427,11 @@ static int etm4_pm_setup_cpuslocked(void)
>
>  unregister_notifier:
>         cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
> -
> -reduce_count:
> -       --etm4_count;
>         return ret;
>  }
>
>  static void etm4_pm_clear(void)
>  {
> -       if (--etm4_count != 0)
> -               return;
> -
>         cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
>         cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
>         if (hp_online) {
> @@ -1498,22 +1487,12 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
>         if (!desc.name)
>                 return -ENOMEM;
>
> -       cpus_read_lock();
>         etmdrvdata[drvdata->cpu] = drvdata;
>
>         if (smp_call_function_single(drvdata->cpu,
>                                 etm4_init_arch_data,  drvdata, 1))
>                 dev_err(dev, "ETM arch init failed\n");
>
> -       ret = etm4_pm_setup_cpuslocked();
> -       cpus_read_unlock();
> -
> -       /* etm4_pm_setup_cpuslocked() does its own cleanup - exit on error */
> -       if (ret) {
> -               etmdrvdata[drvdata->cpu] = NULL;
> -               return ret;
> -       }
> -
>         if (etm4_arch_supported(drvdata->arch) == false) {
>                 ret = -EINVAL;
>                 goto err_arch_supported;
> @@ -1560,7 +1539,6 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
>
>  err_arch_supported:
>         etmdrvdata[drvdata->cpu] = NULL;
> -       etm4_pm_clear();
>         return ret;
>  }
>
> @@ -1598,4 +1576,29 @@ static struct amba_driver etm4x_driver = {
>         .probe          = etm4_probe,
>         .id_table       = etm4_ids,
>  };
> -builtin_amba_driver(etm4x_driver);
> +
> +static int __init etm4x_init(void)
> +{
> +       int ret;
> +
> +       cpus_read_lock();
> +       ret = etm4_pm_setup_cpuslocked();
> +       cpus_read_unlock();

See my comment above about rename and use of cpus_read_lock

Regards

Mike

> +
> +       /* etm4_pm_setup_cpuslocked() does its own cleanup - exit on error */
> +       if (ret)
> +               return ret;
> +
> +       ret = amba_driver_register(&etm4x_driver);
> +       if (ret) {
> +               pr_info("Error registering etm4x driver\n");
> +               goto err_init;
> +       }
> +
> +       return ret;
> +
> +err_init:
> +       etm4_pm_clear();
> +       return ret;
> +}
> +module_init(etm4x_init);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
> _______________________________________________
> CoreSight mailing list
> CoreSight@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/coresight



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
