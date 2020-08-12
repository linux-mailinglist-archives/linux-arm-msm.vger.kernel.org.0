Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC0A242407
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 04:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgHLCW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 22:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgHLCW2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 22:22:28 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E818C06174A;
        Tue, 11 Aug 2020 19:22:28 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id g6so486188ljn.11;
        Tue, 11 Aug 2020 19:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z/e0pOtFdHj174q/0e3ZuFusjMXBEvLuHWOiwJUcqag=;
        b=HthDeMH8RKFpoZxRW1lCINtZq/UMQN2pqoJOs9NPlXzmgEo+6F41VMa8XTK7ai2nn+
         rrSYvJLCAOdrY9iTRzYfiCfI5a33DOFeTXsCvppdtcl1+bRlvfhyo7Z1CmuJW8yvVA/o
         B0OyCYbbD/X5mXcDaGIiHfZTf8kw39czwMhxwli+a+laCmbZboHkskH0H5elV7L3XsYv
         fbH96jF6YFygUBkhAfUysrSBV0xiLuTO2h/nCvSnwpCCbOMcNNiPbGK47rYRywxeQdyE
         g+oidsGklmAjO0r2HMKwED00LoPTdhyE6/ue15inbfYpXjzigIcZYDkWIpetnNtyOVki
         RgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z/e0pOtFdHj174q/0e3ZuFusjMXBEvLuHWOiwJUcqag=;
        b=cwUwtXst4+gxO+Lznp4zpJ3kiZf+/pVa93Nk6fXx6NuaCyStQGf/ODQvfJRdTiCdjA
         HgapSfBJqqlO0ntUXkxRZQ5U2a8WAOsdArhqa9373lgBj3RsIl+XaoqPBEE9d2RoIqWv
         m251hpp2NpbzZX7TzciAsRLLZAyTFxDwBZFogbWEJkwxGVr1H7Bx7mgLuRz0hkjkF6Rf
         RyOSKscRgox8LcujUs/khseWf+e/hoRdVY+VzQu9EjFXZb8up+/Xa5szbA4enRGC0et0
         6u0e92aLabcRhKG1u7xZDupsiISxhNqYv+49AgEy4OnQDvkNEacwgkD2aM5wjKunFs2g
         +AaQ==
X-Gm-Message-State: AOAM532c07sv7bUzf+8Hev1tADKpijTAxIkBl8QN4AoAlAi1eSvwKzrU
        U3ohvcWybVYjA9ENh5D+K2oe6JCryOY1ojvIizy0k/T1TabEMQ==
X-Google-Smtp-Source: ABdhPJzl3jNhuD5EmOAmK4WMWsW6xQpy5lPBYv0/o9ZVAfwjheq+1/Uc8OHGuLpNPcFJsVLBp0BDjTDipB6dxSoXfe4=
X-Received: by 2002:a2e:9c86:: with SMTP id x6mr4165220lji.346.1597198946676;
 Tue, 11 Aug 2020 19:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200624022848.7765-1-wcheng@codeaurora.org> <20200624022848.7765-2-wcheng@codeaurora.org>
In-Reply-To: <20200624022848.7765-2-wcheng@codeaurora.org>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Wed, 12 Aug 2020 10:22:15 +0800
Message-ID: <CAL411-qvuCTib1VBV9uRwL-rEHkefFLm1x-WLLP4kYzcNtQd_g@mail.gmail.com>
Subject: Re: [RFC v4 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        robh+dt@kernel.org, lkml <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>, jackp@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 24, 2020 at 10:31 AM Wesley Cheng <wcheng@codeaurora.org> wrote:
>
> Some devices have USB compositions which may require multiple endpoints
> that support EP bursting.  HW defined TX FIFO sizes may not always be
> sufficient for these compositions.  By utilizing flexible TX FIFO
> allocation, this allows for endpoints to request the required FIFO depth to
> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
> a larger TX FIFO size results in better TX throughput.
>
> Ensure that one TX FIFO is reserved for every IN endpoint.  This allows for
> the FIFO logic to prevent running out of FIFO space.
>

You may do this for only allocated endpoints, but you need override
default .match_ep
API. See cdns3/gadget.c and cdns3/ep0.c as an example.

Peter

> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.c   |   2 +
>  drivers/usb/dwc3/core.h   |   8 +++
>  drivers/usb/dwc3/ep0.c    |  37 +++++++++++-
>  drivers/usb/dwc3/gadget.c | 115 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 161 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index edc17155cb2b..cca555493929 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1304,6 +1304,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>                                 &tx_thr_num_pkt_prd);
>         device_property_read_u8(dev, "snps,tx-max-burst-prd",
>                                 &tx_max_burst_prd);
> +       dwc->needs_fifo_resize = device_property_read_bool(dev,
> +                               "tx-fifo-resize");
>
>         dwc->disable_scramble_quirk = device_property_read_bool(dev,
>                                 "snps,disable_scramble_quirk");
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 4c171a8e215f..ce0bf288b6ac 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -675,6 +675,7 @@ struct dwc3_event_buffer {
>   *             isochronous START TRANSFER command failure workaround
>   * @start_cmd_status: the status of testing START TRANSFER command with
>   *             combo_num = 'b00
> + * @fifo_depth: allocated TXFIFO depth
>   */
>  struct dwc3_ep {
>         struct usb_ep           endpoint;
> @@ -727,6 +728,7 @@ struct dwc3_ep {
>         /* For isochronous START TRANSFER workaround only */
>         u8                      combo_num;
>         int                     start_cmd_status;
> +       int                     fifo_depth;
>  };
>
>  enum dwc3_phy {
> @@ -1004,6 +1006,7 @@ struct dwc3_scratchpad_array {
>   *     1       - utmi_l1_suspend_n
>   * @is_fpga: true when we are using the FPGA board
>   * @pending_events: true when we have pending IRQs to be handled
> + * @needs_fifo_resize: not all users might want fifo resizing, flag it
>   * @pullups_connected: true when Run/Stop bit is set
>   * @setup_packet_pending: true when there's a Setup Packet in FIFO. Workaround
>   * @three_stage_setup: set if we perform a three phase setup
> @@ -1044,6 +1047,8 @@ struct dwc3_scratchpad_array {
>   * @dis_metastability_quirk: set to disable metastability quirk.
>   * @imod_interval: set the interrupt moderation interval in 250ns
>   *                 increments or 0 to disable.
> + * @last_fifo_depth: total TXFIFO depth of all enabled USB IN/INT endpoints
> + * @num_ep_resized: the number of TX FIFOs that have already been resized
>   */
>  struct dwc3 {
>         struct work_struct      drd_work;
> @@ -1204,6 +1209,7 @@ struct dwc3 {
>         unsigned                is_utmi_l1_suspend:1;
>         unsigned                is_fpga:1;
>         unsigned                pending_events:1;
> +       unsigned                needs_fifo_resize:1;
>         unsigned                pullups_connected:1;
>         unsigned                setup_packet_pending:1;
>         unsigned                three_stage_setup:1;
> @@ -1236,6 +1242,8 @@ struct dwc3 {
>         unsigned                dis_metastability_quirk:1;
>
>         u16                     imod_interval;
> +       int                     last_fifo_depth;
> +       int                     num_ep_resized;
>  };
>
>  #define INCRX_BURST_MODE 0
> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> index 6dee4dabc0a4..76db9b530861 100644
> --- a/drivers/usb/dwc3/ep0.c
> +++ b/drivers/usb/dwc3/ep0.c
> @@ -601,8 +601,9 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
>  {
>         enum usb_device_state state = dwc->gadget.state;
>         u32 cfg;
> -       int ret;
> +       int ret, num, size;
>         u32 reg;
> +       struct dwc3_ep *dep;
>
>         cfg = le16_to_cpu(ctrl->wValue);
>
> @@ -611,6 +612,40 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
>                 return -EINVAL;
>
>         case USB_STATE_ADDRESS:
> +               /*
> +                * If tx-fifo-resize flag is not set for the controller, then
> +                * do not clear existing allocated TXFIFO since we do not
> +                * allocate it again in dwc3_gadget_resize_tx_fifos
> +                */
> +               if (dwc->needs_fifo_resize) {
> +                       /* Read ep0IN related TXFIFO size */
> +                       dep = dwc->eps[1];
> +                       size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
> +                       if (dwc3_is_usb31(dwc))
> +                               dep->fifo_depth = DWC31_GTXFIFOSIZ_TXFDEP(size);
> +                       else
> +                               dep->fifo_depth = DWC3_GTXFIFOSIZ_TXFDEP(size);
> +
> +                       dwc->last_fifo_depth = dep->fifo_depth;
> +                       /* Clear existing TXFIFO for all IN eps except ep0 */
> +                       for (num = 3; num < min_t(int, dwc->num_eps,
> +                               DWC3_ENDPOINTS_NUM); num += 2) {
> +                               dep = dwc->eps[num];
> +                               /* Don't change TXFRAMNUM on usb31 version */
> +                               size = dwc3_is_usb31(dwc) ?
> +                                       dwc3_readl(dwc->regs,
> +                                                  DWC3_GTXFIFOSIZ(num >> 1)) &
> +                                                  DWC31_GTXFIFOSIZ_TXFRAMNUM :
> +                                                  0;
> +
> +                               dwc3_writel(dwc->regs,
> +                                           DWC3_GTXFIFOSIZ(num >> 1),
> +                                           size);
> +                               dep->fifo_depth = 0;
> +                       }
> +                       dwc->num_ep_resized = 0;
> +               }
> +
>                 ret = dwc3_ep0_delegate_req(dwc, ctrl);
>                 /* if the cfg matches and the cfg is non zero */
>                 if (cfg && (!ret || (ret == USB_GADGET_DELAYED_STATUS))) {
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 00746c2848c0..777badf3e85d 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -540,6 +540,117 @@ static int dwc3_gadget_start_config(struct dwc3_ep *dep)
>         return 0;
>  }
>
> +/*
> + * dwc3_gadget_resize_tx_fifos - reallocate fifo spaces for current use-case
> + * @dwc: pointer to our context structure
> + *
> + * This function will a best effort FIFO allocation in order
> + * to improve FIFO usage and throughput, while still allowing
> + * us to enable as many endpoints as possible.
> + *
> + * Keep in mind that this operation will be highly dependent
> + * on the configured size for RAM1 - which contains TxFifo -,
> + * the amount of endpoints enabled on coreConsultant tool, and
> + * the width of the Master Bus.
> + *
> + * In general, FIFO depths are represented with the following equation:
> + *
> + * fifo_size = mult * ((max_packet + mdwidth)/mdwidth + 1) + 1
> + *
> + * Conversions can be done to the equation to derive the number of packets that
> + * will fit to a particular FIFO size value.
> + */
> +static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
> +{
> +       struct dwc3 *dwc = dep->dwc;
> +       int ram1_depth, mdwidth, fifo_0_start, tmp, num_in_ep;
> +       int min_depth, remaining, fifo_size, mult = 1, fifo, max_packet = 1024;
> +
> +       if (!dwc->needs_fifo_resize)
> +               return 0;
> +
> +       /* resize IN endpoints except ep0 */
> +       if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
> +               return 0;
> +
> +       /* Don't resize already resized IN endpoint */
> +       if (dep->fifo_depth)
> +               return 0;
> +
> +       ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
> +       mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
> +       /* MDWIDTH is represented in bits, we need it in bytes */
> +       mdwidth >>= 3;
> +
> +       if (((dep->endpoint.maxburst > 1) &&
> +                       usb_endpoint_xfer_bulk(dep->endpoint.desc))
> +                       || usb_endpoint_xfer_isoc(dep->endpoint.desc))
> +               mult = 3;
> +
> +       if ((dep->endpoint.maxburst > 6) &&
> +                       usb_endpoint_xfer_bulk(dep->endpoint.desc)
> +                       && dwc3_is_usb31(dwc))
> +               mult = 6;
> +
> +       /* FIFO size for a single buffer */
> +       fifo = (max_packet + mdwidth)/mdwidth;
> +       fifo++;
> +
> +       /* Calculate the number of remaining EPs w/o any FIFO */
> +       num_in_ep = dwc->num_eps/2;
> +       num_in_ep -= dwc->num_ep_resized;
> +       /* Ignore EP0 IN */
> +       num_in_ep--;
> +
> +       /* Reserve at least one FIFO for the number of IN EPs */
> +       min_depth = num_in_ep * (fifo+1);
> +       remaining = ram1_depth - min_depth - dwc->last_fifo_depth;
> +
> +       /* We've already reserved 1 FIFO per EP, so check what we can fit in
> +        * addition to it.  If there is not enough remaining space, allocate
> +        * all the remaining space to the EP.
> +        */
> +       fifo_size = (mult-1) * fifo;
> +       if (remaining < fifo_size) {
> +               if (remaining > 0)
> +                       fifo_size = remaining;
> +               else
> +                       fifo_size = 0;
> +       }
> +
> +       fifo_size += fifo;
> +       fifo_size++;
> +       dep->fifo_depth = fifo_size;
> +
> +       /* Check if TXFIFOs start at non-zero addr */
> +       tmp = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
> +       fifo_0_start = DWC3_GTXFIFOSIZ_TXFSTADDR(tmp);
> +
> +       fifo_size |= (fifo_0_start + (dwc->last_fifo_depth << 16));
> +       if (dwc3_is_usb31(dwc))
> +               dwc->last_fifo_depth += DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
> +       else
> +               dwc->last_fifo_depth += DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
> +
> +       /* Check fifo size allocation doesn't exceed available RAM size. */
> +       if (dwc->last_fifo_depth >= ram1_depth) {
> +               dev_err(dwc->dev, "Fifosize(%d) > RAM size(%d) %s depth:%d\n",
> +                               (dwc->last_fifo_depth * mdwidth), ram1_depth,
> +                               dep->endpoint.name, fifo_size);
> +               if (dwc3_is_usb31(dwc))
> +                       fifo_size = DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
> +               else
> +                       fifo_size = DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
> +               dwc->last_fifo_depth -= fifo_size;
> +               dep->fifo_depth = 0;
> +               return -ENOMEM;
> +       }
> +
> +       dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
> +       dwc->num_ep_resized++;
> +       return 0;
> +}
> +
>  static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
>  {
>         const struct usb_ss_ep_comp_descriptor *comp_desc;
> @@ -620,6 +731,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
>         int                     ret;
>
>         if (!(dep->flags & DWC3_EP_ENABLED)) {
> +               ret = dwc3_gadget_resize_tx_fifos(dep);
> +               if (ret)
> +                       return ret;
> +
>                 ret = dwc3_gadget_start_config(dep);
>                 if (ret)
>                         return ret;
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
