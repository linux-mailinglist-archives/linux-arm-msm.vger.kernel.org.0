Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 967383962B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 21:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730946AbfFGTvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 15:51:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35311 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729715AbfFGTvb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 15:51:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id d126so1771162pfd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 12:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TVEMd3bZMyQ4yhDeztJRuk2J4p8KHFonqrl5D0eVVJM=;
        b=kx9ozOj9l8ViTxZ+S+v6BNTF3b8JJmWack9Y+41MjJrmzya6N6cjc44kWOFe4EWw0z
         xyOJvT3euw+oQ+2HGZVtHAKbfivt4twyEWb0jV2QJeBRxmuYhvy03PURjx06hj+c6li/
         zi0AVVWJ5RPrr7aueKO4i6DfodHwj3/9HxZwvUyP5sSvLjG5dLTG1WDV0msp4TMpbSoB
         /AsjeYMzfTFADZSMMSlqPgxuKrcyRZQeObboGFba0deMFwtAv+6HVKc7FAkzo5LR0jKT
         x9wOwne18xSxPqjhFpeyvEJ2Pt5iwvRAB3wUxcDTNqqaOFSOLbKaHEb64k4TO9VtWx0P
         L3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TVEMd3bZMyQ4yhDeztJRuk2J4p8KHFonqrl5D0eVVJM=;
        b=bazuByjFG5MsrPXi/AxU6c7TXI76OoAdBjWOe+WBleWzq1UVhlVXQTjuXxlxI9hcG3
         oJNyMvyfZYOpbmqJzq90uUhrzylZJ+U3A7lptnfoo6o/egtyFI0X9G3CXanb08KsbfkY
         oYbJVx9/IDxzJw1R3/V+aYIY8BGRMDlBv619RBiPlqmNKNUsP3HHrJyn3ARmVexcVWuI
         tS7msuZ6EZU/QDrXCvHpflTHoxiiuBtwEG4LA4Izol5C9/AmvBK8VKcCp1HBtJSQw1/H
         t6GkgzB5HQMktq49/5+EkByGPGs4rJawWiCzwS7SfB0hEGBzRnthD1bzcj/UzQRIYBg6
         jQBg==
X-Gm-Message-State: APjAAAWKdA2RR5S4+bbRWXBvU8FOD2vzRo2TqootZ5hG4L7aTLcVigzV
        SEUtllbvDwgNV2MTS1OR0uOPsQ==
X-Google-Smtp-Source: APXvYqyW4EyjvINpT2OoNEqPgYxjlSm86KmXR2ap3vxcbxT+eDnPSbJRLJ+F1axxyMSBoVdW2eo/7Q==
X-Received: by 2002:a62:e710:: with SMTP id s16mr26263188pfh.183.1559937090852;
        Fri, 07 Jun 2019 12:51:30 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q3sm2662628pgv.21.2019.06.07.12.51.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 12:51:30 -0700 (PDT)
Date:   Fri, 7 Jun 2019 12:52:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Change QCOM repo location
Message-ID: <20190607195216.GY22737@tuxbook-pro>
References: <1559936691-15759-1-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559936691-15759-1-git-send-email-agross@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 07 Jun 12:44 PDT 2019, Andy Gross wrote:

> This patch updates the Qualcomm SoC repo to a new location.
> 
> Signed-off-by: Andy Gross <agross@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5cfbea4..de1e935 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2079,7 +2079,7 @@ F:	drivers/tty/serial/msm_serial.c
>  F:	drivers/usb/dwc3/dwc3-qcom.c
>  F:	include/dt-bindings/*/qcom*
>  F:	include/linux/*/qcom*
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
>  
>  ARM/RADISYS ENP2611 MACHINE SUPPORT
>  M:	Lennert Buytenhek <kernel@wantstofly.org>
> -- 
> 2.7.4
> 
