Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099F535663E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 10:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238667AbhDGIQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 04:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239694AbhDGIQY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 04:16:24 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306B5C06174A;
        Wed,  7 Apr 2021 01:16:14 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id t12so9204732vsj.11;
        Wed, 07 Apr 2021 01:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jxTFnpucPnAi1N3UXdkNnyLFs5sKLR+gyo9NSip9CmU=;
        b=C8KLX6qyPmF/H1QRLziSM139KsLtK1Y8CTT7gIfYa09eaewPtyIiai63+jnFpGyJk1
         EwNkdXzIKBDG5UzqAa7y/7eTgXQ4VDELTPGD+/d8Nr8BQl2rSiitqbcsXM9cvNna/IJK
         g4lkI/qk0DaqZDo4WQ3vCCh2lRkIno7UrJvzuT6pOhQkjPcIFPNdkaF7SJHoTrMvacjT
         joPffG79B2JDvcIfeBlimO3yxpDEB4QSxMhJ4JDW26PjclTsYQzrIL87s1Z4oeZMLeGb
         9DJVGco6XosfRWf1TbtcixFllpOm1RkLPqA1IFXSVKqijgVVFkIywsxh0eKqpZWqNNbL
         KWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jxTFnpucPnAi1N3UXdkNnyLFs5sKLR+gyo9NSip9CmU=;
        b=nF4yO6XtprSGozuJsStJXWzEOHLn5uqg1K3xAPU+2x3HiY1mYoMLL2v3Yg+gS8NQmD
         UuW+4BD1p9uR4CSNhwkIyD40LXuzY7BX6o7nCMySKP3amPR67xmCbxAErnOExU4GSrhk
         vg5FEq6UyKnrgGRO0AR7kr6HuEm0k53exGi9bfpam89eiKcxEFdcFQ+4z6JFRJckv55U
         Ri7B2JcO1jnENWvyUK5l1eLglhLDUOHQ4csuDEide6fegWT4g63H3wNdidAJ3hXECYRz
         iRqdlpjdDYIDZAAdHb+e0e+MRPVh1xqLzdrhhJwtz/TI7dxllAstz44duFHJRjjJp12P
         kz+g==
X-Gm-Message-State: AOAM5317mo+zXJXITtZj4VUjylqlgHWkQn34o95uuN0APvpQdFG3bCYE
        ZNw+Vmlaid+Td6vdVc0CX+nPaNiSXdzatFPUtX2BIrww025IQNiI
X-Google-Smtp-Source: ABdhPJwxTsYs1r740O6pMRBrEudIy5pixqXDB11KbQohN6NZsUgaUuoJ+G3N3L/Lmvwsmd/nmgCS+ikMoz0W3g2DJmU=
X-Received: by 2002:a05:6102:1274:: with SMTP id q20mr997881vsg.6.1617783373277;
 Wed, 07 Apr 2021 01:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210407025029.2616-1-jarvis.w.jiang@gmail.com> <20210407064641.GH8675@work>
In-Reply-To: <20210407064641.GH8675@work>
From:   Jarvis Jiang <jarvis.w.jiang@gmail.com>
Date:   Wed, 7 Apr 2021 16:16:03 +0800
Message-ID: <CAPncsNM9M4sF6Z=kmHhr-n-==HMWQyj3A=+y+u4By_-WDY93vQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Introduce Foxconn T99W175 support
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cchen50@lenovo.com,
        mpearson@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 7, 2021 at 2:46 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Tue, Apr 06, 2021 at 07:50:29PM -0700, Jarvis Jiang wrote:
> > Add support for T99W175 modems, this modem series is based on SDX55
> > qcom chip. The modem is mainly based on MBIM protocol for both the
> > data and control path.
> >
>
> List the modems whose support is being added.

Ok, I will add the modems supported in the next iteration.

>
> > This patch was tested with Ubuntu 20.04 X86_64 PC as host
> >
> > Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>
> > ---
> >  drivers/bus/mhi/pci_generic.c | 58 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index 5cf44bcfe040..3e396c65a758 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -260,6 +260,52 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
> >       .dma_data_width = 32
> >  };
> >
> > +static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> > +     MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
> > +     MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
> > +     MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> > +     MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> > +     MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> > +     MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> > +     MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
> > +     MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> > +     MHI_CHANNEL_CONFIG_UL(16, "QMI1", 32, 0),
> > +     MHI_CHANNEL_CONFIG_DL(17, "QMI1", 32, 0),
> > +     MHI_CHANNEL_CONFIG_UL(18, "IP_CTRL", 32, 0),
> > +     MHI_CHANNEL_CONFIG_DL(19, "IP_CTRL", 32, 0),
> > +     MHI_CHANNEL_CONFIG_UL(20, "IPCR", 32, 0),
> > +     MHI_CHANNEL_CONFIG_DL(21, "IPCR", 32, 0),
> > +     MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
> > +     MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
> > +     MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> > +     MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> > +};
> > +
> > +static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
> > +     MHI_EVENT_CONFIG_CTRL(0, 128),
> > +     MHI_EVENT_CONFIG_DATA(1, 128),
> > +     MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> > +     MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
> > +};
> > +
> > +static struct mhi_controller_config modem_foxconn_sdx55_config = {
> > +     .max_channels = 128,
> > +     .timeout_ms = 20000,
> > +     .num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> > +     .ch_cfg = mhi_foxconn_sdx55_channels,
> > +     .num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> > +     .event_cfg = mhi_foxconn_sdx55_events,
> > +};
> > +
> > +static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> > +     .name = "foxconn-sdx55",
> > +     .fw = "qcom/sdx55m/sbl1.mbn",
> > +     .edl = "qcom/sdx55m/edl.mbn",
> > +     .config = &modem_foxconn_sdx55_config,
> > +     .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > +     .dma_data_width = 32
> > +};
> > +
> >  static const struct pci_device_id mhi_pci_id_table[] = {
> >       { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
> >               .driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> > @@ -269,6 +315,18 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> >               .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> >       { PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
> >               .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> > +     { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab), /* T99W175 (sdx55) */
> > +             .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> > +     { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b2), /* T99W175 (sdx55) */
> > +             .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> > +     { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b3), /* T99W175 (sdx55) */
> > +             .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>
> Please add a comment about these devices as you did below. Using T99W175 (sdx55)
> for all is not sufficient.
>
> Thanks,
> Mani
>
Ok, thanks, I will give more comments in the next patch.
Jarvis.

> > +     /* DW5930e (sdx55), With eSIM, It's also T99W175 */
> > +     { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b0),
> > +             .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> > +     /* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
> > +     { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
> > +             .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> >       {  }
> >  };
> >  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> > --
> > 2.25.1
> >
