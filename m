Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96FF143931
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388127AbfFMPMN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:12:13 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43823 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732289AbfFMPMM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:12:12 -0400
Received: by mail-pl1-f196.google.com with SMTP id cl9so8262371plb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=whmO4VHJLH3yhLw88WoBAtjYDYrD7FKUhcW2qIhfTgQ=;
        b=tlOOQm+9yvPlQK5EZ1zeDGAddCr36NZ94jYyPKZ2ztLXivCoKRdHBC4dlDcTC1Kgyu
         7wUgtEAItK8J1ttV38DaXqd1byZFOAlM3SOVfIhRI87d8nVKSamRrYK/633Yoc3gOwYv
         6K1MvQl0ZwpenunM3yUjBHCbWwLtr/cArA3DdXKVRtquu4ggCw3uFe6dDA0Ox1IQ0fq6
         8KIvoLHQL0h3iVJrtkjs+HTv3CsLOkbQysUKhYw9b7qq9+FlZ9jS4l3cEfRL+4QfkA+U
         CdUw8GAVk/5jcOTaxtyXMQjnGWNPM/D0H8KoEd52ir+7EhvqwI7XmxhwXYfypKtPBCB2
         +RYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=whmO4VHJLH3yhLw88WoBAtjYDYrD7FKUhcW2qIhfTgQ=;
        b=cTlogQFnlMiAqDz7cUwLoIVZw6dIjKjddJb7/F7Mbspq0CLatfvjlouweqyWbV69r3
         efqo9lSpgw8+xPTtdrT0PgfIOPSsSpwdk2Jhb5tah9ob75ERXo0WgajxHf5dBpIBBVgb
         5Y8Dg8zK6ionxID/T0ThC7ssNlfUC0z0aWoy8HknIt5nIhKzZc1oGiGMmOd7tKQIDWGH
         aPiOIfKs5iOmpFWuoevRrq4+uz9fCMfQ2f9E0/VhZ3WCV7x1SpbUsvMLLxZaPvfal726
         apMrujWkTc22SDzNeQbVfFUK1k9lGv6OTdgdhbc/V4MEejYBQAIyss8qhKlAW20Paw/R
         1tkw==
X-Gm-Message-State: APjAAAUA75C1W1LZcIQa6rpebtuekkT8cHz7C/E7z9JqsmIVDeQDeIez
        GXSHGeoWJhylZRiA7FKdIX+qaA==
X-Google-Smtp-Source: APXvYqzoiQTYF5wmclAxV+dqIhBAbzCFcTV5+wZZW09rVWJlA/V7DDkAGzQio4XBdDOyOMf2OvBGdA==
X-Received: by 2002:a17:902:868b:: with SMTP id g11mr85657934plo.183.1560438732172;
        Thu, 13 Jun 2019 08:12:12 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m24sm117215pgh.75.2019.06.13.08.12.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 08:12:11 -0700 (PDT)
Date:   Thu, 13 Jun 2019 08:12:09 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/7] drivers: regulator: qcom_spmi: Refactor
 get_mode/set_mode
Message-ID: <20190613151209.GB6792@builder>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142239.8779-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613142239.8779-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 07:22 PDT 2019, Jeffrey Hugo wrote:

> spmi_regulator_common_get_mode and spmi_regulator_common_set_mode use
> multi-level ifs which mirror a switch statement.  Refactor to use a switch
> statement to make the code flow more clear.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 28 ++++++++++++++++---------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index fd55438c25d6..1c18fe5969b5 100644
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -911,13 +911,14 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
>  
>  	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
>  
> -	if (reg & SPMI_COMMON_MODE_HPM_MASK)
> +	switch (reg) {
> +	case SPMI_COMMON_MODE_HPM_MASK:
>  		return REGULATOR_MODE_NORMAL;
> -
> -	if (reg & SPMI_COMMON_MODE_AUTO_MASK)
> +	case SPMI_COMMON_MODE_AUTO_MASK:
>  		return REGULATOR_MODE_FAST;
> -
> -	return REGULATOR_MODE_IDLE;
> +	default:
> +		return REGULATOR_MODE_IDLE;
> +	}
>  }
>  
>  static int
> @@ -925,12 +926,19 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
>  {
>  	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
>  	u8 mask = SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
> -	u8 val = 0;
> +	u8 val;
>  
> -	if (mode == REGULATOR_MODE_NORMAL)
> +	switch (mode) {
> +	case REGULATOR_MODE_NORMAL:
>  		val = SPMI_COMMON_MODE_HPM_MASK;
> -	else if (mode == REGULATOR_MODE_FAST)
> +		break;
> +	case REGULATOR_MODE_FAST:
>  		val = SPMI_COMMON_MODE_AUTO_MASK;
> +		break;
> +	default:
> +		val = 0;
> +		break;
> +	}

For this part:
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>  
>  	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
>  }
> @@ -1834,9 +1842,9 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
>  			}
>  		}
>  
> -		if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {

Squash this into patch 1.

Regards,
Bjorn

> +		if (vreg->set_points->count == 1) {
>  			/* since there is only one range */
> -			range = spmi_regulator_find_range(vreg);
> +			range = vreg->set_points->range;
>  			vreg->desc.uV_step = range->step_uV;
>  		}
>  
> -- 
> 2.17.1
> 
