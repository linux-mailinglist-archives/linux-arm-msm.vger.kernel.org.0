Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B61B4D415E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 15:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbfJKNeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 09:34:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42344 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbfJKNeK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 09:34:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 399256119D; Fri, 11 Oct 2019 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570800849;
        bh=qV7mshgmsk+PA+0O8tFTuDWkquelMqFFIB66c0mtXvw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sv9o6SahDz0061+i8mzvszXlLhrR9qsDktrsbzlQ1yOt4cqgDdpPKMUYsS0AdRGjp
         TY256M8EkPlfijHqvkYOR/oac/5VmgJu+7guEZ1N1h9s+OE/f/AdAv8O3Kh7t1h06W
         WttHg8Ib4eIB5U/Jk/0U3IVaHNUJDbBgjcl5Uoyw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 16D1261197;
        Fri, 11 Oct 2019 13:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570800839;
        bh=qV7mshgmsk+PA+0O8tFTuDWkquelMqFFIB66c0mtXvw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DTe4ww8/Rj9UiVNqQ42aZF8hpaoSQgx/h5/neY7Ej2tjWAudV7pUqcK+NbO4M8q7f
         SvRvgGK+f2en3oE67UQ81aAsMgvJlvRB8AE4x3DdFbh0j6Vw6w0DGAXRxmuJyxaw2o
         zOL10H3tgjCyZkjlAazwa0jLMwumpydq57bekATE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Oct 2019 19:03:58 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>
Subject: Re: Relax CPU features sanity checking on heterogeneous architectures
In-Reply-To: <a86e9be2-fc82-afea-5e94-b15d7eef1b84@free.fr>
References: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org>
 <20191011105010.GA29364@lakrids.cambridge.arm.com>
 <a86e9be2-fc82-afea-5e94-b15d7eef1b84@free.fr>
X-Priority: 1 (Highest)
Message-ID: <8fb6dce8dcda42a14c1347295a812a0f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-11 16:39, Marc Gonzalez wrote:
> On 11/10/2019 12:50, Mark Rutland wrote:
> 
>> Before we make any changes, we need to check whether we do actually
>> handle this variation in a safe way, and we need to consider what this
>> means w.r.t. late CPU hotplug.
>> 
>> Even if we can handle variation at boot time, once we've determined 
>> the
>> set of system-wide features we cannot allow those to regress, and I
>> believe we'll need new code to enforce that. I don't think it's
>> sufficient to mark these as NONSTRICT, though we might do that with
>> other changes.
>> 
>> We shouldn't look at the part number at all here. We care about
>> variation across CPUs regardless of whether this is big.LITTLE or some
>> variation in tie-offs, etc.
> 
> See also the "Unexpected variation in SYS_ID_AA64MMFR0_EL1" thread
> from a year ago: (that was on msm8998)
> 
> 	https://www.spinics.net/lists/arm-kernel/msg691242.html
> 

I think, it was fixed by commit: 5717fe5ab38f ("arm64: cpufeature: Don't 
treat granule sizes as strict")

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
