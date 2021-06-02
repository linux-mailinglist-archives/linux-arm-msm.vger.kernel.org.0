Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B351C397FC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 05:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhFBD7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 23:59:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44662 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229989AbhFBD7X (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 23:59:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622606261; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FpopyC/KpB73Pap09OPQncklp1G3/PkcWqP7TyBkzLk=;
 b=bO03BtvIxZrHoPPgqSK6of05ABaUmCSp9jCm5Imda62irRtY5fiLv+sfOaT8F10TqzaUgpzf
 LdGtVkWjlTWC8QpwmsS5OlbiXRwCmJCqa8vvGZTKhwEB3RCejaYKf/R0TElwTDvvP8iiA5zX
 3jdhnC8o9G3FwnzZmIa10chhYZc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60b7018df726fa4188c0bbe3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 03:57:01
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3E606C433D3; Wed,  2 Jun 2021 03:57:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5EEFBC433F1;
        Wed,  2 Jun 2021 03:56:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 02 Jun 2021 09:26:59 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        rishabhb@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH 02/12] soc: qcom: aoss: Drop power domain support
In-Reply-To: <YLBsCLNLBlWwoPQj@builder.lan>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org>
 <1618574638-5117-3-git-send-email-sibis@codeaurora.org>
 <161871128938.46595.8658084266884500136@swboyd.mtv.corp.google.com>
 <7adff8e58784bb85ea844ad338bfb19c@codeaurora.org>
 <YLBsCLNLBlWwoPQj@builder.lan>
Message-ID: <7d371c8ac3ad4dbc45739481ec19c62f@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-28 09:35, Bjorn Andersson wrote:
> On Tue 27 Apr 01:25 CDT 2021, Sibi Sankar wrote:
> 
>> On 2021-04-18 07:31, Stephen Boyd wrote:
>> > Quoting Sibi Sankar (2021-04-16 05:03:48)
>> > > The load state resources are expected to follow the life cycle of the
>> > > remote processor it tracks. However, modeling load state resources as
>> > > power-domains result in them getting turned off during system suspend
>> > > and thereby falling out of sync with the remote processors that are
>> > > still
>> > > on. Fix this by replacing load state resource control through the
>> > > generic
>> > > qmp message send interface instead.
>> > >
>> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> > > ---
>> >
>> > Is it possible to keep this code around for a cycle so that there isn't
>> > the chance that someone is using the deprecated DT bindings with a new
>> > kernel? I worry that ripping the code out will cause them angst.
>> 
>> deprecated bindings with a newer kernel
>> shouldn't cause any problems since it is
>> the driver changes that make AOSS PD
>> mandatory or not. So the newer kernel will
>> just use qmp_send and leave the PD unused.
>> 
> 
> Maybe I'm missing something in your argument here, but I see two 
> issues:
> * The changes here requires that the new qcom,qmp property is defined,
>   or the qcom_qmp_get() will be unable to find the qmp instance.
> * Between patch 2 and 5 there's no load_state handling.
> 
> Perhaps we can carry the power-domain handling as a fallback i
> qcom_qmp_get() fails, for a few releases?

The load_state implementation is currently
broken i.e. it currently sends that the
remoteproc is down during suspend. AFAIK it
can be safely dropped without side-effects.
I'll respin the series fixing Rob's comments.

> 
> 
> Other than the ordering and backwards compatibility issue I think this
> looks good. So can you please respin this based on the later revision 
> of
> the qmp patch? (And fix Rob's request on the commit message)
> 
> https://lore.kernel.org/linux-arm-msm/1620320818-2206-2-git-send-email-deesin@codeaurora.org/
> 
> Regards,
> Bjorn
> 
>> > Certainly we have to keep the code in place until DT is updated, so this
>> > patch should come last?
>> 
>> sure I don't mind, as long as it simplifies
>> the merge process.
>> 
>> --
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
>> a Linux Foundation Collaborative Project.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
