Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B5F2E7EEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 10:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgLaJUv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 04:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgLaJUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 04:20:50 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F724C061573
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 01:20:10 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id w1so24716322ejf.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 01:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nlTHiczV7NuGnvzVmGOv5ENuKj8IkDS9XyUW739lICo=;
        b=Ou/NBsAekCfNn+CGKvZEjH9hgM9kGLaF+wOJlD9tUu+YFoq49SYUtZhO9cDdpaIWBg
         1up3VJmb3H0fRIdM552JRcjoSwjgO3zuuNrdnldDZsZ2cyWM0tFixzwVHinIappIefbL
         fFVpTdESOUBTZWD5NsBIyth7gzey5JXb87SJzuTl3P3IxD9t5lVysuJ1S4IM6S+KXUFh
         fejKyL+7ObdqXdjWmxuJ2hyjlUPs4lgms0pACNAErPHhlBA6uZvGvgk9QWCC7naieBTd
         wVjx97CrnpQj/JJ5F+MBy8yvz6ShX3jNZ1S8PfrETYPu3G8o0SSLiRADFrpoyhG1LCxf
         /ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nlTHiczV7NuGnvzVmGOv5ENuKj8IkDS9XyUW739lICo=;
        b=O0svJB9PsmcVvWecIzqGdloYCIVblfoaVUW6oLYg5FMHQkY0qA7IKKjIHN2KRtW3AQ
         96McUMLsLn+wC+94h8uxPfEcPcsV5GU0dFMn5i8n9jJBzf9yfBEWeM/wEpdxpcH4NEqA
         /50l8t5CuCBdw41wyjQSKjKf6zX4kofn9+Yv+7HToNyJt3x3tarUJk+7EMlB4Wp8cwUU
         p7f/BRUoX6a0NzuetFIqIYKE1k59+7Sv7sfiouXmvV65xBSBuJ54mxbuoUmFoyw+Vu9p
         Y3AOib0tPOC6n192rORWsin97HYZ9VbPwG+ecbenAyUeUK9kN3LGk8OELPiVLXRJVG5o
         DOng==
X-Gm-Message-State: AOAM533XoIugrbyP3HIz8ljNAZ9M/5UFKwCGustqNZ5aLFLs2ebe3NTA
        HFQBRhJIMo8lZvqtoyZHHMO9sQUgxhofKthMCPddag==
X-Google-Smtp-Source: ABdhPJy/ck8ndpVvHLNkI0RPwqfZ7PtZviglrfH0U0p+xmKwdMypmJkvefU493iJ1l8OsrqqTPAcR2Qe0bBoRv1Iiak=
X-Received: by 2002:a17:906:8151:: with SMTP id z17mr53314513ejw.48.1609406409032;
 Thu, 31 Dec 2020 01:20:09 -0800 (PST)
MIME-Version: 1.0
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
 <1609231431-10048-8-git-send-email-loic.poulain@linaro.org> <20201231071816.GB7345@thinkpad>
In-Reply-To: <20201231071816.GB7345@thinkpad>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 31 Dec 2020 10:27:01 +0100
Message-ID: <CAMZdPi8+qFPbkiQz8rnC=2X6Z6fTfY=4e1HsBbXk9DJfi-AU3g@mail.gmail.com>
Subject: Re: [PATCH v6 07/10] mhi: pci_generic: Add PCI error handlers
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On Thu, 31 Dec 2020 at 08:18, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Tue, Dec 29, 2020 at 09:43:48AM +0100, Loic Poulain wrote:
> > In AER capable root complex, errors are reported to the host which
> > can then act accordingly and perform PCI recovering procedure.
> >
> > This patch enables error reporting and implements error_detected,
> > slot_reset and resume callbacks.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Reviewed-by Hemant Kumar <hemantk@codeaurora.org>
> > ---
> >  drivers/bus/mhi/pci_generic.c | 50 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)

> > +static pci_ers_result_t mhi_pci_slot_reset(struct pci_dev *pdev)
> > +{
> > +     if (pci_enable_device(pdev)) {
> > +             dev_err(&pdev->dev, "Cannot re-enable PCI device after reset.\n");
> > +             return PCI_ERS_RESULT_DISCONNECT;
> > +     }
> > +
>
> This callback will be called after PCI slot reset, so we should also be resetting
> the device after enabling it.

Yes, but that is done in mhi_pci_io_resume.

From the PCI error recovery documentation, "drivers should not restart
normal I/O processing operations at this point (in slot_reset) If all
device drivers report success on this callback, the platform will call
resume() to complete the sequence, and let the driver restart normal
I/O processing."
The actual MHI PCI/recovery is then done in resume (mhi_pci_io_resume).

Regards,
Loic
