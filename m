Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409B92EF7B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 19:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbhAHSwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 13:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728746AbhAHSwB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 13:52:01 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7846BC0612FD
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 10:51:21 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id s2so12460391oij.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 10:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yw5HNg0k9iL0QHuBnpeVEeXpmsT4zEnK0I09kWNg4VE=;
        b=spizBsCeh+YYB8W/IjGWwKrI/pXPx7LjOWGRXUcobQCpcJMuzvvYSXwo/EUa60JsKT
         xqqpQg4cjhZTH3RiJqykwYB5TPKMG3wEe0UkatR6OMwlSzLhFhWQ7C5dtU48nbJrSKuA
         i12Iez9VdRCHBrGjzjmgpQVRFfYvRqKSjMbLJJ0VzJpMcDzFPeXDsaOveDGSICugouUo
         Z+sIbi1pyYQzxa8XJBt2RvP06WF+GlIikHxSNNWOfi2IN9S8N9GIYZsKyBs/rk+OLHrS
         OWaqkXnzAY57hM6ps5KH9eaPJDojhSVPE7TJduuFCQ8KoUOUFfaqlRYYdoJZaO+x0q4B
         NzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yw5HNg0k9iL0QHuBnpeVEeXpmsT4zEnK0I09kWNg4VE=;
        b=fNhyAyD9RjZXwRCxlqg9226SuylbyhQfeo2hYbhP/CoKN3HK8/Z9s11UEV51g+dFWo
         7YmWenEGd1QskRGwZ33ojaE2VP8g1YMzusOSaUcbPZEmMQB5jeTvtvOJrqLv08LgNq8U
         uDohGHbme/4I1dcqqriE1g7DQLoy263TdaARMApn1zywob7UAdqJ686v9nMTrmQV4xL7
         AupwPXKOssFxo027NxOz3U9V7kEX53m65WdZ5hhMizJjLaJvFl+hfnhHK6sYOMe+5zzr
         ifN2qDLsl5ESw7LqFBKAK8TgizDQcUYkxsa+xafnv/cIlguxQoF9iDDb3qnz5LMrEngV
         d0DQ==
X-Gm-Message-State: AOAM533gt4pnWeLDrgKd6NgPuQPYP6FOs7bb8PCXtxP7Yn0DDyZdnxFt
        7maPzrTuIXYtgvhSm8x1n90UfQ==
X-Google-Smtp-Source: ABdhPJxR70l+gieQE6A1jIIhmWfNLp4ron556Hy+l+ahoezA8S0Np6gHH+AXBp6x7HPJr+JKligh/g==
X-Received: by 2002:aca:b657:: with SMTP id g84mr3289190oif.86.1610131880733;
        Fri, 08 Jan 2021 10:51:20 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h11sm1907017ooj.36.2021.01.08.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 10:51:19 -0800 (PST)
Date:   Fri, 8 Jan 2021 12:51:18 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 01/17] media: camss: Fix comment using wrong function
 name
Message-ID: <X/ippoemGT9d28Sd@builder.lan>
References: <20210108120429.895046-1-robert.foss@linaro.org>
 <20210108120429.895046-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108120429.895046-2-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 08 Jan 06:04 CST 2021, Robert Foss wrote:

> Function name is comment is wrong, and was changed to be
> the same as the actual function name.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index fae2b513b2f9..478be4f0cab5 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1077,7 +1077,7 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
>  }
>  
>  /*
> - * vfe_isr_wm_done - Process composite image done interrupt
> + * vfe_isr_comp_done - Process composite image done interrupt

It's a function, so it should be "vfe_isr_comp_done()", but unless the
comment is denoted kerneldoc by starting with '/' followed by two '*' it
"doesn't matter".

As a matter of fact, none of the kerneldoc in this file has the proper
'/**' start, so this file is "undocumented".

So please add another '*' and some () throughout the file.

Regards,
Bjorn

>   * @vfe: VFE Device
>   * @comp: Composite image id
>   */
> -- 
> 2.27.0
> 
