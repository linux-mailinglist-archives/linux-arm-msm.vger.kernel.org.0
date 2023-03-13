Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF5A36B7EDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 18:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjCMRHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 13:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbjCMRGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 13:06:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BD85293F
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678727044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=7EImTiCnhee8229M6laIow5WhfNaqVVWaIpaCS0B1hI=;
        b=TP67hm2WjcYhk1ZILzdLeijsV0HTy3fVCsfdJkqVTmZQfFKM20/PxpxX6L9KPkTWzp+cRE
        UUVe2b3jADPYyubsLacGrvRTKOqHOVsKFZuYxXDjbizwJzdCy6YTpliwduoRGYXmN6XpXp
        +hGXLP1A0v/jiG0C8uJ3xfVoF4yvqw8=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-qFJzcLlqOJGKT_TDTPYn-g-1; Mon, 13 Mar 2023 13:04:03 -0400
X-MC-Unique: qFJzcLlqOJGKT_TDTPYn-g-1
Received: by mail-io1-f70.google.com with SMTP id a21-20020a5d9595000000b0074c9dc19e16so6549024ioo.15
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 10:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678727042;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EImTiCnhee8229M6laIow5WhfNaqVVWaIpaCS0B1hI=;
        b=bdjpT5+h/6Mn0eLZeRQl8u1Hdjc2RfrPCAfuYBSsp2rs1DEa9z4tfqtYOXIa4f9AXD
         2pK4JY1Nss6iHCDzdlU1YZSkwhDHSrtCYpAyZeeM98c0tczh5OZtTmjp9orCl7Kqfz9E
         iK0+tNYZeQs8baoJVF4HocDvcEkqGFmVlC7Bq9m2sIfMu70mNUjhA0sudvfMM3j869/Q
         xmOwY5BejE+TL2F9VR5sY6hlsFk6jj51IZotyfYgyNKywggY9tIvN714BVyvd8fQhkGq
         zU2828eP1yPdKD+p/GjKjSoYhlG/mRGtQiZCU2cE43Z+nG+pd/0jtCjlXWGLSM9FCP0L
         nOrg==
X-Gm-Message-State: AO0yUKW3AOHKR9BT/JNuzpLoRtriK0FTiyhwis1asIS6aSxUDp6Tdewg
        BHcD2sA4FsKNfaw/AWG0lcpT5czQNijnb5s2137c8kZkcKjPLGnUy1jBejDVVpz0y5oWWRLi0fp
        jbc87XqnwpMuRedvflllhdgaQ95FfWoDzBoV/8bxdpyeVolyNdOq9n8v2OPbcldyPjIQDtilHUI
        N3PiBe4ue/
X-Received: by 2002:a05:6e02:552:b0:322:f272:30d2 with SMTP id i18-20020a056e02055200b00322f27230d2mr385301ils.4.1678727041968;
        Mon, 13 Mar 2023 10:04:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set+HAUdW4v1mXRPLJN/2N0g+ISdkIBj4cDvCuPbKuNJCeMA+pdpTW6OW0ofDIYiD9QGWUQogvw==
X-Received: by 2002:a05:6e02:552:b0:322:f272:30d2 with SMTP id i18-20020a056e02055200b00322f27230d2mr385275ils.4.1678727041636;
        Mon, 13 Mar 2023 10:04:01 -0700 (PDT)
Received: from x13s (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id b4-20020a5ea704000000b0074e7960e70dsm71077iod.51.2023.03.13.10.04.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 10:04:01 -0700 (PDT)
Date:   Mon, 13 Mar 2023 09:03:58 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     linux-arm-msm@vger.kernel.org
Subject: sc8280xp: How to get sound working?
Message-ID: <ZA8fPk1EM2lDKNA/@x13s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I'm trying to get the sound working on my x13s with Fedora 37. I have
qrtr and pd-mapper running, and I have working battery status.

I downloaded SC8280XP-LENOVO-X13S-tplg.bin from Srini's git repo at [1].
Everything starts to probe:

[   66.572719] qcom-soundwire 3210000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
[   66.579051] qcom-soundwire 3250000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
[   66.579886] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
[   66.579907] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
[   66.580466] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   66.581646] qcom-soundwire 3330000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
[   66.582913] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   66.585710] wsa883x-codec sdw:0:0217:0202:00:2: WSA883X Version 1_1, Variant: WSA8835_V2
[   66.598032] snd-sc8280xp sound: ASoC: Parent card not yet available, widget card binding deferred
[   66.603140] ALSA: Control name 'stream1.vol_ctrl1 MultiMedia1 Playback Volume' truncated to 'stream1.vol_ctrl1 MultiMedia1 Playback Volu'
[   66.603228] ALSA: Control name 'stream2.vol_ctrl2 MultiMedia2 Playback Volume' truncated to 'stream2.vol_ctrl2 MultiMedia2 Playback Volu'
[   66.605330] input: SC8280XP-LENOVO-X13S Headset Jack as /devices/platform/sound/sound/card0/input11

And then a bunch of these errors come through:

[   66.719630]  MultiMedia1 Playback: ASoC: no backend DAIs enabled for MultiMedia1 Playback
[   66.719641]  MultiMedia1 Playback: ASoC: error at dpcm_fe_dai_prepare on MultiMedia1 Playback: -22

x13s:~$ aplay -l output 
**** List of PLAYBACK Hardware Devices ****
card 0: SC8280XPLENOVOX [SC8280XP-LENOVO-X13S], device 4: MultiMedia1 Playback (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: SC8280XPLENOVOX [SC8280XP-LENOVO-X13S], device 5: MultiMedia2 Playback (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0

Any suggestions?

Also if anyone happens to stumble upon this message via a search engine:
Fedora has all of it's firmware xz compressed. To get this far:
qcadsp8280.mbn, qccdsp8280.mbn, and *.jsn will need to be decompressed.
pd-mapper needs to be updated to handle this. I've added this to my todo
list to fix, but it may be a little while before I get to it.

[1] https://git.linaro.org/people/srinivas.kandagatla/audioreach-topology.git/tree/prebuilt/SC8280XP-LENOVO-X13S-tplg.bin

Brian

