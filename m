Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEC7D1039C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 13:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbfKTMOd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 07:14:33 -0500
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185]:54348
        "EHLO a27-185.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728251AbfKTMOd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 07:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574252072;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=c3N+UHrBK1arDVU4vjMLuhdjzywq5jiY1zOpV3AvfGA=;
        b=Cx2VVyiffg7YmwKBsWRgiv2dEGqRVXGjHboUKUMWVRZdiRDK4toF+JWkrTJqYuxh
        inm6+MCe3FUse5lSWFXxrDtMdrooUzp+24BeOozN7wwoVd9UHYnpPSb9Q4cXIA0nhY1
        A18D928DiB2Qsdpg9qq6djfrj7HBGiq2I+NbDe2o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574252072;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=c3N+UHrBK1arDVU4vjMLuhdjzywq5jiY1zOpV3AvfGA=;
        b=Ll5WaAjJzEj4GmQCtxPp9+RawK5sp7b/Pu0XFeEhwnd+kdvezsckAKVZ21cXubGw
        KGEh0Ng8g5uw0921UmJWa1RHgZqyq1wrv4XcjDqWI7yif0JHlutft66PxtE0AliWkOQ
        wJQXFjS8P8G7Q6KB4ZPZON0Cl4V7yP8mRuEZfQtQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Nov 2019 12:14:31 +0000
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     robh+dt@kernel.org, ulf.hansson@linaro.org, rnayak@codeaurora.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 1/6] soc: qcom: rpmhpd: Set 'active_only' for active only
 power domains
In-Reply-To: <20191120023908.GP18024@yoga>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f9998d8-877e9166-8b6a-4530-ab66-3c88002e1db4-000000@us-west-2.amazonses.com>
 <20191120023908.GP18024@yoga>
Message-ID: <0101016e88bc4bf1-b1818c02-87cc-4ae8-9538-a426ce3c77ab-000000@us-west-2.amazonses.com>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.20-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-20 08:09, Bjorn Andersson wrote:
> On Mon 18 Nov 09:40 PST 2019, Sibi Sankar wrote:
> 
>> From: Douglas Anderson <dianders@chromium.org>
>> 
>> The 'active_only' attribute was accidentally never set to true for any
>> power domains meaning that all the code handling this attribute was
>> dead.
>> 
>> NOTE that the RPM power domain code (as opposed to the RPMh one) gets
>> this right.
>> 
>> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain 
>> driver")
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> Acked-by: Rajendra Nayak <rnayak@codeaurora.org>
> 
> You should have added your S-o-b here to certify its origin.
> But I picked up this patch earlier today.

sry missed it

> 
> Thanks,
> Bjorn
> 
>> ---
>>  drivers/soc/qcom/rpmhpd.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
>> index 5741ec3fa814c..51850cc68b701 100644
>> --- a/drivers/soc/qcom/rpmhpd.c
>> +++ b/drivers/soc/qcom/rpmhpd.c
>> @@ -93,6 +93,7 @@ static struct rpmhpd sdm845_mx = {
>> 
>>  static struct rpmhpd sdm845_mx_ao = {
>>  	.pd = { .name = "mx_ao", },
>> +	.active_only = true,
>>  	.peer = &sdm845_mx,
>>  	.res_name = "mx.lvl",
>>  };
>> @@ -107,6 +108,7 @@ static struct rpmhpd sdm845_cx = {
>> 
>>  static struct rpmhpd sdm845_cx_ao = {
>>  	.pd = { .name = "cx_ao", },
>> +	.active_only = true,
>>  	.peer = &sdm845_cx,
>>  	.parent = &sdm845_mx_ao.pd,
>>  	.res_name = "cx.lvl",
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
