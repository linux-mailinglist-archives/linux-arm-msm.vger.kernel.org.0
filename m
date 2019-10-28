Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACBDBE7985
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 21:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbfJ1UCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 16:02:23 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39222 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbfJ1UCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 16:02:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id p12so7652900pgn.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2019 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZWh1WnHpSXynBwrGzEFdFS9dRaewgmpRz4cunacZkKY=;
        b=W/LyFiWCHVPxquHdd0jTr8+JG7XYRbQxGEDNVjf8MV4mQElYTsV8ePZkxAzktIHuCv
         NQSvIoYxVf4YtZxVlcgbG/z+IhIKCnEuLmZlYT9Vhq5tLITt04WSQL1WzLGZ0B9TZWu2
         Lf8ndycAMO3pfIrn17MaeD0PAKEZxRxNtJxoCssLqgrxZ9MfW9cGBwKkjkyPFd6vhG9N
         qro3IztbZH9pfkQeB+yCFIEQ5BAjPGi7lggkQlf3X8X8+26x6Qd8tr6MIpKHcX8sR47q
         lQMM261xup6M+USOO7c9obMzf9o4WAasye5rr36DcVzyZtxVF9z4zTns+FvIoW6RSwEn
         oppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZWh1WnHpSXynBwrGzEFdFS9dRaewgmpRz4cunacZkKY=;
        b=HFe2ie+iDW5ZvV5u8vzxgNuZvZ4+7p32p/+jE9kRQdlUacqopCCmpCf+/wAvIQ0gl2
         zWcat6Q6tvq3FtaUCArK1f1eO3icO3Xk52cJqif9AORVCbmVe6LnTwOguIv+8ZB/bb2l
         KTPOGhZ8XUTuO0VWPoBqAAPRnzD9N1wcMPe/GDe2LwbDweUL5k229MUBoRnwJKD9dVh3
         bS/Xt0povwdPde+haWV+BB7axE5yANIaBA1uAgkE+QoCG2yXmymenB35GvQ5Vn1NirhV
         5QbK1U+VjieRF/rrrhx4XwZoEL9FeQZQkD/Jm5/Pv7ny0pYb7RZkESSZd8zRa81GpyJJ
         n4AA==
X-Gm-Message-State: APjAAAVz4I9/CD5f31ewPj871smPsHYu71rRojeAhwxPKBZDHuNhlahl
        2ErZzgIJbMqsVF2ABH+WzqHY9g==
X-Google-Smtp-Source: APXvYqwvp8vwl59NpJT1UZnwdTf8HHV5pewkT1sXqeB3J6wVvLcceNA8x/1R5lRGssfa9YY6woUpEQ==
X-Received: by 2002:a63:d0f:: with SMTP id c15mr22945597pgl.313.1572292942160;
        Mon, 28 Oct 2019 13:02:22 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q23sm316379pjd.2.2019.10.28.13.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 13:02:21 -0700 (PDT)
Date:   Mon, 28 Oct 2019 13:02:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: next/master boot: 257 boots: 8 failed, 237 passed with 8
 offline, 2 untried/unknown, 2 conflicts (next-20191028)
Message-ID: <20191028200219.GS571@minitux>
References: <5db7032c.1c69fb81.888b0.b521@mx.google.com>
 <20191028174857.GG5015@sirena.co.uk>
 <20191028184019.GR571@minitux>
 <20191028191121.GH5015@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028191121.GH5015@sirena.co.uk>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 28 Oct 12:11 PDT 2019, Mark Brown wrote:

> On Mon, Oct 28, 2019 at 11:40:19AM -0700, Bjorn Andersson wrote:
> > On Mon 28 Oct 10:48 PDT 2019, Mark Brown wrote:
> > > On Mon, Oct 28, 2019 at 08:03:08AM -0700, kernelci.org bot wrote:
> 
> > > Today's -next (anf Friday's) fails to boot on db820c:
> 
> > > >     defconfig:
> > > >         gcc-8:
> > > >             apq8096-db820c: 1 failed lab
> 
> > > It looks like it deadlocks somewhere, the last things in the log are a
> > > failure to start ufshcd-qcom and then an RCU stall some time later:
> 
> > db820c has been failing intermittently for a while now, it seems that
> > booting with kpti enabled causes something to go wrong. There are
> > nothing strange in the kernel logs and ftrace seems to indicate that all
> > the CPUs are idling nicely.
> 
> Oh dear.  Adding Catalin and Will.  Is it definitely KPTI that's
> triggering stuff?  It did turn up some bugs on other systems, though
> it's a bit strange it's only manifesting in KernelCI...

I did a test recently where I booted my db820c 100 times with kpti=yes
and 100 times with kpti=no on the kernel command line, and the result
was 90% failure to reach console vs 0%. Going back and looking at the
logs for the 10% indicated that the boot CPU was fine, but I had stalls
reported on other CPUs.

In an effort to rule out driver bugs I reduced the DT to CPUs, the core
clocks, gic, timers and serial driver, and I still saw the problem.

I have not looked at this with jtag and hence do not know what secure
world is doing.

Regards,
Bjorn
