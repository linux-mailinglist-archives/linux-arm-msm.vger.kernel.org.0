Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288FF30D7F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 11:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbhBCKxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 05:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbhBCKxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 05:53:30 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F186AC061573
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 02:52:49 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id e19so16385766pfh.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 02:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=p3o0sLDAxz/W/SPP1XvuN5vOHHS8YIT9o0J8SbVCzPU=;
        b=W+4qYUqcIh38GzlEXekPSBK0jKJUGEAF+x3oEj1qvsDJyIdJCyVzcNlQ8qPkQZfa2f
         xsIU70exVuHxfOi+9bKpTjCutEsgBJx0yE9DHMt6PqDdAPO4ZytJQrHAq3/F3tlOJg7T
         mny54zCXL60z3U7jmXvxgA1TqpvVZeUJGNJX2b9Z+ZKGpyr0YQo0TZMir22j2UcPjFxI
         sTOHe8OC9dXMpZPCKVgEfoXWRyDgECs0by/ROKZFgrrOtBTa5yLVc8Nj+jEvxn2+QijJ
         DLF1g/Cg2OQxmYywTx0n/VxaOduTn92UMj1ZlHmrdaM0jh3Q+J41j9hT/KNVaP52bIEH
         HAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=p3o0sLDAxz/W/SPP1XvuN5vOHHS8YIT9o0J8SbVCzPU=;
        b=O8JbsOh0D/0aHRSBEHxXwyDRZ//iF26XbGL/TC1MBqCeozDM4++sf4M5guDUw3VyjZ
         +n7RXDk6IfMyHMZdkpiRZ3Zq6ChG9IaPKJjRpU5X4x4ueoGzprfqs9EyDQzj4oSp4Ubr
         lZPyTWr9EP0WB64ZmTJIjP8BspS7xZfXkwBD0QSwK+IuRB+hL9kmZiWYqh6RXZ5oiemu
         2Fy/By9WAD1GK8qpG8TNBcwepQrQt0DYWPpmFsnv8KhbASker7CB+lwK2KDCvn+Wnjio
         i5WP8hjkaOwzlVCw+5QXpWB5Cn6+LhBgFb6lei9qN3ePf9XT9DAleBrMg0FFb8lxLpbR
         rIWw==
X-Gm-Message-State: AOAM5330DxXoKvgarJsmvPlDMvL2BbEeB6hfOai0Qrz/ctd3u1qNBQII
        HYZKC8/p6EfU79AX+mlrf7/X
X-Google-Smtp-Source: ABdhPJzf5nDeWWg+gxoU7O5XqypjGXLwFZUdDgdnQHTCPf3Z/9XBQTN9ihVdCQS1qn8/Rf37ob5DhA==
X-Received: by 2002:a62:ae0c:0:b029:1bc:a0b9:f0aa with SMTP id q12-20020a62ae0c0000b02901bca0b9f0aamr2525847pff.78.1612349569452;
        Wed, 03 Feb 2021 02:52:49 -0800 (PST)
Received: from ?IPv6:2409:4072:619f:ff99:700b:51f3:e28:b00? ([2409:4072:619f:ff99:700b:51f3:e28:b00])
        by smtp.gmail.com with ESMTPSA id a12sm1772842pjs.53.2021.02.03.02.52.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:52:48 -0800 (PST)
Date:   Wed, 03 Feb 2021 16:22:42 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20210203111914.1c2f68f6@collabora.com>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org> <20210201151824.5a9dca4a@xps13> <20210202041614.GA840@work> <20210202091459.0c41a769@xps13> <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org> <20210203110522.12f2b326@xps13> <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org> <20210203111914.1c2f68f6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is unavailable
To:     Boris Brezillon <boris.brezillon@collabora.com>
CC:     Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3 February 2021 3:49:14 PM IST, Boris Brezillon <boris=2Ebrezillon@coll=
abora=2Ecom> wrote:
>On Wed, 03 Feb 2021 15:42:02 +0530
>Manivannan Sadhasivam <manivannan=2Esadhasivam@linaro=2Eorg> wrote:
>
>> >>=20
>> >> I got more information from the vendor, Telit=2E The access to the
>3rd =20
>> >partition is protected by Trustzone and any access in non privileged
>> >mode (where Linux kernel runs) causes kernel panic and the device
>> >reboots=2E=20
>
>Out of curiosity, is it a per-CS-line thing or is this section
>protected on all CS?
>

Sorry, I didn't get your question=2E=20

>> >
>> >Ok, so this is not a chip feature but more a host constraint=2E
>> >
>> >In this case it would be a good idea to add a host DT property which
>> >describes the zone to avoid accessing it=2E Something like:
>> >
>> >	secure-area/secure-section =3D <start length>;
>> >
>> >From the core perspective, we should parse this property early
>enough
>> >and return -EIO when trying to access this area=2E
>
>FWIW, I'm not sure making it part of the core is a good idea, at least
>not until we have a different platform with a same needs=2E The
>controller driver can parse it and return -EACCESS (or -EIO) when this
>section is accessed=2E

Fine with me=2E=20

Thanks,=20
Mani

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
