Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4874C34758C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 11:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhCXKNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 06:13:16 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36456 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230369AbhCXKNL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 06:13:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616580791; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RxPQ2SCXm0Yyf3sq158CfktDz0qwmc95Gr0XfsQbDJg=;
 b=X1Bg3yK37q/35oA/r1A8mRuKcyHHHRkW89+AaeEyHi5gA00cZQrnAMG+fa5rO7nm1M0mF2Dd
 FoNaJvKzS+MmPJTdxqJxe7dwJQ/OgFosdIehNv7OdyJkhcl8k9u6fOJXIWIQP5IIAG1hQewX
 VSBl4td8MFfxTjrv30hmSweOQgE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 605b10a05d70193f882f9a37 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Mar 2021 10:12:48
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1997C43465; Wed, 24 Mar 2021 10:12:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D2D18C433ED;
        Wed, 24 Mar 2021 10:12:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Mar 2021 15:42:46 +0530
From:   rojay@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mka@chromium.org,
        robh+dt@kernel.org, linux-serial@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 1/2] soc: qcom-geni-se: Cleanup the code to remove
 proxy votes
In-Reply-To: <YFm1Qvo3SuwJOino@kroah.com>
References: <20210322110429.14950-1-rojay@codeaurora.org>
 <20210322110429.14950-2-rojay@codeaurora.org> <YFm1Qvo3SuwJOino@kroah.com>
Message-ID: <f61210c135fdaa742cc4abdfcdebd8ab@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-23 15:00, Greg KH wrote:
> On Mon, Mar 22, 2021 at 04:34:28PM +0530, Roja Rani Yarubandi wrote:
>> This reverts commit 048eb908a1f2 ("soc: qcom-geni-se: Add interconnect
>> support to fix earlycon crash")
>> 
>> ICC core and platforms drivers supports sync_state feature with
>> commit 7d3b0b0d8184 ("interconnect: qcom: Use icc_sync_state") which
>> ensures that the default ICC BW votes from the bootloader is not
>> removed until all it's consumers are probes.
>> 
>> The proxy votes were needed in case other QUP child drivers
>> I2C, SPI probes before UART, they can turn off the QUP-CORE clock
>> which is shared resources for all QUP driver, this causes unclocked
>> access to HW from earlycon.
>> 
>> Given above support from ICC there is no longer need to maintain
>> proxy votes on QUP-CORE ICC node from QUP wrapper driver for early
>> console usecase, the default votes won't be removed until real
>> console is probed.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Should this have a "Fixes:" tag, and also be cc: stable@vger.kernel.org
> so that it will be properly backported?
> 
> If so, please add and resend.
> 

Okay, will add and resend.

> thanks,
> 
> greg k-h
