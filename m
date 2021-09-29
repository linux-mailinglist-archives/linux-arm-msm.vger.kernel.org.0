Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E61941C562
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 15:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344100AbhI2NTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 09:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344081AbhI2NTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 09:19:17 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4365FC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 06:17:36 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b26so8808386edt.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJLiiUeulvsE5Jpu0obENQGGvYdNvxhst0WjqmLYdUg=;
        b=v4YOzY3zC6nHOPzxbDz2rLrlZesaa8fIiHRxmFuNP2QGO6VtJVWDIV+pshTho5RnWf
         rsoqAlNkLsvprRAYGCqBF3ByuYuDoKYcqPODlO9vOIsLlU1tDjlKXCUrdsOOd/MxPSpn
         +VkPTIsG3TQUVstZP9VzxEGq/LgTcFW1woySilmgFdsHvSiW/0BxB9pSis8zwVQdpcTq
         bIfl++Tvy+17cMLlBrtmJ0CkjAkD5dCwii60pp3b1RqHd0yhds1IjLm9phacZd2jjnUU
         0ikndzbT8Bk4jfMwC76f1dDJSUJO9r89SJd53LvPcKuwNmszBsrIJPqT4Ftna3tH87Pf
         BTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJLiiUeulvsE5Jpu0obENQGGvYdNvxhst0WjqmLYdUg=;
        b=rmrEus+USpKqrEY9LL3Jf1O9CW00RSWCD0g75Ten1Kbro9tySUhVq64zT7AGpV7iLf
         wSJciZSGE4xTHWsE/9BrHxpk+QqlrgYKSznoPgVGhFPl4GZZ2fN3HIgXCotswVrL8ysZ
         qnuVE3c8REIhpvQs44QC14Uq2eyzruq8mGKTnpekcYYEHbhLigTvTDirJ13ex9w5KnC7
         WarCRn0B2NDNXQTfR+7KB5G6jLlxA++FhBHfCk1mG0SjVoT+EpslnjfGkHBREeEr+t/2
         BU/XGBwz7cIvl9gDEktRAzNa/6c/ELZtEAoXeO//XRQyBebAv9wiKKEIBgTjK1lxiFzn
         4EGQ==
X-Gm-Message-State: AOAM530fBFfKMH4yL9yn3p5crO2UBwcnVuB6QkTa4o3M9zWOxIJ4EWeF
        PsU0NqxAgsdYmMPILGgiIBUccjI1fGm0dGlc+Sz76A==
X-Google-Smtp-Source: ABdhPJyPDEvncO7qg4K5DedWjH02dF6b/iP9HhGB6aoRgnqmLyh9HPFi0+KHqSz5GwTR7RxcSwp5RMJrerMI0Ni2o7o=
X-Received: by 2002:a17:906:6d0:: with SMTP id v16mr13841146ejb.258.1632921435817;
 Wed, 29 Sep 2021 06:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210805140231.268273-1-thomas.perrot@bootlin.com>
 <f358044a-78d0-ad63-a777-87b4b9d94745@aleksander.es> <73A52D61-FCAB-4A2B-BA96-0117F6942842@linaro.org>
In-Reply-To: <73A52D61-FCAB-4A2B-BA96-0117F6942842@linaro.org>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Wed, 29 Sep 2021 15:17:04 +0200
Message-ID: <CAAP7ucL1Zv6g8G0SWAjEAjr6OSVTyDmvmFkH+vMmmBwOH2=ZUQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: increase timeout value for
 operations to 24000ms
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Thomas Perrot <thomas.perrot@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Mani,

> >> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> >> index 4dd1077354af..e08ed6e5031b 100644
> >> --- a/drivers/bus/mhi/pci_generic.c
> >> +++ b/drivers/bus/mhi/pci_generic.c
> >> @@ -248,7 +248,7 @@ static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> >>
> >>   static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
> >>      .max_channels = 128,
> >> -    .timeout_ms = 8000,
> >> +    .timeout_ms = 24000,
> >
> >
> >This modem_qcom_v1_mhiv_config config applies to all generic SDX24, SDX55 and SDX65 modules.
> >Other vendor-branded SDX55 based modules in this same file (Foxconn SDX55, MV31), have 20000ms as timeout.
> >Other vendor-branded SDX24 based modules in this same file (Quectel EM12xx), have also 20000ms as timeout.
> >Maybe it makes sense to have a common timeout for all?
> >
>
> Eventhough the baseport coming from Qualcomm for the modem chipsets are same, it is possible that the vendors might have customized the firmware for their own usecase. That could be the cause of the delay for modem booting.
>
> So I don't think we should use the same timeout of 2400ms for all modems.
>

Please note it's 24000ms what's being suggested here, not 2400ms.

> >Thomas, is the 24000ms value taken from experimentation, or is it a safe enough value? Maybe 20000ms as in other modules would have been enough?
> >
>
> It was derived from testing I believe.

Following your reasoning above, shouldn't this 24000ms timeout be
applied only to the Sierra Wireless EM91xx devices (which may have
custom firmware bits delaying the initialization a bit longer), and
not to the generic SDX24, SDX55 and SDX65?

If I'm not mistaken, Thomas is testing with a custom mhi_pci_generic
entry for the EM91xx; as in
https://forum.sierrawireless.com/t/sierra-wireless-airprime-em919x-pcie-support/24927.
I'm also playing with that same entry on my own setup, but have other
problems of my own :)


--
Aleksander
https://aleksander.es
