Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFFBC198C16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 08:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgCaGI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 02:08:57 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:53051 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgCaGIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 02:08:55 -0400
Received: by mail-pj1-f68.google.com with SMTP id ng8so634596pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 23:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OpQKiggADNEam9j1IF1ZgKCFxLfApWFsR5KbZ1C+nBs=;
        b=VSjVD2wV10lTVvj6HTTeoet5y8V8krcWRYwc6hXafNeAUq7SCc7y3tr4WGyeTC6oLL
         I6oY0/HFBEB7zPN9e+C0wNSVibWi0OnZfTqxetkck/B5JXkZDu3Y0m5TZ13hwXEkKhYu
         2mmIP6hkPsm/n8XrJjFOvbxyV3SntlQopq02k/DxfOJLxdPvdvOq3wrVCjUFVPLujD8c
         cbwGVYlq2JJlU6Na9rsppS7NDQpBIrzzZmnHUkPJq5LuSnftQNIg/yT8GrH30NSce0M4
         Y16tU+hFSRAs1vl/R0DuGyWjcnjsQvgPlkvNZSCM4OBMc+DoXpLbfNsW5TsRc2F9pefO
         5djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OpQKiggADNEam9j1IF1ZgKCFxLfApWFsR5KbZ1C+nBs=;
        b=FAjmRB6/H2b+S88LTqGXVMywpTpNtHXy0Ot5vh+bOAloD0N+vnF+JEGUJ3FyfVaHa1
         9B/B7b+vCykrY2oWmAXUYraBfS7XOvKinM2iwk8oadXXIU2G+JtzqsBx6tDp2pwpxOEF
         ATNhu9OOu0GTx9ko8wmfFRu37VmyGBVReDpEluzRg0bmZ7GaNBWAW2gwzB68u0i6OETV
         b2pv8cR37W48Zl31vksNOtbbesxzooUOM3vSD7aySa+mnKDC9Pnf9H0B2YW4vOxIO6NE
         atlxZTPjomS9znYMw/oVX0I5F+Em/N8hsK1XeiVLYiRP2bo7/7K2VQTOjEQS6kh8tz65
         cfWA==
X-Gm-Message-State: AGi0PuZtN4Vg/2NBLgXbvUfx18ENbE7Ymu4M/DYC+8VE0XtJeXxDteeU
        mP2POMx/Q/6Rte2uwPFOt3E9CA==
X-Google-Smtp-Source: APiQypI37mArLqJb3kpr8kgCNB7T0c03vWdQcOiyYbzHcdpgd5de0iK7DZWllc8CctrFEMVI2AM7AA==
X-Received: by 2002:a17:90b:3556:: with SMTP id lt22mr2010864pjb.138.1585634932111;
        Mon, 30 Mar 2020 23:08:52 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m2sm1015301pjl.21.2020.03.30.23.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 23:08:51 -0700 (PDT)
Date:   Mon, 30 Mar 2020 23:08:49 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/4] clk: qcom: gdsc: Handle GDSC regulator supplies
Message-ID: <20200331060849.GC246874@minitux>
References: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
 <20200319053902.3415984-2-bjorn.andersson@linaro.org>
 <5dbd8e67-cc9f-631b-0b4f-b45389be83cd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dbd8e67-cc9f-631b-0b4f-b45389be83cd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 30 Mar 22:35 PDT 2020, Taniya Das wrote:

> Hi Stephen,
> 
> I think the upstream design always wanted the client/consumer to enable the
> GPU Rail and then turn ON the GDSC?
> 
> Why are we going ahead with adding the support of regulator in the GDSC
> driver?
> 

As I (partially) describe below the mdss driver on 8996 doesn't probe
because the GDSC fails to enable, because the upstream supply is not
enabled, so the mdss driver can't turn on the regulator needed by the
GDSC.

I don't see any other way to handle this than extending the gdsc
implementation, hence my proposal to change the design.
Suggestions/feedback are welcome though.

Regards,
Bjorn

> On 3/19/2020 11:08 AM, Bjorn Andersson wrote:
> > Certain GDSCs, such as the GPU_GX on MSM8996, requires that the upstream
> > regulator supply is powered in order to be turned on.
> > 
> > It's not guaranteed that the bootloader will leave these supplies on and
> > the driver core will attempt to enable any GDSCs before allowing the
> > individual drivers to probe defer on the PMIC regulator driver not yet
> > being present.
> > 
> > So the gdsc driver needs to be made aware of supplying regulators and
> > probe defer on their absence, and it needs to enable and disable the
> > regulator accordingly.
> > 
> > Voltage adjustments of the supplying regulator are deferred to the
> > client drivers themselves.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >   drivers/clk/qcom/gdsc.c | 24 ++++++++++++++++++++++++
> >   drivers/clk/qcom/gdsc.h |  4 ++++
> >   2 files changed, 28 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > index a250f59708d8..3528789cc9d0 100644
> > --- a/drivers/clk/qcom/gdsc.c
> > +++ b/drivers/clk/qcom/gdsc.c
> > @@ -13,6 +13,7 @@
> >   #include <linux/regmap.h>
> >   #include <linux/reset-controller.h>
> >   #include <linux/slab.h>
> > +#include <linux/regulator/consumer.h>
> >   #include "gdsc.h"
> >   #define PWR_ON_MASK		BIT(31)
> > @@ -112,6 +113,12 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
> >   	int ret;
> >   	u32 val = (status == GDSC_ON) ? 0 : SW_COLLAPSE_MASK;
> > +	if (status == GDSC_ON && sc->rsupply) {
> > +		ret = regulator_enable(sc->rsupply);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> >   	ret = regmap_update_bits(sc->regmap, sc->gdscr, SW_COLLAPSE_MASK, val);
> >   	if (ret)
> >   		return ret;
> > @@ -143,6 +150,13 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
> >   	ret = gdsc_poll_status(sc, status);
> >   	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
> > +
> > +	if (!ret && status == GDSC_OFF && sc->rsupply) {
> > +		ret = regulator_disable(sc->rsupply);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> >   	return ret;
> >   }
> > @@ -371,6 +385,16 @@ int gdsc_register(struct gdsc_desc *desc,
> >   	if (!data->domains)
> >   		return -ENOMEM;
> > +	/* Resolve any regulator supplies */
> > +	for (i = 0; i < num; i++) {
> > +		if (!scs[i] || !scs[i]->supply)
> > +			continue;
> > +
> > +		scs[i]->rsupply = devm_regulator_get(dev, scs[i]->supply);
> > +		if (IS_ERR(scs[i]->rsupply))
> > +			return PTR_ERR(scs[i]->rsupply);
> > +	}
> > +
> >   	data->num_domains = num;
> >   	for (i = 0; i < num; i++) {
> >   		if (!scs[i])
> > diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> > index 64cdc8cf0d4d..c36fc26dcdff 100644
> > --- a/drivers/clk/qcom/gdsc.h
> > +++ b/drivers/clk/qcom/gdsc.h
> > @@ -10,6 +10,7 @@
> >   #include <linux/pm_domain.h>
> >   struct regmap;
> > +struct regulator;
> >   struct reset_controller_dev;
> >   /**
> > @@ -52,6 +53,9 @@ struct gdsc {
> >   	struct reset_controller_dev	*rcdev;
> >   	unsigned int			*resets;
> >   	unsigned int			reset_count;
> > +
> > +	const char 			*supply;
> > +	struct regulator		*rsupply;
> >   };
> >   struct gdsc_desc {
> > 
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
> 
> --
