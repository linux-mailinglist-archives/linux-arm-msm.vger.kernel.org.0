Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC2E3E7E2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 19:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbhHJRZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 13:25:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40700 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229470AbhHJRZV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 13:25:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628616298; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+3yCOOv0STMKM7fB/JrNNxWZsSbOgMZ8PpxGIFa4PSQ=;
 b=nQ4CU/wswSA8m0ddq3U528AwZwGOZTSnspjnw5J122sDdM9YZSdHpD5cqhQqBJ8PAujyaBeZ
 DpLjeRU5CH2u/z7rzKS4tf2baOnskY38DO1ZenbKOyt9TcoCvrVUmsqp3EOVlHFYOUumT6jm
 HOQF/9WnvQSpaptEv1jkSVFRH34=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6112b651454b7a558f5d8e68 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 17:24:33
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6B5B7C43460; Tue, 10 Aug 2021 17:24:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4613C433D3;
        Tue, 10 Aug 2021 17:24:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Aug 2021 22:54:32 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V1 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P
 IRQ
In-Reply-To: <CAE-0n53ojhs+RMpsYtVjsrYbb_PRdkJOvxFhiTtJPMUDuoP_eA@mail.gmail.com>
References: <1628180254-758-1-git-send-email-deesin@codeaurora.org>
 <CAE-0n5203g4CkF5WP1fQYU57fntXbdyVBsMsTKU_xPkgvbt+7Q@mail.gmail.com>
 <bf2b00c5-0826-00d2-ca95-b4ae6a030211@codeaurora.org>
 <CAE-0n53ojhs+RMpsYtVjsrYbb_PRdkJOvxFhiTtJPMUDuoP_eA@mail.gmail.com>
Message-ID: <8009f5a1458468dbf0b7b20dd166911c@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-09 23:28, Stephen Boyd wrote:
> Quoting Deepak Kumar Singh (2021-08-09 04:05:08)
>> 
>> On 8/6/2021 1:10 AM, Stephen Boyd wrote:
>> > Quoting Deepak Kumar Singh (2021-08-05 09:17:33)
>> >> Some use cases require SMP2P interrupts to wake up the host
>> >> from suspend.
>> > Please elaborate on this point so we understand what sort of scenarios
>> > want to wakeup from suspend.
>> 
>> Once such scenario is where WiFi/modem crashes and notifies crash to
>> local host through smp2p
>> 
>> if local host is in suspend it should wake up to handle the crash and
>> reboot the WiFi/modem.
> 
> Does anything go wrong if the firmware crashes during suspend and the
> local host doesn't handle it until it wakes for some other reason? I'd
> like to understand if the crash handling can be delayed/combined with
> another wakeup.

If the modem firmware crashes
during suspend, the system comes
out of xo-shutdown and AFAIK stays
there until we handle the interrupt.

> 
>> 
>> >> Mark smp2p interrupt as wakeup capable to abort
>> >> the suspend.
>> >>
>> >> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
>> >> ---
>> >>   drivers/soc/qcom/smp2p.c | 11 +++++++++++
>> >>   1 file changed, 11 insertions(+)
>> >>
>> >> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>> >> index 2df4883..f8659b0 100644
>> >> --- a/drivers/soc/qcom/smp2p.c
>> >> +++ b/drivers/soc/qcom/smp2p.c
>> >> @@ -18,6 +18,7 @@
>> >>   #include <linux/soc/qcom/smem.h>
>> >>   #include <linux/soc/qcom/smem_state.h>
>> >>   #include <linux/spinlock.h>
>> >> +#include <linux/pm_wakeirq.h>
>> >>
>> >>   /*
>> >>    * The Shared Memory Point to Point (SMP2P) protocol facilitates communication
>> >> @@ -538,9 +539,19 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>> >>                  goto unwind_interfaces;
>> >>          }
>> >>
>> >> +       ret = device_init_wakeup(&pdev->dev, true);
>> > Is smp2p supposed to wake up the device by default? If not, then this
>> > should be device_set_wakeup_capable() instead so that userspace can
>> > decide if it wants to get the wakeup.
>> yes, we want smp2p to be wake up capable by default.
> 
> Why?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
