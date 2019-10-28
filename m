Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC12AE79C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 21:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732465AbfJ1UOY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 16:14:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:36886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbfJ1UOY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 16:14:24 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BEEA214B2;
        Mon, 28 Oct 2019 20:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572293663;
        bh=Irzp1W5cxgylHGtZa8iCKi1q/E+rjetb5lI/l5T8Drw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q6PwP5zh9YEOcoKYVLj3hUV3LizrHajeIzJYAHGdT6MiK2ebFgVEt818XVYbs7EAF
         8EW3r2SQXdo6WtupZ3Z0+oBbrXh/jWvmUtb2x9oL3qwVLji9qaV7t/n2WwNbXxwtzX
         OkCsV9HNGUtJS13sJu/GVpstbP7NcaVWmTmxzVjo=
Date:   Mon, 28 Oct 2019 20:14:18 +0000
From:   Will Deacon <will@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
        kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: next/master boot: 257 boots: 8 failed, 237 passed with 8
 offline, 2 untried/unknown, 2 conflicts (next-20191028)
Message-ID: <20191028201418.GA8317@willie-the-truck>
References: <5db7032c.1c69fb81.888b0.b521@mx.google.com>
 <20191028174857.GG5015@sirena.co.uk>
 <20191028184019.GR571@minitux>
 <20191028191121.GH5015@sirena.co.uk>
 <20191028200219.GS571@minitux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028200219.GS571@minitux>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 28, 2019 at 01:02:19PM -0700, Bjorn Andersson wrote:
> On Mon 28 Oct 12:11 PDT 2019, Mark Brown wrote:
> 
> > On Mon, Oct 28, 2019 at 11:40:19AM -0700, Bjorn Andersson wrote:
> > > On Mon 28 Oct 10:48 PDT 2019, Mark Brown wrote:
> > > > On Mon, Oct 28, 2019 at 08:03:08AM -0700, kernelci.org bot wrote:
> > 
> > > > Today's -next (anf Friday's) fails to boot on db820c:
> > 
> > > > >     defconfig:
> > > > >         gcc-8:
> > > > >             apq8096-db820c: 1 failed lab
> > 
> > > > It looks like it deadlocks somewhere, the last things in the log are a
> > > > failure to start ufshcd-qcom and then an RCU stall some time later:
> > 
> > > db820c has been failing intermittently for a while now, it seems that
> > > booting with kpti enabled causes something to go wrong. There are
> > > nothing strange in the kernel logs and ftrace seems to indicate that all
> > > the CPUs are idling nicely.
> > 
> > Oh dear.  Adding Catalin and Will.  Is it definitely KPTI that's
> > triggering stuff?  It did turn up some bugs on other systems, though
> > it's a bit strange it's only manifesting in KernelCI...
> 
> I did a test recently where I booted my db820c 100 times with kpti=yes
> and 100 times with kpti=no on the kernel command line, and the result
> was 90% failure to reach console vs 0%. Going back and looking at the
> logs for the 10% indicated that the boot CPU was fine, but I had stalls
> reported on other CPUs.
> 
> In an effort to rule out driver bugs I reduced the DT to CPUs, the core
> clocks, gic, timers and serial driver, and I still saw the problem.
> 
> I have not looked at this with jtag and hence do not know what secure
> world is doing.

Hmm. Is this a recent thing? Neither kpti nor the snapdragon 820 are
particular new. Might be worth checking that CONFIG_QCOM_FALKOR_ERRATUM_1003
is enabled and getting patched in at runtime -- we had hardware issues
during kpti development with this CPU.

Will
