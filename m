Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3B323E592
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 03:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgHGBmn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 21:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgHGBmn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 21:42:43 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073C3C061575
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 18:42:42 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id r11so136783pfl.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 18:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cAPX6D2qzJW+cM4TwCNFgYllwmjivb9JxeuNDMu8OqY=;
        b=Rb1Aia/5mpYUMxN9hLfbwKYrYIYeobqIFx7wpP7JvLpUfD1tC0oCip6VQfp5bQT799
         FF4++SLrByMlkoblaNVMVj8ujTPzej6dSye2kyYbmUbPAMQciDE8DIMVCFi4QrMXLGn1
         9mmghCPOjBC6AAwJgIeEJfLpHMo/FGQfLxgBAOMXnNlLKPq3Ou3gbd7FqihG2o9NIwKP
         yUYAUOyMVBk3flcgqrhsDhHKey1dKx5Pa4kIxtieOqaTiyq6IoCH9F4jq0WIYPwooMw1
         yvVTs98FXs3BnMt7vjDL+e1eCi4oSniROVL5yCD6K0erbM9xd+63A1SIAtLV5RxFlw+U
         do2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cAPX6D2qzJW+cM4TwCNFgYllwmjivb9JxeuNDMu8OqY=;
        b=DtpbxkSYFvhNTA0qPcgg7qBopbCGbYTiKcE02+yvxi/4i2RQ+MsP4Ww90STOpdqcvl
         dpIjZB+odQYGLegTf4pJccmLGI88+uxo4/muIXNq1C13kfNHVyRL7YN3Q6EWPgkALCMp
         li2zJynVhhi8481yHw/7USbkIkVxRzMQpgfT8qlTP88hCA8kb1pUrJ37uA6MVDSC+NSk
         wX+rM2jgeAB0kXFWWCy5c7HbsWd7h9UEYxOCynqDTgV88RXiKQVuqzLTcs4Bk0h9j/wp
         RHgj4hbbbyC81axZ4Pvi2ubKek6IJpu3w0zOyo2XyOgIIHyNIZaF+bZBR74hymbdPrGk
         Co3w==
X-Gm-Message-State: AOAM533UrJoV3HCUqBjLx1jPj2L5aG+nD+op1TOHbuP//+hqflAIOqRI
        IsNFHHtSMo8du8lJgkiU6Yyulg==
X-Google-Smtp-Source: ABdhPJzj4zgIDD/7qY6szboPvWpWjPCrmFgpaapdZ8cQMmuJnqsLKWM/UU/+vw2kRylnHv/CMYglwQ==
X-Received: by 2002:a63:6542:: with SMTP id z63mr10058026pgb.317.1596764561531;
        Thu, 06 Aug 2020 18:42:41 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h12sm10507294pfr.143.2020.08.06.18.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 18:42:40 -0700 (PDT)
Date:   Thu, 6 Aug 2020 18:39:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Steev Klimaszewski <steev@kali.org>,
        Saravana Kannan <saravanak@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
Message-ID: <20200807013903.GG20825@builder.lan>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
 <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
 <20200807004001.GF20825@builder.lan>
 <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 06 Aug 18:22 PDT 2020, John Stultz wrote:

> On Thu, Aug 6, 2020 at 5:43 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Wed 05 Aug 14:57 PDT 2020, John Stultz wrote:
> > > On Wed, Aug 5, 2020 at 2:47 PM Steev Klimaszewski <steev@kali.org> wrote:
> > > > On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> > > > > On 8/5/20 3:19 PM, Saravana Kannan wrote:
> > > > >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> > > > >>> <sigh>
> > > > >>> So this is where I bashfully admit I didn't get a chance to try this
> > > > >>> patch series out, as I had success with a much older version of
> > > > >>> Saravana's macro magic.
> > > > >>>
> > > > >>> But unfortunately, now that this has landed in mainline, I'm seeing
> > > > >>> boot regressions on db845c. :( This is in the non-modular case,
> > > > >>> building the driver in.
> > > > >> Does that mean the modular version is working? Or you haven't tried
> > > > >> that yet? I'll wait for your reply before I try to fix it. I don't
> > > > >> have the hardware, but it should be easy to guess this issue looking
> > > > >> at the code delta.
> > > > > For what it's worth, I saw this too on the Lenovo C630 (started on -next
> > > > > around 20200727, but I didn't track it down as, well, there's less way
> > > > > to get debug output on the C630.
> > > > >
> > > > > In my testing, module or built-in doesn't matter, but reverting does
> > > > > allow me to boot again.
> > > > >
> > > > Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
> > > > boots, however, module (on the c630 at least) doesn't boot whether it's
> > > > a module or built-in.
> > >
> > > You may need to set deferred_probe_timeout=30 to give things a bit
> > > more grace time to load.
> >
> > With the risk of me reading more into this than what you're saying,
> > please don't upstream anything that depend this parameter to be
> > increased.
> >
> > Compiling any of these drivers as module should not require the user to
> > pass additional kernel command line parameters in order to get their
> > device to boot.
> 
> So, ideally I agree, and Saravana's fw_devlink work should allow us to
> avoid it. But the reality is that it is already required (at least in
> configurations heavily using modules) to give more time for modules
> loaded to resolve missing dependencies after init begins (due to
> changes in the driver core to fail loading after init so that optional
> dt links aren't eternally looked for). This was seen when trying to
> enable the qualcom clk drivers to modules.
> 

So to clarify what you're saying, any system that boots successfully
with the default options is a sign of pure luck - regardless of being
builtin or modules.


And there you have my exact argument against the deferred timeout magic
going on in the driver core. But as you know people insist that it's
more important to be able to boot some defunct system from NFS than a
properly configured one reliably.

> It doesn't seem necessary in this case, but I suggested it here as
> I've got it enabled by default in my AOSP builds so that the
> module-heavy configs for GKI boot properly (even if Saravana's
> fw_devlink work is disabled).
> 

With all due respect, that's your downstream kernel, the upstream kernel
should not rely on luck, out-of-tree patches or kernel parameters.

Regards,
Bjorn
