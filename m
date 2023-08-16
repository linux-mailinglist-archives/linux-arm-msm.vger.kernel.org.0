Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1BE177E656
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 18:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233352AbjHPQ1G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 12:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344686AbjHPQ0o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 12:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931701B4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692203155;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+2bMlQtvM0OHR8UP4XnRskGZ8QIiYjpG3sVJDPdEXek=;
        b=QMRaZS0vJV1HIOeWsYX4gl8UcAwmgbAI8cshx6TndfufnWiTKy7ka7dfFf7TX5ReU8KS/D
        /eByqOvkrkyBlz3evvTgiH5FFqP/A0r/a2umO5zvN6vJdc8SSMrA4VkVyfzuDg1+bD35oB
        vBE9nSWp5IbrHiOw23L66ftrmu+T7ww=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-IJeAUnbzMwyH0uF8FEf3zA-1; Wed, 16 Aug 2023 12:25:54 -0400
X-MC-Unique: IJeAUnbzMwyH0uF8FEf3zA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-765ab532883so935675585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 09:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692203153; x=1692807953;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+2bMlQtvM0OHR8UP4XnRskGZ8QIiYjpG3sVJDPdEXek=;
        b=P23tkyklyhj96LmdY/LaYvX7GXVpP//f2DnCjCeQkytnOApMoZON2tVvHw6tqR/eVP
         05zqRh/Ov5MBPAZxyZpZtKgZwu91EgBwXVMu6KXdDkXJdnihzv8ulZS2P7cf41/A5I+9
         cPOHXKNL4AbqF+U1D7r8OTd/aZLj0Hkt6njdxqMCdFkI2j68+yUlvl+iERdTT3vFCI+6
         zQzz3jRGeFRbLwgCKDRBncN27k2ilup9CvcQ/DkKNbjcr+C5zrO1UPo4aGWcAZiDcRkH
         MAt7FzwOBpldB3q06pATPZsXlHTt3ItLObG0Am/wstGidg/N1nzgxabY65nU0VF1yj3m
         SNxw==
X-Gm-Message-State: AOJu0YyBSWU2ABNQV0CYwIzCVPpMY7WsuYNQlm8fJRLCrMFZ5ovdwYfH
        24iUi6las27m+NNqRDPCDgagnaglF8/h3mO2MknDMUrTHhLS9M1LgirgHawuibi1pfurSJ4Evo0
        NKCR7ZluYer0wpwVAr7kmamhlxFxS4NO0Og==
X-Received: by 2002:a05:620a:46a6:b0:76c:e52f:f12b with SMTP id bq38-20020a05620a46a600b0076ce52ff12bmr2876274qkb.47.1692203152961;
        Wed, 16 Aug 2023 09:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5p/6tniY4H4S5G/oSAYaMPLeTzJ9wqA3XwbuuOvl3AduATUr31RrRwBfY9/zzYL4yUanPTw==
X-Received: by 2002:a05:620a:46a6:b0:76c:e52f:f12b with SMTP id bq38-20020a05620a46a600b0076ce52ff12bmr2876258qkb.47.1692203152636;
        Wed, 16 Aug 2023 09:25:52 -0700 (PDT)
Received: from thinkpad-p1.localdomain (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca. [72.137.118.218])
        by smtp.gmail.com with ESMTPSA id e14-20020a05620a12ce00b0076ce477b85dsm4479980qkl.134.2023.08.16.09.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 09:25:52 -0700 (PDT)
Message-ID: <3e0de46efe32e2e4c75fa3af9dabd0477e144823.camel@redhat.com>
Subject: Re: sa8540p-ride crash when all PCI buses are disabled
From:   Radu Rendec <rrendec@redhat.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org
Date:   Wed, 16 Aug 2023 12:25:50 -0400
In-Reply-To: <80b73fa9-cebe-e058-6ef8-f039064cdd34@linaro.org>
References: <92de74746a624c2ece615a6286301db7647b5590.camel@redhat.com>
         <80b73fa9-cebe-e058-6ef8-f039064cdd34@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2023-08-15 at 11:54 +0100, Bryan O'Donoghue wrote:
> On 14/08/2023 23:36, Radu Rendec wrote:
> > I'm consistently getting a system crash followed by a ramdump on
> > sa8540p-ride (sc8280xp) when icc_sync_state() goes all the way through
> > (count =3D=3D providers_count).
> >=20
> > Context: all PCIe buses are disabled due to [1]. Previously, due to
> > some local kernel misconfiguration, icc_sync_state() never really did
> > anything (because count was always less than providers_count).
> >=20
> > I was able to isolate the problem to the qns_pcie_gem_noc icc node.
> > What happens is that both avg_bw and peak_bw for this node end up as 0
> > after aggregate_requests() gets called. The request list associated
> > with the node is empty.
>=20
> If all PCIe buses are disabled, then of course the bandwidth requests
> should say zero, the clocks should be disabled and any associated=20
> regulators should be off.
>=20
> > For testing purposes, I modified icc_sync_state() to skip calling
> > aggregate_requests() and subsequently p->set(n, n) for that particular
> > node only. With that change in place, the system no longer crashes.
>=20
> So what's happening is that a bus master in the system - perhaps not the=
=20
> application processor is issuing a transaction to a register most likely=
=20
> that is not clocked/powered.

Yes, that was my assumption as well. But I didn't think it could be
something other than the AP. That is an interesting perspective.

My first thought was to analyze the ramdump and hopefully find some
clues there. But unfortunately that doesn't seem to be an option with
the tools that I have.

> Have you considered that one of the downstream devices might be causing=
=20
> a PCIe bus transaction ?

No, I haven't considered that. If that's the case, it will probably be
even harder to debug.

> If you physically remove - can you physically remove - devices from the=
=20
> PCIe bus does this error still occur ?

This is a standard QDrive 3 reference board, so I think this is not an
option. Taking those things apart is very difficult, and I think all
peripherals are soldered onto the board anyway.

> > Surprisingly, none of the icc nodes that link to qns_pcie_gem_noc (e.g.
> > xm_pcie3_0, xm_pcie3_1, etc.) has any associated request and so they
> > all have 0 bandwidth after aggregate_requests() gets called, but that
> > doesn't seem to be a problem and the system is stable. This makes me
> > think there is a missing link somewhere, and something doesn't claim
> > any bandwidth on qns_pcie_gem_noc when it should. And it's probably
> > none of the xm_pcie3_* nodes, since setting their bandwidth to 0 seems
> > to be fine.
>=20
> Yes so if you assume that the AP/kernel side has the right references,=
=20
> counts, votes then consider another bus master - a thing that can=20
> initiate a read or a write might be misbehaving.

There is one thing I wasn't aware of when I wrote the previous email.
As it turns out, bandwidth/clock control is done at the bcm level, not
at the icc node level. It looks like there is a single bcm called PCI0,
and it's linked to the qns_pcie_gem_noc node. The xm_pcie3_* icc nodes
are not linked to any bcm.

This means that *all* PCIe buses are shut down when qns_pcie_gem_noc is
disabled due to zero bandwidth. I was under the (wrong) impression
that, since all xm_pcie3_* nodes had no requests, each corresponding
PCIe bus would be shut down separately, leaving only qns_pcie_gem_noc
active (with my test change in place).

> Assuming there is no misbehaving arm core - say a cDSP or aDSP piece of=
=20
> code that wants to do something on the PCIe bus, might the culprit be
> whatever you have connected to the bus ?
>=20
> Could something be driving the #WAKE signal and then transacting ?
>=20
> But also keep in mind depending on what you are doing with this system=
=20
> if you have a bit of firmware in one of the DSP cores - does that=20
> firmware have scope to talk to any devices on the PCIe bus ?

As I mentioned above, this is a standard QDrive 3 reference board.
Furthermore, I don't explicitly do anything with the DSPs. I just boot
a fairly recent upstream kernel (6.5-rc1) with a standard rootfs. The
boot firmware is whatever Qualcomm provides by default for these
systems. So, unless the boot firmware loads anything into the DSPs
behind my back (which I doubt), the DSPs should not even be running.

What is more likely though is that the boot firmware initializes a
bunch of PCIe devices and leaves them on.

> I'd guess another firmware is unlikely but, a downstream device doing a=
=20
> #WAKE when you have the PCIe nodes disabled would presumably be bad..
>=20
> Try looking for an upstream transaction from a device..

Yes, that makes sense. Do you have any suggestion on how to do that
without using any specialized hardware (such as JTAG pod or PCIe bus
analyzer)?

Thanks for all the input and suggestions!

--
Radu

