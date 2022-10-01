Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 704625F1E32
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 19:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJARK3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 13:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiJARKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 13:10:25 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCE9578B0
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 10:10:24 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y136so6829391pfb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ms+LR5v93QdHAkRtGMRe/J+ZkmSovxcRrEECZoKa8OI=;
        b=Oni0qlEVqFFXQXaB66fFL1WyTxNMBnxYONH1tsIeryO3TuSjBbpv8nkV21wsAIqpyB
         naZ7qMAyEmFv1e7mSqa0LSc2CrQmRuhBDtrbqZBhJiI7B4IL5uK+Myn+ysEAS6JkMNzW
         NRmul8Mwtts7Ssz+qr0QYI+2zLvabJQFMgRGLYX2Y+SJ6s1rRGj2mKKyiPA3Ef8NLzmW
         0/rd3eyvyawdrt/rIRr/++yh0ijdlJIU6o0zWi2PagqtLZFqnzupjpPm+0yqG/Engol+
         QxNGLGnxBn7rJQhe/PVTq4Sgtznn/v3Zyw8cJ6dtaeRykNBD1zDzptmVPFok/PMqXNhb
         gkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ms+LR5v93QdHAkRtGMRe/J+ZkmSovxcRrEECZoKa8OI=;
        b=n7pu3yhnQz2JrZ+59aRhVZds03lqsvvw6VcZfDuLPge8VGSmfIChbN1btN9A7mviFi
         Y6WZeehMmh5EdtGW27nvK4JEd9FqrPOdDTUg0wYLtOTOlsltxFpl9cpdSB/wzX/JC919
         YMlaYwdLaFmvJ0voz/8WdYLounDiZ/ushciBEwbLHnO0Hs+/8R6hjNOV5NXWnBVrEcns
         /Lndd2JAblKUNvD8yKg6ZKT6GCGGF+Z0bMMFI8eZGaZYV1ZNnwJ2k0rejsx9dSADByUX
         W3tAVP2JDNJUuzHOM0lq/UnCfhRPu6akGQdgsMmXhA7r9rKSjzC6C80v/jY3TRVhee1s
         a+ww==
X-Gm-Message-State: ACrzQf1hhcYJyNIZIAsw1UIU44oTOpWpFj0N7LdCKq2wo/1CHo97At+s
        c8jTzfGkdsn2U03a3AFEgC7Skc6xQiGgcEBN9MM=
X-Google-Smtp-Source: AMsMyM4/beWB1WKbe90HCMIB6lgDjA7GyrKX+n6BnYcFlpm6I/QqU4X10jMMe0LV9MffcWOxSQaFjOp8I8Xpn3tQJK0=
X-Received: by 2002:aa7:9083:0:b0:55f:9827:42e7 with SMTP id
 i3-20020aa79083000000b0055f982742e7mr3289032pfa.15.1664644224208; Sat, 01 Oct
 2022 10:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAB1t1CzwhBL3qu6GQZPwXBQG2YwFn9B+Aqi=81xgfA_2BCm=4A@mail.gmail.com>
 <CAB1t1CxNcKBQ8wFGQmSupA1ix0C9hOUYPN6Sa-ACFcG_b9mY3w@mail.gmail.com> <9acde2c8-ebd2-f603-c6df-98af9ba1c80d@linaro.org>
In-Reply-To: <9acde2c8-ebd2-f603-c6df-98af9ba1c80d@linaro.org>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Sat, 1 Oct 2022 19:10:13 +0200
Message-ID: <CAB1t1CwXh3t4xEL6DvRBVs1q8OX_dOwN2-bR_CWjMQhozSPC0Q@mail.gmail.com>
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

On Sat, 1 Oct 2022 at 10:52, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/09/2022 23:39, Petr Vorel wrote:
> > I'm sorry, forget to add links.
> > Petr
> >
> > [1] https://gitlab.com/-/snippets/2420133
> > [2] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketos-mkinitfs/init_functions.sh#L514-523
> > [3] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketos-mkinitfs-hook-debug-shell/20-debug-shell.sh
> > [4] https://gitlab.com/-/snippets/2420128
> >
> > On Fri, 30 Sept 2022 at 23:30, Petr Vorel <petr.vorel@gmail.com> wrote:
> >>
> >> Hi all,
> >>
> >> [ sorry for sending mail twice, now as plain text. I should move away
> >> from gmail.com to something which allows to use mutt... ]
> >>
> >> Some releases after 5.17 bullhead rev 1.01 started to reset.
> >> I'm not sure which kernel version it started, because it might be
> >> caused by kernel config or dts changes.
>
> I propose to try to bisect it to specific commit in Linux kernel.
Hi Krzysztof,

thanks for a suggestion, that's what I do for a non-embedded kernel (e.g.
x86_64, ppc64le, or even aarch64 used on server), because these works on
defconfig. But on qcom bullhead and angler devices, last few months I've come
across to few broken boots, although some of them were regressions others
depends a lot on particular config.  And since last 2 or 3 kernel releases it
does not even boot on defconfig. It's quite frustrating to bisect with cross
compilation (takes time) to realize that it boots with custom config. Last time
it took a week and I tried to find what actually caused phone reset,
unsuccessfully. That's why I'm asking before wasting more time.

Of course with no suggestion I there is no other option than to do
bisecting again.


Kind regards,
Petr

> Best regards,
> Krzysztof
>
