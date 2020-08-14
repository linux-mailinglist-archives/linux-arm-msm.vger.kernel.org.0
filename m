Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB97244680
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 10:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgHNIdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 04:33:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55859 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726636AbgHNIdM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 04:33:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597393991; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZbUflztzbumxR+YGpdd5Mvz9JcJytRonUljimYaKv3Q=;
 b=D8IjU96XH+xi2mMPSyDdKM5UvTisRHhE1cFiN2BvhkmdEB/lziVe/07wulXCOh3uaAWHiQ8L
 3cw+D8nVBQztFYjta7Lnvc90mhBCiiv639Her8F9f+Mt/icm0kk2MMdGdSJx58ckP4EwFppW
 BzQAlxD2fUm06MI3tG2eDcCqfCM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f364c29440a07969acd27fa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 Aug 2020 08:32:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D5943C43395; Fri, 14 Aug 2020 08:32:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67F40C433C6;
        Fri, 14 Aug 2020 08:32:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 Aug 2020 14:02:40 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Add KRYO4XX gold CPU core to spectre-v2 safe list
In-Reply-To: <961724681d6d3f8c37a4e3c8facbdea3@kernel.org>
References: <20200813081834.13576-1-saiprakash.ranjan@codeaurora.org>
 <20200813090324.GB9829@willie-the-truck>
 <89f0f41514e547533c3fa66364e5a2ac@codeaurora.org>
 <20200813094041.GA9894@willie-the-truck>
 <ff6fa7bd817d49e8ef9bee5c1e13d99c@kernel.org>
 <368280026c8af5b5a58a52c1e19cfae9@codeaurora.org>
 <8ffd22d5926aedda0c9fa6ea429fd84e@kernel.org>
 <d4ad5ade9815632f450374c9b6bbe9d2@codeaurora.org>
 <961724681d6d3f8c37a4e3c8facbdea3@kernel.org>
Message-ID: <415406f86a54a99eccb364ab78200e57@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-14 13:47, Marc Zyngier wrote:
> On 2020-08-14 05:34, Sai Prakash Ranjan wrote:
>> On 2020-08-13 23:29, Marc Zyngier wrote:
> 
> [...]
> 
>>> We'd need to disable the late onlining of CPUs that would change
>>> the mitigation state, and this is... ugly.
>>> 
>> 
>> Ugh, yes indeed and here I was thinking that these things are 
>> straightforward :(
> 
> It never is. Big-little is a broken concept. I'll try and think of
> something next week, as I'm pretty swamped at the moment.
> 

Sure no problem, thanks.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
