Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78E438DF4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 04:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhEXCkT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 May 2021 22:40:19 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27477 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbhEXCkT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 May 2021 22:40:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621823932; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SHZ5ZXlQ2XAJJVf50lE0WJ4HIJjhPbLN965o60VkVL0=;
 b=X9fKZwX7yX1VzUyw78vLgj+M9Y464snOxN5Gw1/4Zs+MCajDxjs1TDvWAKGdtmzpY6nk1TLz
 oAh9OG50EcdOY3juFbE1EJDh8/3l660/d38E5+0NNCA7qH0ljazrhKCLPtSg1XbdSGzzDE8o
 /hGt2/7gCWU09qvisrXAvuzvMIw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60ab11b27b5af81b5c87273f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 02:38:42
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2CC8BC433F1; Mon, 24 May 2021 02:38:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 774F7C4338A;
        Mon, 24 May 2021 02:38:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 May 2021 08:08:39 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: qcom: Move suspend/resume to
 suspend_late/resume_early
In-Reply-To: <948130ae3a0781eb19b7431059852c23@codeaurora.org>
References: <20210310202004.1436-1-saiprakash.ranjan@codeaurora.org>
 <20210310202327.GA237124@roeck-us.net>
 <948130ae3a0781eb19b7431059852c23@codeaurora.org>
Message-ID: <7bbfb6af534c22cd1e50f16aadd412c1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-20 11:13, Sai Prakash Ranjan wrote:
> Hi Guenter,
> 
> On 2021-03-11 01:53, Guenter Roeck wrote:
>> On Thu, Mar 11, 2021 at 01:50:04AM +0530, Sai Prakash Ranjan wrote:
>>> During suspend/resume usecases and tests, it is common to see issues
>>> such as lockups either in suspend path or resume path because of the
>>> bugs in the corresponding device driver pm handling code. In such 
>>> cases,
>>> it is important that watchdog is active to make sure that we either
>>> receive a watchdog pretimeout notification or a bite causing reset
>>> instead of a hang causing us to hard reset the machine.
>>> 
>>> There are good reasons as to why we need this because:
>>> 
>>> * We can have a watchdog pretimeout governor set to panic in which
>>>   case we can have a backtrace which would help identify the issue
>>>   with the particular driver and cause a normal reboot.
>>> 
>>> * Even in case where there is no pretimeout support, a watchdog
>>>   bite is still useful because some firmware has debug support to 
>>> dump
>>>   CPU core context on watchdog bite for post-mortem analysis.
>>> 
>>> * One more usecase which comes to mind is of warm reboot. In case we
>>>   hard reset the target, a cold reboot could be induced resulting in
>>>   lose of ddr contents thereby losing all the debug info.
>>> 
>>> Currently, the watchdog pm callback just invokes the usual suspend
>>> and resume callback which do not have any special ordering in the
>>> sense that a watchdog can be suspended before the buggy device driver
>>> suspend callback and watchdog resume can happen after the buggy 
>>> device
>>> driver resume callback. This would mean that the watchdog will not be
>>> active when the buggy driver cause the lockups thereby hanging the
>>> system. So to make sure this doesn't happen, move the watchdog pm to
>>> use late/early system pm callbacks which will ensure that the 
>>> watchdog
>>> is suspended late and resumed early so that it can catch such issues.
>>> 
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> 
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> 
> 
> Gentle Ping. I don't see this in linux-next or linux-watchdog, please 
> let
> me know if anything is pending from my side.
> 

Gentle Ping !!

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
