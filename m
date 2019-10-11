Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3C8D3D59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 12:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfJKK2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 06:28:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49134 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfJKK2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 06:28:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0487060F37; Fri, 11 Oct 2019 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570789702;
        bh=o7sRI5k365dR5XmrQKMQ1PnIHDR0knJ4nKOksc1JaTA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ffak985Fp7BSbad9dg/e+6GlJrzkNiqq+q8avsY5/jkZ/u5jAc0ZExRui/hJHON8P
         RmDFnTRHq5RPMVhBjp7Zn5FKUJxQ0YhokXNBfXuQRIIMLbDY+hHfKmNbYD8+JD4VFn
         ctiZkdGvgr+vHdD6pKnVjWXeFwi5AigcYrCz24LE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC27760F37;
        Fri, 11 Oct 2019 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570789700;
        bh=o7sRI5k365dR5XmrQKMQ1PnIHDR0knJ4nKOksc1JaTA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WElkEaJmeNpCsqzDOa4da/turGp2HNilPBu5PM8bJGNaFlNb0KmC6pAvYRK2HDzUl
         X64O6IR8InOWhqhB7xTFzAiejDHuK0nSi1KSCQ8mHsLvT+2+BP9ZkdUuuGy/XUTz64
         GkQAcvTM9osdVIR1Thz6J4Jru6mT18n8gizg2vGs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC27760F37
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
 <347780b9-c66b-01c4-b547-b03de2cf3078@codeaurora.org>
 <20190925130346.42E0820640@mail.kernel.org>
 <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org>
 <20191001143825.CD3212054F@mail.kernel.org>
 <7ac5f6bf-33c5-580e-bd40-e82f3052d460@codeaurora.org>
 <20191003160130.5A19B222D0@mail.kernel.org>
 <81a2fa46-a7e6-66a2-9649-009f22813c81@codeaurora.org>
 <20191004232022.062A1215EA@mail.kernel.org>
 <d17dad3d-d32c-b71c-0e56-d15cb246f742@codeaurora.org>
 <20191010041629.6E771208C3@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <9fef7f3d-984e-9011-b207-c7f287691000@codeaurora.org>
Date:   Fri, 11 Oct 2019 15:58:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010041629.6E771208C3@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 10/10/2019 9:46 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-10-09 02:19:39)
>> Hi Stephen,
>>
>> On 10/5/2019 4:50 AM, Stephen Boyd wrote:
>>> Quoting Taniya Das (2019-10-04 10:39:31)
>>>>
>>>> Could you please confirm if you are referring to update the below?
>>>
>>> I wasn't suggesting that explicitly but sure. Something like this would
>>> be necessary to make clk_get() pass back a NULL pointer to the caller.
>>> Does everything keep working with this change?
>>>
>>
>> Even if I pass back NULL, I don't see it working. Please suggest how to
>> take it forward.
>>
> 
> Why doesn't it work?
> 

My bad, I messed up with the kernel and my testing was showing failures. 
Have tested it on SC7180 & Cheza and it works as expected.

I will submit the changes in common.c to return NULL.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
