Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3036234E4E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 11:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhC3J4P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 05:56:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51273 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231721AbhC3J4B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 05:56:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617098160; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kZkHy+TZAIF7RJSqiEdvPgs5x2iX75AYeXHJhVDx5x8=;
 b=Zbx0Yrwa+I0q+nlzpNMVwOJ1Aupui5sipfGKEp7e/hivSSv6ptM3A6TeydNH4rSA1DeRZysh
 /lzu4psmY2nriJSXgs2+xyiVJkBGTiTSZLZJcBVhONT1Wb+iiKDmznvDkhuUvao+0/+KBC8f
 UVPoo4EyY9JysJnhLSN9imYZVsQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6062f5b00a4a07ffda6603fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 09:56:00
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92F4AC433C6; Tue, 30 Mar 2021 09:55:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFFB7C433ED;
        Tue, 30 Mar 2021 09:55:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 30 Mar 2021 15:25:58 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v1] usb: dwc3: core: Add shutdown callback for dwc3
In-Reply-To: <YGLqXI8HOaOrMq1B@kroah.com>
References: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
 <YF3jfshT3OSolcws@kroah.com>
 <e1afc071-57a6-5d7f-b467-92b618419b76@codeaurora.org>
 <YGLqXI8HOaOrMq1B@kroah.com>
Message-ID: <d2348b758fa57acf53885b67f066e0a1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-30 14:37, Greg Kroah-Hartman wrote:
> On Tue, Mar 30, 2021 at 02:12:04PM +0530, Sandeep Maheswaram wrote:
>> 
>> On 3/26/2021 7:07 PM, Greg Kroah-Hartman wrote:
>> > On Wed, Mar 24, 2021 at 12:57:32AM +0530, Sandeep Maheswaram wrote:
>> > > This patch adds a shutdown callback to USB DWC core driver to ensure that
>> > > it is properly shutdown in reboot/shutdown path. This is required
>> > > where SMMU address translation is enabled like on SC7180
>> > > SoC and few others. If the hardware is still accessing memory after
>> > > SMMU translation is disabled as part of SMMU shutdown callback in
>> > > system reboot or shutdown path, then IOVAs(I/O virtual address)
>> > > which it was using will go on the bus as the physical addresses which
>> > > might result in unknown crashes (NoC/interconnect errors).
>> > >
>> > > Previously this was added in dwc3 qcom glue driver.
>> > > https://patchwork.kernel.org/project/linux-arm-msm/list/?series=382449
>> > > But observed kernel panic as glue driver shutdown getting called after
>> > > iommu shutdown. As we are adding iommu nodes in dwc core node
>> > > in device tree adding shutdown callback in core driver seems correct.
>> > So shouldn't you also remove this from the qcom glue driver at the same
>> > time?  Please submit both as a patch series.
>> >
>> > thanks,
>> >
>> > greg k-h
>> 
>> Hi Greg,
>> 
>> The qcom glue driver patch is not merged yet. I have just mentioned 
>> for it for reference.
> 
> You know that we can not add callbacks for no in-kernel user, so what
> good is this patch for now?
> 

What in-kernel user? Since when does shutdown callback need an in-kernel
user? When you reboot or shutdown a system, it gets called. The reason
why the shutdown callback is needed is provided in the commit text.

Confused,
Sai Prakash Ranjan

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
