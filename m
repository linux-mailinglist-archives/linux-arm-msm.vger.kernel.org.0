Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95126343EC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 12:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhCVLCv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 07:02:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:15371 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhCVLCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 07:02:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616410951; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=c2Ecjr3Iz4qTPc2o7wQVldP6f2u2DSZjHJDvRhCW0ks=;
 b=tpPhX/dKKh2OTUathbAEB1HaQlWbpb/r/f3SZQxN++bdgq/kFhp3imxbsI9LR5VzIr8cXP6t
 PpQXuFrN8me55DF7oGSz6hAnPPJm8Tqq2SIKgGhHTOTTqa7hT3CI2kQFvzJ8+fU40feB4Y/N
 dRUESdOYkKDx5SLHVMkPVkhnxrc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60587944e3fca7d0a6ad0fbe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Mar 2021 11:02:28
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1F21CC433C6; Mon, 22 Mar 2021 11:02:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5CCACC433CA;
        Mon, 22 Mar 2021 11:02:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 22 Mar 2021 16:32:27 +0530
From:   rojay@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V2 1/2] soc: qcom-geni-se: Cleanup the code to remove
 proxy votes
In-Reply-To: <YFOKQKlI3MjMouEA@google.com>
References: <20210318111009.30365-1-rojay@codeaurora.org>
 <20210318111009.30365-2-rojay@codeaurora.org> <YFOKQKlI3MjMouEA@google.com>
Message-ID: <91db2ee226ceb15a255bf7312a7216c1@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-18 22:43, Matthias Kaehlcke wrote:
> On Thu, Mar 18, 2021 at 04:40:08PM +0530, Roja Rani Yarubandi wrote:
>> ICC core and platforms drivers supports sync_state feature, which
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
> 
> I suggest to mention that this is essentially a revert of commit
> 048eb908a1f2 ("soc: qcom-geni-se: Add interconnect support to fix
> earlycon crash"). This makes the life of reviewers easier and it's
> also good to have the reference in the git history.
> 

Ok.

> You could also mention commit 7d3b0b0d8184 ("interconnect: qcom:
> Use icc_sync_state") in the intro.
> 

Ok.

> I tried to test by first reproducing the original issue without
> 'sync_state' in the ICC, but wasn't successful, probably something
> changed in the boot/ICC timing in the meantime ¯\_(ツ)_/¯.
> 

Need to remove runtime auto suspend support from SPI/I2C as well, as it 
was
masking the issue by delaying to turn off the resources by 250ms.

> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
