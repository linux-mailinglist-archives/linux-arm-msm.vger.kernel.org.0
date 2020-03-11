Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53A1C181545
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 10:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgCKJs7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 05:48:59 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:57169 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728255AbgCKJs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 05:48:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583920138; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9EHJuHhO/vVks/b4ckeCpcR077Su2ufOHJa7u+CnVwY=; b=vOOw2X8bL9TXDK91A3KxwtMbzthhi8oPNoLwCdgVu2BFwBAERlRESXwOy5r5iCNIK/oXw33v
 IHk6sPvtufGg16ZLuxGztfJhzIo/NfNe3ra7xjNjar1gWI8rQ3M9jHd8vatzT/1vfoEsV6O4
 VniEtfWt8DuCmHxjsYilBjGzdDI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e68b3f7.7f2c6764e998-smtp-out-n03;
 Wed, 11 Mar 2020 09:48:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9405CC43636; Wed, 11 Mar 2020 09:48:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1432DC433D2;
        Wed, 11 Mar 2020 09:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1432DC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFT PATCH 0/9] drivers: qcom: rpmh-rsc: Cleanup / add lots of
 comments
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        evgreen@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306235951.214678-1-dianders@chromium.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <9db1e130-6c75-6445-eae5-bfe946f377d5@codeaurora.org>
Date:   Wed, 11 Mar 2020 15:18:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306235951.214678-1-dianders@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/7/2020 5:29 AM, Douglas Anderson wrote:
> In order to review Maulik's latest "rpmh_flush for non OSI targets"
> patch series I've found myself trying to understand rpmh-rsc better.
> To make it easier for others to do this in the future, add a whole lot
> of comments / documentation.
>
> As part of this there are a very small number of functional changes.
> - We'll get a tiny performance boost by getting rid of the "cmd_cache"
>   which I believe was unnecessary (though just to be sure, best to try
>   this atop Maulik's patches where it should be super obvious that we
>   always invalidate before writing sleep/wake TCSs.
> - I think I've eliminated a possible deadlock on "nosmp" systems,
>   though it was mostly theoretical.
> - Possibly we could get a warning in some cases if I misunderstood how
>   tcs_is_free() works.  It'd be easy to remove the warning, though.
>
> These changes touch a lot of code in rpmh-rsc, so hopefully someone at
> Qualcomm can test them out better than I did (I don't have every last
> client of RPMH in my tree) 

i can help these get tested.

Thanks,
Maulik

> and review them soon-ish so they can land
> and future patches can be based on them.
>
> I've tried to structure the patches so that simpler / less
> controversial patches are first.  Those could certainly land on their
> own without later patches.  Many of the patches could also be dropped
> and the others would still apply if they are controversial.  If you
> need help doing this then please yell.
>
> With all that, enjoy.
>
>
> Douglas Anderson (9):
>   drivers: qcom: rpmh-rsc: Clean code reading/writing regs/cmds
>   drivers: qcom: rpmh-rsc: Document the register layout better
>   drivers: qcom: rpmh-rsc: Fold tcs_ctrl_write() into its single caller
>   drivers: qcom: rpmh-rsc: Remove get_tcs_of_type() abstraction
>   drivers: qcom: rpmh-rsc: A lot of comments
>   drivers: qcom: rpmh-rsc: Only use "tcs_in_use" for ACTIVE_ONLY
>   drivers: qcom: rpmh-rsc: Warning if tcs_write() used for non-active
>   drivers: qcom: rpmh-rsc: spin_lock_irqsave() for tcs_invalidate()
>   drivers: qcom: rpmh-rsc: Kill cmd_cache and find_match() with fire
>
>  drivers/soc/qcom/rpmh-internal.h |  45 ++--
>  drivers/soc/qcom/rpmh-rsc.c      | 390 +++++++++++++++++++++++--------
>  2 files changed, 313 insertions(+), 122 deletions(-)
>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
