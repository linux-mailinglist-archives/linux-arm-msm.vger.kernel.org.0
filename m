Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B63C438F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732349AbfFMPKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:10:12 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38872 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfFMPKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:10:11 -0400
Received: by mail-pg1-f194.google.com with SMTP id v11so11120741pgl.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JO9uQQwMbg5ivhzHd1CnAF++m72nEakKLp0osCcJQnQ=;
        b=IPZYAtoyoFp3HvrHzCX1RIl4KYEYpG40khs6KFbup9TQk8z2GwOZdLAq9U6Dlgslh3
         Ly2CwfcLpztz7OipPAimq5Rn4JKW4CCAS9+DK9hBsfh7Isg22X0s2Z5tk953041cuUbJ
         ZM2f82JRLxr3Ofoxghz6bZ8lHkTkS9sRwYB/yZ3o0gb83r6sC10xnIJymDLluwc3Omfc
         CjQHC2aH4lpljhIKO50mdS7P8r46QUHHVxoB4auFSLUWAV3dp1v11A3zDRLWQZABWyiU
         7kr54U0PXOrbhK6k6ss2xiE9MN87j6QcAnRsHXpEzq+WAv9Vs3/0WTZI1Desb7UwKU5p
         1TmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JO9uQQwMbg5ivhzHd1CnAF++m72nEakKLp0osCcJQnQ=;
        b=hUA8ftBGYk+AHUWnt0o1VfixAdYBwCK2pNGihEQC+FnjiPr8NOflgC5i2eNT9L+mnI
         fL4TSY1nOM6pnFS9SZDCNua0bGNcAKs2QnNL7OfqNWXimJsy5RdeSE+obZd7WWPbCMZw
         FZZ5livFAv20dj+/YkPXoScHuUtSbud2PED4txpnc1LsS6inwAm8IvWsp3J//pEz8jTq
         P6snMjLaPCO4xCKH1wjkTdmGEr2lZGvq3BuUzMEzVvJ/Rta0jnKwybRkMMxdUxf7wPrp
         J06hKVHvnSsGaBaT7sbJIKdkcPTceviKDMH9jzLkpYm41Ig69xhW1GzlYDkFm6DDxpT7
         aiRg==
X-Gm-Message-State: APjAAAUU044cck5uwEfUOu2vpzedUkFkkD1rN9lyae1XouFBHfxHv3qb
        pKHaWYBgJIU4KgIr+YRiXmw9+g==
X-Google-Smtp-Source: APXvYqwImb0dZOR+TBCaGd8bb0UVaGoam8pIQa5PBKA2pE708P62aKAe6vTGzNjGapg7p+mVArcn7Q==
X-Received: by 2002:a17:90a:b298:: with SMTP id c24mr6096722pjr.18.1560438610952;
        Thu, 13 Jun 2019 08:10:10 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b8sm19344pff.20.2019.06.13.08.10.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 08:10:10 -0700 (PDT)
Date:   Thu, 13 Jun 2019 08:10:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v3 1/7] drivers: regulator: qcom_spmi: enable linear
 range info
Message-ID: <20190613151008.GA6792@builder>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142231.8728-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613142231.8728-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 07:22 PDT 2019, Jeffrey Hugo wrote:

> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index 53a61fb65642..fd55438c25d6 100644
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -1744,6 +1744,7 @@ MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
>  static int qcom_spmi_regulator_probe(struct platform_device *pdev)
>  {
>  	const struct spmi_regulator_data *reg;
> +	const struct spmi_voltage_range *range;
>  	const struct of_device_id *match;
>  	struct regulator_config config = { };
>  	struct regulator_dev *rdev;
> @@ -1833,6 +1834,12 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
>  			}
>  		}
>  
> +		if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {

This doesn't compile, because HFS430 isn't defined until patch 7.

But in patch 2 you replace this with a check to see if there's just a
single range, which is a better solution. So squash the last hunk of
patch 2 into this.

Regards,
Bjorn

> +			/* since there is only one range */
> +			range = spmi_regulator_find_range(vreg);
> +			vreg->desc.uV_step = range->step_uV;
> +		}
> +
>  		config.dev = dev;
>  		config.driver_data = vreg;
>  		config.regmap = regmap;
> -- 
> 2.17.1
> 
