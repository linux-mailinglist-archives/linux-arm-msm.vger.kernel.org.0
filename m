Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813C3441EB7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 17:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhKAQn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 12:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbhKAQnV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 12:43:21 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC20C0432E9
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 09:37:35 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id x16-20020a9d7050000000b00553d5d169f7so24405533otj.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 09:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vx/j/qFiyXYawaEzOVh4pi7vxeVBLCfoDpKoWb5FGGM=;
        b=C4r7fAKQa99niM5nBnPYlOeooBaJEHwpy5oTOiYI2nmSDAzhU5smPYAp/aw2CCFCFF
         b/Ko9Gq8gfdYUAB7QJiVCHrqa8dady++MKqu5DEWAa7a0OZagGA2mg1OOaKbRxU/TcjN
         h+e3m1T4LV1Mah1mKHeeMAx8p8t9NZBI/xRI6PHmr7mWFTAEN/ZTv5qjZlDBDps6jqjR
         jBKFyDu6H4kNsMVYaeLSJY/h3+4W1x03Uw/3eYdVZ3LyzTqdN7cadMLhtpab7bzZIeVX
         hK7f0MEt8USbQDAU369cycSRYsZ7ymaVwv91N4rPGIkTyDpwRB7zZ0+kWIlcuDp6r3yY
         3KIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vx/j/qFiyXYawaEzOVh4pi7vxeVBLCfoDpKoWb5FGGM=;
        b=rdoMEkaLK9f2PxwnPX0Hc1EdHl3ezJoCMS3TSZzEPj3CMU+srygpfdAElFpxbPYMyi
         QEMJfQ9EgI++hDvxzZKgaM6A/SdHMIHpkRzjeifhh7tg9WFjUmvtkZqN8XYACu9uu2bS
         NugQN+dfEJqlA91ZED7RL0HHiLPzpGMAQjovYa6O+L1NPQdJMMkQVNY3ZFmzS/ILnIh1
         nMp5gQ065utjrL+AMFSAoh+4DpKacBYCgis1S4roIfqYW4HBeNuYCN+p7iVmIZO+cHOu
         pxtJkKlDBWPdGwwSfUTgweeCVVkxvrzfqqgO9T4j+57b1g96eWdiQRsJU6YvOSvAjMCY
         itAg==
X-Gm-Message-State: AOAM532a1+S0FK2DlvdJmL9XOs9+MiMN3C6tGZpFvwbStm4kkZGTXn+/
        wlAMdd8aciRBP3xFro8nPNZJgg==
X-Google-Smtp-Source: ABdhPJwAPtg+wHM63TAcKkKcDm8HD2cFnK6/dZq1PqtPf3TVi7UeoyyzgXgKJSmyQTPWIK/o7bUimw==
X-Received: by 2002:a9d:6d12:: with SMTP id o18mr15617446otp.71.1635784654611;
        Mon, 01 Nov 2021 09:37:34 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q5sm4219363otc.79.2021.11.01.09.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:37:34 -0700 (PDT)
Date:   Mon, 1 Nov 2021 09:39:17 -0700
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
Subject: Re: [PATCH v9 3/5] usb: dwc3: qcom: Add helper functions to
 enable,disable wake irqs
Message-ID: <YYAYNWCpzCbYe82i@ripper>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-4-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635753224-23975-4-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 01 Nov 00:53 PDT 2021, Sandeep Maheswaram wrote:

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

Now that you touch this code path.

I presume keeping these interrupts enabled during runtime would cause
the interrupt to fire during normal operation, but why do we need to
toggle the irq_wake? Can't we just leave that flag set always?

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

Why don't we just replace *_phy_irq with an array and turn these two
function into two loops? That seems to be quite suitable for the
multi-port dwc found in e.g. sc8180x as well...

Regards,
Bjorn

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
