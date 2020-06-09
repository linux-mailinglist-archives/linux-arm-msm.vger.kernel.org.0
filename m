Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8535F1F36E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 11:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgFIJTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 05:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728046AbgFIJTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 05:19:12 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B24C05BD1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 02:19:11 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u26so1832698wmn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ko4rWFPKDMe9rc0tjCCVIFJ0/oRc6Xoz+JGznJVz9As=;
        b=cwmwR8pFJNPO/s+xuUdBe3R/cGlqjbjbVX2WTV/qQlgEReaIgTg74bGHiy4T3GDO0O
         g6AKozrOCJ897X9T0hgvE3ePWOzC1oYtXUYKp5lKYAOK9tGBSl4OQUtsDBNzSwgRE/K1
         1v0KpqayuRzIeCoRWUn2jfJi1FvqYuDoKaTMzxwZIsJZUKyr1mXLsPpAOi0oj/HOXBTK
         AFm5B6nDhWfj+b/tg/JgXHse3ELfMRlcICQQekcyPmdwsYF4hj8UOCjceJqdoZy1rczy
         GiKwAqd4q1wcGuC59KWqkjqwFW95/+XLSi7uH8KkyJ69F2otS77ZRz4p9isDOFNo+887
         p8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ko4rWFPKDMe9rc0tjCCVIFJ0/oRc6Xoz+JGznJVz9As=;
        b=oOg7023qIKwyJolfqDMXl+rYTwadsxpmY5RlwunVf7/yt+GLvfX+sOCcdUllz5Lh2b
         oYb1QS6D3jrg3s1Ge6owpoY6RFziBJ2cugpcZJyQIMvBUmKuBbAdkxt/wiZRO4bkYFMw
         9m4mEGkgVd7jMcqpLDA7Vz2tsVKqhBfOaqEbCIUReJ058oyTSyWa/eGklBg4+72sTjX8
         KMIHlNIip60HJpxdoc9mKOFakCIPnWgsgGxYX/CMrPBHz80QSnSbefGx7YOXK1cQnznG
         cfRYeimsSDAk+9iPPaxZAKDKI4xovanLBD3EPWIhE3yCHM0eI3H4cmy5D7CRitcpWYg8
         y3wg==
X-Gm-Message-State: AOAM531k+B7TshJyMeARLSC5hV3zCZ8grxptm8eqyXxj3LYBfGGSkl3l
        masqZgQzFKff3u2hyhOs5VhRQx+Drso=
X-Google-Smtp-Source: ABdhPJz3Xhm/8ebZUCwc0O/JZNLdi/Hf9aVcvXm4x0C3TkYb3KVcUyQvrnW9jyXT9rNVuhTdML0k9w==
X-Received: by 2002:a1c:60d6:: with SMTP id u205mr3180926wmb.163.1591694349961;
        Tue, 09 Jun 2020 02:19:09 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id r5sm2786439wrq.0.2020.06.09.02.19.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 02:19:09 -0700 (PDT)
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
To:     Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-3-jonathan@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1b29db61-2394-8f88-9ebb-219568fb9306@linaro.org>
Date:   Tue, 9 Jun 2020 10:19:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200608204347.19685-3-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/06/2020 21:43, Jonathan Marek wrote:
> Adds support for qcom soundwire devices with memory mapped IO registers.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

In general patch itself looks pretty trivial, but I would like to see 
what 1.5.1 controller provides in terms of error reporting of SoundWire 
slave register reads/writes. On WCD based controller we did not have a 
mechanism to report things like if the read is ignored or not. I was 
hoping that this version of controller would be able to report that.

I will be nice to those patches if that is something which is supported 
in this version.

--srini

>   drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f38d1fd3679f..628747df1c75 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -90,6 +90,7 @@ struct qcom_swrm_ctrl {
>   	struct sdw_bus bus;
>   	struct device *dev;
>   	struct regmap *regmap;
> +	void __iomem *mmio;
>   	struct completion *comp;
>   	struct work_struct slave_work;
>   	/* read/write lock */
> @@ -154,6 +155,20 @@ static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
>   	return SDW_CMD_OK;
>   }
>   
> +static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> +				  u32 *val)
> +{
> +	*val = readl(ctrl->mmio + reg);
> +	return SDW_CMD_OK;
> +}
> +
> +static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
> +				   int val)
> +{
> +	writel(val, ctrl->mmio + reg);
> +	return SDW_CMD_OK;
> +}
> +
>   static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
>   				     u8 dev_addr, u16 reg_addr)
>   {
> @@ -746,6 +761,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	struct sdw_master_prop *prop;
>   	struct sdw_bus_params *params;
>   	struct qcom_swrm_ctrl *ctrl;
> +	struct resource *res;
>   	int ret;
>   	u32 val;
>   
> @@ -760,8 +776,13 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   		if (!ctrl->regmap)
>   			return -EINVAL;
>   	} else {
> -		/* Only WCD based SoundWire controller is supported */
> -		return -ENOTSUPP;
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +		ctrl->reg_read = qcom_swrm_cpu_reg_read;
> +		ctrl->reg_write = qcom_swrm_cpu_reg_write;
> +		ctrl->mmio = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(ctrl->mmio))
> +			return PTR_ERR(ctrl->mmio);
>   	}
>   
>   	ctrl->irq = of_irq_get(dev->of_node, 0);
> 
