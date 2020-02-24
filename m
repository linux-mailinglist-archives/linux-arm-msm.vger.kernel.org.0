Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5122816A20A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 10:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgBXJWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 04:22:37 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42394 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbgBXJWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 04:22:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id d10so9220078ljl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2020 01:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6IEmiaHapk6QuDqeMErumlPa8et/eIwPs40Qk1bfYgc=;
        b=mCBMWYYqAHMR1ZOOQ/Xg/vzqfery4zqmmLRGpoYgxrjdA4Q1Uww5DUY1ykwNL5vj1m
         dDkWZmOOO3rH78G8E2kNRcLcwSKd0xFOr4YUKvUGyDP0zzdCSV61daFqOFB2mW+OEIBI
         MILR0t2OZ56prHlip00+fX94J2//ufdKb/XNN2fXotXNpfz3M/iTpDWO4CbzfQOosC6g
         EwEq4ooPMgu9Ee1o3kApERx/dxtC01uuwGUYpmmT7O6ODTaCDgBS7BwXlUsmkxPaIeHp
         TXppKl687E+BHpEod0khQ53EyzDT7CRUciYN1I+o6PXcCJTpadx2Cx6QajhJclf6sJmi
         75ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6IEmiaHapk6QuDqeMErumlPa8et/eIwPs40Qk1bfYgc=;
        b=EB2w+50H+k0fwsH45Tl97u+2qmsEZBG9vkr5lZX0OEQg8vDJmVswFEZTaS5rs4gd/R
         qKB1oNplymdGqAgkvTICoaZh1NZ4efU+nNWcPnjXvyEle/8fus9VmIB/TPqyBS65rGl3
         cAnzDVcs4ZUCUz65asekIir+Nk7EUxIC7dOg6M5BCfgvN1yGnGwQf6HpHOcIjLOm70me
         Xa08hcCp7q/EbaCCYgCZ112ESaZDb9OnxrQp9pUwbOF/2juuzpMmSobRr1vFgw8VFV+8
         9bbHPNJAL7VWGviKexehAlA5aLdptKo3OXVXAmCYV+p3ULYyKlCnRfp5D7WWBXmjLIJy
         nsXA==
X-Gm-Message-State: APjAAAV3RdlTpCG2hUtcSsZa5ml9kFfbt5tSmG3CmGlw+UmWfhN0C4KS
        fgt/sLVKWLuCIXFdnb1ixUtRR/ybUK1qXF+E/X3DdQ==
X-Google-Smtp-Source: APXvYqxo3IaO4blkCFbL5ffJSwUgUjvv9cby45Snl6DaczaaGadZAmXHW8yRJgcNEw+v5J4YbI+kZQ+QV61O3UcyP7I=
X-Received: by 2002:a2e:865a:: with SMTP id i26mr30176075ljj.236.1582536153013;
 Mon, 24 Feb 2020 01:22:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582048155.git.amit.kucheria@linaro.org>
 <9fa8a4e09b6fcff4b9d4facc9f9e9f8e3c4a41d5.1582048155.git.amit.kucheria@linaro.org>
 <158215294977.184098.9773724834739432956@swboyd.mtv.corp.google.com>
In-Reply-To: <158215294977.184098.9773724834739432956@swboyd.mtv.corp.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 24 Feb 2020 14:52:21 +0530
Message-ID: <CAP245DVWWN8Au4pb74rewcQ+tWR5GDdVjSCssuSf-VvQnvtnXg@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] drivers: thermal: tsens: Release device in success path
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, Amit Kucheria <amit.kucheria@verdurent.com>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 20, 2020 at 4:25 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2020-02-18 10:12:08)
> > We don't currently call put_device in case of successfully initialising
> > the device.
>
> Sure, but why is that a problem? Presumably the device is kept pinned
> forever?

Right, we keep the reference forever. Will fix the commit message.
>
> >
> > Allow control to fall through so we can use same code for success and
> > error paths to put_device.
> >
> > As a part of this fixup, change devm_ioremap_resource to act on the same
> > device pointer as that used to allocate regmap memory. That ensures that
> > we are free to release op->dev after examining its resources.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
