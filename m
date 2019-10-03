Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7EEBC9B68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 12:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbfJCKB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 06:01:28 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:39560 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729484AbfJCKB2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 06:01:28 -0400
Received: by mail-vs1-f66.google.com with SMTP id y129so1280403vsc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 03:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UEnce9ZGNK6HT79wNTFM+mDUHPObNI7m7R5zzYTteps=;
        b=RZr89Y05PnQTpfakYuRS2VFrxqrVXe8In69aQiNu7FBFkaV6/6BszMBXhEOB0m69WV
         qRCqQMqjGX7Ci17VEUSJSW+KVZDdfrbZ8nTOgUqEMwAHA+3CsQuS/HmgJRn8xSoKf6Fk
         OzXdELyGHM5VMaUI89j2HvE6MwkKS+1V4iEaIWy8WVjA9NXgpY6jNlTO39sGC+PxTEpR
         1ZCeCQmfmT95nr4Fq63GngCi9hcH1sqQKcHndyEEMskFEgo/+QP882dV1IFnZpepTtXo
         jJ+jftk8XSKVFXkOHIdOda/fc68qE6poyi5rHqcZwdWLv7CoIP6Vl3l4+2B7UPSHX1cv
         Il7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UEnce9ZGNK6HT79wNTFM+mDUHPObNI7m7R5zzYTteps=;
        b=kIu2xf4BpRsQrgFo07AcaBe4dXorQHVsVnmm04s/vusLymwFIbiSCZVzz09+F03dAi
         QuV/Ei2E4Ay8j8L16TdlNyPOukKXeZjYidzNDGU8auAs3yy/8TSduIdXjXqsn89ZiB8U
         cFSRfIrX/ks78x4yruIi3WJqLci1Kj0E+7Aj7XNpWrq++B66/b4xq2isWCIMWRN9P104
         CGBbjCyJXqq1AeTnxxQvExgklFEQrom0Qv2czk8EVA1hSZ7/C4uxgOiT7p3KQ/CuF4zy
         CU99q9o9oYs2mtJ7z1JH68MOUyX6gti5XL0u85gcn3cFjiQmiqGq16OyrFdZgV9JdIBY
         y89A==
X-Gm-Message-State: APjAAAW2sc5VjbN3aXjI0IadM0e6wHAnyWq8F1EBw4G3gCb5h2Slj16b
        +/kvhkrraz3VeRt5vo0rglzyLVcTAsaZykX3osW+Yj6r
X-Google-Smtp-Source: APXvYqw+o4DheMhGA5Wl3k9Gq4pREUePRebGoMxQiJRk7wc8yascNlwgALqB8DLpbal/tEphZov8AsvQMf++zEs6LAI=
X-Received: by 2002:a67:e414:: with SMTP id d20mr4532637vsf.191.1570096887523;
 Thu, 03 Oct 2019 03:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <1567774037-2344-1-git-send-email-ppvk@codeaurora.org>
 <1567774037-2344-2-git-send-email-ppvk@codeaurora.org> <20190912164532.GA8466@tuxbook-pro>
 <1b02d465353e12f47b372a7a240f0838@codeaurora.org>
In-Reply-To: <1b02d465353e12f47b372a7a240f0838@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Oct 2019 12:00:51 +0200
Message-ID: <CAPDyKFryLhOduNfupF_7WXb93tD26nWeTYKaF60wA3hcCOYy_A@mail.gmail.com>
Subject: Re: [RFC 1/2] mmc: sdhci-msm: Add support for bus bandwidth voting
To:     ppvk@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        rampraka@codeaurora.org,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-mmc-owner@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Sep 2019 at 13:27, <ppvk@codeaurora.org> wrote:
>
> On 2019-09-12 22:15, Bjorn Andersson wrote:
> > On Fri 06 Sep 05:47 PDT 2019, Pradeep P V K wrote:
> >
> >> Vote for the MSM bus bandwidth required by SDHC driver
> >> based on the clock frequency and bus width of the card.
> >> Otherwise,the system clocks may run at minimum clock speed
> >> and thus affecting the performance.
> >>
> >> This change is based on Georgi Djakov [RFC]
> >> (https://lkml.org/lkml/2018/10/11/499)
> >>
> >> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> >> Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
> >> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> >> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> >
> > This says that Sahitya wrote the patch, then Subhash handled it, then
> > Veerabhadrarao handled it and finally you handled it; but you're at the
> > same time listed as author (by From:).
> >
> > Please see section 12 on Co-Developed-by in submitting-patches.rst
> >
> Thanks Bjorn, i will update this on my next patch set.
> >> ---
> >>  drivers/mmc/host/sdhci-msm.c | 393
> >> ++++++++++++++++++++++++++++++++++++++++++-
> >
> > This patch implements support for requesting bandwidth to the register
> > space and for the controllers access to DDR. To me this seems like
> > common requirements for any mmc controller, can this functionality be
> > provided by the mmc/sdhci common code?
> >
> > Regards,
> > Bjorn
> >
> Yes, this can be provided in common code but the bandwidth calculations
> (arbitrated value or average bandwidth and instantaneous value or peak
> bandwidth) for bus vote will
> consider various parameters like voltage corners, clock domains, clock
> plans etc. which may differ from
> vendor to vendor and target to target. So, these values should be
> updated properly and correctly (considering all the parameters)
> if it brings to common area.
>
> Hence the reason for implementing this in sdhci-msm.c file.
> It would be really helpful if you could suggest your insights on where
> and how exactly this needs to be
> implemented in common code area.
>
> Hi Ulf and Adrian,
>
> Can you please also suggest your recommendations on this ?

I am not sure where to put it at this point. Perhaps we can just start
with making it specific for sdhci-msm, then when new users come into
play, we can consider moving it to a common place.

[...]

Kind regards
Uffe
