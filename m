Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C9416F51E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 02:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbgBZBh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 20:37:58 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:37093 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729498AbgBZBh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 20:37:58 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582681077; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=BBWKcq7dFUCB/c3IP8dQkRGrntjmGuegJTnAZqmvUMU=;
 b=t6mYdHFYeIwS4HiUu3SgEd7Ex8NyUDkkaox1Sv8v1VGGRsW6+nE9PxZ1El1BvNwzlRqZ+igS
 +GQ+bNWU1Du6V8uPKicMUdinxXUe3rmfKgmtPDoNs12862116ndvnzU4u9G/51Qp7gO+xNUg
 TN8tWhFthwDgydhevpR5vUgmIvE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e55cbf3.7f08f193c0a0-smtp-out-n01;
 Wed, 26 Feb 2020 01:37:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6310BC4479F; Wed, 26 Feb 2020 01:37:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.134.65.5] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A64DC4479D;
        Wed, 26 Feb 2020 01:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A64DC4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
Subject: Re: [PATCH v2 2/3] firmware: psci: Add support for dt-supplied
 SYSTEM_RESET2 type
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1582577858-12410-1-git-send-email-eberman@codeaurora.org>
 <1582577858-12410-3-git-send-email-eberman@codeaurora.org>
 <20200225110346.GF32784@bogus>
Message-ID: <1d7fecf8-3a7f-57e5-5c13-73de89d52aa2@codeaurora.org>
Date:   Tue, 25 Feb 2020 17:37:53 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225110346.GF32784@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/25/2020 3:03 AM, Sudeep Holla wrote:
> On Mon, Feb 24, 2020 at 12:57:37PM -0800, Elliot Berman wrote:
>> @@ -493,6 +494,7 @@ typedef int (*psci_initcall_t)(const struct device_node *);
>>  static int __init psci_0_2_init(struct device_node *np)
>>  {
>>  	int err;
>> +	u32 param;
>>
>>  	err = get_set_conduit_method(np);
>>  	if (err)
>> @@ -505,7 +507,19 @@ static int __init psci_0_2_init(struct device_node *np)
>>  	 * can be carried out according to the specific version reported
>>  	 * by firmware
>>  	 */
>> -	return psci_probe();
>> +	err = psci_probe();
>> +	if (err)
>> +		return err;
>> +
>> +	if (psci_system_reset2_supported &&
>> +	    !of_property_read_u32(np, "arm,psci-sys-reset2-param", &param)) {
>> +		if ((s32)param > 0)
> 
> What is the point on signed comparison here ? You are assuming all vendor
> reset also as architecture by doing so which is wrong.
> 
>> +			pr_warn("%08x is an invalid architectural reset type.\n",
>> +				param);
> 
> I thought the point was to have vendor reset here. Based on the 3/3 you
> see to have vendor reset bit set, you ignore that by doing signed comparison
> which is wrong and even the message is wrong. Specification defines only
> one architectural reset(WARM RESET) and all others need to be vendor specific.
> 
> --
> Regards,
> Sudeep
> 
I might've gone crazy, but all vendor-specific reset types would be
negative when cast as s32. Thus the check returns true only for an invalid
architectural reset type. I can switch to checking bits instead of using 
cast in v3 to avoid the confusion.

Alternatively, I could rename the DT property to
"arm,psci-sys-reset2-vendor-param" and then always set the 31st bit so that
it is impossible to provide an invalid architectural reset type in DT.

Let me know what is preferred.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
