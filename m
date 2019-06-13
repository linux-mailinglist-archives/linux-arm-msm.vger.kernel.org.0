Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0773143AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732865AbfFMPYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:24:34 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39000 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731713AbfFMPYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:24:34 -0400
Received: by mail-pf1-f193.google.com with SMTP id j2so12061670pfe.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 08:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UhkxS9OzbQDJW8EmelqSilqPcjj3tM4tLTV73e7d2yw=;
        b=dzKFboS9GO1hDmlm9GccLJ3JLpjQDc/PCv8UzpB/mtMxyIqA2B4c0jEhTsRq3dS+Pw
         3OH3S9ZWwN191V8aO4SrYk/U+ugTOq3+d3oBnBYUHH3ZMNikRQARD079yVR+1lrb4pjJ
         YZg4HDp0qFkB3nAuRt9UVPV322Ne054lKEyvyeaFZISy6fxVTXPHHiZ/5B7XQRz2Df74
         NfAYxnn5RWzPJE0+S1KQA4WGD/FTIOtrHEZzPHA6Va87X7vkY2nn/vWh6XqDReVbAzyR
         F7hQkH0TOTOYgwCIls/RcI0yYQtfJkQ7wAoRnNIq0AZSxD/N7z9IoysNJSo0ZaxrUY9Q
         EQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UhkxS9OzbQDJW8EmelqSilqPcjj3tM4tLTV73e7d2yw=;
        b=jsaRmcdkzDsk/pLI7fsozpSurkDtOEAwZ6UKLhkQpufP8aU0FMMiX+9Bfm3qPrHlHV
         fpG2QGk6LxoFMbfty1MNJf6boSGrGonnVEGEz8p01/U8ugaQilON8K3+7AFayqikfXAa
         PJ2FNUF5jc9yyAlGcaEqGJLdZGy8zubBQKiTPa+XsvTqILDdekIFl8508+98ymbUAo5Q
         F+8BHyZkr1BU+GjpLrEP6x5xD4y2ucOLneE1mRI7iZZL6Lgr5moU6G/xEFnDB8a+7H+x
         +i18hLCuCNu6dQ0cDZZyU1fEao0bcURYDYjlsvkLvAJfbg2QG4jPiBlzl9kjOnmx/rRg
         QbeQ==
X-Gm-Message-State: APjAAAV110qxuyjulM3SwhgddcHSTJbgSZDhihl4XXqKcQxRUyeVvy3I
        EewdZbe5j1X21spbUSTUPEIBPA==
X-Google-Smtp-Source: APXvYqxMD0WyAu536v6hFZOJpJWEQhXFLgxLRnrqc2RoymF6h5pR+QF0Lh6Ev5dKcm9cjbMfXygFkA==
X-Received: by 2002:a17:90a:f498:: with SMTP id bx24mr6275180pjb.91.1560439473353;
        Thu, 13 Jun 2019 08:24:33 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a13sm119140pgl.84.2019.06.13.08.24.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 08:24:32 -0700 (PDT)
Date:   Thu, 13 Jun 2019 08:24:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/7] drivers: regulator: qcom_spmi: Refactor
 get_mode/set_mode
Message-ID: <20190613152430.GC6792@builder>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142239.8779-1-jeffrey.l.hugo@gmail.com>
 <20190613151209.GB6792@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613151209.GB6792@builder>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 08:12 PDT 2019, Bjorn Andersson wrote:

> On Thu 13 Jun 07:22 PDT 2019, Jeffrey Hugo wrote:
> 
> > spmi_regulator_common_get_mode and spmi_regulator_common_set_mode use
> > multi-level ifs which mirror a switch statement.  Refactor to use a switch
> > statement to make the code flow more clear.
> > 
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/regulator/qcom_spmi-regulator.c | 28 ++++++++++++++++---------
> >  1 file changed, 18 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> > index fd55438c25d6..1c18fe5969b5 100644
> > --- a/drivers/regulator/qcom_spmi-regulator.c
> > +++ b/drivers/regulator/qcom_spmi-regulator.c
> > @@ -911,13 +911,14 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
> >  
> >  	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
> >  
> > -	if (reg & SPMI_COMMON_MODE_HPM_MASK)

Sorry, didn't see the & here. Don't you need to mask out the mode bits
before turning this into a switch?

> > +	switch (reg) {
> > +	case SPMI_COMMON_MODE_HPM_MASK:
> >  		return REGULATOR_MODE_NORMAL;
> > -
> > -	if (reg & SPMI_COMMON_MODE_AUTO_MASK)
> > +	case SPMI_COMMON_MODE_AUTO_MASK:
> >  		return REGULATOR_MODE_FAST;
> > -
> > -	return REGULATOR_MODE_IDLE;
> > +	default:
> > +		return REGULATOR_MODE_IDLE;
> > +	}
> >  }
> >  
> >  static int
> > @@ -925,12 +926,19 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
> >  {
> >  	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> >  	u8 mask = SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
> > -	u8 val = 0;
> > +	u8 val;
> >  
> > -	if (mode == REGULATOR_MODE_NORMAL)
> > +	switch (mode) {
> > +	case REGULATOR_MODE_NORMAL:
> >  		val = SPMI_COMMON_MODE_HPM_MASK;
> > -	else if (mode == REGULATOR_MODE_FAST)
> > +		break;
> > +	case REGULATOR_MODE_FAST:
> >  		val = SPMI_COMMON_MODE_AUTO_MASK;
> > +		break;
> > +	default:
> > +		val = 0;
> > +		break;
> > +	}
> 
> For this part:
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >  
> >  	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
> >  }
> > @@ -1834,9 +1842,9 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
> >  			}
> >  		}
> >  
> > -		if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
> 
> Squash this into patch 1.
> 
> Regards,
> Bjorn
> 
> > +		if (vreg->set_points->count == 1) {
> >  			/* since there is only one range */
> > -			range = spmi_regulator_find_range(vreg);
> > +			range = vreg->set_points->range;
> >  			vreg->desc.uV_step = range->step_uV;
> >  		}
> >  
> > -- 
> > 2.17.1
> > 
