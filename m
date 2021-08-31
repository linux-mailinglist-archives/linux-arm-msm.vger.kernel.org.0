Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFD13FC232
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 07:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235937AbhHaFhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 01:37:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:45682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234934AbhHaFhT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 01:37:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D90B260C3E;
        Tue, 31 Aug 2021 05:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630388184;
        bh=udHiZDDc4f7qKURsjQeNCeCgOm8GE63sa7rzPWsHY9A=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=r8LXwCv2S7RMDwBylPK4SF9vva9SeETYJuCkWO1dmBxnAt7Dy2MPIEeKkxjNJKVop
         WgUrHR0TQZUOaCSrmisH6FkKUma+UjlJmVBH5D6wIEjzAYcai1J/OFQOe35CCThlDj
         sVZxDFDfGx07IitikNvFrGDRaQj+3R9skQPOKKiLrgoiLXStIUVRZlk8bRtrMk8UbA
         gVA6E9HTCFshrdr/K0NT0z85IbMDb6LWr+tSiWjTiUmZPVnftk6+XWxohYCYXfHWja
         nxeVfNW3EpRkm5WLc3VEEhWfJ++mAROi541EK76LkFDg3la5QMTVSE0gbt4fUHyS6j
         bCArj4iHtk07A==
References: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
 <1630346073-7099-3-git-send-email-sanm@codeaurora.org>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
Subject: Re: [PATCH 2/3] usb: dwc3: qcom: Add multi-pd support
Date:   Tue, 31 Aug 2021 08:34:56 +0300
In-reply-to: <1630346073-7099-3-git-send-email-sanm@codeaurora.org>
Message-ID: <87r1each0s.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Sandeep Maheswaram <sanm@codeaurora.org> writes:
> Add multi pd support to set performance state for cx domain
> to maintain minimum corner voltage for USB clocks.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 49 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 9abbd01..777a647 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -17,6 +17,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> +#include <linux/pm_domain.h>
>  #include <linux/usb/of.h>
>  #include <linux/reset.h>
>  #include <linux/iopoll.h>
> @@ -89,6 +90,10 @@ struct dwc3_qcom {
>  	bool			pm_suspended;
>  	struct icc_path		*icc_path_ddr;
>  	struct icc_path		*icc_path_apps;
> +	/* power domain for cx */
> +	struct device		*pd_cx;
> +	/* power domain for usb gdsc */
> +	struct device		*pd_usb_gdsc;
>  };
>  
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
> @@ -521,6 +526,46 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int dwc3_qcom_attach_pd(struct device *dev)
> +{
> +	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
> +	struct device_link *link;
> +
> +	/* Do nothing when in a single power domain */
> +	if (dev->pm_domain)
> +		return 0;
> +
> +	qcom->pd_cx = dev_pm_domain_attach_by_name(dev, "cx");
> +	if (IS_ERR(qcom->pd_cx))
> +		return PTR_ERR(qcom->pd_cx);
> +	/* Do nothing when power domain missing */
> +	if (!qcom->pd_cx)
> +		return 0;
> +	link = device_link_add(dev, qcom->pd_cx,
> +			DL_FLAG_STATELESS |
> +			DL_FLAG_PM_RUNTIME |
> +			DL_FLAG_RPM_ACTIVE);
> +	if (!link) {
> +		dev_err(dev, "Failed to add device_link to cx pd.\n");

do you need to call dev_pm_domain_dettach() here?

> +		return -EINVAL;
> +	}
> +
> +	qcom->pd_usb_gdsc = dev_pm_domain_attach_by_name(dev, "usb_gdsc");
> +	if (IS_ERR(qcom->pd_usb_gdsc))

do you need to call dev_pm_domain_dettach() here?

> +		return PTR_ERR(qcom->pd_usb_gdsc);
> +
> +	link = device_link_add(dev, qcom->pd_usb_gdsc,
> +			DL_FLAG_STATELESS |
> +			DL_FLAG_PM_RUNTIME |
> +			DL_FLAG_RPM_ACTIVE);
> +	if (!link) {
> +		dev_err(dev, "Failed to add device_link to usb gdsc pd.\n");

do you need to call dev_pm_domain_dettach() here?

-- 
balbi
