Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36627103268
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 05:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfKTECZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 23:02:25 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:38566
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727383AbfKTECZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 23:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574222544;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=KFLCdUP2GtEjV4/R27pNOGYY+5fUM2fxkMqYx2EmUhA=;
        b=Ymi3QDEd7lI+lFPsPdwKmVo4JbPHLuot+/sEllhokIFVJHc8T1x4p8Pp/Uxjzytg
        DfaeSOUjAwRsYhZWq7IYFC7jUpYHbLfTHb1LrbqF1NN8XrrIeKxQPZKsai1oupGLTIL
        7A548nWDMYvWYGBzhjuOfoUoLf780PvedCk3RWLI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574222544;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=KFLCdUP2GtEjV4/R27pNOGYY+5fUM2fxkMqYx2EmUhA=;
        b=FcxB0IRoxs/5hONWQjTwqvQeOtJcYuzNjA/tEVNB3LcKazTJ2p7s5Cjm/mRhtfo/
        Pz2tX+l2EiJhW94roEuulS6fwEiCFOPVCtcbLLOfz5TXwysqWkPTNVJuz6PxG4z9p5I
        Yv6BzieTD59pBsaDuOGzjKgjorgqmQMCIkTJx3hM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DFF89C33F83
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 3/6] soc: qcom: rpmhpd: Add SM8150 RPMH power-domains
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99b99a-e1a501f1-823e-4ede-86ad-f517323c5014-000000@us-west-2.amazonses.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0101016e86f9bca2-086cdad4-cc56-4a39-b1f0-93b30d026ca8-000000@us-west-2.amazonses.com>
Date:   Wed, 20 Nov 2019 04:02:24 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0101016e7f99b99a-e1a501f1-823e-4ede-86ad-f517323c5014-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.11.20-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/18/2019 11:10 PM, Sibi Sankar wrote:
> Add support for cx/mx/gfx/mss/ebi/mmcx power-domains found on
> SM8150 SoCs.

lmx/lcx also?

> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

>   drivers/soc/qcom/rpmhpd.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 51850cc68b701..3b109ee67a4d2 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -131,8 +131,44 @@ static const struct rpmhpd_desc sdm845_desc = {
>   	.num_pds = ARRAY_SIZE(sdm845_rpmhpds),
>   };
>   
> +/* SM8150 RPMH powerdomains */
> +
> +static struct rpmhpd sm8150_mmcx_ao;
> +static struct rpmhpd sm8150_mmcx = {
> +	.pd = { .name = "mmcx", },
> +	.peer = &sm8150_mmcx_ao,
> +	.res_name = "mmcx.lvl",
> +};
> +
> +static struct rpmhpd sm8150_mmcx_ao = {
> +	.pd = { .name = "mmcx_ao", },
> +	.active_only = true,
> +	.peer = &sm8150_mmcx,
> +	.res_name = "mmcx.lvl",
> +};
> +
> +static struct rpmhpd *sm8150_rpmhpds[] = {
> +	[SM8150_MSS] = &sdm845_mss,
> +	[SM8150_EBI] = &sdm845_ebi,
> +	[SM8150_LMX] = &sdm845_lmx,
> +	[SM8150_LCX] = &sdm845_lcx,
> +	[SM8150_GFX] = &sdm845_gfx,
> +	[SM8150_MX] = &sdm845_mx,
> +	[SM8150_MX_AO] = &sdm845_mx_ao,
> +	[SM8150_CX] = &sdm845_cx,
> +	[SM8150_CX_AO] = &sdm845_cx_ao,
> +	[SM8150_MMCX] = &sm8150_mmcx,
> +	[SM8150_MMCX_AO] = &sm8150_mmcx_ao,
> +};
> +
> +static const struct rpmhpd_desc sm8150_desc = {
> +	.rpmhpds = sm8150_rpmhpds,
> +	.num_pds = ARRAY_SIZE(sm8150_rpmhpds),
> +};
> +
>   static const struct of_device_id rpmhpd_match_table[] = {
>   	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
> +	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
>   	{ }
>   };
>   
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
