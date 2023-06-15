Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47F3C731D76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 18:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbjFOQK3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 12:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjFOQK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 12:10:28 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9619CEC
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 09:10:26 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6237faa8677so27340206d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 09:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686845425; x=1689437425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qEQOGjvtLEgX2ChKfpQ6c19qlkbG0UrnxRJ/AQu+f/Y=;
        b=UOgtRCcgPQXVs2Hv7ksrJGuVS9PxRDds8Mz4VaeDBz6lvGw3H9y2IdorytzWGM6fI1
         M5hEUF5EyzgWxFSnS2WRdDrD21gh35eC/+7yE4jSgz8vH5737zlAWKDuIW8j8hXy3Fmh
         Cu/RsQ6hhmIz+R9oDeGhWzh5GeDcD+7VeUOOT2WoEFG+wn6Eo0DpxZK8CI1BnfrJ3gdV
         WLGqMfqGD9wyDvXPqkjXdL4XrgttLUJACbG0gikJxlxslQs4u6gpGhINKAElG9wzxq4I
         t8CSm5ohNsJ3TsnMHU/gzp260HGhlA1sj6TfErpGH+n9hsiVxdeJtylTUX+zmE8m3YyQ
         E0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686845425; x=1689437425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEQOGjvtLEgX2ChKfpQ6c19qlkbG0UrnxRJ/AQu+f/Y=;
        b=ldzqf69uCD4xuzie5A4hvGYz5o1jPzIn1qi4QtlYtRTmwcOCFVh/drzaQG6nwk+YMG
         tB+ZhEfLBt0yt+3lClYxQaDMLWmgA1PLHTmiUX9BI4v5LUY/5ceGqfRYkyTRduYoCYB7
         DTEsAgzsW+I5VGkzFiHY3+RiEQ46072cTXeidptNk5fO7n/dAM0s2heTCS9o9MBRc+/n
         XL+Z7lsMeZT6jOuqXMdweFfMEcgn/1B0Sltg5vcEcBu0kV8v0VR7LTi1lckcH8m4R+Ys
         kGwLWcOknMLCF+oJs4Tstg1YZqTaxxphdkVpSMNwc6G9apH+ObiZN3HnESV+g5CK//qE
         rBAQ==
X-Gm-Message-State: AC+VfDwcYx7RDUwzebspyUuJHNFsBZ2CM+83iihCY7QuE6On7oMZHXPc
        0I6g974WMkIpoLQRz//5eIGF2ntEEJdW7P1a1Yrqxg==
X-Google-Smtp-Source: ACHHUZ5oO0v2P6oftn2D5O6PLRn4KeEvcu9G53VZIM9JMbbtKiD20OhZwZ4oEdzR6hH7rl/IupYwIY0bFAq9/p1iQm0=
X-Received: by 2002:a05:6214:1941:b0:62f:eed1:4781 with SMTP id
 q1-20020a056214194100b0062feed14781mr4050301qvk.21.1686845425624; Thu, 15 Jun
 2023 09:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info> <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
 <CAMi1Hd3Cv1i06NhpY6Jqu7OvMpOdzTj6nTEMJNWLrMwMLsugZA@mail.gmail.com>
 <CAMi1Hd0=KV7k82ARadF45nqX+Cv6zPLCxfDvOyAPeXiFd8jpVA@mail.gmail.com> <0ec6c988-d678-c96c-a7a2-af38e6701404@linaro.org>
In-Reply-To: <0ec6c988-d678-c96c-a7a2-af38e6701404@linaro.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Thu, 15 Jun 2023 21:39:49 +0530
Message-ID: <CAMi1Hd33_Ccxkf9C5_QBO3tvOZcGnYh+_CKcACUtoY2qAuOzRA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Mark Brown <broonie@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 15 Jun 2023 at 20:33, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/06/2023 15:47, Amit Pundir wrote:
> > On Thu, 15 Jun 2023 at 00:38, Amit Pundir <amit.pundir@linaro.org> wrote:
> >>
> >> On Thu, 15 Jun 2023 at 00:17, Krzysztof Kozlowski
> >> <krzysztof.kozlowski@linaro.org> wrote:
> >>>
> >>> On 14/06/2023 20:18, Linux regression tracking (Thorsten Leemhuis) wrote:
> >>>> On 02.06.23 18:12, Amit Pundir wrote:
> >>>>> Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
> >>>>> list to workaround a boot regression uncovered by the upstream
> >>>>> commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
> >>>>> qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").
> >>>>>
> >>>>> Without this fix DB845c fail to boot at times because one of the
> >>>>> lvs1 or lvs2 regulators fail to turn ON in time.
> >>>>
> >>>> /me waves friendly
> >>>>
> >>>> FWIW, as it's not obvious: this...
> >>>>
> >>>>> Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com/
> >>>>
> >>>> ...is a report about a regression. One that we could still solve before
> >>>> 6.4 is out. One I'll likely will point Linus to, unless a fix comes into
> >>>> sight.
> >>>>
> >>>> When I noticed the reluctant replies to this patch I earlier today asked
> >>>> in the thread with the report what the plan forward was:
> >>>> https://lore.kernel.org/all/CAD%3DFV%3DV-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1hUX9DUMkkxdg@mail.gmail.com/
> >>>>
> >>>> Dough there replied:
> >>>>
> >>>> ```
> >>>> Of the two proposals made (the revert vs. the reordering of the dts),
> >>>> the reordering of the dts seems better. It only affects the one buggy
> >>>> board (rather than preventing us to move to async probe for everyone)
> >>>> and it also has a chance of actually fixing something (changing the
> >>>> order that regulators probe in rpmh-regulator might legitimately work
> >>>> around the problem). That being said, just like the revert the dts
> >>>> reordering is still just papering over the problem and is fragile /
> >>>> not guaranteed to work forever.
> >>>> ```
> >>>>
> >>>> Papering over obviously is not good, but has anyone a better idea to fix
> >>>> this? Or is "not fixing" for some reason an viable option here?
> >>>>
> >>>
> >>> I understand there is a regression, although kernel is not mainline
> >>> (hash df7443a96851 is unknown) and the only solutions were papering the
> >>> problem. Reverting commit is a temporary workaround. Moving nodes in DTS
> >>> is not acceptable because it hides actual problem and only solves this
> >>> one particular observed problem, while actual issue is still there. It
> >>> would be nice to be able to reproduce it on real mainline with normal
> >>> operating system (not AOSP) - with ramdiks/without/whatever. So far no
> >>> one did it, right?
> >>
> >> No, I did not try non-AOSP system yet. I'll try it tomorrow, if that
> >> helps. With mainline hash.
> >
> > Hi, here is the crash report on db845c running vanilla v6.4-rc6 with a
> > debian build https://bugs.linaro.org/attachment.cgi?id=1142
> >
> > And fwiw here is the db845c crash log with AOSP running vanilla
> > v6.4-rc6 https://bugs.linaro.org/attachment.cgi?id=1141
> >
> > Regards,
> > Amit Pundir
> >
> > PS: rootfs in this bug report doesn't matter much because I'm loading
> > all the kernel modules from a ramdisk and in the case of a crash the
> > UFS doesn't probe anyway.
>
> I just tried current next with defconfig (I could not find your config,
> neither here, nor in your previous mail thread nor in bugzilla). Also
> with REGULATOR_QCOM_RPMH as module.
>
> I tried also v6.4-rc6 - also defconfig with default and module
> REGULATOR_QCOM_RPMH.
>
> All the cases work on my RB3 - no warnings reported.
>
> If you do not use defconfig, then in all reports please mention the
> differences (the best) or at least attach it.

Argh.. Sorry about that. Big mistake from my side. I did want to
upload my defconfig but forgot. Defconfig plays a key role because, as
I mentioned in one of my previous email, it is a timing/race bug and
if I do any much changes in my defconfig (i.e. enable ftrace for
example or as little as add printk in qcom_rpmh_regulator code) then I
can't reproduce this bug. So needless to say that I can't reproduce
this bug with default arm64 defconfig.

Please find my custom (but upstream) defconfig here
https://bugs.linaro.org/attachment.cgi?id=1143 and prebuilt binaries
here https://people.linaro.org/~amit.pundir/db845c-userdebug/rpmh_bug/.
"fastboot flash boot ./boot.img-6.4-rc6 reboot" and/or a few (<5)
reboots should be enough to trigger the crash.

I have downloaded the initrd from here
https://snapshots.linaro.org/96boards/dragonboard845c/linaro/debian/569/initrd.img-5.15.0-qcomlt-arm64
but edited ramdisk/init to run "load_module" function early in the
boot and ramdisk/conf/initramfs.conf has "MODULES=list" instead of
"MODULES=most", where all the kernel modules are listed at
/etc/initramfs-tools/modules.

Regards,
Amit Pundir
