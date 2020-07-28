Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C6B2303F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 09:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgG1HUS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 03:20:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38766 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727871AbgG1HUS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 03:20:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595920817; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kRmZCJyj9I1SnPZs5XwOYPOfxafRktfoOSamzdqNY1M=;
 b=gLPqXUMpBb9XCN/+YEg+s6c/GnkCr2Ndc2IWhM7ZUg4RhlLPkIoA136YA8lMu+IAaDecXz0s
 F7aAfo12oIPb2DdiHeZLDgPmvwbgKl1vj0fItkgKYHvrrVUOFoCcMAIVr5FnYB7ByCJBbDSq
 pEeCfSqmjDPcP609htZrQle+l/E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f1fd1a77ab15087eb4700db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 07:20:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B99AFC433AD; Tue, 28 Jul 2020 07:20:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6338C433C9;
        Tue, 28 Jul 2020 07:20:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Jul 2020 12:50:05 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7180: Add iommus property to ETR
In-Reply-To: <20200728062850.GC202429@builder.lan>
References: <cover.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <2312c9a10e7251d69e31e4f51c0f1d70e6f2f2f5.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <20200621072213.GG128451@builder.lan>
 <f40621b2b01f836a8a97686707599dd0@codeaurora.org>
 <e270acd3f7db076c043f1b982b1efea0@codeaurora.org>
 <20200727205834.GA202429@builder.lan>
 <207e6b6a297d5ce1bdcac204e297389b@codeaurora.org>
 <20200728062850.GC202429@builder.lan>
Message-ID: <afd1c140aa9893478cd78620de35f853@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-28 11:58, Bjorn Andersson wrote:
> On Mon 27 Jul 21:40 PDT 2020, Sai Prakash Ranjan wrote:
> 
>> On 2020-07-28 02:28, Bjorn Andersson wrote:
>> > On Tue 23 Jun 23:56 PDT 2020, Sai Prakash Ranjan wrote:
>> >
>> > > Hi Bjorn,
>> > >
>> > > On 2020-06-21 13:39, Sai Prakash Ranjan wrote:
>> > > > Hi Bjorn,
>> > > >
>> > > > On 2020-06-21 12:52, Bjorn Andersson wrote:
>> > > > > On Tue 09 Jun 06:30 PDT 2020, Sai Prakash Ranjan wrote:
>> > > > >
>> > > > > > Define iommus property for Coresight ETR component in
>> > > > > > SC7180 SoC with the SID and mask to enable SMMU
>> > > > > > translation for this master.
>> > > > > >
>> > > > >
>> > > > > We don't have &apps_smmu in linux-next, as we've yet to figure out how
>> > > > > to disable the boot splash or support the stream mapping handover.
>> > > > >
>> > > > > So I'm not able to apply this.
>> > > > >
>> > > >
>> > > > This is for SC7180 which has apps_smmu not SM8150.
>> > > >
>> > >
>> > > Please let me know if this needs further explanation.
>> > >
>> >
>> > I must have commented on the wrong patch, sorry about that. The SM8150
>> > patch in this series does not compile due to the lack of &apps_smmu.
>> >
>> > I've picked the other 3 patches.
>> >
>> 
>> Thanks Bjorn, I can resend SM8150 coresight change when SMMU support 
>> lands
>> for it
>> since coresight ETR won't work without it on android bootloaders.
>> 
>> As for the other 3 patches, Patch 1 and Patch 2 will apply cleanly to 
>> the
>> right coresight
>> nodes but due to the missing unique context in Patch 3, it could be 
>> applied
>> to some other node.
>> We had to upload this change 3 times in chromium tree to get it 
>> applied to
>> the right replicator node :)
>> and this property in Patch 3 is important to fix a hard lockup. I'm 
>> not sure
>> why this patch is missing
>> the proper context :/
>> 
>> I couldn't find the changes yet in qcom/for-next or other branches to 
>> see if
>> it is
>> applied to right replicator node. In case you haven't applied it yet, 
>> Patch
>> 3 change
>> should be applied to "replicator@6b06000" node.
>> 
> 
> Thanks for pointing that out, I've fixed up the incorrectly applied
> change. (Still not published the branch)
> 
> 
> For the future I believe you can pass -U <n> to git format-patch to get
> <n> number of lines of context. Making that bigger than the default 3
> should help for the coresight patches.
> 

Thanks Bjorn, will use this option going forward.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
