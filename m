Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E96202B9F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 18:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730421AbgFUQuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 12:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730411AbgFUQuR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 12:50:17 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F420C061794;
        Sun, 21 Jun 2020 09:50:17 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id n24so15499036ejd.0;
        Sun, 21 Jun 2020 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/oeYmT0gf/BQf5rhsOaYvoPP5ayrLP9PM0KP+IAgfg=;
        b=WC/NqBMGWLqBQRZbzUo1d4ajwpofeyOODarATg8fVi1KkjU+anC7Pom0DeZCqPelxu
         XrRcKDvuIBUgVs3cUzYJOC83XgFBC6pKZU8C34sw0ONUdCf4N/dnOWPj+oqhEuznsnKV
         oZFMQCqtevhZdAGtoZVIBpcM1s77qdqWW5yxbGI7Bes0hQCUV5mUlIDKESpVEJ2u7QLF
         mGeRJYH1uJNJIq0/VOje77BpxGIZU+rTJ40DdB6jFYppD/f4VRxhIceQHkGwFB83P/OI
         TA2jMQDCisNagqz/E/xuwDfOlPtEHywOhE2n7JGq8Ttq2YqVjmiCafXBQEP609cC6L1q
         espA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/oeYmT0gf/BQf5rhsOaYvoPP5ayrLP9PM0KP+IAgfg=;
        b=rlRnCOnFHfe8d1RJ/A5Fxw+3pxmpjT4lBwe+eQMnRzvOGAd8sla/cDTl/6aX3ZdQp0
         FPT/PGKb72ax6GnNrkN9dmHIST/YqeonJzbmECFi1z9Yx+YjdDepMo8FZCd+g3m6A6ID
         ocNQ6jXzGyu5ys+jPPWakoUqVnuShSnjKk78rHhKW8h664MDWhYzd6mLp/HCBkF0ebPf
         dgHIEWHFbdaOX44i0dBLkJm6Z0g/sI8CFSZ0K9XY1paBU6FjIBFVlFiY8Sh6n3hcBQB+
         d+vKZe6CN16yHphVegNsncv1UQKbWgvrP3i0knaKShvMeSYB9TxeAvEg9k7XQb2Otncs
         nV4g==
X-Gm-Message-State: AOAM532NuKj75uB0zJ2PpD7eQZxLzUlRCYw+dq7rFp4v7UVmK1ACGhv7
        dM81Tb6KuMxhsYGvLtI9ic2oI40lFD6vkQDEJiw=
X-Google-Smtp-Source: ABdhPJxSdA2O9bfRHd4FEkpgAkg0zBjCVSJMWG2BUWgw83KJC+QN/PKfGTm3H9P6BtV5cQTTx+7xynA2gzaW3NiUvAM=
X-Received: by 2002:a17:906:856:: with SMTP id f22mr3072421ejd.245.1592758215478;
 Sun, 21 Jun 2020 09:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586374414.git.asutoshd@codeaurora.org> <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
 <CAF6AEGvgmfYoybv4XMVVH85fGMr-eDfpzxdzkFWCx-2N5PEw2w@mail.gmail.com>
 <SN6PR04MB46402FD7981F9FCA2111AB37FC960@SN6PR04MB4640.namprd04.prod.outlook.com>
 <20200621075539.GK128451@builder.lan>
In-Reply-To: <20200621075539.GK128451@builder.lan>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 21 Jun 2020 09:50:43 -0700
Message-ID: <CAF6AEGuG3XAqN_sedxk9GRm_9yK+a4OH56CZPmbHx+SW-FNVPQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Avri Altman <Avri.Altman@wdc.com>,
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

On Sun, Jun 21, 2020 at 12:58 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sun 21 Jun 00:40 PDT 2020, Avri Altman wrote:
>
> >
> > >
> > > On Wed, Apr 8, 2020 at 3:00 PM Asutosh Das <asutoshd@codeaurora.org>
> > > wrote:
> > > >
> > > > The write performance of TLC NAND is considerably
> > > > lower than SLC NAND. Using SLC NAND as a WriteBooster
> > > > Buffer enables the write request to be processed with
> > > > lower latency and improves the overall write performance.
> > > >
> > > > Adds support for shared-buffer mode WriteBooster.
> > > >
> > > > WriteBooster enable: SW enables it when clocks are
> > > > scaled up, thus it's enabled only in high load conditions.
> > > >
> > > > WriteBooster disable: SW will disable the feature,
> > > > when clocks are scaled down. Thus writes would go as normal
> > > > writes.
> > >
> > > btw, in v5.8-rc1 (plus handful of remaining patches for lenovo c630
> > > laptop (sdm850)), I'm seeing a lot of:
> > >
> > >   ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending flag query for
> > > idn 14 failed, err = 253
> > >   ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending flag query for
> > > idn 14 failed, err = 253
> > >   ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag_retry: query attribute,
> > > opcode 6, idn 14, failed with error 253 after 3 retires
> > >   ufshcd-qcom 1d84000.ufshc: ufshcd_wb_ctrl write booster enable failed 253
> > >
> > > and at least subjectively, compiling mesa seems slower, which seems
> > > like it might be related?
> > This looks like a device issue to be taken with the flash vendor:
>
> There's no way for a end-user to file a bug report with the flash vendor
> on a device bought from an OEM and even if they would accept the bug
> report they wouldn't re-provision the flash in an shipped device.
>
> So you will have to work around this in the driver.

oh, ugg.. well I think these msgs from dmesg identify the part if we
end up needing to use a denylist:

scsi 0:0:0:49488: Well-known LUN    SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
scsi 0:0:0:49476: Well-known LUN    SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
scsi 0:0:0:49456: Well-known LUN    SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
scsi 0:0:0:0: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
scsi 0:0:0:1: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
sd 0:0:0:0: [sda] 29765632 4096-byte logical blocks: (122 GB/114 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 32 00 10
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports
DPO and FUA
sd 0:0:0:0: [sda] Optimal transfer size 786432 bytes
scsi 0:0:0:2: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
scsi 0:0:0:3: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6


(otoh I guess the driver could just notice that writeboost keeps
failing and stop trying to use it)

BR,
-R


> Regards,
> Bjorn
>
> > The device reports that it supports wd, but returns inalid idn for flag 0xe...
> >
> > Thanks,
> > Avri
