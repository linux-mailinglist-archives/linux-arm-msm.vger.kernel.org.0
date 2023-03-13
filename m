Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 950786B8489
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 23:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjCMWLm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 18:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjCMWLl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 18:11:41 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F1683145
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 15:11:39 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id da10so54755430edb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 15:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1678745498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODVr3V9rwt7SuMVT6kCZZ8Byr9Bqg+e7Z/eTPw8D6xw=;
        b=H26HOIRjq8CdSUfsbwOTOAGqXPV8JZun+5XlECg9gK+7bmjyaFs2+bT3aBXC1q81dB
         g9/YEsYpxZ7f+yAHKBL2ukRLvpjcbwQ1Nc9Tk2UkpWLaDqQ1CAeUr513tGuLD4667SAT
         PzNHAa9BbLzOvtWz5H1bwQ8Xx339SBKdhsNEKRKkmJVn1KQS4dRgbs+TiGlktpnFMPe5
         Xzvd5C0eCHDXBHQodSdSl3Ozqeng94oCJhBSdaYFhsZ1EwGZ6skbjziz9CYZIU5aJE75
         Aw0nDKlaAAJec16aJj+fXr/5/VpoDWc5+sDEbRVsCLbAhgKaYccBnepgrnl0jiBqHO6k
         oOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678745498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODVr3V9rwt7SuMVT6kCZZ8Byr9Bqg+e7Z/eTPw8D6xw=;
        b=FhOeOZTPpdmNkED/tc4+8AiGVRwpBYEVniEV2tnwxNQnD0NldWhyDYqXoPUfYglyEO
         e32U7VECFdcDOkh88JsgAcOJhmq40gdoAZHJ42HiP2JXifG5xcGIEjZ8l7m/HAnSB3Pr
         fVlOxyE03DmNj8+nZnvvBIeFQi7CxEV69v6zMAgnham7bgUMjNfSou/bQYw/FbhfN2EO
         K0A2dx1o9AH/rjL3jn2Vp15ZYFCfxON58x28qKWHMZIKDowGWmm1jW2oR8bdBMRVGzuD
         lwSzmVcfNuXmqG1pS9fke58ggybGUY8mQnBaaHXuoXcNs4ALNjx/QYymV6oLO1Yg/wtA
         NM/Q==
X-Gm-Message-State: AO0yUKVXU8QfNuAc8MTzcBnydshAGHj16DT7GOzVxFdS/8Gmhvi3SVx4
        TJ85hlZsYcqzYSgC7vw/fck4Lr/osfkXd0RHXigWfP14e9Sqjb6vVRdMvA==
X-Google-Smtp-Source: AK7set9gnY8xuLmEjQyjm6Pw3sPHKa9znsge2nOxY72lkYYuYmBfDnToKC29e4t8Tl6pfPQ5FNAaLl5lgaZ6oOY50ec=
X-Received: by 2002:a50:aa9c:0:b0:4fb:9735:f913 with SMTP id
 q28-20020a50aa9c000000b004fb9735f913mr3224601edc.8.1678745498256; Mon, 13 Mar
 2023 15:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <ZA8fPk1EM2lDKNA/@x13s> <CAKXuJqjrQY99immnmt_xs_V88YcpN=P+biFCO4wWTWFwaXWyLQ@mail.gmail.com>
 <CAKXuJqiAwcGrK7naBzJRx7NKKYMEHRwDygSnWuTPUmbWzqqRwg@mail.gmail.com> <ZA+c/T/d+coVxBp9@x13s>
In-Reply-To: <ZA+c/T/d+coVxBp9@x13s>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Mon, 13 Mar 2023 17:11:26 -0500
Message-ID: <CAKXuJqiXi1FVhNz-KCzc_nD_F0n4zCSzp-k9pOt5OsyDTvvqsg@mail.gmail.com>
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

On Mon, Mar 13, 2023 at 5:00=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> On Mon, Mar 13, 2023 at 03:26:44PM -0500, Steev Klimaszewski wrote:
> > On Mon, Mar 13, 2023 at 3:23=E2=80=AFPM Steev Klimaszewski <steev@kali.=
org> wrote:
> > > Do you have the latest alsa-ucm-conf bits?  I know you're on Fedora,
> > > so it doesn't carry over, but here's what I have packaged up for
> > > Debian based systems - https://salsa.debian.org/steev/alsa-ucm-conf
> > >
> > This is what has been (afaik) submitted upstream at
> > https://github.com/alsa-project/alsa-ucm-conf/pull/284
>
> OK, I installed that on my Fedora system and I still only have a dummy
> output, however I'm further along with my log messages.
>
> [   13.857827] qcom-soundwire 3250000.soundwire-controller: Qualcomm Soun=
dwire controller v1.6.0 Registered
> [   13.859176] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, V=
ariant: WSA8835_V2
> [   13.865928] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, V=
ariant: WSA8835_V2
> [   13.870063] qcom-soundwire 3210000.soundwire-controller: Qualcomm Soun=
dwire controller v1.6.0 Registered
> [   13.872067] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops=
 wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
> [   13.872849] wsa883x-codec sdw:0:0217:0202:00:2: WSA883X Version 1_1, V=
ariant: WSA8835_V2
> [   13.873357] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops=
 wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
> [   13.880597] qcom-soundwire 3330000.soundwire-controller: Qualcomm Soun=
dwire controller v1.6.0 Registered
> [   13.899249] snd-sc8280xp sound: ASoC: Parent card not yet available, w=
idget card binding deferred
> [   13.906192] ALSA: Control name 'stream1.vol_ctrl1 MultiMedia1 Playback=
 Volume' truncated to 'stream1.vol_ctrl1 MultiMedia1 Playback Volu'
> [   13.907589] ALSA: Control name 'stream2.vol_ctrl2 MultiMedia2 Playback=
 Volume' truncated to 'stream2.vol_ctrl2 MultiMedia2 Playback Volu'
> [   13.911243] input: SC8280XP-LENOVO-X13S Headset Jack as /devices/platf=
orm/sound/sound/card0/input11
>
> [   23.851716]  MultiMedia4 Capture: ASoC: no backend DAIs enabled for Mu=
ltiMedia4 Capture
> [   23.851724]  MultiMedia4 Capture: ASoC: error at dpcm_fe_dai_prepare o=
n MultiMedia4 Capture: -22
> # The two lines above repeat a bunch of times
>
> [   23.904985] qcom,apr 3000000.remoteproc:glink-edge.adsp_apps.-1.-1: GP=
R: Port(1000000b) is not registered
> # This repeats as well
>
> I still have dummy output. If I plug in headphones, then these messages
> appear:
>
> [  556.339991] wcd938x_mbhc_get_result_params: d1=3D5, c1=3D3, x1=3D0x101=
5, z_val=3D335402(milliOhm)
> [  556.371025] wcd938x_mbhc_get_result_params: d1=3D5, c1=3D3, x1=3D0x100=
b, z_val=3D339442(milliOhm)
> [  556.402061] wcd938x_mbhc_get_result_params: d1=3D5, c1=3D3, x1=3D0xfba=
, z_val=3D376140(milliOhm)
>
> My dmesg shows that the only firmware that's missing is for the GPU and
> bluetooth.
>
> Brian
>
That looks like you're possibly missing a few patches for audio.  I
grabbed mine from Johan's v6.3-rc1 branch
https://github.com/jhovold/linux/commits/wip/sc8280xp-v6.3-rc1; if you
do have them do make sure you have the SC_LPASSCSR_8280XP option
enabled
