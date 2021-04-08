Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F5735827E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 13:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbhDHLyK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 07:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbhDHLyK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 07:54:10 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0C5C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 04:53:58 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id f29so1231724pgm.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b8N5/slbOHKAsMgxg+NRLYuuOFp0gJPAj2masL5iJQo=;
        b=M/4KlLXaQmDVKI5QcskXqIJ7oHrc6YdEGB8lSeS6LRMfvbwxSLDBgcIQmWDu+Cf0WS
         EMCuik8LrSYeWHHWhdx9W3oMrQ6Ntcsq+lTm8WyNA4j2Un8sq2EHOQNcois4gnICluP7
         OpcNYz4ByVanAVKY2wjQzxooLpp3f1O4XcU3MGADFxJXSM9pV4vDeNxkaSDVaiBR9Hwk
         HsbR/Yy5ZzrWWkdhXgoa6GiMtgLV/vpwGYdiEUVDaLIw1mi3puVLtK1o/vjEny6kED+C
         gCpeKBZSUyjlQ9u2dti7Ptt9gC6iWkYRB2M30X/sCwYzBwY3C3NpnmlsfSJBEBFf9q2U
         QJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b8N5/slbOHKAsMgxg+NRLYuuOFp0gJPAj2masL5iJQo=;
        b=gsphQYoqOqPYVkdeCTXMMdtADD74lAEoZx5OPymi7in/0lKHCAseCkYJc+HWuc6ayJ
         VC5EIsqT0WR0kxMZVYknqvMkt3sdkbJ5Qt5Zn01eOzZchiA58mVgOodKRp0zspDhG84x
         KoUDHKCq+21bjko6OTS9ZrmLb/mI1Sak6AVxHvF59EJGgckb06K4v60tpqwmxKh6v00g
         EFrWey0XbVaI4vdsaQg25zucVfo/V4EKfVHu+ico7vAypVbWpGZzvBCkyaeT+8wq3HDm
         IqOHEMTnHapl8pg6TLbguYw49v44pm2o/YTQcM52in+s+64uCOuEnLct/n4V893g+s1t
         I2ig==
X-Gm-Message-State: AOAM532Za+esRSD5K9v303YpdF2j5LCUVOLZBgPC28qlfaMUBECAKQij
        pXVHLJGiTEgHJrU/t3jx9lJBvmeT93mneuJW9Ev7DQ==
X-Google-Smtp-Source: ABdhPJz0qUkCKTy05reSZEe+kiUIPr/5B8Rtgl6DQI4KJWPoIg598td1fqF9xh9yKC3PLZwwfHc0SOhuvUNzF3gNKrA=
X-Received: by 2002:a63:62c4:: with SMTP id w187mr7472449pgb.173.1617882837913;
 Thu, 08 Apr 2021 04:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210408095524.3559-1-jarvis.w.jiang@gmail.com>
In-Reply-To: <20210408095524.3559-1-jarvis.w.jiang@gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 8 Apr 2021 14:02:07 +0200
Message-ID: <CAMZdPi-qkQS7MW2Uc5EO7e_oraXvF6W8WxsWYfi4ydHyB15=-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] [v2] bus: mhi: pci_generic: Introduce Foxconn T99W175 support
To:     Jarvis Jiang <jarvis.w.jiang@gmail.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        cchen50@lenovo.com, mpearson@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Apr 2021 at 11:56, Jarvis Jiang <jarvis.w.jiang@gmail.com> wrote:
>
> Add support for T99W175 modems, this modem series is based on SDX55
> qcom chip. The modem is mainly based on MBIM protocol for both the
> data and control path.
>
> This patch adds support for below modems:
>
>  - T99W175(based on sdx55), Both for eSIM and Non-eSIM
>  - DW5930e(based on sdx55), With eSIM, It's also T99W175
>  - DW5930e(based on sdx55), Non-eSIM, It's also T99W175
>
> This patch was tested with Ubuntu 20.04 X86_64 PC as host
>
> Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>

It looks good, I assume that for now, you're relying on additional
patches for the control path, like mhi_uci or mhi_wwan_ctrl.

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>



> ---
>  drivers/bus/mhi/pci_generic.c | 47 +++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 544853c67e02..c66fb73e47ad 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -269,6 +269,44 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
>         .dma_data_width = 32
>  };
>
> +static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> +       MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
> +};
> +
> +static struct mhi_controller_config modem_foxconn_sdx55_config = {
> +       .max_channels = 128,
> +       .timeout_ms = 20000,
> +       .num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> +       .ch_cfg = mhi_foxconn_sdx55_channels,
> +       .num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> +       .event_cfg = mhi_foxconn_sdx55_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> +       .name = "foxconn-sdx55",
> +       .fw = "qcom/sdx55m/sbl1.mbn",
> +       .edl = "qcom/sdx55m/edl.mbn",
> +       .config = &modem_foxconn_sdx55_config,
> +       .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width = 32
> +};
> +
>  static const struct pci_device_id mhi_pci_id_table[] = {
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>                 .driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> @@ -280,6 +318,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>                 .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
>                 .driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
> +       /* T99W175 (sdx55), Both for eSIM and Non-eSIM */
> +       { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
> +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +       /* DW5930e (sdx55), With eSIM, It's also T99W175 */
> +       { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b0),
> +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +       /* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
> +       { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
> +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>         {  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> --
> 2.25.1
>
