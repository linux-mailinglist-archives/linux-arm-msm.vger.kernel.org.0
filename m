Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137323FB985
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 17:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237728AbhH3P7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 11:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237720AbhH3P7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 11:59:06 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673FEC061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 08:58:12 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso18912898otv.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FY2VA2VPS0PFv3jNVx3v2krt3aMF9FEesDIXjv70sZY=;
        b=qmKaHEDQEWijGlt9M6f2t5iEadeHD6W2gwpvcMOhMhprgbY3tbrV8V91B/E/MQHc27
         u7AM5LHRvdGnlhcV4j9GV7EfRRzaj0Hlgi5AYtFRh1E84XNjartSn3Cld1l49/J4HRT/
         pViRaCSyDKVqMzYm/r9GEY2oiuKNwMKihTLBgFSs5T5Ze70j2Q6SipESqpeySrOl0bhq
         9wbfYwEtY8ZHeuS1AmgKw9SZkvZEVdKAoQTHuDCXQ1tarfaOtgeG8jTslXSx1SDmAQvd
         UCVmResiMJx1dvY1JqJIG3WYLn2JhI0gAawvx3uUsj39w7FRTZwuhYD5GBRQUDX5SaxZ
         KzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FY2VA2VPS0PFv3jNVx3v2krt3aMF9FEesDIXjv70sZY=;
        b=kmb46jvty2iokfn0qX2qvIzmWSJhWhsqzrDi6ubUHy59idH2TaLiM01FZlq6gj5Bc+
         ZkojmIrIe8QldE+zBMfWTsd9uYT4/I/T1NWjqig7HWLlvI/0RM7pvrHj+06bIkb9KbNJ
         1XoinfuMSumvdtdpf+iXAL/hH1rKaXPSnj2kqFVZnCL+1jbnoS2MGM2FqAoprpydFauQ
         lFx+NvqRS6AS5+t6BjPYsr5qiXXjNoTFVbjyoDgy9G2tgasz1Xqk4TCTPbqM+lehRP3p
         ZurngQxTHKotG5ekPYD9NhkSYuEFFa39YGR6LnYTNDt+VGPwtv7VYwfGZtgwOAiLPpNA
         x4KA==
X-Gm-Message-State: AOAM531jKjv1dRRRtcRHFjvuRM2hf+7foPOoexfu7tUyjyZv8EWOXytK
        rTRCIRqXtZF6b1LqKwH4PUtapQ==
X-Google-Smtp-Source: ABdhPJxdyszdxt5Si2XTSb8nyAs1TDBREjU2cIHp64OHvdLDifuUoynPAUN7kq4KaGkq4BJdDfWkkQ==
X-Received: by 2002:a05:6830:4117:: with SMTP id w23mr19635301ott.40.1630339091617;
        Mon, 30 Aug 2021 08:58:11 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l3sm3271303otd.79.2021.08.30.08.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 08:58:11 -0700 (PDT)
Date:   Mon, 30 Aug 2021 10:58:09 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm: dts: qcom: apq8064: Use 27MHz PXO clock as DSI
 PLL reference
Message-ID: <YS0AEZR7NhmDhHmk@yoga>
References: <20210829203027.276143-1-marijn.suijten@somainline.org>
 <20210829203027.276143-2-marijn.suijten@somainline.org>
 <CAA8EJprQ03ipZzO+1vgt9W7jFbLXgsYR0n-oJxVB-142x8dgRA@mail.gmail.com>
 <17d19b93-dbe5-cc85-f302-b52cd8eeed56@somainline.org>
 <CAA8EJpqd7_5510TodALnX13Wo0MufYm2G=r6vw9sy=VURrewyw@mail.gmail.com>
 <YSznouVZ93sUd6xa@Marijn-Arch-PC.localdomain>
 <CAA8EJpoRo6rPgpUeT9X0K4UPu5d8-YBP=BJ3AAejD+wujhmv+g@mail.gmail.com>
 <YSzqR2yq3MtdPnIG@Marijn-Arch-PC.localdomain>
 <YSz2kVKv8jhz7/n8@yoga>
 <YSz7NZD7elH3+XgP@Marijn-Arch-PC.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSz7NZD7elH3+XgP@Marijn-Arch-PC.localdomain>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 30 Aug 10:37 CDT 2021, Marijn Suijten wrote:

> On Mon, Aug 30, 2021 at 10:17:37AM -0500, Bjorn Andersson wrote:
> > On Mon 30 Aug 09:25 CDT 2021, Marijn Suijten wrote:
> > 
> > > On Mon, Aug 30, 2021 at 05:18:37PM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, 30 Aug 2021 at 17:14, Marijn Suijten
> > > > <marijn.suijten@somainline.org> wrote:
> > > > >
> > > > > On Mon, Aug 30, 2021 at 04:24:58PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Mon, 30 Aug 2021 at 11:28, Marijn Suijten
> > > > > > <marijn.suijten@somainline.org> wrote:
> > > > > > >
> > > > > > > Hi Dmitry,
> > > > > > >
> > > > > > > On 8/30/21 3:18 AM, Dmitry Baryshkov wrote:
> > > > > > > > On Sun, 29 Aug 2021 at 23:30, Marijn Suijten
> > > > > > > > <marijn.suijten@somainline.org> wrote:
> > > > > > > >>
> > > > > > > >> The 28NM DSI PLL driver for msm8960 calculates with a 27MHz reference
> > > > > > > >> clock and should hence use PXO, not CXO which runs at 19.2MHz.
> > > > > > > >>
> > > > > > > >> Note that none of the DSI PHY/PLL drivers currently use this "ref"
> > > > > > > >> clock; they all rely on (sometimes inexistant) global clock names and
> > > > > > > >> usually function normally without a parent clock.  This discrepancy will
> > > > > > > >> be corrected in a future patch, for which this change needs to be in
> > > > > > > >> place first.
> > > > > > > >>
> > > > > > > >> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > > > > >
> > > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > >
> > > > > > > > Checked the downstream driver, it always uses 27 MHz clock in calculations.
> > > > > > >
> > > > > > >
> > > > > > > Given our concerns for msm8974 not updating DT in parallel with the
> > > > > > > kernel (hence the need for a global-name fallback because "ref" is
> > > > > > > missing from the DT), should we worry about the same for apq8064?  That
> > > > > > > is, is there a chance that the kernel but not the firmware is upgraded
> > > > > > > leading to the wrong parent clock being used?  The msm8960 variant of
> > > > > > > the 28nm PLL driver uses parent_rate in a few places and might read
> > > > > > > cxo's 19.2MHz erroneously instead of using pxo's 27MHz.
> > > > > >
> > > > > > Checked the code. It uses .parent_names =  "pxo", so changing ref
> > > > > > clock should not matter. We'd need to fix ref clocks and after that we
> > > > > > can switch parent names to fw_name.
> > > > >
> > > > > Correct, hence why this patch is ordered before the switch to .fw_name.
> > > > > These patches can't go in the same series if apq8064 doesn't update its
> > > > > firmware in parallel with the kernel just like msm8974.  Do you know if
> > > > > this is the case?  If so, how much time do you think should be between
> > > > > the DT fix (this patch) and migrating the drivers?
> > > > 
> > > > You can have parent_data with .fw_name and .name in it.  .name will be
> > > > used as a fallback if .fw_name doesn't match.
> > > 
> > > The problem is that it will always find the "ref" clock which references
> > > &cxo_board until the DT is updated with this patch to use &pxo_board
> > > instead.  Question is, will the kernel and DT usually/always be updated
> > > in parallel?
> > > 
> > 
> > Afaik these devices all boots off a boot.img, which means that it's
> > unlikely that a new kernel is installed on a device with an older DT.
> > None of them would boot mainline off the DT that shipped with the
> > original product.
> 
> That was my understanding as well, DT overlays are a "new thing" afaik
> and most devices (at least all Sony's that I'm working with) use an
> appended DTB that's always in-sync with the kernel image.
> 

I think that with the introduction of DT overlays the system becomes
more flexible and as such more susceptible for bugs caused by unexpected
DT versions.

I think in practice the real issues comes when the DTB is delivered
separately (i.e. not by boot.img) or inbetween two kernel releases where
the Qualcomm tree might not be in sync with the driver tree.

> > As such, if I pick this patch up as a fix for 5.15 you can respin the
> > other two patches and they can land in 5.16 and I would be surprised if
> > anyone will run into any issues with it.
> > 
> > I.e. I've applied this patch.
> 
> Sounds good, I'll leave this patch out from v2.  Should it have a Fixes:
> tag to get backported too?
> 

Sounds good, I added to this:

Fixes: 6969d1d9c615 ("ARM: dts: qcom-apq8064: Set 'cxo_board' as ref clock of the DSI PHY")

> Since most review seems to be in I'll respin v2 shortly with the
> addition of the "ref" clock to msm8974, that should probably get the
> same treatment (added to 5.15 fixes) then we can land this patchset in
> 5.16 (maybe without .name= fallback if Dmitry is okay with that).
> 

Sounds good.

Regards,
Bjorn
