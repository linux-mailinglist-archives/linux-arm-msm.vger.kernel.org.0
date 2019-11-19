Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87508102802
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 16:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfKSPZs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 10:25:48 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:34286
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727505AbfKSPZs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 10:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574177146;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=9eIeIDGYpRoajHOA6V6r5A1WHGey/lyjLwLkgP/Ouzg=;
        b=cNRMj3kz9XDvGdr4Pa1Srgz2f+pUltYIVyHg6bI7H91i2q18wqxvL6mFf7HjwYJq
        YnD10cw0b5aUdu5OORfNrItNRjuzaE0z1ebk37fdAUzQl/hHOTfV7xzb8fSLU1ls2RK
        G3HL+TMIXYVQSCQRMHZYJgQleJ6wS56oz7eq1YTM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574177146;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=9eIeIDGYpRoajHOA6V6r5A1WHGey/lyjLwLkgP/Ouzg=;
        b=f6qkpTGCJxTehWmRZG++Bysymr9EQog0V8yQJTl3EfueVybCnxYzv0byKBO6S2kD
        GeK2Aee5nXlQsC6m+cxYKLzM7AXUHGAcuW+04bHkrGNYHXriCgmqTOmCAQlRUxaa6Mn
        Y+HoIb1A6C62Gmxk4+C/mHrBZNJigK5y8oQNx6n8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 409E3C447A6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
Subject: Re: [PATCH 01/16] remoteproc: q6v5-mss: fixup MSM8998 MSS out of
 reset sequence
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mark Rutland <mark.rutland@arm.com>, p.zabel@pengutronix.de,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e80782dd7-2617455b-7d73-4e68-8a9a-b63c29e9ad76-000000@us-west-2.amazonses.com>
 <CAOCk7Nou94bxk_48JArrXhQw2KR+3bKanLe+hb2=d7_j6y3VbQ@mail.gmail.com>
From:   Sibi Sankar <sibis@codeaurora.org>
Message-ID: <0101016e844507bb-3be95e27-404d-48bb-a251-e5edf8731d67-000000@us-west-2.amazonses.com>
Date:   Tue, 19 Nov 2019 15:25:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOCk7Nou94bxk_48JArrXhQw2KR+3bKanLe+hb2=d7_j6y3VbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.11.19-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Jeff,

On 11/19/19 3:24 AM, Jeffrey Hugo wrote:
> On Mon, Nov 18, 2019 at 2:43 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>>
>> Fixup the following in the MSS out of reset sequence on MSM8998:
>> * skip ACC override on MSM8998.
>> * wait for BHS_EN_REST_ACK to be set before setting the LDO to bypass.
>> * remove "mem" clock from the active pool.
> 
> Why any of this is necessary isn't explained.

Honestly the above two fixes didn't seem to have any impact when I
tested it on MSM8998 MTP just making sure that we allign with the
out of reset sequence found on msm-4.4.

> Seems like it should be 3 separate patches.
> Regarding the mem clock change, wouldn't it be an issue if we don't
> vote for that?

we already proxy vote for it though.

> 
>>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>   drivers/remoteproc/qcom_q6v5_mss.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 471128a2e7239..2becf6dade936 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -100,6 +100,11 @@
>>   #define QDSP6SS_XO_CBCR                0x0038
>>   #define QDSP6SS_ACC_OVERRIDE_VAL               0x20
>>
>> +/* QDSP6v62 parameters */
>> +#define QDSP6SS_BHS_EN_REST_ACK                BIT(0)
>> +#define BHS_CHECK_MAX_LOOPS            200
>> +#define QDSP6SS_BHS_STATUS             0x0C4
>> +
>>   /* QDSP6v65 parameters */
>>   #define QDSP6SS_SLEEP                   0x3C
>>   #define QDSP6SS_BOOT_CORE_START         0x400
>> @@ -505,8 +510,9 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>                  int mem_pwr_ctl;
>>
>>                  /* Override the ACC value if required */
>> -               writel(QDSP6SS_ACC_OVERRIDE_VAL,
>> -                      qproc->reg_base + QDSP6SS_STRAP_ACC);
>> +               if (qproc->version == MSS_MSM8996)
>> +                       writel(QDSP6SS_ACC_OVERRIDE_VAL,
>> +                              qproc->reg_base + QDSP6SS_STRAP_ACC);
>>
>>                  /* Assert resets, stop core */
>>                  val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
>> @@ -534,6 +540,18 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>                  val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>>                  udelay(1);
>>
>> +               /* wait for BHS_EN_REST_ACK to be set */
>> +               if (qproc->version == MSS_MSM8998) {
>> +                       ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BHS_STATUS,
>> +                                                val, (val & QDSP6SS_BHS_EN_REST_ACK),
>> +                                                1, BHS_CHECK_MAX_LOOPS);
>> +                       if (ret) {
>> +                               dev_err(qproc->dev,
>> +                                       "QDSP6SS_BHS_EN_REST_ACK timedout\n");
>> +                               return -ETIMEDOUT;
>> +                       }
>> +               }
>> +
>>                  /* Put LDO in bypass mode */
>>                  val |= QDSP6v56_LDO_BYP;
>>                  writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> @@ -1594,7 +1612,6 @@ static const struct rproc_hexagon_res msm8998_mss = {
>>          .active_clk_names = (char*[]){
>>                          "iface",
>>                          "bus",
>> -                       "mem",
>>                          "gpll0_mss",
>>                          "mnoc_axi",
>>                          "snoc_axi",
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
