Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63F42AE3E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 00:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731854AbgKJXLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 18:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730254AbgKJXLF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 18:11:05 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F12C0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 15:11:05 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id j7so16429066oie.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 15:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3AJDlksROJcwvHXdH093qK02oZEJS82ZIyxFg53YWfY=;
        b=JvplCnGpk0cMioznyOdsjVtsG1V1j6oFb10YxRCz7OKMq8vFyzmyk4ry0J87GZoedJ
         Lr1Pw0qH6u4wU9AMqeZxFdEDzc59pb55UTU2tZoFCxIrYsZLgTj9gcTN4/tVUgYHqtSH
         BrIBIDvDT3idbi7NV5G6alhkrH0rZOwHMxTidNX0mSOD+Gdy0WbX1zNAo71jeANsrXx3
         msVtXkYe74ShtwclFzoEtiFIOiL1Fddqm5UcfcCJGNAMkq2W+8GPpWttIJ3/HtHxCMj+
         B1f4Y26/bkmKoyJnQQ24IYJs9L1gP0artIcJ8azwChW7e/iICYR9rlDbLrB3L/7pt4VY
         1dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3AJDlksROJcwvHXdH093qK02oZEJS82ZIyxFg53YWfY=;
        b=YC142JrUWOuc0dc+LS2P04V/igPv/FDERAs1EhwwXrY07qsEkE1WyA+H+Tz2OkggiX
         CkwQx5TlnEhP2jO+5Wlg18tiUPO9h8Dja3JnPb1UaK4d98dvT/Zauu/K37uqd2Mxp/d1
         IiTLOBRueoip/cOQMXCeWC020IIM03cphqvr9AVFq152Pfb2YMxuC4ZBDPttdsjRrGyg
         FUDa4QZe4ETDiBbpLUkXme+At6rF1VpNK2dBtj5XhI32zup1TshHosR7Xox8YQyumQkE
         3XawS83Cl5lpoU1D1oQF3tUaXNLaPyzuSrWkvOa5kilbQoFdzmmzy0mV/6El44tTvN8i
         RFNQ==
X-Gm-Message-State: AOAM5324JMK6yq6dsjJgHUD3X578Ckcr+qqVGntidMthyHsac3GWhClM
        f+tRNWkzn1FOKokZ1k/v4L1ZSg==
X-Google-Smtp-Source: ABdhPJz6QVmkq40UD6CaQxBmJL78mWRpp4m465RT2YpaJfAhRJYbHQgCeBroTOstzyMZsCtqk+yNkA==
X-Received: by 2002:aca:750d:: with SMTP id q13mr303305oic.77.1605049864458;
        Tue, 10 Nov 2020 15:11:04 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s20sm104659oof.39.2020.11.10.15.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 15:11:03 -0800 (PST)
Date:   Tue, 10 Nov 2020 17:11:01 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Vladimir Lypak <junak.pub@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: Fix msm8953 Kconfig entry to depend
 on, not select PINCTRL_MSM
Message-ID: <20201110231101.GG807@yoga>
References: <20201110215619.86076-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110215619.86076-1-john.stultz@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Nov 15:56 CST 2020, John Stultz wrote:

> One fixup following my patch commit be117ca32261 ("pinctrl:
> qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then
> a selected config") being queued in LinusW's tree, as a new
> config entry was added for the msm8953 that also needs the
> change.
> 
> Applies to LinusW's pinctrl devel tree.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Prasad Sodagudi <psodagud@codeaurora.org>
> Cc: Vladimir Lypak <junak.pub@gmail.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> Change-Id: I9e8e83b1ea57aff338074be9174fce53cef29eff

Linus, please drop the change-id as you apply this.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> v2:
> * Fix flipped numbers in the soc name, pointed out by
>   Jeffrey Hugo
> ---
>  drivers/pinctrl/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 8bdf878fe970c..cf56e029cd9c7 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -115,7 +115,7 @@ config PINCTRL_MSM8916
>  config PINCTRL_MSM8953
>  	tristate "Qualcomm 8953 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
> -- 
> 2.17.1
> 
