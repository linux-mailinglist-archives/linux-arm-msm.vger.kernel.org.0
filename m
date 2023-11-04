Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4467E0F24
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 12:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbjKDLgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Nov 2023 07:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjKDLgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Nov 2023 07:36:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5AF1D47
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Nov 2023 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699097721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v1naZKLOXcEKuSV7hmev6oe//q4pB3LR1KPA9a3sMCk=;
        b=AEbBlVaCd4HXKOmDtepX3XeAJAP0WO/zcqJ9wDKyrJmt+CF1l1UkIwqYCK7ZQVFwhgktpf
        SffM46Zdm9JuxeujUef9Uewp3NkBx8a1Ee8d7sUwHE2fvpmTWrSuXi6Ocqllj7i1u4x16J
        bTAaILpDD5TS36hIK7dMRuaFRLmjOc0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224--thbiS0xMpCoIgYLcgHqLQ-1; Sat, 04 Nov 2023 07:35:20 -0400
X-MC-Unique: -thbiS0xMpCoIgYLcgHqLQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9c15543088aso330032566b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Nov 2023 04:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699097719; x=1699702519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1naZKLOXcEKuSV7hmev6oe//q4pB3LR1KPA9a3sMCk=;
        b=ALwQ4E4K9qTc6Bav/XoEuU6e/ajf51pYxiYZJ+IowK3sw5NBqxqLyL56E0gYpKLI4E
         ILtAqc4oY+jpBE3HhypvJEp+1EnoWHPbAupQpHio5muuLubXpd/Cc2f+eeKY6i8RiYeT
         0n0ParLUAtR8LQZXMxBMj9mp9m5RiYTUax7Gbdy+D3A7qUd79S01VO81tno6y0HGnrGv
         KyR6Zd2+EPZiY9srZ5wJsh9ppFoYzklBMHEjJTbdBC5E4NX40olWnTHfYrxea3OiHEFX
         Gpp9GP0Qct4RyIF/8qkV5jEQSE8GUz9AZmBNN7MK4990lKhI9DepGcqkR+0YV9amLAnt
         j0+A==
X-Gm-Message-State: AOJu0YwQyjip8yTTkL+rFDEMRATDTcLH2RO3SXhmx/UgGF3mpwru2Z2p
        vU5fYhhVeW5XtpxhRaJOOhxZaqgAD5Jsu1uICOXcdf65nCYdtuLiIBox6frUyjHcp21G1Usy7BD
        JQk/xTgzqeoKB3Gw+Ajl5uAP6G91VhDw4tATkx1vJpQ==
X-Received: by 2002:a17:907:7897:b0:9ba:b5:cba6 with SMTP id ku23-20020a170907789700b009ba00b5cba6mr4829338ejc.14.1699097719166;
        Sat, 04 Nov 2023 04:35:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlDQ/raoqzXEnQQGWd2mDb2p25vyE5xV37s81TNQVC6HW7LTgy3+1QyxCiu93W9RpPczmObs/NjL/SZ7DcUM8=
X-Received: by 2002:a17:907:7897:b0:9ba:b5:cba6 with SMTP id
 ku23-20020a170907789700b009ba00b5cba6mr4829326ejc.14.1699097718872; Sat, 04
 Nov 2023 04:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <ZUUrMm1Q/PI5xv6a@brian-x1> <20231103190433.GX3553829@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20231103190433.GX3553829@hu-bjorande-lv.qualcomm.com>
From:   Brian Masney <bmasney@redhat.com>
Date:   Sat, 4 Nov 2023 07:35:07 -0400
Message-ID: <CABx5tqJRVWtDpVZD++EK9RrRK-nZh-sZJFSd9xsf6p=o_wdp4g@mail.gmail.com>
Subject: Re: External display on the x13s?
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>,
        Eric Chanudet <echanude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 3, 2023 at 3:04=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
> With the ADSP remoteproc and pd-mapper running, and pd-mapper being able
> to pick up the json files you should get your power-supply, and you
> should get your USB Type-C events.
>
> Unless I'm mistaken, there's still some issue with Gnome, but you should
> be able to validate if the display is detected using "modetest -c". It
> should present you with a eDP-1, USB-1 and USB-2 (or eDP-1, DP-1, DP-2
> now in the future).
>
>
> For reference, I'm running v6.6 with no modifications and built straight
> from the upstream defconfig. I just confirmed that I can drive my 4k TV
> (at 30Hz...) over HDMI with that.

The issue ended up being my HDMI adapter since it looks like it's
thunderbolt. I found a different USB-C to HDMI adapter in my box of
cables and it's now detected on the x13s. However, mutter crashes and
I believe it's this issue:
https://gitlab.gnome.org/GNOME/mutter/-/issues/2398

To get Fedora 39 on the x13s, I had to take the nvme drive out, put it
in a USB caddy, dd the image to the drive using another computer, and
modify the grub config. It looks like Fedora's initramfs is missing
one or more modules that's needed so that the USB storage is detected.
I'm going to look into that as I have free time. I heard from Andrew
that there is (or was) an issue on boot up where the USB voltage
drops. Is that still an issue?

For the search engines: To get Fedora 39 booting on the x13s

directly dd the image using a different computer as I describe above

Mount the second partition and edit the loader/entries/xxx.conf file
on that partition:

Under options, remove 'quiet' and add 'arm64.nopauth clk_ignore_unused
pd_ignore_unused'
Add a new line:

    devicetree /dtb-6.5.6-300.fc39.aarch64/qcom/sc8280xp-lenovo-thinkpad-x1=
3s.dtb

Put the drive back in the system.

To persist the kernel options once you boot the system, edit
/etc/default/grub. Change this line to:

GRUB_CMDLINE_LINUX=3D"arm64.nopauth clk_ignore_unused pd_ignore_unused"

Add a new line GRUB_DEFAULT_DTB=3D/dtb/qcom/sc8280xp-lenovo-thinkpad-x13s.d=
tb

Fedora 39 currently has the 6.5.6 kernel and you can upgrade to a 6.6
kernel with:

sudo dnf copr enable @kernel-vanilla/mainline-wo-mergew
sudo dnf upgrade 'kernel*'

Brian

