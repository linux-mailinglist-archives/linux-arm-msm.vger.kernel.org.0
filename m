Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63520445C6A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 23:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhKDWxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 18:53:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32429 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230000AbhKDWxl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 18:53:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636066262; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wKjp9rL24bkOTuedmNehWXbt+U25C8y60YQEghTVf9o=;
 b=e1tW/ggAm9PruTjofelk+TaDWlhZBnLDTL9JFW17wv3jkaSIp5NzXqGE0O6IeeqxBCJTv4TA
 WwUaJUB8nCR69oUma5lHu+4w2+fStANRJtZ68ah46zf03ta2rycrtmmK+FHOhe1TemfNHSuh
 du6ZfsxHcuzFujlxGwOGpRZAO8Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 618463d33893bc04200b6012 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Nov 2021 22:50:59
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 99743C4338F; Thu,  4 Nov 2021 22:50:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6B7CC4360C;
        Thu,  4 Nov 2021 22:50:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 04 Nov 2021 15:50:57 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Aleksander Morgado <aleksander@aleksander.es>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi9+zrsDy9WTipamRWBXMOxUX1tfsk2W52b9wG-4q21fWA@mail.gmail.com>
References: <20211009105132.GA204538@thinkpad>
 <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
 <20211022044229.GD3138@workstation>
 <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
 <20211022144026.GA7657@thinkpad>
 <CAAP7ucJGkAKqyvUJJnCgX8AejsHSaY0AeAxKoCJahAeVLw5ThQ@mail.gmail.com>
 <20211102105035.GB5646@thinkpad>
 <CAAP7ucLVtOR7+NJiWK_is0yv+zWKB9vmxpy4PyO5FQdVUE6uzA@mail.gmail.com>
 <20211102162259.GC5646@thinkpad>
 <CAAP7ucLLaYVBgLU7Fp5r21wtnqBhoYK-+9=qr3Rf1O1S81xDBw@mail.gmail.com>
 <20211102180912.GD5646@thinkpad>
 <CAMZdPi9+zrsDy9WTipamRWBXMOxUX1tfsk2W52b9wG-4q21fWA@mail.gmail.com>
Message-ID: <bb0efc0dbc49aec3eaa099ca5b0d0e5a@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 2021-11-02 01:47 PM, Loic Poulain wrote:
> Hi Mani,
> 
> Le mar. 2 nov. 2021 à 19:09, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> a écrit :
> 
>> On Tue, Nov 02, 2021 at 05:55:34PM +0100, Aleksander Morgado wrote:
>>>> > > > [    7.189547] mhi mhi0: Transitioning from PM state:
>> Linkdown or
>>>> > > > Error Fatal Detect to: SYS ERROR Process
>>>> > >
>>>> > > Hmm, I think the use of sync_power_up might be causing the
>> issue here as it
>>>> > > forces the MHI state to fatal error.
>>>> > >
>>>> > > Ignore the previous diff and try the below one:
>>>> > >
>>>> > > diff --git a/drivers/bus/mhi/pci_generic.c
>> b/drivers/bus/mhi/pci_generic.c
>>>> > > index 59a4896a8030..b1e8c7de4e54 100644
>>>> > > --- a/drivers/bus/mhi/pci_generic.c
>>>> > > +++ b/drivers/bus/mhi/pci_generic.c
>>>> > > @@ -637,7 +637,7 @@ static void mhi_pci_recovery_work(struct
>> work_struct *work)
>>>> > >         if (err)
>>>> > >                 goto err_try_reset;
>>>> > >
>>>> > > -       err = mhi_sync_power_up(mhi_cntrl);
>>>> > > +       err = mhi_async_power_up(mhi_cntrl);
>>>> 
>>>> Doh! Sorry, I modified the wrong function. Here is the correct
>> one:
>>>> 
>>>> diff --git a/drivers/bus/mhi/pci_generic.c
>> b/drivers/bus/mhi/pci_generic.c
>>>> index 59a4896a8030..1e3c74bfbe34 100644
>>>> --- a/drivers/bus/mhi/pci_generic.c
>>>> +++ b/drivers/bus/mhi/pci_generic.c
>>>> @@ -743,7 +743,7 @@ static int mhi_pci_probe(struct pci_dev
>> *pdev, const struct pci_device_id *id)
>>>>                 goto err_unregister;
>>>>         }
>>>> 
>>>> -       err = mhi_sync_power_up(mhi_cntrl);
>>>> +       err = mhi_async_power_up(mhi_cntrl);
>>>>         if (err) {
>>>>                 dev_err(&pdev->dev, "failed to power up MHI
>> controller\n");
>>>>                 goto err_unprepare;
>>>> 
>>>> Let's see how it goes :)
>>>> 
>>> 
>>> Oh, wow, what a difference a single extra byte in the correct
>> place makes! :D
>>> 
>>> This looks waaaaay better; I've rebooted the board at least 10
>> times
>>> now and all of them worked nicely, at least just the process to
>> probe
>>> the device and get the control and net ports exposed looks very
>>> reliable now. I'll test the setup with ModemManager in the next
>> days
>>> and see how everything goes. Thank you very much!
>>> 
>> 
>> That's great to hear! Let me know how your testing goes with
>> ModemManager. I'll
>> then submit a patch to fix the pci-generic driver.
> 
> I’ve not followed entirely what is going wrong, so I may miss the
> point here, but the sync and async function should behave  the same
> regarding device initialization, wouldn’t make sense to fix the core
> instead? Is the _sync variant broken?
> 
> Regards,
> Loic

Yes both variants should behave the same way. Mani, Hemant and I spoke 
about this
and saw there could be improvements in core mhi_async_power_up().

I believe Mani will come up with a patch soon.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
