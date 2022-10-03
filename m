Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80C5C5F3622
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 21:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiJCTIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 15:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiJCTIM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 15:08:12 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE40402E3
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 12:08:08 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id l1-20020a17090a72c100b0020a6949a66aso6206060pjk.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 12:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+opKGrhOUqcVAJ56jQAYAQQxrkDWCMy3QFNJ2l80w/o=;
        b=iqx0IJnPGoy9aM5EG3xNFTiCJTj3b7io2Tbam8YoH8krTRySekxPWhHrLC0KZ9eO+3
         w7ANftluNNQ/KDVAN9xtoS/EarwBcN3DMVSstVpOFvhJvMT6Ms13UXUyvNzTN3CG4sii
         p3KGFlpkl/1slQuV+n2A/2qXJpRRZIYDYYCA30oYc5Z3/PmgU2hcuJdQQz5zT2ziS60/
         Zt70RGYWxmgbZUd9sQeQCTq7ECgEn1FbMCblcQxhy423EMOZI3Nskh3hWxEzNjwdckq3
         kVTN4QGkvNEgKxGnm9N5OTyV0bbd6sROouvlmXZJ1ZDwHEnKxboz2shTv33xlMao2KkC
         rjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+opKGrhOUqcVAJ56jQAYAQQxrkDWCMy3QFNJ2l80w/o=;
        b=P5WpFfVGqNrRSwUOZfADTXInJdY/znw4quR6ahlZAXIGQ0G95qTg+qt/ffrhUflsI7
         SshlboTDHcDGAt3S2Cgn6mycqZtJyXbGLir16rowZsqIeCdUOx7NCBow40aP5UEuCYuk
         1Q7CLOsMP17yrnSW9Ns8fA4jVk1WUWnoerA4J0i3OEFl91eoQVzHTdn9lqJ3LT1PJiAf
         TaqCyfnD0oTMLkE7UyS9SyWwsT1wW7FfRGIzLWL1byWYugAgk64hTprbyKYWpdjnc2x+
         4l70fJWFcFXovKOEhALQN9eghLQD/RkE8qIPzLOnX73xhULR8iwBvN9SyEkvyNz+65Oz
         E9Xw==
X-Gm-Message-State: ACrzQf1wH3a8lBipBI6agY9FnZyRGLT5K7huaH+VtcNnnoFkyK0MjovD
        OATzWUDPI4AkX/p85DEWFF9o2LnPBqIPUnr1oHmvTuDwRB3QXQ==
X-Google-Smtp-Source: AMsMyM60kyTHKLFrlGcBEdUVL1SS4YwSyo4POBJxRszn3iqqyJkv/CnqO0sfFeXpUyen8RI5wYmVfrs0hSDUeAyUQNY=
X-Received: by 2002:a17:90b:1805:b0:20a:cd8e:abd with SMTP id
 lw5-20020a17090b180500b0020acd8e0abdmr1105690pjb.94.1664824087955; Mon, 03
 Oct 2022 12:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAB1t1CzwhBL3qu6GQZPwXBQG2YwFn9B+Aqi=81xgfA_2BCm=4A@mail.gmail.com>
 <CAB1t1CxNcKBQ8wFGQmSupA1ix0C9hOUYPN6Sa-ACFcG_b9mY3w@mail.gmail.com>
 <9acde2c8-ebd2-f603-c6df-98af9ba1c80d@linaro.org> <CAB1t1CwXh3t4xEL6DvRBVs1q8OX_dOwN2-bR_CWjMQhozSPC0Q@mail.gmail.com>
 <35d29103-98ff-cfb0-a354-90a36f52fb43@linaro.org>
In-Reply-To: <35d29103-98ff-cfb0-a354-90a36f52fb43@linaro.org>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Mon, 3 Oct 2022 21:07:56 +0200
Message-ID: <CAB1t1CyG7594zWg0agypYCrjMYkhxv1u-0wo1teK8cnE41d0jA@mail.gmail.com>
Subject: Re: msm8992-lg-bullhead-rev-101 resets in initramfs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ilya <ilya.manyugin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 2 Oct 2022 at 09:51, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/10/2022 19:10, Petr Vorel wrote:
> > On Sat, 1 Oct 2022 at 10:52, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 30/09/2022 23:39, Petr Vorel wrote:
> >>> I'm sorry, forget to add links.
> >>> Petr
> >>>
> >>> [1] https://gitlab.com/-/snippets/2420133
> >>> [2] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketos-mkinitfs/init_functions.sh#L514-523
> >>> [3] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketos-mkinitfs-hook-debug-shell/20-debug-shell.sh
> >>> [4] https://gitlab.com/-/snippets/2420128
> >>>
> >>> On Fri, 30 Sept 2022 at 23:30, Petr Vorel <petr.vorel@gmail.com> wrote:
> >>>>
> >>>> Hi all,
> >>>>
> >>>> [ sorry for sending mail twice, now as plain text. I should move away
> >>>> from gmail.com to something which allows to use mutt... ]
> >>>>
> >>>> Some releases after 5.17 bullhead rev 1.01 started to reset.
> >>>> I'm not sure which kernel version it started, because it might be
> >>>> caused by kernel config or dts changes.
> >>
> >> I propose to try to bisect it to specific commit in Linux kernel.
> > Hi Krzysztof,
> >
> > thanks for a suggestion, that's what I do for a non-embedded kernel (e.g.
> > x86_64, ppc64le, or even aarch64 used on server), because these works on
> > defconfig. But on qcom bullhead and angler devices, last few months I've come
> > across to few broken boots, although some of them were regressions others
> > depends a lot on particular config.  And since last 2 or 3 kernel releases it
> > does not even boot on defconfig. It's quite frustrating to bisect with cross
> > compilation (takes time) to realize that it boots with custom config. Last time
> > it took a week and I tried to find what actually caused phone reset,
> > unsuccessfully. That's why I'm asking before wasting more time.
> >
> > Of course with no suggestion I there is no other option than to do
> > bisecting again.
>
> I understand that false positives/negatives due to config changes are
> frustrating, but what stops you from using all the time your custom
> config? I was bisecting on embedded devices many times and the only slow
> parts in my case was booting device over network and few builds (like 6
> out of 12 steps, rest is fast due to ccache). There is basically no
> difference (except that booting over network) when bisecting on VM or my
> boards. Cross compilation does not take any more time than regular
> build, so maybe your setup could be improved?

Thank you for pointing out ccache, I'm using it as well.

Well, last time I wanted to speedup, thus I used custom config (with make
oldconfig) in the middle of bisecting.which was a mistake (obviously it's
important to keep the same config), which in the end took more time than
compiling with the defconfig.  The reason for not using defconfig was first
speedup (disabled unused soc etc).

Other time I found that problematic commit is a merge commit where both children
are merges, which means to test all commits of one merge on the top of the
other merge only to find that it's some kconfig option, but which?

My frustration was also that already working things are broken (probably due
wrong dts, which nobody found), but that's life (testing depends on the users
of particular hw).

OK, lesson learned + I need more patience :). (I've done several bisecting, but
not for embedded, bisecting for some kernel non-drive subsystem is way easier,
one can concentrate on the development).

Kind regards,
Petr


>
>
> Best regards,
> Krzysztof
>
