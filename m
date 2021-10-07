Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4069C425CEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 22:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240924AbhJGUJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 16:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240659AbhJGUJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 16:09:11 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8124DC061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 13:07:17 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id y207so7452327oia.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 13:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FFdR5Q8dgTLESN1Y4gNMob3whbKhRrjkjEmOmQ6y9yQ=;
        b=aX7Admelts4w34rqAbdl/SbF4t8Z67F8SAXPtFtaijXHf4rJx1NusmvOd2KPijxVah
         AKLOdbtFlBTf+2lvoyZXVo74ssS0WgZHhK3gwlsyNEkuoFDlC+g/+uIHaaOolEVA2r/w
         S4ZKu5DWg3rY5VXN983RhELO+szcRn7HNmRL5G7tKYtzGEeOr1wgMyRV24oMWLJhlU0a
         /S03IyLnxjYn9eDNXWZAqazdU9rqQ9m6/e4v8xm85uUwsE1ojvMPFazbwgY3ttxnKgnY
         AnIJnhKuLgCSlQHKC+Mw34SMrYSU7ErUufVzCMRzH6Mc53JCgl+l6OYVcnqylGdI0BO2
         /wsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FFdR5Q8dgTLESN1Y4gNMob3whbKhRrjkjEmOmQ6y9yQ=;
        b=z0JRc2kV4MZwZF5BvPlO2Vg1l5ZgCzlwv1C2xeCiJITGSUe/tss9oTFXrocZgBXoUH
         iKqA+dEadGk8jP93F5YXSWwl5peS0I/S/zBnZSe8wRhlQxv2pA1A+mginl5H9bS8pJ+7
         uchoia+0wkVlll9PsN5FdD/xv8fI54b7qNIMUk6ePsYTKfP27869y1Ni7hIynjttE7/C
         WWBGnHbwmVNGxH5048WnpKU2SdUX3XB963KPnVDcEKpmIxPLs8UPiNsSujHTq1o6/E7R
         5TxH8xrD3uOexYYfbL2U7TFAlIEOxjRaL9D+xbs9KgqqXmbGgNzhjfvA3ahR3WFwX9n1
         Lqeg==
X-Gm-Message-State: AOAM531aYhJ3KA1LuuoiIyL9URDuK1w+3PwCCtrJFMUTmonTeDjbFMv7
        uQT5le/lAHfI+iB7NissTck0cw==
X-Google-Smtp-Source: ABdhPJx7H7wjQ1XMkdMLSYMQSnlDHjAaVETulRelH3QWqNk4dhNy4p2yg4mORba1D+SfMGWMldVNkA==
X-Received: by 2002:aca:bd02:: with SMTP id n2mr13066786oif.113.1633637236885;
        Thu, 07 Oct 2021 13:07:16 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id f10sm76209otl.57.2021.10.07.13.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 13:07:16 -0700 (PDT)
Date:   Thu, 7 Oct 2021 13:08:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v3] drivers: thermal: tsens: add timeout to
 get_temp_tsens_valid
Message-ID: <YV9T2Bq16Z6SdBDM@ripper>
References: <20211007172859.583-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007172859.583-1-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 07 Oct 10:28 PDT 2021, Ansuel Smith wrote:

> The function can loop and lock the system if for whatever reason the bit
> for the target sensor is NEVER valid. This is the case if a sensor is
> disabled by the factory and the valid bit is never reported as actually
> valid. Add a timeout check and exit if a timeout occurs. As this is
> a very rare condition, handle the timeout only if the first read fails.
> While at it also rework the function to improve readability and convert
> to poll_timeout generic macro.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/thermal/qcom/tsens.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index b1162e566a70..99a8d9f3e03c 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -603,22 +603,21 @@ int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp)
>  	int ret;
>  
>  	/* VER_0 doesn't have VALID bit */
> -	if (tsens_version(priv) >= VER_0_1) {
> -		ret = regmap_field_read(priv->rf[valid_idx], &valid);
> -		if (ret)
> -			return ret;
> -		while (!valid) {
> -			/* Valid bit is 0 for 6 AHB clock cycles.
> -			 * At 19.2MHz, 1 AHB clock is ~60ns.
> -			 * We should enter this loop very, very rarely.
> -			 */
> -			ndelay(400);
> -			ret = regmap_field_read(priv->rf[valid_idx], &valid);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> +	if (tsens_version(priv) == VER_0)
> +		goto get_temp;
> +
> +	/* Valid bit is 0 for 6 AHB clock cycles.
> +	 * At 19.2MHz, 1 AHB clock is ~60ns.
> +	 * We should enter this loop very, very rarely.
> +	 * Wait 1 us since it's the min of poll_timeout macro.
> +	 * Old value was 400 ns.
> +	 */
> +	ret = regmap_field_read_poll_timeout(priv->rf[valid_idx], valid,
> +					     valid, 1, 20 * USEC_PER_MSEC);
> +	if (ret)
> +		return ret;
>  
> +get_temp:
>  	/* Valid bit is set, OK to read the temperature */
>  	*temp = tsens_hw_to_mC(s, temp_idx);
>  
> -- 
> 2.32.0
> 
