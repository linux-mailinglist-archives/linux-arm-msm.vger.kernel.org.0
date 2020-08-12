Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295EB2424BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 06:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgHLEb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 00:31:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59685 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgHLEb2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 00:31:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597206687; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=137juiQqdEXoJ21g2IsByP0P9iG4AD+gkSMRPXYigfo=; b=C4yo41tPPetcy8/vO2ySzy4tg4ndf9VJo82vXqeMuwqyWj9aTBFHHDROMbEy+NEpfPxoy8LM
 gsGk9RHPFv4ydCkDQmsP2M+Ed4ztXgLHeAxR1enpuTvTmChY0c2yCKKn/6eScw2chH3pQapd
 b5KzmvrULpH7DmczNOPMHRxrVRw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5f33706d03528d4024d055f3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 04:30:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2CE14C433C9; Wed, 12 Aug 2020 04:30:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.1.15] (unknown [61.1.229.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F575C433C6;
        Wed, 12 Aug 2020 04:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F575C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH] opp: Fix dev_pm_opp_set_rate() to not return early
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        viresh.kumar@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1597043179-17903-1-git-send-email-rnayak@codeaurora.org>
 <20200811171249.GL3191083@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <2df0da5b-a916-a161-b417-7aef1f898c2b@codeaurora.org>
Date:   Wed, 12 Aug 2020 10:00:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200811171249.GL3191083@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/11/2020 10:42 PM, Matthias Kaehlcke wrote:
> On Mon, Aug 10, 2020 at 12:36:19PM +0530, Rajendra Nayak wrote:
>> dev_pm_opp_set_rate() can now be called with freq = 0 inorder
>> to either drop performance or bandwidth votes or to disable
>> regulators on platforms which support them.
>> In such cases, a subsequent call to dev_pm_opp_set_rate() with
>> the same frequency ends up returning early because 'old_freq == freq'
>> Instead make it fall through and put back the dropped performance
>> and bandwidth votes and/or enable back the regulators.
>>
>> Fixes: cd7ea582 ("opp: Make dev_pm_opp_set_rate() handle freq = 0 to drop performance votes")
>> Reported-by: Sajida Bhanu <sbhanu@codeaurora.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> 
> Tested-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Originally-reported-by: Matthias Kaehlcke <mka@chromium.org>
>    https://patchwork.kernel.org/patch/11675369/#23514895 :P

Sorry to have missed that :/
Thanks for testing.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
