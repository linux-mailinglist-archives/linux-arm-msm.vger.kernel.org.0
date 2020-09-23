Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B89275C05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 17:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgIWPhs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 11:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbgIWPhs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 11:37:48 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06AEC0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 08:37:47 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id a12so187548eds.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 08:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OFep0qz6p1E1Eo1m1M2EJlIhj3JR6tgtGl52pt+W73I=;
        b=TFGO5PcLNmsBNLc8AmWnXsEjZQX6xjaUBooZ7KLUlMOoCak12zieItPMyIZQtAKdZ5
         iWw39/aepiOXd6GOy1nlSxX8noEHkSNLPft+/TGaHVobfHfN5eYnC5iV56DG5TsCkn4w
         pjSM+iDP0YnCo6/44r6erG/hzfayoJvOAHWnzlsFH6qQC7XYVRShQpZx6lhF5emYNM4C
         vFGfvun2fA/n48abOlJ595hXN/2wG7ZbvrWe8BE/3f83WQtqnIPPQCuwpzNSyxGm0mWl
         LIJGFE8jPw4rgT5b9ZlljcKvNJpwwnnsVBVI/q8LCSdZZo5Ay32cqagUtiPb+loUv39m
         11LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OFep0qz6p1E1Eo1m1M2EJlIhj3JR6tgtGl52pt+W73I=;
        b=qPnxhfGND7FxCP0af0ZhSyA3xHwVHZwRJSl8pfZ+BW8DMnlgr4oKQBtPX8oH3gzmgE
         6HR3UuAVvg3FOO1aVnaMEeJuGOsypFi0K3rHamWKWUFyg3mCnKdiIafwzAnacY5WqDlB
         C0PA+4YMa8uscP9d1uZHvSISF504kpd2f2pI7NUIBaN/aCozY0z/p484jgpt2nKmBqpe
         zjWai1C0Gf/S2HCCUv5VOsgFxM0il5zC2a+6N+M1oCHXJv7Cp+KFsRC7KbfoE/i8J5zq
         o7LR7+XDFVYgPVnAW9TFC7Kte17DClsx1sfxn6kYfUARSqrvp6Q0/xv4L4IwCqr/TVYV
         Ji1g==
X-Gm-Message-State: AOAM530jsdJjbUIjsDkn8CoTaQIjkaSlnOFRI2tWiRoR2408YavmsdOL
        qVu6i0V+rW4oCBHGVdT2u+6oBOFcn9URc98wUkvEJQ==
X-Google-Smtp-Source: ABdhPJzb2WQhshF3YNR7fhrWYxHMs5pzmgrSj7462tSaH/yTdOC96GiCDT1CRQw7MaVdjdJEcaLiNQ51K/TC69n6IRk=
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr10684949eds.366.1600875466308;
 Wed, 23 Sep 2020 08:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <1600868432-12438-1-git-send-email-loic.poulain@linaro.org>
 <797a690f-247c-7ff1-6468-8d56b0b81116@codeaurora.org> <CAMZdPi-iaCWm21GzTLpoXZuCxawAPgLo_X91zSQ2VFTfV_4rvA@mail.gmail.com>
 <673a42ea-70d0-3005-b359-a54407bdb66e@codeaurora.org>
In-Reply-To: <673a42ea-70d0-3005-b359-a54407bdb66e@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 23 Sep 2020 17:42:59 +0200
Message-ID: <CAMZdPi-TQh31hYi+3huZT_Dbx549VHV++1TQyDNSDd+s=DzN1A@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Add MHI PCI support
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 23 Sep 2020 at 16:55, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 9/23/2020 8:35 AM, Loic Poulain wrote:
> > Hi Jeffrey,
> >
> > On Wed, 23 Sep 2020 at 16:04, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> >>
> >> On 9/23/2020 7:40 AM, Loic Poulain wrote:
> >>> This is a generic MHI-over-PCI controller driver for MHI only devices
> >>> such as QCOM modems. For now it supports registering of Qualcomm SDX55
> >>> based PCIe modules. The MHI channels have been extracted from mhi
> >>> downstream driver.
> >>>
> >>> This driver is easily extendable to support other MHI PCI devices like
> >>> different modem hw or OEM superset.
> >>>
> >>
> >> Maybe I'm being a bit dense, but what does this "driver" even do?
> >>
> >> Ok, it'll bind to SDX55 and "power up" the MHI.  I don't see any
> >> communication with the device, so I'm not really seeing the value here.
> >>    Feels like this should be patch 1 of a series, but patches 2 - X are
> >> "missing".
> >
> > Well, yes and no. On MHI controller side point-of-view, the driver is
> > quite complete, since its only goal is to implement the MHI transport
> > layer and to register the available channels. The PCI driver is really
> > no expected to do more (contrary to ath11k), everything else will be
> > implemented by MHI device drivers at upper level. I agree most of them
> > are not yet implemented (only qrtr-mhi for IPCR channel), but I'm
> > currently working on this.
>
> Hmm.  I guess I wonder why the functionality provided by this patch
> isn't incorporated into some other driver.  I see why its not really a
> great idea to pick a random client driver (like ipc router) and push the
> responsibility into them.  However, do we hook up these external modems
> to remoteproc?  If we are managing the devices somewhere else (for FW
> loading, SSR, etc), then it would seem like a good place for this
> functionality.

I understand what you mean, but here this driver is a (logical)
controller driver for the MHI bus, in the same way as e.g. I2C adapter
driver is a controller for the I2C bus, then MHI device drivers (e.g.
ipc router) implement the device function/class like e.g. I2C client
driver (though you could argue that MHI channels are not fully
independant devices).

The device is not managed from somewhere else and the firmware loading
is a generic piece of the MHI subsystem/bus. Moreover there is
currently no modem/wwan subsystem in Linux, so there is not really
something else to register with... at least for now.

> In summary, this feels like a shim driver that is a driver for driver's
> sake, which doesn't feel like the right design.  I don't think I have a
> better suggestion through.  Since I don't have a concrete "this should
> be done some other way" I won't be offended if you ignore this "complaint".
>
> However, assuming you continue with this approach, I think this change
> needs more documentation.  At a minimum I think what you just explained
> to me needs to be in the commit text.

I will.

Thanks,
Loic
