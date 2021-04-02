Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08EBA352509
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 03:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbhDBBSe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 21:18:34 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64345 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234145AbhDBBSe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 21:18:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617326314; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=efGXj6fpHFIcwVSfrg7mOLsdHVw8BqiC+WxWno0QGwk=; b=jEAoWVWynOHiUrxBAHK1cWeNNdrv7+i8Ziacks9RGlySaaWU1/XdHhH3TGgYAYlNNu2RS1Np
 2mGjAu2eU7lMYysubVD3d8F4ioSZBiRLybrpSdHD7zLy3DWpEmhSMiwWHUsvBGY9I/eSIjAa
 puTbkEELsYb5TWNviKadru1GquY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 606670e80a4a07ffdac07f83 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Apr 2021 01:18:32
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 53B60C43462; Fri,  2 Apr 2021 01:18:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.103] (unknown [49.204.182.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5CDE1C433CA;
        Fri,  2 Apr 2021 01:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5CDE1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 05/15] clk: qcom: gpucc-sm8250: drop unused enum
 entries
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-6-dmitry.baryshkov@linaro.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <4a48728e-6d8c-15b1-153f-406edb15897f@codeaurora.org>
Date:   Fri, 2 Apr 2021 06:48:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210325111144.2852594-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Taniya Das <tdas@codeaurora.org>

On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
> Drop unused enum entries from the list of parent enums.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/gpucc-sm8250.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
> index 3fa7d1f9ff98..67c136a77efb 100644
> --- a/drivers/clk/qcom/gpucc-sm8250.c
> +++ b/drivers/clk/qcom/gpucc-sm8250.c
> @@ -26,7 +26,6 @@
>   
>   enum {
>   	P_BI_TCXO,
> -	P_CORE_BI_PLL_TEST_SE,
>   	P_GPLL0_OUT_MAIN,
>   	P_GPLL0_OUT_MAIN_DIV,
>   	P_GPU_CC_PLL0_OUT_MAIN,
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
