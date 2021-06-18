Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6666A3AD12C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbhFRRaC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236110AbhFRRaC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:30:02 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D60C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:27:51 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id x16so8148395pfa.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o6JSCuNhJRPmeG2LThK2G7dXzQPnDH3g4gRubpKvWLY=;
        b=QJYPl2IdAgAuRwV7Zm8taNLnuBhQof6xHkgObwxLGbhCbnXkkQffNWICSNkqIaAeY6
         J52XwmZ7VKFrX0ASISLO77OmTEdoatntTAkqplHgjixfUe1Yql7q38tx9POu+v6oe6RV
         kKB/St//jw9phyy19H0/x4T5dpDpNhwk30DwrYsHn4CcIc3ckclvKR26ptGnKXFIzvjI
         NvemTwbuRGzT6PcoCwtPH+6lHtyegOuk8nZDHj9oHc9WU78OH52ab6jRXprLw387BqKj
         ueTMQyV/ALnLSpUoVqt2iFDkFsD/SSGHhoRInCYIcZsEjxaz/1a0KEvIDCIQt8gAFIsx
         GQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o6JSCuNhJRPmeG2LThK2G7dXzQPnDH3g4gRubpKvWLY=;
        b=pYzL3NHNEzOB/h/0QfPAlqwO0cJmMiuIDdfMLyuSbDoCSNE9IEL7+SpzaQXDBYvcZO
         X2nRJ3FR+b5mXOI1VQzxeZyuMG8rPrtWL5yCfRpLfU+oPFn7+O0M8Hj4gsXkxxLzViK+
         71pE22QhGQOE/M7Vn58OsS894rnUVxoyxxNByMsIncBS1SNULJ+GLXXZRx/dv/eMi2Ul
         xH/TxUjd0/axykXUX8X864komLOf5pJ31lB4zZC0FoxIqzYGDQyVkxOOrGZws9rkUXVW
         VF679kgcOGO/zokfeUrOoj6WqsMXPIxPYgYPxCANb5alcjdNEiTrZmNbzlC7iUB5hHWZ
         UGxQ==
X-Gm-Message-State: AOAM532SHGwBo/JfX4OKVMn+5OKBbPERvJROjIHks7dqnnWxX7o+Si2Z
        zVGKSixQAW4sTioSAolmp0aJ
X-Google-Smtp-Source: ABdhPJyss4fP3/3QBx60SCM0dV4qE0TCTLG1MwBQ2qBrU2NDs5bQT86xH0RE3sx+ZLlnYkU59ncQgA==
X-Received: by 2002:a63:921e:: with SMTP id o30mr3238740pgd.346.1624037271043;
        Fri, 18 Jun 2021 10:27:51 -0700 (PDT)
Received: from workstation ([120.138.13.221])
        by smtp.gmail.com with ESMTPSA id t1sm8244798pfe.61.2021.06.18.10.27.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 10:27:50 -0700 (PDT)
Date:   Fri, 18 Jun 2021 22:57:46 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Apply no-op for wake using inband
 wake support flag
Message-ID: <20210618172746.GA30140@workstation>
References: <1623954233-32092-1-git-send-email-bbhatt@codeaurora.org>
 <20210618065249.GN3682@workstation>
 <83d12d5cc46ef7fda12caf7e3bdfddd1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83d12d5cc46ef7fda12caf7e3bdfddd1@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 18, 2021 at 10:06:28AM -0700, Bhaumik Bhatt wrote:
> Hi Mani,
> On 2021-06-17 11:52 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jun 17, 2021 at 11:23:53AM -0700, Bhaumik Bhatt wrote:
> > > Devices such as SDX24 do not have the provision for inband wake
> > > doorbell in the form of channel 127. Newer devices such as SDX55
> > > or SDX65 have it by default. Ensure the functionality is used
> > > based on this such that device wake stays held when a client
> > > driver uses mhi_device_get() API or the equivalent debugfs entry.
> > > 
> > > Fixes: e3e5e6508fc1 ("bus: mhi: pci_generic: No-Op for device_wake
> > > operations")
> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > ---
> > >  drivers/bus/mhi/pci_generic.c | 26 ++++++++++++++++++--------
> > >  1 file changed, 18 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/bus/mhi/pci_generic.c
> > > b/drivers/bus/mhi/pci_generic.c
> > > index d84b743..31360a2 100644
> > > --- a/drivers/bus/mhi/pci_generic.c
> > > +++ b/drivers/bus/mhi/pci_generic.c
> > > @@ -32,6 +32,7 @@
> > >   * @edl: emergency download mode firmware path (if any)
> > >   * @bar_num: PCI base address register to use for MHI MMIO register
> > > space
> > >   * @dma_data_width: DMA transfer word size (32 or 64 bits)
> > > + * @no_inband_wake: Devices without inband wake support (such as
> > > sdx24)
> > 
> > I'd rather like this field to be "inband_wake" and set to false/true
> > based on the capability of the devices. Rest looks good.
> > 
> > Thanks,
> > Mani
> > 
> I should have known this was coming :)
> 
> Can I use sideband_wake instead of no_inband_wake and leave the booleans as
> is?

Do you mean, the older devices uses a dedicated sideband GPIO for
controlling the wakeup? If so, what is it?

> By default, inband_wake will have to be true for any and all devices moving
> forward.
> 

Right but still the functionality is not present in older devices. So I
think it makes sense to stay with "inband_wake".

Thanks,
Mani

> Please let me know your preference.
> > >   */
> > >  struct mhi_pci_dev_info {
> > >  	const struct mhi_controller_config *config;
> > > @@ -40,6 +41,7 @@ struct mhi_pci_dev_info {
> > >  	const char *edl;
> > >  	unsigned int bar_num;
> > >  	unsigned int dma_data_width;
> > > +	bool no_inband_wake;
> > >  };
> > > 
> > >  #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> > > @@ -242,7 +244,8 @@ static const struct mhi_pci_dev_info
> > > mhi_qcom_sdx65_info = {
> > >  	.edl = "qcom/sdx65m/edl.mbn",
> > >  	.config = &modem_qcom_v1_mhiv_config,
> > >  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > > -	.dma_data_width = 32
> > > +	.dma_data_width = 32,
> > > +	.no_inband_wake = false
> > >  };
> > > 
> > >  static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
> > > @@ -251,7 +254,8 @@ static const struct mhi_pci_dev_info
> > > mhi_qcom_sdx55_info = {
> > >  	.edl = "qcom/sdx55m/edl.mbn",
> > >  	.config = &modem_qcom_v1_mhiv_config,
> > >  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > > -	.dma_data_width = 32
> > > +	.dma_data_width = 32,
> > > +	.no_inband_wake = false
> > >  };
> > > 
> > >  static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
> > > @@ -259,7 +263,8 @@ static const struct mhi_pci_dev_info
> > > mhi_qcom_sdx24_info = {
> > >  	.edl = "qcom/prog_firehose_sdx24.mbn",
> > >  	.config = &modem_qcom_v1_mhiv_config,
> > >  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > > -	.dma_data_width = 32
> > > +	.dma_data_width = 32,
> > > +	.no_inband_wake = true
> > >  };
> > > 
> > >  static const struct mhi_channel_config mhi_quectel_em1xx_channels[]
> > > = {
> > > @@ -301,7 +306,8 @@ static const struct mhi_pci_dev_info
> > > mhi_quectel_em1xx_info = {
> > >  	.edl = "qcom/prog_firehose_sdx24.mbn",
> > >  	.config = &modem_quectel_em1xx_config,
> > >  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > > -	.dma_data_width = 32
> > > +	.dma_data_width = 32,
> > > +	.no_inband_wake = true
> > >  };
> > > 
> > >  static const struct mhi_channel_config mhi_foxconn_sdx55_channels[]
> > > = {
> > > @@ -339,7 +345,8 @@ static const struct mhi_pci_dev_info
> > > mhi_foxconn_sdx55_info = {
> > >  	.edl = "qcom/sdx55m/edl.mbn",
> > >  	.config = &modem_foxconn_sdx55_config,
> > >  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > > -	.dma_data_width = 32
> > > +	.dma_data_width = 32,
> > > +	.no_inband_wake = false
> > >  };
> > > 
> > >  static const struct pci_device_id mhi_pci_id_table[] = {
> > > @@ -640,9 +647,12 @@ static int mhi_pci_probe(struct pci_dev *pdev,
> > > const struct pci_device_id *id)
> > >  	mhi_cntrl->status_cb = mhi_pci_status_cb;
> > >  	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
> > >  	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> > > -	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
> > > -	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
> > > -	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
> > > +
> > > +	if (info->no_inband_wake) {
> > > +		mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
> > > +		mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
> > > +		mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
> > > +	}
> > > 
> > >  	err = mhi_pci_claim(mhi_cntrl, info->bar_num,
> > > DMA_BIT_MASK(info->dma_data_width));
> > >  	if (err)
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > a Linux Foundation Collaborative Project
> > > 
> 
> Thanks,
> Bhaumik
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
