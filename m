Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9E012B217
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfL0Gpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:45:33 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38841 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfL0Gpd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:45:33 -0500
Received: by mail-pg1-f195.google.com with SMTP id a33so14007219pgm.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 22:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EHKb09Bo9NXc4wn1DU4ET23g1zwKMM6aXZNkrin1Vps=;
        b=rEId7gc7xFknZfu0tumeoPE9xebk9BfNc5+7s5Fwxy6lmocTkh9AsxrBGS4T+br6MI
         TIGk9MgXNerEAtfL0Si9o9qafIlyB2O948GgM1kIjV2A+Im7f/2tpWAXNMpU8+jrlSsM
         wH4NL/LdtrQO/8p6ZNBilgxeAW/fWmnv/+4tdEbVG+ZxS39JKWNLcOa30QNs1dXk9Zy5
         etRrFMju3zZfE6yj21siIJAqTzkr8U/60Eh1Z+RcgR2RgwkSDv0GCYUcstIhFAWvEWZq
         edEbmwrRaqaQA2kLZOud+6o3Yh9Ryi//5s+Kyynov29pL2tJj47Irzje3cLWv+J0tbSi
         3TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EHKb09Bo9NXc4wn1DU4ET23g1zwKMM6aXZNkrin1Vps=;
        b=N6W1gvMug684GtRVx0bZJP7PCgT9NR00Bz/10zgMRIe0RlZM0lVEspwsCO9hLheWKl
         ReBcjdlvdEN+k2XT9CUpW5U1H3wbffTW24kggGbmfSh2kYr65BW+0A4yyw0e5FUsFdVr
         CsGQnsXxPd9Hk6+q2U8ysruEI+nW3nkAX0DKD2XkwSjwUxIrv/0L6STsroBCcLh76woA
         Eja1Ti/+5z3HFib3tMq4A065FjN5xted4cRJ8N0Y/bJyTNGQ82Li1VtF7Ko9npN+j2mf
         6O1bkvDhL7VfO0CAY+0tYmF20ejSWeGtElJ2tgzikOEPBBryl5rG4g0k85BVVuHFQZs0
         xJ/w==
X-Gm-Message-State: APjAAAVDjsSeuu87uj/b67USb4tYcpZxWRRRR/3OBqHQrVGcedMPIUGD
        cAUfhIupQU8OMQjAAy6p51/Th450E4o=
X-Google-Smtp-Source: APXvYqxR40v09O53cOBVHM46vxcD81M6KnLPh8iXzVK3/wvC+uc9NuvQfV1mRgOdM5WDHj0moqE0Nw==
X-Received: by 2002:a63:d906:: with SMTP id r6mr53019398pgg.440.1577429132861;
        Thu, 26 Dec 2019 22:45:32 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k21sm25406001pfa.63.2019.12.26.22.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 22:45:32 -0800 (PST)
Date:   Thu, 26 Dec 2019 22:45:18 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <nks@flawful.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] power: avs: qcom-cpr: fix invalid printk specifier
 in debug print
Message-ID: <20191227064518.GJ1908628@ripper>
References: <20191223141934.19837-1-nks@flawful.org>
 <20191223141934.19837-2-nks@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191223141934.19837-2-nks@flawful.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 23 Dec 06:19 PST 2019, Niklas Cassel wrote:

> drivers/power/avs/qcom-cpr.c:838:15:
> warning: format ‘%ld’ expects argument of type ‘long int’, but argument 6 has type ‘ssize_t’
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Niklas Cassel <nks@flawful.org>
> ---
>  drivers/power/avs/qcom-cpr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/avs/qcom-cpr.c b/drivers/power/avs/qcom-cpr.c
> index a3187973bbb5..a52d2cef1300 100644
> --- a/drivers/power/avs/qcom-cpr.c
> +++ b/drivers/power/avs/qcom-cpr.c
> @@ -835,7 +835,7 @@ static int cpr_read_efuse(struct device *dev, const char *cname, u32 *data)
>  		*data |= ret[i] << (8 * i);
>  
>  	kfree(ret);
> -	dev_dbg(dev, "efuse read(%s) = %x, bytes %ld\n", cname, *data, len);
> +	dev_dbg(dev, "efuse read(%s) = %x, bytes %zd\n", cname, *data, len);
>  
>  	return 0;
>  }
> -- 
> 2.24.1
> 
