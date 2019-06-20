Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636A94D4A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 19:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfFTRN4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 13:13:56 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41728 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfFTRN4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 13:13:56 -0400
Received: by mail-pg1-f195.google.com with SMTP id y72so1905696pgd.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2019 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SxlO+FSAxDd632DpLfLCq/OUwvg6eaO8V3k3L6zEVyA=;
        b=AV7X7aYgHwBXxgw3zTNxXUoIkYIRKYXuB2SNjcPxrI5cN6QdU5ft8aLqv61MezByn9
         Skir3SYjIi4thmMA+ZaNtCXTpB8zIoHuAXP4x2Li0v0AHE1EAGklVzNFRfD5w0XcO8aw
         NAKrZuz9PjK0bDHSL8idlm6Du30lv3oB9bEmJfs0W0uQ4mHTLhmd1jvwKR4nzmmXhZUZ
         kMNjCskDOQAjK0P1EXeh8f4R5TVcklnmEUbjaNEPz1n8b676CIOwjjrOSGQFBJY1O2Ql
         SU+T+HCUc9gWfrwSXFLpSwyv9XBkGr0MnctGYDbFP4ZydiyRA9B0Eq1gFCoVNhtnBbSD
         xC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SxlO+FSAxDd632DpLfLCq/OUwvg6eaO8V3k3L6zEVyA=;
        b=q3XRRN7I9t3bWi9JPHup3hf6e8RRbav0PytqEkqX8SZooy/lJJLYf0NXEyzym2kKzx
         ax8FqTo8lNuwuyfrclD1QS66YHix/O5vT4lmDGatjtvmE+Gmgexo2cfhWyP2p29vDXjY
         ls36W63ikEByCJmVkZge9OJiS+L+F49i2Sqlgb55UXXwFoWR39VbOgYG6OOn6ZAaQTYE
         npy5cbSwRh8EBAWYrKC+kI8pVG33rXHQN1TAVnP9vg5a35OQCyiRqVnQ6NxGTZoq2Fww
         kjSVnPtglGJjui4Z8t58+XMQ2Q4BJa0YZjGWp5h7rW7wsAbWuDUXrIiwvvxmeMHS3pt+
         hOCA==
X-Gm-Message-State: APjAAAVGJvarlupHCfo+t1wmYkbOn+kRB/nCF2utXD/5JPXuny3gGOAm
        hH6Owf8J+15VYOhdyg0RaLeSTg==
X-Google-Smtp-Source: APXvYqyWa7oDW4n/vwBZPT9s8zK5XpweT+4yAE05XynKgxzqLcEa8yJCFOcFKJcqjzbZfWH02mCGRQ==
X-Received: by 2002:a63:fa0d:: with SMTP id y13mr13773253pgh.258.1561050835591;
        Thu, 20 Jun 2019 10:13:55 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s129sm32753pfb.186.2019.06.20.10.13.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 10:13:54 -0700 (PDT)
Date:   Thu, 20 Jun 2019 10:13:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom_spmi: Do NULL check for lvs
Message-ID: <20190620171352.GA19899@builder>
References: <20190620142228.11773-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620142228.11773-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 20 Jun 07:22 PDT 2019, Jeffrey Hugo wrote:

> Low-voltage switches (lvs) don't have set_points since the voltage ranges
> of the output are really controlled by the inputs.  This is a problem for
> the newly added linear range support in the probe(), as that will cause
> a null pointer dereference error on older platforms like msm8974 which
> happen to need to control some of the implemented lvs.
> 
> Fix this by adding the appropriate null check.
> 

Thanks Jeff, this resolves the regression I've seen the last couple of
days on linux-next.

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Fixes: 86f4ff7a0c0c ("regulator: qcom_spmi: enable linear range info")
> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index 877df33e0246..7f51c5fc8194 100644
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -2045,7 +2045,7 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
>  			}
>  		}
>  
> -		if (vreg->set_points->count == 1) {
> +		if (vreg->set_points && vreg->set_points->count == 1) {
>  			/* since there is only one range */
>  			range = vreg->set_points->range;
>  			vreg->desc.uV_step = range->step_uV;
> -- 
> 2.17.1
> 
