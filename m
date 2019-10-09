Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56DB6D0AE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 11:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730515AbfJIJTs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 05:19:48 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43182 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfJIJTs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 05:19:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B1B9061A6F; Wed,  9 Oct 2019 09:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570612786;
        bh=B3ofJPS9lT1BNPYUy2bBHSRuBCWkD2zvNVGPELLyx5I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nJ7tyTcz3xwZxv3M+UE+zQqeykxo9A77IBSgtn+JnGAoJ+RL94JEXV/npTUXJ4/nB
         jAkNB4501BetRH6in1I+Q5n4KBsl6u9E5MamT33TuqabE11KCx9zEqkodC4gUR6/P9
         qmwKRNltpw1oMSe/pUePYqyt5eMmzL9MJIx9wD/c=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 49A81615E3;
        Wed,  9 Oct 2019 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570612785;
        bh=B3ofJPS9lT1BNPYUy2bBHSRuBCWkD2zvNVGPELLyx5I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IBukPeq7A91XaL/G5L95PhZ63uBCkisHNxxM5H4YNEg9aS3dSZtMl4Pvv5HX3J5ZD
         8yUDPtzUicApF+rM09PSDPO0spEDoihUC4X0QPtYIMSpuJT8cEBosJnihB324q52kx
         wEHonlC8XbLLpscpt9GazxUNmkj3jSC22H5l8ujY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 49A81615E3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190918095018.17979-1-tdas@codeaurora.org>
 <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org>
 <20190924231223.9012C207FD@mail.kernel.org>
 <347780b9-c66b-01c4-b547-b03de2cf3078@codeaurora.org>
 <20190925130346.42E0820640@mail.kernel.org>
 <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org>
 <20191001143825.CD3212054F@mail.kernel.org>
 <7ac5f6bf-33c5-580e-bd40-e82f3052d460@codeaurora.org>
 <20191003160130.5A19B222D0@mail.kernel.org>
 <81a2fa46-a7e6-66a2-9649-009f22813c81@codeaurora.org>
 <20191004232022.062A1215EA@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <d17dad3d-d32c-b71c-0e56-d15cb246f742@codeaurora.org>
Date:   Wed, 9 Oct 2019 14:49:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004232022.062A1215EA@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 10/5/2019 4:50 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-10-04 10:39:31)
>> Hi Stephen,
>>
>> On 10/3/2019 9:31 PM, Stephen Boyd wrote:
>>> Quoting Taniya Das (2019-10-03 03:31:15)
>>>> Hi Stephen,
>>>>
>>>> On 10/1/2019 8:08 PM, Stephen Boyd wrote:
>>>>>
>>>>> Why do you want to keep them critical and registered? I'm suggesting
>>>>> that any clk that is marked critical and doesn't have a parent should
>>>>> instead become a register write in probe to turn the clk on.
>>>>>
>>>> Sure, let me do a one-time enable from probe for the clocks which
>>>> doesn't have a parent.
>>>> But I would now have to educate the clients of these clocks to remove
>>>> using them.
>>>>
>>>
>>> If anyone is using these clks we can return NULL from the provider for
>>> the specifier so that we indicate there isn't support for them in the
>>> kernel. At least I hope that code path still works given all the recent
>>> changes to clk_get().
>>>
>>
>> Could you please confirm if you are referring to update the below?
> 
> I wasn't suggesting that explicitly but sure. Something like this would
> be necessary to make clk_get() pass back a NULL pointer to the caller.
> Does everything keep working with this change?
> 

Even if I pass back NULL, I don't see it working. Please suggest how to 
take it forward.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
