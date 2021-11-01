Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39C5441DE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 17:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhKAQVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 12:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhKAQVP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 12:21:15 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81C2C061714
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 09:18:41 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id b13so470842plg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 09:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FkSLo7/nLuX9vGLBuK+2Qxxtd4wCxY/rrpVx5UTUisM=;
        b=YnpS5SnPfMBjTU8exbYaIIGJ2LvCp/BePtdltiUqW5mZbaF+Kj0YmWtuKRQLbtpuQs
         eAI6QYpKg+g6SWKkSbWTMG+kOPpFfwok/O+NE5MQc7sGLQGVZQ+kD4+TxKyO6x0OswLA
         YTIc+j2tRt1dBLrIq5GeraHhnGWlWOAbepP9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FkSLo7/nLuX9vGLBuK+2Qxxtd4wCxY/rrpVx5UTUisM=;
        b=bjyuwEbwIOW81efy4Idb2fD3kC5C4r+cwN6mtc2T3gSjKSSBUpeUoAlc213ULrpufO
         vc0nIFsodqRBjnDh+baLSgLIyD4KGeH2A6GHfPsQBovaw8hYGRtceCwsXfanHhLYHRAU
         zzCxRHtQ3Y7dR90TWR5TJHig2Ne1wiqiRdUrl+upuQh/+YEo/Ve/P/QMj1rNDmuIWGSP
         lo3ewwKDQxRGvCOs+8BQcqdxF3EMYv/+YimN7J1WC7aY+YzLZh1j4r5AviuzYXG9wCP0
         aSns2svffzvIgHukP2jm3z4OForN8cs9QNBYHO2xrmRPqP1csKyi3GitixDBbMWeryHz
         MMiw==
X-Gm-Message-State: AOAM5313h/1CwWz2/GrC+XRWjFEAUCcGgOZyWnEPM60L11C2+2slyy0K
        29+yeFvsSjL+eRH0W4kxzsljlw==
X-Google-Smtp-Source: ABdhPJyYBPl6WJmzJIAfGt/xn307GsH9xHN1OpsNCQcdYO4FGvbbrcrYA2/Si1vaCDwW2oh757iheA==
X-Received: by 2002:a17:90a:e005:: with SMTP id u5mr15241794pjy.17.1635783521411;
        Mon, 01 Nov 2021 09:18:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6278:520b:a2e1:4ece])
        by smtp.gmail.com with UTF8SMTPSA id f10sm16084035pfe.82.2021.11.01.09.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 09:18:41 -0700 (PDT)
Date:   Mon, 1 Nov 2021 09:18:38 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH v9 3/5] usb: dwc3: qcom: Add helper functions to
 enable,disable wake irqs
Message-ID: <YYATXj7IiQ61lEHJ@google.com>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-4-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1635753224-23975-4-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Felipe,

This patch is (supposedly) an improvement regardless of whether the rest of
the series lands or not. It hasn't changed in the last iterations nor did
it receive any comments. Can this be landed rather than carrying it around
until the rest of the series is ready?

Thanks

Matthias

On Mon, Nov 01, 2021 at 01:23:42PM +0530, Sandeep Maheswaram wrote:
> Adding helper functions to enable,disable wake irqs to make
> the code simple and readable.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 58 ++++++++++++++++++++------------------------
>  1 file changed, 26 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 9abbd01..54461f1 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -296,50 +296,44 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
>  	icc_put(qcom->icc_path_apps);
>  }
>  
> +static void dwc3_qcom_enable_wakeup_irq(int irq)
> +{
> +	if (!irq)
> +		return;
> +
> +	enable_irq(irq);
> +	enable_irq_wake(irq);
> +}
> +
> +static void dwc3_qcom_disable_wakeup_irq(int irq)
> +{
> +	if (!irq)
> +		return;
> +
> +	disable_irq_wake(irq);
> +	disable_irq_nosync(irq);
> +}
> +
>  static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
> -	if (qcom->hs_phy_irq) {
> -		disable_irq_wake(qcom->hs_phy_irq);
> -		disable_irq_nosync(qcom->hs_phy_irq);
> -	}
> +	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
>  
> -	if (qcom->dp_hs_phy_irq) {
> -		disable_irq_wake(qcom->dp_hs_phy_irq);
> -		disable_irq_nosync(qcom->dp_hs_phy_irq);
> -	}
> +	dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
>  
> -	if (qcom->dm_hs_phy_irq) {
> -		disable_irq_wake(qcom->dm_hs_phy_irq);
> -		disable_irq_nosync(qcom->dm_hs_phy_irq);
> -	}
> +	dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
>  
> -	if (qcom->ss_phy_irq) {
> -		disable_irq_wake(qcom->ss_phy_irq);
> -		disable_irq_nosync(qcom->ss_phy_irq);
> -	}
> +	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq);
>  }
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
> -	if (qcom->hs_phy_irq) {
> -		enable_irq(qcom->hs_phy_irq);
> -		enable_irq_wake(qcom->hs_phy_irq);
> -	}
> +	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
>  
> -	if (qcom->dp_hs_phy_irq) {
> -		enable_irq(qcom->dp_hs_phy_irq);
> -		enable_irq_wake(qcom->dp_hs_phy_irq);
> -	}
> +	dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
>  
> -	if (qcom->dm_hs_phy_irq) {
> -		enable_irq(qcom->dm_hs_phy_irq);
> -		enable_irq_wake(qcom->dm_hs_phy_irq);
> -	}
> +	dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
>  
> -	if (qcom->ss_phy_irq) {
> -		enable_irq(qcom->ss_phy_irq);
> -		enable_irq_wake(qcom->ss_phy_irq);
> -	}
> +	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq);
>  }
>  
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
> -- 
> 2.7.4
> 
