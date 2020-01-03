Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2259012F73F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 12:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgACL3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 06:29:52 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:17838 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727453AbgACL3w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 06:29:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578050991; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2lbRJw9IF3CEv+Kl4UADA4r+ZNZCf+ELFfYx8aHdNLg=;
 b=u1dGM04QiQGmWh/r3bikINpCHvG4/VK4QDThKjZP17biQw9IVuN6BWJhHd8+HwkyjaCI2Afe
 420RD/XLegrHKaX1gZo09baq4awoUWwXOCzFLeqlOK55Vlwq8eraoSaLkavpVexfz/wz8Ehc
 ixM6vqhsiL925fO3v1BjEkjuwHA=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0f25ac.7f34242d63b0-smtp-out-n02;
 Fri, 03 Jan 2020 11:29:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 36480C447A3; Fri,  3 Jan 2020 11:29:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 91BC8C433CB;
        Fri,  3 Jan 2020 11:29:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 03 Jan 2020 16:59:47 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: mss: q6v5-mss: Add modem support on
 SC7180
In-Reply-To: <4a3c80a0b616d54c5d4b465688034e19694c18c0.camel@pengutronix.de>
References: <20191219054506.20565-1-sibis@codeaurora.org>
 <20191219054506.20565-3-sibis@codeaurora.org>
 <4a3c80a0b616d54c5d4b465688034e19694c18c0.camel@pengutronix.de>
Message-ID: <39b3af3e6cefde9b7998fada9c311db9@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Philipp,

Thanks for taking time to review the
patch series.

On 2020-01-02 18:56, Philipp Zabel wrote:
> On Thu, 2019-12-19 at 11:15 +0530, Sibi Sankar wrote:
>> Add the out of reset sequence support for modem sub-system on SC7180
>> SoCs. It requires access to an additional halt nav register to put
>> the modem back into reset.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 199 
>> ++++++++++++++++++++++++++++-
>>  1 file changed, 198 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 164fc2a53ef11..51f451311f5fc 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> [...]
>> @@ -396,6 +409,18 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
>>  		reset_control_assert(qproc->pdc_reset);
>>  		ret = reset_control_reset(qproc->mss_restart);
>>  		reset_control_deassert(qproc->pdc_reset);
>> +	} else if (qproc->has_halt_nav) {
>> +		/* SWAR using CONN_BOX_SPARE_0 for pipeline glitch issue */
>> +		reset_control_assert(qproc->pdc_reset);
>> +		regmap_update_bits(qproc->conn_map, qproc->conn_box,
>> +				   BIT(0), BIT(0));
>> +		regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
>> +				   NAV_AXI_HALTREQ_BIT, 0);
>> +		reset_control_assert(qproc->mss_restart);
>> +		reset_control_deassert(qproc->pdc_reset);
>> +		regmap_update_bits(qproc->conn_map, qproc->conn_box,
>> +				   BIT(0), 0);
>> +		ret = reset_control_deassert(qproc->mss_restart);
>>  	} else {
>>  		ret = reset_control_assert(qproc->mss_restart);
>>  	}
> 
> Without knowing anything about the hardware this does look a bit weird,
> but I assume there is a good reason for every step.
> 
> Is the function name still describing its behaviour correctly, or would
> it make sense to rename q6v5_reset_assert/deassert to something else?

In qualcomm terminology, Q6 remote
processor requires its reset deasserted
while bringing it out of reset and reset
asserted while putting it back into reset.
However over time deassert/assert has
morphed into a sequence which we still
collectively refer to reset assert/
deassert.

I'm prefer continuing with the same name
since it helps abstract the out of reset
sequence into a few simple steps
(enable supplies->clk->pds->reset_deassert)
(disable reset_assert->clk->pds->supplies)
I'll let Bjorn decide what to do on this.

> 
> [...]
>> @@ -667,6 +742,39 @@ static void q6v5proc_halt_axi_port(struct q6v5 
>> *qproc,
>>  	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
>>  }
>> 
>> +static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
>> +				       struct regmap *halt_map,
>> +				       u32 offset)
>> +{
> [...]
>> +	/* Wait for halt ack*/
>> +	timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
>> +	for (;;) {
>> +		ret = regmap_read(halt_map, offset, &val);
>> +		if (ret || (val & NAV_AXI_HALTACK_BIT) ||
>> +		    time_after(jiffies, timeout))
>> +			break;
>> +
>> +		udelay(5);
>> +	}
> 
> This does look like a candidate for using regmap_read_poll_timeout().

yes it does... will send a patch for
it since I think the series is already
in lnext.

> 
> regards
> Philipp

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
