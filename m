Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABFF615508E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 03:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgBGCKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 21:10:42 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45654 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbgBGCKm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 21:10:42 -0500
Received: by mail-pl1-f193.google.com with SMTP id b22so334104pls.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 18:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VAVIgonuO8Se46gM7TZHTGf57NWCjrEw0kdtkxk5MAE=;
        b=P4AOt3BEooB/Tl2yVFKs/aOaf7TB1El8Spw0tkjNqk3twBAiqGjaXOoPeTtXQVUxdT
         ZMYIBvYisCX4bq647fel1qHETgRGizKCZNToQr12BPkRqDpwh/0K/Lxnz2XI+1t8iczU
         7Skc40j2Cfuts85/L2UYUJMYFjmU6BghrUCGHfVnEic8jEDI5SdEgVz7OPbPVkbWRXJu
         y6+w7DVRp1DrnTegZOOtEpVugQuadMsFfG4NHu7BSfWTkN0h5IHUkAUOHBui+JyaLVu7
         fUrXlSmLx+bUmvQfeSq57HR28DuYA7x43c1P9pyJ+Js6an7c14BmLjje22xeAygRfrWF
         5Hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VAVIgonuO8Se46gM7TZHTGf57NWCjrEw0kdtkxk5MAE=;
        b=Fi+vvkWHIsIfBAwr2C1Qvjbqa5F4JyGjRDowDkHNvY6usnrZlFXrKvZ6EN/QxoM4ll
         U1DJTWYt9EJP8oErAKCmrY35ULWyiTd+ld65dIlOlsTeIrLSNc/Ue2mqjU7VWHek7iOE
         jZeHZyUJijpusuk7OuXceFXx+/qflkvSzH6G0NBqpeISXIDrv+L6xrOhmXBkgM1I2Q0b
         mhyZWcgHhK3Ok/aeiCXnZ6yJ3Xwm5FQ29lrOX7fJHgDJjTSf0tvbKzW7q7CVTwp+CPgn
         K4FKZ4HEvSQk4vxUuQBGWmn4zfipYRdOS2jXUCFAgFR4o/icuzhIXg4kR6SyKz4VIRXD
         0LhQ==
X-Gm-Message-State: APjAAAW1OMw5f/mDs9EfsLS1PpWuKBzaBsDYTVPuCUOCNUAieDMoUQnL
        81UbtuVvfqlFzCX8PTLWlLNNkg==
X-Google-Smtp-Source: APXvYqxmK8qkuBX/sQUDFfMFTA273uD7ksjAb7W/MTTcJT3HbgiQmZkV0nRTdxURNo1wEcX7IkPOqQ==
X-Received: by 2002:a17:90a:fa94:: with SMTP id cu20mr1022281pjb.114.1581041440028;
        Thu, 06 Feb 2020 18:10:40 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k4sm693173pfg.40.2020.02.06.18.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 18:10:39 -0800 (PST)
Date:   Thu, 6 Feb 2020 18:10:36 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Can Guo <cang@codeaurora.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 7/8] scsi: ufs-qcom: Delay specific time before gate
 ref clk
Message-ID: <20200207021036.GT2514@yoga>
References: <1580978008-9327-1-git-send-email-cang@codeaurora.org>
 <1580978008-9327-8-git-send-email-cang@codeaurora.org>
 <20200206203336.GQ2514@yoga>
 <9de3632cf0c65347684b8c5f4f3c63b3@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9de3632cf0c65347684b8c5f4f3c63b3@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 06 Feb 17:09 PST 2020, Can Guo wrote:

> On 2020-02-07 04:33, Bjorn Andersson wrote:
> > On Thu 06 Feb 00:33 PST 2020, Can Guo wrote:
> > 
> > > After enter hibern8, as UFS JEDEC ver 3.0 requires, a specific
> > > gating wait
> > > time is required before disable the device reference clock. If it is
> > > not
> > > specified, use the old delay.
> > > 
> > > Signed-off-by: Can Guo <cang@codeaurora.org>
> > > Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
> > > Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
> > > ---
> > >  drivers/scsi/ufs/ufs-qcom.c | 22 +++++++++++++++++++---
> > >  1 file changed, 19 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> > > index 85d7c17..39eefa4 100644
> > > --- a/drivers/scsi/ufs/ufs-qcom.c
> > > +++ b/drivers/scsi/ufs/ufs-qcom.c
> > > @@ -833,6 +833,8 @@ static int ufs_qcom_bus_register(struct
> > > ufs_qcom_host *host)
> > > 
> > >  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host,
> > > bool enable)
> > >  {
> > > +	unsigned long gating_wait;
> > > +
> > >  	if (host->dev_ref_clk_ctrl_mmio &&
> > >  	    (enable ^ host->is_dev_ref_clk_enabled)) {
> > >  		u32 temp = readl_relaxed(host->dev_ref_clk_ctrl_mmio);
> > > @@ -845,11 +847,25 @@ static void ufs_qcom_dev_ref_clk_ctrl(struct
> > > ufs_qcom_host *host, bool enable)
> > >  		/*
> > >  		 * If we are here to disable this clock it might be immediately
> > >  		 * after entering into hibern8 in which case we need to make
> > > -		 * sure that device ref_clk is active at least 1us after the
> > > +		 * sure that device ref_clk is active for specific time after
> > >  		 * hibern8 enter.
> > >  		 */
> > > -		if (!enable)
> > > -			udelay(1);
> > > +		if (!enable) {
> > > +			gating_wait = host->hba->dev_info.clk_gating_wait_us;
> > > +			if (!gating_wait) {
> > 
> > Afaict this can't happen, because in patch 6 you check for gating_wait
> > being 0 and if so set it to 0xff.
> > 
> 
> Sorry, I was intended to give clk_gating_wait_us values only if it is
> a UFS3.0 device. I will revise patch 6/8.
> 

Okay, sounds good.

> > > +				udelay(1);
> > > +			} else {
> > > +				/*
> > > +				 * bRefClkGatingWaitTime defines the minimum
> > > +				 * time for which the reference clock is
> > > +				 * required by device during transition from
> > > +				 * HS-MODE to LS-MODE or HIBERN8 state. Give it
> > > +				 * more time to be on the safe side.
> > > +				 */
> > > +				gating_wait += 10;
> > > +				usleep_range(gating_wait, gating_wait + 10);
> > 
> > I presume there's no strong requirement on the max, so how about using a
> > substantially larger max - say 1k, or 10k - to allow the usleep_range()
> > to do it's job?
> > 
> > 
> > PS. Please include linux-arm-msm@ on all the patches in the series, not
> > just two of them.
> > 
> > Regards,
> > Bjorn
> > 
> 
> bRefClkGatingWaitTime, as vendor defined in their device attribute is
> usually
> around 50~100, 1k or 10k delay makes it too large. usleep_range() works well
> so long as the delay is within (10us - 20ms), so I added 10 to make sure it
> is
> above 10us.
> 

I meant specifically the second parameter, i.e:
  usleep_range(bRefClkGatingWaitTime + 10, bRefClkGatingWaitTime + 1000);

As you're not guaranteed an upper bound of this sleep anyway you might
as well give usleep_range() a window of a millisecond (or more) to give
it the flexibility of matching other timer events.

The only drawback with this is that you might "waste" a millisecond.

Regards,
Bjorn

> SLEEPING FOR ~USECS OR SMALL MSECS ( 10us - 20ms):
> 	* Use usleep_range
> https://www.kernel.org/doc/Documentation/timers/timers-howto.txt
> 
> Thanks,
> 
> Can Guo.
> 
> > > +			}
> > > +		}
> > > 
> > >  		writel_relaxed(temp, host->dev_ref_clk_ctrl_mmio);
> > > 
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > a Linux Foundation Collaborative Project
