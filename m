Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8162048DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 06:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgFWEeb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 00:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgFWEeb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 00:34:31 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901D3C061573;
        Mon, 22 Jun 2020 21:34:30 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id y6so15331558edi.3;
        Mon, 22 Jun 2020 21:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=vTeZQMR6ZhnCXik/oXOXmIQqvELc/TxSWzy9uL/31UY=;
        b=jOKZnD7mXM8FWyNqhibBcX1m9v/qXbf/K1QnOToCJvQrfaf+FrvtIYbh+pzAwMGLCp
         RwLPI4KlxX/9umR8nqJyBFNravRaH/QVoWxhpuREp7bOtm9/P+415zV3mqhkRyaamDNX
         xJRhZodyDZU8I/OkbEGc82wzsjZCEXDl6ZrjFHr6wdKR7+l4oQhK1o/B4zYqOJCYDF0w
         BUTbX5+SeJyhlo54z3B9pdAt8+aNsDIUlf3jdRobgywNV7UkXGpIiJO3Q+ZoLS7G74dI
         XLJPwMUCpx62ddcULz8Bf6qXF0kv4Hu6/iq2yapYOgKDWOYU8Ts+ShsQzXh3wD9TTLg4
         Gmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=vTeZQMR6ZhnCXik/oXOXmIQqvELc/TxSWzy9uL/31UY=;
        b=ZnasVW1FGDo9P1hlgpmV2BKVNdWGkAsM1hxGk/iqJtX+FA3NpwZLhbX0yURdmzsd3S
         rgf1aBGrx9qYHO99GDwYpi1ka2fQ4Y0TeBzj/6MjY8Cv8keGZGP8kyCg0EUGOqxGqJlC
         zrojOXsqPCJqN1nIkWSKzRPzCSWD7moxdcb9dHCo3z5ZOAs2uuXA1DUealGXlPiN4jA/
         5lsPrahC8AT1+3641Qx8I5oGu9EcJy7G+3gDo/aUkBxlCm96F+XPqcn8j4wYbbSlCGBf
         GYiZ5AGqFsRVzTbPH5OsuQM9w59tkTHCxUpQklNtEdkJsQnx8ZBGrelscpyYKjD1P2Z0
         l5Zw==
X-Gm-Message-State: AOAM532ef8Cqs1YQ3aaOm7y2XJ7CjyA+7MIocrW/IXWPJXr9fnHPmFBg
        qjZCBloW4ZoQqXHuBtXo6fH3hgOnmYVfKXJJ6A==
X-Google-Smtp-Source: ABdhPJwp8nsS0JzZJ1ZSjHpZRO/XLcsX7AXTS44UIjHYsZzAdqT1pe8KOQMv32inGY+BU+RajHcFq4WzVgxEJatGs1U=
X-Received: by 2002:a05:6402:1d10:: with SMTP id dg16mr19754928edb.309.1592886869158;
 Mon, 22 Jun 2020 21:34:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa7:ca0e:0:0:0:0:0 with HTTP; Mon, 22 Jun 2020 21:34:28
 -0700 (PDT)
In-Reply-To: <CAF6AEGuG3XAqN_sedxk9GRm_9yK+a4OH56CZPmbHx+SW-FNVPQ@mail.gmail.com>
References: <cover.1586374414.git.asutoshd@codeaurora.org> <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
 <CAF6AEGvgmfYoybv4XMVVH85fGMr-eDfpzxdzkFWCx-2N5PEw2w@mail.gmail.com>
 <SN6PR04MB46402FD7981F9FCA2111AB37FC960@SN6PR04MB4640.namprd04.prod.outlook.com>
 <20200621075539.GK128451@builder.lan> <CAF6AEGuG3XAqN_sedxk9GRm_9yK+a4OH56CZPmbHx+SW-FNVPQ@mail.gmail.com>
From:   Kyuho Choi <chlrbgh0@gmail.com>
Date:   Tue, 23 Jun 2020 13:34:28 +0900
Message-ID: <CAP2JTQJ735yQYSeHgDPqnT0mRUTt1uKVAHacOHmSj3WK48PUog@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
To:     Rob Clark <robdclark@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 6/22/20, Rob Clark <robdclark@gmail.com> wrote:
> On Sun, Jun 21, 2020 at 12:58 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>>
>> On Sun 21 Jun 00:40 PDT 2020, Avri Altman wrote:
>>
>> >
>> > >
>> > > On Wed, Apr 8, 2020 at 3:00 PM Asutosh Das <asutoshd@codeaurora.org>
>> > > wrote:
>> > > >
>> > > > The write performance of TLC NAND is considerably
>> > > > lower than SLC NAND. Using SLC NAND as a WriteBooster
>> > > > Buffer enables the write request to be processed with
>> > > > lower latency and improves the overall write performance.
>> > > >
>> > > > Adds support for shared-buffer mode WriteBooster.
>> > > >
>> > > > WriteBooster enable: SW enables it when clocks are
>> > > > scaled up, thus it's enabled only in high load conditions.
>> > > >
>> > > > WriteBooster disable: SW will disable the feature,
>> > > > when clocks are scaled down. Thus writes would go as normal
>> > > > writes.
>> > >
>> > > btw, in v5.8-rc1 (plus handful of remaining patches for lenovo c630
>> > > laptop (sdm850)), I'm seeing a lot of:
>> > >
>> > >   ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending flag query
>> > > for
>> > > idn 14 failed, err = 253
>> > >   ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending flag query
>> > > for
>> > > idn 14 failed, err = 253
>> > >   ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag_retry: query
>> > > attribute,
>> > > opcode 6, idn 14, failed with error 253 after 3 retires
>> > >   ufshcd-qcom 1d84000.ufshc: ufshcd_wb_ctrl write booster enable
>> > > failed 253
>> > >
>> > > and at least subjectively, compiling mesa seems slower, which seems
>> > > like it might be related?
>> > This looks like a device issue to be taken with the flash vendor:
>>
>> There's no way for a end-user to file a bug report with the flash vendor
>> on a device bought from an OEM and even if they would accept the bug
>> report they wouldn't re-provision the flash in an shipped device.
>>
>> So you will have to work around this in the driver.
>
> oh, ugg.. well I think these msgs from dmesg identify the part if we
> end up needing to use a denylist:
>
> scsi 0:0:0:49488: Well-known LUN    SKhynix  H28S8Q302CMR     A102 PQ: 0
> ANSI: 6
> scsi 0:0:0:49476: Well-known LUN    SKhynix  H28S8Q302CMR     A102 PQ: 0
> ANSI: 6
> scsi 0:0:0:49456: Well-known LUN    SKhynix  H28S8Q302CMR     A102 PQ: 0
> ANSI: 6
> scsi 0:0:0:0: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI:
> 6
> scsi 0:0:0:1: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI:
> 6
> sd 0:0:0:0: [sda] 29765632 4096-byte logical blocks: (122 GB/114 GiB)
> sd 0:0:0:0: [sda] Write Protect is off
> sd 0:0:0:0: [sda] Mode Sense: 00 32 00 10
> sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports
> DPO and FUA
> sd 0:0:0:0: [sda] Optimal transfer size 786432 bytes
> scsi 0:0:0:2: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI:
> 6
> scsi 0:0:0:3: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI:
> 6
>

AFAIK, this device are ufs 2.1. It's not support writebooster.

I'd check latest linux scsi branch and ufshcd_wb_config function's
called without device capability check.

ufshcd_wb_config
 -> ufshcd_is_wb_allowed
     -> only check about hba caps with writebooster

Asutosh's first patch already check about device's capability in here.

IMO, it would be need to fixing in ufshcd_probe_hba or ufshcd_wb_config.

>
> (otoh I guess the driver could just notice that writeboost keeps
> failing and stop trying to use it)
>
> BR,
> -R
>
>
>> Regards,
>> Bjorn
>>
>> > The device reports that it supports wd, but returns inalid idn for flag
>> > 0xe...
>> >
>> > Thanks,
>> > Avri
>
