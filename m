Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB26449CFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 21:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238424AbhKHUTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 15:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236622AbhKHUTp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 15:19:45 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD29FC061570
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 12:17:00 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o8so67307309edc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 12:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CkjO7XALcKtl0tuJw3OcfmCqksa1XJJ8s0aACih0n9Y=;
        b=CazUJU1Lzj2u7vtVifN3dCO2kx6MY1yPAyqaL5c5ftNdfHd+d2OsKZSy37+GKaNW78
         PmcI/9Jcpwfb3WM+66t/0BuN4YZps8/4WGVX/uJ62aZMlPRHbo443iCNEeb5sUJWG9q8
         dVlQ4hjcgjdn6TLsDRjr3gUAFiA/L85sffWr6NSl8bO11ierShDge0AVSSSlyOBMTPyF
         07eXNdXEa/y/CrWAgaR1y3I/UdU6rNHXEZjAWdhijZZ/9R0//zmcemOwQwgt2IlOhEgS
         rp0zBdh/qI9lh9NCSXgReKZ5/IglvmaqzEonrbkjvlXXB/JpI+nTFcas2Ua9Qifo0j0z
         8XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CkjO7XALcKtl0tuJw3OcfmCqksa1XJJ8s0aACih0n9Y=;
        b=fVuV8z/JimJ9E4reQg74vCbye5UMddS3Q+AVQcw5QDLmt2TKjmQFPTOH3Z+ejXBUx3
         +XbWRajll5YpuIm9ciHUUVo0dM55IhGb4Li+zct+A6m+/0LZJy0d2Ct6KZ3Dh3PjyHz2
         9UcGxEeNW0xACg23oqiLqzWw33EC7WOxp7AS5vSqZLspVIlHSlAonMv24Ckhn/WDNCGW
         beDkAaBRb3aBmGfz73E5n3aVf4GMERlmCpDT9toyFzYNddEM88sqg+qSw0iSDLc4aHHu
         CKwG3XgT2+HyStlb2Y5ipi+40KIkI29SbsRoco/D6mCv5nJczV2s8UZmCcQZmqHNTXHm
         dwAg==
X-Gm-Message-State: AOAM532+n6Fg+3BfdXY2a7i1TOl/mxya4v+thaCV6BXjemYDq4zfM3ac
        OxHPlAuocS+GT30mYaRrBK6NAwNgJtv2KB+UMeoFlg==
X-Google-Smtp-Source: ABdhPJy/e/UGmBNiMuUrrFR4aP4JUjVB0pr/35HdorlLWLN6k4nVfMxsUbLAaQCfSN9HPHVNS6QgupkueJ+IxOxOJGI=
X-Received: by 2002:a50:da06:: with SMTP id z6mr2305513edj.355.1636402619346;
 Mon, 08 Nov 2021 12:16:59 -0800 (PST)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
 <CAAP7ucJ6a+r6b6C4C51ov6O8sepYmut2uc7sXDqFOOdJruW6nQ@mail.gmail.com> <d787fb8d6588ba5e05232fc5809d4cbd80117ebf.camel@bootlin.com>
In-Reply-To: <d787fb8d6588ba5e05232fc5809d4cbd80117ebf.camel@bootlin.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Mon, 8 Nov 2021 21:16:48 +0100
Message-ID: <CAAP7ucKsFcU9UpGZFPVMYK1g7-JDgfNDvTbVQQkDFWiODmObwQ@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey!

> > > On our setup, using i.MX6DL based board and a PCIe Sierra Wireless
> > > EM9190 module, running Yocto and Linux 5.13, we don't have much
> > > success
> > > for the moment, qmi and mbim commands very often end in timeout.
> > >
> > > Otherwise, when responses are received, we also can observe strange
> > > things: unexpected messages, response to previous commands or queue
> > > buffer issue.
> > >
> >
> > Once all my boot reliability issues seem solved, I've also started to
> > notice what you mean here. If I run a normal ModemManager build with
> > both QMI and MBIM enabled, MM will try to probe both the QMI and MBIM
> > ports. When that happens, I have no idea why, the modem gets in some
> > weird state with commands timing out and what not. Maybe it's because
> > we're using both ports at the same time, maybe it's because we run
> > QMI
> > on both the QMI and MBIM ports, no idea, the only thing I know is
> > that
> > if you choose to use either one or the other, the whole setup is
> > fully
> > stable.
> >
> > E.g. I'm right now testing my build after compiling ModemManager
> > using
> > --without-mbim (so QMI only), and I have absolutely no error.
>
> That's very good news!
>
> > Another
> > option if you don't want to rebuild MM is to flag the MBIM or the QMI
> > port as ID_MM_PORT_IGNORE with udev rules, which is very likely what
> > I'll end up doing in upstream ModemManager to have a proper default.
> >
> > I was thinking in preparing and sending for review the EM91xx entry
> > for drivers/bus/mhi/pci_generic.c, but it's mostly based on what you
> > suggested in the Sierra Wireless forum, so not sure if you'd like to
> > send it yourself here?
>
> I can send it myself here, and I add you as developer if you'd like ?
>

Then please send it yourself, I just suggested a couple minor changes
on the work you did :)
Thanks!

-- 
Aleksander
https://aleksander.es
