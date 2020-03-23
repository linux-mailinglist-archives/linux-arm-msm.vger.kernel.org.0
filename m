Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184B418F583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 14:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgCWNRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 09:17:25 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:36398 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728307AbgCWNRZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 09:17:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584969444; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=khdlMni9LrUnSqeXAXRdAg8xsofhD9R5JuMv0cC8cNk=;
 b=XuZQ80ddXljXtvDwAtgbMHNPVpAsP3Js9ExN5tZviXr3vrw1aiaxGrJYc26mMzi/5xF3kRoz
 AXyrkl63xBEMZbICRj9MLcvYuis3d9Jx7clmZYIF+xp06e4XzFEzh7p+OSPHTUe1lSbkZpO9
 07vtwlW/5h8B4ii+VcTyYmL4Vxo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e78b6d4.7f8c2bd296f8-smtp-out-n05;
 Mon, 23 Mar 2020 13:17:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6EF7DC43636; Mon, 23 Mar 2020 13:17:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4A9DC433D2;
        Mon, 23 Mar 2020 13:17:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 23 Mar 2020 18:47:07 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mathieu.poirier@linaro.org, bjorn.andersson@linaro.org,
        leo.yan@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
        agross@kernel.org, david.brown@linaro.org, mark.rutland@arm.com,
        swboyd@chromium.org, rnayak@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] coresight: etm4x: Add support for Qualcomm SC7180 SoC
In-Reply-To: <788554ee-1b78-9651-9a95-843b8725f502@arm.com>
References: <cover.1584689229.git.saiprakash.ranjan@codeaurora.org>
 <07a6b272c6e71e0e480f0dd0bffaf3138c0ab4c2.1584689229.git.saiprakash.ranjan@codeaurora.org>
 <edf1bab3-411a-ff7a-b4ca-78a8ab00c72b@arm.com>
 <4924d6c9495d412d9ecb3e1a50ea6ca8@codeaurora.org>
 <788554ee-1b78-9651-9a95-843b8725f502@arm.com>
Message-ID: <2c75f3548cc735b7ac53e9d06e3b9565@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-23 17:09, Suzuki K Poulose wrote:
> On 03/23/2020 11:32 AM, Sai Prakash Ranjan wrote:
>> Hi Suzuki,
>> 
>> On 2020-03-23 15:25, Suzuki K Poulose wrote:
>>> On 03/20/2020 07:44 AM, Sai Prakash Ranjan wrote:
>>>> Add ETM Peripheral IDs for Qualcomm SC7180 SoC. It has
>>>> 2 big CPU cores based on Cortex-A76 and 6 LITTLE CPU
>>>> cores based on Cortex-A55.
>>>> 
>>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-etm4x.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>> 
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c 
>>>> b/drivers/hwtracing/coresight/coresight-etm4x.c
>>>> index a90d757f7043..a153a65c4c5b 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
>>>> @@ -1556,6 +1556,8 @@ static const struct amba_id etm4_ids[] = {
>>>>       CS_AMBA_UCI_ID(0x000f0211, uci_id_etm4),/* Qualcomm Kryo */
>>>>       CS_AMBA_ID(0x000bb802),            /* Qualcomm Kryo 385 
>>>> Cortex-A55 */
>>>>       CS_AMBA_ID(0x000bb803),            /* Qualcomm Kryo 385 
>>>> Cortex-A75 */
>>>> +    CS_AMBA_ID(0x000bb805),            /* Qualcomm Kryo 4XX 
>>>> Cortex-A55 */
>>>> +    CS_AMBA_ID(0x000bb804),            /* Qualcomm Kryo 4XX 
>>>> Cortex-A76 */
>>> 
>>> Does the DEVARCH indicate that it is an ETMv4 ? (It should !) Please
>>> could we enforce the UCI_ID check for these components ? The
>>> moment you add CTI components to your board this could conflict with
>>> them unless we check the UCI_ID for ETMv4.
>>> 
>> 
>> Yes I got these IDs through devarch and it does indicate that it is 
>> ETMv4.2.
>> 
>> devname=7040000.etm dev->type=0x13 devarch=0x47724a13
>> devname=7140000.etm dev->type=0x13 devarch=0x47724a13
>> devname=7240000.etm dev->type=0x13 devarch=0x47724a13
>> devname=7340000.etm dev->type=0x13 devarch=0x47724a13
>> devname=7440000.etm dev->type=0x13 devarch=0x47724a13
>> devname=7540000.etm dev->type=0x13 devarch=0x47724a13
>> devname=7640000.etm dev->type=0x13 devarch=0x47724a13
>> devname=7740000.etm dev->type=0x13 devarch=0x47724a13
>> 
>> I will add the UCI_ID as you suggested in next version.
> 
> If you do have access to the Kryo 385 variants, please fix
> them as well.
> 

Sure, will do.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
