Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829D821A5C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 19:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgGIR0j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 13:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbgGIR0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 13:26:38 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2BEC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 10:26:38 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id b9so1103456plx.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 10:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fAVMof5nNwaeOe0UjH7aEaTqC0vuF4D1qFzyqvlHDMA=;
        b=YMK7N//u1wp3f+ymy0j9gl/3flzcYQz53aZpmqO7VGDdmq6ht7XX5idCJyJybOzq2X
         wdUIBwZUGuUmjCB5FN1/G9/P50YCCgGRi5GVPPimM6uooU4F3iaqi8cS2khxAyJi4hBe
         +WSLxitMer7bbujtrum3loVKkZbxzWSA+DVy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fAVMof5nNwaeOe0UjH7aEaTqC0vuF4D1qFzyqvlHDMA=;
        b=XRjVQe+4xzWHtt5Hwa8ZsSAr5+jmASJ4HES73YQ9nqTTqXeYzy5/4uTRop4m9cTM/Y
         1gzV7fg4oCMOLzbuwfkoLMeyPoeWKQuIXARWyOwWxZYEBksZgrzAwb+4+I4DafGPOou5
         NrqxzZzxh9InmNAehpWdfO3SWYCbpRWWpdLtvpVuqjlXQDLHm7d8m1KO21Q4F+UrVcP8
         QgppcbpW0n/X7GBJl1qdDEHnEhs01sFHQBDSOA5L9y6xC7RKW+ET/WyPsKAxNRJat5ih
         1kq7MYG5TJaKvVT9+AuSCtUIorxdIQGKtP0U8MxWLCQeMPpbpHMYgaXwjyTeS1VLbqUW
         lK7Q==
X-Gm-Message-State: AOAM531jO67Wa7IxoSfrVjYKxNjQ86eQEAU5sCL5UxFMzT8Rw3KToo7Y
        MtRCwBHOaNXNgTqWJsxQJUdsgA==
X-Google-Smtp-Source: ABdhPJwzBJkpMTYA6AAa9Z1wDaiyNvhZ2Z/dNzuJcOR6hBmjNBylvIiW3pKrued1/Rg34jcKcwbpTA==
X-Received: by 2002:a17:90a:bb84:: with SMTP id v4mr1232421pjr.162.1594315598390;
        Thu, 09 Jul 2020 10:26:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id o17sm3096883pjq.6.2020.07.09.10.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 10:26:37 -0700 (PDT)
Date:   Thu, 9 Jul 2020 10:26:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v8 1/2] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200709172636.GL3191083@google.com>
References: <1594310413-14577-1-git-send-email-sanm@codeaurora.org>
 <1594310413-14577-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1594310413-14577-2-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

inline one more thing I forgot to comment on in my previous mail

On Thu, Jul 09, 2020 at 09:30:11PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB master to
> DDR slave. The other is from APPS master to USB slave.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 127 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 125 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1dfd024..5532988 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>
> ...
>
> @@ -648,6 +763,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto depopulate;
>  	}
>  
> +	qcom->max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);

What if the function returns USB_SPEED_UNKNOWN?

You need a reasonable default value for that case, which I think would be
USB_SPEED_SUPER (i.e. the controller would work properly at super speed,
though the interconnects would consume a bit more power than necessary lower
speed modes).
