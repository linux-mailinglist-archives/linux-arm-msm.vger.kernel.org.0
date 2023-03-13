Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 804B56B82AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 21:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjCMU1O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 16:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjCMU1C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 16:27:02 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2ABA898F3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:26:57 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id x3so53655394edb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1678739216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSh3Q78uGzBZic3Pgny5t46fCYa+1090Nqgh7L4loaw=;
        b=o8r7kHqgoKtUWpTmVjNmyi9FSPOIZzj/SU+lJsz0B/rCoOK2p1HYNLbZHDgAvdrQaJ
         ve2CbTOeSI9wdcVTCgf8fA6pTjbXGsK61xn+vk2PKTm6u7xNtr6CGZOOcvb9P+WpjlOg
         HAlPRw75DByP3k67B2R/7X7j/YEGbtXtch0RZtX/v3dZvaADhxQTeA+E1lp0NCz/2p+E
         xRewI0RtFAf0SnGIKyILyxPgFJaO1mF8/CE1sDKz75fMWuQjnaEVi5AokUP7szB1UHrU
         62RNipd8qb5BFUbnZkyKrb+9nsnxRnVWck3eVfJAlwXmYLWvx7j1kysFTkrPu7LultEt
         Nk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678739216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSh3Q78uGzBZic3Pgny5t46fCYa+1090Nqgh7L4loaw=;
        b=vPqH1DEDpm0h0hImbcGyrxbauF+FyAXAF6jxTYeGiYieKMhz+qLXvCu13oy+AkuLPD
         Ocwfw8CN9yB8hfip3TrAM/g8KZzAiJRMPIzRSPtoSdZpTS1VgRH52Z74V21UaM5Rokfa
         U2uEYCyN+HQRyp2Y0OXva4LAi4wnxMS+1zL0VfijTPsrU1WQmQVrM36sT8Ee9mCal2tL
         CV3zaAsAYg+txHYB8nZ6csxlQmXR2oETsULjnIteg8vpvdAnR/hBP0YpfhCwhTiovU12
         O0WnQHK+3frjlLG16n+PAqZhhVbi5dGimsSPQ4ySgekeKqLidSsp3kCS3NS1wGgOZ1jB
         jSzA==
X-Gm-Message-State: AO0yUKXU8bVLuAuBCU6KYj7YyarfTNe37MHqruYmnX8gUPv8WJUMa9I0
        YCVYdDmBtyQwWNKcl81DxC7VHO3tNOmdPgnl9j76z7MoYAtYdlD5fLnLVw==
X-Google-Smtp-Source: AK7set/SKGaMGbptgTfcUjJ+x/2+8zfQIJiAfKQ2FzFt+fz/6uPNIRd9YPRNWiyzDV2ksbMKUlInzG5HVma+jLZHvgM=
X-Received: by 2002:a17:906:b046:b0:8b1:77bf:79dc with SMTP id
 bj6-20020a170906b04600b008b177bf79dcmr13682274ejb.14.1678739216480; Mon, 13
 Mar 2023 13:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <ZA8fPk1EM2lDKNA/@x13s> <CAKXuJqjrQY99immnmt_xs_V88YcpN=P+biFCO4wWTWFwaXWyLQ@mail.gmail.com>
In-Reply-To: <CAKXuJqjrQY99immnmt_xs_V88YcpN=P+biFCO4wWTWFwaXWyLQ@mail.gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Mon, 13 Mar 2023 15:26:44 -0500
Message-ID: <CAKXuJqiAwcGrK7naBzJRx7NKKYMEHRwDygSnWuTPUmbWzqqRwg@mail.gmail.com>
Subject: Re: sc8280xp: How to get sound working?
To:     Brian Masney <bmasney@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 13, 2023 at 3:23=E2=80=AFPM Steev Klimaszewski <steev@kali.org>=
 wrote:
>
> Hi Brian,
>
> On Mon, Mar 13, 2023 at 12:07=E2=80=AFPM Brian Masney <bmasney@redhat.com=
> wrote:
> >
> > I'm trying to get the sound working on my x13s with Fedora 37. I have
> > qrtr and pd-mapper running, and I have working battery status.
> >
> > I downloaded SC8280XP-LENOVO-X13S-tplg.bin from Srini's git repo at [1]=
.
> > Everything starts to probe:
> >
> > [   66.572719] qcom-soundwire 3210000.soundwire-controller: Qualcomm So=
undwire controller v1.6.0 Registered
> > [   66.579051] qcom-soundwire 3250000.soundwire-controller: Qualcomm So=
undwire controller v1.6.0 Registered
> > [   66.579886] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (o=
ps wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
> > [   66.579907] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (o=
ps wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
> > [   66.580466] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1,=
 Variant: WSA8835_V2
> > [   66.581646] qcom-soundwire 3330000.soundwire-controller: Qualcomm So=
undwire controller v1.6.0 Registered
> > [   66.582913] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1,=
 Variant: WSA8835_V2
> > [   66.585710] wsa883x-codec sdw:0:0217:0202:00:2: WSA883X Version 1_1,=
 Variant: WSA8835_V2
> > [   66.598032] snd-sc8280xp sound: ASoC: Parent card not yet available,=
 widget card binding deferred
> > [   66.603140] ALSA: Control name 'stream1.vol_ctrl1 MultiMedia1 Playba=
ck Volume' truncated to 'stream1.vol_ctrl1 MultiMedia1 Playback Volu'
> > [   66.603228] ALSA: Control name 'stream2.vol_ctrl2 MultiMedia2 Playba=
ck Volume' truncated to 'stream2.vol_ctrl2 MultiMedia2 Playback Volu'
> > [   66.605330] input: SC8280XP-LENOVO-X13S Headset Jack as /devices/pla=
tform/sound/sound/card0/input11
> >
> > And then a bunch of these errors come through:
> >
> > [   66.719630]  MultiMedia1 Playback: ASoC: no backend DAIs enabled for=
 MultiMedia1 Playback
> > [   66.719641]  MultiMedia1 Playback: ASoC: error at dpcm_fe_dai_prepar=
e on MultiMedia1 Playback: -22
> >
> > x13s:~$ aplay -l output
> > **** List of PLAYBACK Hardware Devices ****
> > card 0: SC8280XPLENOVOX [SC8280XP-LENOVO-X13S], device 4: MultiMedia1 P=
layback (*) []
> >   Subdevices: 1/1
> >   Subdevice #0: subdevice #0
> > card 0: SC8280XPLENOVOX [SC8280XP-LENOVO-X13S], device 5: MultiMedia2 P=
layback (*) []
> >   Subdevices: 1/1
> >   Subdevice #0: subdevice #0
> >
> > Any suggestions?
> >
> > Also if anyone happens to stumble upon this message via a search engine=
:
> > Fedora has all of it's firmware xz compressed. To get this far:
> > qcadsp8280.mbn, qccdsp8280.mbn, and *.jsn will need to be decompressed.
> > pd-mapper needs to be updated to handle this. I've added this to my tod=
o
> > list to fix, but it may be a little while before I get to it.
> >
> > [1] https://git.linaro.org/people/srinivas.kandagatla/audioreach-topolo=
gy.git/tree/prebuilt/SC8280XP-LENOVO-X13S-tplg.bin
> >
> > Brian
> >
>
> Do you have the latest alsa-ucm-conf bits?  I know you're on Fedora,
> so it doesn't carry over, but here's what I have packaged up for
> Debian based systems - https://salsa.debian.org/steev/alsa-ucm-conf
>
This is what has been (afaik) submitted upstream at
https://github.com/alsa-project/alsa-ucm-conf/pull/284
