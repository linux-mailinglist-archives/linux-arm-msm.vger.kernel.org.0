Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06091ACD6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 18:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbgDPQRx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 12:17:53 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:33764 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729188AbgDPQRw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 12:17:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587053871; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Y2xEDbxocGucjO0qTn7DS340t5u6GBbJbGfyXI59M4M=;
 b=HseX7gfjba3rpV076lZskndzRQ9gg2dnp6cHA91tt/6QJD+9kiPr0gy+f+wiRm7YOOZUMy9N
 l3gLNfuND/2qfNWrahZfqE6VSEcEZlgMcC7bnEQWrHaNMie++vDuLTokbXsmwWolz8Twiees
 xMNkksQfnM9mDGaCD410ivAhPMk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e98851f.7f476c392260-smtp-out-n01;
 Thu, 16 Apr 2020 16:17:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF45FC433CB; Thu, 16 Apr 2020 16:17:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4130BC433F2;
        Thu, 16 Apr 2020 16:17:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Apr 2020 21:47:34 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH] coresight: tmc: Read TMC mode only when TMC hw is enabled
In-Reply-To: <CANLsYkxVFMrAOtZhNgQ+uPE5mgt1z8RNa_yAxX2ju7DYrbvBZw@mail.gmail.com>
References: <20200409113538.5008-1-saiprakash.ranjan@codeaurora.org>
 <9a792e3e-5a17-156d-4b59-4a3ec8f9993e@arm.com>
 <1751aeabd22bee18d2eef0f643883265@codeaurora.org>
 <20200413171418.GB28804@xps15>
 <75ef334a7e2cc6d87deecadd12c74f59@codeaurora.org>
 <CANLsYkxVFMrAOtZhNgQ+uPE5mgt1z8RNa_yAxX2ju7DYrbvBZw@mail.gmail.com>
Message-ID: <00cd8a8e124ada16f36937c4a1b173b9@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 2020-04-15 21:26, Mathieu Poirier wrote:
> On Tue, 14 Apr 2020 at 09:47, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi Mathieu,
>> 
>> On 2020-04-13 22:44, Mathieu Poirier wrote:
>> > On Mon, Apr 13, 2020 at 01:55:30PM +0530, Sai Prakash Ranjan wrote:
>> >> Hi Suzuki,
>> >>
>> >> On 2020-04-13 04:47, Suzuki K Poulose wrote:
>> >> > Hi Sai,
>> >> >
>> >> > On 04/09/2020 12:35 PM, Sai Prakash Ranjan wrote:
>> >> > > Reading TMC mode register in tmc_read_prepare_etb without
>> >> > > enabling the TMC hardware leads to async exceptions like
>> >> > > the one in the call trace below. This can happen if the
>> >> > > user tries to read the TMC etf data via device node without
>> >> > > setting up source and the sink first which enables the TMC
>> >> > > hardware in the path. So make sure that the TMC is enabled
>> >> > > before we try to read TMC data.
>> >> >
>> >> > So, one can trigger the same SError by simply :
>> >> >
>> >> > $ cat /sys/bus/coresight/device/tmc_etb0/mgmt/mode
>> >> >
>> >>
>> >> I do not see any SError when I run the above command.
>> >>
>> >> localhost ~ # cat /sys/bus/coresight/devices/tmc_etf0/mgmt/mode
>> >> 0x0
>> >>
>> >> And this is most likely due to
>> >>
>> >> commit cd9e3474bb793dc ("coresight: add PM runtime calls to
>> >> coresight_simple_func()")
>> >
>> > Ok, so this is related to power management (you can ignore my question
>> > in the
>> > previous email).
>> >
>> > Regarding function tmc_read_prepare_etb(), the best way to deal with
>> > this is
>> > probably make sure drvdata->mode != CS_MODE_DISABLED before reading
>> > TMC_MODE.
>> > If there is a buffer to read it will have been copied when the ETB was
>> > disabled
>> > and there won't be a need to access the HW.
>> >
>> 
>> This works as well, thanks.
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> index d0cc3985b72a..7ffe05930984 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> @@ -596,6 +596,11 @@ int tmc_read_prepare_etb(struct tmc_drvdata
>> *drvdata)
>>                  goto out;
>>          }
>> 
>> +       if (drvdata->mode == CS_MODE_DISABLED) {
>> +               ret = -EINVAL;
>> +               goto out;
>> +       }
>> +
> 
> We are back to your original solution where the ETB buffer can't be
> read if the ETB itself is not enabled.  It _is_ possible to read the
> buffer of an ETB that has been disabled.
> 
> To fix this consider the following [1].  Take the block at line 607
> and move it to line 598.  As part of the if() condition at line 619,
> read the value of the TMC_MODE register and exit if not in circular
> mode.  If it is in circular mode continue with disabling the hardware.
> 
> [1].
> https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/hwtracing/coresight/coresight-tmc-etf.c
> 

Thanks, got it now. Posted v2 - 
https://lore.kernel.org/patchwork/patch/1226022/

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
