Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A34A46CAC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 03:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238765AbhLHCYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 21:24:36 -0500
Received: from linux.microsoft.com ([13.77.154.182]:37294 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhLHCYf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 21:24:35 -0500
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
        by linux.microsoft.com (Postfix) with ESMTPSA id 90BD020B7179;
        Tue,  7 Dec 2021 18:21:04 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 90BD020B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1638930064;
        bh=d04i/pPfuzlauf5L3Dt5yzUBtQmC0AReTo86i0pPXnk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mqnmno9Wvgr/lJoLTJXezPc5/z61I85lBYCGPpnQQN3deKuUPffKfmmcOgnSR1HX+
         mkcdVS77FUIOdKLaJQ9IRt/V/Y7OVWvP6MSSI7MsotYAv3VcVQETTEJaoNpeTKgI2T
         BgbQA3Ga8UmIV1akEG0WN9mq2ZrVav5BnzS1E6P4=
Date:   Tue, 7 Dec 2021 18:21:03 -0800
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: sm8350: fix tlmm base address
Message-ID: <20211208022103.GA15963@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20211122190552.74073-1-kaperez@linux.microsoft.com>
 <20211122190552.74073-3-kaperez@linux.microsoft.com>
 <YZxoGp33Seaa2WEG@matsya>
 <Yabo0fGXC1rITmsM@builder.lan>
 <Ya9JhqZ/Hyj9HdRk@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ya9JhqZ/Hyj9HdRk@matsya>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 07, 2021 at 05:16:14PM +0530, Vinod Koul wrote:
> On 30-11-21, 21:15, Bjorn Andersson wrote:
> > On Mon 22 Nov 22:03 CST 2021, Vinod Koul wrote:
> > 
> > > On 22-11-21, 11:05, Katherine Perez wrote:
> > > > TLMM controller base address is incorrect and will hang on some platforms.
> > > > Fix by giving the correct address.
> > > 
> > > Thanks, recheck the spec this looks correct. We should have tlmm reg
> > > space here and not tlmm base which also contains xpu region (thus hang)
> > > 
> > 
> > Aren't you reading the patch backwards?
> 
> I guess :(
> 
> > Afaict downstream the driver carries an offset of 0x100000, which we
> > dropped as we upstreamed the driver. As such changing reg to 0x0f000000
> > should cause most gpio register accesses to fall outside the actual
> > register window.
> > 
> > Or perhaps I'm missing something here?
> 
> I relooked and XPU is at 0xF000000 and Reg at 0xF100000
> So this patch should be dropped as such. The size mentioned in
> documentation is also correct
> 
> Katherine, can you elaborate more on the hang you have observed? Any
> specific pins you use which causes this?

Hi Vinod,

Yes, it seems to hang in msm_pinctrl_probe. Specifically, line 734 in
gpiolib.c: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpiolib.c#n734.
On i=4, it hangs on assign_bit and the system goes into a reboot loop.
When I set the TLMM address to f000000, I don't see this issue at all.

> 
> 
> -- 
> ~Vinod
