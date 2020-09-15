Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8315D26B5BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 01:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgIOXum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 19:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727179AbgIOXui (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 19:50:38 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2225FC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 16:50:37 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id r10so1223367oor.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 16:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yD3PNQAvhqYsXvYGwPufgIeRPKx95KVHzdBqxMZvvkU=;
        b=T9TA5+kHe5OhHHt5fwsvhKkSODUtrYYDQdcYMdD0F6a4T2t5l+9qppgTljMw6gDNbh
         nKsEYMoCRKzCAeUmCxYnORgwTOv7tSsaJToG7h2cgXi2JDEsyw29UfHR7iwO4kMmgzQH
         pOvofEC7QoEWz/H5OVzKIi3dML2B9zT7Hhluru+k0uFSq4u1omhLC4h9AOQYjB+ebaGK
         yVRUSS3ALZI9UZOt5aOJQW43yQJn6xBI+K5OHwhsXhJq3DBHF3agn9rQOyJWpDEdE8kp
         p2a2s+1AkCSF1dG1zeIUFS0xKc8Kh294imLtdWrulxK7Bg6VxoxLeZA8PjFCYQAuWqR6
         G+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yD3PNQAvhqYsXvYGwPufgIeRPKx95KVHzdBqxMZvvkU=;
        b=dYnc4DyRDcbSzJbJgOLbbGZ9Xa8dFo8PC9yUa+fGrbvClbloAgoXuL0WgyqfNhl6BD
         IAh111SC8utEs28m4oA8nhgKlY3+tiN0UJgDWIgiTqsOSdBRHtjhLWLKlHkPyDXk1BiQ
         yKs28XOPdlAQmBO2b6ifPoZ17Swg34s3nFvY6nsCiCkPgnPzt6Pfpu8zGxDmGEOR+ZHz
         iAklwaXGtkAVYFpbWrBqSzAyTm5GpfYxHYfw7Um9chEvNGm0nTfI4g3t2ZQHM9xfb3S0
         Dj8wM4XutAGxI1hXzOBGzzasTK5cZK7WzSiOz7jZ0XZDW/snOHvp8XRrDNGWG5ZHXwCY
         PHDQ==
X-Gm-Message-State: AOAM533LnafyJEg0w3OSG1RksGbUCgtBpPINYexmEeDpYOwhSFxhDAiq
        k/frZJ1ze0Xs0HSTOSheiW3tie1aaJUVB7bD
X-Google-Smtp-Source: ABdhPJySpIvcTt1ZCkR+5bNG65ivOVXugvxXAqdbxq9YyRU05+7Kdbcy4fRFf1iPxa/lJaXV8Wi7vg==
X-Received: by 2002:a4a:b443:: with SMTP id h3mr15916018ooo.45.1600213837176;
        Tue, 15 Sep 2020 16:50:37 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:7cad:6eff:fec8:37e4])
        by smtp.gmail.com with ESMTPSA id k51sm1239891otc.46.2020.09.15.16.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 16:50:36 -0700 (PDT)
Date:   Tue, 15 Sep 2020 18:50:32 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Honor wakeup enabled/disabled state
Message-ID: <20200915235032.GB1893@yoga>
References: <20200915123123.1.I44954d9e1169f2cf5c44e6454d357c75ddfa99a2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915123123.1.I44954d9e1169f2cf5c44e6454d357c75ddfa99a2@changeid>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Sep 14:31 CDT 2020, Matthias Kaehlcke wrote:

> The dwc3-qcom currently enables wakeup interrupts unconditionally
> when suspending, however this should not be done when wakeup is
> disabled (e.g. through the sysfs attribute power/wakeup). Only
> enable wakeup interrupts when device_may_wakeup() returns true.
> 
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index e1e78e9824b1..56d14c09506d 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -251,8 +251,10 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  	for (i = qcom->num_clocks - 1; i >= 0; i--)
>  		clk_disable_unprepare(qcom->clks[i]);
>  
> +	if (device_may_wakeup(qcom->dev))
> +		dwc3_qcom_enable_interrupts(qcom);
> +
>  	qcom->is_suspended = true;
> -	dwc3_qcom_enable_interrupts(qcom);
>  
>  	return 0;
>  }
> @@ -265,7 +267,8 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  	if (!qcom->is_suspended)
>  		return 0;
>  
> -	dwc3_qcom_disable_interrupts(qcom);
> +	if (device_may_wakeup(qcom->dev))
> +		dwc3_qcom_disable_interrupts(qcom);
>  
>  	for (i = 0; i < qcom->num_clocks; i++) {
>  		ret = clk_prepare_enable(qcom->clks[i]);
> -- 
> 2.28.0.618.gf4bc123cb7-goog
> 
