Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2D430D6E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 10:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbhBCJ7P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 04:59:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbhBCJ7I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 04:59:08 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46B9C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 01:58:28 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id l18so4248027pji.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 01:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=tR+G7Q6qy+w2gVQ0L8qty7WAI5dbfh28qP7V9Bl0sVM=;
        b=h6Wm4+Nvi2OFd2L/+MLZDH+2nEqhNf74r80EBIgLSv0ms6w+bmxwA5TeJ9ggtJTROH
         V51XdUWFDwjMav+l5l9BtYvrxXWUB84sXqg8SvFGzmNq7+KTGcsSXt6ENtaJO/okd7Bo
         jB9Uw+TgBymeuyjYIWMTlPsP2QD0RGPq8qrXhV5Jp74qeBCdN0w5nNN1+4yLjJjZOatq
         jEhlTQKbfWbkKi+u4JmWzjaDvGp7OYREq+3xPZ+se2cwcodBOQKQwFDTBl8vqzx7j2nH
         4LUI+63oZl0OA4p2owNWAQualpjsjkHQ+ur3tZTzEzxiuurDm75GTRVGt43TMHlXxJyv
         3msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=tR+G7Q6qy+w2gVQ0L8qty7WAI5dbfh28qP7V9Bl0sVM=;
        b=imRMvEk4IKzmxDHZ6BOT9lW0EBY7oYva5EshQbYRbImMGWBhCP3yH9dY+Ys+sbYRJE
         9wuhpB9vn2X9+vDTt/gxgYUC3YPiCcafbP1FWdcbtnSqYE4ETWExk5H5U0RN0OPFsgI5
         zxkBqhCcqcOGMdSFYcQMlBKQXrUu/r5dL29beN5bdsBx6UVXRX20vm2KaonT4OwMp0RP
         Fbl6vtgti4xaiP3O3aKEw6SCVfI1FjKtUCgyeRtYHPYKOt5pz6qhTENfI1RpR9XKU1AR
         PAwrjTLUxrFy65pob6HPzO2cWSRhmgItH7olZhfaN3u2R3UFKO++8vM/wb2tO8vvdwwh
         9pYw==
X-Gm-Message-State: AOAM533jRKIqorU3UtfsXvX5bjr+JyzkqIXXancYJC6/s49zXzvXUhlW
        knYoE6pFYr7f4JBaWFSQqMZ4
X-Google-Smtp-Source: ABdhPJyJnj/p+vUxeLJVxxvYCzer11toJefI++DZ8naeSh+0UEIWEUfHodTEVNS3228qK1N99sRZvg==
X-Received: by 2002:a17:90b:4ac8:: with SMTP id mh8mr2530284pjb.38.1612346307909;
        Wed, 03 Feb 2021 01:58:27 -0800 (PST)
Received: from ?IPv6:2409:4072:619f:ff99:700b:51f3:e28:b00? ([2409:4072:619f:ff99:700b:51f3:e28:b00])
        by smtp.gmail.com with ESMTPSA id x184sm1941480pfb.199.2021.02.03.01.58.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 01:58:26 -0800 (PST)
Date:   Wed, 03 Feb 2021 15:28:20 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20210202091459.0c41a769@xps13>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org> <20210201151824.5a9dca4a@xps13> <20210202041614.GA840@work> <20210202091459.0c41a769@xps13>
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
Message-ID: <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Miquel,=20

On 2 February 2021 1:44:59 PM IST, Miquel Raynal <miquel=2Eraynal@bootlin=
=2Ecom> wrote:
>Hi Manivannan,
>
>Manivannan Sadhasivam <manivannan=2Esadhasivam@linaro=2Eorg> wrote on Tue=
,
>2 Feb 2021 09:46:14 +0530:
>
>> Hi,
>>=20
>> On Mon, Feb 01, 2021 at 03:18:24PM +0100, Miquel Raynal wrote:
>> > Hi Manivannan,
>> >=20
>> > Manivannan Sadhasivam <manivannan=2Esadhasivam@linaro=2Eorg> wrote on
>Sat,
>> > 30 Jan 2021 09:24:12 +0530:
>> >  =20
>> > > The bbt pointer will be unavailable when NAND_SKIP_BBTSCAN option
>is
>> > > set for a NAND chip=2E The intention is to skip scanning for the
>bad
>> > > blocks during boot time=2E =20
>> >=20
>> > I don't have the same understanding: this flag skips the bad block
>> > table scan, not the bad block scan=2E We do want to scan all the
>devices
>> > in order to construct a RAM based table=2E
>> >  =20
>> > > However, the MTD core will call
>> > > _block_isreserved() and _block_isbad() callbacks unconditionally
>for
>> > > the rawnand devices due to the callbacks always present while
>collecting
>> > > the ecc stats=2E
>> > >=20
>> > > The _block_isreserved() callback for rawnand will bail out if bbt
>> > > pointer is not available=2E But _block_isbad() will continue
>without
>> > > checking for it=2E So this contradicts with the NAND_SKIP_BBTSCAN
>option
>> > > since the bad block check will happen anyways (ie=2E, not much
>difference
>> > > between scanning for bad blocks and checking each block for bad
>ones)=2E
>> > >=20
>> > > Hence, do not check for the bad block if bbt pointer is
>unavailable=2E =20
>> >=20
>> > Not checking for bad blocks at all feels insane=2E I don't really get
>the
>> > scope and goal of such change?
>> >  =20
>>=20
>> The issue I encountered is, on the Telit FN980 device one of the
>> partition seems to be protected=2E So trying to read the bad blocks in
>> that partition makes the device to reboot during boot=2E
>
>o_O
>
>Reading a protected block makes the device to reboot?
>
>What is the exact device? Can you share the datasheet? Is this behavior
>expected? Because it seems really broken to me, a read should not
>trigger *anything* that bad=2E
>

I got more information from the vendor, Telit=2E The access to the 3rd par=
tition is protected by Trustzone and any access in non privileged mode (whe=
re Linux kernel runs) causes kernel panic and the device reboots=2E=20

>> There seems to be no flag passed by the parser for this partition=2E So
>> the only way I could let the device to boot is to completely skip the
>> bad block check=2E
>
>We do have a "lock" property which informs the host to first unlock the
>device, would this help? Is this locking reversible?
>
>> AFAIK, MTD core only supports checking for the reserved blocks to be
>> used for BBM and there is no way to check for a reserved partition
>like
>> this=2E
>
>It sounds like a chip specificity/bug, would it make sense to add a
>specific vendor implementation for that?
>

So looks like this is a vendor quirk but this case might arise in future f=
or other platforms as well=2E=20

Thanks,=20
Mani

>> I agree that skipping bad block check is not a sane way but I don't
>know
>> any other way to handle this problem=2E
>>=20
>> Thanks,
>> Mani
>>=20
>
>Thanks,
>Miqu=C3=A8l

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
