Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEED2CB28C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 02:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgLBBzd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 20:55:33 -0500
Received: from a2.mail.mailgun.net ([198.61.254.61]:48638 "EHLO
        a2.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727353AbgLBBzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 20:55:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606874112; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BnyxjXqEk5yk7KEKz1/03TQQUICAWWNCXj6MrCoyyxw=;
 b=Cb1IgFJ7HlObJ8TGa6GZLte+6vM8xUSa/le7cGn12mxlLJxNfosjsCMbY7xtOCrHBjy/CV+m
 P4jdoC2hSFF5FeKK06M7jJhvHl1vU109B0gSUx4agCI+yYAC6Wvbm6HNiZMCYwVew9vdMxhC
 e7EmRN8Q6ilka3TBizIRd1vR+tI=
X-Mailgun-Sending-Ip: 198.61.254.61
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fc6f3e17edc97d061147b90 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 01:54:41
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 229BBC433C6; Wed,  2 Dec 2020 01:54:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5CE3EC433ED;
        Wed,  2 Dec 2020 01:54:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Dec 2020 17:54:40 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/8] mhi: pci-generic: Perform hard reset on remove
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi83hzkW7bpWddFsF6PeRqna6T8ye0QZ51NHz2r5AxpgHA@mail.gmail.com>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-3-git-send-email-loic.poulain@linaro.org>
 <ad4fa874-163a-227b-3291-727b1ee27f06@codeaurora.org>
 <CAMZdPi8pOVB6rsERsbyLEkRuf4tjNaC-eZa1mFnyiTBws1K9=Q@mail.gmail.com>
 <f964e9ff-b2f3-dde4-13d8-9fc711b899da@codeaurora.org>
 <CAMZdPi83hzkW7bpWddFsF6PeRqna6T8ye0QZ51NHz2r5AxpgHA@mail.gmail.com>
Message-ID: <41e6561d138ddc3a63c834a1f857bd09@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-27 08:21 AM, Loic Poulain wrote:
> Hi Jeffrey,
> 
> On Wed, 25 Nov 2020 at 18:41, Jeffrey Hugo <jhugo@codeaurora.org> 
> wrote:
>> >>> @@ -329,6 +336,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>> >>>        mhi_power_down(mhi_cntrl, true);
>> >>>        mhi_unprepare_after_power_down(mhi_cntrl);
>> >>>        mhi_unregister_controller(mhi_cntrl);
>> >>> +
>> >>> +     /* MHI-layer reset could not be enough, always hard-reset the device */
>> >>> +     mhi_pci_reset(mhi_cntrl);
>> >>
>> >> Referring to MHI spec:
>> >> Hosts writes this register to trigger a reset. This can be used when the
>> >> host detects a timeout in the MHI protocol and can use the reset as a
>> >> last resort to recover the device. Host should first attempt an MHI
>> >> Reset procedure before resetting the entire device.
>> >>
>> >> What issue are you facing which requires you to do full device reset ?
>> >> Based on the spec recommendation, looks like this should be a last resort.
>> >
>> > On module unload/reload, the device does not go through cold reset and
>> > can be in error state on further reload, causing mhi power up to fail.
>> > This patch simply resets the device in remove so that it is in the
>> > exact same condition as before probing (not only MHI layer, but all
>> > the device context), I think it makes sense and prevents any
>> > unexpected state on further reloading. Note also that unloading the
>> > module (or unbinding the device) is not something that usually
>> > happens, except when the user does it explicitly for any reason.
>> 
>> This seems unnecessary to me.  Qaic has the same usecase, and the MHI
>> state machine reset is sufficient.  Perhaps you have a unique edge 
>> case
>> though.
>> 
>> However, you are implementing the soc_reset functionality in your
>> driver, when its a common MHI functionality, and is something I would
>> like to use.  If you dig back, I proposed a sysfs extension to expose
>> that to userspace, but I have a desire to use it from my driver, same 
>> as
>> you.
>> 
>> Would you please make MHI core changes to expose the soc_reset
>> functionality out so that multiple drivers can use a common 
>> implementation?
> 
> I overlooked this reply, going to move that into MHI core, as you 
> suggested.
> 
> Thanks,
> Loic
Yes, this makes sense to do as Jeff suggested.
Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
