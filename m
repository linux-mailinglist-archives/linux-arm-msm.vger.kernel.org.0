Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62971D1B75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 18:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389274AbgEMQpv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 12:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgEMQpv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 12:45:51 -0400
X-Greylist: delayed 164 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 May 2020 09:45:50 PDT
Received: from mxa1.seznam.cz (mxa1.seznam.cz [IPv6:2a02:598:a::78:90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB57C061A0C;
        Wed, 13 May 2020 09:45:50 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc25a.ko.seznam.cz (email-smtpc25a.ko.seznam.cz [10.53.18.34])
        id 01f9a2ac5af7f6c500506ef2;
        Wed, 13 May 2020 18:45:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1589388343; bh=HOw/beXCV8NM3f8Zz2gwYM60zg/PgILleFcF555HlSQ=;
        h=Received:Subject:To:Cc:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Fkzu73s01g06qdTZvb350vh0/bI6/0G0gU8ztoOxL7T14AE3ruvRU20ZaYLxs6Tm9
         JALoIPdqd6Zh4mh+xYPHlGb3BxSnv4wXvLZv2ELiYVO+r0/Q3zG0fdIE78NxdzcYzJ
         bSLDxFRPE42aF68Eoax34bKz2YLh1swagx5vRHa4=
Received: from [192.168.1.167] (212.69.128.228 [212.69.128.228])
        by email-relay2.ko.seznam.cz (Seznam SMTPD 1.3.114) with ESMTP;
        Wed, 13 May 2020 18:42:49 +0200 (CEST)  
Subject: Re: [PATCH] arm64: dts: qcom: disable the new cti nodes on devices
 with broken coresight
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20200513154718.17401-1-michael.srba@seznam.cz>
 <CAOCk7No3bJMpZNjXaNv-OScaLXPKbdj3d_n20ss3MyciPO=e3g@mail.gmail.com>
From:   Michael Srba <Michael.Srba@seznam.cz>
Message-ID: <af456130-e54c-28ff-b71e-f2da43331a8f@seznam.cz>
Date:   Wed, 13 May 2020 18:42:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAOCk7No3bJMpZNjXaNv-OScaLXPKbdj3d_n20ss3MyciPO=e3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13. 05. 20 18:04, Jeffrey Hugo wrote:
> On Wed, May 13, 2020 at 9:53 AM <michael.srba@seznam.cz> wrote:
>> From: Michael Srba <michael.srba@seznam.cz>
>>
>> Attempting to enable these devices causes a "synchronous
>> external abort". Suspected cause is that the debug power
>> domain is not enabled by default on this device.
>> Disable these devices for now to avoid the crash.
>>
>> See: https://lore.kernel.org/linux-arm-msm/20190618202623.GA53651@gerhold.net/
>>
>> Fixes: b1fcc5702a41 ("arm64: dts: qcom: msm8916: Add CTI options")
>> Signed-off-by: Michael Srba <michael.srba@seznam.cz>
>>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts       | 6 ++++++
>>  arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 6 ++++++
>>  2 files changed, 12 insertions(+)
> Why are we disabling these in board specific files?  Seems like these
> should be disabled in the base msm8916.dtsi.  Otherwise, the next
> board that gets brought up is probably going to hit this same exact
> issue.
>
> This also follows the solution that msm8998 did for the same issue.

I would also advocate for having them disabled by default. I *think* it was
brought up initially, but that would be before the msm8998 change.

