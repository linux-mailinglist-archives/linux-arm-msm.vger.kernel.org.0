Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6429A1842F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 09:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgCMIyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 04:54:21 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:13500 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726216AbgCMIyU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 04:54:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584089659; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EdOQDHBg39WgM6SHH2cUpVxzdMsjPDz8V0RpskWpOiE=; b=xUkVItlJvffswJrAf7T0KBG3plZdVAryzdhE/wcOVAdvjD6jDcH+FrP5KAJsW5uJPBYP9zul
 ibEZPCSk/SKSFqgCLhWwCyBFde2WNgSduIQTbOgVffSzSytH2fcgepSpqTfkVkWZk5Wc6VoW
 DPoCwRK7vIfMhYSmLnxu9j+33bU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b4a29.7fb93bad4ae8-smtp-out-n02;
 Fri, 13 Mar 2020 08:54:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18B90C43636; Fri, 13 Mar 2020 08:54:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1EF4BC433CB;
        Fri, 13 Mar 2020 08:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1EF4BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v13 2/5] soc: qcom: rpmh: Update dirty flag only when data
 changes
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org>
 <1583746236-13325-3-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=X9BFJZtgmVeDpr1mCP1C5kg9+3gQo2i5RMfBuQOVMkDg@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <a69bd029-9fa8-198f-69f5-b287b1fed5ab@codeaurora.org>
Date:   Fri, 13 Mar 2020 14:23:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=X9BFJZtgmVeDpr1mCP1C5kg9+3gQo2i5RMfBuQOVMkDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/10/2020 5:12 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Mar 9, 2020 at 2:31 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Currently rpmh ctrlr dirty flag is set for all cases regardless of data
>> is really changed or not. Add changes to update dirty flag when data is
>> changed to newer values. Update dirty flag everytime when data in batch
>> cache is updated since rpmh_flush() may get invoked from any CPU instead
>> of only last CPU going to low power mode.
>>
>> Also move dirty flag updates to happen from within cache_lock and remove
>> unnecessary INIT_LIST_HEAD() call and a default case from switch.
>>
>> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
>> Reviewed-by: Evan Green <evgreen@chromium.org>
>> ---
>>  drivers/soc/qcom/rpmh.c | 19 +++++++++++--------
>>  1 file changed, 11 insertions(+), 8 deletions(-)
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks for the review doug.

Hi bjorn,

can you please pull in first 2 changes in the series.

while the others are still under discussion, pulling in these first 2 will help avoid send them each time.

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
