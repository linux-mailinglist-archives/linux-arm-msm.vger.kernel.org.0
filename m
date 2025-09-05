Return-Path: <linux-arm-msm+bounces-72352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0CBB46024
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FEAC169926
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4D330B537;
	Fri,  5 Sep 2025 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFjQg45u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F1B2FB094;
	Fri,  5 Sep 2025 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757093455; cv=none; b=SiJoUDiIg4Pjx2svlUT7EfJMm47j73+4Gsn9rS/Z0dTTataL/jLbrAxuGF3hDbkZS/kksIH5IOD5SUZoggLSC+wwrt/vpHovhtOhkV1ENoyCK2MuHL9P+aIVs7nKTxjGjmsz/jY9Ek4ParaD8eLaFZWhOC4oZLGnjPdPHmO3r8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757093455; c=relaxed/simple;
	bh=PTkKS8uScquH1EGatD0dadjDeGeL1uUx4qLkflDLUc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfqTRCxmZKR/i9HjyTqQ+mk8EzeXwgkNkVzBbMNmNkDHzHy3m3mkDZXqvRvGyVGTIl3Gtdcy4a5WWP2rmqutABNf3MXdPY9RIps4lrHf3N7bm1QH9IA8yQFTemUv80nHkQin3+qfAF3owrfcfuQo9rtg+WCVnpE9EqRRGnile5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFjQg45u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C728C4CEF1;
	Fri,  5 Sep 2025 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757093454;
	bh=PTkKS8uScquH1EGatD0dadjDeGeL1uUx4qLkflDLUc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFjQg45uv5KJmPvIlBnWg/1Oyc7s3gGpQk83/1zNkx0Xpydkg+ubDet6Pw+xF60D/
	 z9b+RzgJa149UFTs47cT1tarMYTAfo6hIo1A/cxAwo/JaDZTu2lHlOKQVbTgvGTw7I
	 7YnvNI0BAkotUDWa0HPbEYPODnhekWE4f0Us+Zcv/Au7xyASjs1651PfvdDG/+2ybe
	 IxdWWR5NBbCXseXagjH0Pn1cN0y/bBM54UBZ2hU2HxQY9SbOtlIk9ZaW80Y9rNgELy
	 pDcbRrKn1XlzmrD5ENlwbBYDQ90tCjk3N8qi5ZCTXMO6TkJ1F8fSmAEjB4aiaAXBg8
	 5hzQxPzayxWcg==
Date: Fri, 5 Sep 2025 23:00:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Adam Xue <zxue@semtech.com>
Cc: "jeff.hugo@oss.qualcomm.com" <jeff.hugo@oss.qualcomm.com>, 
	"quic_yabdulra@quicinc.com" <quic_yabdulra@quicinc.com>, "chentao@kylinos.cn" <chentao@kylinos.cn>, 
	"quic_mattleun@quicinc.com" <quic_mattleun@quicinc.com>, 
	"krishna.chundru@oss.qualcomm.com" <krishna.chundru@oss.qualcomm.com>, "mhi@lists.linux.dev" <mhi@lists.linux.dev>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Iulian Mocanu <imocanu@semtech.com>
Subject: Re: [PATCH v3] Fix potential kernel panic by calling dev_err
Message-ID: <2rl5rhozldva2oq5ssiwoy3lbbaoy3ka7nuwyyofdjybgnjkh4@7odawvfmj47r>
References: <20250904183405.32986-1-zxue@semtech.com>
 <6lge6p5e3ulcy5pbencvhjfhcwrfsptvclxyu53z3t7anwyrj6@bxbidmvaiql5>
 <CY5PR20MB4867370342138E3BE5319CD3C603A@CY5PR20MB4867.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY5PR20MB4867370342138E3BE5319CD3C603A@CY5PR20MB4867.namprd20.prod.outlook.com>

On Fri, Sep 05, 2025 at 05:19:04PM GMT, Adam Xue wrote:
> Hi Mani, 
> 
> Thanks for reviewing the patch. I am still learning the patch submission process. 
> I got the email addresses from ./scripts/get_maintainer.pl. Where may I get the stable list?
> 

Refer the past commits:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/bus/mhi?id=5bd398e20f0833ae8a1267d4f343591a2dd20185

For bug fixes that needs to be backported to stable kernels, you need to
specify the below tag:

Cc: stable@vger.kernel.org

- Mani

> Regards, 
> 
> Adam
> 
> -----Original Message-----
> From: Manivannan Sadhasivam <mani@kernel.org> 
> Sent: September 5, 2025 9:45 AM
> To: Adam Xue <zxue@semtech.com>
> Cc: jeff.hugo@oss.qualcomm.com; quic_yabdulra@quicinc.com; chentao@kylinos.cn; quic_mattleun@quicinc.com; krishna.chundru@oss.qualcomm.com; mhi@lists.linux.dev; linux-arm-msm@vger.kernel.org; linux-kernel@vger.kernel.org; Iulian Mocanu <imocanu@semtech.com>
> Subject: Re: [PATCH v3] Fix potential kernel panic by calling dev_err
> 
> Caution: This email originated outside of Semtech.
> 
> 
> On Thu, Sep 04, 2025 at 11:34:05AM GMT, Adam Xue wrote:
> 
> Missing subject prefix:
> 
>         bus: mhi: host:
> 
> > In mhi_init_irq_setup, the device pointer used for dev_err was not initialized.
> >  Use the pointer from mhi_cntrl instead.
> >
> 
> You need to add relevant fixes tag and CC stable list. Below tags are valid for this fix:
> 
> Fixes: b0fc0167f254 ("bus: mhi: core: Allow shared IRQ for event rings")
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> 
> - Mani
> 
> > Signed-off-by: Adam Xue <zxue@semtech.com>
> > ---
> >  drivers/bus/mhi/host/init.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c 
> > index 7f72aab38ce9..099be8dd1900 100644
> > --- a/drivers/bus/mhi/host/init.c
> > +++ b/drivers/bus/mhi/host/init.c
> > @@ -194,7 +194,6 @@ static void mhi_deinit_free_irq(struct 
> > mhi_controller *mhi_cntrl)  static int mhi_init_irq_setup(struct 
> > mhi_controller *mhi_cntrl)  {
> >       struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
> > -     struct device *dev = &mhi_cntrl->mhi_dev->dev;
> >       unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
> >       int i, ret;
> >
> > @@ -221,7 +220,7 @@ static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
> >                       continue;
> >
> >               if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
> > -                     dev_err(dev, "irq %d not available for event ring\n",
> > +                     dev_err(mhi_cntrl->cntrl_dev, "irq %d not 
> > + available for event ring\n",
> >                               mhi_event->irq);
> >                       ret = -EINVAL;
> >                       goto error_request; @@ -232,7 +231,7 @@ static 
> > int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
> >                                 irq_flags,
> >                                 "mhi", mhi_event);
> >               if (ret) {
> > -                     dev_err(dev, "Error requesting irq:%d for ev:%d\n",
> > +                     dev_err(mhi_cntrl->cntrl_dev, "Error requesting 
> > + irq:%d for ev:%d\n",
> >                               mhi_cntrl->irq[mhi_event->irq], i);
> >                       goto error_request;
> >               }
> > --
> > 2.43.0
> >
> >
> > To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.
> 
> --
> மணிவண்ணன் சதாசிவம்
> 
> To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.

-- 
மணிவண்ணன் சதாசிவம்

