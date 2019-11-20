Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B80A103273
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 05:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfKTEKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 23:10:46 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:42858
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727264AbfKTEKq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 23:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574223044;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=nA8MnOyABPcuLXuZK6XXFzyqPxqd11pR31xTa/z2hGA=;
        b=b7wj9p9JN7eQsPi+/HuncjsDOSjkzSOfw8WVwUmTstA+qnNKNJCKmYj8rYwLETr8
        GMVC90QdO9SfQ5XwHBmAsQqM4lHSHNPoQ4MnkaObbzvqwnfaEEnkdwFpaAiY59o7WEy
        3Ts6bQr6E9vXzUiTTQRL684b34T23nGgMAtIAqCs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574223044;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=nA8MnOyABPcuLXuZK6XXFzyqPxqd11pR31xTa/z2hGA=;
        b=gQPhfWwdgb87MqNGGI8WBGIOlsuWxYFiZj1pdQ00vh1+91g0Gp4xTJdiqvBvN87f
        aV7oyham3DDbbFEEFuz2USpcsaZVz0rXwM/dTdkO6QouphX/2qS3KVV1icPawuvL5XM
        dee4jEiRa9Mxb3T9DAbWeeGuCmyYf6J0xfLtCKMU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E1924C447AD
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 5/6] soc: qcom: rpmhpd: Add SC7180 RPMH power-domains
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <20191118173944.27043-6-sibis@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0101016e87016098-92cd9a3d-e44e-48d8-bc9f-3c5b1574c267-000000@us-west-2.amazonses.com>
Date:   Wed, 20 Nov 2019 04:10:44 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191118173944.27043-6-sibis@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.11.20-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/18/2019 11:09 PM, Sibi Sankar wrote:
> Add support for cx/mx/gfx/lcx/lmx/mss power-domains found
> on SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

>   drivers/soc/qcom/rpmhpd.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 3b109ee67a4d2..599208722650d 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -166,7 +166,26 @@ static const struct rpmhpd_desc sm8150_desc = {
>   	.num_pds = ARRAY_SIZE(sm8150_rpmhpds),
>   };
>   
> +/* SC7180 RPMH powerdomains */
> +
> +static struct rpmhpd *sc7180_rpmhpds[] = {
> +	[SC7180_CX] = &sdm845_cx,
> +	[SC7180_CX_AO] = &sdm845_cx_ao,
> +	[SC7180_GFX] = &sdm845_gfx,
> +	[SC7180_MX] = &sdm845_mx,
> +	[SC7180_MX_AO] = &sdm845_mx_ao,
> +	[SC7180_LMX] = &sdm845_lmx,
> +	[SC7180_LCX] = &sdm845_lcx,
> +	[SC7180_MSS] = &sdm845_mss,
> +};
> +
> +static const struct rpmhpd_desc sc7180_desc = {
> +	.rpmhpds = sc7180_rpmhpds,
> +	.num_pds = ARRAY_SIZE(sc7180_rpmhpds),
> +};
> +
>   static const struct of_device_id rpmhpd_match_table[] = {
> +	{ .compatible = "qcom,sc7180-rpmhpd", .data = &sc7180_desc },
>   	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
>   	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
>   	{ }
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
