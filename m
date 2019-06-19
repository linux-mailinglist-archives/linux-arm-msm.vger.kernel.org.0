Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92594C12F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 21:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfFSTGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 15:06:01 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42345 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfFSTGA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 15:06:00 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so195747plb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2019 12:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4ML5TdHcdMxiU+u3GNvYmF9q/Wcykd3GF57yT+ShoBQ=;
        b=dLv5a3dYj6WUcr+5mCS9ysYf8eM+p2D25Chyxm8F+HWGU4A3+WHYA/u+8VZMCXYvQ+
         KRzJOCTCT5mPCHaHtGcGvWNjYuhjGTDveFPeRvJDIM142RwT1VqFxVx8PcSx//XskaBl
         KBA0lRgFjgVEuN0Dv9KiA7Ar8QwwyHZlg86OyIS2RtjWMmXCu2eI4HaOf+uJw9i5S/9p
         0OClM6XPehas4V1957qQnLx21VVaoHf9LIlcyzdR/GxiMQcS1dMjC03d8F/Erxv0T/ua
         JP1wt0FG1rAZgF7oQEZpE3MRN4nrrFrpzAuve4D6Dzpdh4fGVEOFt2zfLBjSSxnuL80j
         P09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4ML5TdHcdMxiU+u3GNvYmF9q/Wcykd3GF57yT+ShoBQ=;
        b=C0lbhrzleIq/+GtUw7W16eQntiU8u7/KZjJ7U/APlzvNQ+juw9nVM7ZU/Z4E/kqoEe
         rh04PylkeopPU6wbhX+D3I5MYWrJzeoJxPKu0wlQsb31MR9hy9gzyF6VDvAf8TVYYpuI
         MW6jYPNbVfKE8nTe2KBAtxsAZ93ySk0zDXCgzr/9NDblWNI3RKeFlmpN7L3aS5+EGh+F
         sqhmBDP9j489HLELGVBX1DWmnhN1wvVfi5jz8COGd/7I9Yi9Pk0QIoG9FsBNY+lUdy8k
         jzpew688lNAx3V2tGPBCTQQgkzQHNjsHtYWljfKHJEQ+XS3IuucC5Bs21A4tsoEK1DKT
         mecw==
X-Gm-Message-State: APjAAAVw9fRC/QYISk8dQNMa2gic+nrQDjk7zZJFu5aJlg+s3cm2udVI
        D8OR5eav0FIlPdTnCTaKzUg4Jg==
X-Google-Smtp-Source: APXvYqy4laGmYqXEM7cobrf93IQ6FOB66hNbrPcNqoVeHM42cBVcdC31Axc3brsx51ScTDIik709Eg==
X-Received: by 2002:a17:902:9f93:: with SMTP id g19mr105115045plq.223.1560971160044;
        Wed, 19 Jun 2019 12:06:00 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p27sm32831691pfq.136.2019.06.19.12.05.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 12:05:59 -0700 (PDT)
Date:   Wed, 19 Jun 2019 12:05:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom_spmi: Fix math of
 spmi_regulator_set_voltage_time_sel
Message-ID: <20190619190557.GL4814@minitux>
References: <20190619185636.10831-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619185636.10831-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 19 Jun 11:56 PDT 2019, Jeffrey Hugo wrote:

> spmi_regulator_set_voltage_time_sel() calculates the amount of delay
> needed as the result of setting a new voltage.  Essentially this is the
> absolute difference of the old and new voltages, divided by the slew rate.
> 
> The implementation of spmi_regulator_set_voltage_time_sel() is wrong.
> 
> It attempts to calculate the difference in voltages by using the
> difference in selectors and multiplying by the voltage step between
> selectors.  This ignores the possibility that the old and new selectors
> might be from different ranges, which have different step values.  Also,
> the difference between the selectors may encapsulate N ranges inbetween,
> so a summation of each selector change from old to new would be needed.
> 
> Lets avoid all of that complexity, and just get the actual voltage
> represented by both the old and new selector, and use those to directly
> compute the voltage delta.  This is more straight forward, and has the
> side benifit of avoiding issues with regulator implementations that don't
> have hardware register support to get the current configured range.
> 
> Fixes: e92a4047419c ("regulator: Add QCOM SPMI regulator driver")
> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reported-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/regulator/qcom_spmi-regulator.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index 13f83be50076..877df33e0246 100644
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -813,14 +813,10 @@ static int spmi_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
>  		unsigned int old_selector, unsigned int new_selector)
>  {
>  	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> -	const struct spmi_voltage_range *range;
>  	int diff_uV;
>  
> -	range = spmi_regulator_find_range(vreg);
> -	if (!range)
> -		return -EINVAL;
> -
> -	diff_uV = abs(new_selector - old_selector) * range->step_uV;
> +	diff_uV = abs(spmi_regulator_common_list_voltage(rdev, new_selector) -
> +		      spmi_regulator_common_list_voltage(rdev, old_selector));
>  
>  	return DIV_ROUND_UP(diff_uV, vreg->slew_rate);
>  }
> -- 
> 2.17.1
> 
