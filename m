Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808A021E790
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 07:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgGNFeZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 01:34:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23527 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbgGNFeZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 01:34:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594704864; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ILPa8NO9W+lRh2reT/2n5OpGYrcFvUffhW4ZNUiY2zA=; b=KI+Nh5AgIJFh20vEmWJqDOBDLQVmd3f3+E7k67k5bXmZp4soqMjwsL3OoDhxJ2UoxogJwXfp
 MmQ9ZcGOD6zC0+ppuTDuShDwUsCRT6ZEiipw6SXcJXdS3/qFXSuS7GrKDahLb6Nxu2XjrWTs
 /Y02nU8tcDMX7RXNv0ZGE/5zZNs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f0d43d1512812c070dd1bbc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 05:34:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 24D71C433A0; Tue, 14 Jul 2020 05:34:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.11] (unknown [61.3.18.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AF8CC433CA;
        Tue, 14 Jul 2020 05:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3AF8CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH] tty: serial: qcom-geni-serial: Drop the icc bw votes in
 suspend for console
To:     Doug Anderson <dianders@chromium.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-serial@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
References: <1594287420-24141-1-git-send-email-rnayak@codeaurora.org>
 <20200710124152.GC1567243@kroah.com>
 <CAD=FV=XJQaAHsDb6uvKpwU87qtqTQgNeoiuRr2kF9pqjBLhLpg@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <18c235bc-03ce-e2f4-6d95-edff0fdf3edb@codeaurora.org>
Date:   Tue, 14 Jul 2020 11:04:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XJQaAHsDb6uvKpwU87qtqTQgNeoiuRr2kF9pqjBLhLpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/14/2020 6:23 AM, Doug Anderson wrote:
> Rajendra,
> 
> On Fri, Jul 10, 2020 at 5:41 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Thu, Jul 09, 2020 at 03:07:00PM +0530, Rajendra Nayak wrote:
>>> When using the geni-serial as console, its important to be
>>> able to hit the lowest possible power state in suspend,
>>> even with no_console_suspend.
>>> The only thing that prevents it today on platforms like the sc7180
>>> is the interconnect BW votes, which we certainly don't need when
>>> the system is in suspend. So in the suspend handler mark them as
>>> ACTIVE_ONLY (0x3) and on resume switch them back to the ALWAYS tag (0x7)
>>>
>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>> ---
>>> Note: Patch applies on qcom for-next, which has the ICC support patches.
>>> The tag macros are currently not exported and hence the hardcoded values.
>>> Perhaps if and when https://patchwork.kernel.org/patch/11619705/ lands I
>>> can refresh this patch to use the macros.
>>
>> Feel free to take this patch through that tree.
>>
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Could you post a v2?  Bjorn landed some of my geni serial patches to
> make console / kgdb work better, but then I realized that your patch
> no longer applies cleanly.  It's trivial to resolve, so hopefully a v2
> should be quick and then Bjorn can land?

Thanks, just rebased and posted the v2.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
