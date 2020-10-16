Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E41829061D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 15:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407232AbgJPNQG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 09:16:06 -0400
Received: from foss.arm.com ([217.140.110.172]:37176 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407228AbgJPNQD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 09:16:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5260C1FB;
        Fri, 16 Oct 2020 06:16:02 -0700 (PDT)
Received: from [10.57.50.28] (unknown [10.57.50.28])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C61E3F71F;
        Fri, 16 Oct 2020 06:16:00 -0700 (PDT)
Subject: Re: [PATCH] coresight: etm4x: Skip setting LPOVERRIDE bit for
 qcom,skip-power-up
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>, denik@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20201016101025.26505-1-saiprakash.ranjan@codeaurora.org>
 <5c4f6f5d-b07d-0816-331f-7c7463fa99b3@arm.com>
 <41bbcd43c2b016b6d785c3750622e9fe@codeaurora.org>
From:   Suzuki Poulose <suzuki.poulose@arm.com>
Message-ID: <9e19d312-9de4-2ed8-75ca-c774b93bfe11@arm.com>
Date:   Fri, 16 Oct 2020 14:15:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <41bbcd43c2b016b6d785c3750622e9fe@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/16/20 12:47 PM, Sai Prakash Ranjan wrote:
> Hi Suzuki,
> 
> On 2020-10-16 16:51, Suzuki Poulose wrote:
>> Hi Sai,
>>
>> On 10/16/20 11:10 AM, Sai Prakash Ranjan wrote:
>>> There is a bug on the systems supporting to skip power up
>>> (qcom,skip-power-up) where setting LPOVERRIDE bit(low-power
>>> state override behaviour) will result in CPU hangs/lockups
>>> even on the implementations which supports it. So skip
>>> setting the LPOVERRIDE bit for such platforms.
>>>
>>> Fixes: 02510a5aa78d ("coresight: etm4x: Add support to skip trace 
>>> unit power up")
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>
>> The fix is fine by me. Btw, is there a hardware Erratum assigned for
>> this ? It would be good to have the Erratum documented somewhere,
>> preferrably ( Documentation/arm64/silicon-errata.rst )
>>
> 
> No, afaik we don't have any erratum assigned to this bug.

Ok. Please double check, if there are any.

> It was already present in downstream kernel and since we
> support these targets with the previous HW bug
> (qcom,skip-power-up) now in upstream, we would need this
> fix in upstream kernel as well.

I understand the need for the fix and we must fix it. I was
looking to document this in the central place for errata's
handled in the kernel. And I missed asking this question
when the original patch was posted. So, thought of asking
the question now anyways. Better late than never ;-)

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
