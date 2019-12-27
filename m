Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 978B612B213
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfL0Gog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:44:36 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:62671 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726156AbfL0Gog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:44:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577429075; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3CSvDtpGg7KClQhTEdyBaheE3oP4+TR2kHYW+0myb+w=; b=FXjjDR59xxkY8y0Wjg+CxCKgeWBFoaOMBKS7Xo7F9MQHEyZlQfGGh/tpM0ytVpVmXto8NSFS
 2ng4wl9+oTwrA90FWUNQpme3ggbnpYsGBO7cOJU+PFxa55nuybVme2qGCpH+78tLJViB5lcw
 l1CacrBvW+K+FdE3cKqcdkV8yuc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05a852.7f2673138ed8-smtp-out-n03;
 Fri, 27 Dec 2019 06:44:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76EF2C433CB; Fri, 27 Dec 2019 06:44:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8DDE2C447A0;
        Fri, 27 Dec 2019 06:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8DDE2C447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 0/8] Add GPU & Video Clock controller driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org>
 <20191224023250.5A3EC206D3@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <c2906227-fc53-895c-824c-13f4b69a3610@codeaurora.org>
Date:   Fri, 27 Dec 2019 12:14:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191224023250.5A3EC206D3@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/24/2019 8:02 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-11-15 02:04:56)
>> [v2]
>>   * Split Fabia code cleanup and calibration code.
>>   * Few cleanups for GPU/Video CC are
>>      * header file inclusion, const for pll vco table.
>>      * removal of always enabled clock from gpucc.
>>      * compatibles added in sorted order.
>>      * move from core_initcall to subsys_initcall().
>>      * cleanup clk_parent_data for clocks to be provided from DT.
> 
> Can you please resend with comments addressed?
> 

Next patches are submitted for review.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
