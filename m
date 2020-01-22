Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061A6144BA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 07:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgAVGSc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 01:18:32 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:48265 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725871AbgAVGSc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 01:18:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579673911; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0+6tDurQN9muJjME2SB8JDmDEo2i43PbGdo2TM5ZOM0=;
 b=KVewppSfONRx4hTygehPj+nGYSZt9iCcEB3VgFDzqeZ9WdtaPrNQlf5AhFg1/sQDxYn35+uJ
 JR8Z2O1pGGCGYvtQ1x7H+K0px8MoULolA+2ONocuk1oUVb0E90VVSNbs2jk3UZheTDSaxqkX
 nyoV48aIRktBQg8ESvLsl311y84=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e27e936.7fd4bfa57928-smtp-out-n01;
 Wed, 22 Jan 2020 06:18:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A7D16C447A4; Wed, 22 Jan 2020 06:18:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2A53C43383;
        Wed, 22 Jan 2020 06:18:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 22 Jan 2020 11:48:28 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     evgreen@chromium.org, p.zabel@pengutronix.de, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 1/4] remoteproc: qcom: q6v5-mss: Use
 regmap_read_poll_timeout
In-Reply-To: <20200120192432.GJ1511@yoga>
References: <20200117135130.3605-1-sibis@codeaurora.org>
 <20200117135130.3605-2-sibis@codeaurora.org> <20200120192432.GJ1511@yoga>
Message-ID: <ff6e50e7ab706dcab05d579df8201864@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,

Thanks for the review!

On 2020-01-21 00:54, Bjorn Andersson wrote:
> On Fri 17 Jan 05:51 PST 2020, Sibi Sankar wrote:
> 
>> Replace the loop for HALT_ACK detection with regmap_read_poll_timeout.

sry missed it, will include it
in the next re-spin

>> 
> 
> Nice, but we should be able to do the same in q6v5proc_halt_axi_port()?
> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 16 ++++++----------
>>  1 file changed, 6 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 51f451311f5fc..f20b39c6ff0ed 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -73,6 +73,7 @@
>>  #define NAV_AXI_IDLE_BIT		BIT(2)
>> 
>>  #define HALT_ACK_TIMEOUT_MS		100
>> +#define NAV_HALT_ACK_TIMEOUT_US		200
>> 
>>  /* QDSP6SS_RESET */
>>  #define Q6SS_STOP_CORE			BIT(0)
>> @@ -746,7 +747,6 @@ static void q6v5proc_halt_nav_axi_port(struct q6v5 
>> *qproc,
>>  				       struct regmap *halt_map,
>>  				       u32 offset)
>>  {
>> -	unsigned long timeout;
>>  	unsigned int val;
>>  	int ret;
>> 
>> @@ -760,15 +760,11 @@ static void q6v5proc_halt_nav_axi_port(struct 
>> q6v5 *qproc,
>>  			   NAV_AXI_HALTREQ_BIT);
>> 
>>  	/* Wait for halt ack*/
>> -	timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
>> -	for (;;) {
>> -		ret = regmap_read(halt_map, offset, &val);
>> -		if (ret || (val & NAV_AXI_HALTACK_BIT) ||
>> -		    time_after(jiffies, timeout))
>> -			break;
>> -
>> -		udelay(5);
>> -	}
>> +	ret = regmap_read_poll_timeout(halt_map, offset, val,
>> +				       (val & NAV_AXI_HALTACK_BIT),
>> +				       5, NAV_HALT_ACK_TIMEOUT_US);
>> +	if (ret)
>> +		dev_err(qproc->dev, "nav halt ack timeout\n");
> 
> Is there a case where this new print adds value beyond the printout we
> already have for the case of IDLE_BIT not going high? Can we simply
> ignore the return value and skip the print?

yes we can skip the print

> 
> Regards,
> Bjorn
> 
>> 
>>  	ret = regmap_read(halt_map, offset, &val);
>>  	if (ret || !(val & NAV_AXI_IDLE_BIT))
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
