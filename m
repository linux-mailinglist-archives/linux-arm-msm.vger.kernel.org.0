Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453BB3160E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 09:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbhBJIWw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 03:22:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233868AbhBJIWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 03:22:33 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1225C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 00:21:52 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id k4so1173300ybp.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 00:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65vR6SG2Bxgu7fYiRhCh88Vjzb2irw6GGGy0yalIXkM=;
        b=LPbRwhPQ6/yQZRRqLwpjkO9i9cYhEEfxPQrDEn0JhbQhI/zaZgHbTrB1WOrAsW48Nm
         8DnAO761rA7a0hr8Kz+pzOWJBzU9mEZn+REW8D/LtHnD07SW/TW6j48zTLeiUdla/XLj
         iJOCcCOU+O7dIIVzKrW2UwvoyFOcZSTDkOeTMjPls9pF2UcFI39WS7De+VRQk0QFQgwW
         IosoVwgFpBw0afved4rHh9++rElFdWER0kM9K55YZtccijBsujCCeVQyCavCVbjFcvHx
         znEXnaFjysy0sU1GlufpmXpMW4w2cb3O2PlTHXkMTJ6WqsDnhq97jj8a/U+dj5SRxv7F
         BpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65vR6SG2Bxgu7fYiRhCh88Vjzb2irw6GGGy0yalIXkM=;
        b=dnj49itRbLePI31pViWMyc1bJcygPXD6HzzE/GbeJc20geJ3ep+MWzi4MBhdRQyHEA
         jfvPfMFX9hW6pLOTjoKe435cV6mi5LR87fdTHuRN0jM3Ix0JfD2tuvrU7gkB5YTnh1BY
         z4XieRUp6BagU8uJqFzzf/ZZ+boxxc73Y/hf0dgHPRXhu5uK4HABhkjO7yoYodZa9GyL
         hup275LILFui9KcoltUxWRaRdLok3Rrx4eQJB1qm2HaRapWhKQRw2Dglk2TBchT8IW+U
         xBihawoSkOP0cE33jPa5YHIm/HWlfj1cmg0Z2HBQ/j7TgCZSLEt2azSO7PZgRa4S3Gd5
         BZIQ==
X-Gm-Message-State: AOAM533McxoLHedDOehVeQjokU9YaR9IPQRu2TlVRQ9hAGsX4hIpEzgL
        yUY39qoUSTJpFD+kaxfCAsZ6WQttf+4AnoEM2qGBLUw82ENHDQJ+
X-Google-Smtp-Source: ABdhPJyxSaGGlwuex18FZi5K/pPfGnm1HqMPKKiFTci/lion367u1Sx4ALhiN7Mx+aV+ZmbAQe0CtgNZMlo7WHnbNZU=
X-Received: by 2002:a25:2a84:: with SMTP id q126mr2506790ybq.167.1612945312267;
 Wed, 10 Feb 2021 00:21:52 -0800 (PST)
MIME-Version: 1.0
References: <1612426177-6611-1-git-send-email-amit.pundir@linaro.org>
 <889e6ed8-133a-9416-be3b-5b2a97ea7fbb@somainline.org> <CAMi1Hd3bgDaqsH+txFVEnBc9dsGbrgic5TK7uq4GwqqkM6seiw@mail.gmail.com>
 <9bbeb403-2937-aebd-91ff-5682f9112dee@somainline.org>
In-Reply-To: <9bbeb403-2937-aebd-91ff-5682f9112dee@somainline.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Wed, 10 Feb 2021 13:51:16 +0530
Message-ID: <CAMi1Hd24xe9sppQ_R20eF-W0uV2hsZZDZ=G-hYHxcarSB8YSLg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and
 panel bits
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, 8 Feb 2021 at 20:11, Konrad Dybcio <konrad.dybcio@somainline.org> wrote:
>
>
> >>> +      ports {
> >>> +              port@1 {
> >>> +                      endpoint {
> >>> +                              remote-endpoint = <&tianma_nt36672a_in_0>;
> >>> +                              data-lanes = <0 1 2 3>;
> >>> +                      };
> >>> +              };
> >>> +      };
> >> The endpoint has a label, you can simply use &dsi0_out {};.
> > I didn't get what you meant there. Care to point to some reference dts
> > snippet please?
>
> sdm845.dtsi, L4139 as of v5.11-rc7:
>
>
> port@1 {
>                         reg = <1>;
>                         dsi0_out: endpoint {
>                         };
>                     };
>
>
> This means you can essentially do:
>
> &dsi0_out {
>
>     remote-endpoint = <&tianma_nt36672a_in_0>;
>     lanes = <0 1 2 3>;
>
> };
>
>
> in your dt :)
>

Thank you. Added in v3.

>
> >>> +              vddpos-supply = <&lab>;
> >>> +              vddneg-supply = <&ibb>;
> >> With Angelo's latest series [1] merged in, I reckon you should explicitly configure lab/ibb (like in [2]),
> >> as wrong settings (which CAN BE SET BY THE BOOTLOADER in some instances!!) can lead to hardware damage.
> > So iirc in the case of beryllium device, these regulators are pre set
> > by the bootloader and I can't find any reference of we
> > setting/resetting it explicitly to switch ON the panel and display. So
> > far default lab/ibb nodes are working fine for us and I'm hesitant to
> > tinker around anything regulator related that can potentially damage
> > the hardware. Having said that, I do see lab/ibb nodes being set in
> > the downstream dts, with relevant soft-start and discharge-resistor
> > properties and I can try switching to that once the new lab/ibb
> > changes land upstream.
> >
> > Regards,
> > Amit Pundir
> >
> I understand your concerns, however we actually did find out that at least one device had LAB/IBB set up by the bootloader in a way that could potentially damage the electronics, so I'm just making you aware. If it works as-is, it's probably OK.

Device seem to be booting fine with downstream labibb regulator node
changes, hence added them in v3 as well. Smoke tested on
5.11.0-rc7-next-20210209.

Regards,
Amit Pundir

>
>
> Konrad
>
