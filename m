Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 007E4C3E54
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 19:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729499AbfJAROQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 13:14:16 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38622 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbfJAROP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 13:14:15 -0400
Received: by mail-io1-f68.google.com with SMTP id u8so49915314iom.5;
        Tue, 01 Oct 2019 10:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XyW5421FuW5ERt/Ce918IFZBepV74zAfugKBY/uP7Sg=;
        b=vK3LWLU7yuz8B7Zud46nqKCjNTu81dzKhZrSHYSXRvB/IgwKwR6w1i5/fCVhXRbbt5
         4k41JFWg6X8g3p3uDJ07Wq91J7n/TR2bFueBJLFbc/dZY3xpRhkn99yDcuJ1JmDQ8Ou/
         KDvshQLRVZzp4Ldk+vJyVLnaApjyqx+YWWCiz4bwBtLZ1trdoblGfg0JF8rPin+2oqBb
         GgyMRoYqGvOnb30gxZMNrYKyn9xzJJXpuZsf0A4h6vsfKrwh/PCR108f6YmocjA6ftRF
         RvKDbiG3AaYk5Ee+tO+fc4r+Nc6+vhF9gg6z1agcVtrk/oeAna/4XWZfDKy0+JeAT5Xf
         3Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XyW5421FuW5ERt/Ce918IFZBepV74zAfugKBY/uP7Sg=;
        b=a4E3Ds8qNrh/kQNawlZTu/iTCBSoMUh+jlFX8G7tVFrnmjyTS7U6s8Lf6TlyNBBlRe
         iVdFcnEZ4d9+Tqa/kD64jTuKz4xJv4Sax8hq3jEtJwOZfiXYdWBrAozwKPLVPwGWNfSh
         PAj5FR+TiJ/qPHnE5KGdHqoOmTcl9LYEUcNY4c/7Nx85SiFfBnGEbgNpF/rsgf9M4qRO
         2jSA6urZuUEmKtBUVSLtmqhhaMC4PC4bdUZGt6iwNTR97wjCE1Fmw8CYTRiiCVVpr7el
         FLllvq7r41SHd3KQUDeRqCc9SPg1wmEPzxjZ3zTiRVDLd1h2pJdd98LE0NSvRqziPK9m
         qCDg==
X-Gm-Message-State: APjAAAVvN/TgBif8mDC33dFrpqj+LVUC1yT4epvkRy8zdTIBCSWFLquK
        gfQttfEF1Ihga3S9O+VtfTe+Zqzr+TPCphX9hKA=
X-Google-Smtp-Source: APXvYqyhUoMGDelw2H4alAIycEnclkAErTmS481biaJKBo0W4fbZxP1K4s6I7iegwA83GAipXqeecDL2qPXmAAwsEPo=
X-Received: by 2002:a6b:da06:: with SMTP id x6mr3828288iob.42.1569950055032;
 Tue, 01 Oct 2019 10:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com> <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
In-Reply-To: <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 1 Oct 2019 11:14:03 -0600
Message-ID: <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 1, 2019 at 11:04 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> On 2019-10-01 09:13, Jeffrey Hugo wrote:
> > Sai,
> >
> > This patch breaks boot on the 835 laptops.  However, I haven't seen
> > the same issue on the MTP.  I wonder, is coresight expected to work
> > with production fused devices?  I wonder if thats the difference
> > between the laptop and MTP that is causing the issue.
> >
> > Let me know what I can do to help debug.
> >
>
> I did test on MSM8998 MTP and didn't face any issue. I am guessing this
> is the same issue which you reported regarding cpuidle? Coresight ETM

Yes, its the same issue.  Right now, I need both patches reverted to boot.

> and cpuidle do not work well together since ETMs share the same power
> domain as CPU and they might get turned off when CPU enters idle states.
> Can you try with cpuidle.off=1 cmdline or just remove idle states from
> DT to confirm? If this is the issue, then we can try the below patch
> from Andrew Murray for ETM save and restore:
>
> https://patchwork.kernel.org/patch/11097893/

Is there still value in testing this if the idle states are removed,
yet the coresight nodes still cause issues?

Funny enough, I'm using the arm64 defconfig which doesn't seem to
select CONFIG_CORESIGHT, so I'm not even sure what would be binding to
the DT devices...

>
> It is not merged yet. They would appreciate your tested by ;)
>
> Thanks,
> Sai
