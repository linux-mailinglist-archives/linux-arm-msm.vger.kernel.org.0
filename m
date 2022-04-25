Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 883AC50E64E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 18:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243683AbiDYRA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 13:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242230AbiDYRAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 13:00:25 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AFA38DB6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 09:57:19 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2eba37104a2so155638537b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R8mpja/iP5Nbz85UZUacmFckb1rKaCSa5v9MWuGjwmo=;
        b=Hit4MsC3VLtzu1/T7YNypnAXxDMwh6/FO/R/vuKTm+Ho3INY0v2/PAb3fE0mIclNZi
         FEDRjJ+i63hMN/IS0EpPHCGoA3qFbxH+d83C05RhFEq5tR25Nn0u3dOtZXkMm5DFu640
         Jwwl7bMIdUkamkmwBO/mmyof+KAWX3IjLwd2WwrJIb4Vgm5VVbaTqM/ezvagFifUjjrR
         vp5OH0+o7Ywy9rIfn1n/saoKqXNk2LbdAHcdu+UkfYBBr8PfAroGLeMQ7XhzUOOH9JgI
         /AWJz2QCE7iNULQw0GETfAYlEV+WpZzgPVFYyVZgS2zWkiKnCMxmRpERA0F3NYO/Jx7p
         823Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R8mpja/iP5Nbz85UZUacmFckb1rKaCSa5v9MWuGjwmo=;
        b=BuQsFjcCaLpcHsaOxL6eiGae0kkgQgZaljZgY0VS0TVLdG8mYH+U+OB6tySEZnGNze
         pN/tRGu39YY57WC/0DIKgfGnKV5uHJSsmZCX4kfrSroaNltVa30r3krGm9hBjKDB3PTi
         EXrKvp8/YUYIua25pFAXVchSx58RmQtBZkSivzuQgQ+R9g5eDihPTFv0bimyNshiukoU
         Ep5dDV77ac9c8Qc+EXc8SxUETtUsaLj2zaj4gxxotBbe4pquvb80OFA5YjRj/oqKwrWW
         kOFwr3YACHDXqLOhcL60EH2s+MGxKzviP7WanhL3ekgu22rBNcwjyIhXACwr+5bHUIhO
         h58g==
X-Gm-Message-State: AOAM532NUKrCjlohigEK2BSB9bCOrqwnou/FJeI3o7ixQEsDNRABehGZ
        ZzSc7fmEaS522qeiuVg18KVtx6pL5wlV4RJlDIu63g==
X-Google-Smtp-Source: ABdhPJy0nyVhT7loR4EvoAaEfil6j6eVfaYuQhkhcf1G5PACqci5QE7e5Jchkk5HN+ptE3iO36YVUnShvWY0YlenZQU=
X-Received: by 2002:a81:3dc6:0:b0:2f8:f29:b429 with SMTP id
 k189-20020a813dc6000000b002f80f29b429mr1523022ywa.393.1650905838908; Mon, 25
 Apr 2022 09:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <1641749107-31979-1-git-send-email-quic_mkshah@quicinc.com>
 <164369277345.3095904.10944386444643776011.b4-ty@linaro.org> <CAMi1Hd2Sngya_2m2odkjq4fdV8OiiXsFMEX1bb807cWMC7H-sg@mail.gmail.com>
In-Reply-To: <CAMi1Hd2Sngya_2m2odkjq4fdV8OiiXsFMEX1bb807cWMC7H-sg@mail.gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 25 Apr 2022 22:26:42 +0530
Message-ID: <CAMi1Hd1phWki6EVUH0OPJwW3br2qGxVwFUSGY+9VsTVuRKUmAw@mail.gmail.com>
Subject: Re: (subset) [PATCH 00/10] Add APSS RSC to Cluster power domain
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ulf.hansson@linaro.org, Maulik Shah <quic_mkshah@quicinc.com>,
        quic_rjendra@quicinc.com, daniel.lezcano@linaro.org,
        rafael@kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Mar 2022 at 15:25, Amit Pundir <amit.pundir@linaro.org> wrote:
>
> On Tue, 1 Feb 2022 at 10:52, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> > On Sun, 9 Jan 2022 22:54:57 +0530, Maulik Shah wrote:
> > > This series patches 1 to 4 adds/corrects the cpuidle states/
> > > apps_rsc TCS configuration to make it same as downstream kernel.
> > >
> > > The patches 5, 6 and 7 adds apps_rsc device to cluster power domain such
> > > that when cluster is going to power down the cluster pre off notification
> > > will program the 'sleep' and 'wake' votes in SLEEP TCS and WAKE TCSes.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [01/10] arm64: dts: qcom: sm8150: Correct TCS configuration for apps rsc
> >         commit: 17ac8af678b6da6a8f1df7da8ebf2c5198741827
> > [02/10] arm64: dts: qcom: sm8250: Add cpuidle states
> >         commit: 32bc936d732171d48c9c8f96c4fa25ac3ed7e1c7
>
> Hi, These patches landed upstream and I see a boot regression on RB5
> with this sm8250 patch:
>
> [    T1] vreg_l11c_3p3: failed to enable: -ETIMEDOUT
> [    T1] qcom-rpmh-regulator 18200000.rsc:pm8150l-rpmh-regulators:
> ldo11: devm_regulator_register() failed, ret=-110
> [    T1] qcom-rpmh-regulator: probe of
> 18200000.rsc:pm8150l-rpmh-regulators failed with error -110
>
> Doesn't regress everytime but It is fairly reproducible. RB5 fails to
> boot on every alternate reboot or so. But the device boots everytime
> if I revert this patch.

Hi, I'm still waiting on a resolution/fix for this. I'm happy to test
or run any debug patches, if it would help narrow the issue down.
Fwiw, this is the defconfig I'm using
https://git.linaro.org/people/amit.pundir/linux.git/plain/arch/arm64/configs/rbX_aosp_defconfig?h=rb5-rpmh-regression

Regards,
Amit Pundir

>
> > [03/10] arm64: dts: qcom: sm8350: Correct TCS configuration for apps rsc
> >         commit: a131255e4ad1ef8d4873ecba21561ba272b2547a
> > [04/10] arm64: dts: qcom: sm8450: Update cpuidle states parameters
> >         commit: 6574702b0d394d2acc9ff808c4a79df8b9999173
> >
> > Best regards,
> > --
> > Bjorn Andersson <bjorn.andersson@linaro.org>
