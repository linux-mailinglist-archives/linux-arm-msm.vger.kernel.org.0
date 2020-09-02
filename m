Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0912325A51E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 07:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgIBFle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 01:41:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35771 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726177AbgIBFlc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 01:41:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599025291; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Z9Z0H5TEgsdJR/eXSC6huP92wNBsGld/Kkg8DDcyq/g=; b=d/0Oj2wdTJ6rJkzYWzZW9L0lddtiE0LWY3aVTi8NfUhXoUX04dmkPzli1ZBdzYU9BY0YyrZu
 rCU1WmgS6gicaolsVHWUtgNWDcVlpsMxuPVPgBbk2wPgapjMCYegbvCQQy/NxM0+Zufe+fAs
 alqMNxsm1w+ieU7pU8vm+2iR40w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f4f307954e87432bef0b841 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 05:41:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C768BC433C6; Wed,  2 Sep 2020 05:41:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.16] (unknown [61.1.229.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 038DAC433C9;
        Wed,  2 Sep 2020 05:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 038DAC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add 'sustainable_power' for CPU
 thermal zones
To:     Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <20200813113030.1.I89c33c4119eaffb986b1e8c1bc6f0e30267089cd@changeid>
 <20200901170745.GA3419728@google.com>
 <CAD=FV=Xv0FLtWWcQcRy7p2LPNdDtSjdarsvNHRHaLkWwABnwJw@mail.gmail.com>
 <20200901213319.GB3419728@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0ec01666-a3b6-1204-60a9-20e1107db81c@codeaurora.org>
Date:   Wed, 2 Sep 2020 11:11:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901213319.GB3419728@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>> I'm not massively familiar with this area of the code, but I guess I
>> shouldn't let that stop me from having an opinion!  :-P
>>
>> * I would agree that it seems highly unlikely that someone would put
>> one of these chips in a device that could only dissipate the heat from
>> the lowest OPP, so having some higher estimate definitely makes sense.
>>
>> * In terms of the numbers here, I believe that you're claiming that we
>> can dissipate 768 mW * 6 + 1202 mW * 2 = ~7 Watts of power.
> 
> No, I'm claiming it's 768 mW + 1202 mW = ~2 W.
> 
> SC7180 has a 6 thermal zones for the 6 little cores and 4 zones for the
> 2 big cores. Each of these thermal zones uses either all little or all big
> cores as cooling devices, hence the power sustainable power of the
> individual zones doesn't add up. 768 mW corresponds to 6x 128 mW (aka all
> little cores at 1.8 GHz), and 1202 mW to 2x 601 mW (both big cores at 1.9 GHz).
> 
>> My memory
>> of how much power we could dissipate in previous laptops I worked on
>> is a little fuzzy, but that doesn't seem insane for a passively-cooled
>> laptop.  However, I think someone could conceivably put this chip in a
>> smaller form factor.  In such a case, it seems like we'd want these
>> things to sum up to ~2000 (if it would ever make sense for someone to
>> put this chip in a phone) or ~4000 (if it would ever make sense for
>> someone to put this chip in a small tablet).
> 
> See above, the sustainable power with this patch only adds up to ~2000.
> It is possible though that it would be lower in a smaller form factor
> device.
> 
> I'd be ok with posting something lower for SC7180 (it would be a guess
> though) and use the specific numbers in the device specific DT.
> 
>> It seems possible that,
>> to achieve this, we might have to tweak the
>> "dynamic-power-coefficient".  I don't know how much thought was put
>> into those numbers, but the fact that the little cores have a super
>> round 100 for their dynamic-power-coefficient makes me feel like they
>> might have been more schwags than anything.  Rajendra maybe knows?
> 
> Yeah, it's possible that that was just an approximation

No, these are based on actual power measurements.

> 
>> * I'm curious about the fact that there are two numbers here: one for
>> littles and one for bigs.  If I had to guess I'd say that since all
>> the cores are in one package so the contributions kinda need to be
>> thought of together, right?  If we're sitting there thermally
>> throttled then we'd want to pick the best perf-per-watt for the
>> overall package.  This is why your patch says we can sustain the
>> little cores at max and the big cores get whatever is left over,
>> right?
> 
> It's derived from how Qualcomm specified the thermal zones and cooling
> devices. Any ("cpu") zone is either cooled by (all) big cores or by (all)
> little cores, but not a mix of them. In my tests I also saw that the big
> cores seemed to have little impact on the little ones. The little cores
> are at max because even running at max frequency the temperature in the
> 'little zones' wouldn't come close to the trip point.
> 
>> * Should we be leaving some room in here for the GPU?  ...or I guess
>> once we list it as a cooling device we'll have to decrease the amount
>> the CPUs can use?
> 
> I don't know for sure, but judging from the CPU zones I wouldn't be
> surprised if the GPU was managed exclusively in the dedicated GPU
> thermal zones (I guess that's what 'gpuss0-thermal' and 'gpuss1-thermal'
> are). If that's not the case the values in the CPU zones can be
> adjusted when specific data is available.
> 
>> So I guess the tl; dr is:
>>
>> a) We should check "dynamic-power-coefficient" and possibly adjust.
> 
> ok, lets see if Rajendra can check if there is room for tweaking.

I suggest we don't :)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
