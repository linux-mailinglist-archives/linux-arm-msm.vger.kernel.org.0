Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63CE87030E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 17:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242083AbjEOPDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 11:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242115AbjEOPDV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 11:03:21 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34FB8E
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 08:03:06 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-61b5a6865dfso99634906d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 08:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684162985; x=1686754985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWRXE+phlaSRjBwP//6vD7S2kedBsIZjdIRbpXoQP68=;
        b=aWtGwrnii/Eh0b9S8w2v+hif6cIohehYrSYWOwsHVIRQHpHNL/oXomo8GUFzmdKTj8
         3DC5DHRcliQ0d0heglXw9krgGaSgfwxkWxh8g/ujboAWuABoOdokX7Wkm6i+T5yD5IgC
         dHiVpVb8RyyrNL2NKhFDnKsdgs8XENx7ix4VA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684162985; x=1686754985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWRXE+phlaSRjBwP//6vD7S2kedBsIZjdIRbpXoQP68=;
        b=ESQtbycs95JLsICirZdWCQ2MyaUgiF/YkO5Gj7Tzv7sDofpRojz6MRrG0E/2x2tYDe
         +4iwINhYxshWCV5xcwTOj3EV/aEulZMt4i9tVmIM4TfYgBpqYmi3vZVEP4GqtoaFsPVZ
         7PMflhdi2cGoUOThoWLHVpVwNYZV1p03G3Y2O+XgwGvivPgSagMb2DfdfxAe/+paG0wp
         tXRHDdGrCnJs0WzZacRj9iBwR4gnjY0iX4hnv7Gq5XwPGhhGlV5mMAZ1aBwN7TqQr4EL
         lIsuocd8L6rOCimya7LC3ysPcimd4gbsCkWG/ydw+/6W1iiglVmead7hcKal7lkBWNEE
         CoVA==
X-Gm-Message-State: AC+VfDz9mScR3c/Lvgo71Yr5vVGn97/Wwf7I/pGzB2xrEHuFc/m2AKjl
        XosxEfWnL8y+7nYwrnJKjParpM9F+77DYS9Wgjw=
X-Google-Smtp-Source: ACHHUZ6XvTIJ5RqgqD3HqOO2FwyR/f7HFCffnNgRHMZybyj3bUWSc9O4u7WN5jo3r/4UEfQEhknPPg==
X-Received: by 2002:a05:6214:234f:b0:623:6fc8:f461 with SMTP id hu15-20020a056214234f00b006236fc8f461mr2100380qvb.33.1684162984916;
        Mon, 15 May 2023 08:03:04 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id fy26-20020a05622a5a1a00b003f0af201a2dsm5451198qtb.81.2023.05.15.08.03.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 08:03:02 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f396606ab0so1489661cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 08:03:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1313:b0:3ef:302c:319e with SMTP id
 v19-20020a05622a131300b003ef302c319emr18569qtk.8.1684162980828; Mon, 15 May
 2023 08:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
 <CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com>
 <552345c5-b1e9-41f6-f275-b6eeeb51df25@linaro.org> <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
In-Reply-To: <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 15 May 2023 08:02:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
Message-ID: <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Caleb Connolly <caleb.connolly@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 15, 2023 at 7:42=E2=80=AFAM Amit Pundir <amit.pundir@linaro.org=
> wrote:
>
> On Sun, 14 May 2023 at 18:11, Caleb Connolly <caleb.connolly@linaro.org> =
wrote:
> >
> >
> >
> > On 13/05/2023 18:08, Amit Pundir wrote:
> > > On Fri, 24 Mar 2023 at 19:05, Douglas Anderson <dianders@chromium.org=
> wrote:
> > >>
> > >> This reverts commit 58973046c1bf ("regulator: qcom-rpmh: Use
> > >> PROBE_FORCE_SYNCHRONOUS"). Further digging into the problems that
> > >> prompted the us to switch to synchronous probe showed that the root
> > >> cause was a missing "rootwait" in the kernel command line
> > >> arguments. Let's reinstate asynchronous probe.
> > >
> > > Hi, the asynchronous probe is broken on Dragonboard 845c (SDM845)
> > > running AOSP (Android Open Source Project) with v6.4-rc1
> > > https://bugs.linaro.org/show_bug.cgi?id=3D5975.
> > > Can we please go back to synchronous probe.
> > >
> > > AOSP do not make use of rootwait, IIRC, but it is added by the
> > > bootloader anyway. And the device fails to boot AOSP regardless of
> > > "rootwait" bootarg being present or not.
> >
> > Could you try applying this diff to enable some log spam and let me kno=
w
> > what you get? I'm keen to try and figure this one out. My mail client
> > might crunch this a bit so I have pasted it here too
> > https://p.calebs.dev/ab74b7@raw
>
> These prints add just enough delay for the UFS probe to succeed that I
> can't reproduce the failure anymore.

I'd prefer doing at least a little debugging before jumping to a
revert. From looking at your dmesg [1], it looks as if the async probe
is allowing RPMH to probe at the same time as "qcom-vadc-common".
That's something that talks on the SPMI bus and is (potentially)
talking to the same PMICs that RPMH-regulator is, right? I'm by no
means an expert on how Qualcomm's PMICs work, but it seems plausible
that the "qcom-vadc-common" is somehow causing problems and screwing
up RPMH. Does that seem plausible to you?

If so, one interesting way to track it down would be to move around
delays. Put ~500ms sleep at the _end_ of vadc_probe(). Presumably that
_won't_ fix the problem. Now put a ~500ms sleep at the beginning of
vadc_probe(). Maybe that will fix the problem? If so, you can move the
delay around to narrow down the conflict. My wild guess would be that
vadc_reset() could be throwing things for a loop?

If the above doesn't work, maybe we could add more tracing / printouts
to see what is probing at the same time as RPMH?


[1] https://bugs.linaro.org/attachment.cgi?id=3D1135
