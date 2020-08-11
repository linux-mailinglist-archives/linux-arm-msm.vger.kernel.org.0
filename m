Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA78E2419DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 12:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgHKKnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 06:43:47 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:55045 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728476AbgHKKnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 06:43:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597142625; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5wolqnc4WX3Y9HxnTB+o9sLyjo3ISi+Uffi77Yd3f7o=; b=g3BYFQafG68YSx8YHGtDEqJbVUM6jJwHN2uXe3AK6bkKvRstoursgTc5viZuhqTIydH9Ngv6
 mgnSGvfeN+ZGQCpsoGuk3WbbMXcObGr17Y40dHTn3x9tjRmZ5RQZd+Q24wM37AluCbSzGylH
 aVEjr2vblMTCAJmuwiQeVS/X//E=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f327647f2b697637ab160d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 10:43:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1A65C4339C; Tue, 11 Aug 2020 10:43:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.129] (unknown [183.83.142.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FDA2C433C9;
        Tue, 11 Aug 2020 10:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7FDA2C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v5 01/12] ASoC: qcom: Add common array to initialize soc
 based core clocks
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
 <1596528453-11437-2-git-send-email-rohitkr@codeaurora.org>
From:   Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <3e390421-84ce-3b74-a72d-8fc09e908971@codeaurora.org>
Date:   Tue, 11 Aug 2020 16:13:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596528453-11437-2-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Mark,

Do you see any concern with patches (1-11).
As of now, there is comment only in patch 12 from Rob which I am
planning to update once other patches are merged. Can you
please review and let me know if anything is missing.

Thanks,
Rohit
On 8/4/2020 1:37 PM, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
>
> LPASS variants have their own soc specific clocks that needs to be
> enabled for MI2S audio support. Added a common variable in drvdata to
> initialize such clocks using bulk clk api. Such clock names is
> defined in variants specific data and needs to fetched during init.
>
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/qcom/lpass-apq8016.c | 39 +++++++++++++++++++--------------------
>   sound/soc/qcom/lpass.h         | 10 +++++++---
>   2 files changed, 26 insertions(+), 23 deletions(-)
>
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index b3610d0..8210e37 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -161,32 +161,27 @@ static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
>   static int apq8016_lpass_init(struct platform_device *pdev)
>   {
>   	struct lpass_data *drvdata = platform_get_drvdata(pdev);
> +	struct lpass_variant *variant = drvdata->variant;
>   	struct device *dev = &pdev->dev;
> -	int ret;
> +	int ret, i;
>   
> -	drvdata->pcnoc_mport_clk = devm_clk_get(dev, "pcnoc-mport-clk");
> -	if (IS_ERR(drvdata->pcnoc_mport_clk)) {
> -		dev_err(dev, "error getting pcnoc-mport-clk: %ld\n",
> -			PTR_ERR(drvdata->pcnoc_mport_clk));
> -		return PTR_ERR(drvdata->pcnoc_mport_clk);
> -	}
>   
> -	ret = clk_prepare_enable(drvdata->pcnoc_mport_clk);
> +	drvdata->clks = devm_kcalloc(dev, variant->num_clks,
> +				     sizeof(*drvdata->clks), GFP_KERNEL);
> +	drvdata->num_clks = variant->num_clks;
> +
> +	for (i = 0; i < drvdata->num_clks; i++)
> +		drvdata->clks[i].id = variant->clk_name[i];
> +
> +	ret = devm_clk_bulk_get(dev, drvdata->num_clks, drvdata->clks);
>   	if (ret) {
> -		dev_err(dev, "Error enabling pcnoc-mport-clk: %d\n", ret);
> +		dev_err(dev, "Failed to get clocks %d\n", ret);
>   		return ret;
>   	}
>   
> -	drvdata->pcnoc_sway_clk = devm_clk_get(dev, "pcnoc-sway-clk");
> -	if (IS_ERR(drvdata->pcnoc_sway_clk)) {
> -		dev_err(dev, "error getting pcnoc-sway-clk: %ld\n",
> -			PTR_ERR(drvdata->pcnoc_sway_clk));
> -		return PTR_ERR(drvdata->pcnoc_sway_clk);
> -	}
> -
> -	ret = clk_prepare_enable(drvdata->pcnoc_sway_clk);
> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
>   	if (ret) {
> -		dev_err(dev, "Error enabling pcnoc_sway_clk: %d\n", ret);
> +		dev_err(dev, "apq8016 clk_enable failed\n");
>   		return ret;
>   	}
>   
> @@ -197,8 +192,7 @@ static int apq8016_lpass_exit(struct platform_device *pdev)
>   {
>   	struct lpass_data *drvdata = platform_get_drvdata(pdev);
>   
> -	clk_disable_unprepare(drvdata->pcnoc_mport_clk);
> -	clk_disable_unprepare(drvdata->pcnoc_sway_clk);
> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
>   
>   	return 0;
>   }
> @@ -219,6 +213,11 @@ static struct lpass_variant apq8016_data = {
>   	.wrdma_reg_stride	= 0x1000,
>   	.wrdma_channel_start	= 5,
>   	.wrdma_channels		= 2,
> +	.clk_name		= (const char*[]) {
> +				   "pcnoc-mport-clk",
> +				   "pcnoc-sway-clk",
> +				  },
> +	.num_clks		= 2,
>   	.dai_driver		= apq8016_lpass_cpu_dai_driver,
>   	.num_dai		= ARRAY_SIZE(apq8016_lpass_cpu_dai_driver),
>   	.dai_osr_clk_names	= (const char *[]) {
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index bd19ec5..450020e 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -51,9 +51,9 @@ struct lpass_data {
>   	/* used it for handling interrupt per dma channel */
>   	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
>   
> -	/* 8016 specific */
> -	struct clk *pcnoc_mport_clk;
> -	struct clk *pcnoc_sway_clk;
> +	/* SOC specific clock list */
> +	struct clk_bulk_data *clks;
> +	int num_clks;
>   
>   };
>   
> @@ -89,6 +89,10 @@ struct lpass_variant {
>   	int num_dai;
>   	const char * const *dai_osr_clk_names;
>   	const char * const *dai_bit_clk_names;
> +
> +	/* SOC specific clocks configuration */
> +	const char **clk_name;
> +	int num_clks;
>   };
>   
>   /* register the platform driver from the CPU DAI driver */

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

