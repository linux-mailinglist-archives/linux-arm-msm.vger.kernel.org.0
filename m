Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2F4441E31
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 17:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbhKAQcu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 12:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbhKAQcr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 12:32:47 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E74C061764
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 09:30:13 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id y128so25673833oie.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NO4BrqlCwZmZbzIFPocj3aL6JgeBLaLvgKTDJLmrKow=;
        b=c5BOqick+DqV5dKJ9M60baALaXbKCh/aIQqSXuYz70tg1OfDwDGMvzzzIeeyYzBVOs
         wQEkiwnfWC6z6lgoqkJUBPEAJgLYQjmvp9M91lM1cIw6Ti5yQtAl0/Nxl8u5SiLbgRBI
         PmYRutyZ5MH15Fd+XeBiaPrpJvGxxaywEcUw2SBQWxbuQ2sBzAVrGuMFq95VPhBXyZYx
         /NzEfUGID/5H36AXv0P8aZKWaRB8tcocXFGyNX/WMJI4Eopn6aZXokq8OyFY8uXnKeSQ
         j2PW/OtJz7PLYjc7zwz81gUkgVRku7CG231kOzj/w61d8ntuyIquczXPTUZoLY8AUK1g
         Ak8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NO4BrqlCwZmZbzIFPocj3aL6JgeBLaLvgKTDJLmrKow=;
        b=FLLVCEtVrnFyN33wTnOKEv8hYC8xgL4mxoaUf1Hbs2PrUarMVL4mBSu2+r9/gYfV3c
         VGv4MLK7OwbLchJs+OW2Q4VauPksvznqnKkRkwg6Fdjx3iUYolpNM23//SXPuhqGaJC8
         BTJshk/A/7MdHAcDlvMVm0mB1WexD/6odTUZ8hu/GeqFpk9bd/TBsSxnguGYqTO94AvC
         bm9Gypq8BWOExUkmdxSdEikeuLVx/xraaZ96pQzIRblJowqMSbPQkZFVXbAay+hJhWV1
         OPimuxeIpFWVd7t5B8kQFlRta36gPe+nz6KbV+2zhZ/U8/zfGzu9ISRSTtWWROuAba59
         rCgQ==
X-Gm-Message-State: AOAM532baRxkTn+xZJoPjlmpyDC7kDqSWee2DOdy2ElAN6z0ZwaPC6A1
        PR/t9Vs+IbYnvWuonYvFL+xM+Q==
X-Google-Smtp-Source: ABdhPJynItDH2VN268LubauWKT/90v0CWMv3DwvdnmhPWQ0JcZ2Zo7EN9L5f2cZv1NV4uFJ9cWCm3Q==
X-Received: by 2002:a05:6808:1528:: with SMTP id u40mr11320798oiw.155.1635784212148;
        Mon, 01 Nov 2021 09:30:12 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a8sm202738otr.3.2021.11.01.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:30:11 -0700 (PDT)
Date:   Mon, 1 Nov 2021 09:31:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH v9 4/5] usb: dwc3: qcom: Change the IRQ flag for DP/DM hs
 phy irq
Message-ID: <YYAWfSSD7FCXPo8d@ripper>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-5-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635753224-23975-5-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 01 Nov 00:53 PDT 2021, Sandeep Maheswaram wrote:

> Change the IRQ flags for DP/DM hs phy irq to avoid interrupt
> triggering during system suspend.
> 

Why does replacing HIGH with RISING change this behavior, or do you get
a RISING interrupt just before hitting suspend which you ignore?

I think it would be nice to have the commit message for this (or per
below request the DTS change) include some details about what's really
happening on the irq line.

> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 54461f1..356f4f8 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -473,7 +473,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
>  		irq_set_status_flags(irq, IRQ_NOAUTOEN);
>  		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
>  					qcom_dwc3_resume_irq,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,

IRQF_TRIGGER_* should be omitted from the driver and supplied by the DT.

The dtbs out there should all have IRQ_TYPE_LEVEL_HIGH at this time, so
simply dropping that from this list and updating the dts would be the
right thing to do.

Regards,
Bjorn

>  					"qcom_dwc3 DP_HS", qcom);
>  		if (ret) {
>  			dev_err(qcom->dev, "dp_hs_phy_irq failed: %d\n", ret);
> @@ -488,7 +488,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
>  		irq_set_status_flags(irq, IRQ_NOAUTOEN);
>  		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
>  					qcom_dwc3_resume_irq,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>  					"qcom_dwc3 DM_HS", qcom);
>  		if (ret) {
>  			dev_err(qcom->dev, "dm_hs_phy_irq failed: %d\n", ret);
> -- 
> 2.7.4
> 
