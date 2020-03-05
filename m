Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82F6C17A052
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 07:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgCEG40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 01:56:26 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:10781 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725903AbgCEG40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 01:56:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583391386; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=MuAyFKeArg6/wRJpL5q1p2HyJxw7AK0OF988j+vaf6U=; b=MbMrIDSj1kzoWPFlr2ZOhg1HrAJqDQIV64RtIrFQv65E3TPBkJp6AR7udfdrguve9G/Ecc3M
 Glxgw3W+1yF2Oo1YdNLZnqv5MBmYs756bNHGXztbdCZTO9fHqqei7C1b/EhsgiGNraZAlsRC
 bdEO7onKvOV+NG4t85YYclvaEME=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e60a296.7f03a7b98b58-smtp-out-n03;
 Thu, 05 Mar 2020 06:56:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D7EAEC4479C; Thu,  5 Mar 2020 06:56:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.116.232] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A2A7C43383;
        Thu,  5 Mar 2020 06:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6A2A7C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [RFC][PATCH] soc: qcom: rpmpd: Allow RPMPD driver to be loaded as
 a module
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20200305054244.128950-1-john.stultz@linaro.org>
 <20200305063254.GC264362@yoga>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <bfea3aec-3a0b-9374-eec2-0a435cf68e04@codeaurora.org>
Date:   Thu, 5 Mar 2020 12:26:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305063254.GC264362@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>> -core_initcall(rpmpd_init);
>> +module_init(rpmpd_init);
> 
> Can't you keep this as core_initcall(), for the times when its builtin?
> 
> Additionally I believe you should add a call to unregister the driver,

and implement a .remove?

> and drop the suppress_bind_attrs.
> 
>> +MODULE_LICENSE("GPL");
> 
> "GPL v2" per the SPDX?
> 
> Regards,
> Bjorn
> 
>> -- 
>> 2.17.1
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
