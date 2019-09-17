Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A64EB54C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 19:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfIQR7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 13:59:00 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35073 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727672AbfIQR7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 13:59:00 -0400
Received: by mail-pl1-f196.google.com with SMTP id s17so1864000plp.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2019 10:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0PcvX7ZTcQgsbgDEZrE+h18TKfKfoGtnmdkofDb9Kyk=;
        b=GOFSb/baTTMhMqQZbzEp2eaT5zPoyd05eAxkep5YoVxUlSBoYwcuJ1VIRrcZWUADPx
         Le7NjRB4BxAnJZg2b3bXdSUUQ0pBNBQVyEq4AT1DH91zHpW2Jwich/sb/SwoosfNi5ac
         wu7rzljl5Fa8i9aYGYPkgIQcr6eMhyv1kfla4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0PcvX7ZTcQgsbgDEZrE+h18TKfKfoGtnmdkofDb9Kyk=;
        b=lldmIJGwHyvLOK/6P7bBczAnTu1p/agRLkxikYwZfINBXM/NuHXbq3p/eX03B6BIRp
         vM6uhoW99Lp2/Nj2qX5JNdyaWgv718FY7H10mYATgX1GfhxsmHyTxCljTTsSNOczBR8B
         VDRe4Y++xS790P9n0NdKlcMsW7H9OqFvnUNGmJUNcvUKl/Wk8nXJCgBI7dmRv5v3A9MM
         dCJBKlTv5vzbYrIDunhpbkOBZWeALFitzwU7INtw4jRZapZqe2Ai/wza1WVJTrBwTU97
         +P5AyjN6LtoZAwp3DRmv+doemGDfXDSHXFTBK7USFFuTjqYeBaeNSAOoSQIkasG3/QGt
         I5uA==
X-Gm-Message-State: APjAAAVxhDi1nNcVSA6TS0VLRUYmSLdVuFHu4ncGzXLDDTa4/3nKYa4N
        EetpK2UUTO2M1gx+YeljO71TRvreAgM=
X-Google-Smtp-Source: APXvYqwJ22LdhJ9CnYNWuplY1l++rDxgq8ZDIv0hR66Ibqq1dxO2/XMgct50oaeWvbrR/9LIEyG2OA==
X-Received: by 2002:a17:902:7c14:: with SMTP id x20mr4926547pll.289.1568743139264;
        Tue, 17 Sep 2019 10:58:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id i22sm3534305pfa.70.2019.09.17.10.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 10:58:58 -0700 (PDT)
Date:   Tue, 17 Sep 2019 10:58:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     cchiluve@codeaurora.org
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 2/3] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20190917175855.GI133864@google.com>
References: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
 <1568634061-14455-3-git-send-email-cchiluve@codeaurora.org>
 <20190916222446.GG133864@google.com>
 <7762a32f08a297e47a45dc9840b62d02@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7762a32f08a297e47a45dc9840b62d02@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Chandana,

On Tue, Sep 17, 2019 at 04:39:20PM +0530, cchiluve@codeaurora.org wrote:
> Hi Matthias,
> 
> Thanks for the review. I Will address below comments and post changes in new
> version.
> 
> On 2019-09-17 03:54, Matthias Kaehlcke wrote:
> > Hi Chandana,
> > 
> > On Mon, Sep 16, 2019 at 05:11:00PM +0530, Chandana Kishori Chiluveru
> > wrote:
> > > Add interconnect support in dwc3-qcom driver to vote for bus
> > > bandwidth.
> > > 
> > > This requires for two different paths - from USB master to
> > > DDR slave. The other is from APPS master to USB slave.
> > > 
> > > Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> > > ---
> > >  drivers/usb/dwc3/dwc3-qcom.c | 145
> > > ++++++++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 143 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c
> > > b/drivers/usb/dwc3/dwc3-qcom.c
> > > index 184df4d..4f6c9736 100644
> > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > @@ -14,6 +14,7 @@
> > >  #include <linux/extcon.h>
> > >  #include <linux/of_platform.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/interconnect.h>
> > 
> > please use alphabetical order, i.e. this should be after
> > 'linux/extcon.h'.
> > 
> > >  #include <linux/phy/phy.h>
> > >  #include <linux/usb/of.h>
> > >  #include <linux/reset.h>
> > > @@ -59,8 +60,13 @@ struct dwc3_qcom {
> > >  	enum usb_dr_mode	mode;
> > >  	bool			is_suspended;
> > >  	bool			pm_suspended;
> > > +	struct icc_path		*usb_ddr_icc_path;
> > > +	struct icc_path		*apps_usb_icc_path;
> > >  };
> > > 
> > > +static int usb_interconnect_enable(struct dwc3_qcom *qcom);
> > > +static int usb_interconnect_disable(struct dwc3_qcom *qcom);
> > > +
> > >  static inline void dwc3_qcom_setbits(void __iomem *base, u32
> > > offset, u32 val)
> > >  {
> > >  	u32 reg;
> > > @@ -222,7 +228,7 @@ static void dwc3_qcom_enable_interrupts(struct
> > > dwc3_qcom *qcom)
> > >  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
> > >  {
> > >  	u32 val;
> > > -	int i;
> > > +	int i, ret;
> > > 
> > >  	if (qcom->is_suspended)
> > >  		return 0;
> > > @@ -234,6 +240,11 @@ static int dwc3_qcom_suspend(struct dwc3_qcom
> > > *qcom)
> > >  	for (i = qcom->num_clocks - 1; i >= 0; i--)
> > >  		clk_disable_unprepare(qcom->clks[i]);
> > > 
> > > +	/* Remove bus voting */
> > 
> > IMO the comment doesn't add much, especially since there is a log in
> > case of failure.
> > 
> > > +	ret = usb_interconnect_disable(qcom);
> > > +	if (ret)
> > > +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
> > 
> > This should probably be a warning, since the function continues with
> > normal execution.
> > 
> > nit: the function is called usb_interconnect_disable(), but the
> > message says "bus bw voting failed". The function name encapsulates
> > what the function does, but the message talks about implementation
> > details. To be consistent either the function should have something
> > about 'voting' in it's name, or the message should be "failed to
> > disable interconnect" or similar.
> > 
> > > +
> > >  	qcom->is_suspended = true;
> > >  	dwc3_qcom_enable_interrupts(qcom);
> > > 
> > > @@ -259,6 +270,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom
> > > *qcom)
> > >  		}
> > >  	}
> > > 
> > > +	/* Add bus voting */
> > > +	ret = usb_interconnect_enable(qcom);
> > > +	if (ret)
> > > +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
> > > +
> > 
> > same comments as for suspend()
> > 
> > >  	/* Clear existing events from PHY related to L2 in/out */
> > >  	dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
> > >  			  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
> > > @@ -268,6 +284,117 @@ static int dwc3_qcom_resume(struct dwc3_qcom
> > > *qcom)
> > >  	return 0;
> > >  }
> > > 
> > > +/* Interconnect path bandwidths in MBps */
> > > +#define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
> > > +#define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
> > > +#define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> > > +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> > > +#define APPS_USB_AVG_BW 0
> > > +#define APPS_USB_PEAK_BW MBps_to_icc(40)
> > > +
> > > +/**
> > > + * usb_interconnect_init() -
> > 
> > A function named 'usb_*' is typically associated to be a USB core
> > function. I would suggest to use the 'dwc3_qcom_' prefix like all
> > other functions in this file. Applicable to all new functions.
> > 
> > > Request to get interconnect path handle
> > 
> > nit: handles
> > 
> > Get rid of "Request to"?
> > 
> > > + * @qcom:			Pointer to the concerned usb core.
> > > + *
> > > + */
> > > +static int usb_interconnect_init(struct dwc3_qcom *qcom)
> > > +{
> > > +	struct device *dev = qcom->dev;
> > > +
> > > +	qcom->usb_ddr_icc_path = of_icc_get(dev, "usb-ddr");
> > > +	if (IS_ERR(qcom->usb_ddr_icc_path)) {
> > > +		dev_err(dev, "Error: (%ld) failed getting %s path\n",
> > > +			PTR_ERR(qcom->usb_ddr_icc_path), "usb-ddr");
> > 
> > Why not put 'usb-ddr' in the format string, instead of using '%s'?
> > 
> > > +		return PTR_ERR(qcom->usb_ddr_icc_path);
> > > +	}
> > > +
> > > +	qcom->apps_usb_icc_path = of_icc_get(dev, "apps-usb");
> > > +	if (IS_ERR(qcom->apps_usb_icc_path)) {
> > > +		dev_err(dev, "Error: (%ld) failed getting %s path\n",
> > > +				PTR_ERR(qcom->apps_usb_icc_path), "apps-usb");
> > 
> > same comment as above.
> > 
> >      	     	icc_put(qcom->usb_ddr_icc_path);
> > 
> > > +		return PTR_ERR(qcom->usb_ddr_icc_path);
> > 
> > should be 'qcom->apps_usb_icc_path'
> > 
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * geni_interconnect_exit() -
> > 
> > wrong prefix
> > 
> > > Request to release interconnect path handle
> > 
> > nit: handles
> > 
> > Get rid of "Request to"?
> > 
> > > + * @qcom:			Pointer to the concerned usb core.
> > > + *
> > > + * This function is used to release interconnect path handle.
> > > + */
> > > +static void usb_interconnect_exit(struct dwc3_qcom *qcom)
> > > +{
> > > +	icc_put(qcom->usb_ddr_icc_path);
> > > +	icc_put(qcom->apps_usb_icc_path);
> > > +}
> > > +
> > > +/* Currently we only use bandwidth level, so just "enable"
> > > interconnects */
> > > +static int usb_interconnect_enable(struct dwc3_qcom *qcom)
> > > +{
> > > +	struct dwc3 *dwc;
> > > +	int ret;
> > > +
> > > +	dwc = platform_get_drvdata(qcom->dwc3);
> > > +	if (!dwc) {
> > > +		dev_err(qcom->dev, "Failed to get dwc3 device\n");
> > > +		return -EPROBE_DEFER;
> > > +	}
> > 
> > This should never happen, drvdata is set in _probe(). If it happens
> > -EPROBE_DEFER doesn't seem to be an appropriate error code. I suggest
> > to remove the condition entirely.
> > 
> In my testing i have seen a null pointer crash with "dwc->maximum_speed". To
> prevent the crash i have added this logic.
> Agree that drvdata is set in dwc3_probe(). Sometimes i can see that
> dwc3_probe never getting completed before it can go and access
> dwc->maximum_speed pointer here.
> This is leading to null pointer access crash. if i defer the probe and try
> again i can see that drvdata getting updated successfully in dwc3_probe.

I see, _probe() sets the drvdata of the dwc3_qcom pdev, however
_enable() gets the drvdata from the dwc3 pdev.

Apparently dwc3_probe() and dwc3_qcom_probe() can run in paralel:

dwc3_probe
  // stuff

  dwc3_get_properties
    dwc->maximum_speed = usb_get_maximum_speed(dev);

  platform_set_drvdata(pdev, dwc)

  // more stuff


dwc3_qcom_probe
  dwc3_qcom_of_register_core
    qcom->dwc3 = of_find_device_by_node()

  usb_interconnect_enable
    dwc = platform_get_drvdata(qcom->dwc3);


When dwc3_qcom_of_register_core() is called the dwc3 device may not be
fully initialized yet. Also after the drvdata is set initialization is
still ongoing. You can't really rely on the dwc3 struct to be fully
initialized, but at least the maximum_speed attribute should be set
when the drvdata is not NULL.

I wonder if it would be clearer to do the check in _probe() instead of
_interconnect_enable(), the -EPROBE_DEFER return value is confusing,
especially since the function can be called from a non-probe context.

You could possibly use device_is_bound() to confirm that dwc3_probe()
is completed, the function isn't widely used though. Checking that the
device is fully initialized before using it seems like a good idea,
however there might be reasons for not using device_is_bound() which I
ignore. Maybe others can offer advice on this.
