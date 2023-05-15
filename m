Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67687038BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 19:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243684AbjEORec (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 13:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243327AbjEOReP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 13:34:15 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3411914E60
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 10:32:10 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-75939de402dso106674485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 10:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684171928; x=1686763928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xgEL+sawUUixp5JNd9RJjOXfXmGxkNHi3jdTQRXUWis=;
        b=QcGauwSQykxNsZH+dCZi8oXEOnwg+14nHJvD6n1AJ+uTRm0BOBWt749hgOYA4IBtEU
         hcRq7Lo0i3kb0hKsOmxgPoMkm1UGnOU0f+UPhxWwTW/4bjKYWFTwo6GaKX9dFAZYtpKG
         ophR/bBc/B7J0i/cMd6ucy8Sks0EAh2VOx24nOzsEhhQwyvGX4tYdj0M3tGv0i2eEJ20
         AthcZQhs9jBrQkBL45SoAMkOIW4BFhQJar2vtdK9wxy1PWKHU9pVzRn7hjuQJQ63kY4h
         pg+yrWwY4/fgA1e0nJarEjUPL8IFI3ZZoXLe2XhPD5j63nV41JoBbV08eO41AhT14gWf
         LD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684171928; x=1686763928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgEL+sawUUixp5JNd9RJjOXfXmGxkNHi3jdTQRXUWis=;
        b=PY1TZ3CkkKkHGI0+DfmHXNQ9h0KjvVt2u+qseSwDDSfPdnyzE6/rM9iMbY3BHmPuDp
         83ZZn3HdG/fH1CBEJp4yHXYj2jvtxsg+VZHRXnZRVnnM6B9yo81byAL7gv1J2yCGtIGu
         BOu3VDZhjcTmBtp8U6EPhL/FPpn5vztAMaePnzokyOUtI0BOMh1veG2ykVcNobbumGrq
         q59PLbCKlIPlJBfPBomD+7+3naI3xmXVOvZkSnKZbMEDnEPiXhB9BZuLha9q5nGYs/na
         qQGQBWfedNdZwx5gXF1cFNyUXSJOTZouxU8t06Fyar7b6fjNEldAOXSDlHhoeoevGPde
         CF3g==
X-Gm-Message-State: AC+VfDy0FipGiVpRDG7al+eVFRPfZTMVJJoF4wHHfxREhX5xyh9A+RWy
        LE5NpafQKXVFcR/jwXpYRhzavRB355j4nJBEBA8gyw==
X-Google-Smtp-Source: ACHHUZ68Aqs3w2+KA2JkVDaq1rYBfwwtrQeBaLDLnTkVRICW7aaDEwSLSFMXVDntz6ZNcr4d0RYHruk0Pfp8k8NIFdo=
X-Received: by 2002:a05:6214:da5:b0:621:6217:f528 with SMTP id
 h5-20020a0562140da500b006216217f528mr28114588qvh.30.1684171928702; Mon, 15
 May 2023 10:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230515145323.1693044-1-amit.pundir@linaro.org> <20230515160026.ynqsgu4wvsqxnj2h@ripper>
In-Reply-To: <20230515160026.ynqsgu4wvsqxnj2h@ripper>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 15 May 2023 23:01:31 +0530
Message-ID: <CAMi1Hd2-sZ9xFwq0-neoN+G93pv9Qgc94L71cwoimmpnVOkf6g@mail.gmail.com>
Subject: Re: [PATCH] Revert "regulator: qcom-rpmh: Revert "regulator:
 qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS""
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
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

+ Mark.

On Mon, 15 May 2023 at 21:26, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, May 15, 2023 at 08:23:23PM +0530, Amit Pundir wrote:
> > This reverts commit ad44ac082fdff7ee57fe125432f7d9d7cb610a23.
> >
> > This patch restores the synchronous probing for
> > qcom-rpmh-regulator because asynchronous probing broke
> > Dragonboard 845c (SDM845) running AOSP. UFSHC fail to
> > initialize properly and DB845c fails to boot regardless
> > of "rootwait" bootarg being present or not
> > https://bugs.linaro.org/show_bug.cgi?id=5975.
> >
>
> Looking at the first attachment, I would suggest that UFS fails because
> it's not able to get hold of its regulators, just as any other device
> with supplies would.
>
> The typical cause for rpmh timeouts is that you're no longer able to
> talk to the rpmh. Could you please attempt to trace the system and see
> what's happening in parallel that would cause such issue.

This is happening very early in the boot process (first stag init),
wherein init is supposed to load the kernel modules from ramdisk and
mount the partitions.

System does boot successfully 2/5 times, so this is definitely a
timing issue as Douglas also pointed out in the other thread. I'll try
to follow his suggestions and narrow down the issue further.

>
> Also note that such issues often also results in UFS timeouts, which
> results in the familiar UFS debug dumps.
>
>
> In the second log, the system crashes 51 seconds after rpmh probes,
> around the time where other sync_state is happening. This too would seem
> related to missing resource votes, but I would expect being a separate
> issue.
>
> PS. this is a patch in the regulator code, but I don't see Mark in the
> recipients list...

Sorry about that. I thought I had Mark copied over from the other
thread, after-all he was the one who suggested this patch, but I
didn't :facepalm:

Regards,
Amit Pundir


>
> Regards,
> Bjorn
>
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
> >  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> > index b0a58c62b1e2..30659922b0aa 100644
> > --- a/drivers/regulator/qcom-rpmh-regulator.c
> > +++ b/drivers/regulator/qcom-rpmh-regulator.c
> > @@ -1517,7 +1517,7 @@ MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
> >  static struct platform_driver rpmh_regulator_driver = {
> >       .driver = {
> >               .name = "qcom-rpmh-regulator",
> > -             .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> > +             .probe_type = PROBE_FORCE_SYNCHRONOUS,
> >               .of_match_table = of_match_ptr(rpmh_regulator_match_table),
> >       },
> >       .probe = rpmh_regulator_probe,
> > --
> > 2.25.1
> >
