Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357CC2C1F6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 09:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgKXIID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 03:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbgKXIID (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 03:08:03 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD63C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 00:08:02 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id k1so6943847eds.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 00:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IRevJvBhZD98WCgnl6kgmsf8fEmBYD3BAVojVKrOcZE=;
        b=sakQMfNpBjbfmaFHZtnb+UlPbcgRkc3c88JvFx/tfcwzOIzh3dSic1jBlYzXyzz3IL
         ksiTgXMnmWB2n7fp8E+pJPS+UcEvY7Z3UNZgUNn0WH4l0YdP269XmZAI9REOgf0SM/9Y
         xZl/SSiBSBXxis1ePsy1DIAZlL8obzjpXtLfnfEAIf3YW+J6E1jrICj67VDMGmuN3mJw
         CWyXgwq+BCaawVxgiaTDkpTzLc/yTVct3Muswv01maQNAmE+25voiOFBt6YqX0EdaqI9
         lmQkuUSiiuH7rUju1gTXqzuTxz2ZdesfCQEVnbvxOQvr+dY9QUGNLslOZ/UQc3lsq4os
         yJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IRevJvBhZD98WCgnl6kgmsf8fEmBYD3BAVojVKrOcZE=;
        b=c7BPb1jLRoGxT0FDkSt8o/yF6yhEJA5BP5yvR+9PAAFrIIRfdjkKO/QRk1qrWqh9zz
         UGU4EVz/ISisA//8b6EtIXgvHIrjC9kil++w+Nr7pz+hj4Xh8iXQj4yHk2esUGMxTaV+
         EbKQTx2Bqp5r8bcEUUIrYHX4NvWP8+FQusJrbebDrsoU3IegjJ85u6xgDLzlbvIx9txZ
         YT3yfkfxKAkX7hU5qk24SYI3idxcHaEMw6rPdZOjfid0YyC2EnfW5gLpR/zfIUVfPVjy
         B7yrvGSFEfKaH2Q3ZWX0J8GWvZTKzgRgiS+eMtPEfAO7ZIC2Gx9xvzsb1vIQnrAzEYcv
         TyWA==
X-Gm-Message-State: AOAM531a08uX1m4sjZUCMpFq+tNSyJ7XmNwSrj9oAG7oCcD5EbLTms5L
        87NCOCCDmU95SSJ7bnDGsWG7TZw+vPHff6WQfCsZ8g==
X-Google-Smtp-Source: ABdhPJw+dQF4NTE5RQcmcHOmYo93QyISlWqZsdf+fd33IcvVY7h0z4GrSdZO+PsrggrthYQEvk8SbC/3SFotn9hn0uU=
X-Received: by 2002:aa7:d883:: with SMTP id u3mr2867284edq.69.1606205281512;
 Tue, 24 Nov 2020 00:08:01 -0800 (PST)
MIME-Version: 1.0
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org> <6041716947a501f5c80c095766b55dd1@codeaurora.org>
In-Reply-To: <6041716947a501f5c80c095766b55dd1@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 24 Nov 2020 09:14:18 +0100
Message-ID: <CAMZdPi_KAvt8MvpaEfdV_Nw6OQh543ufEO92ZfGOL=zYNTvXVQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] mhi: pci_generic: Misc improvements
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Tue, 24 Nov 2020 at 01:52, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> On 2020-11-23 06:10 AM, Loic Poulain wrote:
> > This series adjust some configuration values to ensure stability and
> > robustness of mhi pci devices (timeout, number of events, burst mode).
> >
> > It also includes support for system sleep as well as a recovery
> > procedure
> > that can be triggered when a PCI error is reported, either by PCI AER
> > or by
> > the new health-check mechanism.
> >
> > All these changes have been tested with Telit FN980m module.
> >
> > Loic Poulain (8):
> >   mhi: pci-generic: Increase number of hardware events
> >   mhi: pci-generic: Perform hard reset on remove
> >   mhi: pci_generic: Enable burst mode for hardware channels
> >   mhi: pci_generic: Add support for reset
> >   mhi: pci_generic: Add suspend/resume/recovery procedure
> >   mhi: pci_generic: Add PCI error handlers
> >   mhi: pci_generic: Add health-check
> >   mhi: pci_generic: Increase controller timeout value
> >
> >  drivers/bus/mhi/pci_generic.c | 352
> > ++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 335 insertions(+), 17 deletions(-)
> Just noticed that you may have missed my reviewed-by on patches 1 and 8
> from the
> previous submission.

I don't find any reply to 1/8 or 8/8, could you please resubmit?

Regards,
Loic

>
> Thanks,
> Bhaumik
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,
> a Linux Foundation Collaborative Project
