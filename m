Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D763D43FA3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 11:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbhJ2Jv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 05:51:29 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:63075 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbhJ2Jv2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 05:51:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635500940; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RXRm3+8WaHCCrhrsAWoMR3rmG9CdF+/zcfwgUU84gEg=; b=PuXem9aWc2pBsa/7gVR1TA73fAv+gVp6/BMAa5z9Q+yPMoR7j7t32EbDYSVMJDTaG5ux3HeF
 LOo1ImHfMHHMJJDt7ANkKEXiCaxewcQWP/lQ0FOLpAbwcMuM9lHusa4aEMI6DEx5noDo59yO
 9GC7JkhJvAMfimSCWm3Zwwito0c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 617bc370648aeeca5c7aeb41 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Oct 2021 09:48:32
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C343AC43618; Fri, 29 Oct 2021 09:48:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.214.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CBC24C4338F;
        Fri, 29 Oct 2021 09:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CBC24C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
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
References: <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
 <YXdsYlLWnjopyMn/@ripper>
 <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
 <YXjbs3Bv6Y3d87EC@yoga>
 <CAPDyKFrWQdvZX4ukHZoGz73JPfQSgqVrG_4ShMp_GrxL0NKLvg@mail.gmail.com>
 <da877712-dac9-e9d0-0bfc-25bef450eb65@codeaurora.org>
 <CAPDyKFoMpmkHgUbRN4pxgW2Gy=aZpS=eVwQrg0ydFbh9_GFG6Q@mail.gmail.com>
 <e32a59e2-0d8b-3338-5963-81ea07a709ef@codeaurora.org>
 <YXrVevUlCJJtbpLi@ripper>
 <CAE-0n50qisTv95PJjMXsOT97B3ZUhUV_TtpSHir7jq-vjTW9mw@mail.gmail.com>
 <YXs+lIizc5UD7Qce@ripper>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <5e572c50-d6fe-5a21-d09f-f11a072538c5@codeaurora.org>
Date:   Fri, 29 Oct 2021 15:18:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXs+lIizc5UD7Qce@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/29/2021 5:51 AM, Bjorn Andersson wrote:
[]..
>>> See 266e5cf39a0f ("arm64: dts: qcom: sm8250: remove mmcx regulator") and
>>> 3652265514f5 ("clk: qcom: gdsc: enable optional power domain support")
>>>
>>> MMCX is declared as power-domain for the dispcc (which is correct
>>> in itself) and the gdsc code will register GDSCs as subdomains of
>>> the same power-domain.
>>>
>>>
>>> To ensure this code path is invoked the clock driver itself needed this
>>> 6158b94ec807 ("clk: qcom: dispcc-sm8250: use runtime PM for the clock
>>> controller")
>>>
>>> So at least in theory, considering only USB the minimum would be to
>>> pm_runtime_enable() gcc-7280 and add power-domains = <CX> to the gcc
>>> node.
>>
>> I'm wary of runtime PM enabling the main clock controller.
> 
> I thought of that as well after sending my last reply. Seems like a good
> idea if we can avoid it.
> 
>> Does it work?
>>
> 
> Had to test it, but specifying power-domain = <CX> in &gcc and adding
> the required-opp to the usb node causes CX to enter the given
> performance_state.
> 
> So it boots just fine and I didn't pm_runtime_enable() gcc, so
> gdsc_pm_runtime_get() will just return.
> 
> That said, I don't grasp all the details happening under the hood, so I
> might be missing some details that will bite us when it comes to suspend
> or power collapse?
> 
>> I can understand that we need to get the CX power domain pointer into
>> the gdsc code somehow, and thus setting the power domain to CX in DT is
>> a way to do that. Why do we need to runtime pm enable the clk controller
>> though?
> 
> In the case of dispcc we need it because accessing the clock registers
> without it crashes the board.
> 
>> Just to make genpd_dev_pm_attach_by_name() hand us a genpd?
> 
> dispcc has a single power-domain so ((struct device*)dispcc)->pm_domain
> will automatically be filled out.
> 
>> I
>> see in commit 3652265514f5 that we also use it to have gdsc_enable()
>> enable the parent domain by using runtime PM to get the clk controller
>> and enable the parent domain. That is convoluted.
>>
> 
> The purpose of the gdsc_pm_runtime_get() call from gdsc_enable() is to
> ensure that the clock controller is powered up, so that we can access
> the registers - just as you do in clk_pm_runtime_get()
> 
> So regardless of us changing how the subdomains are setup I think this
> part should stay, to work for the clock controllers that need to ensure
> their registers are accessible.
> 
>> I'd prefer if we could list that the parent domain is in the registering
>> device's power-domain index number, ala clk_parent_data, so that we
>> don't have to make the power domain provider into a consumer itself.
>> This would clean up the gdsc code so that it doesn't have to go from the
>> provider's genpd enable through the provider device to the parent power
>> domain enable. Obviously it works but it's hard to follow.
>>
> 
> Giving it another look I think the current implementation in gdsc.c will
> enable the parent power-domain twice; once in the core because of the
> dependency from the subdomain and one by the device itself.
> 
> That said, I do find this technically correct for the dispcc case -
> MDSS_GDSC has a vote and dispcc has another vote.
> 
> 
> I don't have any objections to replacing the current
> pd_to_genpd(dev->pm_domain) in gdsc's call to pm_genpd_add_subdomain()
> with something carrying information from the clock driver indicating
> which of the multiple power domains the gdsc should be parented by.
> 
>>>
>>>
>>> The "problem" I described would be if there are GDSCs that are
>>> subdomains of MX - which I've seen hinted in some documentation. If so
>>> we should to specify both CX and MX as power-domains for &gcc and the
>>> gdsc implementation needs to be extended to allow us to select between
>>> the two.
>>>
>>> For this I believe a combination of genpd_dev_pm_attach_by_name() and
>>> of_genpd_add_subdomain() would do the trick.
>>>
>>> That is, if there actually are GDSCs exposed by gcc that are not
>>> subdomains of CX - otherwise none of this is needed.
>>>
>>
>> Rajendra can correct me, but I believe every device that has a GDSC
>> gating power to it is actually inside CX and MX. The CX is for digital
>> logic (think registers and interrupts, fetching data from the bus, etc.)
>> and the MX is for memories (think flops that retain state of registers

Thats true in general but for devices specifically in GCC I doubt anything
is part of MX. For the Multimedia ones, yes there is a CX/MX split.

>> and internal state of the device). In more modern SoCs they've split
>> multimedia (MMCX) and GPU (gpu_gx) out of CX and supply it with a
>> different voltage supply and pin on the SoC package. Historically, MX
>> voltage has been maintained by the power manager, RPM or RPMh, so that
>> when CX is changed, MX >= CX constraints are maintained. I think that
>> also changed over time though and MX had to be controlled in addition to
>> CX on some firmwares. I recall we had some constraint code that bumped
>> up MX whenever CX got higher than it. Having to control both led to more
>> round trip time when changing clk rates though so it got combined on the
>> backend so that only one message had to be sent to the RPM.
>>
> 
> That would explain the current hack(?) in rpmhpd.c which states that mx
> is the parent of cx - which I presume is there to say that "mx needs to
> be on when cx is on".

I always thought we did this only on sdm845, but now that I looked at the
code again, I realized we ended up reusing those struct definitions
and now that applies to all supported SoCs :/
I will double check but FWIK it should be needed only on sdm845, I will
send in a patch to fix that once I get that confirmed.
That said the constraints of MX >= CX exist on all SoCs but like Stephen
mentioned its expected to be taken care of by RPMh, on sdm845 though
for whatever reason that got pushed onto the clients.
  
> As a side effect of all this magic though this means that my vote from
> usb is actually applied to MX as well (as would it in Sandeep's original
> proposal)...

right, that should not be needed from clients, RPMh should be able to handle
that internally

>> We probably ought to list both CX and MX as power-domains on the clk
>> nodes that provide GDSCs to match the hardware. Then we need to know
>> which power domain each GDSC wants to set a minimum level on. That would
>> be the most correct way to do it.
> 
> As we describe multiple power-domains we won't get dev->pm_domain filled
> out for us, so we need to genpd_dev_pm_attach_by_{id,name}() to get the
> struct devices for each power-domain and then use those when setting up
> the subdomain for each gdsc.
> 
> But per the current implementation (with the CX votes trickling down to
> MX as well) we should be able to just grab genpd_dev_pm_attach_by_id(0)
> in gdsc_register() and use that if dev->pm_domain isn't set - at least
> until we explicitly need to vote for MX only...

Atleast for GCC I think it makes sense to have only CX (since nothing should
be powered by MX), for some of the other MM controllers if it makes sense
we could perhaps look at having both, again in case we really need to
explicitly vote on MX, which I haven't seen even in downstream code (barring
the sdm845 hack)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
