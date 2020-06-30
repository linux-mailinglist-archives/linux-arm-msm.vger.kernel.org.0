Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBAF20F45F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 14:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733167AbgF3MRW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 08:17:22 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:64900 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733176AbgF3MRU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 08:17:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593519439; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=kGYY4QcFYgkLdyV7Im78BrVJWki2PPpmLykzIJ/ZNLs=; b=UbMGzN6+PqBf5Wxi6jkFvCk6hTIix60BW+wf/irfCgYVtp+dKUnqfb3mCnDJU1jICJgHgr7r
 PvLxmY2GS0Ce0+uqtgs2OWVtYlTaiRAV8GqnOdmuDld7PgiMXcCKa+lVUBAn7r86OoHhiVz9
 T53LhOcHYT+i12GAtZggMliVzlM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5efb2d3c3a8a8b20b84098d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 12:17:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9855FC433A0; Tue, 30 Jun 2020 12:17:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.50.61.98] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A62D8C433C8;
        Tue, 30 Jun 2020 12:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A62D8C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v6 1/6] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robdclark@gmail.com, robdclark@chromium.org,
        stanimir.varbanov@linaro.org, viresh.kumar@linaro.org,
        sboyd@kernel.org, mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <1592222564-13556-2-git-send-email-rnayak@codeaurora.org>
 <20200625050808.GW128451@builder.lan>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <a7f5978b-6858-c99f-77e3-16e333b93e43@codeaurora.org>
Date:   Tue, 30 Jun 2020 17:46:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625050808.GW128451@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/25/2020 10:38 AM, Bjorn Andersson wrote:
> On Mon 15 Jun 05:02 PDT 2020, Rajendra Nayak wrote:
> 
>> geni serial needs to express a perforamnce state requirement on CX
>> powerdomain depending on the frequency of the clock rates.
>> Use OPP table from DT to register with OPP framework and use
>> dev_pm_opp_set_rate() to set the clk/perf state.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Akash Asthana <akashast@codeaurora.org>
>> Cc: linux-serial@vger.kernel.org
> 
> Picked up patch 1 and 2 through the qcom tree.

thanks Bjorn

> As Mark requested, please don't lump together patches that doesn't
> actually depend on each other in the same series - it's quite confusing
> to know what to pick and not.

Sorry for the confusion, I will try and split them into driver specific patches henceforth.
For this series though, I see that you have merged the entire ICC series for
QUP and QSPI into for-next of the qcom tree.
In which case it perhaps makes sense for you to pull in the QSPI change from this series
as well? i.e PATCH 6/6.
If so, I will rebase the patch on your for-next and resend (Its already Ack'ed by Mark)

thanks,
Rajendra

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
