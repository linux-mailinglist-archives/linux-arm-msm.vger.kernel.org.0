Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 208D81884B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 14:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgCQNFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 09:05:55 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:58525 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726478AbgCQNFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 09:05:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584450355; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZTED8PjW1HwvOigSt/VzJRJKGdN0cV9OXysHgYPS88c=; b=MWWbI+n71j+1qNHdWcto0KIv71U8TrdOR9WK/FUcEx/naSCiwXF1Fva1NX3F2A5ZrM0lP9Py
 WdQWBDzEJ5LwZPDWmr9zH1dDTsEQF2weBQbfrzhI2qiA88l5gjkpGG+mZUPA7BzRDFOA9rJk
 +ex3HxLaOzAsP0qGqoVsW92j5KU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e70cb26.7f4eca5d7650-smtp-out-n04;
 Tue, 17 Mar 2020 13:05:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4B25C4478F; Tue, 17 Mar 2020 13:05:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A2CA6C433CB;
        Tue, 17 Mar 2020 13:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A2CA6C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 1/2] tty: serial: qcom_geni_serial: No need to stop tx/rx
 on UART shutdown
To:     Douglas Anderson <dianders@chromium.org>,
        gregkh@linuxfoundation.org
Cc:     mka@chromium.org, swboyd@chromium.org, ryandcase@chromium.org,
        bjorn.andersson@linaro.org, skakit@codeaurora.org,
        rojay@codeaurora.org, mgautam@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Doug Anderson <dianders@google.com>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Jiri Slaby <jslaby@suse.com>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20200313134635.1.Icf54c533065306b02b880c46dfd401d8db34e213@changeid>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <ce79643c-e854-a48f-2faf-f405c310a8a7@codeaurora.org>
Date:   Tue, 17 Mar 2020 18:35:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313134635.1.Icf54c533065306b02b880c46dfd401d8db34e213@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/14/2020 2:16 AM, Douglas Anderson wrote:
> On a board using qcom_geni_serial I found that I could no longer
> interact with kdb if I got a crash after the "agetty" running on the
> same serial port was killed.  This meant that various classes of
> crashes that happened at reboot time were undebuggable.
>
> Reading through the code, I couldn't figure out why qcom_geni_serial
> felt the need to run so much code at port shutdown time.  All we need
> to do is disable the interrupt.
>
> After I make this change then a hardcoded kgdb_breakpoint in some late
> shutdown code now allows me to interact with the debugger.  I also
> could freely close / re-open the port without problems.
>
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Looks good to me.

Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
