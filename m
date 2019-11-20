Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C719A103991
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 13:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729102AbfKTMJG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 07:09:06 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:55476
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726689AbfKTMJG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 07:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574251745;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=ArlHCTjYVpepdX8Kk9BWfKCjMlr56v7NwDSZ7PNNbMg=;
        b=gy7dqQLDh6LE3dbDLeO3j/lBDS7plZZNjrY26D8pkP/HlacU7SEJKYbKOhOJP1Ri
        5s8Ie6yAWlESAHfRbdsYLoFtOVEUUKfNulpGac+69SnYO9u41VPs1yu27MT7olrx12Z
        NV6RG8mpI1UXN3gfg19jsrspTvOO3U/Qh3qHbHiA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574251745;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=ArlHCTjYVpepdX8Kk9BWfKCjMlr56v7NwDSZ7PNNbMg=;
        b=GKvpsFbF7ZRVIY7rkpNOgWnRZn10nbPg1CgRxQbkIfu94qohuZ9buIjQ8TRpDjbt
        t8MJbuUg36L3OuYmhVr9ujhml30XwZvjfrv9/CTeqQDcWdiS/xCagwdzb7E6cKdl5bu
        5kycjM8G9pKTGBddgOEL33oa/R9eFnJ6EhNBMwvI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Nov 2019 12:09:05 +0000
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, rnayak@codeaurora.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        dianders@chromium.org
Subject: Re: [PATCH 5/6] soc: qcom: rpmhpd: Add SC7180 RPMH power-domains
In-Reply-To: <5dd439e0.1c69fb81.f690a.e152@mx.google.com>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99df8a-05504a3e-9962-4255-94e0-706e8186cd0a-000000@us-west-2.amazonses.com>
 <5dd439e0.1c69fb81.f690a.e152@mx.google.com>
Message-ID: <0101016e88b74f94-72f29396-8ee7-471d-bbf7-8e3bb1066b86-000000@us-west-2.amazonses.com>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.20-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-20 00:22, Stephen Boyd wrote:
> Quoting Sibi Sankar (2019-11-18 09:40:21)
>> Add support for cx/mx/gfx/lcx/lmx/mss power-domains found
>> on SC7180 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
>>  drivers/soc/qcom/rpmhpd.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>> 
>> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
>> index 3b109ee67a4d2..599208722650d 100644
>> --- a/drivers/soc/qcom/rpmhpd.c
>> +++ b/drivers/soc/qcom/rpmhpd.c
>> @@ -166,7 +166,26 @@ static const struct rpmhpd_desc sm8150_desc = {
>>         .num_pds = ARRAY_SIZE(sm8150_rpmhpds),
>>  };
>> 
>> +/* SC7180 RPMH powerdomains */
>> +
> 
> Nitpick: Remove the extra newline

okay

> 
>> +static struct rpmhpd *sc7180_rpmhpds[] = {
>> +       [SC7180_CX] = &sdm845_cx,
>> +       [SC7180_CX_AO] = &sdm845_cx_ao,
>> +       [SC7180_GFX] = &sdm845_gfx,
>> +       [SC7180_MX] = &sdm845_mx,
>> +       [SC7180_MX_AO] = &sdm845_mx_ao,
>> +       [SC7180_LMX] = &sdm845_lmx,
>> +       [SC7180_LCX] = &sdm845_lcx,
>> +       [SC7180_MSS] = &sdm845_mss,
>> +};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
