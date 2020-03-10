Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F71D180850
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 20:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbgCJTmP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 15:42:15 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43520 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbgCJTmP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 15:42:15 -0400
Received: by mail-pg1-f194.google.com with SMTP id u12so6764045pgb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 12:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Faw5f/0aAQ+aqO9SA24AijmLN0TGCfoZ4YURng0DYsw=;
        b=Hc+hOxaBvQ8jM8uWbzOGfnSGqWbhUdERsDAB13gVJqxTWu488Ku3NDjA5pPH88fBGT
         eyFk+6hMHP/sO6VSrghtF/r0oPccgxo2GbaiMj4kvrV4k5hdGWReGU4MuODDEaDh2d7Q
         x9f8o2MMMDiHRrZXI2+pxrlmHcVuwY44BFzYyDuvJhPzszY444NMr0ghGVC6JrY3EXYJ
         wp3eampknmG85TPEWD85kcdHD7RlE85QmV6SoYV2X00UxYgXbhlas264cJGRBt5jZ9eC
         bgxaY+o4zVQeCiIQH9NHnljKdv7SgsJdIu/smHHcxNPN6+7qyNz91c5S8iqh9ML5tfOe
         xwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Faw5f/0aAQ+aqO9SA24AijmLN0TGCfoZ4YURng0DYsw=;
        b=FnObhdbtbJh9edWMieyhCB29CGcCH+vxhuU2v/AvFttnEd1GyL+DZ8fIZQDGHJWgZL
         hcPHf020d5qqbryuiD/ODUQlGWFbtQyHaIhn0FHBAdYCqXKCDSyLnFt4Bw6VjOlbK9d9
         3iuT/n02BQvvjix4sLLWSh6KHSbsVOqu3J54i8OMI/X7YVKs5Dh/HRzGqj9mFahZIb/h
         Fcf4MXGCVrKss/li2sEkg1D5oed2i5ZQKu1cFPVg9p/GWDOfu7pRuuMIXS0yoXk/p69z
         JZND80G7XFtcqYuGl5k62mpw9wcpHJzbycWsik0dhsb2mSUdSxYQx1Qi91WbqytYzvtF
         MLeA==
X-Gm-Message-State: ANhLgQ3g/pdKLWDN9LelcAxSLWaGr1i+T2SbRXSlbc7ca8YQX0b9ycS4
        /f2QZN3OFHBLIOWmRRaSCwkoLA==
X-Google-Smtp-Source: ADFU+vu1vysA8mw9UMy4v+FDwYPHMpR4+M/J15qbU9YwPpA/7zMSrgTLM7z/G9PePiRee813KT+2Pw==
X-Received: by 2002:a63:6944:: with SMTP id e65mr23573008pgc.406.1583869334246;
        Tue, 10 Mar 2020 12:42:14 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k5sm3024829pju.29.2020.03.10.12.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 12:42:13 -0700 (PDT)
Date:   Tue, 10 Mar 2020 12:42:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 3/3] i2c: qcom-geni: Drop of_platform.h include
Message-ID: <20200310194211.GO264362@yoga>
References: <20200310154358.39367-1-swboyd@chromium.org>
 <20200310154358.39367-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310154358.39367-4-swboyd@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Mar 08:43 PDT 2020, Stephen Boyd wrote:

> This driver doesn't call any DT platform functions like of_platform_*().
> Remove the include as it isn't used.
> 
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 2f5fb2e83f95..18d1e4fd4cf3 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -10,7 +10,6 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/qcom-geni-se.h>
> -- 
> Sent by a computer, using git, on the internet
> 
