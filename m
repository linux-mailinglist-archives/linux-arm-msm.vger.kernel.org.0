Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398C53B3BEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 07:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhFYFLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 01:11:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:44050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhFYFLJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 01:11:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC4DC613F7;
        Fri, 25 Jun 2021 05:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624597729;
        bh=qwULfN8vRpKfvG8/TSmKdmOmwA/Co6GF9LkMLZ4QphM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q+Bn2onUiyTakvq5XpJImdcZw5NPXTFwYQENQQAhQF5aC03ZG/GfNOmyRYl6P4WuS
         psvDZrngFhMluXMAuveywqapA55euY7T9eLezyfxZJOynE+YSsabPZq6R8pgPRlDNw
         KbjLSpIZ5QSB6saLKBDCe1U6ckr6+0Vbgn6gwUpg6hJDo/AhBov7grYSA90yYMJEZm
         qWKHBOmrfBRLRbcQRYXIJ4z6vnvUhh84+aKE4ZZHTSwNnY8cttKLQMDI9unvfuRjnZ
         e4zCR6vCvT5FbK418ApISyMJk56icaAxwApK9tsCn3qsPEGm229D6mmAoHUhvh4oo5
         dNfO4tUhTkGMw==
Date:   Fri, 25 Jun 2021 10:38:43 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3] bus: mhi: Add inbound buffers allocation flag
Message-ID: <20210625050843.GC4974@workstation>
References: <1624566520-20406-1-git-send-email-loic.poulain@linaro.org>
 <YNTrePQQ3scDzAhe@builder.lan>
 <CAMZdPi_wKHQszTaJH8neHHGWJzRO9P7Zr3XTq0nSRku4EKnhuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi_wKHQszTaJH8neHHGWJzRO9P7Zr3XTq0nSRku4EKnhuQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 12:45:25AM +0200, Loic Poulain wrote:
> Hi Bjorn,
> 
> On Thu, 24 Jun 2021 at 22:30, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Thu 24 Jun 15:28 CDT 2021, Loic Poulain wrote:
> >
> > > Currently, the MHI controller driver defines which channels should
> > > have their inbound buffers allocated and queued. But ideally, this is
> > > something that should be decided by the MHI device driver instead,
> > > which actually deals with that buffers.
> > >
> > > Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> > > if buffers have to be allocated and queued by the MHI stack.
> > >
> > > Keep auto_queue flag for now, but should be removed at some point.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > Tested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Acked-by: Jakub Kicinski <kuba@kernel.org>
> > > Link: https://lore.kernel.org/r/1621603519-16773-1-git-send-email-loic.poulain@linaro.org
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > What's the intention with this patch? Why is Mani the last S-o-b when
> > you're the one sending it and why is it sent only to linux-arm-msm@?
> 
> Actually the previous version of that patch has already been applied
> to mhi-next, but has been nacked as part of Mani's PR, so it's a quick
> follow-up fix to address the issue.
> 

Thanks but you could've removed my s-o-b and "Link" as my script will
attach them again while applying ;)

But no worries, I'll deal with it.

> > And completely separate of the practical matters, is it true that qrtr
> > is the only client that use this pre-allocation feature?
> 
> yes.
> 
> > Would it be a net gain to simplify the core and add buffer allocation to qrtr instead?
> 
> Yes, I 100% agree, but I however would prefer to keep that for a
> follow-up series since this patch fixes a real issue for MHI/PCI
> modems (no inbound QRTR buffers allocated).
> 

Yeah, let's do that in 5.15.

Thanks,
Mani

> Regards,
> Loic
