Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717C66B8468
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 23:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjCMWCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 18:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjCMWCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 18:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EA572005
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678744835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IO0Vz/09DUh4o0SPmfPnX/f1BPrnJQaREnGoP9/+rrQ=;
        b=hVOjHV627hN/vn6VWc+Abzbt6NSchUsZvPDkWge9cd0IEK1yiDXoUiJ/8Sad3AhhTdnJfM
        duSKFlN+eCujAChSB6jQmr9a9pjqo4Bd19oi2tfMUntCCiCnBXPRKSWiJerg4lQQeHmkDq
        Qx4MxmsM9dHVFJJ0J5HSZNdzZae5QQg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-o0Krgsr5MGq_f6Fiu1DV3Q-1; Mon, 13 Mar 2023 18:00:34 -0400
X-MC-Unique: o0Krgsr5MGq_f6Fiu1DV3Q-1
Received: by mail-io1-f70.google.com with SMTP id r19-20020a6b5d13000000b00750e47220deso73457iob.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 15:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678744832;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IO0Vz/09DUh4o0SPmfPnX/f1BPrnJQaREnGoP9/+rrQ=;
        b=lG2V5M2kJO7wJjmIGKa/v5PB/Tl+QZYg0Wd/LUX/VAdcywztAk4hEn9txllM0jjFoh
         F7eKeKhbTmjBVxyY+7gO0AqwwlF2Z8AX5TLqDkqgaWs89L+QXZ2OpDzhwjYVYsOSmyHd
         zvu/PkogR9IJq/TDvDR3Jh0kEHWDyVY07q5IUvoQDnID8a5u5QdQ+yqoM+npLreaNYde
         qf4EQSkWtREGL4Ym7vUlEz7tulIfuHf2fS9Ls2tC2SjaQIhlVzoTDCYO1gnV70tFicO0
         uzpt5qxNNhMWSCheynpCtcLAM+4Br7ilsYhudEOp5Vhjcyq8HHCjHOdG2VHWNkjqLUKx
         qfsw==
X-Gm-Message-State: AO0yUKWHPGDTU6YpRELl9MIwfZ2hCsCWehdVv6vYp79EdJuczXjNTfcK
        dL07KTCz0XNgT5rajVNbs2h1iL+Hp37vDL174xwyqnRxzeQhCrFoewutHN6I7Idx8XDVr0S8eHZ
        ffefKWDhaFP9qyIkuk8WS6BL/IY8FHlghWw==
X-Received: by 2002:a92:908:0:b0:318:6d32:b12a with SMTP id y8-20020a920908000000b003186d32b12amr940347ilg.13.1678744831766;
        Mon, 13 Mar 2023 15:00:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set9kX7Id1ZBz061xQLF7TfOMXycPFULZxr27R2GoitHL5AXoAGjatFs6XzC0cnldz6VJWOding==
X-Received: by 2002:a92:908:0:b0:318:6d32:b12a with SMTP id y8-20020a920908000000b003186d32b12amr940342ilg.13.1678744831560;
        Mon, 13 Mar 2023 15:00:31 -0700 (PDT)
Received: from x13s (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id s13-20020a92cc0d000000b00323094e480dsm293279ilp.7.2023.03.13.15.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 15:00:31 -0700 (PDT)
Date:   Mon, 13 Mar 2023 18:00:29 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: sc8280xp: How to get sound working?
Message-ID: <ZA+c/T/d+coVxBp9@x13s>
References: <ZA8fPk1EM2lDKNA/@x13s>
 <CAKXuJqjrQY99immnmt_xs_V88YcpN=P+biFCO4wWTWFwaXWyLQ@mail.gmail.com>
 <CAKXuJqiAwcGrK7naBzJRx7NKKYMEHRwDygSnWuTPUmbWzqqRwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKXuJqiAwcGrK7naBzJRx7NKKYMEHRwDygSnWuTPUmbWzqqRwg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 13, 2023 at 03:26:44PM -0500, Steev Klimaszewski wrote:
> On Mon, Mar 13, 2023 at 3:23 PM Steev Klimaszewski <steev@kali.org> wrote:
> > Do you have the latest alsa-ucm-conf bits?  I know you're on Fedora,
> > so it doesn't carry over, but here's what I have packaged up for
> > Debian based systems - https://salsa.debian.org/steev/alsa-ucm-conf
> >
> This is what has been (afaik) submitted upstream at
> https://github.com/alsa-project/alsa-ucm-conf/pull/284

OK, I installed that on my Fedora system and I still only have a dummy
output, however I'm further along with my log messages.

[   13.857827] qcom-soundwire 3250000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
[   13.859176] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   13.865928] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   13.870063] qcom-soundwire 3210000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
[   13.872067] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
[   13.872849] wsa883x-codec sdw:0:0217:0202:00:2: WSA883X Version 1_1, Variant: WSA8835_V2
[   13.873357] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
[   13.880597] qcom-soundwire 3330000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
[   13.899249] snd-sc8280xp sound: ASoC: Parent card not yet available, widget card binding deferred
[   13.906192] ALSA: Control name 'stream1.vol_ctrl1 MultiMedia1 Playback Volume' truncated to 'stream1.vol_ctrl1 MultiMedia1 Playback Volu'
[   13.907589] ALSA: Control name 'stream2.vol_ctrl2 MultiMedia2 Playback Volume' truncated to 'stream2.vol_ctrl2 MultiMedia2 Playback Volu'
[   13.911243] input: SC8280XP-LENOVO-X13S Headset Jack as /devices/platform/sound/sound/card0/input11

[   23.851716]  MultiMedia4 Capture: ASoC: no backend DAIs enabled for MultiMedia4 Capture
[   23.851724]  MultiMedia4 Capture: ASoC: error at dpcm_fe_dai_prepare on MultiMedia4 Capture: -22
# The two lines above repeat a bunch of times

[   23.904985] qcom,apr 3000000.remoteproc:glink-edge.adsp_apps.-1.-1: GPR: Port(1000000b) is not registered
# This repeats as well

I still have dummy output. If I plug in headphones, then these messages
appear:

[  556.339991] wcd938x_mbhc_get_result_params: d1=5, c1=3, x1=0x1015, z_val=335402(milliOhm)
[  556.371025] wcd938x_mbhc_get_result_params: d1=5, c1=3, x1=0x100b, z_val=339442(milliOhm)
[  556.402061] wcd938x_mbhc_get_result_params: d1=5, c1=3, x1=0xfba, z_val=376140(milliOhm)

My dmesg shows that the only firmware that's missing is for the GPU and
bluetooth.

Brian

