Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66D946CAE5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 03:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239422AbhLHCht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 21:37:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239301AbhLHChs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 21:37:48 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC331C061746
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 18:34:17 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id bj13so2120551oib.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 18:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=swYbIKXZwCxN7BEjYyOh4y2RX8/uUSdKltZAr/TgTXo=;
        b=lCT5m/DheAoLESezSAHnOx6EPN+fR2HmAHIfS2KFDvDs53zsDwVvERYFxblZA/jBSU
         sY9YvJD3SrWdY5wm1UxmRT/lNO6cvHEOBtPs0Ea8EsjlV5t1Mc1yZOGnb8A8r48SlUHB
         7xTrTJ8WbA79P0LvtSn8X56LM3Lf8LWOXdbn+DMfZzh40O/qHF0dZX21V9piAVJiDa/M
         KlVzDE6cgUMej+yFg7c4Up3vrVff2sxgtjDsQmqcTS8jDWDWb0Q1ARYt+8cNFn1242yL
         5ftG18EjEPT5HnDXiJV/QtZ1Sg1TTwTa2+CinATuZqtuHJ1FVlswVpvt84aRScYTlnGI
         F6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=swYbIKXZwCxN7BEjYyOh4y2RX8/uUSdKltZAr/TgTXo=;
        b=OHRiqB1zX4EC9hF81pzIMQK+SAgFR0E8ErrjmC0yMTeft1XqVuXfE59JoM3Jle9pfQ
         C3fnYhRXtPTx/QnWjHuo9PKRS3jl3wMqnPh/gkFvQxYFZ0/qkHsqG142/Gz7jqcyEM62
         6yEDvFxe6Fl6swV/Lq7GPzHV08h46GjVqEPvSNYw6QUCh84AlbjMSvuJtpCA0+WJceI3
         2n4xsnIDBmWsfYDtpId8MjWJDWd7pqn6Z29+kYppyDLRIW54+gDOwIki3imOfjcODaJn
         C3FY3bFLnDruPtNuoBS/gyKzSV7I/H/jonJYUjp4h75flRQuDL39cCYmRh5eVcEsjZmd
         WCGQ==
X-Gm-Message-State: AOAM530qk8A3PLARl0vi2O5V4D1vqlHBKg3V1gWxryeOrp/sR6E0SyrK
        PCOCshH2Oo3UGMpYBxVEIrGuqrv0DS7qSA==
X-Google-Smtp-Source: ABdhPJx4m5dCKYZXmKUZ3c48YvbWI3pJQxojvA6806ufdcrvSlQl0Y3KluJC9e386yX7igTovGWk+g==
X-Received: by 2002:a05:6808:1411:: with SMTP id w17mr8959660oiv.10.1638930857004;
        Tue, 07 Dec 2021 18:34:17 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bf17sm398304oib.27.2021.12.07.18.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 18:34:16 -0800 (PST)
Date:   Tue, 7 Dec 2021 18:35:41 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Katherine Perez <kaperez@linux.microsoft.com>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: sm8350: fix tlmm base address
Message-ID: <YbAZ/YHMWQZ27NrG@ripper>
References: <20211122190552.74073-1-kaperez@linux.microsoft.com>
 <20211122190552.74073-3-kaperez@linux.microsoft.com>
 <YZxoGp33Seaa2WEG@matsya>
 <Yabo0fGXC1rITmsM@builder.lan>
 <Ya9JhqZ/Hyj9HdRk@matsya>
 <20211208022103.GA15963@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208022103.GA15963@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Dec 18:21 PST 2021, Katherine Perez wrote:

> On Tue, Dec 07, 2021 at 05:16:14PM +0530, Vinod Koul wrote:
> > On 30-11-21, 21:15, Bjorn Andersson wrote:
> > > On Mon 22 Nov 22:03 CST 2021, Vinod Koul wrote:
> > > 
> > > > On 22-11-21, 11:05, Katherine Perez wrote:
> > > > > TLMM controller base address is incorrect and will hang on some platforms.
> > > > > Fix by giving the correct address.
> > > > 
> > > > Thanks, recheck the spec this looks correct. We should have tlmm reg
> > > > space here and not tlmm base which also contains xpu region (thus hang)
> > > > 
> > > 
> > > Aren't you reading the patch backwards?
> > 
> > I guess :(
> > 
> > > Afaict downstream the driver carries an offset of 0x100000, which we
> > > dropped as we upstreamed the driver. As such changing reg to 0x0f000000
> > > should cause most gpio register accesses to fall outside the actual
> > > register window.
> > > 
> > > Or perhaps I'm missing something here?
> > 
> > I relooked and XPU is at 0xF000000 and Reg at 0xF100000
> > So this patch should be dropped as such. The size mentioned in
> > documentation is also correct
> > 
> > Katherine, can you elaborate more on the hang you have observed? Any
> > specific pins you use which causes this?
> 
> Hi Vinod,
> 
> Yes, it seems to hang in msm_pinctrl_probe. Specifically, line 734 in
> gpiolib.c: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpiolib.c#n734.
> On i=4, it hangs on assign_bit and the system goes into a reboot loop.
> When I set the TLMM address to f000000, I don't see this issue at all.
> 

The cause for that is quite likely that gc->get_direction() will read
the configuration from gpio<i>'s registers and gpio4 in your system is
reserved for use by some trusted application.

When you change the TLMM address you avoid this problem by just reading
random registers outside the region that contains protected registers.


Adjust the gpio-reserved-ranges in your device's tlmm node to mark gpio4
(probably 4 pins long) as "invalid", gpiolib will then not touch them.

Regards,
Bjorn

> > 
> > 
> > -- 
> > ~Vinod
