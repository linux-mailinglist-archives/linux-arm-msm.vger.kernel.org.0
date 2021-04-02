Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C40352518
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 03:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhDBBXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 21:23:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:19693 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234153AbhDBBXP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 21:23:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617326595; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=c4GVNbU7IIp759xQCgbSQpI/TBSQ+vXOS9TggujnnVA=; b=K8LumEDDJYVeQyKEcKxboBBbr/Ta5Us2zUxuL7VULTUwjHS0oNdA8F/rPRoimtIXXZA29udl
 IYFkM416rtA5Wa2G8YhOjgl4D9yTKbBZo7hzqhpPIOS18ki0+J/Sx60o2n5TnJkue0Owq3uS
 qq7dAUyUqpf7Yqyhc6ho50W+p68=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 606671fd03cfff345237b18e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Apr 2021 01:23:09
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 87431C433C6; Fri,  2 Apr 2021 01:23:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.103] (unknown [49.204.182.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD488C433CA;
        Fri,  2 Apr 2021 01:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD488C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 13/15] clk: qcom: videocc-sdm845: remove unsupported
 clock sources
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-14-dmitry.baryshkov@linaro.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <21bc5248-57b8-243d-300f-1bc39162c37f@codeaurora.org>
Date:   Fri, 2 Apr 2021 06:53:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210325111144.2852594-14-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
> video_pll0_out_even/_odd are not supported neither in the upstream nor
> in the downstream kernels, so drop those clock sources.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/videocc-sdm845.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
> index 5d6a7724a194..7153f044504f 100644
> --- a/drivers/clk/qcom/videocc-sdm845.c
> +++ b/drivers/clk/qcom/videocc-sdm845.c
> @@ -21,24 +21,18 @@
>   enum {
>   	P_BI_TCXO,
>   	P_CORE_BI_PLL_TEST_SE,
> -	P_VIDEO_PLL0_OUT_EVEN,
>   	P_VIDEO_PLL0_OUT_MAIN,
> -	P_VIDEO_PLL0_OUT_ODD,
>   };
>   
>   static const struct parent_map video_cc_parent_map_0[] = {
>   	{ P_BI_TCXO, 0 },
>   	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
> -	{ P_VIDEO_PLL0_OUT_EVEN, 2 },
> -	{ P_VIDEO_PLL0_OUT_ODD, 3 },

These are supported from the design, please do not remove them. It is 
just that in SW currently it is not being used.
But SW can decide to use them as they want. As said earlier these are 
defined in the HW plans and thus do not want them to be updated manually 
to create a mismatch.

>   	{ P_CORE_BI_PLL_TEST_SE, 4 },
>   };
>   
>   static const char * const video_cc_parent_names_0[] = {
>   	"bi_tcxo",
>   	"video_pll0",
> -	"video_pll0_out_even",
> -	"video_pll0_out_odd",
>   	"core_bi_pll_test_se",
>   };
>   
> @@ -79,7 +73,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "video_cc_venus_clk_src",
>   		.parent_names = video_cc_parent_names_0,
> -		.num_parents = 5,
> +		.num_parents = 3,
>   		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_rcg2_shared_ops,
>   	},
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
