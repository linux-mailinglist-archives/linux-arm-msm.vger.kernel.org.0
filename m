Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1970E15886F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 03:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbgBKCvI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 21:51:08 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:49490 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727857AbgBKCvE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 21:51:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581389463; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=DwinruQUTHVtb433tEVtKSujUuJq0mr9jS6Gc9Jj1Ik=; b=c/krmNxlI01+nkypTIL5AX2nk6L3Wz269H/M6bbFda8dXcR6NVwiBkVhl3dtYEH3tCSHq6ap
 FyFb4iqV5Tt8ePRBn92K6aiJKg8ib2WGZL5vYfsa3pOcwMciJlCiZdyvTdJtgeIpLVw4vDrq
 CONw/RStHZ14E585fYAdd1FMMD0=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e421696.7fa215564b90-smtp-out-n01;
 Tue, 11 Feb 2020 02:51:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DC8E7C4479D; Tue, 11 Feb 2020 02:51:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4AE8FC43383;
        Tue, 11 Feb 2020 02:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4AE8FC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 2/2] clk: qcom: gpucc: Add support for GX GDSC for
 SC7180
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <1581307266-26989-1-git-send-email-tdas@codeaurora.org>
 <1581307266-26989-2-git-send-email-tdas@codeaurora.org>
 <CAD=FV=VqRAVZ19gSbtxbmdRCBbPRr+CMxWVR29diWtfX5mL3jw@mail.gmail.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <9ac184a0-03a7-1354-1f18-890f3b66cdcb@codeaurora.org>
Date:   Tue, 11 Feb 2020 08:20:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VqRAVZ19gSbtxbmdRCBbPRr+CMxWVR29diWtfX5mL3jw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 2/10/2020 11:19 PM, Doug Anderson wrote:
> Hi,
> 
> On Sun, Feb 9, 2020 at 8:01 PM Taniya Das <tdas@codeaurora.org> wrote:
>>
>> Most of the time the CPU should not be touching the GX domain on the
>> GPU except for a very special use case when the CPU needs to force the
>> GX headswitch off. Add the GX domain for that use case.  As part of
>> this add a dummy enable function for the GX gdsc to simulate success
>> so that the pm_runtime reference counting is correct.  This matches
>> what was done in sdm845 in commit 85a3d920d30a ("clk: qcom: Add a
>> dummy enable function for GX gdsc").
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> For future reference, if you have someone's tag in your commit message
> it's nice to CC them on the email.
> 
> 

My bad my miss.

>> ---
>>   drivers/clk/qcom/gpucc-sc7180.c | 37 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
>> index a96c0b9..7b656b6 100644
>> --- a/drivers/clk/qcom/gpucc-sc7180.c
>> +++ b/drivers/clk/qcom/gpucc-sc7180.c
>> @@ -170,8 +170,45 @@ static struct gdsc cx_gdsc = {
>>          .flags = VOTABLE,
>>   };
>>
>> +/*
>> + * On SC7180 the GPU GX domain is *almost* entirely controlled by the GMU
>> + * running in the CX domain so the CPU doesn't need to know anything about the
>> + * GX domain EXCEPT....
>> + *
>> + * Hardware constraints dictate that the GX be powered down before the CX. If
>> + * the GMU crashes it could leave the GX on. In order to successfully bring back
>> + * the device the CPU needs to disable the GX headswitch. There being no sane
>> + * way to reach in and touch that register from deep inside the GPU driver we
>> + * need to set up the infrastructure to be able to ensure that the GPU can
>> + * ensure that the GX is off during this super special case. We do this by
>> + * defining a GX gdsc with a dummy enable function and a "default" disable
>> + * function.
>> + *
>> + * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
>> + * driver. During power up, nothing will happen from the CPU (and the GMU will
>> + * power up normally but during power down this will ensure that the GX domain
>> + * is *really* off - this gives us a semi standard way of doing what we need.
>> + */
>> +static int gx_gdsc_enable(struct generic_pm_domain *domain)
>> +{
>> +       /* Do nothing but give genpd the impression that we were successful */
>> +       return 0;
>> +}
>> +
>> +static struct gdsc gx_gdsc = {
>> +       .gdscr = 0x100c,
>> +       .clamp_io_ctrl = 0x1508,
>> +       .pd = {
>> +               .name = "gx_gdsc",
>> +               .power_on = gx_gdsc_enable,
>> +       },
>> +       .pwrsts = PWRSTS_OFF_ON,
>> +       .flags = CLAMP_IO,
> 
> In my previous reply [1], I asked about these flags and if it was
> intentional that they were different from sdm845.  I did see a private
> response, but no public one.  In the future note that it's good to
> reply publicly so everyone understands what happened.  In this case, I
> was told "the GDSC's on 845 and SC7180 are different and hence the
> change in flags is expected".  That answers my question and thus I'm
> fine with my tag being here.  It also looks like you took my other
> review feedback on v1, which is nice.
> 
> 
> -Doug
> 

I am unable to respond to the other thread, thus we put out the reply.

> 
> [1] https://lore.kernel.org/r/CAD=FV=V6yM7UJwu0ZLPCqmDgV9FS4=g+wcLg0TV51b72zvWT9Q@mail.gmail.com
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
