Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C076D16672E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 20:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgBTTbH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 14:31:07 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33652 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbgBTTbH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 14:31:07 -0500
Received: by mail-pj1-f65.google.com with SMTP id m7so1429220pjs.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 11:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sXrvFoJPqvg02BUxIE3UTho5sV5nybX8qyPHpbQqr8E=;
        b=Z70rwuoFsDifWDdSPas8zJnF+Mg+i8+o1G2DC8mif0hkptJNC5ARTCELec1tul0u6Y
         yW3yPrYySlq+1gxFpLFMrXTbm/A3s0PUqIIgeJz2ykBzrTW8epYftwgCqTttoU8OK9rU
         hSdVAXqZQYqWTG83XN557bG6e1C0aHluhJeeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sXrvFoJPqvg02BUxIE3UTho5sV5nybX8qyPHpbQqr8E=;
        b=fQ9QdT71qV8N8AjcxetPh1YmTyjcxE4+zgjyiqSUsA67QjNX1IjnUPU7e8eORu8RBl
         rA1B0G/l93jW5Xjv2xs1JpiBlNLwmhtJLIP4XNgjlFNEDF+dnZ0ucmHEuRh1h3miSfb3
         W4dHb6ixk0+U0bCe4JBmGwIiszMbc30m69MV0NNdYx+sUmSsyPuxLzausJ2ZhcFrQ/Uh
         /1g9pf94xDp9Cy8QacKkd5o1y3loiFznihPIWAln8PjHIbEj+LWLnDRkT51s4miq1dO3
         FD296R+n3Ho8N/FjBIE3xkHPbqX1AK/Gn0i9knixlqcR1eFUtGxnnsQhabtDdkxYo6R6
         aZtw==
X-Gm-Message-State: APjAAAVORJhYMS9kZ5VsPqrpGBHG4f2TpZy2qLq4/jGzxF3thCIAm1mu
        T7s2m3nAkGbDa2ji/A7nx4wFVg==
X-Google-Smtp-Source: APXvYqz9mp7EYWo84cTExZVyCFz4HlzngV4TM7788p/mvz2FPEMPzJOeDtaA6kvPL6z9ON/ddq4yjw==
X-Received: by 2002:a17:90a:ac0e:: with SMTP id o14mr5557795pjq.11.1582227066988;
        Thu, 20 Feb 2020 11:31:06 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 199sm376209pfu.71.2020.02.20.11.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2020 11:31:06 -0800 (PST)
Date:   Thu, 20 Feb 2020 11:31:05 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org
Subject: Re: [PATCH v5 1/7] drivers: qcom: rpmh: fix macro to accept NULL
 argument
Message-ID: <20200220193105.GB24720@google.com>
References: <1582108810-21263-1-git-send-email-mkshah@codeaurora.org>
 <1582108810-21263-2-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1582108810-21263-2-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Maulik,

this patch and '[v5,2/7] drivers: qcom: rpmh: remove rpmh_flush
export' already landed in the QCOM tree (in the branch 'drivers-for-5.7'):

d5e205079c34a drivers: qcom: rpmh: remove rpmh_flush export
aff9cc0847a58 drivers: qcom: rpmh: fix macro to accept NULL argument

Please rebase your working tree and stop sending these.

Thanks

Matthias

On Wed, Feb 19, 2020 at 04:10:04PM +0530, Maulik Shah wrote:
> Device argument matches with dev variable declared in RPMH message.
> Compiler reports error when the argument is NULL since the argument
> matches the name of the property. Rename dev argument to device to
> fix this.
> 
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/rpmh.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 035091f..3a4579d 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -23,7 +23,7 @@
>  
>  #define RPMH_TIMEOUT_MS			msecs_to_jiffies(10000)
>  
> -#define DEFINE_RPMH_MSG_ONSTACK(dev, s, q, name)	\
> +#define DEFINE_RPMH_MSG_ONSTACK(device, s, q, name)	\
>  	struct rpmh_request name = {			\
>  		.msg = {				\
>  			.state = s,			\
> @@ -33,7 +33,7 @@
>  		},					\
>  		.cmd = { { 0 } },			\
>  		.completion = q,			\
> -		.dev = dev,				\
> +		.dev = device,				\
>  		.needs_free = false,				\
>  	}
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
