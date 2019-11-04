Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75293ED935
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 07:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbfKDG4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 01:56:47 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:51482 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbfKDG4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 01:56:45 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2881E60DAF; Mon,  4 Nov 2019 06:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572850604;
        bh=AhKc5wWa30wa/WEEpKjo85dpiL/PXLkjhkK4VBEnxWg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XyxBdQ1NLS+LAGi1NKtYYmihmAhNvIVUX+82A3BNEQEq3VNoUE0SG0nK24twwwzVx
         mb7X7wQ1lExFdySDfXNzSh8KNy8Mnq1wX0/GrBfE1/prwMobWA3tP4YKmdBhpGRPWo
         Ghp3S75HF+58K1EV95vjxS+36EUMyShDIsOuNuaw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.17] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E3A160DAF;
        Mon,  4 Nov 2019 06:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572850603;
        bh=AhKc5wWa30wa/WEEpKjo85dpiL/PXLkjhkK4VBEnxWg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RL01cePnSeK1p8UZDWKH1KsinywU/JXZjQI9c0w23nvtKGyN0MMcWtLxpcoSvu+R5
         XJWpLQmNKoW5I0z8IDdLZU2EE3QsskYyry3JVxLPLpDxlPHtBjbqn76XtjCv++wJ9/
         IdcBHFudOnJdz0gALRcyrvxhnD1yV/T/ar2zpbAk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8E3A160DAF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sc7180: Add pdc interrupt
 controller
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-12-rnayak@codeaurora.org>
 <5db86de0.1c69fb81.9e27d.0f47@mx.google.com>
 <20191030195021.GC27773@google.com>
 <6610d7fe-5a4d-5a43-5c4f-9ae61e7e53ee@codeaurora.org>
 <20191104063348.GA2464@tuxbook-pro>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <c214110f-7620-8771-ef83-8a4fb1f8724f@codeaurora.org>
Date:   Mon, 4 Nov 2019 12:26:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104063348.GA2464@tuxbook-pro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/4/2019 12:03 PM, Bjorn Andersson wrote:
> On Sun 03 Nov 22:17 PST 2019, Rajendra Nayak wrote:
> 
>>
>>
>> On 10/31/2019 1:20 AM, Matthias Kaehlcke wrote:
>>> On Tue, Oct 29, 2019 at 09:50:40AM -0700, Stephen Boyd wrote:
>>>> Quoting Rajendra Nayak (2019-10-23 02:02:19)
>>>>> From: Maulik Shah <mkshah@codeaurora.org>
>>>>>
>>>>> Add pdc interrupt controller for sc7180
>>>>>
>>>>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>>>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>>>> ---
>>>>> v3:
>>>>> Used the qcom,sdm845-pdc compatible for pdc node
>>>>
>>>> Everything else isn't doing the weird old compatible thing. Why not just
>>>> add the new compatible and update the driver? I guess I'll have to go
>>>> read the history.
>>>
>>> Marc Zyngier complained  on v2 about the churn from adding compatible
>>> strings for identical components, and I kinda see his point.
>>>
>>> I agree that using the 'sdm845' compatible string for sc7180 is odd too.
>>> Maybe we should introduce SoC independent compatible strings for IP blocks
>>> that are shared across multiple SoCs? If differentiation is needed SoC
>>> specific strings can be added.
>>
>> Sure, I will perhaps add a qcom,pdc SoC independent compatible to avoid
>> confusion.
>>
> 
> I agree,
> 
> compatible = "qcom,sc7180-pdc", "qcom,pdc";
> 
> is the way to go.

I wasn't planning on adding a qcom,sc7180-pdc, but instead just use the
qcom,pdc one for sc7180.

> 
> Reusing qcom,sdm845-pdc would prevent us from tackling any unforeseen
> issues/variations/erratas with one or the other platform in the future.

That was the intention of adding qcom,sc7180-pdc in the first place,
but Marc Zyngier was not happy with the churn, given there aren't really
any variations or erratas that we know of.

> 
> Regards,
> Bjorn
> 
>>
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
