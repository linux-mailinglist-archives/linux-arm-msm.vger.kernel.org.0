Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B662334E7DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 14:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbhC3MtJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 08:49:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42369 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbhC3MtH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 08:49:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617108546; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=96qHzHGoEEUmPTxHIx4FwcAj71je9EFrRv4IZ94Y4BU=;
 b=dRWRUsG1jkFq8rfV0zOrJ+4/jFc3pXQBzT5k2LVdxv8h/roOUDM6R+eoCHAr5xutgb80DOWp
 l13nkNH0SOUGx5NtThld+cI5Mt2JC2+Kpu5xod/Vri9pW1gwny9U0qdX2sbXpFvyN0gDsXM4
 M+k8pNI2lJ0hLYw4u8YEy12P7OY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60631e2c0a4a07ffdade47fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 12:48:44
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4C1F7C43461; Tue, 30 Mar 2021 12:48:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E52CDC433C6;
        Tue, 30 Mar 2021 12:48:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 30 Mar 2021 18:18:43 +0530
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
In-Reply-To: <YGMIoM3xIZzRvU3i@kroah.com>
References: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
 <YF3jfshT3OSolcws@kroah.com>
 <e1afc071-57a6-5d7f-b467-92b618419b76@codeaurora.org>
 <YGLqXI8HOaOrMq1B@kroah.com>
 <d2348b758fa57acf53885b67f066e0a1@codeaurora.org>
 <YGMIoM3xIZzRvU3i@kroah.com>
Message-ID: <c984ff015109ed606d2933125d385015@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-30 16:46, Greg Kroah-Hartman wrote:
> On Tue, Mar 30, 2021 at 03:25:58PM +0530, Sai Prakash Ranjan wrote:
>> On 2021-03-30 14:37, Greg Kroah-Hartman wrote:
>> > On Tue, Mar 30, 2021 at 02:12:04PM +0530, Sandeep Maheswaram wrote:
>> > >
>> > > On 3/26/2021 7:07 PM, Greg Kroah-Hartman wrote:
>> > > > On Wed, Mar 24, 2021 at 12:57:32AM +0530, Sandeep Maheswaram wrote:
>> > > > > This patch adds a shutdown callback to USB DWC core driver to ensure that
>> > > > > it is properly shutdown in reboot/shutdown path. This is required
>> > > > > where SMMU address translation is enabled like on SC7180
>> > > > > SoC and few others. If the hardware is still accessing memory after
>> > > > > SMMU translation is disabled as part of SMMU shutdown callback in
>> > > > > system reboot or shutdown path, then IOVAs(I/O virtual address)
>> > > > > which it was using will go on the bus as the physical addresses which
>> > > > > might result in unknown crashes (NoC/interconnect errors).
>> > > > >
>> > > > > Previously this was added in dwc3 qcom glue driver.
>> > > > > https://patchwork.kernel.org/project/linux-arm-msm/list/?series=382449
>> > > > > But observed kernel panic as glue driver shutdown getting called after
>> > > > > iommu shutdown. As we are adding iommu nodes in dwc core node
>> > > > > in device tree adding shutdown callback in core driver seems correct.
>> > > > So shouldn't you also remove this from the qcom glue driver at the same
>> > > > time?  Please submit both as a patch series.
>> > > >
>> > > > thanks,
>> > > >
>> > > > greg k-h
>> > >
>> > > Hi Greg,
>> > >
>> > > The qcom glue driver patch is not merged yet. I have just mentioned
>> > > for it for reference.
>> >
>> > You know that we can not add callbacks for no in-kernel user, so what
>> > good is this patch for now?
>> >
>> 
>> What in-kernel user? Since when does shutdown callback need an 
>> in-kernel
>> user? When you reboot or shutdown a system, it gets called. The reason
>> why the shutdown callback is needed is provided in the commit text.
> 
> As I can't see the patch here, I have no idea...

You are replying now to the same patch which adds this shutdown callback 
:)
Anyways the qcom dwc3 driver patch which is abandoned which is also 
mentioned
in the commit text is here [1] and the new shutdown callback patch which 
we
are both replying to is in here [2]

[1] 
https://lore.kernel.org/lkml/1605162619-10064-1-git-send-email-sanm@codeaurora.org/

[2] 
https://lore.kernel.org/lkml/1616527652-7937-1-git-send-email-sanm@codeaurora.org/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
