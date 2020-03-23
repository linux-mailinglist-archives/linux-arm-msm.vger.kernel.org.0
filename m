Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29D5618F3BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 12:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgCWLe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 07:34:56 -0400
Received: from foss.arm.com ([217.140.110.172]:47678 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728115AbgCWLe4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 07:34:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F8AD1FB;
        Mon, 23 Mar 2020 04:34:55 -0700 (PDT)
Received: from [10.37.12.136] (unknown [10.37.12.136])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 562D63F52E;
        Mon, 23 Mar 2020 04:34:52 -0700 (PDT)
Subject: Re: [PATCH 1/2] coresight: etm4x: Add support for Qualcomm SC7180 SoC
To:     saiprakash.ranjan@codeaurora.org
Cc:     mathieu.poirier@linaro.org, bjorn.andersson@linaro.org,
        leo.yan@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
        agross@kernel.org, david.brown@linaro.org, mark.rutland@arm.com,
        swboyd@chromium.org, rnayak@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1584689229.git.saiprakash.ranjan@codeaurora.org>
 <07a6b272c6e71e0e480f0dd0bffaf3138c0ab4c2.1584689229.git.saiprakash.ranjan@codeaurora.org>
 <edf1bab3-411a-ff7a-b4ca-78a8ab00c72b@arm.com>
 <4924d6c9495d412d9ecb3e1a50ea6ca8@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <788554ee-1b78-9651-9a95-843b8725f502@arm.com>
Date:   Mon, 23 Mar 2020 11:39:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <4924d6c9495d412d9ecb3e1a50ea6ca8@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/23/2020 11:32 AM, Sai Prakash Ranjan wrote:
> Hi Suzuki,
> 
> On 2020-03-23 15:25, Suzuki K Poulose wrote:
>> On 03/20/2020 07:44 AM, Sai Prakash Ranjan wrote:
>>> Add ETM Peripheral IDs for Qualcomm SC7180 SoC. It has
>>> 2 big CPU cores based on Cortex-A76 and 6 LITTLE CPU
>>> cores based on Cortex-A55.
>>>
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-etm4x.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c 
>>> b/drivers/hwtracing/coresight/coresight-etm4x.c
>>> index a90d757f7043..a153a65c4c5b 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
>>> @@ -1556,6 +1556,8 @@ static const struct amba_id etm4_ids[] = {
>>>       CS_AMBA_UCI_ID(0x000f0211, uci_id_etm4),/* Qualcomm Kryo */
>>>       CS_AMBA_ID(0x000bb802),            /* Qualcomm Kryo 385 
>>> Cortex-A55 */
>>>       CS_AMBA_ID(0x000bb803),            /* Qualcomm Kryo 385 
>>> Cortex-A75 */
>>> +    CS_AMBA_ID(0x000bb805),            /* Qualcomm Kryo 4XX 
>>> Cortex-A55 */
>>> +    CS_AMBA_ID(0x000bb804),            /* Qualcomm Kryo 4XX 
>>> Cortex-A76 */
>>
>> Does the DEVARCH indicate that it is an ETMv4 ? (It should !) Please
>> could we enforce the UCI_ID check for these components ? The
>> moment you add CTI components to your board this could conflict with
>> them unless we check the UCI_ID for ETMv4.
>>
> 
> Yes I got these IDs through devarch and it does indicate that it is 
> ETMv4.2.
> 
> devname=7040000.etm dev->type=0x13 devarch=0x47724a13
> devname=7140000.etm dev->type=0x13 devarch=0x47724a13
> devname=7240000.etm dev->type=0x13 devarch=0x47724a13
> devname=7340000.etm dev->type=0x13 devarch=0x47724a13
> devname=7440000.etm dev->type=0x13 devarch=0x47724a13
> devname=7540000.etm dev->type=0x13 devarch=0x47724a13
> devname=7640000.etm dev->type=0x13 devarch=0x47724a13
> devname=7740000.etm dev->type=0x13 devarch=0x47724a13
> 
> I will add the UCI_ID as you suggested in next version.

If you do have access to the Kryo 385 variants, please fix
them as well.

Cheers
Suzuki
