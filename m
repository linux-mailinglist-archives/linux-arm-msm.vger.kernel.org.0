Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F9AFD3BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 05:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfKOElv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 23:41:51 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:58068 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfKOElv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 23:41:51 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E30A460D95; Fri, 15 Nov 2019 04:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573792910;
        bh=qsY5NenwafRfeqjlDioZWx/vkOeWR9D5y1vVlLbgoPI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Q70FVA6moXftxoDhvUwU4Qd0mMiHieqsB98hyh/6g9ebA99MykXE9bjRibt0mbTNt
         oNXEwstNsBi0yteOZHLLykGKjCV70/Nu0JXtTfjJa5J989VzP4lHUTrlKKHweO05Em
         Q/UmbTZ4e0oc3H22UtlolDUKO3FyVLwClnEMeBzw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E95860590;
        Fri, 15 Nov 2019 04:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573792910;
        bh=qsY5NenwafRfeqjlDioZWx/vkOeWR9D5y1vVlLbgoPI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Q70FVA6moXftxoDhvUwU4Qd0mMiHieqsB98hyh/6g9ebA99MykXE9bjRibt0mbTNt
         oNXEwstNsBi0yteOZHLLykGKjCV70/Nu0JXtTfjJa5J989VzP4lHUTrlKKHweO05Em
         Q/UmbTZ4e0oc3H22UtlolDUKO3FyVLwClnEMeBzw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E95860590
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v5 1/3] tty: serial: qcom_geni_serial: IRQ cleanup
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, swboyd@chromium.org,
        msavaliy@codeaurora.org
References: <1573642111-17479-1-git-send-email-akashast@codeaurora.org>
 <20191113105603.GA2083219@kroah.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <8aacf270-7e0f-8f8f-aac6-4cdaf6d3fd21@codeaurora.org>
Date:   Fri, 15 Nov 2019 10:11:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113105603.GA2083219@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/13/2019 4:26 PM, Greg KH wrote:
> On Wed, Nov 13, 2019 at 04:18:31PM +0530, Akash Asthana wrote:
>> Move ISR registration from startup to probe function to avoid registering
>> it everytime when the port open is called for driver.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in v5:
>>   - No change.
> This series does not apply at all to my tty-next branch of my tty git
> tree.  What did you make it against?  Please rebase it and resend so
> that it can be applied.
>
> thanks,
>
> greg k-h

Please revert below 2 commits and apply the patches in series.

1) 8b7103f31950443fd5727d7d80d3c65416b5a390   (v2 patch)

2) 3e4aaea7a0391d47f6ffff1f10594c658a67c881 (v2 patch)

I have verified the same on tty-next branch, it's applying cleanly.

Thanks,

Akash


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

