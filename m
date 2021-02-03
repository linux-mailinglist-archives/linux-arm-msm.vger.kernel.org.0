Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2B530D721
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 11:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233357AbhBCKMz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 05:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbhBCKMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 05:12:51 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D7EC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 02:12:11 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id b21so17000529pgk.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 02:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=Jj5P/+FGKB+Gx/8nToaLLeEz9vFqyWcYXQiDNxG9J9c=;
        b=m5IL6Z7rCQYN/Fj8ZKWDB8gQoOgWX6QRwxPqBgNFcyGr45TD20iVxc0EqHk+JbBscm
         Oe3G0AgcSOHjcjkUlQY8AShMbWE4/wPzGpASS3wssxEzKBzN75giqDQZBLPIP+evMnG+
         a0zU7aInwHO2DJBPZexzCRonTzRqlDHz/GBcCYTFkoMDyWVek4PzMtqmMcsm4h8nPgPe
         Cl3qR203m5WUtsxLGV7hswqtoeycf3HrnMBHYPD/g3IQcSUFIznuNyb2KERjxNZFxYXU
         idO5YBEKAXLpsaoJYDS5A3qyI9YWmo0FeJZXhkX6mreOX9O/TvpN34RL7vz4OSa5wRjm
         qRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=Jj5P/+FGKB+Gx/8nToaLLeEz9vFqyWcYXQiDNxG9J9c=;
        b=Moeb3VZ54TBM8GPeNA1fTMMB7MCtuymoAbooc3X2wojrCzwNu+OuCoWH4ys/Oik5n9
         9h9d/r/5MAz2vP5h5PNiXvWzW/q0RBMJ7/fIe0SvR8mjBfqaT6XA+arVuPfDSfGBgVhZ
         Z4/bxI8BvVUkCtfxxW030I/Y/DWWJPbK8o6g+IiOPOwAT1U3MD51KYhsM1mHsE8/BzOK
         ym0uqiLhoiVRf3d4UXrqerLfLa3lqynbBB/SFY+teoQeng5VGEjVpwR6akz0gza5J7QK
         QHGne8mnwWQb8q+cy5eYo4avyBbvD8kEgmqhOIlhX8YtGLSjkHpGv8bO5KjqhmB6cXc0
         aRDg==
X-Gm-Message-State: AOAM531ddpunCeKXqk/DIW7S18yTVW3IctNyRtLiz1FyDFLps/mRGT4d
        fPs4fSfKAHGLk4Br9zM6DmCF
X-Google-Smtp-Source: ABdhPJz/JdTHb2LWEEGIyYASRUhlaQG7crk7c3TVHaxEj38YS7W8P72bn162d6OF16rO8b9q0C/ZyQ==
X-Received: by 2002:a62:1dd7:0:b029:1be:ef0d:9507 with SMTP id d206-20020a621dd70000b02901beef0d9507mr2424246pfd.62.1612347131212;
        Wed, 03 Feb 2021 02:12:11 -0800 (PST)
Received: from ?IPv6:2409:4072:619f:ff99:700b:51f3:e28:b00? ([2409:4072:619f:ff99:700b:51f3:e28:b00])
        by smtp.gmail.com with ESMTPSA id dw23sm1688325pjb.3.2021.02.03.02.12.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:12:10 -0800 (PST)
Date:   Wed, 03 Feb 2021 15:42:02 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20210203110522.12f2b326@xps13>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org> <20210201151824.5a9dca4a@xps13> <20210202041614.GA840@work> <20210202091459.0c41a769@xps13> <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org> <20210203110522.12f2b326@xps13>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is unavailable
To:     Miquel Raynal <miquel.raynal@bootlin.com>
CC:     richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Miquel,=20

On 3 February 2021 3:35:22 PM IST, Miquel Raynal <miquel=2Eraynal@bootlin=
=2Ecom> wrote:
>Hi Manivannan,
>
>Manivannan Sadhasivam <manivannan=2Esadhasivam@linaro=2Eorg> wrote on Wed=
,
>03 Feb 2021 15:28:20 +0530:
>
>> Hi Miquel,=20
>>=20
>> On 2 February 2021 1:44:59 PM IST, Miquel Raynal
><miquel=2Eraynal@bootlin=2Ecom> wrote:
>> >Hi Manivannan,
>> >
>> >Manivannan Sadhasivam <manivannan=2Esadhasivam@linaro=2Eorg> wrote on
>Tue,
>> >2 Feb 2021 09:46:14 +0530:
>> > =20
>> >> Hi,
>> >>=20
>> >> On Mon, Feb 01, 2021 at 03:18:24PM +0100, Miquel Raynal wrote: =20
>> >> > Hi Manivannan,
>> >> >=20
>> >> > Manivannan Sadhasivam <manivannan=2Esadhasivam@linaro=2Eorg> wrote
>on =20
>> >Sat, =20
>> >> > 30 Jan 2021 09:24:12 +0530:
>> >> >    =20
>> >> > > The bbt pointer will be unavailable when NAND_SKIP_BBTSCAN
>option =20
>> >is =20
>> >> > > set for a NAND chip=2E The intention is to skip scanning for the
>=20
>> >bad =20
>> >> > > blocks during boot time=2E   =20
>> >> >=20
>> >> > I don't have the same understanding: this flag skips the bad
>block
>> >> > table scan, not the bad block scan=2E We do want to scan all the =
=20
>> >devices =20
>> >> > in order to construct a RAM based table=2E
>> >> >    =20
>> >> > > However, the MTD core will call
>> >> > > _block_isreserved() and _block_isbad() callbacks
>unconditionally =20
>> >for =20
>> >> > > the rawnand devices due to the callbacks always present while=20
>
>> >collecting =20
>> >> > > the ecc stats=2E
>> >> > >=20
>> >> > > The _block_isreserved() callback for rawnand will bail out if
>bbt
>> >> > > pointer is not available=2E But _block_isbad() will continue =20
>> >without =20
>> >> > > checking for it=2E So this contradicts with the
>NAND_SKIP_BBTSCAN =20
>> >option =20
>> >> > > since the bad block check will happen anyways (ie=2E, not much =
=20
>> >difference =20
>> >> > > between scanning for bad blocks and checking each block for
>bad =20
>> >ones)=2E =20
>> >> > >=20
>> >> > > Hence, do not check for the bad block if bbt pointer is =20
>> >unavailable=2E   =20
>> >> >=20
>> >> > Not checking for bad blocks at all feels insane=2E I don't really
>get =20
>> >the =20
>> >> > scope and goal of such change?
>> >> >    =20
>> >>=20
>> >> The issue I encountered is, on the Telit FN980 device one of the
>> >> partition seems to be protected=2E So trying to read the bad blocks
>in
>> >> that partition makes the device to reboot during boot=2E =20
>> >
>> >o_O
>> >
>> >Reading a protected block makes the device to reboot?
>> >
>> >What is the exact device? Can you share the datasheet? Is this
>behavior
>> >expected? Because it seems really broken to me, a read should not
>> >trigger *anything* that bad=2E
>> > =20
>>=20
>> I got more information from the vendor, Telit=2E The access to the 3rd
>partition is protected by Trustzone and any access in non privileged
>mode (where Linux kernel runs) causes kernel panic and the device
>reboots=2E=20
>
>Ok, so this is not a chip feature but more a host constraint=2E
>
>In this case it would be a good idea to add a host DT property which
>describes the zone to avoid accessing it=2E Something like:
>
>	secure-area/secure-section =3D <start length>;
>
>From the core perspective, we should parse this property early enough
>and return -EIO when trying to access this area=2E
>
>Does this solution sound reasonable to you?
>

This sounds good to me=2E I'll give it a go and share the patch soon=2E=20

Thanks,=20
Mani

>Thanks,
>Miqu=C3=A8l

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
