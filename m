Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A28B558AC47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 16:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240794AbiHEORR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 10:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236383AbiHEORQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 10:17:16 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461FC4199B
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 07:17:15 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id q7so3149010ljp.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TqUhgJ+jvH7jEicBoUaEwBizPCDRIzK/UAJkO3NZXhc=;
        b=weVRIYjpDKmyCCH0XnG1ioSIqzqwl1aXQAgFONCckMXncY0ZV/+9mTjegQjxFA82a4
         aPDYlhS7BfOynXCrOq6N6o4jPBOqmcKqGtijvAmfA64k5o8xIQtcx9BeOayAxc8oYvfn
         9yzFN+IhYiIhveLE3ZjjNawdGmnfVpDBhxvMlUvYCfsrTRVEaQr1S9TOeQIIBRjSjos3
         7g4TGLIdG3UduAzzS9xX5OMBPpq/8wZKELCCa729Jt9zITa3dR7T1ibLo9PlsCnMwW4Y
         YLuzBf7ARM+UjfPwe1ChO3dF5X9QUM0tDiUZ6REFYLAnKGhHpGz1KSdMWYu3MhxNdRJs
         +9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TqUhgJ+jvH7jEicBoUaEwBizPCDRIzK/UAJkO3NZXhc=;
        b=7hrLysENgcM24N51/JWkuva+ltaZG40SXne+E/j5T7HFyAvXAgZDzeWDJ3Y+U1DXIO
         G7YeiKfcKozQcxf8fU3SfbMWySbcWFRgo+0bcBYDiKUyMY9y8LZ91dPvAMxpJmI/wwpQ
         kXIogGkKsSbNRJXcCGwoCvkBQY82OPWyfzTno+lTfCRa9oab+uxCUjBH92sPbjsMB6xJ
         wKASJJK2o2ro8Uah5I8uKEhJ44o2tVZP4npFZ8CHw2WPAJo4bvUYWzG+zt8ZS0+JLqGQ
         VI0puXq7qCWf1P+rwQashwmunAxNvqgyP3jxoa+HNPvpKcSs0JUhfhyS5MiVZD/4BQWm
         g6kQ==
X-Gm-Message-State: ACgBeo1KWDevta8J56q/7UOHG7JaSsW8HCqG9rgfDpek+AzmptqjAbcJ
        ye5XYhsW1yMpTkWt7gSJGQ26jxj3pFJg4Fmv+FA97w==
X-Google-Smtp-Source: AA6agR4swqJjCQLWWZgZINvcORcN9y8sgCj/bObt7onGoXmUuLMKko6tSKp7BAsVcO8374D4SjI4Uf47072NOsjGYlA=
X-Received: by 2002:a2e:8885:0:b0:25e:bf9b:2de2 with SMTP id
 k5-20020a2e8885000000b0025ebf9b2de2mr121774lji.367.1659709033657; Fri, 05 Aug
 2022 07:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220804130750.3706897-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220804130750.3706897-1-dmitry.baryshkov@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 5 Aug 2022 16:16:37 +0200
Message-ID: <CAPDyKFrqxUS7HHcYRatqpnH9FyG5BSQX2KLsSJ-sPXSENpNzug@mail.gmail.com>
Subject: Re: [PATCH v2] firmware/psci: Print a warning if PSCI doesn't accept
 PC mode
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 Aug 2022 at 15:07, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The function psci_pd_try_set_osi_mode() will print an error if enabling
> OSI mode fails. To ease debugging PSCI issues print corresponding
> message if switching to PC mode fails too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Seems reasonable to me!

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> This is a replacement for [1], now moving the warning from
> psci_set_osi_mode() callers to the function iself.
>
> https://lore.kernel.org/all/20220727182034.983727-1-dmitry.baryshkov@linaro.org/
>
> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 4 +---
>  drivers/firmware/psci/psci.c          | 2 ++
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index 3db4fca1172b..821984947ed9 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -124,10 +124,8 @@ static bool psci_pd_try_set_osi_mode(void)
>                 return false;
>
>         ret = psci_set_osi_mode(true);
> -       if (ret) {
> -               pr_warn("failed to enable OSI mode: %d\n", ret);
> +       if (ret)
>                 return false;
> -       }
>
>         return true;
>  }
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index cfb448eabdaa..1628f1edef4a 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -163,6 +163,8 @@ int psci_set_osi_mode(bool enable)
>                         PSCI_1_0_SUSPEND_MODE_PC;
>
>         err = invoke_psci_fn(PSCI_1_0_FN_SET_SUSPEND_MODE, suspend_mode, 0, 0);
> +       if (err < 0)
> +               pr_warn("failed to set %s mode: %d\n", enable ? "OSI" : "PC", err);
>         return psci_to_linux_errno(err);
>  }
>
> --
> 2.35.1
>
