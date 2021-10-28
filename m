Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F291943DF2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 12:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhJ1Kt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 06:49:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55184 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229946AbhJ1KtZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 06:49:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635418018; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vaoUxaT5Jgj5fVGRcreSc6OdEp2mBWTsrQrE8jtHySY=; b=YRV6LS2ugEI7xhSvHEJnfOO4c+AMH8zDXFoI3MbtlUKq1+UpiGXCxP7/jlkxjNoySJxp74rM
 BeiuUImdLMyRvI5fQytlGy/y/xiYye6Oo5x/VHoCS0HfMHlXXXUWX+EM96MB4JzqEL5cMc5i
 6ItkkuEcXsa/iCB8XT5bZSFMBY0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 617a7f94545d7d365f16e5af (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Oct 2021 10:46:44
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3BF4CC4360D; Thu, 28 Oct 2021 10:46:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.214.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AEE5AC4338F;
        Thu, 28 Oct 2021 10:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AEE5AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
 <YXcBK7zqny0s4gd4@ripper>
 <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
 <YXck+xCJQBRGqTCw@ripper>
 <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
 <YXdsYlLWnjopyMn/@ripper>
 <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
 <YXjbs3Bv6Y3d87EC@yoga>
 <CAPDyKFrWQdvZX4ukHZoGz73JPfQSgqVrG_4ShMp_GrxL0NKLvg@mail.gmail.com>
 <da877712-dac9-e9d0-0bfc-25bef450eb65@codeaurora.org>
 <CAPDyKFoMpmkHgUbRN4pxgW2Gy=aZpS=eVwQrg0ydFbh9_GFG6Q@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <e32a59e2-0d8b-3338-5963-81ea07a709ef@codeaurora.org>
Date:   Thu, 28 Oct 2021 16:16:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoMpmkHgUbRN4pxgW2Gy=aZpS=eVwQrg0ydFbh9_GFG6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/28/2021 4:05 PM, Ulf Hansson wrote:
> [...]
> 
>>>>> Got it. So in this case we could have the various display components
>>>>> that are in the mdss gdsc domain set their frequency via OPP and then
>>>>> have that translate to a level in CX or MMCX. How do we parent the power
>>>>> domains outside of DT? I'm thinking that we'll need to do that if MMCX
>>>>> is parented by CX or something like that and the drivers for those two
>>>>> power domains are different. Is it basic string matching?
>>>>
>>>> In one way or another we need to invoke pm_genpd_add_subdomain() to link
>>>> the two power-domains (actually genpds) together, like what was done in
>>>> 3652265514f5 ("clk: qcom: gdsc: enable optional power domain support").
>>>>
>>>> In the case of MMCX and CX, my impression of the documentation is that
>>>> they are independent - but if we need to express that CX is parent of
>>>> MMCX, they are both provided by rpmhpd which already supports this by
>>>> just specifying .parent on mmcx to point to cx.
>>>
>>> I was trying to follow the discussion, but it turned out to be a bit
>>> complicated to catch up and answer all things. In any case, let me
>>> just add a few overall comments, perhaps that can help to move things
>>> forward.
>>>
>>> First, one domain can have two parent domains. Both from DT and from
>>> genpd point of view, just to make this clear.
>>>
>>> Although, it certainly looks questionable to me, to hook up the USB
>>> device to two separate power domains, one to control power and one to
>>> control performance. Especially, if it's really the same piece of HW
>>> that is managing both things.
>> []..
>>> Additionally, if it's correct to model
>>> the USB GDSC power domain as a child to the CX power domain from HW
>>> point of view, we should likely do that.
>>
>> I think this would still require a few things in genpd, since
>> CX and USB GDSC are power domains from different providers.
>> Perhaps a pm_genpd_add_subdomain_by_name()?
>>
> 
> I think of_genpd_add_subdomain() should help to address this. No?

We only describe the provider nodes in DT and not the individual power domains.
For instance GCC is the power domain provider which is in DT, and USB GDSC is one
of the many power domains it supports, similarly RPMHPD is the provider node in
DT and CX is one of the many power domains it supports.
So we would need some non-DT way of hooking up power domains from two different
providers as parent/child.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
