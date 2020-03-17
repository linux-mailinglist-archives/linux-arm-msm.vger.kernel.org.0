Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66F1B1884BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 14:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgCQNHs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 09:07:48 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:46199 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726039AbgCQNHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 09:07:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584450468; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=OzBinwjasneXX1n8YD6svwHCtiwmcexTJOEThjdgLII=; b=W6n6C7ifJr1nAbcsEPeOihll56GI91Sku8Dvvk8vYLaVpVNeksfc4bjP1uEjU9PD3/B/DcJs
 0UBlIYV29e18obkxYP+WLvOLwrrbW9EqqwI2Cpe6n6briDFDy1CPHxbVJO35etb2e74tLBbq
 H+VjMDW+U8nBf3Gbj08g44N0ils=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e70cb94.7f8b3efc2e30-smtp-out-n05;
 Tue, 17 Mar 2020 13:07:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 33F58C44788; Tue, 17 Mar 2020 13:07:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8B656C433D2;
        Tue, 17 Mar 2020 13:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8B656C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 2/2] tty: serial: qcom_geni_serial: Don't try to manually
 disable the console
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
 <20200313134635.2.I3648fac6c98b887742934146ac2729ecb7232eb1@changeid>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <7663863d-3f38-2ad9-d544-370064695aef@codeaurora.org>
Date:   Tue, 17 Mar 2020 18:37:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313134635.2.I3648fac6c98b887742934146ac2729ecb7232eb1@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/14/2020 2:16 AM, Douglas Anderson wrote:
> The geni serial driver's shutdown code had a special case to call
> console_stop().  Grepping through the code, it was the only serial
> driver doing something like this (the only other caller of
> console_stop() was in serial_core.c).
>
> As far as I can tell there's no reason to call console_stop() in the
> geni code.  ...and a good reason _not_ to call it.  Specifically if
> you have an agetty running on the same serial port as the console then
> killing the agetty kills your console and if you start the agetty
> again the console doesn't come back.
>
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
