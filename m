Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F242519AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 15:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgHYNbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 09:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbgHYNbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 09:31:39 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA40C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 06:31:39 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h15so5992398wrt.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ox8QK/IzGS/2yKfoGq07DsTXf8p9QMN6eWLRJ1J4AIg=;
        b=mNQPJdy2gY4XWix22ixlqX4gAjdlU3M6HmAifc6qwgvG8KDB2RtfoojcjwoOxRsoWq
         85QxMnS8xmEJEqZvqPK/uY6IgabsmL4poARlffOF/1WY8IYEQKHCl62/BFfsRNCvlWjB
         I3rUkJvXf1HSY0ud3Qpk5ukGsLaI/X+7wS4xUrvPjbR/MU+sxSfkPKSnHnrg4Mut2sJr
         BnUQy7ewuSeizkEy57yes+sJYFbk4cyE1vir/mU+YfdTBYWp72iZRK+87WVKqyFbyjyR
         V77xU+EBKOcwvQvdHa4QUUJpH2Q2QxR91rSwAR/BFUPm2HO+TAHVcQu3vXxTqnQiNEWm
         I50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ox8QK/IzGS/2yKfoGq07DsTXf8p9QMN6eWLRJ1J4AIg=;
        b=Mx178qyMqW/mquZhelBFyQs1muB3Ut0JUutr0B0fGkfL5c54L+b6XAW5cyuUFEWXyE
         MbqpBpyfz4sG0apPBqaOWJdG9Oc/2LkjHFP3FgdPu89mhVzfrJ6N+LVWNiIRm9Pdt1m6
         9SgbzrgsdkUPXIRCeKqeGNvXiAu11KfwVyfN7MFSROZ38pR6Hymp0vp2M4HDEBcUyT6S
         8mF6yoMjyCraMLOYodTjiEaFQ9JcqRB/HiZkwB1Gl1PmJ4C+yZSjFP9V21iSzAr/4sSA
         hlx4PI8tRt1G54pQhZ0E/dXrKhsicx2TrClss+vPLlsd2/nwd7Gm7Qr4DFVcXjJVTrLQ
         AAaw==
X-Gm-Message-State: AOAM532EQQI8IDURhoyOBMc30iSyfUOdLYgdmHLwdNR+Mt0dXC/Y+F00
        rpVqMLznoW19VBa7xvp7eoM6g+gf4EL/JVv79JST1A==
X-Google-Smtp-Source: ABdhPJzUeQqJA/novRqHBseQlf6eWrBox45GDrOW28wDGMRdDNkXczDDP6iZM3MA8UOhbFpSCcNnxyXb9cIU+oTD434=
X-Received: by 2002:a5d:688d:: with SMTP id h13mr10296178wru.176.1598362297868;
 Tue, 25 Aug 2020 06:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <1598029961-2474-1-git-send-email-amit.pundir@linaro.org> <23c4191e-4d64-80d8-e688-27d004729ea1@gmail.com>
In-Reply-To: <23c4191e-4d64-80d8-e688-27d004729ea1@gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Tue, 25 Aug 2020 19:01:01 +0530
Message-ID: <CAMi1Hd0=FXSPk+UXte4Etq5p0Ths9rkt9Uuup1OOLD6qzT=XQA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

On Sat, 22 Aug 2020 at 02:51, Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> Hi
>
> First of all, sorry if anybody sees this twice. I've been messing with Thunderbird lately.
>
>
>
> > dtb-$(CONFIG_ARCH_QCOM)       += sdm845-cheza-r3.dtb
> > dtb-$(CONFIG_ARCH_QCOM)       += sdm845-db845c.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sdm845-beryllium.dtb
>
> [B]eryllium should come before [C]heza, no? Also, aren't the non-development boards supposed to include the vendor name? i.e. sdm845-(xiaomi/poco)-beryllium.dtb

Ack. I didn't pay attention to that part. I'll fix that.

>
>
> > +     model = "Xiaomi Technologies Inc. Beryllium";
>
> At least with Xperias, we settled on setting the model property to the "pretty" name, in this case Poco F1

Ack.

>
>
> > +     pm8998-rpmh-regulators {
> > +             compatible = "qcom,pm8998-rpmh-regulators";
> > +             qcom,pmic-id = "a";
> > +
> > +             vreg_l1a_0p875: ldo1 {
>
> I think you forgot to include (regulatorname)-supply properties which should cause havoc with all things regulators..

I didn't know that. Thanks for pointing that out. I just copied db845c
dts and started removing the nodes/properties which I didn't seem fit.
There is a very good probability that I goofed up big time.

FWIW in my limited testing so far (Booted AOSP to UI, with working
Touchscreen/BT/WiFi/Audio with out-of-tree drivers [1]), I didn't run
into issues with mainline (v5.9-rc1) or Android GKI (v5.4.58). May be
I just got lucky. I'll check up on the usage of (regulatorname)-supply
properties.

>
>
> > +             vreg_l1a_0p875: ldo1 {
> > +                     regulator-min-microvolt = <880000>;
> > +                     regulator-max-microvolt = <880000>;
> 0p88? Unless it's a PMIC limitation.. Please also confirm names for the rest of the regulators.
>
> Also why are there so few regulators? And none from pmi8998? Are the rest WIP/coming in a followup commit, or are they disabled on this board? AFAICS you only include SoC/PMIC DTs which would suggest they should be there.

I intend to add more regulators and feature nodes in follow up commits.

>
>
> > +/* Reserved memory changes from downstream */
>
> Wouldn't it look better if you included that in the main {} node instead of reopening it in the middle of the file? I mean, it works, but let's hear what others have to say.

Ack. I'll fix that if necessary.

>
>
> > +                      * It seems that mmc_test reports errors if drive
> > +                      * strength is not 16 on clk, cmd, and data pins.
>
> You say that, but then you set "drive-strength = <10>;" for cmd and data, please confirm it's intentional.

In sync with db845c as well as downstream dts but I'll check on this as well.

>
>
> > +&ufs_mem_hc {
>
> UFS comes before USB alphabetically.

Ack. I'll add them alphabetically if that is the common norm.

Regards,
Amit Pundir
[1] https://github.com/pundiramit/linux/commits/beryllium-mainline


>
>
> > +&ufs_mem_phy
>
> Ditto
>
>
> > +&qup_uart6_default
>
> Ditto
>
>
> Konrad
