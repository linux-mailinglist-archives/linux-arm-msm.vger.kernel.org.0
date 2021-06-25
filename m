Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AD53B4574
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 16:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbhFYOYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 10:24:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14063 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229700AbhFYOYR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 10:24:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624630917; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=83UyH9Qs5yJ2r6Ldt+01EcWvxTzdlYtJ796VDTb+pCo=;
 b=O1qIcRHEA/wbiMDDYnoKfbfzzmVk1HYqvjqqVx+CtWWmZFAelYmd/iEVgK3OFlN+gWWBGi5P
 ykZpq/JH2Rjw+aUBgPg8dSVhhU8YKkfdeKEmc880hjXb5gooMtS3VLrwsDtcymCIPqXbFmbB
 qnvJnQTrFT+SOBHtFnrfv7/tk48=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60d5e6754ca9face34408ae2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Jun 2021 14:21:41
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BE61BC43143; Fri, 25 Jun 2021 14:21:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96F63C4338A;
        Fri, 25 Jun 2021 14:21:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 25 Jun 2021 19:51:38 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 5/9] remoteproc: mss: q6v5-mss: Add modem support on
 SC7280
In-Reply-To: <YNUkw5GDrHwTVcC5@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-6-git-send-email-sibis@codeaurora.org>
 <YNUkw5GDrHwTVcC5@google.com>
Message-ID: <73f9814fb4f3aa2abeee0ece3aa26312@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Matthias,
Thanks for taking time to review the patch
series.

On 2021-06-25 06:05, Matthias Kaehlcke wrote:
> Hi Sibi,
> 
> On Fri, Jun 25, 2021 at 01:17:34AM +0530, Sibi Sankar wrote:
>> Add out of reset sequence support for modem sub-system on SC7280 SoCs.
>> It requires access to an additional set of qaccept registers, external
>> power/clk control registers and halt vq6 register to put the modem 
>> back
>> into reset.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 245 
>> ++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 241 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 5d21084004cb..4e32811e0025 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -77,6 +77,14 @@
>> 
>>  #define HALT_ACK_TIMEOUT_US		100000
>> 
>> +/* QACCEPT Register Offsets */
>> +#define QACCEPT_ACCEPT_REG		0x0
>> +#define QACCEPT_ACTIVE_REG		0x4
>> +#define QACCEPT_DENY_REG		0x8
>> +#define QACCEPT_REQ_REG			0xC
>> +
>> +#define QACCEPT_TIMEOUT_US		50
>> +
>>  /* QDSP6SS_RESET */
>>  #define Q6SS_STOP_CORE			BIT(0)
>>  #define Q6SS_CORE_ARES			BIT(1)
>> @@ -143,6 +151,9 @@ struct rproc_hexagon_res {
>>  	bool has_alt_reset;
>>  	bool has_mba_logs;
>>  	bool has_spare_reg;
>> +	bool has_qaccept_regs;
>> +	bool has_ext_cntl_regs;
>> +	bool has_vq6;
>>  };
>> 
>>  struct q6v5 {
>> @@ -158,8 +169,18 @@ struct q6v5 {
>>  	u32 halt_q6;
>>  	u32 halt_modem;
>>  	u32 halt_nc;
>> +	u32 halt_vq6;
>>  	u32 conn_box;
>> 
>> +	u32 qaccept_mdm;
>> +	u32 qaccept_cx;
>> +	u32 qaccept_axi;
>> +
>> +	u32 axim1_clk_off;
>> +	u32 crypto_clk_off;
>> +	u32 force_clk_on;
>> +	u32 rscc_disable;
>> +
>>  	struct reset_control *mss_restart;
>>  	struct reset_control *pdc_reset;
>> 
>> @@ -201,6 +222,9 @@ struct q6v5 {
>>  	bool has_alt_reset;
>>  	bool has_mba_logs;
>>  	bool has_spare_reg;
>> +	bool has_qaccept_regs;
>> +	bool has_ext_cntl_regs;
>> +	bool has_vq6;
>>  	int mpss_perm;
>>  	int mba_perm;
>>  	const char *hexagon_mdt_image;
>> @@ -213,6 +237,7 @@ enum {
>>  	MSS_MSM8996,
>>  	MSS_MSM8998,
>>  	MSS_SC7180,
>> +	MSS_SC7280,
>>  	MSS_SDM845,
>>  };
>> 
>> @@ -473,6 +498,12 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
>>  		regmap_update_bits(qproc->conn_map, qproc->conn_box,
>>  				   AXI_GATING_VALID_OVERRIDE, 0);
>>  		ret = reset_control_deassert(qproc->mss_restart);
>> +	} else if (qproc->has_ext_cntl_regs) {
>> +		regmap_write(qproc->conn_map, qproc->rscc_disable, 0);
>> +		reset_control_assert(qproc->pdc_reset);
>> +		reset_control_assert(qproc->mss_restart);
>> +		reset_control_deassert(qproc->pdc_reset);
>> +		ret = reset_control_deassert(qproc->mss_restart);
>>  	} else {
>>  		ret = reset_control_assert(qproc->mss_restart);
>>  	}
>> @@ -490,7 +521,7 @@ static int q6v5_reset_deassert(struct q6v5 *qproc)
>>  		ret = reset_control_reset(qproc->mss_restart);
>>  		writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
>>  		reset_control_deassert(qproc->pdc_reset);
>> -	} else if (qproc->has_spare_reg) {
>> +	} else if (qproc->has_spare_reg || qproc->has_ext_cntl_regs) {
>>  		ret = reset_control_reset(qproc->mss_restart);
>>  	} else {
>>  		ret = reset_control_deassert(qproc->mss_restart);
>> @@ -604,7 +635,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>  		}
>> 
>>  		goto pbl_wait;
>> -	} else if (qproc->version == MSS_SC7180) {
>> +	} else if (qproc->version == MSS_SC7180 || qproc->version == 
>> MSS_SC7280) {
>>  		val = readl(qproc->reg_base + QDSP6SS_SLEEP);
>>  		val |= Q6SS_CBCR_CLKEN;
>>  		writel(val, qproc->reg_base + QDSP6SS_SLEEP);
>> @@ -787,6 +818,82 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>  	return ret;
>>  }
>> 
>> +static int q6v5proc_enable_qchannel(struct q6v5 *qproc, struct regmap 
>> *map, u32 offset)
>> +{
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	if (!qproc->has_qaccept_regs)
>> +		return 0;
>> +
>> +	if (qproc->has_ext_cntl_regs) {
>> +		regmap_write(qproc->conn_map, qproc->rscc_disable, 0);
>> +		regmap_write(qproc->conn_map, qproc->force_clk_on, 1);
>> +
>> +		ret = regmap_read_poll_timeout(qproc->halt_map, 
>> qproc->axim1_clk_off, val,
>> +					       !val, 1, Q6SS_CBCR_TIMEOUT_US);
>> +		if (ret) {
>> +			dev_err(qproc->dev, "failed to enable axim1 clock\n");
>> +			return -ETIMEDOUT;
>> +		}
>> +	}
>> +
>> +	regmap_write(map, offset + QACCEPT_REQ_REG, 1);
>> +
>> +	/* Wait for accept */
>> +	ret = regmap_read_poll_timeout(map, offset + QACCEPT_ACCEPT_REG, 
>> val, val, 5,
>> +				       QACCEPT_TIMEOUT_US);
>> +	if (ret) {
>> +		dev_err(qproc->dev, "qchannel enable failed\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void q6v5proc_disable_qchannel(struct q6v5 *qproc, struct 
>> regmap *map, u32 offset)
>> +{
>> +	int ret;
>> +	unsigned int val, retry;
>> +	unsigned int nretry = 10;
>> +	bool takedown_complete = false;
>> +
>> +	if (!qproc->has_qaccept_regs)
>> +		return;
>> +
>> +	while (!takedown_complete && nretry) {
>> +		nretry--;
>> +
>> +		regmap_read_poll_timeout(map, offset + QACCEPT_ACTIVE_REG, val, 
>> !val, 5,
>> +					 QACCEPT_TIMEOUT_US);
>> +
>> +		regmap_write(map, offset + QACCEPT_REQ_REG, 0);

Sure I'll add more comments to this func.
After lowering the request ^^ we wait
for deny to go high or accept to go low.
If it's the former then we do a request
high and repeat the entire process again.
If it's the latter then its considered
that the takedown is success. Let me know
if you feel any other parts of the patch
requires more comments as well.

>> +
>> +		retry = 10;
>> +		while (retry) {
>> +			usleep_range(5, 10);
>> +			retry--;
>> +			ret = regmap_read(map, offset + QACCEPT_DENY_REG, &val);
>> +			if (!ret && val) {
>> +				regmap_write(map, offset + QACCEPT_REQ_REG, 1);
>> +				break;
>> +			}
>> +
>> +			ret = regmap_read(map, offset + QACCEPT_ACCEPT_REG, &val);
>> +			if (!ret && !val) {
>> +				takedown_complete = true;
>> +				break;
>> +			}
> 
> A bit of commentary in this branch would do no harm. From the code flow
> I can guess that disabling the channel failed when QACCEPT_DENY_REG != 
> 0,
> and hence the channel is re-enabled (?) for the next try, and 
> apparently
> things are fine when QACCEPT_ACCEPT_REG is 0 after disabling the 
> channel.
> Would be good to be a bit more explicit about what all that actually
> means.





> 
>> +		}
>> +
>> +		if (!retry)
>> +			break;
>> +	}
>> +
>> +	if (!takedown_complete)
>> +		dev_err(qproc->dev, "qchannel takedown failed\n");
>> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
