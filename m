Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2EBC34E365
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 10:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhC3Imv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 04:42:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:29813 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbhC3Ime (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 04:42:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617093754; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=6ZBUFntkKzGQ6dG5LrEqdA+1MgShIPk4qTagF0K+hzk=; b=mhYa+o4AEAQI6TpJij4z9jmIp9ImuiuEccrrfe8f/EGVZEoc/eoRJn4bCkCinZxuJMOtHXg9
 WTCFJTMaG0DbEJaW/IxkTsTRuWUC5V8P5goLn/OCVhGkAlShRjb7H2wgOJsO/UJkM2kJrs/y
 TnJPUvtjBjc7Tw/nSf+5WLwhJr8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6062e465c39407c327260d24 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 08:42:13
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 566FFC433CA; Tue, 30 Mar 2021 08:42:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.252.226.205] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EDD28C433C6;
        Tue, 30 Mar 2021 08:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EDD28C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v1] usb: dwc3: core: Add shutdown callback for dwc3
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
References: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
 <YF3jfshT3OSolcws@kroah.com>
From:   Sandeep Maheswaram <sanm@codeaurora.org>
Message-ID: <e1afc071-57a6-5d7f-b467-92b618419b76@codeaurora.org>
Date:   Tue, 30 Mar 2021 14:12:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YF3jfshT3OSolcws@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/26/2021 7:07 PM, Greg Kroah-Hartman wrote:
> On Wed, Mar 24, 2021 at 12:57:32AM +0530, Sandeep Maheswaram wrote:
>> This patch adds a shutdown callback to USB DWC core driver to ensure that
>> it is properly shutdown in reboot/shutdown path. This is required
>> where SMMU address translation is enabled like on SC7180
>> SoC and few others. If the hardware is still accessing memory after
>> SMMU translation is disabled as part of SMMU shutdown callback in
>> system reboot or shutdown path, then IOVAs(I/O virtual address)
>> which it was using will go on the bus as the physical addresses which
>> might result in unknown crashes (NoC/interconnect errors).
>>
>> Previously this was added in dwc3 qcom glue driver.
>> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=382449
>> But observed kernel panic as glue driver shutdown getting called after
>> iommu shutdown. As we are adding iommu nodes in dwc core node
>> in device tree adding shutdown callback in core driver seems correct.
> So shouldn't you also remove this from the qcom glue driver at the same
> time?  Please submit both as a patch series.
>
> thanks,
>
> greg k-h

Hi Greg,

The qcom glue driver patch is not merged yet. I have just mentioned for it for reference.

Regards
Sandeep


