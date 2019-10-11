Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61395D47C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 20:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbfJKSn0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 14:43:26 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42596 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728738AbfJKSn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 14:43:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 064A76087B; Fri, 11 Oct 2019 18:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570819405;
        bh=PO6K7o+DsxRU43RTbq143xfKRZDqFiQmwUR+pFtf6Mc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kW4j4zC2Brtfw4EfihPoZMqd3pSYxe9waBW8gzRMKhXfaD8xz5VUfBEnz483j2bt3
         1hxWCAScdnnLdYDxC71wVmMoa/vehNvKdYR0vVW5g8SoAYOC4Rsj+zXBfH2vTZ8K13
         HR0ZZYvipgkCRwv5Da2TFRJRQLLtO9KM8+ILn6Lw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.142.6] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: clew@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 066726087B;
        Fri, 11 Oct 2019 18:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570819404;
        bh=PO6K7o+DsxRU43RTbq143xfKRZDqFiQmwUR+pFtf6Mc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gCvE7juSqpjaMTNGF+MiaOuo4X8MKTx15Oaj1l1tENgDm7aPhfPc2u5QxnwpMe2DG
         4pQZA0dz0SJ/s2Jrmr16I3+yEHlO9vlFiHo/oLAgk1ylhBg7TRwSYrifIEaKc7GZ55
         2uJWO2sl4YvMzrWZ+7Yc79R2IKKN1wXyy4HQy0Rg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 066726087B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=clew@codeaurora.org
Subject: Re: [PATCH] rpmsg: glink: Remove channel decouple from rpdev release
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        ohad@wizery.com
Cc:     aneela@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191009013345.17192-1-clew@codeaurora.org>
 <5d9ebbc4.1c69fb81.b45e2.25ce@mx.google.com>
From:   Chris Lew <clew@codeaurora.org>
Message-ID: <4e0b199c-40d7-4222-f333-601134a817a1@codeaurora.org>
Date:   Fri, 11 Oct 2019 11:43:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5d9ebbc4.1c69fb81.b45e2.25ce@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/9/2019 10:04 PM, Stephen Boyd wrote:
> Quoting Chris Lew (2019-10-08 18:33:45)
>> If a channel is being rapidly restarted and the kobj release worker is
>> busy, there is a chance the the rpdev_release function will run after
>> the channel struct itself has been released.
>>
>> There should not be a need to decouple the channel from rpdev in the
>> rpdev release since that should only happen from the channel close
>> commands.
>>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
> 
> Fixes tag? The whole thing sounds broken and probably is still racy in
> the face of SMP given that channel->rpdev is tested for "published" or
> not. Can you describe the race that you're closing more?
> 

Thanks Stephen, will add Fixes tag and try to describe the race better.

I agree that the whole thing sounds broken, the glink channel cleanup 
code has a couple bugs that need to be addressed in a more extensive 
patch. This patch is more to address the immediate issue of a 
use-after-free from one of the races.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
