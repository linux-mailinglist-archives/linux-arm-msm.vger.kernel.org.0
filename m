Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2167D269EFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 08:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgIOG6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 02:58:49 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26332 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726033AbgIOG6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 02:58:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600153126; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TqpJbtJ5h/NOs90QzAjCnhYHSI+Sccp918FxJgx7Rwk=;
 b=WbPFZn9QJQKyFP2VG5x0KJEGR8ej1J657FsmoQZiFuRIj6ve/kxcGQLMbM63jDZgL7iU2bRZ
 yS8Z5tvRMBH6wvCS8lKZmtJIgnaaiszrIPPsamd2Xy/mEAQOl7dlo+qyKZCiaHzHlMb4yeLH
 QMq1dbJh06lpq6YycNeOQxnnCGg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f60661225e1ee75861dc677 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 06:58:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A86D2C43382; Tue, 15 Sep 2020 06:58:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F9F1C433C8;
        Tue, 15 Sep 2020 06:58:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 15 Sep 2020 12:28:26 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank
 lines
In-Reply-To: <a33160854744942f660fae691a4a30ec@codeaurora.org>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
 <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
 <20200911160706.GA20802@willie-the-truck>
 <010101747df8e9df-fad2f88d-e970-4753-a99a-2cfeeb1a29a9-000000@us-west-2.amazonses.com>
 <7ff9b238-e203-059f-d793-1c44475c6aa2@arm.com>
 <a33160854744942f660fae691a4a30ec@codeaurora.org>
Message-ID: <e815cbc83d6c3d92168d817cf0b01cbb@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-11 22:20, Sai Prakash Ranjan wrote:
> On 2020-09-11 22:04, Robin Murphy wrote:
>> On 2020-09-11 17:21, Sai Prakash Ranjan wrote:
>>> On 2020-09-11 21:37, Will Deacon wrote:
>>>> On Fri, Sep 11, 2020 at 05:03:06PM +0100, Robin Murphy wrote:
>>>>> BTW am I supposed to have received 3 copies of everything? Because 
>>>>> I did...
>>>> 
>>>> Yeah, this seems to be happening for all of Sai's emails :/
>>>> 
>>> 
>>> Sorry, I am not sure what went wrong as I only sent this once
>>> and there are no recent changes to any of my configs, I'll
>>> check it further.
>> 
>> Actually on closer inspection it appears to be "correct" behaviour.
>> I'm still subscribed to LAKML and the IOMMU list on this account, but
>> normally Office 365 deduplicates so aggressively that I have rules set
>> up to copy list mails that I'm cc'ed on back to my inbox, in case they
>> arrive first and cause the direct copy to get eaten - apparently
>> there's something unique about your email setup that manages to defeat
>> the deduplicator and make it deliver all 3 copies intact... :/
>> 
> 
> No changes in my local setup atleast, but in the past we have
> had cases with codeaurora mail acting weird or it could be my vpn,
> will have to check.
> 

This was an issue with codeaurora servers and I am told that it is
fixed now.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
