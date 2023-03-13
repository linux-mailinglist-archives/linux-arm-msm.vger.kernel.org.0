Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14AD96B82A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 21:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjCMUXn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 16:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjCMUXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 16:23:43 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7EB79B1C
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:23:41 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id cn21so23511814edb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1678739020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZ7o5A00/OyxFiaueD44RMxwDAaYMJHGHhTSExPK6xY=;
        b=EpV+NtzXRDLLKMYvFrzudfg8xSkiWQuHao79CrNl5kSco+I9KcAJIE2ojqckWAf9VR
         rpckKwbhBFqaR8orAhZYNDJ2mj1B66SDaXW1zbGYHZzFm/DrYC5WaAI62LD0cw9n8A/p
         UHcoSHvtLYqMRDQ/DzjQKC/mj765gC+2k3x8AicmvzUjGDjjiHHJNcQ5e1wp2AjdUJvg
         YAdRgN+DAZBPFxkRoMYO7NGn0CvuBprWQg3HXFW2Eme6ZS1hcGRSfycF+v0C4E6CUTqs
         iMNOwL9jFIBuAxXgIhVrlMxEcTZmeGBB+XYaObf6NCtDRfQuM8z3JHCtuodRBgq64pGF
         uSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678739020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZ7o5A00/OyxFiaueD44RMxwDAaYMJHGHhTSExPK6xY=;
        b=j5qju6LP8Sw+o2maGtgM2Ub3eJHeBkSxSPGeqAaI+PwMjp/gWEhVkJyy5/L0i5pVcF
         mRw8vt3sPIrx7jXjGN6p7aNiJNoExVwG2EFZx97Bfer+2w7CWJCkU2Z9ChiP+17OZt3a
         I5KtZupQRkiZqv1/wvLK/unOJte5KUN7StD2ao6N+2NONBqtGrH+AGriHPDdgrfM8OEY
         Fi1MAw/EJS83RjsdFRoK91fBK5yv8gX46AEA/Tm2heDGSqlhig+Qydc5r3OV++j6ejw3
         9kHjhI0CmOZeJFCwq58n4RaVLewwIFY57ukooHnUgDkavIpDVMCgMNV4LOyA+yESJNT9
         vMsw==
X-Gm-Message-State: AO0yUKVg9yb0goxLiW0oDJggYoMu7MCZ19YWdMjhKZLajOnw9AGl/Z4T
        lIaatpldxBIguM6+JZvyne1Mc9DagzxYtaFAnTjipg==
X-Google-Smtp-Source: AK7set+89Hm6bHhuVsatlldZ9ZVTWkFuqJmofJb5okkKlrxg0eDs/fUE8nxqOta4wQ6I9/MtMYobCDsZJ4bTFaKHqek=
X-Received: by 2002:a17:906:b046:b0:8b1:77bf:79dc with SMTP id
 bj6-20020a170906b04600b008b177bf79dcmr13677638ejb.14.1678739020135; Mon, 13
 Mar 2023 13:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <ZA8fPk1EM2lDKNA/@x13s>
In-Reply-To: <ZA8fPk1EM2lDKNA/@x13s>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Mon, 13 Mar 2023 15:23:28 -0500
Message-ID: <CAKXuJqjrQY99immnmt_xs_V88YcpN=P+biFCO4wWTWFwaXWyLQ@mail.gmail.com>
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

Hi Brian,

On Mon, Mar 13, 2023 at 12:07=E2=80=AFPM Brian Masney <bmasney@redhat.com> =
wrote:
>
> I'm trying to get the sound working on my x13s with Fedora 37. I have
> qrtr and pd-mapper running, and I have working battery status.
>
> I downloaded SC8280XP-LENOVO-X13S-tplg.bin from Srini's git repo at [1].
> Everything starts to probe:
>
> [   66.572719] qcom-soundwire 3210000.soundwire-controller: Qualcomm Soun=
dwire controller v1.6.0 Registered
> [   66.579051] qcom-soundwire 3250000.soundwire-controller: Qualcomm Soun=
dwire controller v1.6.0 Registered
> [   66.579886] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops=
 wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
> [   66.579907] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops=
 wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
> [   66.580466] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, V=
ariant: WSA8835_V2
> [   66.581646] qcom-soundwire 3330000.soundwire-controller: Qualcomm Soun=
dwire controller v1.6.0 Registered
> [   66.582913] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, V=
ariant: WSA8835_V2
> [   66.585710] wsa883x-codec sdw:0:0217:0202:00:2: WSA883X Version 1_1, V=
ariant: WSA8835_V2
> [   66.598032] snd-sc8280xp sound: ASoC: Parent card not yet available, w=
idget card binding deferred
> [   66.603140] ALSA: Control name 'stream1.vol_ctrl1 MultiMedia1 Playback=
 Volume' truncated to 'stream1.vol_ctrl1 MultiMedia1 Playback Volu'
> [   66.603228] ALSA: Control name 'stream2.vol_ctrl2 MultiMedia2 Playback=
 Volume' truncated to 'stream2.vol_ctrl2 MultiMedia2 Playback Volu'
> [   66.605330] input: SC8280XP-LENOVO-X13S Headset Jack as /devices/platf=
orm/sound/sound/card0/input11
>
> And then a bunch of these errors come through:
>
> [   66.719630]  MultiMedia1 Playback: ASoC: no backend DAIs enabled for M=
ultiMedia1 Playback
> [   66.719641]  MultiMedia1 Playback: ASoC: error at dpcm_fe_dai_prepare =
on MultiMedia1 Playback: -22
>
> x13s:~$ aplay -l output
> **** List of PLAYBACK Hardware Devices ****
> card 0: SC8280XPLENOVOX [SC8280XP-LENOVO-X13S], device 4: MultiMedia1 Pla=
yback (*) []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 0: SC8280XPLENOVOX [SC8280XP-LENOVO-X13S], device 5: MultiMedia2 Pla=
yback (*) []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
>
> Any suggestions?
>
> Also if anyone happens to stumble upon this message via a search engine:
> Fedora has all of it's firmware xz compressed. To get this far:
> qcadsp8280.mbn, qccdsp8280.mbn, and *.jsn will need to be decompressed.
> pd-mapper needs to be updated to handle this. I've added this to my todo
> list to fix, but it may be a little while before I get to it.
>
> [1] https://git.linaro.org/people/srinivas.kandagatla/audioreach-topology=
.git/tree/prebuilt/SC8280XP-LENOVO-X13S-tplg.bin
>
> Brian
>

Do you have the latest alsa-ucm-conf bits?  I know you're on Fedora,
so it doesn't carry over, but here's what I have packaged up for
Debian based systems - https://salsa.debian.org/steev/alsa-ucm-conf

--steev
