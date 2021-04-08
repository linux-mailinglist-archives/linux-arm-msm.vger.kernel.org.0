Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81AEA357C27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 08:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhDHGKs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 02:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhDHGKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 02:10:48 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633FDC061761;
        Wed,  7 Apr 2021 23:10:37 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id r12so550723vsj.5;
        Wed, 07 Apr 2021 23:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CUQ3cwp/ARSckTERs7Pr5Akk9wwQpgTRfXX9Y/FHi14=;
        b=fU9JE0TCyFIucBVJnRwcGQ/I5/C2wkxeYG7SD3vZ8CHwfXKkDlrjczcT3xz6TXNxER
         RvDc//LklJ1n4MVKTGNSisoYZoz2qOAnvzvi9OXUgGKq8l52ps4EpGw9GmTw7f2GdiXx
         ozlBmLCS17U9jVkhsIy7O8M9OPngduJLGP1cycRdbG1nm9LbqXend244/U3+mZkUfqx/
         /R3uTDIU0kb290sJHU1o8CO8VC0cJgvHrqjFMgUcTgGljUpdDhK/dNGYQYn62/RGvolF
         XnXzlAFvxlwZC2ycK/jiyc5tqIatiJP3+SAGuXfgtofCi40D9hzImygWoY+od41qAG2O
         jarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CUQ3cwp/ARSckTERs7Pr5Akk9wwQpgTRfXX9Y/FHi14=;
        b=HHKJPxLbEBaG2o/fHc2RNccL7MQCytzdQEjfZlKhCikxoVfp2WRR/lsxr2jHPzxi2n
         5/FZvuj0L3S0B+oVbtmZ/zVHdKYGav1D5PJWg/nIN6zJgs7Xtmlsl+CyCj5dZgU6MgVQ
         WJafjRF1q/jTj5t4nh2fgdAKRTemQKdAFiixt1MvY2gmXHdvIMn+V+1EIjLm3w+MhYdN
         Upjb7+rwwwABEGMPxG7dWo19e0mCfNvIjCi5FIk45PTyD4b+OL6vm6gR6gsy14+NB0Af
         uFhCB28hZHzeSfes4ryT2dqGENIR2mZpycTzQywjUqzGDm/xjKu30anG5uenSv5c9d09
         QUNw==
X-Gm-Message-State: AOAM533rLoPM9Dlf0FMXD9zc52fdTyYq83aCKzWJuyLeQdwxSXcuTOHj
        Jkdi6M9NTbp5IN49el2jYWJaHwKxhAh3ACWvBiA=
X-Google-Smtp-Source: ABdhPJztW4CSyXk2+ABsPhedrg6tFtBRt+cgHN0pE8VW7Y0ihwSfq/f49KmPR2e5IQcLwat01QPVt/kPDucXJWcRd08=
X-Received: by 2002:a67:c783:: with SMTP id t3mr4796844vsk.5.1617862236390;
 Wed, 07 Apr 2021 23:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210407025029.2616-1-jarvis.w.jiang@gmail.com> <CAMZdPi_CZG1e1H+kf7NDRWDxV9hiG-ZCLca7EXgKtsY_NEKatA@mail.gmail.com>
In-Reply-To: <CAMZdPi_CZG1e1H+kf7NDRWDxV9hiG-ZCLca7EXgKtsY_NEKatA@mail.gmail.com>
From:   Jarvis Jiang <jarvis.w.jiang@gmail.com>
Date:   Thu, 8 Apr 2021 14:10:27 +0800
Message-ID: <CAPncsNOk+3ke1fE=ns_-RTUhPftmq7CpJprMQ=v5Myr3Mr=2DA@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Introduce Foxconn T99W175 support
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        cchen50@lenovo.com, mpearson@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 7, 2021 at 4:22 PM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> Hi Jarvis,
>
> On Wed, 7 Apr 2021 at 04:51, Jarvis Jiang <jarvis.w.jiang@gmail.com> wrote:
> >
> > Add support for T99W175 modems, this modem series is based on SDX55
> > qcom chip. The modem is mainly based on MBIM protocol for both the
> > data and control path.
> >
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
> >         .dma_data_width = 32
> >  };
> >
> > +static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> > +       MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
> > +       MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
> > +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> > +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> > +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> > +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> > +       MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
> > +       MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> > +       MHI_CHANNEL_CONFIG_UL(16, "QMI1", 32, 0),
> > +       MHI_CHANNEL_CONFIG_DL(17, "QMI1", 32, 0),
>
> Are these QMI channels need to be exposed, vendors usually expose
> either QMI+QMAP or MBIM (for data and control), here you expose
> IP_HW0_MBIM as 'data' channel, so I would expect that MBIM is all you
> need for the 'control' channel.

Yes, the unnecessary channels will be removed in  the next patch.

Thanks,
Jarvis

>
> > +       MHI_CHANNEL_CONFIG_UL(18, "IP_CTRL", 32, 0),
> > +       MHI_CHANNEL_CONFIG_DL(19, "IP_CTRL", 32, 0),
> > +       MHI_CHANNEL_CONFIG_UL(20, "IPCR", 32, 0),
> > +       MHI_CHANNEL_CONFIG_DL(21, "IPCR", 32, 0),
> > +       MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
> > +       MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
> > +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> > +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> > +};
> > +
> > +static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
> > +       MHI_EVENT_CONFIG_CTRL(0, 128),
> > +       MHI_EVENT_CONFIG_DATA(1, 128),
> > +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> > +       MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
> > +};
> > +
> > +static struct mhi_controller_config modem_foxconn_sdx55_config = {
> > +       .max_channels = 128,
> > +       .timeout_ms = 20000,
> > +       .num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> > +       .ch_cfg = mhi_foxconn_sdx55_channels,
> > +       .num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> > +       .event_cfg = mhi_foxconn_sdx55_events,
> > +};
> > +
> > +static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> > +       .name = "foxconn-sdx55",
> > +       .fw = "qcom/sdx55m/sbl1.mbn",
> > +       .edl = "qcom/sdx55m/edl.mbn",
> > +       .config = &modem_foxconn_sdx55_config,
> > +       .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > +       .dma_data_width = 32
> > +};
> > +
> >  static const struct pci_device_id mhi_pci_id_table[] = {
> >         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
> >                 .driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> > @@ -269,6 +315,18 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> >                 .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> >         { PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
> >                 .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> > +       { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab), /* T99W175 (sdx55) */
> > +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> > +       { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b2), /* T99W175 (sdx55) */
> > +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> > +       { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b3), /* T99W175 (sdx55) */
> > +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> > +       /* DW5930e (sdx55), With eSIM, It's also T99W175 */
> > +       { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b0),
> > +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> > +       /* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
> > +       { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
> > +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> >         {  }
> >  };
> >  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> > --
> > 2.25.1
> >
