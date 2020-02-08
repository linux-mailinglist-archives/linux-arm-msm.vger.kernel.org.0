Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 111821561CE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2020 01:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgBHALA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 19:11:00 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59889 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727065AbgBHAK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 19:10:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581120659; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mBHOswO4oUaWR11Gs/cziyPwcq8fjMTZ4et+RwKy2M8=;
 b=cbrCyqF4hYdKW0HCfFZ88D+BIfB5VuABO4XD0Pl1tL5UegT+/V8B0tEALYPbWNkjtppgHO1j
 1NjSDESIxujfv1F7wEpyXn5RK2FWQKJo7u7s0jcyWsmjDd5+5n2uPBJNk6NjqqlTToTNUXu/
 ML7xc4j1wU1VIKr5Lyq75R/ic4k=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3dfc91.7f06759743e8-smtp-out-n02;
 Sat, 08 Feb 2020 00:10:57 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2D65C433A2; Sat,  8 Feb 2020 00:10:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B6BFFC43383;
        Sat,  8 Feb 2020 00:10:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 08 Feb 2020 08:10:55 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
In-Reply-To: <20200207021036.GT2514@yoga>
References: <1580978008-9327-1-git-send-email-cang@codeaurora.org>
 <1580978008-9327-8-git-send-email-cang@codeaurora.org>
 <20200206203336.GQ2514@yoga>
 <9de3632cf0c65347684b8c5f4f3c63b3@codeaurora.org>
 <20200207021036.GT2514@yoga>
Message-ID: <745307fd2a9e2e25f4fb2dd2c985e680@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-07 10:10, Bjorn Andersson wrote:
> On Thu 06 Feb 17:09 PST 2020, Can Guo wrote:
> 
>> On 2020-02-07 04:33, Bjorn Andersson wrote:
>> > On Thu 06 Feb 00:33 PST 2020, Can Guo wrote:
>> >
>> > > After enter hibern8, as UFS JEDEC ver 3.0 requires, a specific
>> > > gating wait
>> > > time is required before disable the device reference clock. If it is
>> > > not
>> > > specified, use the old delay.
>> > >
>> > > Signed-off-by: Can Guo <cang@codeaurora.org>
>> > > Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
>> > > Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
>> > > ---
>> > >  drivers/scsi/ufs/ufs-qcom.c | 22 +++++++++++++++++++---
>> > >  1 file changed, 19 insertions(+), 3 deletions(-)
>> > >
>> > > diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
>> > > index 85d7c17..39eefa4 100644
>> > > --- a/drivers/scsi/ufs/ufs-qcom.c
>> > > +++ b/drivers/scsi/ufs/ufs-qcom.c
>> > > @@ -833,6 +833,8 @@ static int ufs_qcom_bus_register(struct
>> > > ufs_qcom_host *host)
>> > >
>> > >  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host,
>> > > bool enable)
>> > >  {
>> > > +	unsigned long gating_wait;
>> > > +
>> > >  	if (host->dev_ref_clk_ctrl_mmio &&
>> > >  	    (enable ^ host->is_dev_ref_clk_enabled)) {
>> > >  		u32 temp = readl_relaxed(host->dev_ref_clk_ctrl_mmio);
>> > > @@ -845,11 +847,25 @@ static void ufs_qcom_dev_ref_clk_ctrl(struct
>> > > ufs_qcom_host *host, bool enable)
>> > >  		/*
>> > >  		 * If we are here to disable this clock it might be immediately
>> > >  		 * after entering into hibern8 in which case we need to make
>> > > -		 * sure that device ref_clk is active at least 1us after the
>> > > +		 * sure that device ref_clk is active for specific time after
>> > >  		 * hibern8 enter.
>> > >  		 */
>> > > -		if (!enable)
>> > > -			udelay(1);
>> > > +		if (!enable) {
>> > > +			gating_wait = host->hba->dev_info.clk_gating_wait_us;
>> > > +			if (!gating_wait) {
>> >
>> > Afaict this can't happen, because in patch 6 you check for gating_wait
>> > being 0 and if so set it to 0xff.
>> >
>> 
>> Sorry, I was intended to give clk_gating_wait_us values only if it is
>> a UFS3.0 device. I will revise patch 6/8.
>> 
> 
> Okay, sounds good.
> 
>> > > +				udelay(1);
>> > > +			} else {
>> > > +				/*
>> > > +				 * bRefClkGatingWaitTime defines the minimum
>> > > +				 * time for which the reference clock is
>> > > +				 * required by device during transition from
>> > > +				 * HS-MODE to LS-MODE or HIBERN8 state. Give it
>> > > +				 * more time to be on the safe side.
>> > > +				 */
>> > > +				gating_wait += 10;
>> > > +				usleep_range(gating_wait, gating_wait + 10);
>> >
>> > I presume there's no strong requirement on the max, so how about using a
>> > substantially larger max - say 1k, or 10k - to allow the usleep_range()
>> > to do it's job?
>> >
>> >
>> > PS. Please include linux-arm-msm@ on all the patches in the series, not
>> > just two of them.
>> >
>> > Regards,
>> > Bjorn
>> >
>> 
>> bRefClkGatingWaitTime, as vendor defined in their device attribute is
>> usually
>> around 50~100, 1k or 10k delay makes it too large. usleep_range() 
>> works well
>> so long as the delay is within (10us - 20ms), so I added 10 to make 
>> sure it
>> is
>> above 10us.
>> 
> 
> I meant specifically the second parameter, i.e:
>   usleep_range(bRefClkGatingWaitTime + 10, bRefClkGatingWaitTime + 
> 1000);
> 
> As you're not guaranteed an upper bound of this sleep anyway you might
> as well give usleep_range() a window of a millisecond (or more) to give
> it the flexibility of matching other timer events.
> 
> The only drawback with this is that you might "waste" a millisecond.
> 
> Regards,
> Bjorn
> 

Hi Bjorn,

Device ref clk gate/ungate can happen very frequently if clk gating is
enabled. The "wasted" milliseconds might be accumulated to affect
read/write latency, i.e:

If read/write requests come, clk ungate kicks start, it flushes ongoing
gate work if any, if we "waste" a millisecond here, the read/write
requests will be delayed a millisecond. I am not sure how much it may
impact the overall performance in a long term test.

Thanks,

Can Guo.

>> SLEEPING FOR ~USECS OR SMALL MSECS ( 10us - 20ms):
>> 	* Use usleep_range
>> https://www.kernel.org/doc/Documentation/timers/timers-howto.txt
>> 
>> Thanks,
>> 
>> Can Guo.
>> 
>> > > +			}
>> > > +		}
>> > >
>> > >  		writel_relaxed(temp, host->dev_ref_clk_ctrl_mmio);
>> > >
>> > > --
>> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> > > Forum,
>> > > a Linux Foundation Collaborative Project
